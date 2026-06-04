
<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="退货单号" prop="returnNo">
        <el-input v-model="queryParams.returnNo" placeholder="请输入退货单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="发货单号" prop="deliveryNo">
        <el-input v-model="queryParams.deliveryNo" placeholder="请输入发货单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="合同编号" prop="contractNo">
        <el-input v-model="queryParams.contractNo" placeholder="请输入合同编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="客户名称" prop="customerName">
        <el-select v-model="queryParams.customerName" placeholder="请选择客户" clearable filterable>
          <el-option v-for="item in customerOptions" :key="item.customerName" :label="item.customerName" :value="item.customerName" />
        </el-select>
      </el-form-item>
      <el-form-item label="退货日期">
        <el-date-picker v-model="dateRangeReturnDate" style="width: 207.22px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="入库状态" prop="inboundStatus">
        <el-select v-model="queryParams.inboundStatus" placeholder="请选择" clearable>
          <el-option v-for="dict in dict.type.sys_inbound_status" :key="dict.value" :label="dict.label" :value="dict.value" />
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
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['scm:salesReturn:add']">新建</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['scm:salesReturn:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="salesReturnList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="returnId" width="60" />
      <el-table-column label="退货单号" align="center" prop="returnNo" width="160" :show-overflow-tooltip="true" />
      <el-table-column label="发货单号" align="center" prop="deliveryNo" width="160" :show-overflow-tooltip="true" />
      <el-table-column label="合同编号" align="center" prop="contractNo" width="140" :show-overflow-tooltip="true" />
      <el-table-column label="客户名称" align="center" prop="customerName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="退货日期" align="center" prop="returnDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.returnDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="退款金额" align="center" prop="refundAmount" width="110" />
      <el-table-column label="入库状态" align="center" prop="inboundStatus" width="90">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_inbound_status" :value="scope.row.inboundStatus" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="150">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['scm:salesReturn:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['scm:salesReturn:remove']">删除</el-button>
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
            <el-form-item label="发货单号" prop="deliveryNo">
              <el-input v-model="form.deliveryNo" placeholder="请选择发货单" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectDelivery"></el-button>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="退货日期" prop="returnDate">
              <el-date-picker v-model="form.returnDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择退货日期" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="退款金额" prop="refundAmount">
              <el-input v-model="form.refundAmount" placeholder="自动计算" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="合同编号">
              <el-input v-model="form.contractNo" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户名称">
              <el-input v-model="form.customerName" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="送货方式">
              <el-input v-model="form.deliveryMethod" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="交货日期">
              <el-input v-model="form.deliveryDate" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="联系人">
              <el-input v-model="form.contactPerson" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="联系电话">
              <el-input v-model="form.contactPhone" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="16">
            <el-form-item label="收货地址">
              <el-input v-model="form.deliveryAddress" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="退货原因" prop="returnReason">
              <el-input v-model="form.returnReason" placeholder="请输入退货原因" />
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>

        <!-- 分割线 -->
        <el-divider content-position="left">退货明细</el-divider>

        <!-- 下半部分：退货明细表格 -->
        <el-table :data="form.detailList" border style="width: 100%">
          <el-table-column label="序号" type="index" width="60" align="center" />
          <el-table-column label="物料" align="center" prop="materialName" min-width="140" :show-overflow-tooltip="true" />
          <el-table-column label="型号" align="center" prop="productModel" width="110" />
          <el-table-column label="规格" align="center" prop="productSpec" width="110" />
          <el-table-column label="单位" align="center" prop="unit" width="70" />
          <el-table-column label="价格" align="center" prop="price" width="100" />
          <el-table-column label="订货数量" align="center" prop="orderQuantity" width="90" />
          <el-table-column label="发货数量" align="center" prop="deliveryQuantity" width="90" />
          <el-table-column label="退货数量" align="center" width="130">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.returnQuantity" :min="0" :max="scope.row.deliveryQuantity" :precision="0" size="small" style="width: 100%" controls-position="right" @change="calcRefundAmount" />
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

    <!-- 选择发货单弹窗 -->
    <el-dialog title="选择发货单" :visible.sync="openDeliverySelect" width="900px" append-to-body>
      <el-form :inline="true" size="small">
        <el-form-item label="发货单号">
          <el-input v-model="deliveryQueryParams.deliveryNo" placeholder="请输入发货单号" clearable @keyup.enter.native="handleDeliverySearch" />
        </el-form-item>
        <el-form-item label="客户名称">
          <el-input v-model="deliveryQueryParams.customerName" placeholder="请输入客户名称" clearable @keyup.enter.native="handleDeliverySearch" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleDeliverySearch">搜索</el-button>
        </el-form-item>
      </el-form>
      <el-table :data="filteredDeliveryList" v-loading="deliveryLoading" height="350" highlight-current-row @current-change="handleDeliveryCurrentChange">
        <el-table-column label="发货单号" align="center" prop="deliveryNo" width="160" :show-overflow-tooltip="true" />
        <el-table-column label="合同编号" align="center" prop="contractNo" width="140" :show-overflow-tooltip="true" />
        <el-table-column label="客户名称" align="center" prop="customerName" :show-overflow-tooltip="true" />
        <el-table-column label="送货方式" align="center" prop="deliveryMethod" width="100" />
        <el-table-column label="交货日期" align="center" prop="deliveryDate" width="110" />
        <el-table-column label="联系人" align="center" prop="contactPerson" width="90" />
        <el-table-column label="联系电话" align="center" prop="contactPhone" width="120" />
        <el-table-column label="操作" align="center" width="80">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="confirmDelivery(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openDeliverySelect = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSalesReturn, getSalesReturn, addSalesReturn, updateSalesReturn, delSalesReturn } from '@/api/scm/salesReturn'

export default {
  name: 'SalesReturn',
  dicts: ['sys_inbound_status'],
  data() {
    return {
      loading: true,
      ids: [],
      multiple: true,
      showSearch: true,
      total: 0,
      salesReturnList: [],
      title: '',
      open: false,
      dateRangeReturnDate: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        returnNo: undefined,
        deliveryNo: undefined,
        contractNo: undefined,
        customerName: undefined,
        inboundStatus: undefined
      },
      form: {},
      rules: {
        deliveryNo: [{ required: true, message: '请选择发货单', trigger: 'change' }],
        returnDate: [{ required: true, message: '请选择退货日期', trigger: 'change' }]
      },
      // 客户下拉选项
      customerOptions: [
        { customerName: '华东汽车集团' },
        { customerName: '南方新能源科技' },
        { customerName: '北方重工机械' },
        { customerName: '西部动力系统' },
        { customerName: '中原零部件制造' }
      ],
      // 选择发货单弹窗
      openDeliverySelect: false,
      deliveryLoading: false,
      deliveryQueryParams: { deliveryNo: undefined, customerName: undefined },
      filteredDeliveryList: [],
      // 模拟发货单数据
      allDeliveryList: [
        {
          deliveryNo: 'DL-20260601-0001', contractNo: 'HT-2026-001', customerName: '华东汽车集团',
          deliveryMethod: '公路运输', deliveryDate: '2026-07-15', deliveryAddress: '上海市浦东新区张江路88号',
          contactPerson: '张伟', contactPhone: '13800001111',
          detailList: [
            { materialName: '汽油发动机', productModel: 'EA888', productSpec: '2.0T/162kW', unit: '台', price: 35000, orderQuantity: 2, deliveryQuantity: 2 },
            { materialName: '前副车架', productModel: 'MQB-A', productSpec: '钢制/焊接', unit: '件', price: 4500, orderQuantity: 2, deliveryQuantity: 2 },
            { materialName: '后桥总成', productModel: 'R-Axle-01', productSpec: '承载1.5T', unit: '件', price: 6800, orderQuantity: 2, deliveryQuantity: 2 }
          ]
        },
        {
          deliveryNo: 'DL-20260602-0002', contractNo: 'HT-2026-002', customerName: '南方新能源科技',
          deliveryMethod: '铁路运输', deliveryDate: '2026-07-20', deliveryAddress: '深圳市南山区科技园路66号',
          contactPerson: '李娜', contactPhone: '13900002222',
          detailList: [
            { materialName: '三元锂电池包', productModel: 'NE-75', productSpec: '75kWh/350V', unit: '组', price: 65000, orderQuantity: 2, deliveryQuantity: 2 },
            { materialName: '驱动电机', productModel: 'EM-150', productSpec: '150kW/永磁', unit: '台', price: 12000, orderQuantity: 1, deliveryQuantity: 1 },
            { materialName: 'MCU控制器', productModel: 'MCU-01', productSpec: '400V/IGBT', unit: '个', price: 8500, orderQuantity: 2, deliveryQuantity: 2 }
          ]
        },
        {
          deliveryNo: 'DL-20260603-0003', contractNo: 'HT-2026-003', customerName: '北方重工机械',
          deliveryMethod: '公路运输', deliveryDate: '2026-08-01', deliveryAddress: '沈阳市铁西区重工街120号',
          contactPerson: '王强', contactPhone: '13700003333',
          detailList: [
            { materialName: '双离合变速箱', productModel: 'DQ381', productSpec: '7速/380Nm', unit: '台', price: 28000, orderQuantity: 2, deliveryQuantity: 2 },
            { materialName: '涡轮增压器', productModel: 'TC-28', productSpec: '28mm/单涡管', unit: '件', price: 5200, orderQuantity: 2, deliveryQuantity: 2 }
          ]
        },
        {
          deliveryNo: 'DL-20260605-0004', contractNo: 'HT-2026-004', customerName: '西部动力系统',
          deliveryMethod: '海运', deliveryDate: '2026-08-10', deliveryAddress: '成都市高新区天府大道200号',
          contactPerson: '赵敏', contactPhone: '13600004444',
          detailList: [
            { materialName: '汽油发动机', productModel: 'EA888', productSpec: '2.0T/162kW', unit: '台', price: 35000, orderQuantity: 3, deliveryQuantity: 3 },
            { materialName: 'MCU控制器', productModel: 'MCU-01', productSpec: '400V/IGBT', unit: '个', price: 8500, orderQuantity: 5, deliveryQuantity: 5 }
          ]
        },
        {
          deliveryNo: 'DL-20260608-0005', contractNo: 'HT-2026-005', customerName: '中原零部件制造',
          deliveryMethod: '公路运输', deliveryDate: '2026-08-15', deliveryAddress: '郑州市中原区建设路50号',
          contactPerson: '陈磊', contactPhone: '13500005555',
          detailList: [
            { materialName: '前副车架', productModel: 'MQB-A', productSpec: '钢制/焊接', unit: '件', price: 4500, orderQuantity: 10, deliveryQuantity: 10 },
            { materialName: '后桥总成', productModel: 'R-Axle-01', productSpec: '承载1.5T', unit: '件', price: 6800, orderQuantity: 8, deliveryQuantity: 8 }
          ]
        }
      ]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeReturnDate, 'ReturnDate')
      listSalesReturn(params).then(response => {
        this.salesReturnList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.dateRangeReturnDate = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.returnId)
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
      this.form.returnNo = 'SR-' + y + m + d + '-' + seq
      this.open = true
      this.title = '新增销售退货'
    },
    /** 修改 */
    handleUpdate(row) {
      this.reset()
      const returnId = row.returnId
      getSalesReturn(returnId).then(response => {
        this.form = response.data
        if (!this.form.detailList) {
          this.form.detailList = []
        }
        this.open = true
        this.title = '修改销售退货'
      })
    },
    /** 提交：inboundStatus=0保存(未入库)，inboundStatus=1提交(入库中) */
    submitForm(inboundStatus) {
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.inboundStatus = inboundStatus
          if (this.form.returnId != null) {
            updateSalesReturn(this.form).then(() => {
              this.$modal.msgSuccess(inboundStatus === '1' ? '提交成功' : '保存成功')
              this.open = false
              this.getList()
            })
          } else {
            addSalesReturn(this.form).then(() => {
              this.$modal.msgSuccess(inboundStatus === '1' ? '提交成功' : '保存成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除 */
    handleDelete(row) {
      const returnIds = row.returnId ? [row.returnId] : this.ids
      this.$modal.confirm('是否确认删除销售退货编号为"' + returnIds + '"的数据项？').then(() => {
        return delSalesReturn(returnIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {})
    },
    /** 计算退款金额 = Σ(退货数量 × 单价) */
    calcRefundAmount() {
      let total = 0
      this.form.detailList.forEach(item => {
        if (item.returnQuantity != null && item.price != null) {
          total += item.returnQuantity * item.price
        }
      })
      this.form.refundAmount = parseFloat(total.toFixed(2))
    },
    // ========== 选择发货单 ==========
    handleSelectDelivery() {
      this.deliveryQueryParams.deliveryNo = undefined
      this.deliveryQueryParams.customerName = undefined
      this.filteredDeliveryList = [...this.allDeliveryList]
      this.openDeliverySelect = true
    },
    handleDeliverySearch() {
      const no = this.deliveryQueryParams.deliveryNo
      const name = this.deliveryQueryParams.customerName
      this.filteredDeliveryList = this.allDeliveryList.filter(item => {
        let match = true
        if (no) match = match && item.deliveryNo.indexOf(no) !== -1
        if (name) match = match && item.customerName.indexOf(name) !== -1
        return match
      })
    },
    handleDeliveryCurrentChange() {},
    confirmDelivery(row) {
      this.form.deliveryNo = row.deliveryNo
      this.form.contractNo = row.contractNo
      this.form.customerName = row.customerName
      this.form.deliveryMethod = row.deliveryMethod
      this.form.deliveryDate = row.deliveryDate
      this.form.deliveryAddress = row.deliveryAddress
      this.form.contactPerson = row.contactPerson
      this.form.contactPhone = row.contactPhone
      // 根据发货单明细生成退货明细
      this.form.detailList = (row.detailList || []).map((item, index) => ({
        detailId: undefined,
        returnId: undefined,
        seqNo: index + 1,
        materialName: item.materialName,
        productModel: item.productModel,
        productSpec: item.productSpec,
        unit: item.unit,
        price: item.price,
        orderQuantity: item.orderQuantity,
        deliveryQuantity: item.deliveryQuantity,
        returnQuantity: 0,
        remark: undefined
      }))
      this.calcRefundAmount()
      this.openDeliverySelect = false
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        returnId: undefined,
        returnNo: undefined,
        deliveryNo: undefined,
        contractNo: undefined,
        customerName: undefined,
        returnDate: undefined,
        refundAmount: undefined,
        inboundStatus: '0',
        returnReason: undefined,
        deliveryMethod: undefined,
        deliveryDate: undefined,
        deliveryAddress: undefined,
        contactPerson: undefined,
        contactPhone: undefined,
        remark: undefined,
        detailList: []
      }
      this.resetForm('form')
    }
  }
}
</script>
