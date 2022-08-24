import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:unstoppable/Blocs/csr/csr_event.dart';
import 'package:unstoppable/Blocs/csr/csr_state.dart';
import 'package:unstoppable/Repository/UserRepository.dart';


import '../../Models/csr_model.dart';
import '../../Models/product_detail_model.dart';


class CSRBloc extends Bloc<CSREvent, CSRState> {
  CSRBloc({this.csrRepo}) : super(InitialCSRState());
  final UserRepository? csrRepo;


  @override
  Stream<CSRState> mapEventToState(event) async* {


/////////////Product Detail
    if (event is OnLoadingCSR) {
      ///Notify loading to UI
      yield CSRLoading();

      ///Fetch API via repository
      final CSRRepo result = await csrRepo!
          .fetchCSR(
          userid: event.userId
      );

      ///Case API fail but not have token
      if (result.result == "Success") {
        CSRData data = new CSRData();
        data = result.data;

        yield CSRSuccess(data: data);
      }
    }





  }
}



