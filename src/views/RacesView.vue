<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";

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

const isAuthenticated = ref(false);

onMounted(() => {
    document.title = "F1 Races 2023"
    fetchData();
    const token = localStorage.getItem('token');
    isAuthenticated.value = !!token; // Set to true if token exists
});

function formatDate(dateString: string): string {
    const date = new Date(dateString);
    const options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric" };
    return date.toLocaleDateString("en-US", options);
}

function formatTime(timeString: string): string {
    const time = new Date(timeString);
    const options: Intl.DateTimeFormatOptions = { hour: "numeric", minute: "numeric", hour12: true };
    return time.toLocaleTimeString("en-US", options);
}

function getCountryFlag(country: string): string {
    const countryFlags: { [key: string]: string } = {
        "Australia": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/australia-flag.png.transform/2col-retina/image.png",
        "Bahrain": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/bahrain-flag.png.transform/2col-retina/image.png",
        "Azerbaijan": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/azerbaijan-flag.png.transform/2col-retina/image.png",
        "Spain": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/spain-flag.png.transform/2col-retina/image.png",
        "Monaco": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/monaco-flag.png.transform/2col-retina/image.png",
        "Canada": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/canada-flag.png.transform/2col-retina/image.png",
        "Austria": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/austria-flag.png.transform/2col-retina/image.png",
        "UK": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/great-britain-flag.png.transform/2col-retina/image.png",
        "Hungary": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/hungary-flag.png.transform/2col-retina/image.png",
        "Belgium": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/belgium-flag.png.transform/2col-retina/image.png",
        "Netherlands": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/netherlands-flag.png.transform/2col-retina/image.png",
        "Italy": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/italy-flag.png.transform/2col-retina/image.png",
        "Singapore": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/singapore-flag.png.transform/2col-retina/image.png",
        "Japan": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/japan-flag.png.transform/2col-retina/image.png",
        "USA": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/united-states-flag.png.transform/2col-retina/image.png",
        "United States": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/united-states-flag.png.transform/2col-retina/image.png",
        "Qatar": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/qatar-flag.png.transform/2col-retina/image.png",
        "Mexico": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/mexico-flag.png.transform/2col-retina/image.png",
        "Brazil": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/brazil-flag.png.transform/2col-retina/image.png",
        "Saudi Arabia": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/saudi-arabia-flag.png.transform/2col-retina/image.png",
        "UAE": "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/abu-dhabi-flag.png.transform/2col-retina/image.png"
    };
    return countryFlags[country] || "url/to/default-flag.png";
}

function getCircuit(locality: string): string {
    const circuit: { [key: string]: string } = {
        "Sakhir": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245035/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain%20carbon.png.transform/4col-retina/image.png",
        "Jeddah": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245030/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Saudi%20Arabia%20carbon.png.transform/4col-retina/image.png",
        "Melbourne": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245032/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Australia%20carbon.png.transform/4col-retina/image.png",
        "Baku": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245030/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Azerbaijan%20carbon.png.transform/4col-retina/image.png",
        "Miami": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245035/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Miami%20carbon.png.transform/4col-retina/image.png",
        "Monte-Carlo": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245032/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Monte%20Carlo%20carbon.png.transform/4col-retina/image.png",
        "Montmeló": "https://media.formula1.com/image/upload/f_auto/q_auto/v1680529432/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Spain%20carbon.png.transform/4col-retina/image.png",
        "Montreal": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Canada%20carbon.png.transform/4col-retina/image.png",
        "Spielberg": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Austria%20carbon.png.transform/4col-retina/image.png",
        "Silverstone": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Great%20Britain%20carbon.png.transform/4col-retina/image.png",
        "Budapest": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Hungar%20carbon.png.transform/4col-retina/image.png",
        "Spa": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Belgium%20carbon.png.transform/4col-retina/image.png",
        "Zandvoort": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245033/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Netherlands%20carbon.png.transform/4col-retina/image.png",
        "Monza": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245031/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Italy%20carbon.png.transform/4col-retina/image.png",
        "Marina Bay": "https://media.formula1.com/image/upload/f_auto/q_auto/v1683639275/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Singapore%20carbon.png.transform/4col-retina/image.png",
        "Suzuka": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245031/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Japan%20carbon.png.transform/4col-retina/image.png",
        "Al Daayen": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245031/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Qatar%20carbon.png.transform/4col-retina/image.png",
        "Austin": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245035/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/USA%20carbon.png.transform/4col-retina/image.png",
        "Mexico City": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Mexico%20carbon.png.transform/4col-retina/image.png",
        "São Paulo": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Brazil%20carbon.png.transform/4col-retina/image.png",
        "Las Vegas": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677249931/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Las%20Vegas%20carbon.png.transform/4col-retina/image.png",
        "Abu Dhabi": "https://media.formula1.com/image/upload/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Abu%20Dhab%20carbon.png.transform/4col-retina/image.png",
        "Imola": "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245032/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia%20Romagna%20carbon.png.transform/3col-retina/image.png",
    };
    return circuit[locality] || "url/to/default-flag.png";
}

const router = useRouter();

const redirectToCreateRAce = () => {
    // Redirect the user to the create driver page using Vue Router
    router.push('/create-race');
};

const redirectToDeleteRace = () => {
    // Redirect the user to the delete driver page using Vue Router
    router.push('/delete-race');
};

const redirectToUpdateRace = () => {
    // Redirect the user to the delete driver page using Vue Router
    router.push('/update-race');
};
</script>

<template>
    <main>
        <div class="listing" v-if="isAuthenticated">
        <button @click="redirectToCreateRAce">Create Race</button>
        <button @click="redirectToUpdateRace">Update Race</button>
        <button @click="redirectToDeleteRace">Delete Race</button>
        </div>

        <h1>F1 Races 2023</h1>
        <p class="description">
            Discover everything you need to know about this year's Formula 1 races -
            winners, podiums, points repartition.
        </p>

        <div class="container">
            <div class="race" v-for="(race, index) in races" :key="race.raceId">
                <RouterLink :to="'/race/' + race.raceId" tag="div">
                    <div class="race-content">
                        <div class="listing">
                            <div class="rank">{{ index + 1 }}</div>
                            <div class="points">
                                <div class="f1-wide--s">{{ formatDate(race.date.toString()) }}</div>
                                <div class="points-label f1-wide--xxs f1-uppercase">{{ formatTime(race.time.toString()) }}
                                </div>
                            </div>
                        </div>
                        <div class="listing">
                            <div class="f1-uppercase">
                                <span class="d-block f1-bold--s f1-color--carbonBlack">{{ race.locality }}</span>
                                <span class="d-block f1--xxs f1-color--carbonBlack">{{ race.raceName }}</span>
                            </div>
                            <div class="country-flag">
                                <img :src="getCountryFlag(race.country)" alt="flag"
                                    style="display: block; max-height: 30px; width: auto;" />
                            </div>
                        </div>
                        <img :src="getCircuit(race.locality)" alt="circuit"
                            style="display: block; max-height: 200px; width: auto;" />
                        <p class="listing-item--team f1--xxs f1-color--gray5">{{ race.country }}</p>
                    </div>
                </RouterLink>
            </div>
        </div>

        <div class="container">
        </div>
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

.race {
    display: block;
    flex-direction: column;
    align-items: center;
}

.race-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 2%;
    border-top: solid 10px #e10600;
    border-right: solid 10px #e10600;
    border-width: 2px;
    border-top-right-radius: 10px;
}

.race-content:hover {
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
    width: 90px;
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
