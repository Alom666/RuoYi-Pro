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
      <el-form-item label="计划单号" prop="planNo">
        <el-input
          v-model="queryParams.planNo"
          placeholder="请输入计划单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申请类型" prop="applyType">
        <el-select v-model="queryParams.applyType" placeholder="请选择申请类型" clearable>
          <el-option
            v-for="dict in dict.type.sys_apply_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-select v-model="queryParams.applicant" placeholder="请选择申请人" clearable filterable>
          <el-option
            v-for="item in userOptions"
            :key="item.userName"
            :label="item.nickName"
            :value="item.userName"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="申请状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择申请状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_apply_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核人" prop="auditor">
        <el-select v-model="queryParams.auditor" placeholder="请选择审核人" clearable filterable>
          <el-option
            v-for="item in userOptions"
            :key="item.userName"
            :label="item.nickName"
            :value="item.userName"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_audit_status"
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
          v-hasPermi="['myTask:purchaseAudit:add']"
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
          v-hasPermi="['myTask:purchaseAudit:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['myTask:purchaseAudit:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="purchaseAuditList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="auditId" width="60" />
      <el-table-column label="申请单号" align="center" prop="applyNo" width="150" />
      <el-table-column label="申请类型" align="center" prop="applyType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_apply_type" :value="scope.row.applyType"/>
        </template>
      </el-table-column>
      <el-table-column label="计划单号" align="center" prop="planNo" width="150" />
      <el-table-column label="补货单号" align="center" prop="replenishmentNo" width="150" />
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
      <el-table-column label="操作" align="center" fixed="right" width="100">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['myTask:purchaseAudit:query']"
          >详情</el-button>
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
    <el-dialog title="新增采购申请" :visible.sync="openAdd" width="600px" append-to-body>
      <el-form ref="addForm" :model="addForm" :rules="addRules" label-width="90px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="申请单号" prop="applyNo">
              <el-input v-model="addForm.applyNo" placeholder="请输入申请单号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请类型" prop="applyType">
              <el-select v-model="addForm.applyType" placeholder="请选择申请类型">
                <el-option
                  v-for="dict in dict.type.sys_apply_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="计划单号" prop="planNo">
              <el-input v-model="addForm.planNo" placeholder="请输入计划单号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="补货单号" prop="replenishmentNo">
              <el-input v-model="addForm.replenishmentNo" placeholder="请输入补货单号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人" prop="applicant">
              <el-select v-model="addForm.applicant" placeholder="请选择申请人" filterable>
                <el-option
                  v-for="item in userOptions"
                  :key="item.userName"
                  :label="item.nickName"
                  :value="item.userName"
                />
              </el-select>
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
                  v-for="dict in dict.type.sys_apply_status"
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

    <!-- 审核详情对话框 -->
    <el-dialog title="审核采购申请" :visible.sync="open" width="650px" append-to-body>
      <el-form ref="form" :model="form" label-width="90px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="申请单号">
              <span>{{ form.applyNo }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请类型" prop="applyType">
              <el-select v-model="form.applyType" placeholder="请选择申请类型">
                <el-option
                  v-for="dict in dict.type.sys_apply_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请人">
              <span>{{ form.applicant }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="计划单号">
              <span>{{ form.planNo }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="补货单号">
              <span>{{ form.replenishmentNo }}</span>
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
          <el-col :span="12">
            <el-form-item label="申请状态" prop="applyStatus">
              <el-select v-model="form.applyStatus" placeholder="请选择申请状态">
                <el-option
                  v-for="dict in dict.type.sys_apply_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="审核人" prop="auditor">
              <el-select v-model="form.auditor" placeholder="请选择审核人" filterable>
                <el-option
                  v-for="item in userOptions"
                  :key="item.userName"
                  :label="item.nickName"
                  :value="item.userName"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="审核意见" prop="auditOpinion">
              <el-input v-model="form.auditOpinion" type="textarea" :rows="4" placeholder="请输入审核意见" />
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
import { listPurchaseAudit, getPurchaseAudit, addPurchaseAudit, updatePurchaseAudit, delPurchaseAudit } from "@/api/myTask/purchaseAudit"
import { listAllUser } from "@/api/system/user"

export default {
  name: "PurchaseAudit",
  dicts: ['sys_apply_type', 'sys_apply_status', 'sys_audit_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 采购申请审核表格数据
      purchaseAuditList: [],
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
      // 用户列表选项
      userOptions: [],
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: undefined,
        planNo: undefined,
        applyType: undefined,
        applicant: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditStatus: undefined
      },
      // 申请日期范围
      dateRangeApply: [],
      // 审核日期范围
      dateRangeAudit: []
    }
  },
  created() {
    this.getList()
    this.getUserOptions()
  },
  methods: {
    /** 查询采购申请审核列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeApply, "ApplyDate")
      params = this.addDateRange(params, this.dateRangeAudit, "AuditDate")
      listPurchaseAudit(params).then(response => {
        this.purchaseAuditList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 获取用户列表 */
    getUserOptions() {
      listAllUser().then(response => {
        this.userOptions = response.data
      })
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
          addPurchaseAudit(this.addForm).then(() => {
            this.$modal.msgSuccess("新增成功")
            this.openAdd = false
            this.getList()
          })
        }
      })
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
    /** 详情按钮操作 */
    handleDetail(row) {
      this.reset()
      const auditId = row.auditId
      getPurchaseAudit(auditId).then(response => {
        this.form = response.data
        this.open = true
      })
    },
    /** 审核通过 */
    handleAuditPass() {
      this.form.auditStatus = "0"
      updatePurchaseAudit(this.form).then(() => {
        this.$modal.msgSuccess("审核通过成功")
        this.open = false
        this.getList()
      })
    },
    /** 审核驳回 */
    handleAuditReject() {
      this.form.auditStatus = "1"
      updatePurchaseAudit(this.form).then(() => {
        this.$modal.msgSuccess("审核驳回成功")
        this.open = false
        this.getList()
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const auditIds = row.auditId ? [row.auditId] : this.ids
      this.$modal.confirm('是否确认删除采购申请审核编号为"' + auditIds + '"的数据项？').then(() => {
        return delPurchaseAudit(auditIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('myTask/purchaseAudit/export', {
        ...this.queryParams
      }, `purchaseAudit_${new Date().getTime()}.xlsx`)
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
        applyType: undefined,
        planNo: undefined,
        replenishmentNo: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditDate: undefined,
        auditStatus: undefined,
        auditOpinion: undefined,
        remark: undefined
      }
      this.resetForm("form")
    },
    // 新增表单重置
    resetAdd() {
      this.addForm = {
        applyNo: undefined,
        applyType: undefined,
        planNo: undefined,
        replenishmentNo: undefined,
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
