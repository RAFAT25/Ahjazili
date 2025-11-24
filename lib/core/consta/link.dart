/// Application API links and endpoints
class AppLink {
  /// Base server URL
  static const String linkServer = "https://travelsystemoline.onrender.com";
  
  /// Sign up endpoint
  static String get linkSignup => "$linkServer/sginup.php";
  
  /// Login endpoint
  static String get linkLogin => "$linkServer/Login_in.php";
  
  /// Search trip endpoint
  static String get linkSearchTrip => "$linkServer/serchTrip.php";
  
  /// List users endpoint
  static String get linkListUsers => "$linkServer/list_users.php";
}

