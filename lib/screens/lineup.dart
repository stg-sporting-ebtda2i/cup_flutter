import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/base_lineup_provider.dart';
import 'package:piehme_cup_flutter/providers/lineup_provider.dart';
import 'package:piehme_cup_flutter/providers/other_lineup_provider.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';
import 'package:piehme_cup_flutter/themes/colors_extension.dart';
import 'package:piehme_cup_flutter/widgets/lineup_scores_panel.dart';
import 'package:provider/provider.dart';
import '../widgets/lineup_cards.dart';

class LineupPage extends StatelessWidget {
  final bool userLineup;

  const LineupPage({
    super.key,
    required this.userLineup,
  });

  @override
  Widget build(BuildContext c) {
    final Color topBar = Theme.of(c).extension<ColorsExtension>()!.topGradient;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: topBar,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: userLineup
          ? Consumer<LineupProvider>(
              builder: (context, provider, child) {
                return _buildLineupWidget(provider, c, topBar);
              },
            )
          : Consumer<OtherLineupProvider>(
              builder: (context, provider, child) {
                return _buildLineupWidget(provider, c, topBar);
              },
            ),
    );
  }

  Widget _buildLineupWidget(BaseLineupProvider provider, BuildContext context, Color topBar) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.heightOf(context)*0.125),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Theme.of(context).extension<BackgroundsExtension>()!.lineupBackground),
          // Background image
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!userLineup)
            Container(
              color: topBar.withAlpha(100),
              padding: const EdgeInsets.all(4),
              child: Text(
                "${provider.user.name}'s Lineup",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (userLineup)
            SafeArea(child: ScoresPanel(provider: provider)),
          if (!userLineup)
            ScoresPanel(provider: provider),
          SizedBox(height: userLineup ? 40 : 20),
          Expanded(
            child: Center(
              child: Lineup(userLineup: userLineup, provider: provider),
            ),
          ),
        ],
      ),
    );
  }
}
