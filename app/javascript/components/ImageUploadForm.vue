<template>
  <div class="image-upload-form">
    <div class="image-list">
      <img :src="image.url" v-for="(image,index) in images" :key="index">
    </div>
    <div class="file has-name" :class="{ 'is-primary': isMain() }" >
      <label class="file-label">
        <input class="file-input" type="file" name="resume" @change="handleFileSelect">
        <span class="file-cta">
          <span class="file-icon"><i class="fas fa-upload"></i></span>
          <span class="file-label">Upload file…</span>
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
  props: ['init_images', 'user_id', 'limit', 'type'],
  data: function() {
    return {
      images: this.init_images ? this.init_images : []
    }
  },
  methods: {
    isMain: function() {
      return this.type == 'main'
    },
    handleFileSelect: async function(event) {
      const data = new FormData();
      data.append('images', new Blob(event.target.files))
      data.append('user_id', this.user_id)
      data.append('type', this.type)
      await axios.post('/user_images', data).then(res => {
        this.images = res.data
      })
    }
  }
};
</script>
<style lang="scss">
</style>
