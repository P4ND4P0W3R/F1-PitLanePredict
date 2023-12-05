//https://nitro.unjs.io/config
export default defineNitroConfig({
    routeRules: {
        "/api/**": {
            cors: true,
            headers: {
                "Access-Control-Allow-Methods": "GET,HEAD,PUT,PATCH,POST,DELETE",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Credentials": "true",
                "Access-Control-Allow-Headers": "*",
            },
        },
    },
});
