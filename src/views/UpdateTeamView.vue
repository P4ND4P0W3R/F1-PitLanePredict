<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

const isAuthenticated = ref(false);

onMounted(() => {
    document.title = "Create F1 Drivers 2023";
    const token = localStorage.getItem('token');
    isAuthenticated.value = !!token; // Set to true if token exists
});

const oldTeamId = ref("brawn_gp")
const newTeamId = ref("brawn_gp")
const name = ref("Brawn GP")
const nationality = ref("English")
const url = ref("https://en.wikipedia.org/wiki/Brawn_GP")
const teamLogo = ref("https://en.wikipedia.org/wiki/File:Brawn_GP_logo.svg")
const router = useRouter();

async function addDriver() {
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
        .post("http://localhost:3000/api/teams/update", {
            oldTeamId: oldTeamId.value,
            newTeamId: newTeamId.value,
            name: name.value,
            nationality: nationality.value,
            url: url.value,
            teamLogo: teamLogo.value,
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
                alert("Team updated successfully.");
                router.push('/teams');
            } else if (response.data.status === 401) {
                alert("Your session has expired, please log in again.");
                router.push('/login');
            }
        })
}
</script>

<template>
    <div v-if="isAuthenticated" class="form-container">
        <h1>Update team</h1>
        <form @submit.prevent="addDriver" class="driver-form">
            <section class="driver-to-update">
                <h2>Team to update</h2>
                <label for="oldTeamId">Team's ID:</label>
                <input type="text" id="oldTeamId" v-model="oldTeamId" required />
            </section>
            <section class="driver-new-info">
                <h2>Team's new information</h2>
                <label for="newTeamId">Team ID:</label>
                <input type="text" id="newTeamId" v-model="newTeamId" required />
                <label for="name">Team name:</label>
                <input type="text" id="name" v-model="name" required />
                <label for="nationality">Nationality:</label>
                <input type="text" id="nationality" v-model="nationality" required />
                <label for="url">URL:</label>
                <input type="text" id="url" v-model="url" required />
                <label for="teamLogo">Team logo:</label>
                <input type="text" id="teamLogo" v-model="teamLogo" required />
            </section>
            <button type="submit">Update</button>
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

.driver-to-update {
    border: #e10600 solid 3px;
    padding: 10px;
    border-radius: 5px;
}

.driver-new-info {
    border: hsla(160, 100%, 37%, 1) solid 3px;
    padding: 10px;
    border-radius: 5px;
}
</style>