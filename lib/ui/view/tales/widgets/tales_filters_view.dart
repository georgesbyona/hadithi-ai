import 'package:flutter/material.dart';

import '../../../ui.dart';

class TalesFiltersView extends StatefulWidget {
  final TalesProvider talesProvider;
  const TalesFiltersView({super.key, required this.talesProvider});

  @override
  State<TalesFiltersView> createState() => _TalesFiltersViewState();
}

class _TalesFiltersViewState extends State<TalesFiltersView> {
  final ScrollController _scrollController = ScrollController();

  void animateToSelectedIndex(int index) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        index == 11 || index == 12
            ? _scrollController.position.maxScrollExtent
            : getScrollOffset(index),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateToSelectedIndex(widget.talesProvider.selectedIndex);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.talesProvider.months.length,
        itemBuilder: (context, index) {
          return InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              widget.talesProvider.changeMonth(index);
              animateToSelectedIndex(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              margin: index != widget.talesProvider.months.length - 1
                  ? const EdgeInsets.only(right: 8)
                  : const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: widget.talesProvider.selectedIndex == index
                    ? colorScheme.primary
                    : Colors.transparent,
                borderRadius: widget.talesProvider.selectedIndex == index
                    ? BorderRadius.circular(12)
                    : BorderRadius.circular(100),
                border: Border.all(color: colorScheme.primary, width: 1),
              ),
              child: Text(
                widget.talesProvider.months[index],
                style: textTheme.bodySmall!.copyWith(
                  color: widget.talesProvider.selectedIndex == index
                      ? colorScheme.onPrimary
                      : colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double getScrollOffset(int index) {
    double offset = 0.0;
    switch (index) {
      case 3:
        offset = index * 25.0;
        break;
      case 4:
        offset = index * 37.0;
        break;
      case 5:
        offset = index * 42.5;
        break;
      case 6:
        offset = index * 46.5;
        break;
      case 7:
        offset = index * 49.5;
        break;
      case 8:
        offset = index * 52.0;
        break;
      case 9:
        offset = index * 56.0;
        break;
      case 10:
        offset = index * 59.5;
        break;
      default:
        offset = index * 0.0;
        break;
    }
    return offset;
  }
}
