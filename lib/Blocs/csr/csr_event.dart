import 'package:meta/meta.dart';

@immutable
abstract class CSREvent {}


class OnLoadingCSR extends CSREvent {
  String userId;
  OnLoadingCSR({required this.userId});
}