import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:country_flags/country_flags.dart';

class MiIcons {
  static Widget sound(BuildContext context, bool isEnable) => Padding(
    padding: const EdgeInsets.all(8),
    child: HugeIcon(
      icon: isEnable
          ? HugeIcons.strokeRoundedVolumeHigh
          : HugeIcons.strokeRoundedVolumeOff,
      color: isEnable ? Colors.green : Theme.of(context).colorScheme.error,
    ),
  );

  static Widget rightArrow(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedArrowRight01,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );

  static Widget close(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedCancel01,
    color: Theme.of(context).colorScheme.primary,
  );

  static Widget like(BuildContext context, bool isLiked) => Icon(
    isLiked ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
    color: Theme.of(context).colorScheme.primary,
  );

  static Widget save(BuildContext context, bool isSaved) => HugeIcon(
    icon: isSaved
        ? HugeIcons.strokeRoundedBookmarkCheck02
        : HugeIcons.strokeRoundedBookmarkAdd02,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static Widget savedTalesList(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedBookmark03,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static Widget logout(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedLogout04,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  static Widget tick(BuildContext context, bool isCurrentLanguage) => HugeIcon(
    icon: isCurrentLanguage
        ? HugeIcons.strokeRoundedTickDouble01
        : HugeIcons.strokeRoundedTick01,
    color: isCurrentLanguage
        ? Colors.green
        : Theme.of(context).colorScheme.onSurface,
  );

  static Widget error(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedSettingError04,
    color: Theme.of(context).colorScheme.error,
    size: 48,
  );

  //Audio icons
  static Widget pausePlay(BuildContext context, bool isPaused) => HugeIcon(
    icon: isPaused
        ? HugeIcons.strokeRoundedPlayCircle
        : HugeIcons.strokeRoundedPauseCircle,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  static Widget stop(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedStop,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  static Widget volume(BuildContext context, bool isMuted, bool isLow) =>
      HugeIcon(
        icon: isMuted
            ? HugeIcons.strokeRoundedVolumeMute01
            : isLow
            ? HugeIcons.strokeRoundedVolumeLow
            : HugeIcons.strokeRoundedVolumeHigh,
        color: Theme.of(context).colorScheme.primary,
      );

  static Widget loop(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedRepeat,
    color: Theme.of(context).colorScheme.onSurface,
    size: 16,
  );

  //Menus Icons
  static Widget riddles(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedAiBrain05,
    color: Theme.of(context).colorScheme.onSurface,
  );
  static Widget tale(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedAiContentGenerator01,
    color: Theme.of(context).colorScheme.onPrimaryContainer,
  );
  static Widget talesList(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedListView,
    color: Theme.of(context).colorScheme.onPrimaryContainer,
  );
  static Widget riddlesList(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedLeftToRightListNumber,
    color: Theme.of(context).colorScheme.onPrimaryContainer,
  );
  static Widget about(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedInformationCircle,
    color: Theme.of(context).colorScheme.onPrimaryContainer,
  );
  static Widget settings(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedSettings03,
    color: Theme.of(context).colorScheme.onPrimaryContainer,
  );

  //Game & Prizes Icons
  static Widget leaderBoard(BuildContext context, {bool fromHome = false}) =>
      HugeIcon(
        icon: HugeIcons.strokeRoundedRanking,
        color: fromHome
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
      );

  static Widget firstPlace(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedMedalFirstPlace,
    color: Theme.of(context).colorScheme.onPrimary,
    size: 28,
  );
  static Widget secondPlace(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedMedalSecondPlace,
    color: Theme.of(context).colorScheme.onPrimary,
  );
  static Widget thirdPlace(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedMedalThirdPlace,
    color: Theme.of(context).colorScheme.onPrimary,
  );
  static Widget score(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedStarAward02,
    color: Theme.of(context).colorScheme.primary,
  );

  //FLAG ICONS
  static Widget englishFlag(BuildContext context) =>
      CountryFlag.fromCountryCode('GB', shape: const Circle());
  static Widget frenchFlag(BuildContext context) =>
      CountryFlag.fromCountryCode('FR', shape: const Circle());
  static Widget swahiliFlag(BuildContext context) =>
      CountryFlag.fromCountryCode('TZ', shape: const Circle());

  //Riddle Icons
  static Widget longRightArrow(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedArrowRight04,
    color: Theme.of(context).colorScheme.primary,
  );
  static Widget longLeftArrow(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedArrowLeft04,
    color: Theme.of(context).colorScheme.primary,
  );
  static Widget replay(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedReplay,
    color: Theme.of(context).colorScheme.primary,
  );
  static Widget addTime(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedTimer01,
    color: Theme.of(context).colorScheme.primary,
  );
  static Widget aiHelp(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedAiIdea,
    color: Theme.of(context).colorScheme.primary,
  );
  static Widget help5050(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedSearchRemove,
    color: Theme.of(context).colorScheme.primary,
  );
}
