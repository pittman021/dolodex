import Vue from 'vue/dist/vue.esm'

import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {

var el = document.getElementById('contacts')
var contacts = new Vue({
  el: el,
  data: {
    contacts: []
  },
  mounted: function() {
    this.$http.get('/contacts.json').then(res => {
			this.contacts = JSON.parse(res.bodyText);
		});
  }
});
});
