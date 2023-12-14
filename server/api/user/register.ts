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
  console.log(body)

  const { username, email, password } = body;

  const hashedPassword = await bcrypt.hash(password, 12);

  const users = await db.users.create({
    data: {
      username: username,
      email: email,
      password: hashedPassword,
    },
  });

  return {
    status: 200,
    body: JSON.stringify(users),
  };
});
