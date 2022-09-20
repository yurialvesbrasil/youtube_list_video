import 'dart:async';
import 'package:camera_app/core/enum/enums.dart';
import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/core/services/camera_service.dart';
import 'package:camera_app/core/view_model/base_view_model.dart';

import 'package:camera_app/ui/util/util.dart';
import 'package:camera_app/ui/values/values.dart';


class CameraViewModel extends BaseViewModel {
  StreamController<List<CameraModal>> _streamController = StreamController<List<CameraModal>>();
  Stream<List<CameraModal>> get camerasStream => _streamController.stream.asBroadcastStream();
  List<CameraModal> _cameras = [];
  List<CameraModal> get cameras => _cameras;


  CameraViewModel(){
    getAllCameras();
  }


 Future<void> getAllCameras() async {
    setState(ViewState.BUSY);
    try {
      if (await Util.isConnectedToInternet()) {
        _cameras = await CamerasService.instance().getAllCameras();
        if (_cameras == null) throw new Exception(DEFAULT_ERROR_MESSAGE);
        _streamController.add(_cameras);
        setState(ViewState.IDLE);
      } else {
        Util.showNoInternetToast();
      }
    } on Exception catch (e) {
      print(e.toString());
      setState(ViewState.RESPONSE_ERROR);
      Util.showErrorToast();
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

}
