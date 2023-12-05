<script setup lang="ts">
import { ref, onMounted } from "vue";

interface Team {
    constructorId: string;
    name: string;
    nationality: string;
    url: string;
    teamLogo: string;
    Drivers: Driver[];
    totalPoints: number;
}

interface Driver {
    givenName: string;
    familyName: string;
    driverImage: string;
    Results: Result[];
}

interface Result {
    points: number;
}

const teams = ref<null | Team[]>(null);

async function fetchData() {
    try {
        const response = await fetch("http://localhost:3000/api/teams");
        const data = await response.json();
        teams.value = data.data;
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

onMounted(() => {
    document.title = "F1 Teams 2023";
    fetchData();
});

function getTeamLogo(name: string): string {
    const teamLogos: { [key: string]: string } = {
        "Red Bull": "https://media.formula1.com/content/dam/fom-website/teams/2023/red-bull-racing-logo.png.transform/2col-retina/image.png",
        "Mercedes": "https://media.formula1.com/content/dam/fom-website/teams/2023/mercedes-logo.png.transform/2col-retina/image.png",
        "Ferrari": "https://media.formula1.com/content/dam/fom-website/teams/2023/ferrari-logo.png.transform/2col-retina/image.png",
        "McLaren": "https://media.formula1.com/content/dam/fom-website/teams/2023/mclaren-logo.png.transform/2col-retina/image.png",
        "Aston Martin": "https://media.formula1.com/content/dam/fom-website/teams/2023/aston-martin-logo.png.transform/2col-retina/image.png",
        "Alpine F1 Team": "https://media.formula1.com/content/dam/fom-website/teams/2023/alpine-logo.png.transform/2col-retina/image.png",
        "Williams": "https://media.formula1.com/content/dam/fom-website/teams/2023/williams-logo.png.transform/2col-retina/image.png",
        "AlphaTauri": "https://media.formula1.com/content/dam/fom-website/teams/2023/alphatauri-logo.png.transform/2col-retina/image.png",
        "Alfa Romeo": "https://media.formula1.com/content/dam/fom-website/teams/2023/alfa-romeo-logo.png.transform/2col-retina/image.png",
        "Haas F1 Team": "https://media.formula1.com/content/dam/fom-website/teams/2023/haas-f1-team-logo.png.transform/2col-retina/image.png",
    };
    return teamLogos[name] || "url/to/default-flag.png";
}

function getTeamCar(name: string): string {
    const teamCars: { [key: string]: string } = {
        "Red Bull": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/red-bull-racing.png.transform/4col-retina/image.png",
        "Mercedes": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/mercedes.png.transform/4col-retina/image.png",
        "Ferrari": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/ferrari.png.transform/4col-retina/image.png",
        "McLaren": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/mclaren.png.transform/4col-retina/image.png",
        "Aston Martin": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/aston-martin.png.transform/4col-retina/image.png",
        "Alpine F1 Team": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alpine.png.transform/4col-retina/image.png",
        "Williams": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/williams.png.transform/4col-retina/image.png",
        "AlphaTauri": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alphatauri.png.transform/4col-retina/image.png",
        "Alfa Romeo": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alfa-romeo.png.transform/4col-retina/image.png",
        "Haas F1 Team": "https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/haas-f1-team.png.transform/4col-retina/image.png",
    };
    return teamCars[name] || "url/to/default-flag.png";
}


</script>

<template>
    <main>
        <h1>F1 Teams 2023</h1>
        <p class="description">
            Discover everything you need to know about this year's Formula 1 teams - drivers, podium finishes, points earned
            and championship titles.
        </p>

        <div class="container">
            <div class="team" v-for="(team, index) in teams" :key="team.constructorId">
                <RouterLink :to="'/team/' + team.constructorId" tag="div">
                    <div class="team-content">
                        <div class="listing">
                            <div class="rank">{{ index + 1 }}</div>
                            <div class="points">
                                <div class="f1-wide--s">{{ team.totalPoints }}</div>
                                <div class="points-label f1-wide--xxs f1-uppercase">PTS</div>
                            </div>
                        </div>
                        <div class="listing">
                            <div>
                                <span class="d-block f1-bold--s f1-color--carbonBlack">{{ team.name }}</span>
                            </div>
                            <div class="country-flag">
                                <img :src="getTeamLogo(team.name)" alt="logo"
                                    style="display: block; max-height: 45px; width: auto;" />
                            </div>
                        </div>
                        <div class="listing">
                            <div class="f1-uppercase" v-for="(driver, driverIndex) in team.Drivers.slice(0, 2)"
                                :key="driverIndex">
                                <span class="d-block f1--xxs f1-color--carbonBlack">{{ driver.givenName }}</span>
                                <span class="d-block f1-bold--s f1-color--carbonBlack">{{ driver.familyName }}</span>
                                <img :src="driver.driverImage" alt="driver_photo"
                                    style="display: block; max-width: 90%; border-radius: 5px;" />
                            </div>
                        </div>
                        <img :src="getTeamCar(team.name)" alt="logo" style="display: block; max-width: 100%; " />
                    </div>
                </RouterLink>
            </div>
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
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    grid-auto-rows: minmax(100px, auto);
    gap: 30px;
    padding: 2rem;
}

.team {
    display: block;
    flex-direction: column;
    align-items: center;
}

.team-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 2%;
    border-top: solid 10px #e10600;
    border-right: solid 10px #e10600;
    border-width: 2px;
    border-top-right-radius: 10px;

}

.team-content:hover {
    border-top-right-radius: 10px;
    border-color: hsla(160, 100%, 37%, 1);

    transition: .1s all ease;
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
    letter-spacing: .5px;
    font-weight: 400;
}

.f1-uppercase {
    text-transform: uppercase;
}

.f1--xxs {
    font-family: F1;
    font-size: 12px;
    line-height: 15px;
    letter-spacing: .5px;
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
    letter-spacing: .5px;
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