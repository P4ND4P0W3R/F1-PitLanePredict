// RaceModel.js
class Race {
    constructor(raceId, raceName, circuit, location, dateOfRace, winnerId) {
    this.raceId = raceId;
    this.raceName = raceName;
    this.circuit = circuit;
    this.location = location;
    this.dateOfRace = dateOfRace;
    this.winnerId = winnerId;
    }
}

module.exports = Race;
