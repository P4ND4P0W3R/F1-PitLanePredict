// ResultModel.js
class Result {
    constructor(resultId, teamId, raceId, driverId, positionDriver, lapTime, pointsEarned) {
    this.resultId = resultId;
    this.teamId = teamId;
    this.raceId = raceId;
    this.driverId = driverId;
    this.positionDriver = positionDriver;
    this.lapTime = lapTime;
    this.pointsEarned = pointsEarned;
    }
}

module.exports = Result;
