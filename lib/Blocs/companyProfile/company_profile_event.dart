import 'package:meta/meta.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class CompanyProfileEvent {}


class OnLoadingCompanyProfileList extends CompanyProfileEvent {
  String userid;
  OnLoadingCompanyProfileList({required this.userid});
}

class UpdateCompanyProfile extends CompanyProfileEvent{
  String userid;
  String name;
  String managingdirector;
  String ceo;
  String companyname;
  String operatordesignation;
  String operatorname;
  String businessaddress;
  String country;
  String state;
  String city;
  String zipcode;
  String gstin;
  String website;
  String mobileno;
  String altmobile;
  String email;
  String altemail;
  String landline;
  String estyear;
  String businesstype;
  String ownershiptype;
  String totemp;
  String anualturnover;
  String panno;
  String tanno;
  String cinno;
  String dfgt;

  UpdateCompanyProfile({
    required this.userid,
    required this.name,
    required this.managingdirector,
    required this.ceo,
    required this.companyname,
    required this.operatordesignation,
    required this.operatorname,
    required this.businessaddress,
    required this.country,
    required this.state,
    required this.city,
    required this.zipcode,
    required this.gstin,
    required this.website,
    required this.mobileno,
    required this.altmobile,
    required this.email,
    required this.altemail,
    required this.landline,
    required this.estyear,
    required this.businesstype,
    required this.ownershiptype,
    required this.totemp,
    required this.anualturnover,
    required this.panno,
    required this.tanno,
    required this.cinno,
    required this.dfgt});
}


class OnLoadingUserProfile extends CompanyProfileEvent {
  String userid;
  OnLoadingUserProfile({required this.userid});
}