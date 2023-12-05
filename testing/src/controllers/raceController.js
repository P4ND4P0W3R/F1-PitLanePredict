const { getAllRacesFromDatabase } = require("../models/raceModel");

const getRaces = async (req, res) => {
    try {
        const races = await getAllRacesFromDatabase();

        // Send the races as a response
        res.json({ races });
    } catch (error) {
        // Handle errors
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const raceController = {
    getRaces: async (req, res) => {
        try {
            const races = await getAllRacesFromDatabase();
            console.log(races);
            res.render("pages/races", { races });
        } catch (error) {
            console.error("Error fetching races:", error);
            res.status(500).send("Internal Server Error");
        }
    },
}

module.exports = raceController;