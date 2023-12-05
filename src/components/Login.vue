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

<script lang="ts">
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent({
    data() {
        return {
            username: '',
            password: '',
        };
    },
    methods: {
        login() {
            axios.post('http://localhost:3000/api/login', {
                username: this.username,
                password: this.password,
            })
                .then(response => {
                    console.log(response.data.status)
                    console.log(response.data.body);
                    // Redirect or perform other actions on successful login
                })
                .catch(error => {
                    console.error('Login failed:', error.response.data.message);
                });
        },
    },
});
</script>

<style scoped>
/* Add component-specific styles here if needed */
</style>
