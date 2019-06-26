<template>
  <div class="tags-input-form">
    <label class="label">タグ</label>
    <div class="tag-list">
      <span
        v-for="(tag, index) in tags"
        :key="index"
        class="tag is-primary"
      >
        {{ tag.title }}
        <span
          class="delete is-small"
          @click="deleteTag(index)"
        />
      </span>
    </div>
    <input
      v-model="tagTitle"
      class="tag-input-area input is-small"
      @keydown.enter="buildTag"
    >
  </div>
</template>
<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default {
  name: 'TagsInput',
  components: {},
  props: ['init_tags', 'user_id'],
  data: function() {
    return {
      tagTitle: '',
      tags: this.init_tags ? this.init_tags : []
    };
  },
  methods: {
    buildTag: async function(event) {
      event.preventDefault();
      await axios.post('/user_tags', {
        user_tag: { title: this.tagTitle },
        user_id: this.user_id }
      ).then(res => {
        this.tags.push({id: res.data.id, title: this.tagTitle});
        this.tagTitle = ''
      })
    },
    deleteTag: async function(index) {
      await axios.delete(`/user_tags/${this.tags[index].id}`, { user_id: this.user_id })
      this.tags.splice(index,1)
    }
  }
};
</script>
<style lang="scss">
</style>
