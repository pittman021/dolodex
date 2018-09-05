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
  var list_form = document.getElementById("list-form")

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

  if (list_form != null) {

    var list = JSON.parse(list_form.dataset.list)
    var contacts_attributes = JSON.parse(list_form.dataset.contactsAttributes)
    var contacts_available = JSON.parse(list_form.dataset.contactsAvailable)
    var contact_ids = JSON.parse(list_form.dataset.contactIds)
    list.contact_ids = contact_ids

    const app = new Vue({
      el: list_form,
      data: function () {
        return {
          list: list,
          selected: '',
          contacts_available: contacts_available,
          contacts_attributes: contacts_attributes
         }
      },
      methods: {
        addContact: function() {
          const id = this.selected

          // get the id & person selected & add to attributes
          var contact = this.contacts_available.filter(function(contact) {
            return id === contact.id
          });

          console.log(contact[0].first_name)
          // push item into attributes list to show on page
          this.contacts_attributes.push({
            id: contact[0].id,
            first_name: contact[0].first_name
          });
          // push the item into the id list for post request
          this.list.contact_ids.push(contact[0].id);
        },
        removeContact: function(index) {
            this.list.contact_ids.splice(index,1)
            this.contacts_attributes.splice(index,1)
        },
        saveList: function() {
          if(this.list == null) {
                    // gives us vue resource
            this.$http.post('/contacts', { contact: this.contact }).then(response => {
              Turbolinks.visit(`/contacts/${response.body.id}`)
            }, response => {
            })
          } else {
            this.$http.put(`/lists/${this.list.id}`, {list: this.list }).then(response => {
              Turbolinks.visit(`/lists/${response.body.id}`)
            }, response => {

            })
          }
        },
        deleteList: function() {
          this.$http.delete(`/lists/${this.list.id}`, {list: this.list }).then(response => {
            Turbolinks.visit(`/lists`)
          }, response => {

          })
        }
      }
    });

  }
})
