import 'package:meta/meta.dart';
import 'package:unstoppable/Screens/image_file.dart';

@immutable
abstract class SettingsEvent {}


class OnChangePassword extends SettingsEvent {
  String currentPwd,newPwd;

  OnChangePassword({required this.currentPwd,required this.newPwd });
}




