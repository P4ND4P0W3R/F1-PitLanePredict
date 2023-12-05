<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";

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
    constructorId: string;
    constructor: string;
    totalPoints: number;
}

const drivers = ref<null | Driver[]>(null);
const route = useRoute();
const givenName = ref<null | string>(null);
const familyName = ref<null | string>(null);

async function fetchData() {
    try {
        const response = await fetch("http://localhost:3000/api/drivers");
        const data = await response.json();
        const driverId = route.params.driverId;
        console.log(driverId);
        drivers.value = data.data.filter((driver: Driver) => driver.driverId === driverId);

        if (drivers.value && drivers.value.length > 0) {
            givenName.value = drivers.value[0].givenName;
            familyName.value = drivers.value[0].familyName;

            document.title = `${givenName.value} ${familyName.value}`;
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}
onMounted(() => {
    fetchData();
});

function formatDate(dateString: string): string {
    const date = new Date(dateString);
    const options: Intl.DateTimeFormatOptions = { year: 'numeric', month: 'long', day: 'numeric' };
    return date.toLocaleDateString('en-US', options);
}

function getNationalityFlag(nationality: string): string {
    const nationalityFlags: { [key: string]: string } = {
        "British": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/United%20Kingdom.jpg.transform/2col-retina/image.jpg",
        "German": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Germany.jpg.transform/2col-retina/image.jpg",
        "Dutch": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Netherlands.jpg.transform/2col-retina/image.jpg",
        "Mexican": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Mexico.jpg.transform/2col-retina/image.jpg",
        "Spanish": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Spain.jpg.transform/2col-retina/image.jpg",
        "Finnish": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Finland.jpg.transform/2col-retina/image.jpg",
        "Monegasque": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Monaco.jpg.transform/2col-retina/image.jpg",
        "French": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/France.jpg.transform/2col-retina/image.jpg",
        "Australian": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Australia.jpg.transform/2col-retina/image.jpg",
        "Canadian": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Canada.jpg.transform/2col-retina/image.jpg",
        "Thai": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Thailand.jpg.transform/2col-retina/image.jpg",
        "Japanese": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Japan.jpg.transform/2col-retina/image.jpg",
        "Chinese": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/China.jpg.transform/2col-retina/image.jpg",
        "Danish": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/Denmark.jpg.transform/2col-retina/image.jpg",
        "New Zealander": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/New%20Zealand.jpg.transform/2col-retina/image.jpg",
        "American": "https://media.formula1.com/d_default_fallback_image.png/content/dam/fom-website/flags/United%20States.jpg.transform/2col-retina/image.jpg",
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
</script>


<template>
    <main>
        <h1>F1 Drivers 2023</h1>
        <p class="description">
            Check out this season's official F1 line-up. Full breakdown of drivers, points and current positions. Follow
            your
            favourite F1 drivers on and off the track.
        </p>

        <div class="container">
            <div class="driver" v-for="(driver, index) in drivers" :key="driver.driverId">
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
                                    style="display: block; max-height: 30px; width: auto;" />
                            </div>
                        </div>

                    <table>
                        <tr>
                            <th scope="row">Team</th>
                            <td><RouterLink :to="'/team/' + driver.constructorId" tag="div" style="color: hsla(160, 100%, 37%, 1);">{{ driver.constructor }}</RouterLink></td>
                        </tr>
                        <tr>
                            <th scope="row">Nationality</th>
                            <td>{{ driver.nationality }}</td>
                        </tr>
                        <tr>
                            <th scope="row">Date of birth</th>
                            <td>{{ formatDate(driver.dateOfBirth.toString()) }}</td>
                        </tr>
                        <tr>
                            <th scope="row">Code</th>
                            <td>{{ driver.code }} </td>
                        </tr>
                        <tr>
                            <th scope="row">More info:</th>
                            <td><a :href=driver.url style="color: hsla(160, 100%, 37%, 1);">CLICK HERE</a></td>
                        </tr>
                    </table>

                    <div class="listing">
                        <div>
                            <img :src="getDriverNumber(driver.permanentNumber)" alt="number"
                                style="display: block; max-height: 50px; width: auto;" />
                        </div>
                        <img :src="driver.driverImage" alt="driver" style="height: 200px; width: auto; border-radius: 10px;" />
                    </div>
                </div>
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

table {
    color: #fff;
    padding-bottom: 10px;
    border-bottom: 1px solid #949498;
    margin-bottom: 10px;
    align-items: left;
    min-width: 100%;
}

table th {
    font-family: F1Bold;
    display: flex;
    justify-content: left;
    text-align: left;
}

table td {
    font-family: TittiliumWebRegular;
    text-align: right;
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

