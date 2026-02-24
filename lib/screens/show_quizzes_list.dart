import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/quizzes_provider.dart';
import 'package:piehme_cup_flutter/states/empty_state.dart';
import 'package:piehme_cup_flutter/states/loading_state.dart';
import 'package:piehme_cup_flutter/themes/gradients_extension.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';
import 'package:piehme_cup_flutter/widgets/animated_list_item.dart';
import 'package:piehme_cup_flutter/widgets/header.dart';
import 'package:piehme_cup_flutter/widgets/quizzes_listitem.dart';
import 'package:provider/provider.dart';

class ShowQuizzesPage extends StatefulWidget {
  const ShowQuizzesPage({super.key});

  @override
  State<ShowQuizzesPage> createState() => _ShowQuizzesPageState();
}

class _ShowQuizzesPageState extends State<ShowQuizzesPage> {
  @override
  Widget build(BuildContext context) {
    final mainColor = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.mainColor;
    final topGradient = Theme.of(
      context,
    ).extension<MainColorsExtension>()!.topGradient;

    return Consumer<QuizzesProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: topGradient,
            toolbarHeight: 0,
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.heightOf(context) * 0.125,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Theme.of(
                  context,
                ).extension<GradientsExtension>()!.quizzesList,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
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
                        colors: [
                          topGradient,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mosab2at',
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
                      if (provider.isLoadingQuizzes &&
                          provider.quizzes.isEmpty) {
                        return _buildLoadingState();
                      }
                      return RefreshIndicator(
                        onRefresh: () => provider.loadQuizzes(),
                        color: Colors.black,
                        backgroundColor: mainColor,
                        child: provider.quizzes.isEmpty
                            ? CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(child: _buildEmptyState()),
                                ],
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: provider.quizzes.length,
                                itemBuilder: (context, index) {
                                  final quiz = provider.quizzes[index];
                                  return AnimatedListItem(
                                    index: index,
                                    child: QuizListItem(quiz: quiz),
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

  Widget _buildLoadingState() {
    return LoadingState(
      iconData: Icons.quiz_rounded,
      title: 'Loading Quizzes...',
      subtitle: 'Getting your quizzes ready',
    );
  }

  Widget _buildEmptyState() {
    return EmptyState(
      iconData: Icons.quiz_rounded,
      title: 'No Quizzes Available',
      subtitle: 'Check back later for new quizzes',
    );
  }
}
