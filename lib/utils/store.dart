User user = User();

class User {
  User({this.login = '', this.email = ''});

  String login;
  String email;

  clear() async {
    login = '';
    email = '';
  }
}
