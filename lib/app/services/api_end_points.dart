class ApiEndPoints {
  //static const String _baseUrl = 'http://192.168.10.187:5000/api/v1';
  static const String _baseUrl = 'https://blood-donation-apis.vercel.app/v1';
  static const String registration = '$_baseUrl/auth/';
  static const String login = '$_baseUrl/auth/login';
  static const String getDivisionData = '$_baseUrl/division';
  static const String getDistrictData = '$_baseUrl/district/';
  static const String getUpzilaData = '$_baseUrl/upzila/';
  static const String getUnionData = '$_baseUrl/union/';
  static const String storeDonationHistory = '$_baseUrl/store-donation';
  static const String getDonorList = '$_baseUrl/donation-list?';
  static const String getSearchDonor= '$_baseUrl/search-donar?';
  static const String logout= '$_baseUrl/auth/logout';
}