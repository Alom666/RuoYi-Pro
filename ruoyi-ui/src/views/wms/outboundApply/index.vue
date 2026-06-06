<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="单据号" prop="applyNo">
        <el-input v-model="queryParams.applyNo" placeholder="请输入单据号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="客户" prop="customerName">
        <el-input v-model="queryParams.customerName" placeholder="请输入客户" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-input v-model="queryParams.applicant" placeholder="请输入申请人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="申请日期">
        <el-date-picker v-model="daterangeApplyDate" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="审核人" prop="auditor">
        <el-input v-model="queryParams.auditor" placeholder="请输入审核人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="审核日期">
        <el-date-picker v-model="daterangeAuditDate" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="业务类型" prop="businessType">
        <el-select v-model="queryParams.businessType" placeholder="请选择业务类型" clearable>
          <el-option v-for="dict in wms_outbound_business_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="申请状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择申请状态" clearable>
          <el-option v-for="dict in wms_apply_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态" clearable>
          <el-option v-for="dict in wms_audit_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="单据状态" prop="docStatus">
        <el-select v-model="queryParams.docStatus" placeholder="请选择单据状态" clearable>
          <el-option v-for="dict in wms_doc_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" @click="handleAdd" v-hasPermi="['wms:outboundApply:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['wms:outboundApply:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="outboundApplyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="applyId" width="70" />
      <el-table-column label="单据号" align="center" prop="applyNo" width="140" :show-overflow-tooltip="true" />
      <el-table-column label="单据状态" align="center" prop="docStatus" width="100">
        <template slot-scope="scope">
          <dict-tag :options="wms_doc_status" :value="scope.row.docStatus" />
        </template>
      </el-table-column>
      <el-table-column label="业务类型" align="center" prop="businessType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="wms_outbound_business_type" :value="scope.row.businessType" />
        </template>
      </el-table-column>
      <el-table-column label="客户" align="center" prop="customerName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="申请人" align="center" prop="applicant" width="90" />
      <el-table-column label="申请日期" align="center" prop="applyDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applyDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请状态" align="center" prop="applyStatus" width="90">
        <template slot-scope="scope">
          <dict-tag :options="wms_apply_status" :value="scope.row.applyStatus" />
        </template>
      </el-table-column>
      <el-table-column label="审核人" align="center" prop="auditor" width="90" />
      <el-table-column label="审核日期" align="center" prop="auditDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="auditStatus" width="90">
        <template slot-scope="scope">
          <dict-tag :options="wms_audit_status" :value="scope.row.auditStatus" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="160" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['wms:outboundApply:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-if="scope.row.applyStatus === '0'" v-hasPermi="['wms:outboundApply:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 新增/修改出库申请对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-form ref="outboundApplyRef" :model="form" :rules="rules" label-width="100px" :disabled="formReadOnly">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="单据号" prop="applyNo">
              <el-input v-model="form.applyNo" placeholder="请输入单据号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="业务类型" prop="businessType">
              <el-select v-model="form.businessType" placeholder="请选择业务类型">
                <el-option v-for="dict in wms_outbound_business_type" :key="dict.value" :label="dict.label" :value="dict.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="客户" prop="customerName">
              <el-input v-model="form.customerName" placeholder="请输入客户" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人" prop="applicant">
              <el-input v-model="form.applicant" placeholder="请输入申请人" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="申请日期" prop="applyDate">
              <el-date-picker v-model="form.applyDate" value-format="yyyy-MM-dd" type="date" placeholder="选择申请日期" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>

        <!-- 明细表格 -->
        <el-divider content-position="left">出库明细</el-divider>
        <el-row :gutter="10" class="mb8" v-if="!formReadOnly">
          <el-col :span="1.5">
            <el-button type="primary" plain icon="el-icon-plus" size="small" @click="handleAddDetail">添加物料</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" plain icon="el-icon-delete" size="small" @click="handleDeleteDetail">删除物料</el-button>
          </el-col>
        </el-row>
        <el-table :data="form.detailList" @selection-change="handleDetailSelectionChange" border style="width: 100%">
          <el-table-column type="selection" width="50" align="center" v-if="!formReadOnly" />
          <el-table-column label="序号" align="center" width="60">
            <template slot-scope="scope">
              <span>{{ scope.$index + 1 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="物料名称" align="center" min-width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.materialName" placeholder="物料名称" :disabled="formReadOnly" />
            </template>
          </el-table-column>
          <el-table-column label="产品型号" align="center" min-width="120">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productModel" placeholder="产品型号" :disabled="formReadOnly" />
            </template>
          </el-table-column>
          <el-table-column label="产品规格" align="center" min-width="120">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productSpec" placeholder="产品规格" :disabled="formReadOnly" />
            </template>
          </el-table-column>
          <el-table-column label="单位" align="center" width="80">
            <template slot-scope="scope">
              <el-input v-model="scope.row.unit" placeholder="单位" :disabled="formReadOnly" />
            </template>
          </el-table-column>
          <el-table-column label="出库数量" align="center" width="120">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.outboundQuantity" :min="1" controls-position="right" :disabled="formReadOnly" style="width: 100%" />
            </template>
          </el-table-column>
          <el-table-column label="备注" align="center" min-width="120">
            <template slot-scope="scope">
              <el-input v-model="scope.row.remark" placeholder="备注" :disabled="formReadOnly" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleSave" v-if="!formReadOnly">保 存</el-button>
        <el-button type="success" @click="handleSubmit" v-if="!formReadOnly">提 交</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOutboundApply, getOutboundApply, addOutboundApply, updateOutboundApply, submitOutboundApply, delOutboundApply } from "@/api/wms/outboundApply";

export default {
  name: "OutboundApply",
  dicts: ['wms_outbound_business_type', 'wms_apply_status', 'wms_audit_status', 'wms_doc_status'],
  data() {
    return {
      outboundApplyList: [],
      open: false,
      loading: true,
      showSearch: true,
      ids: [],
      single: true,
      multiple: true,
      total: 0,
      title: "",
      formReadOnly: false,
      daterangeApplyDate: [],
      daterangeAuditDate: [],
      detailIds: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: undefined,
        businessType: undefined,
        customerName: undefined,
        applicant: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditStatus: undefined,
        docStatus: undefined
      },
      rules: {
        applyNo: [{ required: true, message: "单据号不能为空", trigger: "blur" }],
        businessType: [{ required: true, message: "业务类型不能为空", trigger: "change" }]
      },
      form: {}
    }
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询出库申请列表 */
    getList() {
      this.loading = true;
      const params = { ...this.queryParams };
      if (this.daterangeApplyDate && this.daterangeApplyDate.length === 2) {
        params.params = params.params || {};
        params.params.beginApplyDate = this.daterangeApplyDate[0];
        params.params.endApplyDate = this.daterangeApplyDate[1];
      }
      if (this.daterangeAuditDate && this.daterangeAuditDate.length === 2) {
        params.params = params.params || {};
        params.params.beginAuditDate = this.daterangeAuditDate[0];
        params.params.endAuditDate = this.daterangeAuditDate[1];
      }
      listOutboundApply(params).then(response => {
        this.outboundApplyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeApplyDate = [];
      this.daterangeAuditDate = [];
      this.resetForm("queryRef");
      this.handleQuery();
    },
    /** 多选框选中数据 */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.applyId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 明细多选框选中数据 */
    handleDetailSelectionChange(selection) {
      this.detailIds = selection.map(item => item.detailId);
    },
    /** 重置表单 */
    reset() {
      this.form = {
        applyId: undefined,
        applyNo: undefined,
        businessType: undefined,
        customerName: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: "0",
        docStatus: "0",
        remark: undefined,
        detailList: []
      };
      this.formReadOnly = false;
      this.resetForm("outboundApplyRef");
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增出库申请";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const applyId = row.applyId || this.ids[0];
      getOutboundApply(applyId).then(response => {
        this.form = response.data;
        if (!this.form.detailList) {
          this.form.detailList = [];
        }
        // 待审核或已审核只读
        if (this.form.applyStatus === '1' || this.form.applyStatus === '2') {
          this.formReadOnly = true;
          this.title = "查看出库申请";
        } else {
          this.formReadOnly = false;
          this.title = "修改出库申请";
        }
        this.open = true;
      });
    },
    /** 添加明细行 */
    handleAddDetail() {
      this.form.detailList.push({
        detailId: undefined,
        applyId: this.form.applyId,
        seqNo: this.form.detailList.length + 1,
        materialId: undefined,
        materialName: undefined,
        productModel: undefined,
        productSpec: undefined,
        unit: undefined,
        outboundQuantity: 1,
        remark: undefined
      });
    },
    /** 删除明细行 */
    handleDeleteDetail() {
      if (this.detailIds.length === 0) {
        this.$modal.msgWarning("请选择要删除的物料行");
        return;
      }
      this.form.detailList = this.form.detailList.filter(item => !this.detailIds.includes(item.detailId));
      this.detailIds = [];
    },
    /** 保存操作（申请状态=0） */
    handleSave() {
      this.$refs["outboundApplyRef"].validate(valid => {
        if (valid) {
          this.form.applyStatus = "0";
          if (this.form.applyId != undefined) {
            updateOutboundApply(this.form).then(response => {
              this.$modal.msgSuccess("保存成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOutboundApply(this.form).then(response => {
              this.$modal.msgSuccess("保存成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 提交操作（申请状态=1） */
    handleSubmit() {
      this.$refs["outboundApplyRef"].validate(valid => {
        if (valid) {
          if (this.form.applyId != undefined) {
            // 先保存再提交
            this.form.applyStatus = "0";
            updateOutboundApply(this.form).then(() => {
              submitOutboundApply(this.form.applyId).then(() => {
                this.$modal.msgSuccess("提交成功");
                this.open = false;
                this.getList();
              });
            });
          } else {
            // 新增后提交
            this.form.applyStatus = "0";
            addOutboundApply(this.form).then(response => {
              submitOutboundApply(response.data).then(() => {
                this.$modal.msgSuccess("提交成功");
                this.open = false;
                this.getList();
              });
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const applyIds = row.applyId || this.ids;
      this.$modal.confirm('是否确认删除出库申请编号为"' + applyIds + '"的数据项？').then(function() {
        return delOutboundApply(applyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    }
  }
}
</script>
