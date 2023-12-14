import { db } from "../../prisma";
import bcrypt from "bcrypt";
import jwt from 'jsonwebtoken';

export default defineEventHandler(async (event) => {
    if (event.method === "OPTIONS") {
        // set your options here
        return null;
    }
    assertMethod(event, ["POST"]);
    const body = await readBody(event);
    console.log(body);

    const { oldTeamId, newTeamId, name, nationality, url, teamLogo, token } = body;
    console.log(token);

    const secretKey = 'Z8YXC8GW!3rc';

    if (token) {
        try {
            const decoded = jwt.verify(token, secretKey);

            // Check token expiration
            const currentTimestamp = Math.floor(Date.now() / 1000); // Current time in seconds
            if (decoded.exp && decoded.exp < currentTimestamp) {
                // Token has expired
                console.error('JWT has expired.');
                return {
                    status: 401,
                    body: JSON.stringify({ error: 'Token has expired' }),
                };
            }

            console.log('Decoded JWT:', decoded);
            const userRole = decoded.userType;
            console.log('User roles:', userRole);

            if (userRole === 'admin') {
                console.log('Admin role detected. Allowing operation.');

                const updatedTeam = await db.teams.update({
                    where: {
                        teamId: oldTeamId,
                    },
                    data: {
                        teamId: newTeamId,
                        name: name,
                        nationality: nationality,
                        url: url,
                        teamLogo: teamLogo,
                    },
                });

                console.log(`Team with teamId ${oldTeamId} has been updated.`);
                console.log(updatedTeam); // The updated driver object

                return {
                    status: 200,
                    body: JSON.stringify(updatedTeam),
                };
            } else {
                // Deny the operation
                console.log('User does not have the necessary privileges.');
                // You might want to send a 403 Forbidden response in this case
                return {
                    status: 403,
                    body: JSON.stringify({ error: 'Forbidden' }),
                };
            }
        } catch (error) {
            // Handle JWT verification failure
            console.error('JWT verification failed:', error.message);
            return {
                status: 401,
                body: JSON.stringify({ error: 'Unauthorized' }),
            };
        }
    }

    return {
        status: 400,
        body: JSON.stringify({ error: 'Bad Request' }),
    };
});
