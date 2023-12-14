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

const oldRaceId = ref(23)
const newRaceId = ref(23)
const season = ref("2023")
const round = ref(23)
const raceName = ref("Emilia Romagna Grand Prix")
const circuitId = ref("imola")
const circuitName = ref("Autodromo Internazionale Enzo e Dino Ferrari")
const locality = ref("Imola")
const country = ref("Italy")
const date = ref("2023-09-03T00:00:00.000Z")
const time = ref("1970-01-01T13:00:00.000Z")
const url = ref("https://en.wikipedia.org/wiki/2023_Emilia_Romagna_Grand_Prix")
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
        .post("http://localhost:3000/api/races/update", {
            oldRaceId: oldRaceId.value,
            newRaceId: newRaceId.value,
            season: season.value,
            round: round.value,
            raceName: raceName.value,
            circuitId: circuitId.value,
            circuitName: circuitName.value,
            locality: locality.value,
            country: country.value,
            date: date.value,
            time: time.value,
            url: url.value,
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
                alert("Race updated successfully.");
                router.push('/races');
            } else if (response.data.status === 401) {
                alert("Your session has expired, please log in again.");
                router.push('/login');
            }
        })
}
</script>

<template>
    <div v-if="isAuthenticated" class="form-container">
        <h1>Update race</h1>
        <form @submit.prevent="addDriver" class="driver-form">
            <section class="driver-to-update">
                <h2>Race to update</h2>
                <label for="oldRaceId">Circuit's ID:</label>
                <input type="text" id="oldRaceId" v-model="oldRaceId" required />
            </section>
            <section class="driver-new-info">
                <h2>Race's new information</h2>
                <label for="newRaceId">Race ID</label>
                <input type="text" id="newRaceId" v-model="newRaceId" required />
                <label for="season">Season</label>
                <input type="text" id="season" v-model="season" required />
                <label for="round">Round</label>
                <input type="text" id="round" v-model="round" required />
                <label for="raceName">Race Name</label>
                <input type="text" id="raceName" v-model="raceName" required />
                <label for="circuitId">Circuit ID</label>
                <input type="text" id="circuitId" v-model="circuitId" required />
                <label for="circuitName">Circuit Name</label>
                <input type="text" id="circuitName" v-model="circuitName" required />
                <label for="locality">Locality</label>
                <input type="text" id="locality" v-model="locality" required />
                <label for="country">Country</label>
                <input type="text" id="country" v-model="country" required />
                <label for="date">Date</label>
                <input type="text" id="date" v-model="date" required />
                <label for="time">Time</label>
                <input type="text" id="time" v-model="time" required />
                <label for="url">URL</label>
                <input type="text" id="url" v-model="url" required />
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