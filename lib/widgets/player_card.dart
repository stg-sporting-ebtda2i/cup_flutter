import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/models/player.dart';
import 'package:piehme_cup_flutter/themes/icons_extension.dart';
import 'package:piehme_cup_flutter/widgets/placeholders.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final double height;
  final VoidCallback onClick;

  const PlayerCard({
    super.key,
    required this.player,
    required this.height,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Stack(children: [
        SizedBox(
          width: 900 * height / 1266,
          height: height,
          child: CachedNetworkImage(
            imageUrl: player.imageUrl ?? '',
            cacheKey: player.imageKey,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => errorCardPlaceholder(context),
            placeholder: (context, url) => loadingCardPlaceholder(context),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 10 * height / 100,
          width: 15 * height / 100,
          height: 15 * height / 100,
          child: Image.asset(
            _getChemistryAsset(player.chemistry, context),
            fit: BoxFit.contain,
          ),
        ),
      ]),
    );
  }

  String _getChemistryAsset(int chemistry, BuildContext context) {
    final icons = Theme.of(context).extension<IconsExtension>();
    switch (chemistry) {
      case 1:
        return icons?.chemistry1 ?? 'assets/icons/rtgl-light/chemistry_1.png';
      case 2:
        return icons?.chemistry2 ?? 'assets/icons/rtgl-light/chemistry_2.png';
      case 3:
        return icons?.chemistry3 ?? 'assets/icons/rtgl-light/chemistry_3.png';
      default:
        return icons?.chemistry0 ?? 'assets/icons/rtgl-light/chemistry_0.png';
    }
  }

}
