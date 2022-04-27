class User {
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final int? bookingCount;

  User(this.fname, this.lname, this.email, this.phone, this.bookingCount);
}

List demoUsers = [
  User("Subina", "Chuni", "subina@gmail.com", "898989898989", 12),
  User("Michele", "Patterson", "michele@gmail.com", "32423434234", 0),
  User("Prakriti", "Khadka", "Prakriti@gmail.com", "767676777", 9),
  User("Jyoti", "Jyoti", "Jyoti@gmail.com", "8787878787", 2),
  User("Laxman", "Wagley", "Laxman@gmail.com", "3232343454", 1),
  User("Sushant", "Major", "Sushant@gmail.com", "878676565", 0),
  User("Nikita", "Pulami", "Nikita@gmail.com", "323343354545", 0),
  User("Sundar", "Devi", "Sundar@gmail.com", "23255655767", 0),
];
