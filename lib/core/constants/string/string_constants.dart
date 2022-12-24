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

  // login
  get login => "Login to your Account";
  get email => "Email";
  get password => "Password";
  get remember => "Remember me";
  get signin => "Sign in";
  get or => "or continue with";
  get dontHave => "Don't have account?";
  get forgotPass => "Forgot the password?";

  //register
  get register => "Create your Account";
  get signup => "Sign up";
  get alreadyHave => "Already have an account?";

  // error
  get emailHata => "Please input email";
  get passwordHata => "Please input password";
}
