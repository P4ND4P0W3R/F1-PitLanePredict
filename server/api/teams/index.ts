import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.constructors.findMany(
        {
            include: {
                Drivers: {
                    select: {
                        givenName: true,
                        familyName: true,
                        driverImage: true,
                        driverId: true,
                        Results: {
                            select: {
                                points: true,
                            }
                        }
                    }
                }
            }
        }
    );

    console.log(data);

    // Calculate total points for each constructor
    const constructorPoints = data.map((constructor) => {
        const totalPoints = constructor.Drivers.reduce((sum, driver) => {
            return (
                sum +
                driver.Results.reduce((driverPoints, result) => {
                    return driverPoints + result.points;
                }, 0)
            );
        }, 0);

        return {
            ...constructor,
            totalPoints: totalPoints,
        };
    });

    return { data: constructorPoints };
});
