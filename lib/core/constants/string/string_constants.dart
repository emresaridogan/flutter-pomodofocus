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
  get accountSetupTitle => "Let's you in";
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

  // create profile
  get fillProfile => "Fill Your Profile";
  get changeLater =>
      "Don't worry, you can always change it later or you can skip it for now.";
  get fullName => "Full Name";
  get nickname => "Nickname";
  get phoneNumber => "Phone Number";
  get skip => "Skip";
  get start => "Start";

  // create task
  get title => "Title";
  get taskTitle => "Task Title";
  get date => "Date";
  get startTime => "Start Time";

  // error
  get emailError => "Please input email";
  get passwordError => "Please input password";
  get fullNameError => "Please input fullname ";
  get nicknameError => "Please input nickname ";
  get phoneNumberError => "Please input phone number ";
  get selectCategory => "Select Category";
  get category => "Category";
  get workingSessions => "Working Sessions";
  get longBreak => "Long Break";
  get shortBreak => "Short Break";
  get createTask => "Create New Task";
}
