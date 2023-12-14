<script setup lang="ts">
import axios, { type AxiosResponse } from "axios";
import { ref } from "vue";
import { onMounted } from "vue";

interface Body {
  username: string;
  email: string;
  password: string;
}

onMounted(() => {
  document.title = "Register";
});

const username = ref("admin");
const email = ref("admin@example.com");
const password = ref("admin");

async function register() {
  try {
    await axios.post<any, AxiosResponse, Body>("http://localhost:3000/api/user/register", {
      email: email.value,
      password: password.value,
      username: username.value,
    });

    alert("Registered successfully");

    // Handle the response as needed
  } catch (error) {
    console.error("Error fetching data:", error);
    alert("Failed to register");
  }
}
</script>

<template>
  <h1>Register</h1>
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
</style>