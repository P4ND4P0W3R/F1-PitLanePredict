import { db } from "../../prisma";
import bcrypt from "bcrypt";

export default defineEventHandler(async (event) => {
    if (event.method === "OPTIONS") {
        // set your options here
        return null;
    }
    assertMethod(event, ["POST"]);
    const body = await readBody(event);
    console.log(body)
    console.log(body.permanentNumber)

    const { driverId, permanentNumber, givenName, familyName } = body;

    const numericPermanentNumber = typeof permanentNumber === 'string' ? parseInt(permanentNumber, 10) : permanentNumber;

    const drivers = await db.drivers.create({
        data: {
            driverId: driverId,
            permanentNumber: numericPermanentNumber,
            givenName: givenName,
            familyName: familyName
        },
    });

    return {
        status: 200,
        body: JSON.stringify(drivers),
    };
});