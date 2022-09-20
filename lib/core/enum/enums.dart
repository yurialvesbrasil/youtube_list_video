enum CameraControl {
  LEFT_PRESS,
  LEFT_STOP,
  RIGHT_PRESS,
  RIGHT_STOP,
  UP_PRESS,
  UP_STOP,
  DOWN_PRESS,
  DOWN_STOP,
  HOME,
  ZOOM_IN_PRESS,
  ZOOM_IN_UP,
  ZOOM_OUT_PRESS,
  ZOOM_OUT_UP,
}

enum ViewState { IDLE, BUSY, RESPONSE_ERROR }
// void _rightPress() async {
//   _controle = "right";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   await _request_soap(_requestBody);
//   await _rightUp();
// }

// Future<void> _rightUp() async {
//   _controle = "right";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   await _request_soap(_requestBody);
// }

// void _leftPress() async {
//   _controle = "left";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _leftUp() async {
//   _controle = "left";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _upPress() async {
//   _controle = "up";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _upUp() async {
//   _controle = "up";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _upRightPress() async {
//   _controle = "upright";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _upRightUp() async {
//   _controle = "upright";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _upLeftPress() async {
//   _controle = "upleft";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _upLeftUp() async {
//   _controle = "upleft";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _homeTap() async {
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:GotoPreset><tem:channel>0</tem:channel><tem:alias>*HOME*</tem:alias></tem:GotoPreset></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _downLeftPress() async {
//   _controle = "downleft";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _downLeftUp() async {
//   _controle = "downleft";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _downPress() async {
//   _controle = "down";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _downUp() async {
//   _controle = "down";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _downRightPress() async {
//   _controle = "downright";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:ControlPTZ><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>move</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:ControlPTZ></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }

// void _downRightUp() async {
//   _controle = "downright";
//   String _requestBody =
//       "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Stop><tem:channel>0</tem:channel><tem:param><tem:Parameter_T><tem:key>pan</tem:key><tem:value>$_controle</tem:value></tem:Parameter_T></tem:param></tem:Stop></soapenv:Body></soapenv:Envelope>";
//   _request_soap(_requestBody);
// }
