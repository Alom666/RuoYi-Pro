
<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="到货单号" prop="arrivalNo">
        <el-input v-model="queryParams.arrivalNo" placeholder="请输入到货单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="合同编号" prop="contractNo">
        <el-input v-model="queryParams.contractNo" placeholder="请输入合同编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="到货日期">
        <el-date-picker v-model="dateRangeArrivalDate" style="width: 207.22px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="供应商" prop="supplierName">
        <el-select v-model="queryParams.supplierName" placeholder="请选择" clearable filterable>
          <el-option v-for="item in supplierList" :key="item.supplierId" :label="item.supplierName" :value="item.supplierName" />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择" clearable>
          <el-option v-for="dict in dict.type.sys_arrival_status" :key="dict.value" :label="dict.label" :value="dict.value" />
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
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['scm:purchaseArrival:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['scm:purchaseArrival:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="arrivalList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="arrivalId" width="60" />
      <el-table-column label="到货单号" align="center" prop="arrivalNo" width="160" :show-overflow-tooltip="true" />
      <el-table-column label="合同编号" align="center" prop="contractNo" width="160" :show-overflow-tooltip="true" />
      <el-table-column label="供应商名称" align="center" prop="supplierName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="联系人" align="center" prop="contactPerson" width="90" />
      <el-table-column label="联系电话" align="center" prop="contactPhone" width="120" />
      <el-table-column label="到货日期" align="center" prop="arrivalDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.arrivalDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" width="90">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_arrival_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="150">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['scm:purchaseArrival:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['scm:purchaseArrival:remove']">删除</el-button>
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
            <el-form-item label="合同编号" prop="contractNo">
              <el-input v-model="form.contractNo" placeholder="请选择合同" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectContract"></el-button>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="供应商名称" prop="supplierName">
              <el-input v-model="form.supplierName" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="联系人" prop="contactPerson">
              <el-input v-model="form.contactPerson" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="联系电话" prop="contactPhone">
              <el-input v-model="form.contactPhone" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="到货日期" prop="arrivalDate">
              <el-date-picker v-model="form.arrivalDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择到货日期" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>

        <!-- 分割线 -->
        <el-divider content-position="left">到货明细</el-divider>

        <!-- 下半部分：到货明细表格 -->
        <el-table :data="form.detailList" border style="width: 100%">
          <el-table-column label="序号" type="index" width="60" align="center" />
          <el-table-column label="物料名称" align="center" prop="materialName" min-width="130" :show-overflow-tooltip="true" />
          <el-table-column label="型号" align="center" prop="productModel" width="100" />
          <el-table-column label="规格" align="center" prop="productSpec" width="100" />
          <el-table-column label="单位" align="center" prop="unit" width="70" />
          <el-table-column label="合同订货数量" align="center" prop="orderQuantity" width="120" />
          <el-table-column label="到货数量" align="center" width="130">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.arrivalQuantity" :min="0" :precision="0" size="small" style="width: 100%" controls-position="right" />
            </template>
          </el-table-column>
          <el-table-column label="生产批号" align="center" width="130">
            <template slot-scope="scope">
              <el-input v-model="scope.row.batchNo" placeholder="批号" size="small" />
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
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择采购合同弹窗 -->
    <el-dialog title="选择采购合同" :visible.sync="openContractSelect" width="750px" append-to-body>
      <el-form :inline="true" size="small">
        <el-form-item label="合同编号">
          <el-input v-model="contractQueryParams.contractNo" placeholder="请输入合同编号" clearable @keyup.enter.native="handleContractSearch" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleContractSearch">搜索</el-button>
        </el-form-item>
      </el-form>
      <el-table :data="contractList" v-loading="contractLoading" height="350" highlight-current-row @current-change="handleContractCurrentChange">
        <el-table-column label="合同编号" align="center" prop="contractNo" width="160" :show-overflow-tooltip="true" />
        <el-table-column label="供应商" align="center" prop="supplierName" width="130" :show-overflow-tooltip="true" />
        <el-table-column label="合同金额" align="center" prop="totalAmount" width="100" />
        <el-table-column label="交货日期" align="center" prop="deliveryDate" width="110">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.deliveryDate, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="80">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="confirmContract(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openContractSelect = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPurchaseArrival, getPurchaseArrival, addPurchaseArrival, updatePurchaseArrival, delPurchaseArrival } from '@/api/scm/purchaseArrival'
import { listPurchaseContract, getPurchaseContract } from '@/api/scm/purchaseContract'

export default {
  name: 'PurchaseArrival',
  dicts: ['sys_arrival_status'],
  data() {
    return {
      loading: true,
      ids: [],
      multiple: true,
      showSearch: true,
      total: 0,
      arrivalList: [],
      title: '',
      open: false,
      dateRangeArrivalDate: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        arrivalNo: undefined,
        contractNo: undefined,
        supplierName: undefined,
        status: undefined
      },
      form: {},
      rules: {
        contractNo: [{ required: true, message: '请选择合同', trigger: 'change' }],
        arrivalDate: [{ required: true, message: '请选择到货日期', trigger: 'change' }]
      },
      // 供应商列表
      supplierList: [
        { supplierId: 1, supplierName: '博世汽车零部件' },
        { supplierId: 2, supplierName: '大陆集团' },
        { supplierId: 3, supplierName: '采埃孚传动系统' },
        { supplierId: 4, supplierName: '电装株式会社' },
        { supplierId: 5, supplierName: '麦格纳国际' }
      ],
      // 选择采购合同弹窗
      openContractSelect: false,
      contractLoading: false,
      contractQueryParams: { contractNo: undefined, pageNum: 1, pageSize: 100, applyStatus: '2' },
      contractList: []
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeArrivalDate, 'ArrivalDate')
      listPurchaseArrival(params).then(response => {
        this.arrivalList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.dateRangeArrivalDate = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.arrivalId)
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
      this.form.arrivalNo = 'PA-' + y + m + d + '-' + seq
      this.open = true
      this.title = '新增采购到货'
    },
    /** 修改 */
    handleUpdate(row) {
      this.reset()
      const arrivalId = row.arrivalId
      getPurchaseArrival(arrivalId).then(response => {
        this.form = response.data
        if (!this.form.detailList) {
          this.form.detailList = []
        }
        this.open = true
        this.title = '修改采购到货'
      })
    },
    /** 提交 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.arrivalId != null) {
            updatePurchaseArrival(this.form).then(() => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            if (!this.form.status) {
              this.form.status = '0'
            }
            addPurchaseArrival(this.form).then(() => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除 */
    handleDelete(row) {
      const arrivalIds = row.arrivalId ? [row.arrivalId] : this.ids
      this.$modal.confirm('是否确认删除采购到货编号为"' + arrivalIds + '"的数据项？').then(() => {
        return delPurchaseArrival(arrivalIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {})
    },
    /** 选择采购合同 */
    handleSelectContract() {
      this.contractQueryParams.contractNo = undefined
      this.contractQueryParams.pageNum = 1
      this.openContractSelect = true
      this.handleContractSearch()
    },
    handleContractSearch() {
      this.contractLoading = true
      listPurchaseContract(this.contractQueryParams).then(response => {
        this.contractList = response.rows
        this.contractLoading = false
      })
    },
    handleContractCurrentChange() {},
    /** 确认选择合同 */
    confirmContract(row) {
      this.form.contractNo = row.contractNo
      this.form.supplierName = row.supplierName
      this.form.contactPerson = row.contactPerson
      this.form.contactPhone = row.contactPhone
      // 根据合同ID获取合同明细，生成到货明细
      getPurchaseContract(row.contractId).then(response => {
        const contract = response.data
        const detailList = contract.detailList || []
        this.form.detailList = detailList.map((item, index) => ({
          detailId: undefined,
          arrivalId: undefined,
          seqNo: index + 1,
          materialName: item.productName,
          productModel: item.productModel,
          productSpec: item.productSpec,
          unit: item.unit,
          orderQuantity: item.orderQuantity,
          arrivalQuantity: item.orderQuantity,
          batchNo: undefined,
          remark: undefined
        }))
      })
      this.openContractSelect = false
    },
    /** 表单重置 */
    reset() {
      this.form = {
        arrivalId: undefined,
        arrivalNo: undefined,
        contractNo: undefined,
        supplierName: undefined,
        contactPerson: undefined,
        contactPhone: undefined,
        arrivalDate: undefined,
        status: undefined,
        remark: undefined,
        detailList: []
      }
      this.resetForm('form')
    },
    cancel() {
      this.open = false
      this.reset()
    }
  }
}
</script>
