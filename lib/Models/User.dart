class User {
  late String Id, Email, FirstName, LastName, Password, token;
  late DateTime ExpireationDate;

  User.Register(this.Email, this.FirstName, this.LastName, this.Password);
  User.Login(this.Email, this.Password);
  User.LoggedUser(this.Id, this.token, this.ExpireationDate);

  User.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Email = json['Email'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    Password = json['Password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Email'] = this.Email;
    data['FirstName'] = this.FirstName;
    data['LastName'] = this.LastName;
    data['Password'] = this.Password;
    return data;
  }
}
