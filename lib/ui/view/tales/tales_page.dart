import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import 'widgets/tales_filters_view.dart';
import 'widgets/tale_details_view.dart';
import 'widgets/tale_rating_view.dart';
import 'widgets/tale_date_view.dart';
import '../../../domain/domain.dart';
import '../../ui.dart';

class TalesPage extends StatefulWidget {
  const TalesPage({super.key});

  @override
  State<TalesPage> createState() => _TalesPageState();
}

class _TalesPageState extends State<TalesPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Consumer<TalesProvider>(
      builder: (context, talesProvider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tales'),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.sizeOf(context).width, 70),
              child: TalesFiltersView(talesProvider: talesProvider),
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: talesProvider.miTales.length,
              itemBuilder: (context, index) {
                final localTale = talesProvider.miTales[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    if (localTale.day == 1) ...{
                      Text(
                        DateFormatterUtil.shortToLongMonth(localTale.month),
                        style: textTheme.titleLarge!.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      Divider(height: 1.5, thickness: 1.5),
                    },
                    InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        final selectedTale = TalesData.talesData
                            .where(
                              (tale) =>
                                  tale.month == localTale.month &&
                                  tale.day == localTale.day,
                            )
                            .toList();
                        final canOpen =
                            selectedTale.first.month ==
                                DateFormatterUtil.intToLongMonth(
                                  DateTime.now().month,
                                ) &&
                            selectedTale.first.day == DateTime.now().day;
                        if (canOpen) {
                          context.goNamed(
                            RoutesNames.taleDetails,
                            extra: selectedTale.first,
                          );
                        } else {
                          miSnackBar(
                            context,
                            text: "No details!",
                            horizontalMargin: 145,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 12,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            TaleDateView(selectedTale: localTale),
                            TaleDetailsView(selectedTale: localTale),
                            TaleRatingView(
                              talesProvider: talesProvider,
                              index: index,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
