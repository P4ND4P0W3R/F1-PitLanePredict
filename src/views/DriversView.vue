<script setup lang="ts">
import { ref, onMounted } from "vue";

interface Driver {
  driverId: string;
  code: string;
  permanentNumber: number;
  givenName: string;
  familyName: string;
  dateOfBirth: Date;
  nationality: string;
  url: string;
  driverImage: string;
  teamId: string;
  team: string;
  totalPoints: number;
}

const drivers = ref<null | Driver[]>(null);

async function fetchData() {
  try {
    const response = await fetch("http://localhost:3000/api/drivers");
    const data = await response.json();
    drivers.value = data.data;
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}

onMounted(() => {
  document.title = "F1 Drivers 2023";
  fetchData();
});

function formatDate(dateString: string): string {
  const date = new Date(dateString);
  const options: Intl.DateTimeFormatOptions = { year: "numeric", month: "long", day: "numeric" };
  return date.toLocaleDateString("en-US", options);
}

function getNationalityFlag(nationality: string): string {
  const nationalityFlags: { [key: string]: string } = {
    British:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/United%20Kingdom.jpg.transform/2col-retina/image.jpg",
    German:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Germany.jpg.transform/2col-retina/image.jpg",
    Dutch:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Netherlands.jpg.transform/2col-retina/image.jpg",
    Mexican:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Mexico.jpg.transform/2col-retina/image.jpg",
    Spanish:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Spain.jpg.transform/2col-retina/image.jpg",
    Finnish:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Finland.jpg.transform/2col-retina/image.jpg",
    Monegasque:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Monaco.jpg.transform/2col-retina/image.jpg",
    French:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/France.jpg.transform/2col-retina/image.jpg",
    Australian:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Australia.jpg.transform/2col-retina/image.jpg",
    Canadian:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Canada.jpg.transform/2col-retina/image.jpg",
    Thai: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Thailand.jpg.transform/2col-retina/image.jpg",
    Japanese:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Japan.jpg.transform/2col-retina/image.jpg",
    Chinese:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/China.jpg.transform/2col-retina/image.jpg",
    Danish:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Denmark.jpg.transform/2col-retina/image.jpg",
    "New Zealander":
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/New%20Zealand.jpg.transform/2col-retina/image.jpg",
    American:
      "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/United%20States.jpg.transform/2col-retina/image.jpg",
  };
  return nationalityFlags[nationality] || "url/to/default-flag.png";
}

function getDriverNumber(permanentNumber: number): string {
  const driverNumber: { [key: number]: string } = {
    33: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/MAXVER01.png.transform/2col-retina/image.png",
    11: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/SERPER01.png.transform/2col-retina/image.png",
    44: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/LEWHAM01.png.transform/2col-retina/image.png",
    14: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/FERALO01.png.transform/2col-retina/image.png",
    16: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/CHALEC01.png.transform/2col-retina/image.png",
    4: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/LANNOR01.png.transform/2col-retina/image.png",
    55: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/CARSAI01.png.transform/2col-retina/image.png",
    63: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/GEORUS01.png.transform/2col-retina/image.png",
    81: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/OSCPIA01.png.transform/2col-retina/image.png",
    18: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/LANSTR01.png.transform/2col-retina/image.png",
    10: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/PIEGAS01.png.transform/2col-retina/image.png",
    31: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/ESTOCO01.png.transform/2col-retina/image.png",
    23: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/ALEALB01.png.transform/2col-retina/image.png",
    22: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/YUKTSU01.png.transform/2col-retina/image.png",
    77: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/VALBOT01.png.transform/2col-retina/image.png",
    27: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/NICHUL01.png.transform/2col-retina/image.png",
    3: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/DANRIC01.png.transform/2col-retina/image.png",
    24: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/GUAZHO01.png.transform/2col-retina/image.png",
    20: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/KEVMAG01.png.transform/2col-retina/image.png",
    40: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/LIALAW01.png.transform/2col-retina/image.png",
    2: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/LOGSAR01.png.transform/2col-retina/image.png",
    21: "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/2018-redesign-assets/drivers/number-logos/NYCDEV01.png.transform/2col-retina/image.png",
  };
  return driverNumber[permanentNumber] || "url/to/default-driver-number.png";
}

import axios from "axios";

const driverId = ref(null)
const permanentNumber = ref(null)
const givenName = ref(null)
const familyName = ref(null)


async function addCar() {
  await axios
    .post("http://localhost:3000/api/drivers/create", {
      driverId: driverId.value,
      permanentNumber: permanentNumber.value,
      givenName: givenName.value,
      familyName: familyName.value,
    })
    .then((response) => {
      console.log(response.data.message);
      // Redirect or perform other actions on successful login
    })
    .catch((error) => {
      console.error("Login failed:", error.response.data.message);
    });
}
</script>

<template>
  <main>
    <h2>Create driver</h2>
    <form @submit.prevent="addCar">
      <label for="driverId">Driver's ID:</label>
      <input type="text" id="driverId" v-model="driverId" required />

      <label for="permanentNumber">Driver's number:</label>
      <input type="text" id="permanentNumber" v-model="permanentNumber" required />
      <label for="givenName">Driver's given name:</label>
      <input type="text" id="givenName" v-model="givenName" required />
      <label for="familyName">Driver's family name:</label>
      <input type="text" id="familyName" v-model="familyName" required />

      <button type="submit">Create</button>
    </form>

    <h1>F1 Drivers 2023</h1>
    <p class="description">
      Check out this season's official F1 line-up. Full breakdown of drivers, points and current positions. Follow your
      favourite F1 drivers on and off the track.
    </p>

    <div class="container">
      <div class="driver" v-for="(driver, index) in drivers" :key="driver.driverId">
        <RouterLink :to="'/driver/' + driver.driverId" tag="div">
          <div class="driver-content">
            <div class="listing">
              <div class="rank">{{ index + 1 }}</div>
              <div class="points">
                <div class="f1-wide--s">{{ driver.totalPoints }}</div>
                <div class="points-label f1-wide--xxs f1-uppercase">PTS</div>
              </div>
            </div>
            <div class="listing">
              <div class="f1-uppercase">
                <span class="d-block f1--xxs f1-color--carbonBlack">{{ driver.givenName }}</span>
                <span class="d-block f1-bold--s f1-color--carbonBlack">{{ driver.familyName }}</span>
              </div>
              <div class="country-flag">
                <img :src="getNationalityFlag(driver.nationality)" alt="flag"
                  style="display: block; max-height: 30px; width: auto" />
              </div>
            </div>
            <div class="listing">
              <div>
                <img :src="getDriverNumber(driver.permanentNumber)" alt="number"
                  style="display: block; max-height: 50px; width: auto" />
              </div>
              <img :src="driver.driverImage" alt="driver" style="height: 200px; width: auto; border-radius: 10px" />
            </div>
            <p class="listing-item--team f1--xxs f1-color--gray5">{{ driver.team }}</p>
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
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  grid-auto-rows: minmax(100px, auto);
  gap: 30px;
  padding: 2rem;
}

.driver {
  display: block;
  flex-direction: column;
  align-items: center;
}

.driver-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2%;
  border-top: solid 10px #e10600;
  border-right: solid 10px #e10600;
  border-width: 2px;
  border-top-right-radius: 10px;
}

.driver-content:hover {
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
