import Vue from 'vue'
import Router from 'vue-router'

import Root from 'src/views/Root/Index.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: Root,
      name: 'root'
    }
  ]
})
