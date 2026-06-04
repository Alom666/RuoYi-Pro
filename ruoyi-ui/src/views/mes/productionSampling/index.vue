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
      <el-form-item label="计划编号" prop="planNo">
        <el-input
          v-model="queryParams.planNo"
          placeholder="请输入计划编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作业名称" prop="homeworkName">
        <el-input
          v-model="queryParams.homeworkName"
          placeholder="请输入作业名称"
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
      <el-form-item label="检验项" prop="inspectionItem">
        <el-input
          v-model="queryParams.inspectionItem"
          placeholder="请输入检验项"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检验结果" prop="testResult">
        <el-select v-model="queryParams.testResult" placeholder="请选择检验结果" clearable>
          <el-option
            v-for="dict in dict.type.mes_test_result"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['mes:productionSampling:add']"
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
          v-hasPermi="['mes:productionSampling:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="productionSamplingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="samplingId" width="60" />
      <el-table-column label="流水号" align="center" prop="serialNo" width="150" :show-overflow-tooltip="true" />
      <el-table-column label="计划编号" align="center" prop="planNo" width="120" :show-overflow-tooltip="true" />
      <el-table-column label="作业名称" align="center" prop="homeworkName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="物料名称" align="center" prop="materialName" width="110" :show-overflow-tooltip="true" />
      <el-table-column label="规格" align="center" prop="productSpec" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="型号" align="center" prop="productModel" width="100" />
      <el-table-column label="单位" align="center" prop="unit" width="60" />
      <el-table-column label="检验项" align="center" prop="inspectionItem" width="90" />
      <el-table-column label="生产数量" align="center" prop="productionQuantity" width="80" />
      <el-table-column label="采样数量" align="center" prop="samplingQuantity" width="80" />
      <el-table-column label="检验值" align="center" prop="testValue" width="80" />
      <el-table-column label="阈值上限" align="center" prop="thresholdUpper" width="80" />
      <el-table-column label="阈值下限" align="center" prop="thresholdLower" width="80" />
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
            v-hasPermi="['mes:productionSampling:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['mes:productionSampling:remove']"
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
            <el-form-item label="作业名称" prop="homeworkName">
              <el-input v-model="form.homeworkName" placeholder="请选择作业" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectHomework">选择</el-button>
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
            <el-form-item label="采样数量" prop="samplingQuantity">
              <el-input-number v-model="form.samplingQuantity" :min="1" placeholder="请输入" style="width: 100%" />
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
          <el-col :span="24">
            <el-form-item label="检验标准" prop="inspectionItem">
              <el-input v-model="form.inspectionItem" placeholder="请选择检验标准" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectStandard">选择</el-button>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="阈值上限">
              <el-input-number v-model="form.thresholdUpper" :precision="2" :step="0.1" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="阈值下限">
              <el-input-number v-model="form.thresholdLower" :precision="2" :step="0.1" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="生产数量">
              <el-input-number v-model="form.productionQuantity" :min="0" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="检验值" prop="testValue">
              <el-input-number v-model="form.testValue" :precision="2" :step="0.1" placeholder="请输入" style="width: 100%" />
            </el-form-item>
          </el-col>
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
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
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

    <!-- 选择生产作业弹窗 -->
    <el-dialog title="选择生产作业" :visible.sync="homeworkOpen" width="900px" append-to-body>
      <el-form :model="homeworkQueryParams" ref="homeworkQueryForm" size="small" :inline="true" label-width="90px">
        <el-form-item label="作业名称" prop="homeworkName">
          <el-input
            v-model="homeworkQueryParams.homeworkName"
            placeholder="请输入作业名称"
            clearable
            size="small"
            @keyup.enter.native="handleHomeworkSearch"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleHomeworkSearch">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetHomeworkQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table
        v-loading="homeworkLoading"
        :data="homeworkList"
        highlight-current-row
        @current-change="handleHomeworkCurrentChange"
        height="350"
      >
        <el-table-column label="作业名称" align="center" prop="homeworkName" :show-overflow-tooltip="true" />
        <el-table-column label="生产计划" align="center" prop="productionPlanCode" width="130" />
        <el-table-column label="计划排产" align="center" prop="schedulingCode" width="130" />
        <el-table-column label="产品名称" align="center" prop="productName" width="120" :show-overflow-tooltip="true" />
        <el-table-column label="型号" align="center" prop="productModel" width="100" />
        <el-table-column label="规格" align="center" prop="productSpec" width="120" :show-overflow-tooltip="true" />
        <el-table-column label="单位" align="center" prop="productUnit" width="60" />
        <el-table-column label="生产数量" align="center" prop="productionQuantity" width="80" />
      </el-table>
      <pagination
        v-show="homeworkTotal>0"
        :total="homeworkTotal"
        :page.sync="homeworkQueryParams.pageNum"
        :limit.sync="homeworkQueryParams.pageSize"
        @pagination="getHomeworkList"
      />
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmHomework">确 定</el-button>
        <el-button @click="homeworkOpen = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择检验标准弹窗 -->
    <el-dialog title="选择检验标准" :visible.sync="standardOpen" width="900px" append-to-body>
      <el-form :model="standardQueryParams" ref="standardQueryForm" size="small" :inline="true" label-width="90px">
        <el-form-item label="物料名称" prop="materialName">
          <el-input
            v-model="standardQueryParams.materialName"
            placeholder="请输入物料名称"
            clearable
            size="small"
            @keyup.enter.native="handleStandardSearch"
          />
        </el-form-item>
        <el-form-item label="检验项目" prop="inspectionItem">
          <el-input
            v-model="standardQueryParams.inspectionItem"
            placeholder="请输入检验项目"
            clearable
            size="small"
            @keyup.enter.native="handleStandardSearch"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleStandardSearch">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetStandardQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table
        v-loading="standardLoading"
        :data="standardList"
        highlight-current-row
        @current-change="handleStandardCurrentChange"
        height="350"
      >
        <el-table-column label="物料名称" align="center" prop="materialName" :show-overflow-tooltip="true" />
        <el-table-column label="检验项目" align="center" prop="inspectionItem" width="120" />
        <el-table-column label="检验类型" align="center" prop="inspectionType" width="100" />
        <el-table-column label="标准值上限" align="center" prop="standardUpper" width="110" />
        <el-table-column label="标准值下限" align="center" prop="standardLower" width="110" />
        <el-table-column label="型号" align="center" prop="productModel" width="100" />
        <el-table-column label="规格" align="center" prop="productSpec" width="130" :show-overflow-tooltip="true" />
        <el-table-column label="单位" align="center" prop="unit" width="60" />
      </el-table>
      <pagination
        v-show="standardTotal>0"
        :total="standardTotal"
        :page.sync="standardQueryParams.pageNum"
        :limit.sync="standardQueryParams.pageSize"
        @pagination="getStandardList"
      />
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmStandard">确 定</el-button>
        <el-button @click="standardOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listProductionSampling, getProductionSampling, addProductionSampling, updateProductionSampling, delProductionSampling } from "@/api/mes/productionSampling";
import { listHomeworkAssembly } from "@/api/mes/homeworkAssembly";
import { listQualityStandard } from "@/api/mes/qualityStandard";

export default {
  name: "ProductionSampling",
  dicts: ['mes_test_result'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 生产采样表格数据
      productionSamplingList: [],
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
        planNo: null,
        homeworkName: null,
        materialName: null,
        inspectionItem: null,
        testResult: null,
        inspector: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        homeworkName: [
          { required: true, message: "作业名称不能为空", trigger: "change" }
        ],
        materialName: [
          { required: true, message: "物料名称不能为空", trigger: "change" }
        ],
        samplingQuantity: [
          { required: true, message: "采样数量不能为空", trigger: "blur" }
        ],
        inspectionItem: [
          { required: true, message: "检验标准不能为空", trigger: "change" }
        ],
        testValue: [
          { required: true, message: "检验值不能为空", trigger: "blur" }
        ],
        testResult: [
          { required: true, message: "检验结果不能为空", trigger: "change" }
        ]
      },
      // ===== 生产作业选择弹窗相关 =====
      homeworkOpen: false,
      homeworkLoading: false,
      homeworkList: [],
      homeworkTotal: 0,
      homeworkQueryParams: {
        pageNum: 1,
        pageSize: 10,
        homeworkName: null
      },
      selectedHomework: null,
      // ===== 检验标准选择弹窗相关 =====
      standardOpen: false,
      standardLoading: false,
      standardList: [],
      standardTotal: 0,
      standardQueryParams: {
        pageNum: 1,
        pageSize: 10,
        materialName: null,
        inspectionItem: null
      },
      selectedStandard: null
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询生产采样列表 */
    getList() {
      this.loading = true;
      const params = this.addDateRange(this.queryParams, this.dateRangeInspectionDate, 'InspectionDate');
      listProductionSampling(params).then(response => {
        this.productionSamplingList = response.rows;
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
      this.ids = selection.map(item => item.samplingId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增生产采样";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const samplingId = row.samplingId || this.ids[0];
      getProductionSampling(samplingId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改生产采样";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.samplingId != null) {
            updateProductionSampling(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProductionSampling(this.form).then(response => {
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
      const samplingIds = row.samplingId || this.ids;
      this.$modal.confirm('是否确认删除生产采样编号为"' + samplingIds + '"的数据项？').then(() => {
        return delProductionSampling(samplingIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    // 表单重置
    reset() {
      this.form = {
        samplingId: null,
        serialNo: null,
        planNo: null,
        homeworkName: null,
        materialName: null,
        productSpec: null,
        productModel: null,
        unit: null,
        inspectionItem: null,
        productionQuantity: null,
        samplingQuantity: null,
        testValue: null,
        thresholdUpper: null,
        thresholdLower: null,
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
    // ===== 生产作业选择相关方法 =====
    /** 打开生产作业选择弹窗 */
    handleSelectHomework() {
      this.homeworkOpen = true;
      this.selectedHomework = null;
      this.homeworkQueryParams.pageNum = 1;
      this.homeworkQueryParams.homeworkName = null;
      this.getHomeworkList();
    },
    /** 查询生产作业列表 */
    getHomeworkList() {
      this.homeworkLoading = true;
      listHomeworkAssembly(this.homeworkQueryParams).then(response => {
        this.homeworkList = response.rows;
        this.homeworkTotal = response.total;
        this.homeworkLoading = false;
      });
    },
    /** 生产作业搜索 */
    handleHomeworkSearch() {
      this.homeworkQueryParams.pageNum = 1;
      this.getHomeworkList();
    },
    /** 生产作业搜索重置 */
    resetHomeworkQuery() {
      this.homeworkQueryParams.pageNum = 1;
      this.homeworkQueryParams.homeworkName = null;
      this.getHomeworkList();
    },
    /** 生产作业列表行选中 */
    handleHomeworkCurrentChange(val) {
      this.selectedHomework = val;
    },
    /** 确认选择生产作业 */
    confirmHomework() {
      if (!this.selectedHomework) {
        this.$modal.msgWarning("请选择一条生产作业记录");
        return;
      }
      this.form.homeworkName = this.selectedHomework.homeworkName;
      this.form.planNo = this.selectedHomework.productionPlanCode;
      this.form.materialName = this.selectedHomework.productName;
      this.form.productSpec = this.selectedHomework.productSpec;
      this.form.productModel = this.selectedHomework.productModel;
      this.form.unit = this.selectedHomework.productUnit;
      this.form.productionQuantity = this.selectedHomework.productionQuantity;
      this.homeworkOpen = false;
    },
    // ===== 检验标准选择相关方法 =====
    /** 打开检验标准选择弹窗 */
    handleSelectStandard() {
      this.standardOpen = true;
      this.selectedStandard = null;
      this.standardQueryParams.pageNum = 1;
      this.standardQueryParams.materialName = null;
      this.standardQueryParams.inspectionItem = null;
      this.getStandardList();
    },
    /** 查询检验标准列表 */
    getStandardList() {
      this.standardLoading = true;
      listQualityStandard(this.standardQueryParams).then(response => {
        this.standardList = response.rows;
        this.standardTotal = response.total;
        this.standardLoading = false;
      });
    },
    /** 检验标准搜索 */
    handleStandardSearch() {
      this.standardQueryParams.pageNum = 1;
      this.getStandardList();
    },
    /** 检验标准搜索重置 */
    resetStandardQuery() {
      this.standardQueryParams.pageNum = 1;
      this.standardQueryParams.materialName = null;
      this.standardQueryParams.inspectionItem = null;
      this.getStandardList();
    },
    /** 检验标准列表行选中 */
    handleStandardCurrentChange(val) {
      this.selectedStandard = val;
    },
    /** 确认选择检验标准 */
    confirmStandard() {
      if (!this.selectedStandard) {
        this.$modal.msgWarning("请选择一条检验标准记录");
        return;
      }
      this.form.inspectionItem = this.selectedStandard.inspectionItem;
      this.form.thresholdUpper = this.selectedStandard.standardUpper;
      this.form.thresholdLower = this.selectedStandard.standardLower;
      // 如果检验标准中有物料信息且当前表单物料为空，则回填
      if (!this.form.materialName && this.selectedStandard.materialName) {
        this.form.materialName = this.selectedStandard.materialName;
      }
      if (!this.form.productSpec && this.selectedStandard.productSpec) {
        this.form.productSpec = this.selectedStandard.productSpec;
      }
      if (!this.form.productModel && this.selectedStandard.productModel) {
        this.form.productModel = this.selectedStandard.productModel;
      }
      if (!this.form.unit && this.selectedStandard.unit) {
        this.form.unit = this.selectedStandard.unit;
      }
      this.standardOpen = false;
    }
  }
};
</script>
