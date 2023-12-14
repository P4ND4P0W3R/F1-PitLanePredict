import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.races.findMany();
    console.log("Fetched all Races from database");
    return { data: data };
});
