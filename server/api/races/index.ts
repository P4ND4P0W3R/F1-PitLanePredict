import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.races.findMany();
    console.log("Fetched all Races from database");
    console.log(data);
    return { data: data };
});
