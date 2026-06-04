<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="申请单号" prop="applyNo">
        <el-input
          v-model="queryParams.applyNo"
          placeholder="请输入申请单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联单据号" prop="relatedNo">
        <el-input
          v-model="queryParams.relatedNo"
          placeholder="请输入关联单据号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="合同号" prop="contractNo">
        <el-input
          v-model="queryParams.contractNo"
          placeholder="请输入合同号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务类型" prop="businessType">
        <el-select v-model="queryParams.businessType" placeholder="请选择业务类型" clearable>
          <el-option
            v-for="dict in businessTypeOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="供应商" prop="supplierName">
        <el-select v-model="queryParams.supplierName" placeholder="请选择供应商" clearable filterable>
          <el-option
            v-for="item in supplierOptions"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="合同类型" prop="contractType">
        <el-select v-model="queryParams.contractType" placeholder="请选择合同类型" clearable>
          <el-option
            v-for="dict in contractTypeOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-select v-model="queryParams.applicant" placeholder="请选择申请人" clearable>
          <el-option
            v-for="item in applicantOptions"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="申请状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择申请状态" clearable>
          <el-option
            v-for="dict in applyStatusOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核人" prop="auditor">
        <el-select v-model="queryParams.auditor" placeholder="请选择审核人" clearable>
          <el-option
            v-for="item in auditorOptions"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态" clearable>
          <el-option
            v-for="dict in auditStatusOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="申请日期">
        <el-date-picker
          v-model="dateRangeApply"
          style="width: 207.22px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="审核日期">
        <el-date-picker
          v-model="dateRangeAudit"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['myTask:inboundAudit:add']"
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
          v-hasPermi="['myTask:inboundAudit:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['myTask:inboundAudit:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="inboundAuditList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="auditId" width="60" />
      <el-table-column label="申请单号" align="center" prop="applyNo" width="150" />
      <el-table-column label="关联单据号" align="center" prop="relatedNo" width="150" />
      <el-table-column label="业务类型" align="center" prop="businessType" width="100">
        <template slot-scope="scope">
          <span>{{ formatBusinessType(scope.row.businessType) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="供应商" align="center" prop="supplierName" width="150" :show-overflow-tooltip="true" />
      <el-table-column label="合同号" align="center" prop="contractNo" width="130" />
      <el-table-column label="合同类型" align="center" prop="contractType" width="100">
        <template slot-scope="scope">
          <span>{{ formatContractType(scope.row.contractType) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请类型" align="center" prop="applyType" width="100" />
      <el-table-column label="申请人" align="center" prop="applicant" width="80" />
      <el-table-column label="申请日期" align="center" prop="applyDate" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applyDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请状态" align="center" prop="applyStatus" width="90">
        <template slot-scope="scope">
          <span>{{ formatApplyStatus(scope.row.applyStatus) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核人" align="center" prop="auditor" width="80" />
      <el-table-column label="审核日期" align="center" prop="auditDate" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="auditStatus" width="90">
        <template slot-scope="scope">
          <el-tag :type="scope.row.auditStatus === '0' ? 'success' : scope.row.auditStatus === '1' ? 'danger' : 'info'">
            {{ formatAuditStatus(scope.row.auditStatus) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="80">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleDetail(scope.row)"
            v-hasPermi="['myTask:inboundAudit:edit']"
          >详细</el-button>
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

    <!-- 新增对话框 -->
    <el-dialog title="新增入库申请" :visible.sync="openAdd" width="600px" append-to-body>
      <el-form ref="addForm" :model="addForm" :rules="addRules" label-width="90px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="申请单号" prop="applyNo">
              <el-input v-model="addForm.applyNo" placeholder="请输入申请单号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="关联单据号" prop="relatedNo">
              <el-input v-model="addForm.relatedNo" placeholder="请输入关联单据号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="业务类型" prop="businessType">
              <el-select v-model="addForm.businessType" placeholder="请选择业务类型">
                <el-option
                  v-for="dict in businessTypeOptions"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="供应商" prop="supplierName">
              <el-input v-model="addForm.supplierName" placeholder="请输入供应商" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="合同号" prop="contractNo">
              <el-input v-model="addForm.contractNo" placeholder="请输入合同号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="合同类型" prop="contractType">
              <el-select v-model="addForm.contractType" placeholder="请选择合同类型">
                <el-option
                  v-for="dict in contractTypeOptions"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请类型" prop="applyType">
              <el-input v-model="addForm.applyType" placeholder="请输入申请类型" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人" prop="applicant">
              <el-input v-model="addForm.applicant" placeholder="请输入申请人" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请日期" prop="applyDate">
              <el-date-picker
                v-model="addForm.applyDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择申请日期"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请状态" prop="applyStatus">
              <el-select v-model="addForm.applyStatus" placeholder="请选择申请状态">
                <el-option
                  v-for="dict in applyStatusOptions"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="addForm.remark" type="textarea" :rows="2" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAdd">确 定</el-button>
        <el-button @click="openAdd = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 审核对话框 -->
    <el-dialog title="审核入库申请" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" label-width="80px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="申请单号">
              <span>{{ form.applyNo }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="业务类型">
              <span>{{ formatBusinessType(form.businessType) }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="供应商">
              <span>{{ form.supplierName }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人" prop="applicant">
              <el-input v-model="form.applicant" placeholder="请输入申请人" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
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
          <el-col :span="24">
            <el-form-item label="审核意见" prop="auditOpinion">
              <el-input v-model="auditOpinion" type="textarea" :rows="4" placeholder="请输入审核意见" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleAuditPass">通 过</el-button>
        <el-button type="danger" @click="handleAuditReject">驳 回</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInboundAudit, getInboundAudit, addInboundAudit, updateInboundAudit, delInboundAudit } from "@/api/myTask/inboundAudit"

export default {
  name: "InboundAudit",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 入库申请审核表格数据
      inboundAuditList: [],
      // 是否显示弹出层
      open: false,
      // 是否显示新增弹出层
      openAdd: false,
      // 表单参数
      form: {},
      // 新增表单参数
      addForm: {},
      // 新增表单校验
      addRules: {
        applyNo: [
          { required: true, message: "申请单号不能为空", trigger: "blur" }
        ]
      },
      // 审核意见
      auditOpinion: "",
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: undefined,
        relatedNo: undefined,
        contractNo: undefined,
        businessType: undefined,
        supplierName: undefined,
        contractType: undefined,
        applicant: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditStatus: undefined
      },
      // 申请日期范围
      dateRangeApply: [],
      // 审核日期范围
      dateRangeAudit: [],
      // 业务类型选项
      businessTypeOptions: [
        { value: "0", label: "生产入库" },
        { value: "1", label: "采购入库" },
        { value: "2", label: "退货入库" }
      ],
      // 合同类型选项
      contractTypeOptions: [
        { value: "0", label: "采购合同" },
        { value: "1", label: "销售合同" }
      ],
      // 申请状态选项
      applyStatusOptions: [
        { value: "0", label: "未提交" },
        { value: "1", label: "待审核" },
        { value: "2", label: "已审核" }
      ],
      // 审核状态选项
      auditStatusOptions: [
        { value: "0", label: "通过" },
        { value: "1", label: "驳回" }
      ],
      // 供应商选项（从列表数据中提取）
      supplierOptions: [],
      // 申请人选项（从列表数据中提取）
      applicantOptions: [],
      // 审核人选项（从列表数据中提取）
      auditorOptions: []
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询入库申请审核列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeApply, "ApplyDate")
      params = this.addDateRange(params, this.dateRangeAudit, "AuditDate")
      listInboundAudit(params).then(response => {
        this.inboundAuditList = response.rows
        this.total = response.total
        this.loading = false
        this.extractOptions(response.rows)
      })
    },
    /** 从列表数据中提取下拉选项 */
    extractOptions(list) {
      const supplierSet = new Set()
      const applicantSet = new Set()
      const auditorSet = new Set()
      list.forEach(item => {
        if (item.supplierName) supplierSet.add(item.supplierName)
        if (item.applicant) applicantSet.add(item.applicant)
        if (item.auditor) auditorSet.add(item.auditor)
      })
      this.supplierOptions = Array.from(supplierSet)
      this.applicantOptions = Array.from(applicantSet)
      this.auditorOptions = Array.from(auditorSet)
    },
    /** 格式化业务类型 */
    formatBusinessType(value) {
      const map = { "0": "生产入库", "1": "采购入库", "2": "退货入库" }
      return map[value] || value
    },
    /** 格式化合同类型 */
    formatContractType(value) {
      const map = { "0": "采购合同", "1": "销售合同" }
      return map[value] || value
    },
    /** 格式化申请状态 */
    formatApplyStatus(value) {
      const map = { "0": "未提交", "1": "待审核", "2": "已审核" }
      return map[value] || value
    },
    /** 格式化审核状态 */
    formatAuditStatus(value) {
      const map = { "0": "通过", "1": "驳回" }
      return map[value] || value
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRangeApply = []
      this.dateRangeAudit = []
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.auditId)
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.resetAdd()
      this.openAdd = true
    },
    /** 提交新增 */
    submitAdd() {
      this.$refs["addForm"].validate(valid => {
        if (valid) {
          addInboundAudit(this.addForm).then(() => {
            this.$modal.msgSuccess("新增成功")
            this.openAdd = false
            this.getList()
          })
        }
      })
    },
    /** 详细按钮操作 */
    handleDetail(row) {
      this.reset()
      const auditId = row.auditId
      getInboundAudit(auditId).then(response => {
        this.form = response.data
        this.auditOpinion = response.data.auditOpinion || ""
        this.open = true
      })
    },
    /** 审核通过 */
    handleAuditPass() {
      this.form.auditStatus = "0"
      this.form.auditOpinion = this.auditOpinion
      updateInboundAudit(this.form).then(() => {
        this.$modal.msgSuccess("审核通过成功")
        this.open = false
        this.getList()
      })
    },
    /** 审核驳回 */
    handleAuditReject() {
      this.form.auditStatus = "1"
      this.form.auditOpinion = this.auditOpinion
      updateInboundAudit(this.form).then(() => {
        this.$modal.msgSuccess("审核驳回成功")
        this.open = false
        this.getList()
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const auditIds = row.auditId ? [row.auditId] : this.ids
      this.$modal.confirm('是否确认删除入库申请审核编号为"' + auditIds + '"的数据项？').then(() => {
        return delInboundAudit(auditIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('myTask/inboundAudit/export', {
        ...this.queryParams
      }, `inboundAudit_${new Date().getTime()}.xlsx`)
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        auditId: undefined,
        applyNo: undefined,
        relatedNo: undefined,
        businessType: undefined,
        supplierName: undefined,
        contractNo: undefined,
        contractType: undefined,
        applyType: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditDate: undefined,
        auditStatus: undefined,
        auditOpinion: undefined,
        remark: undefined
      }
      this.auditOpinion = ""
      this.resetForm("form")
    },
    // 新增表单重置
    resetAdd() {
      this.addForm = {
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
      }
      this.resetForm("addForm")
    }
  }
}
</script>
