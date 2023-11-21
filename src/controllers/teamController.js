const { getAllTeamsFromDatabase } = require("../models/teamModel");

// Controller function to get all teams and render the teams page
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

// You can define other controller functions for updating, deleting, or inserting teams as needed

module.exports = {
    getTeams,
};
