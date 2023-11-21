const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
    res.render("pages/article");
});

module.exports = router;
