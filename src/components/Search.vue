<template>
  <v-container>
    <v-row class="text-center">
      <v-col class="mb-4">
        <h1 class="text-center">
          Searcher Imed-Music
        </h1>
        <v-text-field
          label="Search"
          :rules="rules"
          hide-details="auto"
          v-model="search"
        ></v-text-field>
        <v-btn
            class="mt-2"
            type="button"
            @click="getAlbums(search)"
            color="blue darken-1"
        >
          Search Music
        </v-btn>
      </v-col>
    </v-row>
    <v-row v-if="favorites.length > 0" >
      <v-col cols="12">
        <h3 class="text-center">
          List of albums favorites
        </h3>
      </v-col>
      <v-col
          v-for="favorite of favorites"
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="4"
          xl="4">
        <Favorite :item="favorite" @fav="renderFav"/>
      </v-col>
    </v-row>
    <v-row v-if="albums.length > 0" >
      <v-col cols="12">
        <h3 class="text-center mt-10">
          Result of search - {{ this.search }}
        </h3>
      </v-col>
      <v-col
          v-for="album of albums"
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="4"
          xl="4">
        <Album :item="album" @fav="renderFav"/>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Favorite from "./Favorite";
import Album from "./Album";

export default {
  name: "Search",
  components: {
    Album,
    Favorite
  },

  data: () => ({
    search: '',
    albums: [],
    favorites: [],
    rules: [
        value => !!value || 'Required',
        value => (value && value.length >= 4) || 'Minimum 4 characters'
    ]
  }),
  methods: {
    async getAlbums(search) {
      const request = await fetch('http://localhost:3005/album/search', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({q: search})
      });
      const { data } = await request.json();
      this.albums = data;
    },

    async getFavorites() {
      const request = await fetch('http://localhost:3005/favorites/get');
      const { data } = await request.json();
      this.favorites = data
    },

    renderFav() {
      console.log('renderFav');
      this.getFavorites()
    }
  },

  async mounted() {
    await this.getFavorites()
  }
}
</script>

<style scoped>

</style>
