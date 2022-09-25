import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/image_with_description.dart';
import 'package:shop_app/repositories/image_repository.dart';

class SemanticImage extends StatelessWidget {
  final BoxFit fit;
  final ImageWithDescription _image;

  SemanticImage(String path, {Key key, this.fit})
      : this._image = ImageRepository.getImage(path),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: Image.asset(
        this._image.imagePath,
        fit: this.fit,
      ),
      label: this._image.imageDescription,
    );
  }
}
