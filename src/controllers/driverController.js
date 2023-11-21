const { getDriversFromDatabase, getDriverDetailsFromDatabase } = require("../models/driverModel");

const driverController = {
    getDrivers: async (req, res) => {
        try {
            const drivers = await getDriversFromDatabase();
            console.log(drivers);
            res.render("pages/drivers", { drivers });
        } catch (error) {
            console.error("Error fetching drivers:", error);
            res.status(500).send("Internal Server Error");
        }
    },

    getDriverDetails: async (req, res) => {
        try {
            const driverId = req.params.driverId;
            const driverDetails = await getDriverDetailsFromDatabase(driverId);

            if (driverDetails) {
                // Make sure dateOfBirth is retrieved from the database
                if (driverDetails.dateOfBirth) {
                    driverDetails.dateOfBirth = driverDetails.dateOfBirth.toDateString();
                }

                res.render("pages/driverDetails", { driverDetails, error: null });
            } else {
                res.status(404).render("pages/driverDetails", { driverDetails: null, error: "Driver not found" });
            }
        } catch (error) {
            console.error("Error fetching driver details:", error);
            res.status(500).render("pages/driverDetails", { driverDetails: null, error: "Internal Server Error" });
        }
    },
};

module.exports = driverController;
