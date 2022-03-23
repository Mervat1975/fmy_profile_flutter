class User {
  final String imagePath;
  final String firstName;
  final String lastName;
  final String pass;
  final String email;
  final String about;
  final int countryIndex;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.firstName,
    required this.lastName,
    required this.pass,
    required this.email,
    required this.about,
    required this.countryIndex,
    required this.isDarkMode,
  });
}
