import { createApp } from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import Notification from '@kyvg/vue3-notification'

loadFonts()

createApp(App)
  .use(vuetify)
  .use(Notification)
  .mount('#app')
