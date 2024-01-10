<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <RouterLink class="navbar-brand font-weight-bold" to="/">FestivalHub</RouterLink>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item" :class="{ active: isRouteActive('/') }">
            <RouterLink class="nav-link" to="/">Home</RouterLink>
          </li>
          <li class="nav-item" :class="{ active: isRouteActive('/festivals') }">
            <RouterLink class="nav-link" to="/festivals">All festivals</RouterLink>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script setup>
import { RouterLink, useRoute } from 'vue-router'

const isRouteActive = (route) => {
  const currentRoute = useRoute();
  return currentRoute.path === route;
};
</script>

<style scoped>
.navbar {
  border-radius: 0 0 10px 10px;
}
</style>
