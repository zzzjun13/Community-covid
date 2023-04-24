<template>
    <el-menu :default-openeds="['1', '3']" style="min-height: 100%; overflow-x: hidden; border-right-color: transparent"
             background-color="rgb(48, 65, 86)"
             text-color="#fff"
             active-text-color="#ffd04b"
             :collapse-transition="false"
             :collapse="isCollapse"
              router>

      <div style="height: 60px; line-height: 60px; text-align: center">
        <img src="../assets/logo.png" alt="" style="width: 20px; position: relative; top: 5px; margin-right: 5px">
        <b style="color: white" v-show="logoTextShow">社区疫情管理系统</b>
      </div>

      <el-menu-item index="/home">
        <template v-slot="title">
          <i class="el-icon-message"></i>
          <span slot="title">主页</span>

        </template>
      </el-menu-item>

      <el-submenu>
        <template slot="title">
          <i class="el-icon-menu"></i>
          <span slot="title">社区人员管理</span>
        </template>

        <el-menu-item-group>
          <el-menu-item index="/user">
            <i class="el-icon-user-solid"></i>
            <span slot="title">用户管理</span>
          </el-menu-item>
          <el-menu-item index="file">
            <i class="el-icon-user-solid"></i>
            <span slot="title">文件管理</span>
          </el-menu-item>

          </el-menu-item-group>
      </el-submenu>

      <el-submenu>
        <template slot="title">
          <i class="el-icon-setting"></i>
          <span slot="title">异常人员管理</span>
        </template>
        <el-menu-item index="/IdenManage">
          <i class="el-icon-setting"></i>
          <span slot="title">疑似/确诊人员登记</span>
        </el-menu-item>
        <el-menu-item index="/">
          <i class="el-icon-setting"></i>
          <span slot="title">隔离人员登记</span>
        </el-menu-item>
      </el-submenu>

      <el-submenu>
        <template slot="title">
          <i class="el-icon-setting"></i>
          <span slot="title">健康打卡</span>
        </template>
        <el-menu-item index="/">
          <i class="el-icon-setting"></i>
          <span slot="title">健康打卡记录</span>
        </el-menu-item>
        <el-menu-item index="/">
          <i class="el-icon-setting"></i>
          <span slot="title">健康打卡申请</span>
        </el-menu-item>
      </el-submenu>

      <el-submenu>
        <template slot="title">
          <i class="el-icon-setting"></i>
          <span slot="title">防疫物资管理</span>
        </template>

          <el-menu-item index="/">
            <i class="el-icon-first-aid-kit"></i>
            <span slot="title">防疫物资查看</span>
          </el-menu-item>
        <el-menu-item index="/">
          <i class="el-icon-first-aid-kit"></i>
          <span slot="title">新增防疫物资</span>
        </el-menu-item>
      </el-submenu>

    </el-menu>
</template>


<script>
  export default {
    name: "Aside",
    props: {
      isCollapse: Boolean,
      logoTextShow: Boolean
    }
  }
</script>

<style scoped>

</style>