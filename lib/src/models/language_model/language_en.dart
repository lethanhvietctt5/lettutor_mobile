import 'package:lettutor_mobile/src/models/language_model/language.dart';

class English extends Language {
  English() {
    name = "EN";
  }
  // Login Page
  @override
  get email => "Email";
  @override
  get password => "Password";
  @override
  get signUpQuestion => "Not a member yet ?";
  @override
  get signUp => "Sign Up";
  @override
  get signIn => "Sign In";
  @override
  get forgotPassword => "Forgot password ?";
  @override
  get continueWith => "Continue with";

  // Sign Up Page
  @override
  get confirmPassword => "Re-enter password";
  @override
  get loginQuestion => "Already have a account ?";

  // Reset Password Page
  @override
  get resetPassword => "Reset Password";
  @override
  get gobackLogin => "Goback to Login";

  // Home Page
  @override
  get home => "Home";
  @override
  get totalLessonTime => "Total lesson time is ";
  @override
  get enterRoom => "Enter lesson room";

  @override
  get recommendTutor => "Recommend Tutors";
  @override
  get seeAll => "See all";
  @override
  get wellcome => "Wellcome to LetTutor";
  @override
  get nextLesson => "Upcoming lesson";
  @override
  get bookAlesson => "Book a lesson";

  // Profile page
  @override
  get profile => "Profile";
  @override
  get fullName => "Name";
  @override
  get birthday => "Birthday";
  @override
  get phone => "Phone";
  @override
  get country => "Country";
  @override
  get level => "Level";
  @override
  get wantToLearn => "Want to learn";
  @override
  get save => "Save";

  // Course page
  @override
  get course => "Course";
  @override
  get searchCourse => "Search courses...";
  @override
  get lesson => " Lesson";
  // Course Detail
  @override
  get aboutCourse => "About Course";
  @override
  get overview => "Overview";
  @override
  get why => "Why take this course?";
  @override
  get what => "What will you be able to do?";
  @override
  get topic => "Topic";
  @override
  get tutor => "Tutor";

  // Ebook tab
  @override
  get ebook => "Ebook";
  @override
  get searchEbook => "Search ebook...";

  // Upcoming Page
  @override
  get upcoming => "Upcoming";
  @override
  get cancel => "Cancel";
  @override
  get goToMeeting => "Go to meeting";

  // Tutor search page and Tutor detail page
  @override
  get tutors => "Tutors";
  @override
  get searchTutor => "Search Tutors...";
  @override
  get booking => "Booking";
  @override
  get languages => "Languages";
  @override
  get interests => "Interests";
  @override
  get specialties => "Specialties";
  @override
  get rateAndComment => "Rate and comment";
  @override
  get selectSchedule => "Select available schedule";
  @override
  get selectScheduleDetail => "Select available schedule time";

  // Setting page
  @override
  get setting => "Setting";
  @override
  get changePassword => "Change password";
  @override
  get sessionHistory => "Session history";
  @override
  get advancedSetting => "Advanced setting";
  @override
  get logout => "Logout";

  // Change password page
  @override
  get newPassword => "Mật khẩu mới";
  @override
  get confirmNewPassword => "Nhập lại mật khẩu mới";

  // Session history page
  @override
  get giveFeedback => "Give feedback";
  @override
  get watchRecord => "Watch record";
  @override
  get mark => "Mark: ";

    // Feedback page
  @override
  get feedback => "Feedback";
  @override
  get hintFeedback => "Enter your feedback here...";
}
