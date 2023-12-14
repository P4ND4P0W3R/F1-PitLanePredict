<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

const isAuthenticated = ref(false);

onMounted(() => {
    document.title = "Delete F1 Team 2023";
    const token = localStorage.getItem('token');
    isAuthenticated.value = !!token; // Set to true if token exists
});

const teamId = ref("brawn_gp")
const router = useRouter();

async function deleteDriver() {
    const token = localStorage.getItem('token');

    if (!token) {
        console.error("Token missing");
        // Redirect the user to the login page using Vue Router
        router.push('/login');

        // Optionally, you can display a message to the user
        alert("You need to log in to perform this action.");

        return;
    }

    await axios
        .post("http://localhost:3000/api/teams/delete", {
            teamId: teamId.value,
            token: token,
        })
        .then((response) => {
            console.log(response.data);
            console.log(response.data.status);
            // Redirect or perform other actions on successful operation
            if (response.data.status === 403) {
                alert("You are not authorized to perform this action.");
            }
            else if (response.data.status === 200) {
                alert("Team deleted successfully.");
                router.push('/teams');
            } else if (response.data.status === 401) {
                alert("There is no such team.");
            }
        })
}

</script>

<template>
    <div v-if="isAuthenticated" class="form-container">
        <h1>Delete team</h1>
        <form @submit.prevent="deleteDriver" class="driver-form">
            <label for="teamId">Team's ID:</label>
            <input type="text" id="teamId" v-model="teamId" required />
            <button type="submit">Delete</button>
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
</style>