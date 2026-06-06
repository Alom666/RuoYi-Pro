<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类编码" prop="categoryCode">
        <el-input
          v-model="queryParams.categoryCode"
          placeholder="请输入分类编码"
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
          v-hasPermi="['wms:materialCategory:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="categoryList"
      row-key="categoryId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="分类编码" prop="categoryCode" width="200" />
      <el-table-column label="分类名称" prop="categoryName" width="200" />
      <el-table-column label="说明" prop="description" :show-overflow-tooltip="true" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['wms:materialCategory:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-plus" @click="handleAdd(scope.row)" v-hasPermi="['wms:materialCategory:add']">新增</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['wms:materialCategory:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改物料分类对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="categoryRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="父级分类" prop="parentId">
          <el-tree-select
            v-model="form.parentId"
            :data="categoryOptions"
            :props="{ value: 'id', label: 'label', children: 'children' }"
            value-key="id"
            placeholder="选择上级分类"
            check-strictly
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item label="分类编码" prop="categoryCode">
          <el-input v-model="form.categoryCode" placeholder="请输入分类编码" />
        </el-form-item>
        <el-form-item label="分类名称" prop="categoryName">
          <el-input v-model="form.categoryName" placeholder="请输入分类名称" />
        </el-form-item>
        <el-form-item label="说明" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入说明" />
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
import { listMaterialCategory, treeMaterialCategory, getMaterialCategory, addMaterialCategory, updateMaterialCategory, delMaterialCategory, treeselect } from "@/api/wms/materialCategory";

export default {
  name: "MaterialCategory",
  data() {
    return {
      categoryList: [],
      categoryOptions: [],
      loading: true,
      showSearch: true,
      title: "",
      open: false,
      isExpandAll: true,
      refreshTable: true,
      queryParams: {
        categoryCode: undefined
      },
      rules: {
        categoryCode: [
          { required: true, message: "分类编码不能为空", trigger: "blur" }
        ],
        categoryName: [
          { required: true, message: "分类名称不能为空", trigger: "blur" }
        ]
      },
      form: {}
    }
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询物料分类列表 */
    getList() {
      this.loading = true;
      treeMaterialCategory(this.queryParams).then(response => {
        this.categoryList = response.data;
        this.loading = false;
      });
    },
    /** 查询物料分类下拉树结构 */
    getTreeselect() {
      treeselect().then(response => {
        this.categoryOptions = [];
        const data = { id: 0, label: "顶级分类", children: [] };
        data.children = response.data;
        this.categoryOptions.push(data);
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryRef");
      this.handleQuery();
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 重置表单 */
    reset() {
      this.form = {
        categoryId: undefined,
        parentId: 0,
        categoryCode: undefined,
        categoryName: undefined,
        description: undefined,
        remark: undefined
      };
      this.resetForm("categoryRef");
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != undefined && row.categoryId) {
        this.form.parentId = row.categoryId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "新增物料分类";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      getMaterialCategory(row.categoryId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改物料分类";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["categoryRef"].validate(valid => {
        if (valid) {
          if (this.form.categoryId != undefined) {
            updateMaterialCategory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMaterialCategory(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除物料分类"' + row.categoryName + '"的数据项？').then(function() {
        return delMaterialCategory(row.categoryId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    }
  }
}
</script>
