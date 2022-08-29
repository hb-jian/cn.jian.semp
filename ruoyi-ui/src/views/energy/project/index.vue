<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="所属机构" prop="orgId">
        <el-input
          v-model="queryParams.orgId"
          placeholder="请点击此处选择机构"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入要查询的关键字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="能源类型" prop="energyType">
        <el-select v-model="queryParams.energyType" placeholder="能源类型" clearable>
          <el-option
            v-for="dict in dict.type.e_energy_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="建筑性质" prop="buildingType">
        <el-select v-model="queryParams.buildingType" placeholder="建筑性质" clearable>
          <el-option
            v-for="dict in dict.type.e_building_type"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['energy:project:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['energy:project:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['energy:project:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['energy:project:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="proList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column
        sortable
        fixed
        label="项目名称"
        align="center"
        prop="name"
        v-if="columns[0].visible"
      />
      <!-- <el-table-column label="项目编号" align="center" prop="id" />       -->
      <el-table-column
        label="所属机构"
        align="center"
        prop="orgName"
        sortable
        v-if="columns[1].visible"
      />
      <!-- <el-table-column label="状态" align="center" prop="启用">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>-->
      <el-table-column
        label="能源类型"
        align="center"
        prop="energyType"
        sortable
        v-if="columns[2].visible"
      >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.e_energy_type" :value="scope.row.energyType" />
        </template>
      </el-table-column>
      <el-table-column
        label="建筑性质"
        align="center"
        prop="buildingType"
        sortable
        v-if="columns[3].visible"
      >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.e_building_type" :value="scope.row.buildingType" />
        </template>
      </el-table-column>
      <el-table-column label="地理位置" align="center" v-if="columns[4].visible">
        <template slot-scope="scope">
          <span>{{ scope.row.location.address }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="竣工时间"
        align="center"
        prop="completionDate"
        sortable
        v-if="columns[5].visible"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.completionDate,'{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="投产时间"
        align="center"
        prop="timeToMarket"
        sortable
        v-if="columns[6].visible"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.timeToMarket,'{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="登记时间"
        align="center"
        prop="createTime"
        width="180"
        v-if="columns[7].visible"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        fixed="right"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['energy:project:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['energy:project:remove']"
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

    <!-- 添加或修改项目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <!-- <el-steps :active="step" finish-status="success">
        <el-step title="录入基本信息">-->

        <el-form-item label="所属机构" prop="orgId">
          <el-input v-model="form.orgId" placeholder="请点击此处选择机构" />
        </el-form-item>
        <el-form-item label="项目名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入项目名称" />
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="能源类型" prop="energyType">
              <el-select
                v-model="form.energyType"
                placeholder="请选择下拉选择"
                clearable
                :style="{width: '100%'}"
              >
                <el-option
                  v-for="dict in dict.type.e_energy_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="建筑性质" prop="buildingType">
              <!-- <template slot-scope="scope">
          <dict-tag :options="dict.type.e_building_type" :value="scope.row.buildingType"/>
              </template>-->
              <el-select
                v-model="form.buildingType"
                placeholder="请选择下拉选择"
                clearable
                :style="{width: '100%'}"
              >
                <el-option
                  v-for="dict in dict.type.e_building_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
        <el-form-item label="竣工时间" prop="completionDate">
          <el-date-picker
            v-model="form.completionDate"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
            :style="{width: '100%'}"
            placeholder="请选择日期"
            clearable
          ></el-date-picker>
        </el-form-item>
         </el-col>
          <el-col :span="12">
        <el-form-item label="投产时间" prop="timeToMarket">
          <el-date-picker
            v-model="form.timeToMarket"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
            :style="{width: '100%'}"
            placeholder="请选择日期"
            clearable
          ></el-date-picker>
        </el-form-item>
         </el-col>
        </el-row>
        <el-form-item label="项目位置" prop="location">
          <el-input v-model="form.location.address" type="textarea" placeholder="请填写项目位置" />
        </el-form-item>
        <!-- <el-form-item label="项目状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>

        <!-- </el-step>
        <el-step title="设置管理员帐号">-->

        <!-- <el-form-item label="帐号">
              <el-input v-model="form.account" placeholder="请输入帐号" />
            </el-form-item>
            <el-form-item label="密码">
              <el-input v-model="form.pwd" placeholder="请输入密码" />
            </el-form-item>
            <el-form-item label="密码确认">
              <el-input v-model="form.pwd" placeholder="请再次输入密码" />
            </el-form-item>
            <el-form-item label="昵称">
              <el-input v-model="form.nickName" placeholder="请输入用户昵称" />
        </el-form-item>-->
        <!-- </el-step>
        <el-step title="配置OPC采集参数">-->
        <!-- <el-form-item label="服务器ip">
              <el-input v-model="form.opcConfig.host" placeholder="请输入服务器ip" />
            </el-form-item>
            <el-form-item label="服务器port">
              <el-input v-model="form.opcConfig.host" placeholder="请输入服务器端口" />
        </el-form-item>-->
        <!-- </el-step>
        </el-steps>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <!-- <el-button style="margin-left: 12px;" @click="prev" v-if="this.step>0">上一步</el-button>
        <el-button style="margin-left: 12px;" @click="next" v-if="this.step<2">下一步</el-button>-->
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listPro,
  getPro,
  delPro,
  addPro,
  updatePro
} from "@/api/energy/project";

export default {
  name: "Project",
  dicts: ["sys_normal_disable", "e_energy_type", "e_building_type"],
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
      showSearch: false,
      // 总条数
      total: 0,
      // 项目表格数据
      proList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orgId: undefined,
        name: undefined,
        energyType: undefined,
        buildingType: undefined
      },
      // 列信息
      columns: [
        { key: 0, label: `项目名称`, visible: true },
        { key: 1, label: `所属机构`, visible: true },
        { key: 2, label: `能源类型`, visible: true },
        { key: 3, label: `建筑性质`, visible: true },
        { key: 4, label: `地理位置`, visible: true },
        { key: 5, label: `竣工时间`, visible: true },
        { key: 6, label: `投产时间`, visible: true },
        { key: 7, label: `登记时间`, visible: false }
      ],
      // 表单参数
      form: {
        location: {
          address: undefined
        },
        opcConfig: {
          clsid: undefined,
          host: undefined
        }
      },
      // 表单校验
      rules: {
        orgId: [
          { required: true, message: "所属机构不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "项目名称不能为空", trigger: "blur" }
        ],
        energyType: [
          { required: true, message: "能源类型不能为空", trigger: "blur" }
        ],
        buildingType: [
          { required: true, message: "建筑类型不能为空", trigger: "blur" }
        ],
        completionDate: [
          { required: true, message: "竣工时间不能为空", trigger: "blur" }
        ],
        timeToMarket: [
          { required: true, message: "投产时间不能为空", trigger: "blur" }
        ]
      },
      step: 0
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询项目列表 */
    getList() {
      this.loading = true;
      listPro(this.queryParams).then(response => {
        this.proList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        status: "0",
        remark: undefined,
        orgId: undefined,
        name: undefined,
        energyType: undefined,
        buildingType: undefined,
        location: {
          address: undefined
        },
        opcConfig: {
          clsid: undefined,
          host: undefined
        },
        step: 0
      };
      this.resetForm("form");
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
      this.ids = selection.map(item => item.id);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加项目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const proId = row.id || this.ids;
      getPro(proId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改项目";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.proId != undefined) {
            updatePro(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPro(this.form).then(response => {
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
      const proIds = row.proId || this.ids;
      this.$modal
        .confirm('是否确认删除项目编号为"' + proIds + '"的数据项？')
        .then(function() {
          return delPro(proIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/project/export",
        {
          ...this.queryParams
        },
        `post_${new Date().getTime()}.xlsx`
      );
    },
    next() {
      if (this.step < 2) this.step++;
    },
    prev() {
      if (this.step > 0) this.step--;
    }
  }
};
</script>
