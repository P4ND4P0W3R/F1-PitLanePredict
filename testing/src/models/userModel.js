// UserModel.js
class User {
    constructor(userId, username, password, email, balance, registrationDate, lastLogin, country, userType) {
    this.userId = userId;
    this.username = username;
    this.password = password;
    this.email = email;
    this.balance = balance;
    this.registrationDate = registrationDate;
    this.lastLogin = lastLogin;
    this.country = country;
    this.userType = userType;
    }
}

module.exports = User;
