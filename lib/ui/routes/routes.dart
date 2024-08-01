import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/ui/pages/detail_news.dart';
import 'package:flutter_capacitaciones/modules/news/ui/pages/list_news.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/pages/user_profile.dart';
import 'package:flutter_capacitaciones/ui/routes/names.dart';

class CustomRoutes {
  static MaterialPageRoute routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.userProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserProfile());
      case RoutesNames.detailNews:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DetailNewsPage());
      case RoutesNames.listNews:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ListNewsPage());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserProfile());
    }
  }
}
