<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="流水号" prop="serialNo">
        <el-input
          v-model="queryParams.serialNo"
          placeholder="请输入流水号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="领料单号" prop="materialApplyNo">
        <el-input
          v-model="queryParams.materialApplyNo"
          placeholder="请输入领料单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物料名称" prop="materialName">
        <el-input
          v-model="queryParams.materialName"
          placeholder="请输入物料名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检验人" prop="inspector">
        <el-input
          v-model="queryParams.inspector"
          placeholder="请输入检验人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检验时间">
        <el-date-picker
          v-model="dateRangeInspectionDate"
          style="width: 207.22px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 按钮区 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['mes:incomingInspection:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['mes:incomingInspection:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="incomingInspectionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="inspectionId" width="60" />
      <el-table-column label="流水号" align="center" prop="serialNo" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="领料单号" align="center" prop="materialApplyNo" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="物料名称" align="center" prop="materialName" width="110" :show-overflow-tooltip="true" />
      <el-table-column label="规格" align="center" prop="productSpec" width="100" :show-overflow-tooltip="true" />
      <el-table-column label="型号" align="center" prop="productModel" width="100" />
      <el-table-column label="单位" align="center" prop="unit" width="60" />
      <el-table-column label="需求数量" align="center" prop="requiredQuantity" width="80" />
      <el-table-column label="已领数量" align="center" prop="receivedQuantity" width="80" />
      <el-table-column label="抽检数量" align="center" prop="sampleQuantity" width="80" />
      <el-table-column label="检验项" align="center" prop="inspectionItem" width="90" :show-overflow-tooltip="true" />
      <el-table-column label="标准值上限" align="center" prop="standardUpper" width="90" />
      <el-table-column label="标准值下限" align="center" prop="standardLower" width="90" />
      <el-table-column label="检验值" align="center" prop="testValue" width="80" />
      <el-table-column label="检验结果" align="center" prop="testResult" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mes_test_result" :value="scope.row.testResult"/>
        </template>
      </el-table-column>
      <el-table-column label="检验人" align="center" prop="inspector" width="80" />
      <el-table-column label="检验时间" align="center" prop="inspectionDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.inspectionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="150">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['mes:incomingInspection:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['mes:incomingInspection:remove']"
          >删除</el-button>
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

    <!-- 新增/修改弹窗 -->
    <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="110px">
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="领料单号" prop="materialApplyNo">
              <el-input v-model="form.materialApplyNo" placeholder="请选择领料单" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectMaterialApply">选择</el-button>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="物料名称" prop="materialName">
              <el-input v-model="form.materialName" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="抽检数量" prop="sampleQuantity">
              <el-input-number v-model="form.sampleQuantity" :min="1" placeholder="请输入" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="规格">
              <el-input v-model="form.productSpec" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="型号">
              <el-input v-model="form.productModel" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="单位">
              <el-input v-model="form.unit" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="需求数量">
              <el-input-number v-model="form.requiredQuantity" :min="0" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="已领数量">
              <el-input-number v-model="form.receivedQuantity" :min="0" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="检验值" prop="testValue">
              <el-input-number v-model="form.testValue" :precision="2" :step="0.1" placeholder="请输入" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="检验结果" prop="testResult">
              <el-select v-model="form.testResult" placeholder="请选择检验结果" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.mes_test_result"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="检验人" prop="inspector">
              <el-input v-model="form.inspector" placeholder="请输入检验人" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="检验时间" prop="inspectionDate">
              <el-date-picker
                v-model="form.inspectionDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择检验时间"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择领料单弹窗 -->
    <el-dialog title="选择领料单" :visible.sync="materialApplyOpen" width="900px" append-to-body>
      <el-form :model="materialApplyQueryParams" ref="materialApplyQueryForm" size="small" :inline="true" label-width="90px">
        <el-form-item label="领料单号" prop="applyNo">
          <el-input
            v-model="materialApplyQueryParams.applyNo"
            placeholder="请输入领料单号"
            clearable
            size="small"
            @keyup.enter.native="handleMaterialApplySearch"
          />
        </el-form-item>
        <el-form-item label="产品名称" prop="productName">
          <el-input
            v-model="materialApplyQueryParams.productName"
            placeholder="请输入产品名称"
            clearable
            size="small"
            @keyup.enter.native="handleMaterialApplySearch"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleMaterialApplySearch">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetMaterialApplyQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table
        v-loading="materialApplyLoading"
        :data="materialApplyList"
        highlight-current-row
        @current-change="handleMaterialApplyCurrentChange"
        height="350"
      >
        <el-table-column label="领料单号" align="center" prop="applyNo" width="140" />
        <el-table-column label="生产计划" align="center" prop="productionPlanCode" width="130" />
        <el-table-column label="计划排产" align="center" prop="schedulingCode" width="130" />
        <el-table-column label="产品名称" align="center" prop="productName" width="120" :show-overflow-tooltip="true" />
        <el-table-column label="型号" align="center" prop="productModel" width="100" />
        <el-table-column label="规格" align="center" prop="productSpec" width="120" :show-overflow-tooltip="true" />
        <el-table-column label="单位" align="center" prop="productUnit" width="60" />
        <el-table-column label="待产数量" align="center" prop="pendingQuantity" width="80" />
      </el-table>
      <pagination
        v-show="materialApplyTotal>0"
        :total="materialApplyTotal"
        :page.sync="materialApplyQueryParams.pageNum"
        :limit.sync="materialApplyQueryParams.pageSize"
        @pagination="getMaterialApplyList"
      />
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmMaterialApply">确 定</el-button>
        <el-button @click="materialApplyOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listIncomingInspection, getIncomingInspection, addIncomingInspection, updateIncomingInspection, delIncomingInspection } from "@/api/mes/incomingInspection";
import { listMaterialApply } from "@/api/mes/materialApply";

export default {
  name: "IncomingInspection",
  dicts: ['mes_test_result'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 来料检验表格数据
      incomingInspectionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 检验时间范围
      dateRangeInspectionDate: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        serialNo: null,
        materialApplyNo: null,
        materialName: null,
        inspector: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        materialApplyNo: [
          { required: true, message: "领料单号不能为空", trigger: "change" }
        ],
        sampleQuantity: [
          { required: true, message: "抽检数量不能为空", trigger: "blur" }
        ],
        testValue: [
          { required: true, message: "检验值不能为空", trigger: "blur" }
        ],
        testResult: [
          { required: true, message: "检验结果不能为空", trigger: "change" }
        ]
      },
      // ===== 领料单选择弹窗相关 =====
      materialApplyOpen: false,
      materialApplyLoading: false,
      materialApplyList: [],
      materialApplyTotal: 0,
      materialApplyQueryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: null,
        productName: null
      },
      selectedMaterialApply: null
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询来料检验列表 */
    getList() {
      this.loading = true;
      const params = this.addDateRange(this.queryParams, this.dateRangeInspectionDate, 'InspectionDate');
      listIncomingInspection(params).then(response => {
        this.incomingInspectionList = response.rows;
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
      this.dateRangeInspectionDate = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.inspectionId);
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增来料检验";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const inspectionId = row.inspectionId || this.ids[0];
      getIncomingInspection(inspectionId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改来料检验";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.inspectionId != null) {
            updateIncomingInspection(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addIncomingInspection(this.form).then(response => {
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
      const inspectionIds = row.inspectionId || this.ids;
      this.$modal.confirm('是否确认删除来料检验编号为"' + inspectionIds + '"的数据项？').then(() => {
        return delIncomingInspection(inspectionIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    // 表单重置
    reset() {
      this.form = {
        inspectionId: null,
        serialNo: null,
        materialApplyNo: null,
        materialName: null,
        productSpec: null,
        productModel: null,
        unit: null,
        requiredQuantity: null,
        receivedQuantity: null,
        sampleQuantity: null,
        inspectionItem: null,
        standardUpper: null,
        standardLower: null,
        testValue: null,
        testResult: null,
        inspector: null,
        inspectionDate: null,
        remark: null
      };
      this.resetForm("form");
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // ===== 领料单选择相关方法 =====
    /** 打开领料单选择弹窗 */
    handleSelectMaterialApply() {
      this.materialApplyOpen = true;
      this.selectedMaterialApply = null;
      this.materialApplyQueryParams.pageNum = 1;
      this.materialApplyQueryParams.applyNo = null;
      this.materialApplyQueryParams.productName = null;
      this.getMaterialApplyList();
    },
    /** 查询领料单列表 */
    getMaterialApplyList() {
      this.materialApplyLoading = true;
      listMaterialApply(this.materialApplyQueryParams).then(response => {
        this.materialApplyList = response.rows;
        this.materialApplyTotal = response.total;
        this.materialApplyLoading = false;
      });
    },
    /** 领料单搜索 */
    handleMaterialApplySearch() {
      this.materialApplyQueryParams.pageNum = 1;
      this.getMaterialApplyList();
    },
    /** 领料单搜索重置 */
    resetMaterialApplyQuery() {
      this.materialApplyQueryParams.pageNum = 1;
      this.materialApplyQueryParams.applyNo = null;
      this.materialApplyQueryParams.productName = null;
      this.getMaterialApplyList();
    },
    /** 领料单列表行选中 */
    handleMaterialApplyCurrentChange(val) {
      this.selectedMaterialApply = val;
    },
    /** 确认选择领料单 */
    confirmMaterialApply() {
      if (!this.selectedMaterialApply) {
        this.$modal.msgWarning("请选择一条领料单记录");
        return;
      }
      this.form.materialApplyNo = this.selectedMaterialApply.applyNo;
      this.form.materialName = this.selectedMaterialApply.productName;
      this.form.productSpec = this.selectedMaterialApply.productSpec;
      this.form.productModel = this.selectedMaterialApply.productModel;
      this.form.unit = this.selectedMaterialApply.productUnit;
      this.form.requiredQuantity = this.selectedMaterialApply.pendingQuantity;
      this.materialApplyOpen = false;
    }
  }
};
</script>
