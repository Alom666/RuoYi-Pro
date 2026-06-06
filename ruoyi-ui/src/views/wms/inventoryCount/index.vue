<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="单据号" prop="countNo">
        <el-input v-model="queryParams.countNo" placeholder="请输入单据号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="物料" prop="materialName">
        <el-input v-model="queryParams.materialName" placeholder="请输入物料" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="仓库" prop="warehouseName">
        <el-input v-model="queryParams.warehouseName" placeholder="请输入仓库" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="库区" prop="locationArea">
        <el-input v-model="queryParams.locationArea" placeholder="请输入库区" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="库位" prop="locationNo">
        <el-input v-model="queryParams.locationNo" placeholder="请输入库位" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="批号" prop="batchNo">
        <el-input v-model="queryParams.batchNo" placeholder="请输入批号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="盘点类型" prop="countType">
        <el-select v-model="queryParams.countType" placeholder="请选择盘点类型" clearable>
          <el-option v-for="dict in wms_count_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="库存月份" prop="inventoryMonth">
        <el-date-picker v-model="queryParams.inventoryMonth" type="month" value-format="yyyy-MM" placeholder="选择月份" />
      </el-form-item>
      <el-form-item label="盘点日期">
        <el-date-picker v-model="daterangeCountDate" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" />
      </el-form-item>
      <el-form-item label="负责人" prop="responsiblePerson">
        <el-input v-model="queryParams.responsiblePerson" placeholder="请输入负责人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" @click="handleAdd" v-hasPermi="['wms:inventoryCount:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['wms:inventoryCount:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="inventoryCountList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="countId" width="70" />
      <el-table-column label="单据号" align="center" prop="countNo" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="物料" align="center" prop="materialName" width="110" :show-overflow-tooltip="true" />
      <el-table-column label="仓库" align="center" prop="warehouseName" width="100" :show-overflow-tooltip="true" />
      <el-table-column label="库区" align="center" prop="locationArea" width="80" :show-overflow-tooltip="true" />
      <el-table-column label="库位" align="center" prop="locationNo" width="90" :show-overflow-tooltip="true" />
      <el-table-column label="批号" align="center" prop="batchNo" width="110" :show-overflow-tooltip="true" />
      <el-table-column label="盘点类型" align="center" prop="countType" width="90">
        <template slot-scope="scope">
          <dict-tag :options="wms_count_type" :value="scope.row.countType" />
        </template>
      </el-table-column>
      <el-table-column label="库存月份" align="center" prop="inventoryMonth" width="100" />
      <el-table-column label="盘点日期" align="center" prop="countDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.countDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="负责人" align="center" prop="responsiblePerson" width="80" />
      <el-table-column label="现库存" align="center" prop="currentStock" width="80" />
      <el-table-column label="实际库存" align="center" prop="actualStock" width="80" />
      <el-table-column label="原因" align="center" prop="reason" min-width="120" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" width="140" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['wms:inventoryCount:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['wms:inventoryCount:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 新增/修改盘点信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="650px" append-to-body>
      <el-form ref="inventoryCountRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="单据号" prop="countNo">
          <el-input v-model="form.countNo" placeholder="请输入单据号" />
        </el-form-item>
        <el-form-item label="物料" prop="materialId">
          <el-row :gutter="10">
            <el-col :span="20">
              <el-input v-model="form.materialName" placeholder="请选择物料" readonly />
            </el-col>
            <el-col :span="4">
              <el-button type="primary" @click="handleSelectMaterial">选择</el-button>
            </el-col>
          </el-row>
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="仓库" prop="warehouseName">
              <el-input v-model="form.warehouseName" placeholder="自动带出" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="库区" prop="locationArea">
              <el-input v-model="form.locationArea" placeholder="自动带出" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="库位" prop="locationNo">
              <el-input v-model="form.locationNo" placeholder="自动带出" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="批号" prop="batchNo">
              <el-input v-model="form.batchNo" placeholder="自动带出" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="盘点类型" prop="countType">
              <el-select v-model="form.countType" placeholder="请选择盘点类型">
                <el-option v-for="dict in wms_count_type" :key="dict.value" :label="dict.label" :value="dict.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="库存月份" prop="inventoryMonth">
              <el-date-picker v-model="form.inventoryMonth" type="month" value-format="yyyy-MM" placeholder="选择月份" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="盘点日期" prop="countDate">
              <el-date-picker v-model="form.countDate" value-format="yyyy-MM-dd" type="date" placeholder="选择盘点日期" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="负责人" prop="responsiblePerson">
              <el-input v-model="form.responsiblePerson" placeholder="请输入负责人" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="现库存" prop="currentStock">
              <el-input-number v-model="form.currentStock" :min="0" controls-position="right" readonly style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="实际库存" prop="actualStock">
              <el-input-number v-model="form.actualStock" :min="0" controls-position="right" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="原因" prop="reason">
          <el-input v-model="form.reason" type="textarea" :rows="3" placeholder="请输入差异原因" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 物料选择对话框 -->
    <el-dialog title="选择物料" :visible.sync="materialOpen" width="700px" append-to-body>
      <el-form :model="materialQueryParams" ref="materialQueryRef" :inline="true" label-width="68px">
        <el-form-item label="物料名称" prop="materialName">
          <el-input v-model="materialQueryParams.materialName" placeholder="请输入物料名称" clearable @keyup.enter.native="handleMaterialQuery" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleMaterialQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" @click="resetMaterialQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table :data="materialList" @row-click="handleMaterialRowClick" highlight-current-row border style="width: 100%">
        <el-table-column label="物料ID" align="center" prop="materialId" width="80" />
        <el-table-column label="物料名称" align="center" prop="materialName" :show-overflow-tooltip="true" />
        <el-table-column label="仓库" align="center" prop="warehouseName" :show-overflow-tooltip="true" />
        <el-table-column label="库区" align="center" prop="locationArea" :show-overflow-tooltip="true" />
        <el-table-column label="库位" align="center" prop="locationNo" :show-overflow-tooltip="true" />
        <el-table-column label="批号" align="center" prop="batchNo" width="120" />
        <el-table-column label="库存" align="center" prop="currentStock" width="80" />
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="materialOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInventoryCount, getInventoryCount, addInventoryCount, updateInventoryCount, delInventoryCount } from "@/api/wms/inventoryCount";

export default {
  name: "InventoryCount",
  dicts: ['wms_count_type'],
  data() {
    return {
      inventoryCountList: [],
      open: false,
      loading: true,
      showSearch: true,
      ids: [],
      single: true,
      multiple: true,
      total: 0,
      title: "",
      daterangeCountDate: [],
      // 物料选择相关
      materialOpen: false,
      materialList: [],
      materialQueryParams: {
        materialName: undefined
      },
      // 模拟物料库存数据（实际应从物料库存接口获取）
      mockMaterialStockList: [
        { materialId: 1, materialName: '电子元件A', warehouseName: '主仓库', locationArea: 'A区', locationNo: 'A-01-01', batchNo: 'B20260601', currentStock: 500 },
        { materialId: 2, materialName: '机械零件B', warehouseName: '原材料仓', locationArea: 'B区', locationNo: 'B-02-03', batchNo: 'B20260515', currentStock: 200 },
        { materialId: 3, materialName: '芯片C', warehouseName: '主仓库', locationArea: 'A区', locationNo: 'A-03-02', batchNo: 'B20260420', currentStock: 1000 },
        { materialId: 4, materialName: '传感器D', warehouseName: '成品仓', locationArea: 'C区', locationNo: 'C-01-01', batchNo: 'B20260610', currentStock: 300 },
        { materialId: 5, materialName: '显示屏E', warehouseName: '成品仓', locationArea: 'C区', locationNo: 'C-02-01', batchNo: 'B20260301', currentStock: 80 }
      ],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        countNo: undefined,
        materialName: undefined,
        warehouseName: undefined,
        locationArea: undefined,
        locationNo: undefined,
        batchNo: undefined,
        countType: undefined,
        inventoryMonth: undefined,
        responsiblePerson: undefined
      },
      rules: {
        countNo: [{ required: true, message: "单据号不能为空", trigger: "blur" }],
        materialId: [{ required: true, message: "请选择物料", trigger: "change" }],
        inventoryMonth: [{ required: true, message: "库存月份不能为空", trigger: "change" }],
        actualStock: [{ required: true, message: "实际库存不能为空", trigger: "blur" }]
      },
      form: {}
    }
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询盘点信息列表 */
    getList() {
      this.loading = true;
      const params = { ...this.queryParams };
      if (this.daterangeCountDate && this.daterangeCountDate.length === 2) {
        params.params = params.params || {};
        params.params.beginCountDate = this.daterangeCountDate[0];
        params.params.endCountDate = this.daterangeCountDate[1];
      }
      listInventoryCount(params).then(response => {
        this.inventoryCountList = response.rows;
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
      this.daterangeCountDate = [];
      this.resetForm("queryRef");
      this.handleQuery();
    },
    /** 多选框选中数据 */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.countId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 重置表单 */
    reset() {
      this.form = {
        countId: undefined,
        countNo: undefined,
        materialId: undefined,
        materialName: undefined,
        warehouseName: undefined,
        locationArea: undefined,
        locationNo: undefined,
        batchNo: undefined,
        countType: undefined,
        inventoryMonth: undefined,
        countDate: undefined,
        responsiblePerson: undefined,
        currentStock: undefined,
        actualStock: undefined,
        reason: undefined,
        remark: undefined
      };
      this.resetForm("inventoryCountRef");
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增盘点信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const countId = row.countId || this.ids[0];
      getInventoryCount(countId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改盘点信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["inventoryCountRef"].validate(valid => {
        if (valid) {
          if (this.form.countId != undefined) {
            updateInventoryCount(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInventoryCount(this.form).then(response => {
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
      const countIds = row.countId || this.ids;
      this.$modal.confirm('是否确认删除盘点信息编号为"' + countIds + '"的数据项？').then(function() {
        return delInventoryCount(countIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 选择物料按钮 */
    handleSelectMaterial() {
      this.materialQueryParams.materialName = undefined;
      this.materialList = [...this.mockMaterialStockList];
      this.materialOpen = true;
    },
    /** 物料搜索 */
    handleMaterialQuery() {
      const keyword = this.materialQueryParams.materialName;
      if (keyword) {
        this.materialList = this.mockMaterialStockList.filter(item => item.materialName.includes(keyword));
      } else {
        this.materialList = [...this.mockMaterialStockList];
      }
    },
    /** 重置物料搜索 */
    resetMaterialQuery() {
      this.materialQueryParams.materialName = undefined;
      this.materialList = [...this.mockMaterialStockList];
    },
    /** 物料行点击 - 选中后自动带出仓库、库区、库位、批号、现库存 */
    handleMaterialRowClick(row) {
      this.form.materialId = row.materialId;
      this.form.materialName = row.materialName;
      this.form.warehouseName = row.warehouseName;
      this.form.locationArea = row.locationArea;
      this.form.locationNo = row.locationNo;
      this.form.batchNo = row.batchNo;
      this.form.currentStock = row.currentStock;
      this.materialOpen = false;
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    }
  }
}
</script>
