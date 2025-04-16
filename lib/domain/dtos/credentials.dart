class Credentials {
  String username;
  String password;
  String clientId;
  String clientSecret;
  Credentials(
      {this.username = '',
      this.password = '',
      this.clientId = '',
      this.clientSecret = ''});

  void setUsername(String username) {
    this.username = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void seClienteID(String clientId) {
    this.clientId = clientId;
  }

  void setClientSecret(String clientSecret) {
    this.clientSecret = clientSecret;
  }

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      clientId: json['clientId'] ?? '',
      clientSecret: json['clientSecret'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'clientId': clientId,
      'clientSecret': clientSecret,
    };
  }
}
