

import 'package:unstoppable/Models/vendor_login.dart';

abstract class AuthenticationEvent {}

class OnAuthCheck extends AuthenticationEvent {}

class OnSaveUser extends AuthenticationEvent {
  final VendorLogin user;
  OnSaveUser(this.user);

}

class OnSaveImage extends AuthenticationEvent {
  final String profilePic;
  OnSaveImage(this.profilePic);

}



class OnClear extends AuthenticationEvent {}
