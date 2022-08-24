import 'package:meta/meta.dart';

import '../../Models/csr_model.dart';


@immutable
abstract class CSRState {}


class InitialCSRState extends CSRState {}


class CSRLoading extends CSRState {}



class CSRSuccess extends CSRState {
  CSRData? data;
  CSRSuccess({this.data});
}

class CSRLoadFail extends CSRState {}