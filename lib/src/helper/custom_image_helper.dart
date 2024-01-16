import 'package:flutter_svg/svg.dart';

CustomImageHelper customImageHelper = CustomImageHelper();

class CustomImageHelper {
  getSvgAsset({String? iconName}) {
    if (iconName != null) {
      return SvgPicture.asset("assets/icons/$iconName.svg");
    }
    return null;
  }
}
