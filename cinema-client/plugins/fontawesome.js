import { library, config } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faPhone, faBell,faAngleRight,faCirclePlay,faTags,
  faDesktop,faClock,faCalendarDays,faBuildingColumns,faCubes,faCircleArrowRight } from '@fortawesome/free-solid-svg-icons'


config.autoAddCss = false

library.add(faPhone, faBell,faAngleRight,faCirclePlay,faTags,
  faDesktop,faClock,faCalendarDays,faBuildingColumns,faCubes,faCircleArrowRight)


export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.component('font-awesome-icon', FontAwesomeIcon, {})
})