import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/myTools/bloc.dart';
import 'package:unstoppable/Blocs/products/bloc.dart';
import 'package:unstoppable/Blocs/products/product_bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Models/untoppable_order_model.dart';
import 'package:unstoppable/Screens/productDetail.dart';
import 'package:unstoppable/Screens/updateOrder.dart';
import 'package:unstoppable/Utils/application.dart';
import '../Blocs/myTools/myTools_bloc.dart';
import '../Constant/font_size.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import '../widgets/dropdown.dart';
import '../widgets/seeIcon.dart';
import 'package:shimmer/shimmer.dart';
import 'My Unstoppable Orders/my_unstoppable_order_details.dart';
import 'Products/UnstoppableProductsDetails.dart';

class UnstoppableOrders extends StatefulWidget {
  @override
  State<UnstoppableOrders> createState() => _UnstoppableOrdersState();
}



class _UnstoppableOrdersState extends State<UnstoppableOrders> {
  MytoolsBloc? _ordersBloc;
  List<UnstoppableOrderModel> ordersList=[];
  List<UnstoppableOrderModel> searchResult=[];
  int offset = 0;
  int _rowsPerPage = 10;
  double pageCount = 0;
  bool showLoadingIndicator = false;
  bool flagNoDataAvailable=false;
  final TextEditingController _searchcontroller = TextEditingController();

  bool _isSearching=false;



  void initState() {
    // TODO: implement initState
    super.initState();
    _ordersBloc = BlocProvider.of<MytoolsBloc>(context);
    _ordersBloc!.add(OnLoadingUnstoppableOrderList(
        userid: Application.vendorLogin!.userId.toString(),
        offset: offset));
    _isSearching = false;

  }


  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }



  void searchOperation(String searchText) {
    searchResult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < ordersList.length; i++) {
        UnstoppableOrderModel order = new UnstoppableOrderModel();
        order.businessName = ordersList[i].businessName.toString();
        order.customerName = ordersList[i].customerName.toString();
        order.customerContact = ordersList[i].customerContact.toString();
        order.customerMail = ordersList[i].customerMail.toString();
        order.prodName = ordersList[i].prodName.toString();
        order.unitType = ordersList[i].unitType.toString();
        order.qty = ordersList[i].qty.toString();



        if (order.businessName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            order.customerName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            order.customerContact.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            order.prodName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            order.customerMail.toString().toLowerCase().contains(searchText.toLowerCase()) ) {
          flagNoDataAvailable=false;
          searchResult.add(order);
        }
      }
      setState(() {
        if(searchResult.length==0){
          flagNoDataAvailable=true;
        }
      });
    }
  }

  Widget buildProductList(
      BuildContext context, List<UnstoppableOrderModel> ordersList) {
    if (ordersList.length <= 0) {
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
                  //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  // leading: nameIcon(),
                  leading: CachedNetworkImage(
                    filterQuality: FilterQuality.medium,
                    // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                    imageUrl: "https://picsum.photos/250?image=9",
                    // imageUrl: model.cart[index].productImg == null
                    //     ? "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                    //     : model.cart[index].productImg,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Theme.of(context).hoverColor,
                        highlightColor: Theme.of(context).highlightColor,
                        enabled: true,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Shimmer.fromColors(
                        baseColor: Theme.of(context).hoverColor,
                        highlightColor: Theme.of(context).highlightColor,
                        enabled: true,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
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
        return unstoppableProductCard(context, ordersList[index]);
      },
      itemCount: ordersList.length,
    );
  }


  Future UpdateOrder(BuildContext context) {

    return showModalBottomSheet(
        isScrollControlled: true,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0))),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(child: UpdateOrderScreen(unstoppableOrderModel:new UnstoppableOrderModel(),));
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DrawerWidget()));
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('My Unstoppable Orders'),
        ),
        // drawer: DrawerWidget(),
        body: BlocBuilder<MytoolsBloc, MytoolsState>(builder: (context, state) {
          if (state is UnstoppableOrdersListSuccess) {
            ordersList = state.ordersList!;
            // pageCount = (productList.length / rowsPerPage).ceilToDouble();
            // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
          }
          if (state is UnstoppableOrdersLoading) {
            flagNoDataAvailable = false;
          }

          if (state is UnstoppableOrdersListLoadFail) {
            flagNoDataAvailable = true;
          }
          // if(state is ProductPageCntSucess){
          //   pageCount=state.PageCnt;
          // }
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
                                      print(value);
                                      searchOperation(value);
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
                                // trailing: InkWell(
                                //   onTap: () {
                                //     UpdateOrder(context);
                                //   },
                                //   child: Container(
                                //     width: 35,
                                //     height: 35,
                                //     decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         //color: Color(0xffc32c37),
                                //         color: Colors.indigo,
                                //         border: Border.all(color: Colors.black, width: 1)),
                                //     child: Container(
                                //       width: 30,
                                //       height: 30,
                                //       alignment: Alignment.center,
                                //       child: Stack(
                                //         children: [
                                //           Center(
                                //               child:Icon(Icons.edit,color: Colors.white,)
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // )
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
                                buildProductList(context,searchResult)
                                    :
                                buildProductList(context,ordersList))
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

                                    Row(
                                      children: [
                                        //back icon
                                        if(offset!=0)
                                          InkWell(
                                              onTap: (){

                                                ordersList=[];
                                                if(offset==0){
                                                  _ordersBloc!.add(OnLoadingUnstoppableOrderList(userid: Application.vendorLogin!.userId.toString(), offset: offset));

                                                }else {
                                                  offset -= 10;
                                                  _ordersBloc!.add(OnLoadingUnstoppableOrderList(
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
                                              ordersList=[];
                                              offset+=10;
                                              _ordersBloc!.add(OnLoadingUnstoppableOrderList(userid: Application.vendorLogin!.userId.toString(), offset: offset));
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

Widget unstoppableProductCard(BuildContext context, UnstoppableOrderModel orderData) {
  return InkWell(
      onTap: () {
        // if(orderData.status!="0"){ //0 for disable and 1=enable
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => UnstoppableProductsDetails(
        //               productId: productData.productId)));
        // }

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
                //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                // leading: nameIcon(),
                title: Column(
                  children: [
                    Row(
                      children: [
                        Text("Business Name:",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          //color: Theme.of(context).accentColor
                        ),),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            orderData.businessName.toString(),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 15.0,
                              //color: Theme.of(context).accentColor
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Customer Name:",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          //color: Theme.of(context).accentColor
                        ),),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            orderData.customerName.toString(),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 15.0,
                              //color: Theme.of(context).accentColor
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Product Name:",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          //color: Theme.of(context).accentColor
                        ),),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            orderData.prodName.toString(),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 15.0,
                              //color: Theme.of(context).accentColor
                            ),
                          ),
                        ),


                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Status:",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          //color: Theme.of(context).accentColor
                        ),),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            orderData.status.toString(),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15.0,
                              //color: Theme.of(context).accentColor
                            ),
                          ),
                        ),



                      ],
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyUnstoppableOrdersDetail(ordersData: orderData)));
                        },
                        child:Center(
                          child: Container(
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
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 21,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),



                  ],
                ),

                //dense: true,

          ),
        ),
      )));
}








