
<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="申请单号" prop="applyNo">
        <el-input v-model="queryParams.applyNo" placeholder="请输入申请单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="申请类型" prop="applyType">
        <el-select v-model="queryParams.applyType" placeholder="请选择" clearable>
          <el-option v-for="dict in dict.type.sys_apply_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="计划单号" prop="planNo">
        <el-input v-model="queryParams.planNo" placeholder="请输入计划单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-select v-model="queryParams.applicant" placeholder="请选择" clearable filterable>
          <el-option v-for="item in userList" :key="item.userName" :label="item.nickName" :value="item.userName" />
        </el-select>
      </el-form-item>
      <el-form-item label="申请日期">
        <el-date-picker v-model="dateRangeApplyDate" style="width: 207.22px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="申请状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择" clearable>
          <el-option v-for="dict in dict.type.sys_apply_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="审核人" prop="auditor">
        <el-select v-model="queryParams.auditor" placeholder="请选择" clearable filterable>
          <el-option v-for="item in userList" :key="item.userName" :label="item.nickName" :value="item.userName" />
        </el-select>
      </el-form-item>
      <el-form-item label="审核日期">
        <el-date-picker v-model="dateRangeAuditDate" style="width: 207.22px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择" clearable>
          <el-option v-for="dict in dict.type.sys_audit_status" :key="dict.value" :label="dict.label" :value="dict.value" />
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
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['scm:purchaseApply:add']">新建</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['scm:purchaseApply:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="applyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="applyId" width="60" />
      <el-table-column label="申请单号" align="center" prop="applyNo" width="160" :show-overflow-tooltip="true" />
      <el-table-column label="申请类型" align="center" prop="applyType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_apply_type" :value="scope.row.applyType" />
        </template>
      </el-table-column>
      <el-table-column label="计划单号" align="center" prop="planNo" width="140" :show-overflow-tooltip="true" />
      <el-table-column label="补货单号" align="center" prop="replenishmentNo" width="140" :show-overflow-tooltip="true" />
      <el-table-column label="申请人" align="center" prop="applicant" width="90" />
      <el-table-column label="申请日期" align="center" prop="applyDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applyDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请状态" align="center" prop="applyStatus" width="90">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_apply_status" :value="scope.row.applyStatus" />
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
          <dict-tag :options="dict.type.sys_audit_status" :value="scope.row.auditStatus" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="150">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['scm:purchaseApply:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['scm:purchaseApply:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 新增/修改弹窗 -->
    <el-dialog :title="title" :visible.sync="open" width="1200px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <!-- 上半部分：主表信息 -->
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="申请单号" prop="applyNo">
              <el-input v-model="form.applyNo" placeholder="自动生成" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="计划单号" prop="planNo">
              <el-input v-model="form.planNo" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="补货单号" prop="replenishmentNo">
              <el-input v-model="form.replenishmentNo" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="申请人" prop="applicant">
              <el-input v-model="form.applicant" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="申请日期" prop="applyDate">
              <el-date-picker v-model="form.applyDate" type="date" value-format="yyyy-MM-dd" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="申请状态" prop="applyStatus">
              <el-select v-model="form.applyStatus" placeholder="自动回填" style="width: 100%" disabled>
                <el-option v-for="dict in dict.type.sys_apply_status" :key="dict.value" :label="dict.label" :value="dict.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="审核人" prop="auditor">
              <el-input v-model="form.auditor" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="审核日期" prop="auditDate">
              <el-date-picker v-model="form.auditDate" type="date" value-format="yyyy-MM-dd" placeholder="自动回填" style="width: 100%" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="审核状态" prop="auditStatus">
              <el-select v-model="form.auditStatus" placeholder="自动回填" style="width: 100%" disabled>
                <el-option v-for="dict in dict.type.sys_audit_status" :key="dict.value" :label="dict.label" :value="dict.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="16">
            <el-form-item label="审核意见" prop="auditOpinion">
              <el-input v-model="form.auditOpinion" type="textarea" :rows="2" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="16">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>

        <!-- 分割线 -->
        <el-divider content-position="left">采购申请明细</el-divider>

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
          <el-table-column label="物料" align="center" min-width="180">
            <template slot-scope="scope">
              <el-input v-model="scope.row.materialName" placeholder="请选择物料" size="small" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectMaterial(scope.$index)"></el-button>
              </el-input>
            </template>
          </el-table-column>
          <el-table-column label="型号" align="center" width="120">
            <template slot-scope="scope">
              <span>{{ scope.row.productModel }}</span>
            </template>
          </el-table-column>
          <el-table-column label="规格" align="center" width="120">
            <template slot-scope="scope">
              <span>{{ scope.row.productSpec }}</span>
            </template>
          </el-table-column>
          <el-table-column label="单位" align="center" width="70">
            <template slot-scope="scope">
              <span>{{ scope.row.unit }}</span>
            </template>
          </el-table-column>
          <el-table-column label="单价" align="center" width="130">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.price" :min="0" :precision="2" size="small" style="width: 100%" controls-position="right" />
            </template>
          </el-table-column>
          <el-table-column label="采购数量" align="center" width="130">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.purchaseQuantity" :min="1" :precision="0" size="small" style="width: 100%" controls-position="right" />
            </template>
          </el-table-column>
          <el-table-column label="需求数量" align="center" width="130">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.requiredQuantity" :min="1" :precision="0" size="small" style="width: 100%" controls-position="right" />
            </template>
          </el-table-column>
          <el-table-column label="需求日期" align="center" width="150">
            <template slot-scope="scope">
              <el-date-picker v-model="scope.row.requiredDate" type="date" value-format="yyyy-MM-dd" placeholder="选择日期" size="small" style="width: 100%" />
            </template>
          </el-table-column>
          <el-table-column label="备注" align="center" min-width="120">
            <template slot-scope="scope">
              <el-input v-model="scope.row.remark" placeholder="备注" size="small" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm('0')">保 存</el-button>
        <el-button type="warning" @click="submitForm('1')">提 交</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择物料档案弹窗 -->
    <el-dialog title="选择物料档案" :visible.sync="openMaterialSelect" width="900px" append-to-body>
      <el-container style="height: 450px">
        <el-aside width="220px" style="border-right: 1px solid #eee; padding-right: 10px; overflow: auto">
          <el-tree :data="materialCategoryTree" :props="{ children: 'children', label: 'label' }" node-key="id" highlight-current default-expand-all @node-click="handleCategoryNodeClick" />
        </el-aside>
        <el-main style="padding: 0 0 0 15px; overflow: auto">
          <el-table :data="materialList" v-loading="materialLoading" height="400" highlight-current-row @current-change="handleMaterialCurrentChange">
            <el-table-column label="物料名称" align="center" prop="materialName" :show-overflow-tooltip="true" />
            <el-table-column label="型号" align="center" prop="productModel" width="100" />
            <el-table-column label="规格" align="center" prop="productSpec" width="100" />
            <el-table-column label="单位" align="center" prop="unit" width="60" />
            <el-table-column label="单价" align="center" prop="price" width="100" />
            <el-table-column label="操作" align="center" width="80">
              <template slot-scope="scope">
                <el-button size="mini" type="text" @click="confirmMaterial(scope.row)">选择</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-main>
      </el-container>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openMaterialSelect = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPurchaseApply, getPurchaseApply, addPurchaseApply, updatePurchaseApply, delPurchaseApply } from '@/api/scm/purchaseApply'
import { listUser } from '@/api/system/user'

export default {
  name: 'PurchaseApply',
  dicts: ['sys_apply_type', 'sys_apply_status', 'sys_audit_status'],
  data() {
    return {
      loading: true,
      ids: [],
      multiple: true,
      showSearch: true,
      total: 0,
      applyList: [],
      title: '',
      open: false,
      dateRangeApplyDate: [],
      dateRangeAuditDate: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyNo: undefined,
        applyType: undefined,
        planNo: undefined,
        applicant: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditStatus: undefined
      },
      form: {},
      rules: {},
      detailSelection: [],
      // 用户列表
      userList: [],
      // 选择物料弹窗
      openMaterialSelect: false,
      materialLoading: false,
      materialList: [],
      materialCategoryTree: [],
      currentDetailIndex: null,
      allMaterialList: [
        { materialId: 101, materialName: '汽油发动机',   productModel: 'EA888',     productSpec: '2.0T/162kW',  unit: '台', price: 35000, categoryId: 1 },
        { materialId: 102, materialName: '双离合变速箱', productModel: 'DQ381',     productSpec: '7速/380Nm',   unit: '台', price: 28000, categoryId: 1 },
        { materialId: 103, materialName: '三元锂电池包', productModel: 'NE-75',     productSpec: '75kWh/350V',  unit: '组', price: 65000, categoryId: 2 },
        { materialId: 104, materialName: '前副车架',     productModel: 'MQB-A',     productSpec: '钢制/焊接',   unit: '件', price: 4500,  categoryId: 3 },
        { materialId: 105, materialName: '后桥总成',     productModel: 'R-Axle-01', productSpec: '承载1.5T',    unit: '件', price: 6800,  categoryId: 3 },
        { materialId: 106, materialName: '驱动电机',     productModel: 'EM-150',    productSpec: '150kW/永磁',  unit: '台', price: 12000, categoryId: 2 },
        { materialId: 107, materialName: 'MCU控制器',    productModel: 'MCU-01',    productSpec: '400V/IGBT',   unit: '个', price: 8500,  categoryId: 2 },
        { materialId: 108, materialName: '涡轮增压器',   productModel: 'TC-28',     productSpec: '28mm/单涡管', unit: '件', price: 5200,  categoryId: 1 }
      ]
    }
  },
  created() {
    this.getList()
    this.getUserList()
    this.initMaterialCategoryTree()
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeApplyDate, 'ApplyDate')
      params = this.addDateRange(params, this.dateRangeAuditDate, 'AuditDate')
      listPurchaseApply(params).then(response => {
        this.applyList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 获取用户列表 */
    getUserList() {
      listUser({ pageNum: 1, pageSize: 999 }).then(response => {
        this.userList = response.rows || []
      }).catch(() => {
        this.userList = []
      })
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.dateRangeApplyDate = []
      this.dateRangeAuditDate = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.applyId)
      this.multiple = !selection.length
    },
    /** 新增 */
    handleAdd() {
      this.reset()
      const now = new Date()
      const y = now.getFullYear()
      const m = String(now.getMonth() + 1).padStart(2, '0')
      const d = String(now.getDate()).padStart(2, '0')
      const seq = String(Math.floor(Math.random() * 9000) + 1000)
      this.form.applyNo = 'PA-' + y + m + d + '-' + seq
      this.form.applyDate = y + '-' + m + '-' + d
      this.open = true
      this.title = '新增采购申请'
    },
    /** 修改 */
    handleUpdate(row) {
      this.reset()
      const applyId = row.applyId
      getPurchaseApply(applyId).then(response => {
        this.form = response.data
        if (!this.form.detailList) {
          this.form.detailList = []
        }
        this.open = true
        this.title = '修改采购申请'
      })
    },
    /** 提交：applyStatus=0保存(未提交)，applyStatus=1提交(待审核) */
    submitForm(applyStatus) {
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.applyStatus = applyStatus
          if (this.form.applyId != null) {
            updatePurchaseApply(this.form).then(() => {
              this.$modal.msgSuccess(applyStatus === '1' ? '提交成功' : '保存成功')
              this.open = false
              this.getList()
            })
          } else {
            addPurchaseApply(this.form).then(() => {
              this.$modal.msgSuccess(applyStatus === '1' ? '提交成功' : '保存成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除 */
    handleDelete(row) {
      const applyIds = row.applyId ? [row.applyId] : this.ids
      this.$modal.confirm('是否确认删除采购申请编号为"' + applyIds + '"的数据项？').then(() => {
        return delPurchaseApply(applyIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {})
    },
    /** 添加明细行 */
    handleAddDetail() {
      this.form.detailList.push({
        detailId: undefined,
        applyId: undefined,
        seqNo: this.form.detailList.length + 1,
        materialId: undefined,
        materialName: undefined,
        productModel: undefined,
        productSpec: undefined,
        unit: undefined,
        price: undefined,
        purchaseQuantity: 1,
        requiredQuantity: 1,
        requiredDate: undefined,
        remark: undefined
      })
    },
    /** 删除明细行 */
    handleDeleteDetail() {
      if (this.detailSelection.length === 0) {
        this.$modal.msgWarning('请先选择要删除的明细行')
        return
      }
      this.form.detailList = this.form.detailList.filter(item => !this.detailSelection.includes(item))
      this.form.detailList.forEach((item, index) => { item.seqNo = index + 1 })
    },
    handleDetailSelectionChange(selection) {
      this.detailSelection = selection
    },
    // ========== 选择物料 ==========
    initMaterialCategoryTree() {
      this.materialCategoryTree = [
        { id: 0, label: '全部物料' },
        { id: 1, label: '动力总成', children: [
          { id: 11, label: '发动机' },
          { id: 12, label: '变速箱' },
          { id: 13, label: '增压器' }
        ]},
        { id: 2, label: '新能源', children: [
          { id: 21, label: '电池' },
          { id: 22, label: '电机' },
          { id: 23, label: '电控' }
        ]},
        { id: 3, label: '底盘件', children: [
          { id: 31, label: '车架' },
          { id: 32, label: '车桥' }
        ]}
      ]
    },
    handleSelectMaterial(index) {
      this.currentDetailIndex = index
      this.openMaterialSelect = true
      this.loadMaterialList(0)
    },
    handleCategoryNodeClick(data) {
      this.loadMaterialList(data.id)
    },
    loadMaterialList(categoryId) {
      this.materialLoading = true
      setTimeout(() => {
        if (categoryId === 0) {
          this.materialList = [...this.allMaterialList]
        } else {
          this.materialList = this.allMaterialList.filter(item => item.categoryId === categoryId)
        }
        this.materialLoading = false
      }, 200)
    },
    handleMaterialCurrentChange() {},
    confirmMaterial(row) {
      if (this.currentDetailIndex !== null && this.form.detailList[this.currentDetailIndex]) {
        const detail = this.form.detailList[this.currentDetailIndex]
        detail.materialId = row.materialId
        detail.materialName = row.materialName
        detail.productModel = row.productModel
        detail.productSpec = row.productSpec
        detail.unit = row.unit
        detail.price = row.price
      }
      this.openMaterialSelect = false
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        applyId: undefined,
        applyNo: undefined,
        applyType: undefined,
        planNo: undefined,
        replenishmentNo: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: '0',
        auditor: undefined,
        auditDate: undefined,
        auditStatus: undefined,
        auditOpinion: undefined,
        remark: undefined,
        detailList: []
      }
      this.resetForm('form')
    }
  }
}
</script>
