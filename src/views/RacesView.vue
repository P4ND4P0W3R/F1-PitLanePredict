<script setup lang="ts">
import { ref, onMounted } from "vue";

export interface Races {
    raceId: number;
    season: string;
    round: number;
    raceName: string;
    circuitId: string;
    circuitName: string;
    locality: string;
    country: string;
    date: Date;
    time: Date;
    url: string;
}

const races = ref<null | Races[]>(null);

async function fetchData() {
    try {
        const response = await fetch("http://localhost:3000/api/races");
        const data = await response.json();
        races.value = data.data;

        console.log(races)
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

onMounted(() => {
    document.title = "F1 Races 2023"
    fetchData();
});

</script>

<template>
    <main>
        {{ races }}
        <h1>F1 Races 2023</h1>
        <p class="description">
            Discover everything you need to know about this year's Formula 1 races -
            winners, podiums, points repartition.
        </p>
        

        <div class="container">
        </div>
    </main>
</template>