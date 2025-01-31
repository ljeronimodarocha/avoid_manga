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
}
