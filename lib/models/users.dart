class UsersData{
  final String email;
  final String password;


  UsersData ({
    required this.email,
    required this.password,

  });
}
List<UsersData> users = [
  UsersData(email: 'fady@gmail.com', password: '123456'),
  UsersData(email: 'abdelrahman@gmail.com', password: '1234567'),
  UsersData(email: 'hassan@gmail.com', password: '12345678'),
  UsersData(email: 'tharwat@gmail.com', password: '1234567'),
  UsersData(email: 'diaa@gmail.com', password: '1234567'),
];

bool checkUser(String email, String password) {
  bool foundUser = false;
  for (int i = 0; i < users.length; i++) {
    if (email == users[i].email && password == users[i].password) {
      foundUser = true;
      break;
    }
  }
  return foundUser;
}