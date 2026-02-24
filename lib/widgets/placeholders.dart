import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/themes/placeholders_extension.dart';

Widget emptyCardPlaceholder(BuildContext context) {
  final pic = Theme.of(context).extension<PlaceholdersExtension>()!.emptyCardPlaceholder;
  return Image(
    image: AssetImage(pic),
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  );
}

Widget emptyIconPlaceholder(BuildContext context) {
  final pic = Theme.of(context).extension<PlaceholdersExtension>()!.emptyIconPlaceholder;
  return Image(
    image: AssetImage(pic),
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  );
}

Widget errorCardPlaceholder(BuildContext context) {
  final pic = Theme.of(context).extension<PlaceholdersExtension>()!.emptyCardPlaceholder;
  return Image(
    image: AssetImage(pic),
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  );
}

Widget loadingCardPlaceholder(BuildContext context) {
  final pic = Theme.of(context).extension<PlaceholdersExtension>()!.emptyCardPlaceholder;
  return Image(
    image: AssetImage(pic),
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  );
}

Widget loadingImage() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.white,
    ),
  );
}