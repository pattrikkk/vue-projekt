import { defineStore } from 'pinia';
import axios from 'axios';

export const useFestivalStore = defineStore('festival', {
  state: () => ({
    festivals: [],
  }),
  getters: {
    getFestivalById: (state) => (id) => {
      return state.festivals.find((festival) => festival.id === parseInt(id));
    },
    getFestivals: (state) => () => {
      return state.festivals;
    },
  },
  actions: {
    async fetchFestivals() {
      try {
        const response = await axios.get('http://vuefestival.local/api/fetchFestivals.php');
        this.festivals = response.data;
      }
      catch (error) {
        console.log(error);
      }
    },
  },
});