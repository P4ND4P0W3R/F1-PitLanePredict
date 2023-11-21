const express = require("express");
const dotenv = require("dotenv");
const path = require("path");

// Load environment variables from .env file
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(express.static(path.join(__dirname, "static")));
app.set("view engine", "ejs");

// Routes
const indexRoutes = require("./routes/index");
const aboutRoutes = require("./routes/aboutRoutes");
const userRoutes = require("./routes/userRoutes");
const articleRoutes = require("./routes/articleRoutes");
const betRoutes = require("./routes/betRoutes");
const driverRoutes = require("./routes/driverRoutes");
const teamRoutes = require("./routes/teamRoutes");

app.use("/", indexRoutes);
app.use("/users", userRoutes);
app.use("/articles", articleRoutes);
app.use("/bets", betRoutes);
app.use("/about", aboutRoutes);
app.use("/", driverRoutes);
app.use("/", teamRoutes);

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
