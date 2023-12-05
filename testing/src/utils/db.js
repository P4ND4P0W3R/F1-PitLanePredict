const mysql = require("mysql2/promise");

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
});

module.exports = {
    async getConnection() {
        try {
            const conn = await pool.getConnection();
            console.log("DB is connected");
            return conn;
        } catch (error) {
            console.error('Error connecting to the database:', error);
            throw error;
        }
    },
};
