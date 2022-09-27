import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/myTools/bloc.dart';
import 'package:unstoppable/Blocs/products/bloc.dart';
import 'package:unstoppable/Blocs/products/product_bloc.dart';
import 'package:unstoppable/Models/productIamBuying_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Screens/productDetail.dart';
import 'package:unstoppable/Utils/application.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import '../widgets/dropdown.dart';
import '../widgets/seeIcon.dart';
import 'package:shimmer/shimmer.dart';
import 'Products/UnstoppableProductsDetails.dart';
import 'addProductIamBuying.dart';

class ProductIamBuying extends StatefulWidget {
  String? ordId;
  String? userId;
  int? offset;
  ProductIamBuying({Key? key, this.ordId, this.userId, this.offset}) : super(key: key);
  @override
  State<ProductIamBuying> createState() => _ProductIamBuyingState();
}

// ProductBloc? _productBloc;
// List<ProductModel> productList = [];
// int rowsPerPage = 2;

class _ProductIamBuyingState extends State<ProductIamBuying> {
  MytoolsBloc? _productbuyingBloc;
  List<ProductBuyingModel> productbuyingList=[];
  List<ProductBuyingModel> searchResult=[];
  ProductBuyingModel? productbuyingData;
  int offset = 0;
  int _rowsPerPage = 10;
  double pageCount = 0;
  bool showLoadingIndicator = false;
  bool flagNoDataAvailable=false;
  final TextEditingController _searchcontroller = TextEditingController();
  bool flagLoading=false;

  bool _isSearching=false;



  void initState() {
    // TODO: implement initState
    super.initState();
    productbuyingList=[];
    _productbuyingBloc = BlocProvider.of<MytoolsBloc>(context);
    _productbuyingBloc!.add(OnLoadingProductIamBuyingList(
        userid: Application.vendorLogin!.userId.toString(),
        offset: offset));
    _isSearching = false;

  }
   void _deleteProductUpdate()
   {
     setState(()
     {
       productbuyingList=[];
       _productbuyingBloc!.add(OnLoadingProductIamBuyingList(
           userid: Application.vendorLogin!.userId.toString(),
           offset: offset));
     });
   }
  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }



  void searchOperation(String searchText) {
    searchResult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < productbuyingList.length; i++) {
        ProductBuyingModel productbuying = new ProductBuyingModel();
        productbuying.prodName = productbuyingList[i].prodName.toString();
        productbuying.catName = productbuyingList[i].catName.toString();
        productbuying.catId = productbuyingList[i].catId.toString();
        productbuying.ssCatName = productbuyingList[i].ssCatName.toString();
        productbuying.subCatName = productbuyingList[i].subCatName.toString();
        productbuying.status = productbuyingList[i].status.toString();
        productbuying.subcatId = productbuyingList[i].subcatId.toString();
        productbuying.sscatId = productbuyingList[i].sscatId.toString();


        if (productbuying.catName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            productbuying.subCatName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            productbuying.ssCatName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            productbuying.status.toString().toLowerCase().contains(searchText.toLowerCase()) ) {
          flagNoDataAvailable=false;
          searchResult.add(productbuying);
        }
      }
      setState(() {
        if(searchResult.length==0){
          flagNoDataAvailable=true;
        }
      });
    }
  }

  Widget buildProductBuyingList(
      BuildContext context, List<ProductBuyingModel> productbuyingList) {
    if (productbuyingList.length <= 0) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Loading...",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            //color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                ".......",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
              ),
            ),
          );
        },
        itemCount: List.generate(8, (index) => index).length,
      );
    }

    // return ListView.builder(
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 10, bottom: 15),
      itemBuilder: (context, index) {
        return unstoppableProductBuyingCard(context, productbuyingList[index]);

      },
      itemCount: productbuyingList.length,
    );
  }


  Future AddProductIamBuying(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0))),
        context: context,
        builder: (BuildContext context) {

          return SingleChildScrollView(
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: AddProductIamBuyingScreen(),
              ));
        });
  }

  Widget unstoppableProductBuyingCard(BuildContext context, ProductBuyingModel productbuyingData, ) {
    return InkWell(
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 2, color: Colors.blue),
              // color: Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        productbuyingData.catName.toString(),
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          //color: Theme.of(context).accentColor
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            productbuyingData.subCatName.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                              fontSize: 14.0,
                            ),
                          ),
                          // SizedBox(width: 20,)
                          Text(
                            productbuyingData.ssCatName.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: Colors.orange),
                          ),
                          Text(
                            productbuyingData.prodName.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //dense: true,
                trailing: InkWell(
                  onTap: (){
                    _productbuyingBloc!.add(DeleteProductBuying(ordid: productbuyingData!.ordId.toString()));

                  },
                  child: Container(
                    width: 40,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:  BorderRadius.circular(5.0),
                      //color: Color(0xffc32c37),
                      color: ThemeColors.buttonColor,
                      // border: Border.all(color: Colors.black, width: 1)
                    ),
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => DrawerWidget()));
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('My Buying Products'),
        ),
        body: BlocBuilder<MytoolsBloc, MytoolsState>(builder: (context, state) {
          if (state is ProductIamBuyingListSuccess) {
            productbuyingList = state.productBuyingList!;
            productbuyingList;
            // pageCount = (productList.length / rowsPerPage).ceilToDouble();
            // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
          }
          if (state is ProductIamBuyingLoading) {
            flagNoDataAvailable = false;
            productbuyingList;
          }

          if (state is ProductIamBuyingListLoadFail) {
            flagNoDataAvailable = true;
          }
          if(state is DeleteProductBuyingSuccess){
            Fluttertoast.showToast(msg: "Product deleted successfully");

            flagNoDataAvailable=false;

            productbuyingList=[];

            _productbuyingBloc!.add(OnLoadingProductIamBuyingList(
                userid: Application.vendorLogin!.userId.toString(),
                offset: offset));
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DrawerWidget()));
            // Navigator.pop(context);
          }
          return SafeArea(
              child: Container(
                decoration: new BoxDecoration(
                  //borderRadius: new BorderRadius.circular(16.0),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20.0, bottom: 10),
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    child: Stack(

                      children: [
                        //Searchbar(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //for search bar
                            ListTile(
                                title:Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 0.0),
                                  child: TextField(
                                    controller: _searchcontroller,
                                    onChanged: (value) {
                                      // this.phoneNo=value;
                                      print(value);searchOperation(value);
                                    },

                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFFFFFFF),
                                      isDense: true,
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                                      /* -- Text and Icon -- */
                                      hintText: "Search Here...",
                                      hintStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFB3B1B1),
                                      ), // TextStyle
                                      prefixIcon:  IconButton(
                                        icon: Icon(
                                          Icons.search,
                                          size: 25.0,
                                        ),
                                        onPressed: () {
                                          _handleSearchStart();
                                        },
                                      ),


                                      // Icon
                                      /* -- Border Styling -- */
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(45.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Color(0xFFFF0000),
                                        ), // BorderSide
                                      ), // OutlineInputBorder
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(45.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.grey,
                                        ), // BorderSide
                                      ), // OutlineInputBorder
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(45.0),
                                        borderSide: const BorderSide(
                                          width: 2.0,
                                          color: Colors.grey,
                                        ), // BorderSide
                                      ), // OutlineInputBorder
                                    ), // InputDecoration
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    AddProductIamBuying(context);
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        //color: Color(0xffc32c37),
                                        color: ThemeColors.buttonColor,
                                        border: Border.all(color: Colors.black, width: 1)),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Stack(
                                        children: [
                                          Center(
                                              child:Icon(Icons.add,color: Colors.white,)
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ),
                            // info(),
                            //for product ListView
                            flagNoDataAvailable==false?
                            Expanded(child:Container(
                                margin: EdgeInsets.only(bottom: 70.0),
                                height: MediaQuery.of(context).size.height,
                                child:searchResult.length != 0 ||
                                    _searchcontroller.text.isNotEmpty
                                    ?
                                buildProductBuyingList(context,searchResult)
                                    :
                                buildProductBuyingList(context,productbuyingList))
                            )
                                :
                            Container(
                                margin: EdgeInsets.only(top:180.0),
                                child: Center(child:Text("No Data Available"),))

                          ],
                        ),

                        //for bottom pagination Ui
                        Positioned(
                            bottom: 15.0,
                            right: 5.0,
                            left: 5.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                  right: 15,
                                  left: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Column(
                                    //   children: [
                                    //     Text(
                                    //       "Items per page:",
                                    //       style: TextStyle(fontSize: 10, color: Colors.black),
                                    //     ),
                                    //     DropdownButtonWidget(),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        //back icon
                                        if(offset!=0)
                                          InkWell(
                                              onTap: (){

                                                productbuyingList=[];
                                                if(offset==0){
                                                  _productbuyingBloc!.add(OnLoadingProductIamBuyingList(userid: Application.vendorLogin!.userId.toString(), offset: offset));

                                                }else {
                                                  offset -= 10;
                                                  _productbuyingBloc!.add(OnLoadingProductIamBuyingList(
                                                      userid: Application.vendorLogin!
                                                          .userId.toString(),
                                                      offset: offset));
                                                }
                                              },
                                              child:Container(
                                                width: 40,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:  BorderRadius.circular(5.0),
                                                  //color: Color(0xffc32c37),
                                                  color: Colors.indigo,
                                                  // border: Border.all(color: Colors.black, width: 1)
                                                ),
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  alignment: Alignment.center,
                                                  child: Stack(
                                                    children: [
                                                      Center(
                                                        child: Icon(
                                                          CupertinoIcons.arrow_left,
                                                          color: Colors.white,
                                                          size: 21,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        //fwd icon
                                        InkWell(
                                            onTap: (){
                                              productbuyingList=[];
                                              offset+=10;
                                              _productbuyingBloc!.add(OnLoadingProductIamBuyingList(userid: Application.vendorLogin!.userId.toString(), offset: offset));
                                            },
                                            child:Container(
                                              width: 40,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:  BorderRadius.circular(5.0),
                                                //color: Color(0xffc32c37),
                                                color: Colors.indigo,
                                                // border: Border.all(color: Colors.black, width: 1)
                                              ),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Icon(
                                                        CupertinoIcons.arrow_right,
                                                        color: Colors.white,
                                                        size: 21,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ));
        }));
  }
}

// Widget Searchbar(TextEditingController searchcontroller) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 0.0),
//     child: TextField(
//       controller: searchcontroller,
//       onChanged: (value) {
//         // this.phoneNo=value;
//         print(value);
//         searchOperation(value);
//       },
//
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: const Color(0xFFFFFFFF),
//         isDense: true,
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//         /* -- Text and Icon -- */
//         hintText: "Search Here...",
//         hintStyle: const TextStyle(
//           fontSize: 18,
//           color: Color(0xFFB3B1B1),
//         ), // TextStyle
//         prefixIcon:  IconButton(
//           icon: Icon(
//             Icons.search,
//            size: 25.0,
//           ),
//           onPressed: () {
//             _handleSearchStart();
//           },
//         ),
//
//
//         // Icon
//         /* -- Border Styling -- */
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(45.0),
//           borderSide: const BorderSide(
//             width: 1.0,
//             color: Color(0xFFFF0000),
//           ), // BorderSide
//         ), // OutlineInputBorder
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(45.0),
//           borderSide: const BorderSide(
//             width: 1.0,
//             color: Colors.grey,
//           ), // BorderSide
//         ), // OutlineInputBorder
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(45.0),
//           borderSide: const BorderSide(
//             width: 2.0,
//             color: Colors.grey,
//           ), // BorderSide
//         ), // OutlineInputBorder
//       ), // InputDecoration
//     ),
//   ); // Expanded
// }








// Widget pagenationdetail(BuildContext context) {
//   return
//     Container(
//     width: MediaQuery.of(context).size.width,
//     child: Padding(
//       padding: const EdgeInsets.only(
//         top: 8.0,
//         right: 15,
//         left: 15,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               Text(
//                 "Items per page:",
//                 style: TextStyle(fontSize: 10, color: Colors.black),
//               ),
//               DropdownButtonWidget(),
//             ],
//           ),
//           Row(
//             children: [
//               //back icon
//             InkWell(
//               onTap: (){
//
//               },
//                 child:Container(
//             width: 40,
//             height: 25,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius:  BorderRadius.circular(5.0),
//               //color: Color(0xffc32c37),
//               color: Colors.indigo,
//               // border: Border.all(color: Colors.black, width: 1)
//             ),
//             child: Container(
//               width: 30,
//               height: 30,
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Icon(
//                       CupertinoIcons.arrow_left,
//                       color: Colors.white,
//                       size: 21,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//               SizedBox(
//                 width: 5,
//               ),
//               //fwd icon
//               InkWell(
//                 onTap: (){
//                   productList=[];
//                   _productBloc!.add(OnLoadingProductList(userid: Application.vendorLogin!.userId.toString(), offset: offset+10));
//                 },
//                   child:Container(
//                 width: 40,
//                 height: 25,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   borderRadius:  BorderRadius.circular(5.0),
//                   //color: Color(0xffc32c37),
//                   color: Colors.indigo,
//                   // border: Border.all(color: Colors.black, width: 1)
//                 ),
//                 child: Container(
//                   width: 30,
//                   height: 30,
//                   alignment: Alignment.center,
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Icon(
//                           CupertinoIcons.arrow_right,
//                           color: Colors.white,
//                           size: 21,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

// class CustomSliverChildBuilderDelegate extends SliverChildBuilderDelegate
//     with DataPagerDelegate, ChangeNotifier {
//   CustomSliverChildBuilderDelegate(builder) : super(builder);
//
//   @override
//   int get childCount => productList.length;
//
//   @override
//   Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
//     int startRowIndex = newPageIndex * rowsPerPage;
//     int endRowIndex = startRowIndex + rowsPerPage;
//
//     if (endRowIndex > productList.length) {
//       endRowIndex = productList.length - 1;
//     }
//
//     await Future.delayed(Duration(milliseconds: 2000));
//     productList = productList
//         .getRange(startRowIndex, endRowIndex)
//         .toList(growable: false);
//     notifyListeners();
//     return true;
//   }
//
//   void updateDataGriDataSource() {
//     notifyListeners();
//   }
//
//   @override
//   bool shouldRebuild(covariant CustomSliverChildBuilderDelegate oldDelegate) {
//     return true;
//   }
// }







// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:unstoppable/Blocs/myTools/bloc.dart';
// import 'package:unstoppable/Blocs/products/bloc.dart';
// import 'package:unstoppable/Blocs/products/product_bloc.dart';
// import 'package:unstoppable/Models/productIamBuying_model.dart';
// import 'package:unstoppable/Models/product_detail_model.dart';
// import 'package:unstoppable/Models/product_model.dart';
// import 'package:unstoppable/Screens/add_product.dart';
// import 'package:unstoppable/Screens/productDetail.dart';
// import 'package:unstoppable/Utils/application.dart';
// import '../constant/theme_colors.dart';
// import '../widgets/bell_icon.dart';
// import '../widgets/drawer.dart';
// import '../widgets/dropdown.dart';
// import '../widgets/seeIcon.dart';
// import 'package:shimmer/shimmer.dart';
// import 'UnstoppableProductsDetails.dart';
// import 'addProductIamBuying.dart';
//
// class ProductIamBuying extends StatefulWidget {
//   var ordId;
//   ProductIamBuying({Key? key, this.ordId}) : super(key: key);
//   @override
//   State<ProductIamBuying> createState() => _ProductIamBuyingState();
// }
//
// // ProductBloc? _productBloc;
// // List<ProductModel> productList = [];
// // int rowsPerPage = 2;
//
// class _ProductIamBuyingState extends State<ProductIamBuying> {
//   MytoolsBloc? _productbuyingBloc;
//   List<ProductBuyingModel> productbuyingList=[];
//   List<ProductBuyingModel> searchResult=[];
//   ProductBuyingModel? productBuyingModel;
//   int offset = 0;
//   int _rowsPerPage = 10;
//   double pageCount = 0;
//   bool showLoadingIndicator = false;
//   bool flagNoDataAvailable=false;
//   final TextEditingController _searchcontroller = TextEditingController();
//
//   bool _isSearching=false;
//
//
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _productbuyingBloc = BlocProvider.of<MytoolsBloc>(context);
//     _productbuyingBloc!.add(OnLoadingProductIamBuyingList(
//         userid: Application.vendorLogin!.userId.toString(),
//         offset: offset));
//     _isSearching = false;
//
//   }
//
//
//   void _handleSearchStart() {
//     setState(() {
//       _isSearching = true;
//     });
//   }
//
//
//
//   void searchOperation(String searchText) {
//     searchResult.clear();
//     if (_isSearching != null) {
//       for (int i = 0; i < productbuyingList.length; i++) {
//         ProductBuyingModel productbuying = new ProductBuyingModel();
//         productbuying.prodName = productbuyingList[i].prodName.toString();
//         productbuying.catName = productbuyingList[i].catName.toString();
//         productbuying.catId = productbuyingList[i].catId.toString();
//         productbuying.ssCatName = productbuyingList[i].ssCatName.toString();
//         productbuying.subCatName = productbuyingList[i].subCatName.toString();
//         productbuying.status = productbuyingList[i].status.toString();
//         productbuying.subcatId = productbuyingList[i].subcatId.toString();
//         productbuying.sscatId = productbuyingList[i].sscatId.toString();
//
//
//         if (productbuying.catName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
//             productbuying.subCatName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
//             productbuying.ssCatName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
//             productbuying.status.toString().toLowerCase().contains(searchText.toLowerCase()) ) {
//           flagNoDataAvailable=false;
//           searchResult.add(productbuying);
//         }
//       }
//       setState(() {
//         if(searchResult.length==0){
//           flagNoDataAvailable=true;
//         }
//       });
//     }
//   }
//
//   Widget buildProductBuyingList(
//       BuildContext context, List<ProductBuyingModel> productbuyingList) {
//     if (productbuyingList.length <= 0) {
//       return ListView.builder(
//         scrollDirection: Axis.vertical,
//         // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
//         itemBuilder: (context, index) {
//           return Shimmer.fromColors(
//             baseColor: Theme.of(context).hoverColor,
//             highlightColor: Theme.of(context).highlightColor,
//             enabled: true,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//                   // leading: nameIcon(),
//                   // leading: CachedNetworkImage(
//                   //   filterQuality: FilterQuality.medium,
//                   //   // imageUrl: Api.PHOTO_URL + widget.users.avatar,
//                   //   imageUrl: "https://picsum.photos/250?image=9",
//                   //   // imageUrl: model.cart[index].productImg == null
//                   //   //     ? "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
//                   //   //     : model.cart[index].productImg,
//                   //   placeholder: (context, url) {
//                   //     return Shimmer.fromColors(
//                   //       baseColor: Theme.of(context).hoverColor,
//                   //       highlightColor: Theme.of(context).highlightColor,
//                   //       enabled: true,
//                   //       child: Container(
//                   //         height: 80,
//                   //         width: 80,
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.white,
//                   //           borderRadius: BorderRadius.circular(8),
//                   //         ),
//                   //       ),
//                   //     );
//                   //   },
//                   //   imageBuilder: (context, imageProvider) {
//                   //     return Container(
//                   //       height: 80,
//                   //       width: 80,
//                   //       decoration: BoxDecoration(
//                   //         image: DecorationImage(
//                   //           image: imageProvider,
//                   //           fit: BoxFit.cover,
//                   //         ),
//                   //         borderRadius: BorderRadius.circular(8),
//                   //       ),
//                   //     );
//                   //   },
//                   //   errorWidget: (context, url, error) {
//                   //     return Shimmer.fromColors(
//                   //       baseColor: Theme.of(context).hoverColor,
//                   //       highlightColor: Theme.of(context).highlightColor,
//                   //       enabled: true,
//                   //       child: Container(
//                   //         height: 80,
//                   //         width: 80,
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.white,
//                   //           borderRadius: BorderRadius.circular(8),
//                   //         ),
//                   //         child: Icon(Icons.error),
//                   //       ),
//                   //     );
//                   //   },
//                   // ),
//                   title: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Loading...",
//                           overflow: TextOverflow.clip,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.0,
//                             //color: Theme.of(context).accentColor
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 ".......",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black87,
//                                   fontSize: 14.0,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: Colors.white),
//               ),
//             ),
//           );
//         },
//         itemCount: List.generate(8, (index) => index).length,
//       );
//     }
//
//     // return ListView.builder(
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       padding: EdgeInsets.only(top: 10, bottom: 15),
//       itemBuilder: (context, index) {
//         return unstoppableProductBuyingCard(context, productbuyingList[index]);
//       },
//       itemCount: productbuyingList.length,
//     );
//   }
//
//   // Widget indexBuilder(BuildContext context, int index) {
//   //
//   //   return ListTile(
//   //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   //     title: LayoutBuilder(
//   //       builder: (context, constraint) {
//   //         return Container(
//   //             width: constraint.maxWidth,
//   //             height: 100,
//   //             child: Row(
//   //               children: [
//   //                 Align(
//   //                   alignment: Alignment.centerRight,
//   //                   child: Container(
//   //                     clipBehavior: Clip.antiAlias,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(10)),
//   //                     child: Image.asset("assets/icon.png", width: 100, height: 100),
//   //                   ),
//   //                 ),
//   //                 Container(
//   //                   padding: EdgeInsets.fromLTRB(20, 10, 5, 5),
//   //                   child: Column(
//   //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                     children: [
//   //                       Container(
//   //                         width: constraint.maxWidth - 130,
//   //                         child: Text(productList[index].productName.toString(),
//   //                             style: TextStyle(
//   //                                 fontWeight: FontWeight.w600,
//   //                                 color: Colors.black87,
//   //                                 fontSize: 15)),
//   //                       ),
//   //
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ],
//   //             ));
//   //       },
//   //     ),
//   //   );
//   // }
//   Future AddProductIamBuying(BuildContext context) {
//     return showModalBottomSheet(
//         isScrollControlled: true,
//         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(35.0),
//                 topRight: Radius.circular(35.0))),
//         context: context,
//         builder: (BuildContext context) {
//           return SingleChildScrollView(child: AddProductIamBuyingScreen());
//         });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           // leading: GestureDetector(
//           //   onTap: () {
//           //     // Navigator.pushReplacement(context,
//           //     //     MaterialPageRoute(builder: (context) => BottomNavigation()));
//           //     Navigator.of(context).pop();
//           //   },
//           //   child: Icon(Icons.arrow_back_ios),
//           // ),
//           backgroundColor: ThemeColors.baseThemeColor,
//           elevation: 0.0,
//           centerTitle: false,
//           title: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("My Buying Products"),
//                   //myAppBarIcon(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         drawer: DrawerWidget(),
//         body: BlocBuilder<MytoolsBloc, MytoolsState>(builder: (context, state) {
//           if (state is ProductIamBuyingListSuccess) {
//             productbuyingList = state.productBuyingList!;
//             // pageCount = (productList.length / rowsPerPage).ceilToDouble();
//             // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
//           }
//           if (state is ProductIamBuyingLoading) {
//             flagNoDataAvailable = false;
//           }
//
//           if (state is ProductIamBuyingListLoadFail) {
//             flagNoDataAvailable = true;
//           }
//           if(state is DeleteProductBuyingSuccess){
//             Fluttertoast.showToast(msg: "Product deleted successfully");
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProductIamBuying()));
//             Navigator.pop(context);
//           }
//           // if(state is ProductPageCntSucess){
//           //   pageCount=state.PageCnt;
//           // }
//           return SafeArea(
//               child: Container(
//                 decoration: new BoxDecoration(
//                   //borderRadius: new BorderRadius.circular(16.0),
//                   color: Colors.black12,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 15.0, right: 15.0, top: 20.0, bottom: 10),
//                   child: Container(
//                     decoration: new BoxDecoration(
//                       borderRadius: new BorderRadius.circular(16.0),
//                       color: Colors.white,
//                     ),
//                     child: Stack(
//
//                       children: [
//                         //Searchbar(),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             //for search bar
//                             ListTile(
//                                 title:Padding(
//                                   padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 0.0),
//                                   child: TextField(
//                                     controller: _searchcontroller,
//                                     onChanged: (value) {
//                                       // this.phoneNo=value;
//                                       print(value);searchOperation(value);
//                                     },
//
//                                     decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: const Color(0xFFFFFFFF),
//                                       isDense: true,
//                                       contentPadding:
//                                       const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//                                       /* -- Text and Icon -- */
//                                       hintText: "Search Here...",
//                                       hintStyle: const TextStyle(
//                                         fontSize: 18,
//                                         color: Color(0xFFB3B1B1),
//                                       ), // TextStyle
//                                       prefixIcon:  IconButton(
//                                         icon: Icon(
//                                           Icons.search,
//                                           size: 25.0,
//                                         ),
//                                         onPressed: () {
//                                           _handleSearchStart();
//                                         },
//                                       ),
//
//
//                                       // Icon
//                                       /* -- Border Styling -- */
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(45.0),
//                                         borderSide: const BorderSide(
//                                           width: 1.0,
//                                           color: Color(0xFFFF0000),
//                                         ), // BorderSide
//                                       ), // OutlineInputBorder
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(45.0),
//                                         borderSide: const BorderSide(
//                                           width: 1.0,
//                                           color: Colors.grey,
//                                         ), // BorderSide
//                                       ), // OutlineInputBorder
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(45.0),
//                                         borderSide: const BorderSide(
//                                           width: 2.0,
//                                           color: Colors.grey,
//                                         ), // BorderSide
//                                       ), // OutlineInputBorder
//                                     ), // InputDecoration
//                                   ),
//                                 ),
//                                 trailing: InkWell(
//                                   onTap: () {
//                                     AddProductIamBuying(context);
//                                   },
//                                   child: Container(
//                                     width: 35,
//                                     height: 35,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         //color: Color(0xffc32c37),
//                                         color: Colors.indigo,
//                                         border: Border.all(color: Colors.black, width: 1)),
//                                     child: Container(
//                                       width: 30,
//                                       height: 30,
//                                       alignment: Alignment.center,
//                                       child: Stack(
//                                         children: [
//                                           Center(
//                                               child:Icon(Icons.add,color: Colors.white,)
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                             ),
//                             // info(),
//                             //for product ListView
//                             flagNoDataAvailable==false?
//                             Expanded(child:Container(
//                                 margin: EdgeInsets.only(bottom: 70.0),
//                                 height: MediaQuery.of(context).size.height,
//                                 child:searchResult.length != 0 ||
//                                     _searchcontroller.text.isNotEmpty
//                                     ?
//                                 buildProductBuyingList(context,searchResult)
//                                     :
//                                 buildProductBuyingList(context,productbuyingList))
//                             )
//                                 :
//                             Container(
//                                 margin: EdgeInsets.only(top:180.0),
//                                 child: Center(child:Text("No Data Available"),))
//                             // Expanded(child:
//                             //     Padding(
//                             //       padding: EdgeInsets.only(bottom:20.0),
//                             //         child:buildProductList(context, productList))
//                             // // LayoutBuilder(builder: (context, constraint) {
//                             // //   return Column(
//                             // //     children: [
//                             // //       Container(
//                             // //         // height: constraint.maxHeight - dataPagerHeight,
//                             // //         height: 400,
//                             // //         child: loadListView(constraint),
//                             // //       ),
//                             // //       Container(
//                             // //         // height: dataPagerHeight,
//                             // //         child: SfDataPagerTheme(
//                             // //             data: SfDataPagerThemeData(
//                             // //               // backgroundColor: Colors.indigo,
//                             // //               itemBorderRadius: BorderRadius.circular(5),
//                             // //             ),
//                             // //             child: SfDataPager(
//                             // //                 itemPadding: EdgeInsets.all(10.0),
//                             // //                 availableRowsPerPage: [10, 20, 30],
//                             // //                 onRowsPerPageChanged: (int? rowsPerPage) {
//                             // //                   setState(() {
//                             // //                     _rowsPerPage = rowsPerPage!;
//                             // //                     // employeeDataSource.updateDataGriDataSource();
//                             // //                   });
//                             // //                 },
//                             // //                 pageItemBuilder: (String itemName) {
//                             // //                   if (itemName == 'Next') {
//                             // //                     return Container(
//                             // //                       decoration: BoxDecoration(
//                             // //                         shape: BoxShape.rectangle,
//                             // //                         borderRadius:  BorderRadius.circular(5.0),
//                             // //                         //color: Color(0xffc32c37),
//                             // //                         color: Colors.indigo,
//                             // //                         // border: Border.all(color: Colors.black, width: 1)
//                             // //                       ),
//                             // //                       child: Center(
//                             // //                         child: Icon(
//                             // //                           CupertinoIcons.arrow_right,
//                             // //                           color: Colors.white,
//                             // //                           size: 21,
//                             // //                         ),
//                             // //                       ),
//                             // //                     );
//                             // //                   }
//                             // //                   if (itemName == 'Previous') {
//                             // //                     return Container(
//                             // //                       decoration: BoxDecoration(
//                             // //                         shape: BoxShape.rectangle,
//                             // //                         borderRadius:  BorderRadius.circular(5.0),
//                             // //                         //color: Color(0xffc32c37),
//                             // //                         color: Colors.indigo,
//                             // //                         // border: Border.all(color: Colors.black, width: 1)
//                             // //                       ),
//                             // //                       child: Center(
//                             // //                         child: Icon(
//                             // //                           CupertinoIcons.arrow_left,
//                             // //                           color: Colors.white,
//                             // //                           size: 21,
//                             // //                         ),
//                             // //                       ),
//                             // //                     );
//                             // //                   }
//                             // //                 },
//                             // //                 firstPageItemVisible: false,
//                             // //                 lastPageItemVisible: false,
//                             // //                 visibleItemsCount: 0,
//                             // //                 pageCount: double.parse(productList.length.toString()),
//                             // //                 onPageNavigationStart: (pageIndex) {
//                             // //                   setState(() {
//                             // //                     showLoadingIndicator = true;
//                             // //                   });
//                             // //                 },
//                             // //                 onPageNavigationEnd: (pageIndex) {
//                             // //                   setState(() {
//                             // //                     showLoadingIndicator = false;
//                             // //                   });
//                             // //                 },
//                             // //
//                             // //                 delegate:
//                             // //                 // CustomSliverChildBuilderDelegate(buildProductList(context,productList))
//                             // //                 //   ..addListener(rebuildList))),
//                             // //                 CustomSliverChildBuilderDelegate(indexBuilder)
//                             // //                   ..addListener(rebuildList)))
//                             // //       )
//                             // //     ],
//                             // //   );
//                             // // })
//                             // ),
//                           ],
//                         ),
//
//                         //for bottom pagination Ui
//                         Positioned(
//                             bottom: 15.0,
//                             right: 5.0,
//                             left: 5.0,
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   top: 8.0,
//                                   right: 15,
//                                   left: 15,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     // Column(
//                                     //   children: [
//                                     //     Text(
//                                     //       "Items per page:",
//                                     //       style: TextStyle(fontSize: 10, color: Colors.black),
//                                     //     ),
//                                     //     DropdownButtonWidget(),
//                                     //   ],
//                                     // ),
//                                     Row(
//                                       children: [
//                                         //back icon
//                                         if(offset!=0)
//                                           InkWell(
//                                               onTap: (){
//
//                                                 productbuyingList=[];
//                                                 if(offset==0){
//                                                   _productbuyingBloc!.add(OnLoadingProductIamBuyingList(userid: Application.vendorLogin!.userId.toString(), offset: offset));
//
//                                                 }else {
//                                                   offset -= 10;
//                                                   _productbuyingBloc!.add(OnLoadingProductIamBuyingList(
//                                                       userid: Application.vendorLogin!
//                                                           .userId.toString(),
//                                                       offset: offset));
//                                                 }
//                                               },
//                                               child:Container(
//                                                 width: 40,
//                                                 height: 25,
//                                                 decoration: BoxDecoration(
//                                                   shape: BoxShape.rectangle,
//                                                   borderRadius:  BorderRadius.circular(5.0),
//                                                   //color: Color(0xffc32c37),
//                                                   color: Colors.indigo,
//                                                   // border: Border.all(color: Colors.black, width: 1)
//                                                 ),
//                                                 child: Container(
//                                                   width: 30,
//                                                   height: 30,
//                                                   alignment: Alignment.center,
//                                                   child: Stack(
//                                                     children: [
//                                                       Center(
//                                                         child: Icon(
//                                                           CupertinoIcons.arrow_left,
//                                                           color: Colors.white,
//                                                           size: 21,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               )),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         //fwd icon
//                                         InkWell(
//                                             onTap: (){
//                                               productbuyingList=[];
//                                               offset+=10;
//                                               _productbuyingBloc!.add(OnLoadingProductIamBuyingList(userid: Application.vendorLogin!.userId.toString(), offset: offset));
//                                             },
//                                             child:Container(
//                                               width: 40,
//                                               height: 25,
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.rectangle,
//                                                 borderRadius:  BorderRadius.circular(5.0),
//                                                 //color: Color(0xffc32c37),
//                                                 color: Colors.indigo,
//                                                 // border: Border.all(color: Colors.black, width: 1)
//                                               ),
//                                               child: Container(
//                                                 width: 30,
//                                                 height: 30,
//                                                 alignment: Alignment.center,
//                                                 child: Stack(
//                                                   children: [
//                                                     Center(
//                                                       child: Icon(
//                                                         CupertinoIcons.arrow_right,
//                                                         color: Colors.white,
//                                                         size: 21,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             )),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ));
//         }));
//   }
// }
//
// // Widget Searchbar(TextEditingController searchcontroller) {
// //   return Padding(
// //     padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 0.0),
// //     child: TextField(
// //       controller: searchcontroller,
// //       onChanged: (value) {
// //         // this.phoneNo=value;
// //         print(value);
// //         searchOperation(value);
// //       },
// //
// //       decoration: InputDecoration(
// //         filled: true,
// //         fillColor: const Color(0xFFFFFFFF),
// //         isDense: true,
// //         contentPadding:
// //             const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
// //         /* -- Text and Icon -- */
// //         hintText: "Search Here...",
// //         hintStyle: const TextStyle(
// //           fontSize: 18,
// //           color: Color(0xFFB3B1B1),
// //         ), // TextStyle
// //         prefixIcon:  IconButton(
// //           icon: Icon(
// //             Icons.search,
// //            size: 25.0,
// //           ),
// //           onPressed: () {
// //             _handleSearchStart();
// //           },
// //         ),
// //
// //
// //         // Icon
// //         /* -- Border Styling -- */
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(45.0),
// //           borderSide: const BorderSide(
// //             width: 1.0,
// //             color: Color(0xFFFF0000),
// //           ), // BorderSide
// //         ), // OutlineInputBorder
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(45.0),
// //           borderSide: const BorderSide(
// //             width: 1.0,
// //             color: Colors.grey,
// //           ), // BorderSide
// //         ), // OutlineInputBorder
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(45.0),
// //           borderSide: const BorderSide(
// //             width: 2.0,
// //             color: Colors.grey,
// //           ), // BorderSide
// //         ), // OutlineInputBorder
// //       ), // InputDecoration
// //     ),
// //   ); // Expanded
// // }
//
// Widget unstoppableProductBuyingCard(BuildContext context, ProductBuyingModel productbuyingData, ) {
//   return InkWell(
//       onTap: () {
//         // if(productbuyingData.status!="0"){ //0 for disable and 1=enable
//         //   Navigator.push(
//         //       context,
//         //       MaterialPageRoute(
//         //           builder: (context) => UnstoppableProductsDetails(
//         //               ))
//         //   );
//         // }
//
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             border: Border.all(width: 2, color: Colors.blue),
//             // color: Colors.black12,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//                 // leading: nameIcon(),
//                 // leading: CachedNetworkImage(
//                 //   filterQuality: FilterQuality.medium,
//                 //   // imageUrl: Api.PHOTO_URL + widget.users.avatar,
//                 //   // imageUrl: "https://picsum.photos/250?image=9",
//                 //   imageUrl: productData.productImage == null
//                 //       ? "https://picsum.photos/250?image=9"
//                 //       : productData.productImage.toString(),
//                 //   placeholder: (context, url) {
//                 //     return Shimmer.fromColors(
//                 //       baseColor: Theme.of(context).hoverColor,
//                 //       highlightColor: Theme.of(context).highlightColor,
//                 //       enabled: true,
//                 //       child: Container(
//                 //         height: 80,
//                 //         width: 80,
//                 //         decoration: BoxDecoration(
//                 //           color: Colors.white,
//                 //           borderRadius: BorderRadius.circular(8),
//                 //         ),
//                 //       ),
//                 //     );
//                 //   },
//                 //   imageBuilder: (context, imageProvider) {
//                 //     return Container(
//                 //       height: 80,
//                 //       width: 80,
//                 //       decoration: BoxDecoration(
//                 //         image: DecorationImage(
//                 //           image: imageProvider,
//                 //           fit: BoxFit.cover,
//                 //         ),
//                 //         borderRadius: BorderRadius.circular(8),
//                 //       ),
//                 //     );
//                 //   },
//                 //   errorWidget: (context, url, error) {
//                 //     return Shimmer.fromColors(
//                 //       baseColor: Theme.of(context).hoverColor,
//                 //       highlightColor: Theme.of(context).highlightColor,
//                 //       enabled: true,
//                 //       child: Container(
//                 //         height: 80,
//                 //         width: 80,
//                 //         decoration: BoxDecoration(
//                 //           color: Colors.white,
//                 //           borderRadius: BorderRadius.circular(8),
//                 //         ),
//                 //         child: Icon(Icons.error),
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//                 title: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         productbuyingData.catName.toString(),
//                         overflow: TextOverflow.clip,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                           //color: Theme.of(context).accentColor
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             productbuyingData.subCatName.toString(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black87,
//                               fontSize: 14.0,
//                             ),
//                           ),
//                           // SizedBox(width: 20,)
//                           Text(
//                             productbuyingData.ssCatName.toString(),
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 10.0,
//                                 color: Colors.orange),
//                           ),
//                           Text(
//                             productbuyingData.prodName.toString(),
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 10.0,
//                                 color: Colors.orange),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 //dense: true,
//                 trailing: InkWell(
//                   onTap: (){
//                     //_productbuyingBloc!.add(DeleteProductBuying(ordid: productbuyingData!.ordId.toString()));
//                   },
//                   child: Container(
//                     width: 40,
//                     height: 25,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       borderRadius:  BorderRadius.circular(5.0),
//                       //color: Color(0xffc32c37),
//                       color: Colors.indigo,
//                       // border: Border.all(color: Colors.black, width: 1)
//                     ),
//                     child: Container(
//                       width: 30,
//                       height: 30,
//                       alignment: Alignment.center,
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: Icon(
//                               Icons.delete,
//                               color: Colors.white,
//                               size: 21,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//             ),
//           ),
//         ),
//       ));
// }
//
// Widget detailCard() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(width: 2, color: Colors.blue),
//         // color: Colors.black12,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//             contentPadding: EdgeInsets.zero,
//             //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             leading: CircleAvatar(
//               radius: 25,
//               backgroundColor: Colors.blue,
//             ),
//             title: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "A for apple",
//                     overflow: TextOverflow.clip,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       //color: Theme.of(context).accentColor
//                     ),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Kavita Lande",
//                           style: TextStyle(
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black87,
//                             fontSize: 14.0,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         )
//                       ],
//                     ),
//                     Text(
//                       "Cancel",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 10.0,
//                           color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             //dense: true,
//             trailing: eyepdelete()),
//       ),
//     ),
//   );
// }
//
// Widget eyephone() {
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       eyeIcon(),
//       SizedBox(
//         width: 5,
//       ),
//       phoneIcon(),
//     ],
//   );
// }
//
// Widget eyepdelete() {
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       eyeIcon(),
//       SizedBox(
//         width: 5,
//       ),
//       deleteIcon(),
//     ],
//   );
// }
//
// // Widget pagenationdetail(BuildContext context) {
// //   return
// //     Container(
// //     width: MediaQuery.of(context).size.width,
// //     child: Padding(
// //       padding: const EdgeInsets.only(
// //         top: 8.0,
// //         right: 15,
// //         left: 15,
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Column(
// //             children: [
// //               Text(
// //                 "Items per page:",
// //                 style: TextStyle(fontSize: 10, color: Colors.black),
// //               ),
// //               DropdownButtonWidget(),
// //             ],
// //           ),
// //           Row(
// //             children: [
// //               //back icon
// //             InkWell(
// //               onTap: (){
// //
// //               },
// //                 child:Container(
// //             width: 40,
// //             height: 25,
// //             decoration: BoxDecoration(
// //               shape: BoxShape.rectangle,
// //               borderRadius:  BorderRadius.circular(5.0),
// //               //color: Color(0xffc32c37),
// //               color: Colors.indigo,
// //               // border: Border.all(color: Colors.black, width: 1)
// //             ),
// //             child: Container(
// //               width: 30,
// //               height: 30,
// //               alignment: Alignment.center,
// //               child: Stack(
// //                 children: [
// //                   Center(
// //                     child: Icon(
// //                       CupertinoIcons.arrow_left,
// //                       color: Colors.white,
// //                       size: 21,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           )),
// //               SizedBox(
// //                 width: 5,
// //               ),
// //               //fwd icon
// //               InkWell(
// //                 onTap: (){
// //                   productList=[];
// //                   _productBloc!.add(OnLoadingProductList(userid: Application.vendorLogin!.userId.toString(), offset: offset+10));
// //                 },
// //                   child:Container(
// //                 width: 40,
// //                 height: 25,
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.rectangle,
// //                   borderRadius:  BorderRadius.circular(5.0),
// //                   //color: Color(0xffc32c37),
// //                   color: Colors.indigo,
// //                   // border: Border.all(color: Colors.black, width: 1)
// //                 ),
// //                 child: Container(
// //                   width: 30,
// //                   height: 30,
// //                   alignment: Alignment.center,
// //                   child: Stack(
// //                     children: [
// //                       Center(
// //                         child: Icon(
// //                           CupertinoIcons.arrow_right,
// //                           color: Colors.white,
// //                           size: 21,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               )),
// //             ],
// //           )
// //         ],
// //       ),
// //     ),
// //   );
// // }
//
// // class CustomSliverChildBuilderDelegate extends SliverChildBuilderDelegate
// //     with DataPagerDelegate, ChangeNotifier {
// //   CustomSliverChildBuilderDelegate(builder) : super(builder);
// //
// //   @override
// //   int get childCount => productList.length;
// //
// //   @override
// //   Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
// //     int startRowIndex = newPageIndex * rowsPerPage;
// //     int endRowIndex = startRowIndex + rowsPerPage;
// //
// //     if (endRowIndex > productList.length) {
// //       endRowIndex = productList.length - 1;
// //     }
// //
// //     await Future.delayed(Duration(milliseconds: 2000));
// //     productList = productList
// //         .getRange(startRowIndex, endRowIndex)
// //         .toList(growable: false);
// //     notifyListeners();
// //     return true;
// //   }
// //
// //   void updateDataGriDataSource() {
// //     notifyListeners();
// //   }
// //
// //   @override
// //   bool shouldRebuild(covariant CustomSliverChildBuilderDelegate oldDelegate) {
// //     return true;
// //   }
// // }
