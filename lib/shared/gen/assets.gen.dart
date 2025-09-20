/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SourceSansPro-Black.otf
  String get sourceSansProBlack => 'assets/fonts/SourceSansPro-Black.otf';

  /// File path: assets/fonts/SourceSansPro-Bold.otf
  String get sourceSansProBold => 'assets/fonts/SourceSansPro-Bold.otf';

  /// File path: assets/fonts/SourceSansPro-ExtraLight.otf
  String get sourceSansProExtraLight =>
      'assets/fonts/SourceSansPro-ExtraLight.otf';

  /// File path: assets/fonts/SourceSansPro-Light.otf
  String get sourceSansProLight => 'assets/fonts/SourceSansPro-Light.otf';

  /// File path: assets/fonts/SourceSansPro-Regular.otf
  String get sourceSansProRegular => 'assets/fonts/SourceSansPro-Regular.otf';

  /// File path: assets/fonts/SourceSansPro-Semibold.otf
  String get sourceSansProSemibold => 'assets/fonts/SourceSansPro-Semibold.otf';

  /// List of all assets
  List<String> get values => [
        sourceSansProBlack,
        sourceSansProBold,
        sourceSansProExtraLight,
        sourceSansProLight,
        sourceSansProRegular,
        sourceSansProSemibold
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow-icon.svg
  SvgGenImage get arrowIcon => const SvgGenImage('assets/icons/arrow-icon.svg');

  /// File path: assets/icons/arrow-right-icon.svg
  SvgGenImage get arrowRightIcon =>
      const SvgGenImage('assets/icons/arrow-right-icon.svg');

  /// File path: assets/icons/empty-icon.svg
  SvgGenImage get emptyIcon => const SvgGenImage('assets/icons/empty-icon.svg');

  /// File path: assets/icons/plus-icon.svg
  SvgGenImage get plusIcon => const SvgGenImage('assets/icons/plus-icon.svg');

  /// File path: assets/icons/uil_basketball.svg
  SvgGenImage get uilBasketball =>
      const SvgGenImage('assets/icons/uil_basketball.svg');

  /// File path: assets/icons/uil_book-open.svg
  SvgGenImage get uilBookOpen =>
      const SvgGenImage('assets/icons/uil_book-open.svg');

  /// File path: assets/icons/uil_calendar-alt.svg
  SvgGenImage get uilCalendarAlt =>
      const SvgGenImage('assets/icons/uil_calendar-alt.svg');

  /// File path: assets/icons/uil_car-sideview.svg
  SvgGenImage get uilCarSideview =>
      const SvgGenImage('assets/icons/uil_car-sideview.svg');

  /// File path: assets/icons/uil_clapper-board.svg
  SvgGenImage get uilClapperBoard =>
      const SvgGenImage('assets/icons/uil_clapper-board.svg');

  /// File path: assets/icons/uil_gift.svg
  SvgGenImage get uilGift => const SvgGenImage('assets/icons/uil_gift.svg');

  /// File path: assets/icons/uil_home.svg
  SvgGenImage get uilHome => const SvgGenImage('assets/icons/uil_home.svg');

  /// File path: assets/icons/uil_multiply.svg
  SvgGenImage get uilMultiply =>
      const SvgGenImage('assets/icons/uil_multiply.svg');

  /// File path: assets/icons/uil_pizza-slice.svg
  SvgGenImage get uilPizzaSlice =>
      const SvgGenImage('assets/icons/uil_pizza-slice.svg');

  /// File path: assets/icons/uil_rss-alt.svg
  SvgGenImage get uilRssAlt =>
      const SvgGenImage('assets/icons/uil_rss-alt.svg');

  /// File path: assets/icons/uil_shopping-cart.svg
  SvgGenImage get uilShoppingCart =>
      const SvgGenImage('assets/icons/uil_shopping-cart.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowIcon,
        arrowRightIcon,
        emptyIcon,
        plusIcon,
        uilBasketball,
        uilBookOpen,
        uilCalendarAlt,
        uilCarSideview,
        uilClapperBoard,
        uilGift,
        uilHome,
        uilMultiply,
        uilPizzaSlice,
        uilRssAlt,
        uilShoppingCart
      ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/logo-png.png
  AssetGenImage get logoPng => const AssetGenImage('assets/logo/logo-png.png');

  /// File path: assets/logo/logo-rectangle.png
  AssetGenImage get logoRectangle =>
      const AssetGenImage('assets/logo/logo-rectangle.png');

  /// File path: assets/logo/logo-svg.svg
  SvgGenImage get logoSvg => const SvgGenImage('assets/logo/logo-svg.svg');

  /// File path: assets/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logo/logo.png');

  /// List of all assets
  List<dynamic> get values => [logoPng, logoRectangle, logoSvg, logo];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
