// BetModel.js
class Bet {
    constructor(betId, userId, raceId, driverId, amount, status, betType, betTimestamp, payout) {
    this.betId = betId;
    this.userId = userId;
    this.raceId = raceId;
    this.driverId = driverId;
    this.amount = amount;
    this.status = status;
    this.betType = betType;
    this.betTimestamp = betTimestamp;
    this.payout = payout;
    }
}

module.exports = Bet;
