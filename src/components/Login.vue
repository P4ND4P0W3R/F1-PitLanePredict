<script setup lang="ts">
import { defineComponent, ref } from "vue";
import axios from "axios";

const username = ref("paul");
const password = ref("test");
const loginMessage = ref(""); // New reactive property for login message

async function login() {
  try {
    const response = await axios.post("http://localhost:3000/api/user/login", {
      username: username.value,
      password: password.value,
    });

    // Log the full server response for additional debugging
    console.log('Full server response:', response);

    // Check if the response has a data property
    if (response.data) {
      // Parse the body JSON string
      const responseBody = JSON.parse(response.data.body);

      // Log the status, message, and token
      console.log('Status:', response.data.status);
      console.log('Message:', responseBody.message);
      console.log('Token:', responseBody.token);

      // Store the token directly (no need for JSON.stringify)
      localStorage.setItem('token', responseBody.token);

      alert(`Login successful. Welcome, ${username.value}!`);

      // Retrieve the token
      const storedToken = localStorage.getItem('token');
      console.log('Token stored in localStorage:', storedToken);
    } else {
      console.error('Invalid server response format:', response);
    }
  } catch (error) {
    console.error("Login failed:", (error as any).response.data.message);
    // Clear the login message in case of login failure
    loginMessage.value = "";
  }
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
