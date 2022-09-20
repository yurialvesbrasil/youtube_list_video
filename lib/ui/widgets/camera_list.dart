
import 'dart:io';

import 'package:camera_app/core/enum/enums.dart';
import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/core/view_model/camera_view_model.dart';
import 'package:camera_app/ui/util/util.dart';
import 'package:camera_app/ui/values/colors.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/general_info_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CamerasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Util.setStatusBarColor(style: StatusBarStyle.LIGHT);
    return Stack(
      children: [
        SafeArea(
          child: _getWidgetForViewState(context),
        ),
        //ClippedContainer(),
      ],
    );
  }

  Widget _getWidgetForViewState(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    paddingTop = paddingTop > 20.0 ? paddingTop + 30 : 18.0 + paddingTop + 30 ;

    final model = Provider.of<CameraViewModel>(context);

    if (model.state == ViewState.RESPONSE_ERROR || model.cameras == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(DEFAULT_PADDING * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DEFAULT_ERROR_MESSAGE,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: DEFAULT_PADDING,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.refresh),
                label: Text("Tentar novamente"),
                onPressed: () => model.getAllCameras(),
              )
            ],
          ),
        ),
      );
    } else {
      if (model.state == ViewState.BUSY && model.cameras.length == 0) {
        return  Stack(
            children: <Widget>[
                Center(
                  child:CircularProgressIndicator(),
                ),
                Positioned(
                  top: paddingTop,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(DEFAULT_PADDING),
                    child: FloatingActionButton(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.black54,
                      child: Icon(Icons.refresh),
                      onPressed: () => model.getAllCameras(),
                    ),
                  ),
                )
            ],   
        );
      } else {
        return RefreshIndicator(
          onRefresh: () => model.getAllCameras(),
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: paddingTop +
                  CUSTOM_APP_BAR_HEIGHT / 2 +
                  CUSTOM_APP_BAR_BOTTOM_MARGIN +
                  (Platform.isAndroid ? 16.0 : 0.0),
              bottom:
                  MediaQuery.of(context).padding.bottom + DEFAULT_PADDING * 3,
            ),
            itemCount: model.cameras.length,
            itemBuilder: (context, index) {
              bool isFirst = index == 0 ? true : false;
              bool isLast = index == model.cameras.length - 1 ? true : false;
              return Provider<CameraModal>(
                key: ObjectKey(model.cameras[index]),
                builder: (context) => model.cameras[index],
                child: GeneralInfoListItem(
                  isFirst: isFirst,
                  isLast: isLast,
                  
                ),
              );
            },
          ),
        );
      }
    }
  }
}
