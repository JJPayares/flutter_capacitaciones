import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/ui/pages/news_page.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/pages/user_profile.dart';
import 'package:flutter_capacitaciones/ui/routes/names.dart';

class CustomRoutes {
  static MaterialPageRoute routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.userProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserProfile());
      case RoutesNames.listNews:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NewsPage());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserProfile());
    }
  }
}
