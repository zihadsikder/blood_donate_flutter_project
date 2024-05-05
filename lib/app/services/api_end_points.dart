class ApiEndPoints {
  static const String _baseUrl = 'https://blood-donation-apis.vercel.app/v1';
  // static const String _baseUrl = 'https://app.blooddonorbd.com/v1';
  static const String registration = '$_baseUrl/auth/';
  static const String login = '$_baseUrl/auth/login';
  static const String registerOtp = '$_baseUrl/auth/register-otp-match';
  static const String resendOtp = '$_baseUrl/auth/resent-otp';
  static const String forgetPass = '$_baseUrl/auth/password-reset-request';
  static const String forgetPassOtpMatch = '$_baseUrl/auth/otp-match';
  static const String passwordChange = '$_baseUrl/auth/password-reset';
  static const String getDivisionData = '$_baseUrl/division';
  static const String getDistrictData = '$_baseUrl/district/';
  static const String getUpzilaData = '$_baseUrl/area/';
  static const String getUnionData = '$_baseUrl/union/';
  static const String storeDonationHistory = '$_baseUrl/store-donation';
  static const String getDonorList = '$_baseUrl/donation-list?';
  static const String getSearchDonor = '$_baseUrl/search-donar?';
  static const String logout = '$_baseUrl/auth/logout';
  static const String deleteDonation = '$_baseUrl/delete-donation/';
  static const String updateProfile = '$_baseUrl/auth/profile-update';
  static const String profileActive = '$_baseUrl/auth/profile-activation';
  static const String getProfileData = '$_baseUrl/auth/profile';

}
