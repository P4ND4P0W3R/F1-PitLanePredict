const express = require("express");
const router = express.Router();
const driverController = require("../controllers/driverController");

// Define routes for driver actions
router.get("/drivers", driverController.getDrivers);
router.get("/drivers/:driverId", driverController.getDriverDetails);

module.exports = router;
