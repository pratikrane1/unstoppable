import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:unstoppable/Api/api.dart';

import 'package:unstoppable/Repository/UserRepository.dart';

import '../../Models/productImage_model.dart';
import '../../Utils/application.dart';
import 'addProductForm_event.dart';
import 'addProductForm_state.dart';
//for multipart
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mime/mime.dart';




class AddProductFormBloc extends Bloc<AddProductFormEvent, AddProductFormState> {
  AddProductFormBloc({this.productImageRepo}) : super(InitialCategoryListState());
  final UserRepository? productImageRepo ;


  @override
  Stream<AddProductFormState> mapEventToState(event) async* {
    //add product form
    if (event is AddProductForm) {
      yield AddProductLoading();

      MultipartRequest request = new MultipartRequest(
          'POST', Uri.parse(Api.addProduct));
      request.fields['cat_id'] = event.catId;
      request.fields['subcat_id'] = event.subCatId;
      request.fields['sscat_id'] = event.sscatId;
      request.fields['prod_name'] = event.prodName;
      request.fields['price'] = event.price;
      request.fields['description'] = event.desc;
      request.fields['user_id'] = Application.vendorLogin!.userId.toString();

      List<MultipartFile> imageUpload = <MultipartFile>[];
      final multipartFile = await http.MultipartFile.fromPath(
        'prodimg', event.image.imagePath.toString(),
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
      );

      imageUpload.add(multipartFile);
      request.files.addAll(imageUpload);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      var responseData = json.decode(response.body);
      if (responseData['result'] == 'Success') {
        yield AddProductSuccess(message: responseData['msg']);
      } else {
        yield AddProductFail(message: responseData['msg']);
      }
    }

    //for image listing of products
    if (event is OnLoadingProductImageList) {
      ///Notify loading to UI
      yield ProductImageLoading();

      ///Fetch API via repository
      final ProductImageRepo response = await productImageRepo!
          .fetchProductImage(
          productId: event.productid,
          offset: event.offset
      );

      final Iterable refactorProductImage = response.data ?? [];
      final listproductimage = refactorProductImage.map((item) {
        return ProductImageModel.fromJson(item);
      }).toList();
      if(refactorProductImage.length>0)
      {
        yield ProductImageListSuccess(productImageList: listproductimage);

      }else{
        yield ProductImageListLoadFail();
      }
    }

    //upload product image
    if (event is UploadProductImage) {
      yield UploadImageLoading();
      MultipartRequest request = new MultipartRequest(
          'POST', Uri.parse(Api.uploadImage));
      request.fields['product_id'] = event.productId;

      List<MultipartFile> imageUpload = <MultipartFile>[];
      final multipartFile = await http.MultipartFile.fromPath(
        'prodimg', event.prodimg.imagePath.toString(),
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
      );

      imageUpload.add(multipartFile);
      request.files.addAll(imageUpload);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      var responseData = json.decode(response.body);
      if (responseData['result'] == 'Success') {
        yield UploadProductImageSuccess();
      }
    }

    //remove product image
    if (event is RemoveProductImage) {
      yield RemoveImageLoading();
      Map<String, String> params;
      params = {
        'img_id': event.imgId
      };

      var response = await http.post(
          Uri.parse(Api.removeImage),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield RemoveProductImageSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }




}
