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

const oldDriverId = ref("schumacher")
const newDriverId = ref("schumacher")
const code = ref("HAM")
const permanentNumber = ref(44)
const givenName = ref("Lewis")
const familyName = ref("Hamilton")
const dateOfBirth = ref("1985-01-07T00:00:00.000Z")
const nationality = ref("British")
const url = ref("https://en.wikipedia.org/wiki/Lewis_Hamilton")
const driverImage = ref("https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hamilton.jpg.img.1920.medium.jpg/1677069594164.jpg")
const teamId = ref("mercedes")
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
        .post("http://localhost:3000/api/drivers/update", {
            oldDriverId: oldDriverId.value,
            newDriverId: newDriverId.value,
            code: code.value,
            permanentNumber: permanentNumber.value,
            givenName: givenName.value,
            familyName: familyName.value,
            dateOfBirth: dateOfBirth.value,
            nationality: nationality.value,
            url: url.value,
            driverImage: driverImage.value,
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
                alert("Driver updated successfully.");
                router.push('/drivers');
            } else if (response.data.status === 401) {
                alert("Your session has expired, please log in again.");
                router.push('/login');
            }
        })
}
</script>

<template>
    <div v-if="isAuthenticated" class="form-container">
        <h1>Create driver</h1>
        <form @submit.prevent="addDriver" class="driver-form">
            <section class="driver-to-update">
                <h2>Driver to update</h2>
                <label for="oldDriverId">Driver's ID:</label>
                <input type="text" id="oldDriverId" v-model="oldDriverId" required />
            </section>
            <section class="driver-new-info">
                <h2>Driver's new information</h2>
                <label for="newDriverId">Driver's ID:</label>
                <input type="text" id="newDriverId" v-model="newDriverId" required />
                <label for="code">Driver's number:</label>
                <input type="text" id="code" v-model="code" required />
                <label for="permanentNumber">Driver's number:</label>
                <input type="text" id="permanentNumber" v-model="permanentNumber" required />
                <label for="givenName">Driver's given name:</label>
                <input type="text" id="givenName" v-model="givenName" required />
                <label for="familyName">Driver's family name:</label>
                <input type="text" id="familyName" v-model="familyName" required />
                <label for="dateOfBirth">Driver's date of birth:</label>
                <input type="text" id="dateOfBirth" v-model="dateOfBirth" required />
                <label for="nationality">Nationality:</label>
                <input type="text" id="nationality" v-model="nationality" required />
                <label for="url">URL:</label>
                <input type="text" id="url" v-model="url" required />
                <label for="driverImage">Driver's image:</label>
                <input type="text" id="driverImage" v-model="driverImage" required />
                <label for="teamId">Team ID:</label>
                <input type="text" id="teamId" v-model="teamId" required />
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