import Vue from 'vue'
import VueRouter from 'vue-router'
import store from "@/store";

Vue.use(VueRouter)

const routes = [

  {
    path: '/',
    component: ( ) => import( '../views/Manage.vue'),   //父路由
    redirect: "/home",
    children: [           //子路由
        { path: 'home', name: '首页', component: ( ) => import( '../views/Home.vue')},
        { path: 'user', name: '用户管理', component: ( ) => import( '../views/User.vue')},
        { path: 'person', name: '个人信息', component: ( ) => import( '../views/Person.vue')},
        { path: 'file', name: '文件管理', component: ( ) => import( '../views/File.vue')},
        { path: 'IdenManage', name: '疑似/确诊人员登记', component: ( ) => import( '../views/IdenManage.vue')},
        { path: 'IsManage', name: '隔离人员登记', component: ( ) => import( '../views/IsManage.vue')},
    ]
  },
  {
    path: '/about',
    name: 'about',
    component: () => import('../views/AboutView.vue')
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('../views/Register.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 路由守卫
router.beforeEach((to, from, next) => {
  localStorage.setItem("currentPathName", to.name)  // 设置当前的路由名称，为了在Header组件中去使用
  store.commit("setPath")  // 触发store的数据更新
  next()  // 放行路由
})
export default router
