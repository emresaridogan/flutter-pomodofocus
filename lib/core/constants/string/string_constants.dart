class StringConstants {
  static StringConstants? _instance;

  static StringConstants get instance => _instance ??= StringConstants._init();

  StringConstants._init();

  // onboard
  get onboard1 => "Easy task & work management with pomo";
  get onboard2 => "Track your productivity & gain insights";
  get next => "Next";
  get onboard3button => "Get Started";
  get onboard3 => "Boost your productivity now & be successful";

  // account setup
  get AccountSetupTitle => "Let's you in";
  get continueFacebook => "Continue with Facebook";
  get continueGoogle => "Continue with Google";
  get continueApple => "Continue with Apple";
  get or => "or";
  get signInPass => "Sign in with password";
  // login
  get login => "Login to your Account";
  get email => "Email";
  get password => "Password";
  get remember => "Remember me";
  get signin => "Sign in";
  get orWith => "or continue with";
  get dontHave => "Don't have an account?";
  get forgotPass => "Forgot the password?";

  //register
  get register => "Create your Account";
  get signup => "Sign up";
  get alreadyHave => "Already have an account?";

  // error
  get emailHata => "Please input email";
  get passwordHata => "Please input password";
}
