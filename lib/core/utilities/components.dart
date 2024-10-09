import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

navigateTo(BuildContext context, Widget widget) {
  return Navigator.push(context,
      MaterialPageRoute<void>(builder: (BuildContext context) => widget));
}

navigateAndFinish(BuildContext context, Widget widget) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => widget),
    (route) => false,
  );
}

////////////////////////////////////////////////////////////////////
// List<String> imagesList = [];
// List<String> titlesList = [];
// List<String> authorsList = [];
// List<String> linksList = [];
List<String> everythingList = [];
////////////////////////////////////////////////////////////////////

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
