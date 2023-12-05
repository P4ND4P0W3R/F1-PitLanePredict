const express = require("express");
const router = express.Router();
const raceController = require("../controllers/raceController");

router.get("/races", raceController.getRaces);

module.exports = router;
