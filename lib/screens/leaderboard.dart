import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/leaderboard_provider.dart';
import 'package:piehme_cup_flutter/providers/user_provider.dart';
import 'package:piehme_cup_flutter/states/empty_state.dart';
import 'package:piehme_cup_flutter/states/loading_state.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';
import 'package:piehme_cup_flutter/widgets/animated_list_item.dart';
import 'package:piehme_cup_flutter/widgets/header.dart';
import 'package:piehme_cup_flutter/widgets/leaderboard_listitem.dart';
import 'package:provider/provider.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    final topGradient = Theme.of(
      context,
    ).extension<MainColorsExtension>()!.topGradient;
    return Consumer2<LeaderboardProvider, UserProvider>(
      builder: (context, provider, userProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: topGradient,
            toolbarHeight: 0,
            elevation: 0,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Theme.of(
                    context,
                  ).extension<BackgroundsExtension>()!.leaderboardBackground,
                ),
              ),
            ),
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 26),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [topGradient, Colors.transparent],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Leaderboard',
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Header(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (provider.isLoading && provider.leaderboard.isEmpty) {
                        return LoadingState(
                          iconData: Icons.leaderboard_rounded,
                          title: "Loading Leaderboard...",
                          subtitle: 'Getting the latest rankings',
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () => context
                            .read<LeaderboardProvider>()
                            .loadLeaderboard(),
                        color: Colors.black,
                        backgroundColor: Theme.of(
                          context,
                        ).extension<StatesColorsExtension>()!.mainColor,
                        child: provider.leaderboard.isEmpty
                            ? CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: EmptyState(
                                      iconData: Icons.leaderboard_rounded,
                                      title: 'No Rankings Yet',
                                      subtitle:
                                          'Take the first spot on the podium',
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(bottom: 70),
                                itemCount: provider.leaderboard.length,
                                itemBuilder: (context, index) {
                                  return AnimatedListItem(
                                    index: index,
                                    child: LeaderboardListItem(
                                      current:
                                          userProvider.user.id ==
                                          provider.leaderboard[index].id,
                                      user: provider.leaderboard[index],
                                      index: index + 1,
                                    ),
                                  );
                                },
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
