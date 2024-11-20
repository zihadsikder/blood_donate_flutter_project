class ServiceData {
  final String name;
  final String link;
  final String profilePicAsset;
  final bool isUrl; // Determines the navigation type

  ServiceData({
    required this.name,
    required this.link,
    required this.profilePicAsset,
    required this.isUrl,
  });
}