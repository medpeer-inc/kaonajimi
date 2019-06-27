<template>
  <div class="image-upload-form">
    <div class="image-list">
      <img :src="image.url">
    </div>
    <div class="file has-name is-primary">
      <label class="file-label">
        <input class="file-input" type="file" name="resume" @change="handleFileSelect">
        <span class="file-cta">
          <span class="file-icon">
            <i class="fas fa-upload"></i>
          </span>
          <span class="file-label">
            Main file…
          </span>
        </span>
        <span class="file-name">
          {{ image.name }}
        </span>
      </label>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default {
  name: 'ImageUploadForm',
  components: {},
  props: ['init_image', 'user_id'],
  data: function() {
    return {
      image: this.init_image ? this.init_image : { name: 'no name', url: '' }
    };
  },
  methods: {
    handleFileSelect: async function(event) {
      const data = new FormData();
      data.append('images', new Blob(event.target.files))
      data.append('user_id', this.user_id)
      data.append('type', 'main')
      await axios.post('/user_images', data).then(res => {
        this.image.url = res.data.url
      })
    },
    buildTag: async function(event) {
      event.preventDefault();
      if(!this.tagTitle) { return }
      await axios.post('/user_tags', {
      }).then(res => {})
    },
    deleteTag: async function(index) {
      await axios.delete(`/user_taggings/${this.tags[index].tagging_id}`)
      this.tags.splice(index,1)
    },
    redirectTag: function (index) {
      location.href = `/user_tags/${this.tags[index].id}`
    }
  }
};
</script>
<style lang="scss">
</style>
