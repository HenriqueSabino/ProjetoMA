import 'package:shop_app/models/image_with_description.dart';

class ImageRepository {
  static List<ImageWithDescription> _images = [
    ImageWithDescription(
        imagePath: "assets/images/bag_1.png", imageDescription: "A blue bag."),
    ImageWithDescription(
        imagePath: "assets/images/bag_2.png",
        imageDescription: "A brown leather bag"),
    ImageWithDescription(
        imagePath: "assets/images/bag_3.png", imageDescription: "A black bag"),
    ImageWithDescription(
        imagePath: "assets/images/bag_4.png",
        imageDescription: "An orange bag"),
    ImageWithDescription(
        imagePath: "assets/images/bag_5.png",
        imageDescription: "A red leather bag"),
    ImageWithDescription(
        imagePath: "assets/images/bag_6.png",
        imageDescription: "A black leather bag with a strap"),
  ];

  static ImageWithDescription getImage(String path) {
    return _images.firstWhere((image) => image.imagePath == path);
  }
}
