class Validators {
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$');
    return regex.hasMatch(password);
  }
  // Kiểm tra họ tên hợp lệ
  static bool isValidName(String name) {
    // Ví dụ kiểm tra họ tên phải chứa ít nhất 2 ký tự và không chứa ký tự số
    final regex = RegExp(r'^[a-zA-Z\s]{2,}$');
    return regex.hasMatch(name);
  }

  // Kiểm tra xác nhận mật khẩu khớp với mật khẩu gốc
  static bool doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}