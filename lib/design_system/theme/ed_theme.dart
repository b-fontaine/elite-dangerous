import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shapes/ed_notched_border.dart';
import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';
import '../tokens/ed_typography.dart';

/// The single [ThemeData] of the app.
///
/// Elite Dangerous' own HUD is dark-only, and so are the source guides
/// (`html { background: #06080a !important }`). Offering a light variant would
/// betray the identity, so the app ships one deliberate dark theme.
abstract final class EdTheme {
  static ThemeData build() {
    const ColorScheme scheme = ColorScheme.dark(
      primary: EdColors.orange,
      onPrimary: EdColors.space,
      primaryContainer: EdColors.tagOrangeFill,
      onPrimaryContainer: EdColors.orangeBright,
      secondary: EdColors.cyan,
      onSecondary: EdColors.space,
      secondaryContainer: EdColors.tagCyanFill,
      onSecondaryContainer: EdColors.cyanBright,
      tertiary: EdColors.green,
      onTertiary: EdColors.space,
      error: EdColors.red,
      onError: EdColors.space,
      errorContainer: EdColors.warnFill,
      onErrorContainer: EdColors.redBright,
      surface: EdColors.space,
      onSurface: EdColors.textBody,
      surfaceContainerLowest: EdColors.space,
      surfaceContainerLow: EdColors.panel,
      surfaceContainer: EdColors.panelRaised,
      surfaceContainerHigh: EdColors.panelHeader,
      surfaceContainerHighest: EdColors.panelHeader,
      onSurfaceVariant: EdColors.textMuted,
      outline: EdColors.border,
      outlineVariant: EdColors.borderSubtle,
    );

    final TextTheme textTheme = const TextTheme(
      displayLarge: EdTypography.displayLarge,
      displayMedium: EdTypography.displayLarge,
      headlineLarge: EdTypography.titleLarge,
      headlineMedium: EdTypography.sectionHeading,
      headlineSmall: EdTypography.subHeading,
      titleLarge: EdTypography.titleLarge,
      titleMedium: EdTypography.titleMedium,
      titleSmall: EdTypography.overline,
      bodyLarge: EdTypography.intro,
      bodyMedium: EdTypography.body,
      bodySmall: EdTypography.bodySmall,
      labelLarge: EdTypography.overline,
      labelMedium: EdTypography.tableHeader,
      labelSmall: EdTypography.tag,
    ).apply(fontFamilyFallback: EdTypography.sansFallback);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: EdColors.space,
      canvasColor: EdColors.space,
      dividerColor: EdColors.border,
      splashFactory: InkSparkle.splashFactory,
      textTheme: textTheme,
      visualDensity: VisualDensity.standard,
      appBarTheme: const AppBarTheme(
        backgroundColor: EdColors.space,
        surfaceTintColor: Colors.transparent,
        foregroundColor: EdColors.textStrong,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: EdTypography.sectionHeading,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: EdColors.border,
        thickness: 1,
        space: 1,
      ),
      cardTheme: const CardThemeData(
        color: EdColors.panel,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: EdNotchedBorder(
          side: BorderSide(color: EdColors.border),
          notch: EdNotch.panel,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: EdColors.orange,
          foregroundColor: EdColors.space,
          disabledBackgroundColor: EdColors.panelHeader,
          disabledForegroundColor: EdColors.textFainter,
          textStyle: EdTypography.overline.copyWith(
            color: EdColors.space,
            fontWeight: FontWeight.w700,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: EdSpacing.lg,
            vertical: EdSpacing.md,
          ),
          shape: const EdNotchedBorder(notch: EdNotch.chip),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: EdColors.orangeBright,
          side: const BorderSide(color: EdColors.orange),
          textStyle: EdTypography.overline.copyWith(
            color: EdColors.orangeBright,
            fontWeight: FontWeight.w700,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: EdSpacing.lg,
            vertical: EdSpacing.md,
          ),
          shape: const EdNotchedBorder(notch: EdNotch.chip),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: EdColors.cyanBright,
          textStyle: EdTypography.bodySmall.copyWith(
            color: EdColors.cyanBright,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: EdColors.textMuted, size: 20),
      listTileTheme: const ListTileThemeData(
        iconColor: EdColors.textMuted,
        textColor: EdColors.textBody,
        titleTextStyle: EdTypography.titleMedium,
        subtitleTextStyle: EdTypography.caption,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: EdColors.panel,
        surfaceTintColor: Colors.transparent,
        indicatorColor: EdColors.tagOrangeFill,
        indicatorShape: const EdNotchedBorder(notch: EdNotch.chip),
        height: 64,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => EdTypography.tag.copyWith(
            fontSize: 10,
            letterSpacing: 1.4,
            color: states.contains(WidgetState.selected)
                ? EdColors.orangeBright
                : EdColors.textFainter,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (Set<WidgetState> states) => IconThemeData(
            size: 21,
            color: states.contains(WidgetState.selected)
                ? EdColors.orangeBright
                : EdColors.textFainter,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: EdColors.panel,
        indicatorColor: EdColors.tagOrangeFill,
        indicatorShape: const EdNotchedBorder(notch: EdNotch.chip),
        selectedIconTheme:
            const IconThemeData(color: EdColors.orangeBright, size: 22),
        unselectedIconTheme:
            const IconThemeData(color: EdColors.textFainter, size: 22),
        selectedLabelTextStyle: EdTypography.overline.copyWith(
          color: EdColors.orangeBright,
          fontSize: 10.5,
        ),
        unselectedLabelTextStyle: EdTypography.overline.copyWith(
          color: EdColors.textFainter,
          fontSize: 10.5,
        ),
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: EdColors.panelHeader,
        side: BorderSide(color: EdColors.border),
        labelStyle: EdTypography.bodySmall,
        shape: EdNotchedBorder(notch: EdNotch.chip),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: EdColors.panel,
        hintStyle: EdTypography.bodySmall.copyWith(color: EdColors.textFainter),
        labelStyle: EdTypography.overline,
        floatingLabelStyle:
            EdTypography.overline.copyWith(color: EdColors.orangeBright),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: EdSpacing.md,
          vertical: EdSpacing.sm,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: EdColors.border),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: EdColors.border),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: EdColors.orange, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: EdColors.red),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: EdColors.orange,
        linearTrackColor: EdColors.panelHeader,
        circularTrackColor: EdColors.panelHeader,
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: EdColors.orange,
        inactiveTrackColor: EdColors.panelHeader,
        thumbColor: EdColors.orangeBright,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? EdColors.orange
              : EdColors.textFainter,
        ),
        trackColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? EdColors.tagOrangeFill
              : EdColors.panelHeader,
        ),
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: EdColors.panelHeader,
          border: Border.fromBorderSide(BorderSide(color: EdColors.border)),
        ),
        textStyle: EdTypography.caption,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: EdColors.panelHeader,
        contentTextStyle: EdTypography.bodySmall,
        behavior: SnackBarBehavior.floating,
        shape: EdNotchedBorder(
          side: BorderSide(color: EdColors.border),
          notch: EdNotch.callout,
        ),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: EdColors.panel,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: EdTypography.sectionHeading,
        contentTextStyle: EdTypography.body,
        shape: EdNotchedBorder(
          side: BorderSide(color: EdColors.border),
          notch: EdNotch.panel,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(EdColors.borderStrong),
        thickness: WidgetStateProperty.all(8),
        radius: Radius.zero,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
