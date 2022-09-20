import 'package:camera_app/core/view_model/camera_view_model.dart';
import 'package:camera_app/core/view_model/noticia_view_model.dart';
import 'package:camera_app/core/view_model/youtube_view_model.dart';
import 'package:camera_app/route_generator.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ui/values/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<CameraViewModel>(
              builder: (context) => CameraViewModel(),
            ),
            ChangeNotifierProvider<NoticiaViewModel>(
              builder: (context) => NoticiaViewModel(),
            ),
            ChangeNotifierProvider<YouTubeViewModel>(
              builder: (context) => YouTubeViewModel(),
            ),  
          ],
          child: MaterialApp(
            title: APP_NAME,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: primaryColor,
              accentColor: accentColor,
              primaryColorDark: primaryDarkColor,  
            ),
            // Initially display FirstPage
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
    );
  }
}
