import 'package:cached_network_image/cached_network_image.dart';

import '../utill/appImports.dart';

class ImageView extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const ImageView(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: SizedBox.fromSize(
            size: Size.fromRadius(35),
            child: CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: image,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.transparent,
                strokeWidth: 2,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )));
  }
}
