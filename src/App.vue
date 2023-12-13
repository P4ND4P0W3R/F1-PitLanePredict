<script setup lang="ts">
import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <header>
    <div class="wrapper">
      <RouterLink to="/"><img alt="Formula 1 Logo" class="logo" src="@/assets/F1Logo.svg" /></RouterLink>
      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/news">News</RouterLink>
        <RouterLink to="/races">Races</RouterLink>
        <RouterLink to="/teams">Teams</RouterLink>
        <RouterLink to="/drivers">Drivers</RouterLink>
        <RouterLink to="/bets">Bets</RouterLink>
        <RouterLink to="/about">About</RouterLink>
        <RouterLink to="/register">Register</RouterLink>
        <RouterLink to="/login">Login</RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />

  <footer>
    <div style="display: flex; gap: 2rem; justify-content: center">
      <div class="contact">
        <h2>Contact</h2>
        <p>
          Email:
          <a href="mailto:contact@f1-pit-lane-predict.com">contact@f1-pit-lane-predict.com</a>
        </p>
      </div>

      <div class="quick-links">
        <h2>Quick Links</h2>
        <nav>
          <RouterLink to="/">Home</RouterLink>
          <RouterLink to="/news">News</RouterLink>
          <RouterLink to="/races">Races</RouterLink>
          <RouterLink to="/teams">Teams</RouterLink>
          <RouterLink to="/drivers">Drivers</RouterLink>
          <RouterLink to="/bets">Bets</RouterLink>
          <RouterLink to="/about">About</RouterLink>
        </nav>
      </div>
    </div>

    <p class="text-center" style="font-size: 13px; margin-top: 1rem">&copy; Copyright 2023 APA</p>
  </footer>
</template>

<style scoped>
footer p {
  font-size: 1rem;
  font-family: "TittiliumWebRegular";
}

header {
  line-height: 1.5;
  max-height: 100vh;
  border-bottom: 1px solid var(--color-border);
}

.wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

nav {
  display: flex;
  gap: 0.2rem 1rem;
  flex-wrap: wrap;
  justify-content: center;
  font-family: "TittiliumWebRegular";
}

.logo {
    width: 50px;
    height: 50px;
    transform: scale(1.85);
  }

@media (min-width: 475px) {
  .wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
  }
  nav {
    display: flex;
    flex-wrap: wrap;
    gap: 0.2rem 1rem;
    justify-content: center;
    font-family: "TittiliumWebRegular";
  }

  .logo {
    width: 125px;
    height: 125px;
    transform: scale(1);
  }
}

footer {
  display: flex;
  flex-direction: column;
  margin-top: 2rem;
  padding: 2rem 0;
  border-top: 1px solid var(--color-border);
  font-size: 12px;
  text-align: center;
  justify-content: center;
  font-family: "TittiliumWebRegular";
}
.contact {
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: auto;
}

.quick-links {
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: auto;
}
</style>
