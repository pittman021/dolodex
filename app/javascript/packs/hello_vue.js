/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("contact-form")

  if (element != null) {

    var contact = JSON.parse(element.dataset.contact)
    var gifts_attributes = JSON.parse(element.dataset.giftsAttributes)

    gifts_attributes.forEach(function(gift) { gift._destroy = null })
    contact.gifts_attributes = gifts_attributes

    const app = new Vue({
    el: element,
    data: function() {
      return { contact: contact }
    },
    methods: {
      addGift: function() {
        this.contact.gifts_attributes.push({
          id: null,
          title: "",
          url: "",
          _destroy: null
        })
      },
      removeGift: function(index) {

        var gift = this.contact.gifts_attributes[index]


        if ( gift.id == null ) {
          this.contact.gifts_attributes.splice(index, 1)

      } else {
          this.contact.gifts_attributes[index]._destroy = "1"
      }
      },
      saveContact: function() {

        if(this.contact.id == null) {
                  // gives us vue resource
          this.$http.post('/contacts', { contact: this.contact }).then(response => {
            console.log(response)
            Turbolinks.visit(`/contacts/${response.body.id}`)
          }, response => {

          })

        } else {
          this.$http.put(`/contacts/${this.contact.id}`, { contact: this.contact }).then(response => {

            Turbolinks.visit(`/contacts/${response.body.id}`)
          }, response => {

          })
        }
      }
    }
  })
  }
})
