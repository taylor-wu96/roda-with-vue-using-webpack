import { createApp } from "vue";
import App from './App.vue' //Our .vue startup file
import './static/global.css'      
import router from './router'

//Will mount the vue app inside a HTML element which id equals to "app" (div into templetes/index.html file)
createApp(App).use(router).mount('#app');
