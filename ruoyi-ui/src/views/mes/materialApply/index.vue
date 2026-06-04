<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="领料单号" prop="applyNo">
        <el-input
          v-model="queryParams.applyNo"
          placeholder="请输入领料单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="领取日期">
        <el-date-picker
          v-model="dateRangeReceiveDate"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="生产计划" prop="productionPlanCode">
        <el-input
          v-model="queryParams.productionPlanCode"
          placeholder="请输入生产计划编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="产品名称" prop="productName">
        <el-input
          v-model="queryParams.productName"
          placeholder="请输入产品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-select v-model="queryParams.applicant" placeholder="请选择申请人" clearable filterable>
          <el-option
            v-for="item in userList"
            :key="item.userId"
            :label="item.nickName"
            :value="item.nickName"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="申请状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择申请状态" clearable>
          <el-option
            v-for="dict in dict.type.mes_apply_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态" clearable>
          <el-option
            v-for="dict in dict.type.mes_audit_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['mes:materialApply:add']"
        >新建</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['mes:materialApply:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['mes:materialApply:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="materialApplyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="applyId" width="60" />
      <el-table-column label="领料单号" align="center" prop="applyNo" width="150" :show-overflow-tooltip="true" />
      <el-table-column label="生产计划" align="center" prop="productionPlanCode" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="产品" align="center" prop="productName" width="120" :show-overflow-tooltip="true" />
      <el-table-column label="型号" align="center" prop="productModel" width="100" />
      <el-table-column label="待产数量" align="center" prop="pendingQuantity" width="80" />
      <el-table-column label="领取日期" align="center" prop="receiveDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.receiveDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请人" align="center" prop="applicant" width="80" />
      <el-table-column label="申请状态" align="center" prop="applyStatus" width="90">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mes_apply_status" :value="scope.row.applyStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="auditStatus" width="90">
        <template slot-scope="scope">
          <dict-tag v-if="scope.row.auditStatus != null" :options="dict.type.mes_audit_status" :value="scope.row.auditStatus"/>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
          >查看</el-button>
          <el-button
            v-if="scope.row.applyStatus === '0'"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['mes:materialApply:edit']"
          >修改</el-button>
          <el-button
            v-if="scope.row.applyStatus === '1'"
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleAudit(scope.row)"
            v-hasPermi="['mes:materialApply:audit']"
          >审核</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['mes:materialApply:remove']"
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
    <el-dialog :title="title" :visible.sync="open" width="1100px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <!-- 上半部分：主表信息 -->
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="领料单号" prop="applyNo">
              <el-input v-model="form.applyNo" placeholder="自动生成" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="计划排产" prop="schedulingCode">
              <el-input v-model="form.schedulingCode" placeholder="请选择计划排产" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectPlan">选择</el-button>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="生产计划编号">
              <el-input v-model="form.productionPlanCode" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="产品">
              <el-input v-model="form.productName" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="型号">
              <el-input v-model="form.productModel" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="规格">
              <el-input v-model="form.productSpec" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="单位">
              <el-input v-model="form.productUnit" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="待产数量" prop="pendingQuantity">
              <el-input-number v-model="form.pendingQuantity" :min="1" placeholder="请输入待产数量" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="生产日期" prop="productionDate">
              <el-date-picker
                v-model="form.productionDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择生产日期"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="领取日期" prop="receiveDate">
              <el-date-picker
                v-model="form.receiveDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择领取日期"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="申请人" prop="applicant">
              <el-select v-model="form.applicant" placeholder="请选择申请人" clearable filterable style="width: 100%">
                <el-option
                  v-for="item in userList"
                  :key="item.userId"
                  :label="item.nickName"
                  :value="item.nickName"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="申请日期" prop="applyDate">
              <el-date-picker
                v-model="form.applyDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择申请日期"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="申请状态">
              <el-select v-model="form.applyStatus" placeholder="请选择申请状态" style="width: 100%" disabled>
                <el-option
                  v-for="dict in dict.type.mes_apply_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="备注">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>
        <!-- 审核信息：仅修改且已审核时显示 -->
        <template v-if="form.applyId != null && form.applyStatus === '2'">
          <el-divider content-position="left">审核信息</el-divider>
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="审核人">
                <el-input v-model="form.auditor" placeholder="审核后自动填入" readonly />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="审核日期">
                <el-input v-model="form.auditDate" placeholder="审核后自动填入" readonly />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="审核状态">
                <el-select v-model="form.auditStatus" placeholder="审核后显示" style="width: 100%" disabled>
                  <el-option
                    v-for="dict in dict.type.mes_audit_status"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-form-item label="审核意见">
                <el-input v-model="form.auditOpinion" type="textarea" :rows="2" placeholder="审核意见" readonly />
              </el-form-item>
            </el-col>
          </el-row>
        </template>

        <!-- 分割线 -->
        <el-divider content-position="left">领料申请明细信息</el-divider>

        <!-- 下半部分：子表明细 -->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAddDetail">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" plain icon="el-icon-delete" size="mini" @click="handleDeleteDetail">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="form.detailList" @selection-change="handleDetailSelectionChange" border style="width: 100%">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" type="index" width="60" align="center" />
          <el-table-column label="物料" align="center" min-width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.materialName" placeholder="请输入物料" size="small" />
            </template>
          </el-table-column>
          <el-table-column label="型号" align="center" min-width="120">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productModel" placeholder="请输入型号" size="small" />
            </template>
          </el-table-column>
          <el-table-column label="规格" align="center" min-width="120">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productSpec" placeholder="请输入规格" size="small" />
            </template>
          </el-table-column>
          <el-table-column label="单位" align="center" width="100">
            <template slot-scope="scope">
              <el-input v-model="scope.row.unit" placeholder="单位" size="small" />
            </template>
          </el-table-column>
          <el-table-column label="需求数量" align="center" width="120">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.requiredQuantity" :min="0" size="small" style="width: 100%" controls-position="right" />
            </template>
          </el-table-column>
          <el-table-column label="已领数量" align="center" width="120">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.receivedQuantity" :min="0" size="small" style="width: 100%" controls-position="right" />
            </template>
          </el-table-column>
          <el-table-column label="备注" align="center" min-width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.remark" placeholder="备注" size="small" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm('save')">保 存</el-button>
        <el-button type="warning" @click="submitForm('submit')">提 交</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择生产计划排产弹窗 -->
    <el-dialog title="选择生产计划排产" :visible.sync="openPlanSelect" width="800px" append-to-body>
      <el-table :data="planList" v-loading="planLoading">
        <el-table-column label="生产计划编号" align="center" prop="productionPlanCode" width="140" />
        <el-table-column label="计划排产编号" align="center" prop="schedulingCode" width="140" />
        <el-table-column label="产品名称" align="center" prop="productName" :show-overflow-tooltip="true" />
        <el-table-column label="型号" align="center" prop="productModel" width="100" />
        <el-table-column label="规格" align="center" prop="productSpec" width="100" />
        <el-table-column label="单位" align="center" prop="productUnit" width="60" />
        <el-table-column label="操作" align="center" width="80">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="confirmPlan(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openPlanSelect = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 审核弹窗 -->
    <el-dialog title="审核领料申请" :visible.sync="openAudit" width="500px" append-to-body>
      <el-form ref="auditForm" :model="auditForm" :rules="auditRules" label-width="100px">
        <el-form-item label="领料单号">
          <el-input v-model="auditForm.applyNo" readonly />
        </el-form-item>
        <el-form-item label="审核状态" prop="auditStatus">
          <el-radio-group v-model="auditForm.auditStatus">
            <el-radio label="0">通过</el-radio>
            <el-radio label="1">驳回</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核意见">
          <el-input v-model="auditForm.auditOpinion" type="textarea" :rows="4" placeholder="请输入审核意见" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAudit">确 定</el-button>
        <el-button @click="openAudit = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 查看详情弹窗 -->
    <el-dialog title="领料申请详情" :visible.sync="openView" width="1100px" append-to-body>
      <el-descriptions :column="3" border size="medium">
        <el-descriptions-item label="领料单号">{{ viewData.applyNo }}</el-descriptions-item>
        <el-descriptions-item label="生产计划编号">{{ viewData.productionPlanCode }}</el-descriptions-item>
        <el-descriptions-item label="计划排产编号">{{ viewData.schedulingCode }}</el-descriptions-item>
        <el-descriptions-item label="产品名称">{{ viewData.productName }}</el-descriptions-item>
        <el-descriptions-item label="型号">{{ viewData.productModel }}</el-descriptions-item>
        <el-descriptions-item label="规格">{{ viewData.productSpec }}</el-descriptions-item>
        <el-descriptions-item label="单位">{{ viewData.productUnit }}</el-descriptions-item>
        <el-descriptions-item label="待产数量">{{ viewData.pendingQuantity }}</el-descriptions-item>
        <el-descriptions-item label="生产日期">{{ parseTime(viewData.productionDate, '{y}-{m}-{d}') }}</el-descriptions-item>
        <el-descriptions-item label="领取日期">{{ parseTime(viewData.receiveDate, '{y}-{m}-{d}') }}</el-descriptions-item>
        <el-descriptions-item label="申请人">{{ viewData.applicant }}</el-descriptions-item>
        <el-descriptions-item label="申请日期">{{ parseTime(viewData.applyDate, '{y}-{m}-{d}') }}</el-descriptions-item>
        <el-descriptions-item label="申请状态">
          <dict-tag :options="dict.type.mes_apply_status" :value="viewData.applyStatus"/>
        </el-descriptions-item>
        <el-descriptions-item label="审核人">{{ viewData.auditor || '-' }}</el-descriptions-item>
        <el-descriptions-item label="审核日期">{{ parseTime(viewData.auditDate, '{y}-{m}-{d}') || '-' }}</el-descriptions-item>
        <el-descriptions-item label="审核状态">
          <dict-tag v-if="viewData.auditStatus != null" :options="dict.type.mes_audit_status" :value="viewData.auditStatus"/>
          <span v-else>-</span>
        </el-descriptions-item>
        <el-descriptions-item label="审核意见" :span="2">{{ viewData.auditOpinion || '-' }}</el-descriptions-item>
        <el-descriptions-item label="备注">{{ viewData.remark || '-' }}</el-descriptions-item>
      </el-descriptions>

      <el-divider content-position="left">领料申请明细</el-divider>
      <el-table :data="viewData.detailList" border style="width: 100%">
        <el-table-column label="序号" type="index" width="60" align="center" />
        <el-table-column label="物料" align="center" prop="materialName" min-width="150" />
        <el-table-column label="型号" align="center" prop="productModel" min-width="120" />
        <el-table-column label="规格" align="center" prop="productSpec" min-width="120" />
        <el-table-column label="单位" align="center" prop="unit" width="80" />
        <el-table-column label="需求数量" align="center" prop="requiredQuantity" width="100" />
        <el-table-column label="已领数量" align="center" prop="receivedQuantity" width="100" />
        <el-table-column label="备注" align="center" prop="remark" min-width="150" />
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openView = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMaterialApply, getMaterialApply, addMaterialApply, updateMaterialApply, delMaterialApply, auditMaterialApply } from "@/api/mes/materialApply"
import { listUser } from "@/api/system/user"

export default {
  name: "MaterialApply",
  dicts: ['mes_apply_status', 'mes_audit_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 领料申请表格数据
      materialApplyList: [],
      // 是否显示弹出层
      open: false,
      // 弹出层标题
      title: "",
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 用户列表
      userList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: undefined,
        productionPlanCode: undefined,
        productName: undefined,
        applicant: undefined,
        applyStatus: undefined,
        auditStatus: undefined
      },
      // 日期范围
      dateRangeReceiveDate: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        schedulingCode: [
          { required: true, message: "计划排产不能为空", trigger: "change" }
        ],
        receiveDate: [
          { required: true, message: "领取日期不能为空", trigger: "change" }
        ]
      },
      // 选择生产计划排产弹窗
      openPlanSelect: false,
      planLoading: false,
      planList: [],
      // 明细选中
      detailSelection: [],
      // 审核弹窗
      openAudit: false,
      auditForm: {},
      auditRules: {
        auditStatus: [
          { required: true, message: "请选择审核状态", trigger: "change" }
        ]
      },
      // 查看详情弹窗
      openView: false,
      viewData: {}
    }
  },
  created() {
    this.getList()
    this.getUserList()
  },
  methods: {
    /** 查询领料申请列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeReceiveDate, "ReceiveDate")
      listMaterialApply(params).then(response => {
        this.materialApplyList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 获取用户列表 */
    getUserList() {
      listUser({ pageNum: 1, pageSize: 9999 }).then(response => {
        this.userList = response.rows || []
      })
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRangeReceiveDate = []
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.applyId)
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      // 自动生成领料单号：ML-年月日-4位序号
      const now = new Date()
      const y = now.getFullYear()
      const m = String(now.getMonth() + 1).padStart(2, '0')
      const d = String(now.getDate()).padStart(2, '0')
      const seq = String(Math.floor(Math.random() * 9000) + 1000)
      this.form.applyNo = 'ML-' + y + m + d + '-' + seq
      // 默认申请日期为当前日期
      this.form.applyDate = y + '-' + m + '-' + d
      this.open = true
      this.title = "新增领料申请"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const applyId = row.applyId
      getMaterialApply(applyId).then(response => {
        this.form = response.data
        if (!this.form.detailList) {
          this.form.detailList = []
        }
        this.open = true
        this.title = "修改领料申请"
      })
    },
    /** 提交按钮 save-保存(未提交) submit-提交(待审核) */
    submitForm(action) {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (action === 'submit') {
            this.form.applyStatus = '1'
          } else {
            this.form.applyStatus = '0'
          }
          if (this.form.applyId != null) {
            updateMaterialApply(this.form).then(() => {
              this.$modal.msgSuccess(action === 'submit' ? "提交成功" : "保存成功")
              this.open = false
              this.getList()
            })
          } else {
            addMaterialApply(this.form).then(() => {
              this.$modal.msgSuccess(action === 'submit' ? "提交成功" : "保存成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 查看详情 */
    handleView(row) {
      getMaterialApply(row.applyId).then(response => {
        this.viewData = response.data
        if (!this.viewData.detailList) {
          this.viewData.detailList = []
        }
        this.openView = true
      })
    },
    /** 审核按钮操作 */
    handleAudit(row) {
      this.auditForm = {
        applyId: row.applyId,
        applyNo: row.applyNo,
        auditStatus: undefined,
        auditOpinion: undefined
      }
      this.openAudit = true
      this.$nextTick(() => {
        if (this.$refs.auditForm) {
          this.$refs.auditForm.clearValidate()
        }
      })
    },
    /** 提交审核 */
    submitAudit() {
      this.$refs["auditForm"].validate(valid => {
        if (valid) {
          auditMaterialApply(this.auditForm).then(() => {
            this.$modal.msgSuccess("审核成功")
            this.openAudit = false
            this.getList()
          })
        }
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('mes/materialApply/export', {
        ...this.queryParams
      }, `领料申请_${new Date().getTime()}.xlsx`)
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const applyIds = row.applyId ? [row.applyId] : this.ids
      this.$modal.confirm('是否确认删除领料申请编号为"' + applyIds + '"的数据项？').then(() => {
        return delMaterialApply(applyIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 选择生产计划排产 */
    handleSelectPlan() {
      this.openPlanSelect = true
      this.planLoading = true
      // 模拟生产计划排产数据（实际项目应替换为真实接口调用）
      setTimeout(() => {
        this.planList = [
          { productionPlanCode: 'PP-2026-001', schedulingCode: 'SC-2026-001', productName: '汽油发动机', productModel: 'EA888', productSpec: '2.0T/162kW', productUnit: '台' },
          { productionPlanCode: 'PP-2026-002', schedulingCode: 'SC-2026-002', productName: '双离合变速箱', productModel: 'DQ381', productSpec: '7速/380Nm', productUnit: '台' },
          { productionPlanCode: 'PP-2026-003', schedulingCode: 'SC-2026-003', productName: '前副车架', productModel: 'MQB-A', productSpec: '钢制/焊接', productUnit: '件' },
          { productionPlanCode: 'PP-2026-004', schedulingCode: 'SC-2026-004', productName: '三元锂电池包', productModel: 'NE-75', productSpec: '75kWh/350V', productUnit: '组' },
          { productionPlanCode: 'PP-2026-005', schedulingCode: 'SC-2026-005', productName: '后桥总成', productModel: 'R-Axle-01', productSpec: '承载1.5T', productUnit: '件' }
        ]
        this.planLoading = false
      }, 300)
    },
    /** 确认选择生产计划排产 */
    confirmPlan(row) {
      this.form.productionPlanCode = row.productionPlanCode
      this.form.schedulingCode = row.schedulingCode
      this.form.productName = row.productName
      this.form.productModel = row.productModel
      this.form.productSpec = row.productSpec
      this.form.productUnit = row.productUnit
      this.openPlanSelect = false
    },
    /** 添加明细行 */
    handleAddDetail() {
      this.form.detailList.push({
        detailId: undefined,
        applyId: undefined,
        materialName: undefined,
        productModel: undefined,
        productSpec: undefined,
        unit: undefined,
        requiredQuantity: 0,
        receivedQuantity: 0,
        remark: undefined
      })
    },
    /** 删除明细行 */
    handleDeleteDetail() {
      if (this.detailSelection.length === 0) {
        this.$modal.msgWarning("请先选择要删除的明细行")
        return
      }
      this.form.detailList = this.form.detailList.filter(
        item => !this.detailSelection.includes(item)
      )
    },
    /** 明细多选 */
    handleDetailSelectionChange(selection) {
      this.detailSelection = selection
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        applyId: undefined,
        applyNo: undefined,
        productionPlanCode: undefined,
        schedulingCode: undefined,
        productName: undefined,
        productModel: undefined,
        productSpec: undefined,
        productUnit: undefined,
        pendingQuantity: undefined,
        productionDate: undefined,
        receiveDate: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: "0",
        auditor: undefined,
        auditDate: undefined,
        auditStatus: undefined,
        auditOpinion: undefined,
        remark: undefined,
        detailList: []
      }
      this.resetForm("form")
    }
  }
}
</script>
