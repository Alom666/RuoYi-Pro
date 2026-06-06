<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="申请单号" prop="applyNo">
        <el-input v-model="queryParams.applyNo" placeholder="请输入申请单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="关联单据号" prop="relatedNo">
        <el-input v-model="queryParams.relatedNo" placeholder="请输入关联单据号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="业务类型" prop="businessType">
        <el-select v-model="queryParams.businessType" placeholder="请选择业务类型" clearable>
          <el-option v-for="dict in wms_business_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="供应商" prop="supplierName">
        <el-input v-model="queryParams.supplierName" placeholder="请输入供应商" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="合同号" prop="contractNo">
        <el-input v-model="queryParams.contractNo" placeholder="请输入合同号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="合同类型" prop="contractType">
        <el-select v-model="queryParams.contractType" placeholder="请选择合同类型" clearable>
          <el-option v-for="dict in wms_contract_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-input v-model="queryParams.applicant" placeholder="请输入申请人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="申请日期">
        <el-date-picker
          v-model="daterangeApplyDate"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        />
      </el-form-item>
      <el-form-item label="申请状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择申请状态" clearable>
          <el-option v-for="dict in wms_apply_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="审核人" prop="auditor">
        <el-input v-model="queryParams.auditor" placeholder="请输入审核人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="审核日期">
        <el-date-picker
          v-model="daterangeAuditDate"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        />
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态" clearable>
          <el-option v-for="dict in wms_audit_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" @click="handleAdd" v-hasPermi="['wms:inboundApply:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['wms:inboundApply:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="inboundApplyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="applyId" width="70" />
      <el-table-column label="申请单号" align="center" prop="applyNo" width="140" :show-overflow-tooltip="true" />
      <el-table-column label="关联单据号" align="center" prop="relatedNo" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="业务类型" align="center" prop="businessType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="wms_business_type" :value="scope.row.businessType" />
        </template>
      </el-table-column>
      <el-table-column label="供应商" align="center" prop="supplierName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="合同号" align="center" prop="contractNo" width="120" :show-overflow-tooltip="true" />
      <el-table-column label="合同类型" align="center" prop="contractType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="wms_contract_type" :value="scope.row.contractType" />
        </template>
      </el-table-column>
      <el-table-column label="申请类型" align="center" prop="applyType" width="100" />
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
      <el-table-column label="操作" align="center" width="100" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-view" @click="handleDetail(scope.row)" v-hasPermi="['wms:inboundApply:query']">详细</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 新增/修改入库申请对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="inboundApplyRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="申请单号" prop="applyNo">
          <el-input v-model="form.applyNo" placeholder="请输入申请单号" />
        </el-form-item>
        <el-form-item label="关联单据号" prop="relatedNo">
          <el-input v-model="form.relatedNo" placeholder="请输入关联单据号" />
        </el-form-item>
        <el-form-item label="业务类型" prop="businessType">
          <el-select v-model="form.businessType" placeholder="请选择业务类型">
            <el-option v-for="dict in wms_business_type" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="供应商" prop="supplierName">
          <el-input v-model="form.supplierName" placeholder="请输入供应商" />
        </el-form-item>
        <el-form-item label="合同号" prop="contractNo">
          <el-input v-model="form.contractNo" placeholder="请输入合同号" />
        </el-form-item>
        <el-form-item label="合同类型" prop="contractType">
          <el-select v-model="form.contractType" placeholder="请选择合同类型">
            <el-option v-for="dict in wms_contract_type" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="申请类型" prop="applyType">
          <el-input v-model="form.applyType" placeholder="请输入申请类型" />
        </el-form-item>
        <el-form-item label="申请人" prop="applicant">
          <el-input v-model="form.applicant" placeholder="请输入申请人" />
        </el-form-item>
        <el-form-item label="申请日期" prop="applyDate">
          <el-date-picker v-model="form.applyDate" value-format="yyyy-MM-dd" type="date" placeholder="选择申请日期" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 详细信息+审核对话框 -->
    <el-dialog title="入库申请详情" :visible.sync="detailOpen" width="700px" append-to-body>
      <el-descriptions :column="2" border>
        <el-descriptions-item label="申请单号">{{ detailForm.applyNo }}</el-descriptions-item>
        <el-descriptions-item label="关联单据号">{{ detailForm.relatedNo }}</el-descriptions-item>
        <el-descriptions-item label="业务类型">
          <dict-tag :options="wms_business_type" :value="detailForm.businessType" />
        </el-descriptions-item>
        <el-descriptions-item label="供应商">{{ detailForm.supplierName }}</el-descriptions-item>
        <el-descriptions-item label="合同号">{{ detailForm.contractNo }}</el-descriptions-item>
        <el-descriptions-item label="合同类型">
          <dict-tag :options="wms_contract_type" :value="detailForm.contractType" />
        </el-descriptions-item>
        <el-descriptions-item label="申请类型">{{ detailForm.applyType }}</el-descriptions-item>
        <el-descriptions-item label="申请人">{{ detailForm.applicant }}</el-descriptions-item>
        <el-descriptions-item label="申请日期">{{ parseTime(detailForm.applyDate, '{y}-{m}-{d}') }}</el-descriptions-item>
        <el-descriptions-item label="申请状态">
          <dict-tag :options="wms_apply_status" :value="detailForm.applyStatus" />
        </el-descriptions-item>
        <el-descriptions-item label="审核人">{{ detailForm.auditor }}</el-descriptions-item>
        <el-descriptions-item label="审核日期">{{ parseTime(detailForm.auditDate, '{y}-{m}-{d}') }}</el-descriptions-item>
        <el-descriptions-item label="审核状态">
          <dict-tag :options="wms_audit_status" :value="detailForm.auditStatus" />
        </el-descriptions-item>
        <el-descriptions-item label="备注" :span="2">{{ detailForm.remark }}</el-descriptions-item>
      </el-descriptions>
      <el-form ref="auditRef" :model="auditForm" label-width="100px" style="margin-top: 20px;">
        <el-form-item label="审核意见" prop="auditOpinion">
          <el-input v-model="auditForm.auditOpinion" type="textarea" :rows="3" placeholder="请输入审核意见" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="success" @click="handleAudit('0')" :disabled="detailForm.applyStatus !== '1'">通 过</el-button>
        <el-button type="danger" @click="handleAudit('1')" :disabled="detailForm.applyStatus !== '1'">驳 回</el-button>
        <el-button @click="detailOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInboundApply, getInboundApply, addInboundApply, updateInboundApply, delInboundApply } from "@/api/wms/inboundApply";

export default {
  name: "InboundApply",
  dicts: ['wms_business_type', 'wms_contract_type', 'wms_apply_status', 'wms_audit_status'],
  data() {
    return {
      inboundApplyList: [],
      open: false,
      detailOpen: false,
      loading: true,
      showSearch: true,
      ids: [],
      single: true,
      multiple: true,
      total: 0,
      title: "",
      daterangeApplyDate: [],
      daterangeAuditDate: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: undefined,
        relatedNo: undefined,
        businessType: undefined,
        supplierName: undefined,
        contractNo: undefined,
        contractType: undefined,
        applicant: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditStatus: undefined
      },
      rules: {
        applyNo: [{ required: true, message: "申请单号不能为空", trigger: "blur" }]
      },
      form: {},
      detailForm: {},
      auditForm: {
        applyId: undefined,
        auditOpinion: undefined
      }
    }
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询入库申请列表 */
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
      listInboundApply(params).then(response => {
        this.inboundApplyList = response.rows;
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
    /** 重置表单 */
    reset() {
      this.form = {
        applyId: undefined,
        applyNo: undefined,
        relatedNo: undefined,
        businessType: undefined,
        supplierName: undefined,
        contractNo: undefined,
        contractType: undefined,
        applyType: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: "0",
        remark: undefined
      };
      this.resetForm("inboundApplyRef");
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增入库申请";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["inboundApplyRef"].validate(valid => {
        if (valid) {
          if (this.form.applyId != undefined) {
            updateInboundApply(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInboundApply(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const applyIds = row.applyId || this.ids;
      this.$modal.confirm('是否确认删除入库申请编号为"' + applyIds + '"的数据项？').then(function() {
        return delInboundApply(applyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 详细按钮操作 */
    handleDetail(row) {
      getInboundApply(row.applyId).then(response => {
        this.detailForm = response.data;
        this.auditForm = {
          applyId: response.data.applyId,
          auditOpinion: response.data.auditOpinion
        };
        this.detailOpen = true;
      });
    },
    /** 审核操作 */
    handleAudit(auditStatus) {
      const data = {
        applyId: this.auditForm.applyId,
        auditStatus: auditStatus,
        auditOpinion: this.auditForm.auditOpinion,
        applyStatus: "2",
        auditor: undefined,
        auditDate: undefined
      };
      updateInboundApply(data).then(response => {
        this.$modal.msgSuccess(auditStatus === "0" ? "审核通过" : "审核驳回");
        this.detailOpen = false;
        this.getList();
      });
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    }
  }
}
</script>
