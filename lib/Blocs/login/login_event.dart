abstract class LoginEvent {}

class OnLogin extends LoginEvent {

  var email,password;

  OnLogin({this.email,this.password});

}



class OnLogout extends LoginEvent {
  OnLogout();
}
