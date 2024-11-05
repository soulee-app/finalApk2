class AffiliationData {
  final String text1;
  final String text2;
  final String image;
  final bool isNetworkImage;

  AffiliationData({
    required this.text1,
    required this.text2,
    required this.image,
    this.isNetworkImage = false,
  });
}
