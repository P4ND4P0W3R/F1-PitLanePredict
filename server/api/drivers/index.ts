import { db } from "../../prisma";

export default defineEventHandler(async () => {
    const data = await db.drivers.findMany(
        {
            include: {
                Teams: {
                    select: {
                        name: true,
                    }
                },
                Results: {
                    select: {
                        points: true,
                    }
                }
            }
        }
    );

    console.log(data)

    // Calculate the sum of points for each driver
    const driversWithTotalPoints = data.map((driver) => ({
        ...driver,
        totalPoints: driver.Results.reduce((sum, result) => sum + (result.points || 0), 0),
    }));

    // Sort drivers by total points in descending order
    driversWithTotalPoints.sort((a, b) => b.totalPoints - a.totalPoints);

    const teamsArray = driversWithTotalPoints.map((driver) => ({
        ...driver,
        team: driver.Teams.name,
    }));

    return {
        success: true,
        message: "Successfully fetched drivers with total points and sorted by total points",
        data: teamsArray,
    };
});
