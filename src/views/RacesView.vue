<script setup lang="ts">
import { ref, onMounted } from "vue";

interface Team {
    constructorId: string;
    name: string;
    nationality: string;
    url: string;
    teamLogo: string;
    Drivers: string;
    totalPoints: number;
}

const teams = ref<null | Team[]>(null);

async function fetchData() {
    try {
        const response = await fetch("http://localhost:3000/api/teams");
        const data = await response.json();
        teams.value = data.data.data;

        console.log(teams)
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

fetchData();

</script>

<template>
    <main>
        {{ teams }}
        <h1>F1 Races 2023</h1>
        <p class="description">
            Discover everything you need to know about this year's Formula 1 races -
            winners, podiums, points repartition.
        </p>

        <div class="container">
        </div>
    </main>
</template>