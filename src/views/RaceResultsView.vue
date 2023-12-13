<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";

interface Result {
    resultId: number;
    raceId: number;
    driverId: string;
    position: number;
    points: number;
}

export interface Races {
    raceId: number;
    raceName: string;
}

const results = ref<null | Result[]>(null);
const race = ref<null | Races[]>(null);
const route = useRoute();
const driverId = ref<null | string>(null);
const position = ref<null | number>(null);
const points = ref<null | number>(null);
const raceName = ref<null | string>(null);

async function fetchResults() {
    try {
        const response = await fetch("http://localhost:3000/api/results");
        const data = await response.json();
        const raceId = route.params.raceId;
        console.log(raceId);
        results.value = data.data.filter((result: Result) => result.raceId === Number(raceId));

        if (results.value && results.value.length > 0) {
            driverId.value = results.value[0].driverId;
            position.value = results.value[0].position;
            points.value = results.value[0].points;
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

async function fetchRaces() {
    try {
        const response = await fetch("http://localhost:3000/api/races");
        const data = await response.json();
        const raceId = route.params.raceId;
        console.log(raceId);
        race.value = data.data.filter((race: Races) => race.raceId === Number(raceId));

        if (race.value && race.value.length > 0) {
            raceName.value = race.value[0].raceName;
            document.title = raceName.value + " Results";
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

function getDriverName(driverId: string): string {
    const driverName: { [key: string]: string } = {
        "max_verstappen": "Max Verstappen",
        "perez": "Sergio Perez",
        "hamilton": "Lewis Hamilton",
        "norris": "Lando Norris",
        "bottas": "Valtteri Bottas",
        "leclerc": "Charles Leclerc",
        "sainz": "Carlos Sainz",
        "ricciardo": "Daniel Ricciardo",
        "gasly": "Pierre Gasly",
        "alonso": "Fernando Alonso",
        "ocon": "Esteban Ocon",
        "stroll": "Lance Stroll",
        "tsunoda": "Yuki Tsunoda",
        "russell": "George Russell",
        "albon": "Alexander Albon",
        "sargeant": "Logan Sargeant",
        "kevin_magnussen": "Kevin Magnussen",
        "de_vries": "Nyck De Vries",
        "zhou": "Guanyu Zhou",
        "piastri": "Oscar Piastri",
        "hulkenberg": "Nico Hulkenberg",
        "lawson": "Liam Lawson",
    }
    return driverName[driverId] || "Driver Name";
}

onMounted(() => {
    fetchResults();
    fetchRaces();
});

</script>

<template>
    <main>
        <h1>Results of the {{ raceName }}</h1>
        <table class="results-table">
            <thead>
                <tr>
                    <th>Position</th>
                    <th>Driver</th>
                    <th>Points</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(result, index) in results" :key="result.driverId">
                    <td>{{ result.position }}</td>
                    <td>
                        <RouterLink :to="'/driver/' + result.driverId" tag="div" class="driver-link">
                            {{ getDriverName(result.driverId) }}
                        </RouterLink>
                    </td>
                    <td>{{ result.points }} PTS</td>
                </tr>
            </tbody>
        </table>
    </main>
</template>

<style scoped>
main {
    display: flex;
    align-items: left;
    justify-content: center;
    flex-direction: column;
    margin: 2rem 0 2rem 0;
}

.results-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    color: white;
}

.results-table th,
.results-table td {
    border: 1px solid #e10600;
    padding: 8px;
    text-align: left;
    font-family: F1Bold;
    font-size: 18px;
    line-height: 24px;
}

.driver-link {
    text-decoration: none;
    cursor: pointer;
    font-family: F1Bold;
    font-size: 18px;
    line-height: 24px;
}

.driver-link:hover {
    color: hsla(160, 100%, 37%, 1);
}

a {
    text-decoration: none;
    color: white;
}

.description {
    margin-left: 1rem;
}

.container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    grid-auto-rows: minmax(100px, auto);
    gap: 30px;
    padding: 2rem;
}

.result {
    display: block;
    flex-direction: column;
    align-items: center;
    margin-bottom: 10px;
}

.result-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 2%;
    border: solid 10px #e10600;
    border-right: solid 10px #e10600;
    border-width: 2px;
    border-top-right-radius: 10px;
}

.result-content:hover {
    border-top-right-radius: 10px;
    border-color: hsla(160, 100%, 37%, 1);

    transition: 0.1s all ease;
}

.listing {
    color: #fff;
    padding-bottom: 10px;
    border-bottom: 1px solid #949498;
    margin-bottom: 10px;
    display: flex;
    flex-wrap: nowrap;
    justify-content: space-between;
    align-items: center;
    box-sizing: border-box;
    min-width: 100%;
}

.rank {
    font-family: F1Black;
    font-size: 2.625rem;
    line-height: 3rem;
    color: white;
}

.points {
    text-align: right;
}

.f1-wide--s {
    font-family: F1Wide;
    font-size: 18px;
    line-height: 24px;
}

.points-label {
    background-color: #fff;
    border-radius: 3px;
    color: #000;
    margin: 0 0 0 auto;
    padding: 1px 0 0;
    text-align: center;
    width: 70px;
}

.f1-wide--xxs {
    font-family: F1Wide;
    font-size: 12px;
    line-height: 15px;
    letter-spacing: 0.5px;
    font-weight: 400;
}

.f1-uppercase {
    text-transform: uppercase;
}

.f1--xxs {
    font-family: F1;
    font-size: 12px;
    line-height: 15px;
    letter-spacing: 0.5px;
    font-weight: 400;
}

.f1-color--carbonBlack {
    color: #fff;
}

.d-block {
    display: block !important;
}

.f1-bold--s {
    font-family: F1Bold;
    font-size: 18px;
    line-height: 24px;
}

.country-flag {
    border-radius: 5px;
    border: 1px solid #949498;
    overflow: hidden;
}

.f1--xxs {
    font-family: F1;
    font-size: 12px;
    line-height: 15px;
    letter-spacing: 0.5px;
    font-weight: 400;
}

.f1-color--gray5 {
    color: #67676d;
}

dl,
ol,
p,
ul {
    margin-top: 0;
    margin-bottom: 20px;
}
</style>