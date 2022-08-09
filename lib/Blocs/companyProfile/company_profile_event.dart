import 'package:meta/meta.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class CompanyProfileEvent {}


class OnLoadingCompanyProfileList extends CompanyProfileEvent {
  String userid;
  OnLoadingCompanyProfileList({required this.userid});
}
