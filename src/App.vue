<template>
  <v-app>
    <v-main>
      <Search/>
      <notifications position="top right" />
    </v-main>
  </v-app>
</template>

<script>
import Search from "./components/Search.vue";

export default {
  name: 'App',

  components: {
    Search,
  },

  data: () => ({
    //
  }),
}
</script>
