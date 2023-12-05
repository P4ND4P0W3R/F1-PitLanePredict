<script setup lang="ts">
import TheWelcome from "../components/TheWelcome.vue";
import { onMounted } from "vue";

onMounted(() => {
  document.title = `F1 Pit Lane Predict`;
});
</script>

<template>
  <main>
    <div class="container">
      <h1>Welcome to F1 Pit Lane Predict</h1>
        <p>
          Explore the latest news, results, and place your bets on upcoming races.
        </p>
      <img class="banner" src="../assets/banner.avif" />
    </div>
  </main>
</template>

<style scoped>
main {
  display: flex;
  align-items: center;
  justify-content: center;
}

.container {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  margin: 2rem 0 2rem 0;
  gap: 1rem;
}

.banner {
  width: 80%;
  height: auto;
  height: auto;
}
</style>
