<template>
  <v-card
      class="mx-auto"
      max-width="344"
  >
    <v-img
        src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"
        height="200px"
        cover
    ></v-img>

    <v-card-title>
      {{ album.name }} - {{ album.artist }}
    </v-card-title>

    <v-card-subtitle>
      Release Date{{ album.release }} - {{ album.total_track }}
    </v-card-subtitle>

    <v-card-actions>
      <v-btn
          color="blue darken-1"
          variant="text"
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
    album: Object
  },
  methods: {
    addFavorite(id) {

    }
  }
}
</script>

<style scoped>

</style>
