<template>
  <form @submit.prevent="register">
    <label for="username">Username:</label>
    <input v-model="username" type="text" id="username" required />

    <label for="email">Email:</label>
    <input v-model="email" type="email" id="email" required />

    <label for="password">Password:</label>
    <input v-model="password" type="password" id="password" required />

    <button type="submit">Register</button>
  </form>
</template>

<script setup lang="ts">
import axios from "axios";
import { ref } from "vue";

interface Body {
  username: string;
  email: string;
  password: string;
}

const username = ref("mateleo2@gmail.com");
const email = ref("mateleo2@gmail.com");
const password = ref("mateleo2@gmail.com");

async function register() {
  try {
    axios.post("http://localhost:3000/api/register", {
      email: email.value,
      password: password.value,
      username: username.value,
    });

    // Handle the response as needed
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}
</script>
