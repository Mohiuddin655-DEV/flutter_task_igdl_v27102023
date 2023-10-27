import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_US': _english,
      'ur_PK': _urdu,
    };
  }

  final Map<String, String> _english = {
    'email_hint': "Enter Email",
    'username_hint': "Enter Username or ID",
    'password_hint': "Enter Password",
    'try_again': "Try again",
    'internet_exception':
        "We're unable to show results, \nPlease check your data \nconnection.",
    'general_exception':
        "We're unable to process your request.\n Please try again",
    'welcome_back': "Welcome back",
    'login': "Login",
  };

  final Map<String, String> _urdu = {
    'email_hint': "ای میل درج کریں۔",
    'try_again': "دوبارہ کوشش کریں",
    'internet_exception':
        "ہم نتائج دکھانے سے قاصر ہیں، \nبراہ کرم اپنا ڈیٹا\nکنکشن چیک کریں۔",
  };
}
