class User {
  final String _email;
  final String _fullName;
  DateTime birthDate;
  String phone;
  String country;
  String level;

  User(this._email, this._fullName, this.birthDate, this.country, this.level, [this.phone = ""]);

  String get email => _email;
  String get fullName => _fullName;
}
