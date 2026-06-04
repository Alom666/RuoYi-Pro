<template>
  <div class="app-container">
    <!-- 搜索区 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="物料名称" prop="materialName">
        <el-input
          v-model="queryParams.materialName"
          placeholder="请输入物料名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检验项目" prop="inspectionItem">
        <el-input
          v-model="queryParams.inspectionItem"
          placeholder="请输入检验项目"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检验类型" prop="inspectionType">
        <el-input
          v-model="queryParams.inspectionType"
          placeholder="请输入检验类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['mes:qualityStandard:add']"
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
          v-hasPermi="['mes:qualityStandard:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['mes:qualityStandard:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 表格 -->
    <el-table v-loading="loading" :data="qualityStandardList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="standardId" width="60" />
      <el-table-column label="物料名称" align="center" prop="materialName" :show-overflow-tooltip="true" />
      <el-table-column label="型号" align="center" prop="productModel" width="120" />
      <el-table-column label="规格" align="center" prop="productSpec" width="150" :show-overflow-tooltip="true" />
      <el-table-column label="单位" align="center" prop="unit" width="70" />
      <el-table-column label="检验项目" align="center" prop="inspectionItem" width="120" />
      <el-table-column label="检验类型" align="center" prop="inspectionType" width="100" />
      <el-table-column label="标准值上限" align="center" prop="standardUpper" width="110" />
      <el-table-column label="标准值下限" align="center" prop="standardLower" width="110" />
      <el-table-column label="操作" align="center" fixed="right" width="150">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['mes:qualityStandard:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['mes:qualityStandard:remove']"
          >删除</el-button>
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
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="110px">
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="物料名称" prop="materialName">
              <el-input v-model="form.materialName" placeholder="请选择物料" readonly>
                <el-button slot="append" icon="el-icon-search" @click="handleSelectMaterial">选择</el-button>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="型号">
              <el-input v-model="form.productModel" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="规格">
              <el-input v-model="form.productSpec" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="单位">
              <el-input v-model="form.unit" placeholder="自动回填" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="检验项目" prop="inspectionItem">
              <el-input v-model="form.inspectionItem" placeholder="请输入检验项目" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="检验类型" prop="inspectionType">
              <el-input v-model="form.inspectionType" placeholder="请输入检验类型" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="标准值上限" prop="standardUpper">
              <el-input-number v-model="form.standardUpper" :precision="2" :step="0.1" placeholder="请输入" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="标准值下限" prop="standardLower">
              <el-input-number v-model="form.standardLower" :precision="2" :step="0.1" placeholder="请输入" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择物料档案弹窗 -->
    <el-dialog title="选择物料档案" :visible.sync="materialOpen" width="900px" append-to-body>
      <el-container style="height: 450px">
        <!-- 左侧：物料分类树 -->
        <el-aside width="220px" style="border-right: 1px solid #e6e6e6; padding-right: 10px;">
          <el-tree
            :data="materialCategoryTree"
            :props="{ label: 'label', children: 'children' }"
            node-key="id"
            default-expand-all
            highlight-current
            @node-click="handleCategoryNodeClick"
          />
        </el-aside>
        <!-- 右侧：物料列表 -->
        <el-main style="padding: 0 0 0 15px;">
          <el-form :model="materialQueryParams" ref="materialQueryForm" size="small" :inline="true" label-width="70px">
            <el-form-item label="物料名称" prop="materialName">
              <el-input
                v-model="materialQueryParams.materialName"
                placeholder="请输入物料名称"
                clearable
                size="small"
                @keyup.enter.native="handleMaterialSearch"
              />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleMaterialSearch">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetMaterialQuery">重置</el-button>
            </el-form-item>
          </el-form>
          <el-table
            v-loading="materialLoading"
            :data="materialList"
            highlight-current-row
            @current-change="handleMaterialCurrentChange"
            height="340"
          >
            <el-table-column label="物料名称" align="center" prop="materialName" :show-overflow-tooltip="true" />
            <el-table-column label="型号" align="center" prop="productModel" width="120" />
            <el-table-column label="规格" align="center" prop="productSpec" width="140" :show-overflow-tooltip="true" />
            <el-table-column label="单位" align="center" prop="unit" width="70" />
          </el-table>
          <pagination
            v-show="materialTotal>0"
            :total="materialTotal"
            :page.sync="materialQueryParams.pageNum"
            :limit.sync="materialQueryParams.pageSize"
            @pagination="getMaterialList"
          />
        </el-main>
      </el-container>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmMaterial">确 定</el-button>
        <el-button @click="materialOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listQualityStandard, getQualityStandard, addQualityStandard, updateQualityStandard, delQualityStandard, exportQualityStandard } from "@/api/mes/qualityStandard";

export default {
  name: "QualityStandard",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 质检标准表格数据
      qualityStandardList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        materialName: null,
        inspectionItem: null,
        inspectionType: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        materialName: [
          { required: true, message: "物料名称不能为空", trigger: "change" }
        ],
        inspectionItem: [
          { required: true, message: "检验项目不能为空", trigger: "blur" }
        ],
        inspectionType: [
          { required: true, message: "检验类型不能为空", trigger: "blur" }
        ],
        standardUpper: [
          { required: true, message: "标准值上限不能为空", trigger: "blur" }
        ],
        standardLower: [
          { required: true, message: "标准值下限不能为空", trigger: "blur" }
        ]
      },
      // ===== 物料选择弹窗相关 =====
      materialOpen: false,
      materialLoading: false,
      materialList: [],
      materialTotal: 0,
      materialQueryParams: {
        pageNum: 1,
        pageSize: 10,
        materialName: null,
        categoryId: null
      },
      selectedMaterial: null,
      // 物料分类树数据
      materialCategoryTree: [
        {
          id: 0,
          label: "物料分类",
          children: [
            { id: 1, label: "原材料" },
            { id: 2, label: "半成品" },
            { id: 3, label: "成品" }
          ]
        }
      ]
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询质检标准列表 */
    getList() {
      this.loading = true;
      listQualityStandard(this.queryParams).then(response => {
        this.qualityStandardList = response.rows;
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.standardId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增质检标准";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const standardId = row.standardId || this.ids[0];
      getQualityStandard(standardId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改质检标准";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.standardId != null) {
            updateQualityStandard(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addQualityStandard(this.form).then(response => {
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
      const standardIds = row.standardId || this.ids;
      this.$modal.confirm('是否确认删除质检标准编号为"' + standardIds + '"的数据项？').then(() => {
        return delQualityStandard(standardIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('mes/qualityStandard/export', {
        ...this.queryParams
      }, `qualityStandard_${new Date().getTime()}.xlsx`);
    },
    // 表单重置
    reset() {
      this.form = {
        standardId: null,
        materialId: null,
        materialName: null,
        productModel: null,
        productSpec: null,
        unit: null,
        inspectionItem: null,
        inspectionType: null,
        standardUpper: null,
        standardLower: null,
        remark: null
      };
      this.resetForm("form");
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // ===== 物料选择相关方法 =====
    /** 打开物料选择弹窗 */
    handleSelectMaterial() {
      this.materialOpen = true;
      this.selectedMaterial = null;
      this.materialQueryParams.pageNum = 1;
      this.materialQueryParams.materialName = null;
      this.materialQueryParams.categoryId = null;
      this.getMaterialList();
    },
    /** 查询物料列表（模拟数据，实际项目替换为真实API） */
    getMaterialList() {
      this.materialLoading = true;
      // TODO: 替换为真实的物料档案API调用
      // import { listMaterial } from "@/api/mes/material";
      // listMaterial(this.materialQueryParams).then(response => { ... });
      // 以下为模拟数据
      const allData = [
        { materialId: 1, materialName: "铝合金板材", productModel: "AL-6061", productSpec: "2000×1000×3mm", unit: "张", categoryId: 1 },
        { materialId: 2, materialName: "不锈钢管材", productModel: "SUS-304", productSpec: "Φ25×2mm", unit: "根", categoryId: 1 },
        { materialId: 3, materialName: "铜线材", productModel: "CU-T2", productSpec: "Φ1.5mm", unit: "kg", categoryId: 1 },
        { materialId: 4, materialName: "碳钢板材", productModel: "Q235B", productSpec: "1500×6000×10mm", unit: "张", categoryId: 1 },
        { materialId: 5, materialName: "电机组件", productModel: "MJ-380", productSpec: "380V/5.5kW", unit: "台", categoryId: 2 },
        { materialId: 6, materialName: "减速机总成", productModel: "JS-100", productSpec: "1:50", unit: "台", categoryId: 2 },
        { materialId: 7, materialName: "成品电机", productModel: "Y2-132", productSpec: "7.5kW", unit: "台", categoryId: 3 },
        { materialId: 8, materialName: "成品减速机", productModel: "ZQ-250", productSpec: "1:40", unit: "台", categoryId: 3 }
      ];
      let filtered = allData;
      if (this.materialQueryParams.materialName) {
        filtered = filtered.filter(item => item.materialName.indexOf(this.materialQueryParams.materialName) !== -1);
      }
      if (this.materialQueryParams.categoryId) {
        filtered = filtered.filter(item => item.categoryId === this.materialQueryParams.categoryId);
      }
      this.materialTotal = filtered.length;
      const start = (this.materialQueryParams.pageNum - 1) * this.materialQueryParams.pageSize;
      const end = start + this.materialQueryParams.pageSize;
      this.materialList = filtered.slice(start, end);
      this.materialLoading = false;
    },
    /** 物料搜索 */
    handleMaterialSearch() {
      this.materialQueryParams.pageNum = 1;
      this.getMaterialList();
    },
    /** 物料搜索重置 */
    resetMaterialQuery() {
      this.materialQueryParams.pageNum = 1;
      this.materialQueryParams.materialName = null;
      this.materialQueryParams.categoryId = null;
      this.getMaterialList();
    },
    /** 物料分类树节点点击 */
    handleCategoryNodeClick(data) {
      this.materialQueryParams.categoryId = data.id === 0 ? null : data.id;
      this.materialQueryParams.pageNum = 1;
      this.getMaterialList();
    },
    /** 物料列表行选中 */
    handleMaterialCurrentChange(val) {
      this.selectedMaterial = val;
    },
    /** 确认选择物料 */
    confirmMaterial() {
      if (!this.selectedMaterial) {
        this.$modal.msgWarning("请选择一条物料记录");
        return;
      }
      this.form.materialId = this.selectedMaterial.materialId;
      this.form.materialName = this.selectedMaterial.materialName;
      this.form.productModel = this.selectedMaterial.productModel;
      this.form.productSpec = this.selectedMaterial.productSpec;
      this.form.unit = this.selectedMaterial.unit;
      this.materialOpen = false;
    }
  }
};
</script>
