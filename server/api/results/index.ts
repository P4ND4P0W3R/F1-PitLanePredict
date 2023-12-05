import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.results.findMany();
    console.log("Fetched all Results from database");
    return { data: data };
});
