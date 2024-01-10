import { defineStore } from 'pinia';
import axios from 'axios';

export const useStageStore = defineStore('stage', {
  state: () => ({
    stages: [],
  }),
  getters: {
    getStagesFromFestivalID: (state) => (id) => {
      return state.stages.filter((stage) => stage.festival_id === parseInt(id));
    },
  },
  actions: {
    async fetchStages() {
      try {
        const response = await axios.get('http://vuefestival.local/api/fetchStages.php');
        this.stages = response.data;
      }
      catch (error) {
        console.log(error);
      }
    },
  },
});