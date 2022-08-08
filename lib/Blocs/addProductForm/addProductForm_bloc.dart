import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/home_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Models/category_model.dart';
import '../../Models/product_detail_model.dart';
import '../../Utils/application.dart';
import 'addProductForm_event.dart';
import 'addProductForm_state.dart';


class AddProductFormBloc extends Bloc<AddProductFormEvent, AddProductFormState> {
  AddProductFormBloc({this.addProductRepo}) : super(InitialCategoryListState());
  final UserRepository? addProductRepo ;


  @override
  Stream<AddProductFormState> mapEventToState(event) async* {
    ///Event for login
    if (event is OnLoadingCategoryList) {
      ///Notify loading to UI
      yield CategoryLoading();

      ///Fetch API via repository
      final CategoryRepo response = await addProductRepo!
          .fetchProduct();

      final Iterable refactorCategory = response.data ?? [];
      final listcategory = refactorCategory.map((item) {
        return CategoryModel.fromJson(item);
      }).toList();

      yield CategoryListSuccess(addProductFormCategoryList: listcategory);
    }

// Sub Category

 //    if (event is OnLoadingSubCategoryList) {
 //      ///Notify loading to UI
 //      yield AddProductFormSubCategoryLoading();
 //
 //      ///Fetch API via repository
 //      final SubCategoryRepo response = await subCategoryRepo!
 //          .fetchSubCategory(
 //          catId: event.catid,
 //      );
 //
 //      final Iterable refactorSubCategory = response.data ?? [];
 //      final listSubCategory = refactorSubCategory.map((item) {
 //        return SubCategoryModel.fromJson(item);
 //      }).toList();
 //
 //      yield AddProductFormSubCategoryListSuccess(subcategoryList: listSubCategory);
 //    }
 //
  }

}
