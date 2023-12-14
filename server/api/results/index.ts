import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.results.findMany();
    return { data: data };
});
