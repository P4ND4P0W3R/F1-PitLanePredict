const { getAllTeamsFromDatabase } = require("../models/teamModel");

function getTeams(req, res) {
    teamModel.getAllTeamsFromDatabase((error, teams) => {
        if (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
        } else {
        res.render("pages/teams", { teams });
        }
    });
}

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