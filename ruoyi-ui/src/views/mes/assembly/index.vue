
<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="作业名称" prop="homeworkName">
        <el-input
          v-model="queryParams.homeworkName"
          placeholder="请输入作业名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开始时间">
        <el-date-picker
          v-model="dateRangeStartTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间">
        <el-date-picker
          v-model="dateRangeEndTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="作业状态" prop="homeworkStatus">
        <el-select v-model="queryParams.homeworkStatus" placeholder="请选择作业状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_homework_status"
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
          v-hasPermi="['mes:HomeworkAssembly:add']"
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
          v-hasPermi="['mes:HomeworkAssembly:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['mes:HomeworkAssembly:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="assemblyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="assemblyId" width="60" />
      <el-table-column label="作业名称" align="center" prop="homeworkName" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="生产计划" align="center" prop="productionPlanCode" width="120" />
      <el-table-column label="计划排产" align="center" prop="schedulingCode" width="120" />
      <el-table-column label="产品名称" align="center" prop="productName" width="120" :show-overflow-tooltip="true" />
      <el-table-column label="型号" align="center" prop="productModel" width="100" />
      <el-table-column label="规格" align="center" prop="productSpec" width="100" />
      <el-table-column label="单位" align="center" prop="productUnit" width="60" />
      <el-table-column label="作业状态" align="center" prop="homeworkStatus" width="90">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_homework_status" :value="scope.row.homeworkStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="开始时间" align="center" prop="startTime" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" fixed="right" width="80">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['mes:HomeworkAssembly:edit']"
          >修改</el-button>
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
    <el-dialog :title="title" :visible.sync="open" width="680px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="140px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="作业名称" prop="homeworkName">
              <el-input v-model="form.homeworkName" placeholder="请输入作业名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="生产计划" prop="productionPlanCode">
              <el-input v-model="form.productionPlanCode" placeholder="请选择生产计划" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectPlan">选择</el-button>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="计划排产编号">
              <el-input v-model="form.schedulingCode" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="产品名称">
              <el-input v-model="form.productName" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="型号">
              <el-input v-model="form.productModel" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="规格">
              <el-input v-model="form.productSpec" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位">
              <el-input v-model="form.productUnit" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="生产数量" prop="productionQuantity">
              <el-input-number v-model="form.productionQuantity" :min="1" placeholder="请输入生产数量" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="作业状态" prop="homeworkStatus">
              <el-select v-model="form.homeworkStatus" placeholder="请选择作业状态" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.sys_homework_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="开始时间" prop="startTime">
              <el-date-picker
                v-model="form.startTime"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择开始时间"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <el-date-picker
                v-model="form.endTime"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择结束时间"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="生产作业物料信息备注" prop="materialRemark">
              <el-input v-model="form.materialRemark" type="textarea" :rows="4" placeholder="请输入生产作业物料信息备注" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
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
  </div>
</template>

<script>
import { listHomeworkAssembly, getHomeworkAssembly, addHomeworkAssembly, updateHomeworkAssembly, delHomeworkAssembly } from "@/api/mes/homeworkAssembly"

export default {
  name: "HomeworkAssembly",
  dicts: ['sys_homework_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 作业装配表格数据
      assemblyList: [],
      // 是否显示弹出层
      open: false,
      // 弹出层标题
      title: "",
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        homeworkName: undefined,
        homeworkStatus: undefined
      },
      // 开始时间范围
      dateRangeStartTime: [],
      // 结束时间范围
      dateRangeEndTime: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        homeworkName: [
          { required: true, message: "作业名称不能为空", trigger: "blur" }
        ],
        productionQuantity: [
          { required: true, message: "生产数量不能为空", trigger: "blur" }
        ]
      },
      // 选择生产计划排产弹窗
      openPlanSelect: false,
      planLoading: false,
      planList: []
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询作业装配列表 */
    getList() {
      this.loading = true
      let params = this.addDateRange(this.queryParams, this.dateRangeStartTime, "StartTime")
      params = this.addDateRange(params, this.dateRangeEndTime, "EndTime")
      listHomeworkAssembly(params).then(response => {
        this.assemblyList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRangeStartTime = []
      this.dateRangeEndTime = []
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.assemblyId)
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "新增作业装配"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const assemblyId = row.assemblyId
      getHomeworkAssembly(assemblyId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改作业装配"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.assemblyId != null) {
            updateHomeworkAssembly(this.form).then(() => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addHomeworkAssembly(this.form).then(() => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const assemblyIds = row.assemblyId ? [row.assemblyId] : this.ids
      this.$modal.confirm('是否确认删除作业装配编号为"' + assemblyIds + '"的数据项？').then(() => {
        return delHomeworkAssembly(assemblyIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('mes/HomeworkAssembly/export', {
        ...this.queryParams
      }, `homeworkAssembly_${new Date().getTime()}.xlsx`)
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
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        assemblyId: undefined,
        homeworkName: undefined,
        productionPlanCode: undefined,
        schedulingCode: undefined,
        productName: undefined,
        productModel: undefined,
        productSpec: undefined,
        productUnit: undefined,
        productionQuantity: undefined,
        startTime: undefined,
        endTime: undefined,
        homeworkStatus: "0",
        materialRemark: undefined,
        remark: undefined
      }
      this.resetForm("form")
    }
  }
}
</script>
