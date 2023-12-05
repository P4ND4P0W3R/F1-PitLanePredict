<script setup lang="ts">
import { defineComponent, ref } from "vue";
import axios from "axios";

const username = ref("paul")
const password = ref("test")


async function login() {
  await axios
    .post("http://localhost:3000/api/user/login", {
      username: username.value,
      password: password.value,
    })
    .then((response) => {
      console.log(response.data.status);
      console.log(response.data.body);
      // Redirect or perform other actions on successful login
    })
    .catch((error) => {
      console.error("Login failed:", error.response.data.message);
    });
}
</script>

<template>
  <div>
    <h2>Login</h2>
    <form @submit.prevent="login">
      <label for="username">Username:</label>
      <input type="text" id="username" v-model="username" required />

      <label for="password">Password:</label>
      <input type="password" id="password" v-model="password" required />

      <button type="submit">Login</button>
    </form>
  </div>
</template>

<style scoped>
/* Add component-specific styles here if needed */
</style>
