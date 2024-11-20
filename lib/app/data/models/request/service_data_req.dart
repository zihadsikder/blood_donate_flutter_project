class ServiceData {
  final String name;
  final dynamic link; // Can be either a String (URL) or a Function (for navigation)
  final String profilePicAsset;
  final bool isUrl; // Determines the navigation type

  ServiceData({
    required this.name,
    required this.link,
    required this.profilePicAsset,
    required this.isUrl,
  });
}