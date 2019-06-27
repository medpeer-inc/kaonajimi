<template>
  <div class="tags-input-form">
    <div
      class="field is-inline-block"
      v-for="(tag, index) in tags" :key="index"
    >
      <div class="control">
        <div class="tags has-addons">
          <a class="tag is-link" @click="redirectTag(index)">{{ tag.title }}</a>
          <a class="tag is-delete" @click="deleteTag(index)"></a>
        </div>
      </div>
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
        user_id: this.user_id
      }).then(res => {
        this.tags.push({
          id: res.data.id,
          tagging_id: res.data.tagging_id,
          title: this.tagTitle
        })
        this.tagTitle = ''
      })
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
