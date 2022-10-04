import 'package:meta/meta.dart';

import '../../Screens/image_file.dart';


@immutable
abstract class UserProfileEvent {}


class UserProfileUpdate extends UserProfileEvent {
  String userid;
  String name;
  String businessName;
  String catId;
  String subCatId;
  String subSubCatId;
  String ownershipType;
  String estYear;
  String totEmp;
  String annualTurnover;
  String gstNo;
  String address;
  String pinCode;
  String mobileNo;
  ImageFile? comLogo;
  String imgFlag;
  UserProfileUpdate({required this.imgFlag, required this.userid,
  required this.name, required this.businessName, required this.catId, required this.subCatId, required this.subSubCatId, required this.ownershipType, required this.estYear,
  required this.totEmp, required this.annualTurnover, required this.gstNo, required this.address, required this.pinCode, required this.mobileNo, this.comLogo});
}