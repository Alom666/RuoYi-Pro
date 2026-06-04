
<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="合同编号" prop="contractNo">
        <el-input v-model="queryParams.contractNo" placeholder="请输入合同编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="订单编号" prop="orderNo">
        <el-input v-model="queryParams.orderNo" placeholder="请输入订单编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="客户名称" prop="customerName">
        <el-select v-model="queryParams.customerName" placeholder="请选择" clearable filterable>
          <el-option v-for="item in customerList" :key="item.customerId" :label="item.customerName" :value="item.customerName" />
        </el-select>
      </el-form-item>
      <el-form-item label="交货日期">
        <el-date-picker v-model="dateRangeDeliveryDate" style="width: 207.22px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="送货方式" prop="deliveryMethod">
        <el-select v-model="queryParams.deliveryMethod" placeholder="请选择" clearable>
          <el-option v-for="dict in dict.type.sys_delivery_method" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="签订日期">
        <el-date-picker v-model="dateRangeSignDate" style="width: 207.22px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="申请人" prop="applicant">
        <el-select v-model="queryParams.applicant" placeholder="请选择" clearable filterable>
          <el-option v-for="item in userList" :key="item.userName" :label="item.nickName" :value="item.userName" />
        </el-select>
      </el-form-item>
      <el-form-item label="申请时间">
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
      <el-form-item label="审核时间">
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
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['scm:salesContract:add']">新建</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['scm:salesContract:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="contractList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="contractId" width="60" />
      <el-table-column label="订单编号" align="center" prop="orderNo" width="160" :show-overflow-tooltip="true" />
      <el-table-column label="客户名称" align="center" prop="customerName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="联系人" align="center" prop="contactPerson" width="90" />
      <el-table-column label="联系方式" align="center" prop="contactPhone" width="120" />
      <el-table-column label="金额合计" align="center" prop="totalAmount" width="110" />
      <el-table-column label="交货日期" align="center" prop="deliveryDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliveryDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请人" align="center" prop="applicant" width="90" />
      <el-table-column label="申请时间" align="center" prop="applyDate" width="110">
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
      <el-table-column label="审核时间" align="center" prop="auditDate" width="110">
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
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['scm:salesContract:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['scm:salesContract:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 新增/修改弹窗 -->
    <el-dialog :title="title" :visible.sync="open" width="1100px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <!-- 上半部分：主表信息 -->
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="订单编号" prop="orderNo">
              <el-input v-model="form.orderNo" placeholder="请选择订单" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectOrder"></el-button>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户名称" prop="customerName">
              <el-input v-model="form.customerName" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="金额合计" prop="totalAmount">
              <el-input v-model="form.totalAmount" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="联系人" prop="contactPerson">
              <el-input v-model="form.contactPerson" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="联系方式" prop="contactPhone">
              <el-input v-model="form.contactPhone" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="交货日期" prop="deliveryDate">
              <el-date-picker v-model="form.deliveryDate" type="date" value-format="yyyy-MM-dd" placeholder="自动回填" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="送货方式" prop="deliveryMethod">
              <el-select v-model="form.deliveryMethod" placeholder="请选择" style="width: 100%">
                <el-option v-for="dict in dict.type.sys_delivery_method" :key="dict.value" :label="dict.label" :value="dict.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="签订日期" prop="signDate">
              <el-date-picker v-model="form.signDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择签订日期" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="收货地址" prop="deliveryAddress">
              <el-input v-model="form.deliveryAddress" placeholder="请输入收货地址" />
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
        <el-divider content-position="left">合同明细</el-divider>

        <!-- 下半部分：子表明细 -->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAddDetail">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" plain icon="el-icon-delete" size="mini" @click="handleDeleteDetail">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="form.detailList" @selection-change="handleDetailSelectionChange" border show-summary :summary-method="getSummaries" style="width: 100%">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" type="index" width="60" align="center" />
          <el-table-column label="产品" align="center" min-width="180">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productName" placeholder="请选择产品" size="small" readonly>
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
              <el-input-number v-model="scope.row.price" :min="0" :precision="2" size="small" style="width: 100%" controls-position="right" @change="calcAmount(scope.row)" />
            </template>
          </el-table-column>
          <el-table-column label="订货数量" align="center" width="130">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.orderQuantity" :min="1" :precision="0" size="small" style="width: 100%" controls-position="right" @change="calcAmount(scope.row)" />
            </template>
          </el-table-column>
          <el-table-column label="金额" align="center" width="120">
            <template slot-scope="scope">
              <span>{{ scope.row.amount }}</span>
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

    <!-- 选择销售订单弹窗 -->
    <el-dialog title="选择销售订单" :visible.sync="openOrderSelect" width="750px" append-to-body>
      <el-form :inline="true" size="small">
        <el-form-item label="订单编号">
          <el-input v-model="orderQueryParams.orderNo" placeholder="请输入订单编号" clearable @keyup.enter.native="handleOrderSearch" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleOrderSearch">搜索</el-button>
        </el-form-item>
      </el-form>
      <el-table :data="orderList" v-loading="orderLoading" height="350" highlight-current-row @current-change="handleOrderCurrentChange">
        <el-table-column label="订单编号" align="center" prop="orderNo" width="160" :show-overflow-tooltip="true" />
        <el-table-column label="客户名称" align="center" prop="customerName" width="130" :show-overflow-tooltip="true" />
        <el-table-column label="联系人" align="center" prop="contactPerson" width="90" />
        <el-table-column label="联系方式" align="center" prop="contactPhone" width="120" />
        <el-table-column label="金额合计" align="center" prop="totalAmount" width="100" />
        <el-table-column label="交货日期" align="center" prop="deliveryDate" width="110">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.deliveryDate, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="80">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="confirmOrder(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openOrderSelect = false">关 闭</el-button>
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
import { listSalesContract, getSalesContract, addSalesContract, updateSalesContract, delSalesContract } from '@/api/scm/salesContract'
import { listSalesOrder } from '@/api/scm/salesOrder'
import { listUser } from '@/api/system/user'

export default {
  name: 'SalesContract',
  dicts: ['sys_delivery_method', 'sys_apply_status', 'sys_audit_status'],
  data() {
    return {
      loading: true,
      ids: [],
      multiple: true,
      showSearch: true,
      total: 0,
      contractList: [],
      title: '',
      open: false,
      dateRangeDeliveryDate: [],
      dateRangeSignDate: [],
      dateRangeApplyDate: [],
      dateRangeAuditDate: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        contractNo: undefined,
        orderNo: undefined,
        applicant: undefined,
        customerName: undefined,
        deliveryMethod: undefined,
        applyStatus: undefined,
        auditor: undefined,
        auditStatus: undefined
      },
      form: {},
      rules: {
        orderNo: [{ required: true, message: '请选择订单', trigger: 'change' }]
      },
      detailSelection: [],
      // 用户列表
      userList: [],
      // 客户列表
      customerList: [
        { customerId: 1, customerName: '华东汽车集团' },
        { customerId: 2, customerName: '南方新能源科技' },
        { customerId: 3, customerName: '北方重工机械' },
        { customerId: 4, customerName: '西部动力系统' },
        { customerId: 5, customerName: '中原零部件制造' }
      ],
      // 选择销售订单弹窗
      openOrderSelect: false,
      orderLoading: false,
      orderQueryParams: { orderNo: undefined, pageNum: 1, pageSize: 100 },
      orderList: [],
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
      let params = this.addDateRange(this.queryParams, this.dateRangeDeliveryDate, 'DeliveryDate')
      params = this.addDateRange(params, this.dateRangeSignDate, 'SignDate')
      params = this.addDateRange(params, this.dateRangeApplyDate, 'ApplyDate')
      params = this.addDateRange(params, this.dateRangeAuditDate, 'AuditDate')
      listSalesContract(params).then(response => {
        this.contractList = response.rows
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
      this.dateRangeDeliveryDate = []
      this.dateRangeSignDate = []
      this.dateRangeApplyDate = []
      this.dateRangeAuditDate = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.contractId)
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
      this.form.contractNo = 'SC-' + y + m + d + '-' + seq
      this.open = true
      this.title = '新增销售合同'
    },
    /** 修改 */
    handleUpdate(row) {
      this.reset()
      const contractId = row.contractId
      getSalesContract(contractId).then(response => {
        this.form = response.data
        if (!this.form.detailList) {
          this.form.detailList = []
        }
        this.open = true
        this.title = '修改销售合同'
      })
    },
    /** 提交：applyStatus=0保存(未提交)，applyStatus=1提交(待审核) */
    submitForm(applyStatus) {
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.applyStatus = applyStatus
          if (this.form.contractId != null) {
            updateSalesContract(this.form).then(() => {
              this.$modal.msgSuccess(applyStatus === '1' ? '提交成功' : '保存成功')
              this.open = false
              this.getList()
            })
          } else {
            addSalesContract(this.form).then(() => {
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
      const contractIds = row.contractId ? [row.contractId] : this.ids
      this.$modal.confirm('是否确认删除销售合同编号为"' + contractIds + '"的数据项？').then(() => {
        return delSalesContract(contractIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {})
    },
    /** 添加明细行 */
    handleAddDetail() {
      this.form.detailList.push({
        detailId: undefined,
        contractId: undefined,
        seqNo: this.form.detailList.length + 1,
        materialId: undefined,
        productName: undefined,
        productModel: undefined,
        productSpec: undefined,
        unit: undefined,
        price: undefined,
        orderQuantity: 1,
        amount: undefined,
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
      this.calcTotalAmount()
    },
    handleDetailSelectionChange(selection) {
      this.detailSelection = selection
    },
    /** 计算行金额 = 单价 × 订货数量 */
    calcAmount(row) {
      if (row.price != null && row.orderQuantity != null) {
        row.amount = parseFloat((row.price * row.orderQuantity).toFixed(2))
      } else {
        row.amount = undefined
      }
      this.calcTotalAmount()
    },
    /** 汇总金额合计到主表 */
    calcTotalAmount() {
      let total = 0
      this.form.detailList.forEach(item => {
        if (item.amount != null) {
          total += item.amount
        }
      })
      this.form.totalAmount = parseFloat(total.toFixed(2))
    },
    /** 合计行 */
    getSummaries(param) {
      const { columns, data } = param
      const sums = []
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = '合计'
          return
        }
        if (index === 8) {
          const values = data.map(item => Number(item.amount))
          if (!values.every(value => isNaN(value))) {
            sums[index] = values.reduce((prev, curr) => {
              const value = Number(curr)
              if (!isNaN(value)) {
                return prev + value
              } else {
                return prev
              }
            }, 0)
            sums[index] = sums[index].toFixed(2)
          } else {
            sums[index] = ''
          }
        } else {
          sums[index] = ''
        }
      })
      return sums
    },
    // ========== 选择销售订单 ==========
    handleSelectOrder() {
      this.orderQueryParams.orderNo = undefined
      this.orderLoading = true
      listSalesOrder(this.orderQueryParams).then(response => {
        this.orderList = response.rows
        this.orderLoading = false
        this.openOrderSelect = true
      }).catch(() => {
        this.orderLoading = false
      })
    },
    handleOrderSearch() {
      this.orderQueryParams.pageNum = 1
      this.orderLoading = true
      listSalesOrder(this.orderQueryParams).then(response => {
        this.orderList = response.rows
        this.orderLoading = false
      }).catch(() => {
        this.orderLoading = false
      })
    },
    handleOrderCurrentChange() {},
    confirmOrder(row) {
      this.form.orderNo = row.orderNo
      this.form.customerName = row.customerName
      this.form.contactPerson = row.contactPerson
      this.form.contactPhone = row.contactPhone
      this.form.totalAmount = row.totalAmount
      this.form.deliveryDate = row.deliveryDate
      this.openOrderSelect = false
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
        detail.productName = row.materialName
        detail.productModel = row.productModel
        detail.productSpec = row.productSpec
        detail.unit = row.unit
        detail.price = row.price
        this.calcAmount(detail)
      }
      this.openMaterialSelect = false
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        contractId: undefined,
        contractNo: undefined,
        orderNo: undefined,
        customerName: undefined,
        contactPerson: undefined,
        contactPhone: undefined,
        totalAmount: undefined,
        deliveryDate: undefined,
        deliveryMethod: undefined,
        deliveryAddress: undefined,
        signDate: undefined,
        applicant: undefined,
        applyDate: undefined,
        applyStatus: '0',
        auditor: undefined,
        auditDate: undefined,
        auditStatus: undefined,
        remark: undefined,
        detailList: []
      }
      this.resetForm('form')
    }
  }
}
</script>
