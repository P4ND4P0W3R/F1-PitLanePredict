<script setup lang="ts">
import { defineComponent, ref } from "vue";
import axios from "axios";
import { onMounted } from "vue";

const username = ref("admin");
const password = ref("admin");

const isAuthenticated = ref(false);

onMounted(() => {
  document.title = "Login";
  const token = localStorage.getItem('token');
  isAuthenticated.value = !!token; // Set to true if token exists
});

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

      if (responseBody.message === 'Login successful') {
        alert(`Login successful. Welcome, ${username.value}!`);
        window.location.reload();
      } else {
        alert(responseBody.message);
      }

      // Retrieve the token
      const storedToken = localStorage.getItem('token');
      console.log('Token stored in localStorage:', storedToken);
    } else {
      console.error('Invalid server response format:', response);
    }
  } catch (error) {
    console.error("Login failed:", (error as any).response.data.message);
  }
}
</script>

<template>
  <div>
    <h1>Login</h1>
    <form @submit.prevent="login">
      <label for="username">Username:</label>
      <input type="text" id="username" v-model="username" required />

      <label for="password">Password:</label>
      <input type="password" id="password" v-model="password" required />

      <button type="submit" :disabled="isAuthenticated" :class="{ 'darken-button': isAuthenticated }">
        {{ isAuthenticated ? "Already logged in" : "Login" }}
      </button>
    </form>
  </div>
</template>

<style scoped>
.form-container {
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 20px;
}

.driver-form {
  display: grid;
  gap: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 10px;
}

button {
  background-color: #e10600;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #ba0400;
}

.darken-button {
  filter: brightness(0.7); /* Adjust the darkness level as needed */
}
</style>
