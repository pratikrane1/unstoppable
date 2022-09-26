import 'package:unstoppable/Screens/image_file.dart';

abstract class LoginEvent {}

class OnLogin extends LoginEvent {

  var email,password;

  OnLogin({this.email,this.password});

}

class OnRegistration extends LoginEvent {

  var userType,fullName,catId,subId,subSubId,businessName,ownershipType,estYear, totalEmp,annualTurnover,gSTIN,address,pinCode,mobile,email,
  referby;
  ImageFile? comLogo;

  OnRegistration({this.userType,this.fullName,this.catId,this.subId,this.subSubId,this.businessName,this.ownershipType,this.estYear, this.totalEmp,this.annualTurnover,this.gSTIN,this.
  address,this.pinCode,this.mobile,this.email,
    this.referby,this.comLogo});

}



class OnLogout extends LoginEvent {
  OnLogout();
}
