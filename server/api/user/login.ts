import { db } from "../../prisma";
import bcrypt from 'bcrypt';

export default defineEventHandler(async event => {
    if (event.method === "OPTIONS") {
        return null;
    }

    assertMethod(event, ["POST"]);
    const body = await readBody(event)
    console.log(body);

    const { username, password } = body;

    const users = await db.users.findUnique({
        where: { username },
    });

    if (!users) {
        return {
            status: 401,
            body: JSON.stringify({ message: 'User not found' })
        }
    }

    const isPasswordValid = await bcrypt.compare(password, users.password);
    if (!isPasswordValid) {
        return {
            status: 401,
            body: JSON.stringify({ message: 'Invalid password' })
        }
    }

    return {
        status: 200,
        body: JSON.stringify({ message: 'Login successful' }),
    }
})

