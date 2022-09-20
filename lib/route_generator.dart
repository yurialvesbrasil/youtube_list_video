import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/screens/cultura_play/cultura_tube.dart';
import 'package:camera_app/ui/screens/home/home.dart';
import 'package:camera_app/ui/screens/noticia/noticia.dart';
import 'package:camera_app/ui/screens/radio/radio.dart';
import 'package:camera_app/ui/screens/sobre/sobre.dart';
import 'package:flutter/material.dart';
import 'ui/screens/camera/camera.dart';
import 'ui/transitions/size_route.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/sobre':
        return SizeRoute(widget: SobreScreen());
      case '/noticia':
       if (args is CameraModal) {
        return SizeRoute(widget: NoticiaScreen(camera: args,));  
       }
         // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/preview':
        // Validation of correct data type
        if (args is CameraModal) {
          return SizeRoute(widget: CameraScreen(camera: args,));
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/radio':
      // Validation of correct data type
        if (args is CameraModal) {
          return SizeRoute(widget: RadioScreen(camera: args,));  
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/cultura_tube':
       if (args is CameraModal) {
        return SizeRoute(widget: CulturaTubePage(camera: args,));  
       }
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
