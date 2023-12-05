const express = require("express");
const router = express.Router();
const teamController = require("../controllers/teamController");

router.get("/teams", teamController.getTeams);

module.exports = router;
