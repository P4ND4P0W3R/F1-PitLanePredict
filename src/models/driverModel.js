const pool = require('../utils/db');

class Driver {
    constructor(driverId, driverName, teamId, nationality, dateOfBirth, image) {
        this.driver_id = driverId;  // Use snake_case for consistency with the database
        this.driver_name = driverName;  // Use camelCase for consistency in your application
        this.team_id = teamId;
        this.nationality = nationality;
        this.date_of_birth = dateOfBirth;
        this.image = image;
        this.team = team;
    }
}


// Function to get all drivers from the database
const getDriversFromDatabase = () => {
    return new Promise(async (resolve, reject) => {
        try {
            // Get a connection from the pool
            const connection = await pool.getConnection();

            // Use the connection to query the database
            const [results] = await connection.query('SELECT * FROM Drivers');

            // Release the connection back to the pool
            connection.release();

            resolve(results);
        } catch (error) {
            reject(error);
        }
    });
};

// Function to get details of a specific driver from the database
const getDriverDetailsFromDatabase = async (driverId) => {
    return new Promise(async (resolve, reject) => {
        try {
            // Get a connection from the pool
            const connection = await pool.getConnection();

            // Use the connection to query the database with a parameter
            const [results] = await connection.execute('SELECT * FROM Drivers WHERE driver_id = ?', [driverId || null]);

            // Release the connection back to the pool
            connection.release();

            if (results.length > 0) {
                const driverDetails = results[0];

                // Check if the image property is defined before using it
                if ('image' in driverDetails && driverDetails.image !== null) {
                    // Do something with the image property
                }

                resolve(driverDetails); // Assuming there is only one driver with the given ID
            } else {
                resolve(null); // Driver not found
            }
        } catch (error) {
            reject(error);
        }
    });
};


module.exports = { Driver, getDriversFromDatabase, getDriverDetailsFromDatabase };
