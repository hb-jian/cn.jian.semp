<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--项目数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="filterText"
            placeholder="请输入项目名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="projectTree"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--设备数据-->
      <el-col :span="20" :xs="24">
        <el-form
          :model="queryParams"
          ref="queryForm"
          size="small"
          :inline="true"
          v-show="showSearch"
          label-width="68px"
        >
          <el-form-item label="设备名称" prop="devName">
            <el-input
              v-model="queryParams.devName"
              placeholder="请输入设备名称"
              clearable
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-select
              v-model="queryParams.status"
              placeholder="设备状态"
              clearable
              style="width: 240px"
            >
              <el-option
                v-for="dict in dict.type.e_device_status"
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
              v-hasPermi="['energy:device:create']"
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
              v-hasPermi="['energy:device:edit']"
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
              v-hasPermi="['energy:device:remove']"
            >删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="warning"
              plain
              icon="el-icon-download"
              size="mini"
              @click="handleExport"
              v-hasPermi="['energy:device:export']"
            >导出</el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="devList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="50" align="center" />
          <!-- <el-table-column
            label="设备编号"
            align="center"
            key="id"
            prop="id"
            v-if="columns[0].visible"
          /> -->
          <el-table-column
            label="设备名称"
            align="center"
            key="name"
            prop="name"
            v-if="columns[1].visible"
            :show-overflow-tooltip="true"
          />
          <!-- <el-table-column label="用户昵称" align="center" key="nickName" prop="nickName" v-if="columns[2].visible" :show-overflow-tooltip="true" />
          <el-table-column label="部门" align="center" key="deptName" prop="dept.deptName" v-if="columns[3].visible" :show-overflow-tooltip="true" />
          <el-table-column label="手机号码" align="center" key="phonenumber" prop="phonenumber" v-if="columns[4].visible" width="120" />-->
          <el-table-column label="所属项目" align="center" prop="projectId" v-if="columns[2].visible" >          
            <template slot-scope="scope">
              <span>{{ getProName(scope.row.projectId) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="运行状态" align="center" key="status" v-if="columns[3].visible">
            <template slot-scope="scope">
              <dict-tag :options="dict.type.e_device_status" :value="scope.row.status" />
            </template>
          </el-table-column>
          <el-table-column
            label="登记时间"
            align="center"
            prop="createTime"
            v-if="columns[4].visible"
            width="160"
          >
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.createTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            width="160"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['energy:device:edit']"
              >修改</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['energy:device:remove']"
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
      </el-col>
    </el-row>

    <!-- 添加或修改设备对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="所属项目" prop="projectId">
              <treeselect
                v-model="form.projectId"
                :options="projectTree"
                :show-count="true"
                :disable-branch-nodes="true"                
                placeholder="请选择项目"
              />
            </el-form-item>
            <!-- <el-form-item label="设备编号" prop="devId">
              <el-input v-model="form.devId" placeholder="请输入设备编号" maxlength="30" />
            </el-form-item> -->
            <el-form-item label="设备名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入设备名称" maxlength="30" />
            </el-form-item>
            <el-form-item label="采集指标">
              <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleOpcItemSetDialog(null)">设置采集指标</el-button>
            </el-form-item>
            <el-form-item>
              <el-table :data="form.dataItems" style="width: 100%; height:250px;">
                <el-table-column  prop="name" label="名称"  width="100">
                </el-table-column>
                <el-table-column  prop="kepIdStr" label="Kep编号"  width="150">
                </el-table-column>
                <el-table-column  prop="mergeRule"  label="合并规则"  width="100">
                </el-table-column>
                <el-table-column  label="操作"  width="120">
                  <template slot-scope="scope">
                    <el-button
                      size="mini"
                      type="text"
                      icon="el-icon-edit"
                      @click="handleOpcItemSetDialog(scope.row)"                     
                    >修改</el-button>
                    <el-button
                      size="mini"
                      type="text"
                      icon="el-icon-delete"
                      @click="handleOpcItemDel(scope.row)"                      
                    >删除</el-button>
                  </template>
                </el-table-column>
              </el-table>
            </el-form-item>
            <el-form-item label="备注">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"></el-input>
            </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

      <el-dialog title="设置采集指标" :visible.sync="opcAddDialogVisible">
        <el-form ref="newOpcForm" :model="newOpcItem" :rules="opcItemRules">          
          <el-form-item label="指标类型" label-width="100px" prop="itemType">
            <el-select v-model="newOpcItem.itemType" placeholder="请选择指标类型">
              <el-option
                  v-for="dict in dict.type.e_device_itemtype"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="指标名称" label-width="100px" prop="name">
            <el-input v-model="newOpcItem.name" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Kep编号" label-width="100px" prop="kepIds">
            <el-input type="textarea" autosize v-model="newOpcItem.kepIdStr" autocomplete="off" placeholder="请输入采标指标编号，支持多个编号输入，采用逗号进行分隔"></el-input>
          </el-form-item>
          <el-form-item label="合并规则" label-width="100px" prop="mergyRule">
            <el-select v-model="newOpcItem.mergyRule" placeholder="请选择数据合并规则">
              <el-option
                  v-for="dict in dict.type.e_device_mergyrule"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
            </el-select>
          </el-form-item>          
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="handleOpcItemSetDialogCancel()">取 消</el-button>
          <el-button type="primary" @click="handleOpcItemSet(newOpcItem)">确 定</el-button>
        </div>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
import { listOrg } from "@/api/system/org";
import { listPro } from "@/api/energy/project";
import {
  listDev,
  getDev,
  delDev,
  addDev,
  updateDev,
  statusDev
} from "@/api/energy/device";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Device",
  dicts: ["e_device_status","e_device_itemtype","e_device_mergyrule"],
  components: { Treeselect },
  data() {
    return {
      //opc添加对话框可见性
      opcAddDialogVisible: false,
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
      // 项目筛选文本
      filterText: "",
      // 设备表格数据
      devList: null,
      // 设备编号列表
      devIds: [],
      // 弹出层标题
      title: "",
      // 项目数据树
      projectTree: [], 
      //项目列表 
      projects:[],    
      // 定时器
      statusTimer: null,
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 表单参数
      form: {
        dataItems:[]
      },
      //OPC指标项
      newOpcItem:{
        name:null,
        kepIds:null,
        mergeRule:null,
        itemType:null
      },
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        //name: undefined,
        proId: undefined,
        status: undefined
      },
      // 列信息
      columns: [
        { key: 0, label: `设备编号`, visible: false },
        { key: 1, label: `设备名称`, visible: true },
        { key: 2, label: `所属项目`, visible: true },
        { key: 3, label: `运行状态`, visible: true },
        { key: 4, label: `登记时间`, visible: true }
      ],
      // 表单校验
      rules: {
        // devId: [
        //   { required: true, message: "设备编号不能为空", trigger: "blur" },
        //   {
        //     min: 2,
        //     max: 20,
        //     message: "设备编号长度必须介于 2 和 20 之间",
        //     trigger: "blur"
        //   }
        // ],
        projectId: [
          { required: true, message: "所属项目不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "设备名称不能为空", trigger: "blur" }
        ],
        dataItems: [
          { required: true, message: "采集指标不能为空", trigger: "blur" }
        ]
      },
      opcItemRules: {
        itemType: [
          { required: true, message: "采集数据类型不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "采集项目名称不能为空", trigger: "blur" }
        ],
        kepIdStr: [
          { required: true, message: "数据编号不能为空", trigger: "blur" }
        ],
        mergyRule: [
          { required: true, message: "数据合并规则不能为空", trigger: "blur" }
        ]
      }
    };
  },
  watch: {
    // 根据名称筛选项目树
    filterText(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getTreeselect();
    this.getList();    
  },
  destroyed() {
    this.stopTimer();
  },
  methods: {
    /** 查询设备列表 */
    getList() {
      this.loading = true;
      listDev(this.addDateRange(this.queryParams, this.dateRange)).then(
        response => {
          this.devIds = [];
          response.rows.forEach(data => {
            data.status = "";
            this.devIds.push(data.id);
          });
          this.devList = response.rows;
          this.total = response.total;
          this.loading = false;

          //刷新状态
          this.refreshStatus();
        }
      );

      //启动状态定时刷新任务
      this.startTimer();
    },
    /** 查询项目树结构 */
    getTreeselect() {
      this.projectTree = [];
      //获取机构列表
      let orgs = [];
      listOrg().then(res => {
        orgs = res.rows;

        listPro().then(res => {
          this.projects = res.rows;
          //构建项目树
          orgs.forEach(org => {
            let orgNode = {
              id: org.orgId,
              label: org.name,               
              type: "org",
              children: []
            };

            this.projects.forEach(pro => {
              if (pro.orgId == org.orgId) {
                let proNode = {
                  id: pro.id,
                  label: pro.name,                  
                  orgId: org.orgId,  
                  type: "pro"
                };

                orgNode.children.push(proNode);                
              }
            });

            if (orgNode.children.length > 0) {              
              this.projectTree.push(orgNode);              
            }
          });
        });
      });
    },
    getProName(proId){
      let name = '';
      let pro = this.projects.find(pro=>pro.id == proId);
      if(pro){
        name = pro.name;
      }
      return name;
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.lable.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      if(data.type == "org"){
        this.queryParams.proId = undefined;
        this.queryParams.orgId = data.id;
      }else if(data.type == "pro"){
        this.queryParams.proId = data.id;
        this.queryParams.orgId = data.orgId;
      }      
      this.handleQuery();
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        devId: undefined,
        devName: undefined,
        projectId: this.queryParams.proId,
        orgId: this.queryParams.orgId,
        status: "0",
        dataItems:[],
        remark: undefined
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
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.userId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加设备";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {      
      const devId = row.id || this.ids;
      getDev(devId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "编辑设备信息";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.devId != undefined) {
            updateDev(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDev(this.form).then(response => {
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
      const dIds = row.devId || this.ids;
      this.$modal
        .confirm('是否确认删除编号为"' + dIds + '"的数据项？')
        .then(function() {
          return delDev(dIds);
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
        "energy/device/export",
        {
          ...this.queryParams
        },
        `post_${new Date().getTime()}.xlsx`
      );
    },
    /** 刷新列表状态 */
    refreshStatus() {
      let tmpIds = this.devIds;
      if (tmpIds && tmpIds.length > 0) {
        statusDev(tmpIds).then(res => {
          res.data.forEach(s => {
            this.devList.forEach(d => {
              if (d.id == s.id) {
                if (s.status == "online") {
                  d.status = "1";
                } else {
                  d.status = "2";
                }
                return;
              }
            });
          });
        });
      }
    },
    /** 启动定时任务 */
    startTimer() {
      if (!this.statusTimer) {
        this.statusTimer = setInterval(() => this.refreshStatus(), 10000);
      }
    },
    /** 停止定时任务 */
    stopTimer() {
      clearInterval(this.statusTimer);
    },
    /** OPC新增对话框 */
    handleOpcItemSetDialog(opcItem) {       
      this.opcAddDialogVisible = true;
      
      if(opcItem){
        this.newOpcItem = opcItem
      }else{
        this.newOpcItem = {       
        name:null,
        kepIdStr:null,
        kepIds:[],
        mergyRule:null,
        itemType:null
        }      
      }
    },
    /** OPC新增按钮操作 */
    handleOpcItemSet(opcItem) {
      this.$refs["newOpcForm"].validate(valid => {
        if(!valid){
          return;
        }        
        
        opcItem.kepIds = opcItem.kepIdStr.split('\n')
        if(!opcItem.id){
          opcItem.id = Date.now();
          
          this.form.dataItems.push(opcItem);
        } 
        console.log(opcItem)
        this.opcAddDialogVisible = false;
      })
    },
    /** OPC新增按钮操作 */
    handleOpcItemDel(opcItem) {
      let idx = -1;
      for(var i=0;i<this.form.opcItems.length;i++){
        var currentItem = this.form.opcItems[i];
        if(currentItem.id == opcItem.id){            
            idx = i;
            break;
        }
      }

      if(idx>-1){
        this.form.opcItems.splice(idx,1); 
      }           
    },
    /** OPC采集项取消操作 */
    handleOpcItemSetDialogCancel() {      
      this.newOpcItem = {       
        name:null,
        kepIdStr:null,
        kepIds:[],
        mergyRule:null,
        itemType:null
        }
      
      this.opcAddDialogVisible = false;
    },
  }
};
</script>