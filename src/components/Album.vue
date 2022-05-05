<template>
  <v-card
      class="mx-auto px-0"
      width="350"
      max-width="350"
      elevation="12"
      max-height="550"
      height="100%"
  >
    <v-img
        :src="item.images[1].url"
        height="300px"
        cover
    ></v-img>

    <v-card-title class="mb-5">
      Album: {{ item.name }}
    </v-card-title>

    <v-card-subtitle>
      Artist: {{ item.artists[0].name }}
    </v-card-subtitle>

    <v-card-text>
      Release Date: {{ item.release_date }} - Tracks: {{ item.total_tracks }}
    </v-card-text>

    <v-card-actions class="d-flex justify-center align-center pb-4">
      <v-btn
          color="blue darken-1"
          variant="text"
          @click="addAlbum(item.id)"
      >
        Add Favorite
      </v-btn>
      <v-spacer></v-spacer>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  name: "Album",
  props: {
    item: Object
  },
  methods: {
    async addAlbum(id) {
      const request = await fetch('http://localhost:3005/favorites/add', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({id: id})
      })
      const { message } = await request.json()
      if (message === 'success') {
        this.$emit('fav')
        this.msg = message
        this.$notify({
          text: `Album add favorites ${this.msg}`,
          type: 'success'
        });
        return;
      }
      this.$notify({
        text: 'Error',
        type: 'error'
      });
    }
  }
}
</script>

<style scoped>

</style>
