<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="仓库编码" prop="warehouseCode">
        <el-input
          v-model="queryParams.warehouseCode"
          placeholder="请输入仓库编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="仓库名称" prop="warehouseName">
        <el-input
          v-model="queryParams.warehouseName"
          placeholder="请输入仓库名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          @click="handleAdd"
          v-hasPermi="['wms:warehouse:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['wms:warehouse:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="warehouseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="warehouseId" width="80" />
      <el-table-column label="仓库编码" align="center" prop="warehouseCode" width="150" />
      <el-table-column label="仓库名称" align="center" prop="warehouseName" :show-overflow-tooltip="true" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="220" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-menu" @click="handleZone(scope.row)">库区</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['wms:warehouse:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['wms:warehouse:remove']">删除</el-button>
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

    <!-- 添加或修改仓库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="warehouseRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="仓库编码" prop="warehouseCode">
          <el-input v-model="form.warehouseCode" placeholder="请输入仓库编码" />
        </el-form-item>
        <el-form-item label="仓库名称" prop="warehouseName">
          <el-input v-model="form.warehouseName" placeholder="请输入仓库名称" />
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
  </div>
</template>

<script>
import { listWarehouse, getWarehouse, addWarehouse, updateWarehouse, delWarehouse } from "@/api/wms/warehouse";

export default {
  name: "Warehouse",
  data() {
    return {
      warehouseList: [],
      open: false,
      loading: true,
      showSearch: true,
      ids: [],
      single: true,
      multiple: true,
      total: 0,
      title: "",
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        warehouseCode: undefined,
        warehouseName: undefined
      },
      rules: {
        warehouseCode: [
          { required: true, message: "仓库编码不能为空", trigger: "blur" }
        ],
        warehouseName: [
          { required: true, message: "仓库名称不能为空", trigger: "blur" }
        ]
      },
      form: {}
    }
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询仓库信息列表 */
    getList() {
      this.loading = true;
      listWarehouse(this.queryParams).then(response => {
        this.warehouseList = response.rows;
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
      this.resetForm("queryRef");
      this.handleQuery();
    },
    /** 多选框选中数据 */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.warehouseId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 重置表单 */
    reset() {
      this.form = {
        warehouseId: undefined,
        warehouseCode: undefined,
        warehouseName: undefined,
        remark: undefined
      };
      this.resetForm("warehouseRef");
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增仓库信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const warehouseId = row.warehouseId || this.ids[0];
      getWarehouse(warehouseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改仓库信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["warehouseRef"].validate(valid => {
        if (valid) {
          if (this.form.warehouseId != undefined) {
            updateWarehouse(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWarehouse(this.form).then(response => {
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
      const warehouseIds = row.warehouseId || this.ids;
      this.$modal.confirm('是否确认删除仓库信息编号为"' + warehouseIds + '"的数据项？').then(function() {
        return delWarehouse(warehouseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 库区按钮操作 - 跳转到库区管理页面 */
    handleZone(row) {
      this.$router.push({ path: "/wms/warehouseZone", query: { warehouseId: row.warehouseId, warehouseName: row.warehouseName } });
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    }
  }
}
</script>
