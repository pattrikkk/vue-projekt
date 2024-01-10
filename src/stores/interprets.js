import { defineStore } from 'pinia';
import axios from 'axios';

export const useInterpretStore = defineStore('interpret', {
  state: () => ({
    interprets: [],
  }),
  getters: {
    getInterPretByID: (state) => (id) => {
      return state.interprets.find((interpret) => interpret.id === parseInt(id));
    },
    getInterprets: (state) => () => {
      return state.interprets;
    },
  },
  actions: {
    async fetchInterprets() {
      try {
        const response = await axios.get('http://vuefestival.local/api/fetchInterprets.php');
        this.interprets = response.data;
      }
      catch (error) {
        console.log(error);
      }
    },
  },
});