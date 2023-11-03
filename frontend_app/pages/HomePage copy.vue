<template>
  <img src="../static/images.png" width="50" height="50"/>
  <h1>Minimal Vue Webpack</h1>
   <div>{{ answer }}</div>
</template>

<script>

import { defineComponent } from 'vue'; 
import axios from "axios";

export default defineComponent ({
  name: "App",
  data() {
    return {
      answer: {},
    };
  },
  methods: {
    async getAnswer() {
        const API_URL = "/api";
        // const API_URL = "https://yesno.wtf/api";
        const { data } = await axios.get(API_URL);
        this.answer = data;
    },
  },
  beforeMount() {
    this.getAnswer();
  },
});

// export default defineComponent({
//     name: 'App'
// });

</script>

<style scoped>
    h1 {
        width: 100%;
        text-align: center;
        margin-top: 10px;
    }
    img {
        display: block;
        margin: auto;
    }
</style>

