import 'package:flutter/material.dart';

import '../chat/attachment_image_model.dart';
import '../chat/attachment_repository.dart';

class NetworkGalleryWidget extends StatelessWidget {
  final AttachmentRepository attachmentRepository = AttachmentRepository();
  final Function(String) attachmentImageCallback;

  NetworkGalleryWidget({super.key, required this.attachmentImageCallback});

  String convertToLowResUrl(String url, int width, int height) {
    Uri uri = Uri.parse(url);
    List<String> segments = List.from(
        uri.pathSegments); // Create a modifiable copy of the path segments

    // Replace width and height in the URL segments
    segments[segments.length - 2] = width.toString();
    segments[segments.length - 1] = height.toString();

    // Reconstruct the URL
    Uri lowResUri = uri.replace(pathSegments: segments);
    return lowResUri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: FutureBuilder<List<PixelAttachmentImageModel>>(
          future: attachmentRepository.getAttachmentImagesFromNetwork(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PixelAttachmentImageModel>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          attachmentImageCallback(
                              snapshot.data![index].urlFullSize);
                        },
                        child: Image.network(convertToLowResUrl(
                            snapshot.data![index].urlFullSize, 200, 200)));
                  },
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width * 0.5));
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
