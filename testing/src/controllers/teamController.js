const { getAllTeamsFromDatabase } = require("../models/teamModel");

const getTeams = async (req, res) => {
    try {
        const teams = await getAllTeamsFromDatabase();

        // Send the teams as a response
        res.json({ teams });
    } catch (error) {
        // Handle errors
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const teamController = {
    getTeams: async (req, res) => {
        try {
            const teams = await getAllTeamsFromDatabase();
            console.log(teams);
            res.render("pages/teams", { teams });
        } catch (error) {
            console.error("Error fetching teams:", error);
            res.status(500).send("Internal Server Error");
        }
    },
}

module.exports = teamController;