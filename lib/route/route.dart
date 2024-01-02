// routing
import 'package:flutter/material.dart';
import 'package:stree_kavach/screens/home.dart';
import 'package:stree_kavach/screens/permission_wrapper.dart';
import 'package:stree_kavach/screens/request_access.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      // case '/forgot':
      //   return MaterialPageRoute(builder: (_) => ForgotScreen());
      // case '/profile':
      //   return MaterialPageRoute(builder: (_) => ProfileScreen());
      // case '/editprofile':
      //   return MaterialPageRoute(builder: (_) => EditProfileScreen());
      // case '/changepassword':
      //   return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/request':
        return MaterialPageRoute(builder: (_) => const RequestAccess());
      case '/permission':
        return MaterialPageRoute(builder: (_) => const PermissionWrapper());
      // case '/sos':
      //   return MaterialPageRoute(builder: (_) => SosScreen());
      // case '/soslist':
      //   return MaterialPageRoute(builder: (_) => SosListScreen());
      // case '/sosdetail':
      //   return MaterialPageRoute(builder: (_) => SosDetailScreen());
      // case '/sosmap':
      //   return MaterialPageRoute(builder: (_) => SosMapScreen());
      // case '/sosmapdetail':
      //   return MaterialPageRoute(builder: (_) => SosMapDetailScreen());
      default:
        return MaterialPageRoute(builder: (_) => const PermissionWrapper());
    }
  }
}
