<template>
  <div class="app-container">
    <a :href="dataViewUrl" target="_blank">{{tips}}</a>
    <!-- <div style="height: 42px;">
      <el-button>
        <span>全屏显示</span>
      </el-button>
    </div>
    <iframe frameborder="no" id="template-iframe" src="https://share.shanhaibi.com/625d0ef49038f/" style="width: 100%; height: 100%; border-radius: 3px;"></iframe> -->
  </div>
</template>

<script>
import { getOrg } from "@/api/system/org";
export default {
  data() {
    return {
      dataViewUrl:null,
      tips:''
    }    
  },
  mounted(){
    this.loadDataView();
  },
  methods:{
    loadDataView(){      
      getOrg(this.$store.getters.orgId).then(response => {
        let dt = response.data;         
        if(dt && dt.dataViewUrl){
          this.tips = '已加载大屏页面，如遇未自动弹出页面情况，请点击此处进行重新加载';          
          this.dataViewUrl = dt.dataViewUrl; 
          window.open(this.dataViewUrl,"_blank");
        }else{
          this.tips = '当前企业未配置数据大屏，请联系管理员';
          this.dataViewUrl = null;
        }
      });
    }
  }
}
</script>