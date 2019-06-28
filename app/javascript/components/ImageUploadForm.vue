<template>
  <div class="image-upload-form">
    <div class="image-list">
      <div v-for="(image,index) in images" :key="index">
        <div class="notification">
          <img :src="image.url">
          <span class="delete" @click="handleFileDelete(index)" v-if="!isMain()" />
        </div>
        <br>
      </div>
    </div>
    <div class="file" :class="{ 'is-primary': isMain() }" >
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
      data.append('type', this.type)
      await axios.post('/user_images', data).then(res => {
        this.images = res.data
      })
    },
    handleFileDelete: async function(index) {
      await axios.delete(`/user_images/${this.images[index].id}`).then(res => {
        this.images.splice(index, 1)
      })
    }
  }
};
</script>
<style lang="scss">
</style>
