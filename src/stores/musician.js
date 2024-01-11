import { defineStore } from 'pinia';
import axios from 'axios';

export const useMusicianStore = defineStore('musician', {
  state: () => ({
    musicians: [],
  }),
  getters: {
    getMusicianByID: (state) => (id) => {
      return state.musicians.find((musician) => musician.id === parseInt(id));
    },
    getMusicians: (state) => () => {
      return state.musicians;
    },
  },
  actions: {
    async fetchMusicians() {
      try {
        const response = await axios.get('http://vuefestival.local/api/fetchMusicians.php');
        this.musicians = response.data;
      }
      catch (error) {
        console.log(error);
      }
    },
  },
});