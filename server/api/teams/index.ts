import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.teams.findMany(
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

    // Calculate total points for each team
    const teamPoints = data.map((team) => {
        const totalPoints = team.Drivers.reduce((sum, driver) => {
            return (
                sum +
                driver.Results.reduce((driverPoints, result) => {
                    return driverPoints + result.points;
                }, 0)
            );
        }, 0);

        return {
            ...team,
            totalPoints: totalPoints,
        };
    });

    return { data: teamPoints };
});
