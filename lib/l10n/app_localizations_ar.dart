// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get title => 'تطبيق التسوق';

  @override
  String get changeTheme => 'تغيير الثيم';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get arabic => 'عربي';

  @override
  String get english => 'إنجليزي';

  @override
  String get home => 'الرئيسية';

  @override
  String get products => 'المنتجات';

  @override
  String get cart => 'السلة';

  @override
  String get profile => 'الملف الشخصي';
  @override
  String get favorite => 'المفضلة';
  @override
  String get add_to_cart => 'أضف إلى السلة';
  @override
  String get remove_from_cart => 'إزالة من السلة';
}
