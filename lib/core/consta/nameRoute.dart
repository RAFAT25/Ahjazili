/// Application route names
/// 
/// Centralized route definitions for navigation
class AppRoute {
  static const String login = "/LoginPage";
  static const String signUp = "/RegisterPage";
  static const String splashScreen = "/SplashScreen";
  static const String onBoarding = "/onBording";
  static const String checkEmail = "/CheckEmail";
  static const String language = "/language";
  static const String verificationCode = '/VerificationCode';
  static const String verificationCodeSignup = '/VerificationCodesginup';
  static const String resetPassword = '/ResetPassword';
  static const String homepage = "/Homepage";
  static const String notification = "/notification";
  static const String mainController = "/MainController";
  static const String reservations = "/Reservations";
  static const String aboutApp = "/AboutApp";
  static const String supportAndHelp = "/SupportAndHelp";
  static const String bookingView = "/BookingView";
  static const String testView = "/testview";
  static const String tripsPage = "/TripsPage";

  // Legacy getters for backward compatibility
  static String get Login => login;
  static String get SingUp => signUp;
  static String get SplashScreen => splashScreen;
  static String get onBording => onBoarding;
  static String get CheckEmail => checkEmail;
  static String get VerificationCode => verificationCode;
  static String get VerificationCodesginup => verificationCodeSignup;
  static String get ResetPassword => resetPassword;
  static String get Homepage => homepage;
  static String get MainController => mainController;
  static String get Reservations => reservations;
  static String get AboutApp => aboutApp;
  static String get SupportAndHelp => supportAndHelp;
  static String get BookingView => bookingView;
  static String get testview => testView;
  static String get TripsPage => tripsPage;
}
