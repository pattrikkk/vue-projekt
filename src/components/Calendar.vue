<template>
    <div :v-if="dates" class="calendar">
        <div class="header">
            <button class="btn btn-primary" @click="prevMonth">&lt;</button>
            <h2 class="m-0">{{ currentMonth }}</h2>
            <button class="btn btn-primary" @click="nextMonth">&gt;</button>
        </div>
        <div class="days">
            <div v-for="day in daysOfWeek" :key="day" class="day-header">{{ day }}</div>
            <div v-for="blankDay in blankDays" :key="blankDay" class="empty-day"></div>
            <div v-for="date in daysInMonth" :key="date" class="day"
                :class="{  selected: isSelected(date) }">
                {{ date.getDate() }}
            </div>
        </div>
    </div>
</template>
  
<script>
import { RouterLink } from 'vue-router';

export default {
    props: {
        dates: {
            type: Object,
            required: true,
        },
    },
    data() {
        return {
            currentDate: new Date(),
            datesBetween: [],
        };
    },
    created() {
        this.datesBetween = this.getDatesBetween(this.dates);
    },
    computed: {
        currentMonth() {
            const options = { month: 'long', year: 'numeric' };
            return this.currentDate.toLocaleDateString('en-GB', options);
        },
        daysOfWeek() {
            return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        },
        daysInMonth() {
            const year = this.currentDate.getFullYear();
            const month = this.currentDate.getMonth();
            const firstDay = new Date(year, month, 1);
            const lastDay = new Date(year, month + 1, 0);
            const days = [];
            for (let day = 1; day <= lastDay.getDate(); day++) {
                days.push(new Date(year, month, day));
            }
            return days;
        },
        blankDays() {
            const firstDayIndex = this.daysInMonth[0].getDay();
            return Array(firstDayIndex).fill(null);
        },
    },
    methods: {
        prevMonth() {
            this.currentDate = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth() - 1, 1);
        },
        nextMonth() {
            this.currentDate = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth() + 1, 1);
        },
        getDatesBetween(dates) {
            let dates2 = [];
            for (const festival of dates) {
                const startDate = new Date(festival.date_from);
                const endDate = new Date(festival.date_to);
                let currentDate = startDate;
                while (currentDate <= endDate) {
                    dates2.push(new Date(currentDate));
                    currentDate.setDate(currentDate.getDate() + 1);
                }
            }
            return dates2;
        },
        isSelected(date) {
            return this.datesBetween.some(betweenDate => date.toDateString() === betweenDate.toDateString());
        },
    },
    components: { RouterLink }
};
</script>
  
<style scoped>
.calendar {
    max-width: 400px;
    margin: auto;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
}

.days {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    grid-row-gap: 0.2rem;
}

.day-header {
    text-align: center;
    font-weight: bold;
}

.empty-day {
    height: 30px;
}

.day {
    text-align: center;
    padding: 0.5rem;
    cursor: pointer;
}

.day {
    transition: 0.3s ease;
}

.day:hover {
    background-color: #e6e6e6;
}

.selected {
    background-color: #d9edf7;
}
</style>
  