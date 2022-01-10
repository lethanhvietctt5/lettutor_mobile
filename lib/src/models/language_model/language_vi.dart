import 'package:lettutor_mobile/src/models/language_model/language.dart';

class VietNamese extends Language {
  VietNamese() {
    name = "VI";
  }

  // Login Page
  @override
  get email => "Email";
  @override
  get password => "Mật khẩu";
  @override
  get signUpQuestion => "Chưa có tài khoản? ";
  @override
  get signUp => "Đăng ký";
  @override
  get signIn => "Đăng nhập";
  @override
  get forgotPassword => "Quên mật khẩu ?";
  @override
  get continueWith => "Đăng nhập với";

  // Sign Up Page
  @override
  get confirmPassword => "Xác nhận mật khẩu";
  @override
  get loginQuestion => "Đã có tài khoản? ";

  // Reset Password Page
  @override
  get resetPassword => "Đặt lại mật khẩu";
  @override
  get gobackLogin => "Quay lại đăng nhập";

  // Home Page
  @override
  get home => "Trang chủ";
  @override
  get totalLessonTime => "Tổng thời gian học là ";

  @override
  get enterRoom => "Vào phòng học";
  @override
  get recommendTutor => "Gợi ý gia sư";
  @override
  get seeAll => "Xem tất cả";
  @override
  get wellcome => "Chào mừng đến với LetTutor";
  @override
  get nextLesson => "Buổi học tiếp theo";
  @override
  get bookAlesson => "Đặt lịch học";

  // Profile page
  @override
  get profile => "Hồ sơ";
  @override
  get fullName => "Họ tên";
  @override
  get birthday => "Ngày sinh";
  @override
  get phone => "Số điện thoại";
  @override
  get country => "Quốc gia";
  @override
  get level => "Trình độ";
  @override
  get wantToLearn => "Muốn học";
  @override
  get save => "Lưu";

  // Course page
  @override
  get course => "Khoá học";
  @override
  get searchCourse => "Tìm kiếm khoá học...";
  @override
  get lesson => " Bài học";
  // Course Detail
  @override
  get aboutCourse => "Thông tin";
  @override
  get overview => "Tổng quan";
  @override
  get why => "Tại sao bạn nên học khóa học này?";
  @override
  get what => "Bạn có thể làm gì?";
  @override
  get topic => "Chủ đề";
  @override
  get tutor => "Gia sư";

  // Ebook tab
  @override
  get ebook => "Giáo trình";
  @override
  get searchEbook => "Tìm kiếm giáo trình...";

  // Upcoming Page
  @override
  get upcoming => "Sắp diễn ra";
  @override
  get cancel => "Huỷ bỏ";
  @override
  get goToMeeting => "Vào phòng học";

  // Tutor search page and Tutor detail page
  @override
  get tutors => "Gia sư";
  @override
  get searchTutor => "Tìm kiếm gia sư...";
  @override
  get booking => "Đặt lịch học";
  @override
  get languages => "Ngôn ngữ";
  @override
  get interests => "Sở thích";
  @override
  get specialties => "Chuyên ngành";
  @override
  get rateAndComment => "Đánh giá và bình luận";
  @override
  get selectSchedule => "Chọn lịch học";
  @override
  get selectScheduleDetail => "Chọn giờ học";

  // Setting page
  @override
  get setting => "Cài đặt";
  @override
  get changePassword => "Đổi mật khẩu";
  @override
  get sessionHistory => "Lịch sử các buổi học";
  @override
  get advancedSetting => "Cài đặt nâng cao";
  @override
  get logout => "Đăng xuất";

  // Change password page
  @override
  get newPassword => "Mật khẩu mới";
  @override
  get confirmNewPassword => "Nhập lại mật khẩu mới";

  // Session history page
  @override
  get giveFeedback => "Đánh giá";
  @override
  get watchRecord => "Xem lại buổi học";
  @override
  get mark => "Điểm số: ";

  // Feedback page
  @override
  get feedback => "Đánh giá";
  @override
  get hintFeedback => "Nhập nội dung đánh giá của bạn...";
}
