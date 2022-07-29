import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/products/bloc.dart';
import 'package:unstoppable/Blocs/products/product_bloc.dart';
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

import 'UnstoppableProductsDetails.dart';


class UnstoppableProducts  extends StatefulWidget{
  @override
  State<UnstoppableProducts> createState() => _UnstoppableProductsState();
}

class _UnstoppableProductsState extends State<UnstoppableProducts> {

  ProductBloc? _productBloc;
  List<ProductModel> productList=[];

  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //MyAccountPage(),
    Text(
      'Index 1: Products',
      style: optionStyle,
    ),
    Text(
      'Index 2: Network',
      style: optionStyle,
    ),
    Text(
      'Index 3: Buying Req',
      style: optionStyle,
    ),
    Text(
      'Index 4: Enquires',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc!.add(OnLoadingProductList(userid: Application.vendorLogin!.userId.toString()));

  }

  Widget buildProductList(List<ProductModel> productList) {
    if (productList.length<=0) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: Theme.of(context).hoverColor,
              highlightColor: Theme.of(context).highlightColor,
              enabled: true,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  width: MediaQuery.of(context).size.width,
                  child:
                 ListTile(
                        contentPadding: EdgeInsets.zero,
                        //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        // leading: nameIcon(),
                        leading: CachedNetworkImage(
                          filterQuality: FilterQuality.medium,
                          // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                          imageUrl:
                          "https://picsum.photos/250?image=9",
                          // imageUrl: model.cart[index].productImg == null
                          //     ? "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                          //     : model.cart[index].productImg,
                          placeholder: (context, url) {
                            return Shimmer.fromColors(
                              baseColor: Theme
                                  .of(context)
                                  .hoverColor,
                              highlightColor:
                              Theme
                                  .of(context)
                                  .highlightColor,
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
                              baseColor: Theme
                                  .of(context)
                                  .hoverColor,
                              highlightColor:
                              Theme
                                  .of(context)
                                  .highlightColor,
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
                                    SizedBox(width: 20,)
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

    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only( top: 10, bottom: 15),
      itemBuilder: (context, index) {
        return unstoppableProductCard(context,productList[index]);
      },
      itemCount: productList.length,
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () {
        //     // Navigator.pushReplacement(context,
        //     //     MaterialPageRoute(builder: (context) => BottomNavigation()));
        //     Navigator.of(context).pop();
        //   },
        //   child: Icon(Icons.arrow_back_ios),
        // ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Unstoppable Products"),
                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      drawer:DrawerWidget(context),
      body:BlocBuilder<ProductBloc,ProductState>(builder:(context,state){
        if(state is ProductListSuccess){
          productList=state.productList!;
        }
        return SafeArea(child:
        Container(
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 20.0,bottom: 10),
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
                  title:Searchbar() ,
                  trailing:addIcon(context) ,
                  ),
                      // info(),
                      //for product ListView
                      Expanded(child:Container(
                        margin: EdgeInsets.only(bottom: 70.0),
                        height: MediaQuery.of(context).size.height,
                          child:buildProductList(productList))),
                    ],
                  ),


                  //for bottom pagination Ui
                  Positioned(
                      bottom: 5.0,
                      right: 5.0,
                      left: 5.0,
                      child: pagenationdetail(context)),

                ],
              ),
            ),
          ),
        )
        );
      })

    );
  }
}





Widget Searchbar()
{
  return Padding(
    padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 0.0),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
        /* -- Text and Icon -- */
        hintText: "Search Here...",
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFFB3B1B1),
        ), // TextStyle

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
  ); // Expanded
}


Widget unstoppableProductCard(BuildContext context,ProductModel productData){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>UnstoppableProductsDetails(productId:productData.productId)));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:  BoxDecoration(
          borderRadius:  BorderRadius.circular(10.0),
          border: Border.all(width: 2, color: Colors.blue),
          // color: Colors.black12,
        ),
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              contentPadding: EdgeInsets.zero,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              // leading: nameIcon(),
              leading: CachedNetworkImage(
                filterQuality: FilterQuality.medium,
                // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                imageUrl:
                "https://picsum.photos/250?image=9",
                // imageUrl: model.cart[index].productImg == null
                //     ? "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                //     : model.cart[index].productImg,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Theme
                        .of(context)
                        .hoverColor,
                    highlightColor:
                    Theme
                        .of(context)
                        .highlightColor,
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
                    baseColor: Theme
                        .of(context)
                        .hoverColor,
                    highlightColor:
                    Theme
                        .of(context)
                        .highlightColor,
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
                      productData.categoryName.toString(),
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
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text(
                        productData.productName.toString(),

                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                      // SizedBox(width: 20,)

                      Row(
                        children: [
                          Icon(CupertinoIcons.check_mark_circled_solid,color: Colors.green,),
                          SizedBox(width: 5,),
                          Text(
                            productData.statusName.toString(),

                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //dense: true,
              trailing:Text('\u{20B9}'+productData.price.toString(),
                style: TextStyle(color: Colors.indigo,fontSize: 14),)
          ),
        ),
      ),
    )
  );
}

Widget detailCard(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration:  BoxDecoration(
        borderRadius:  BorderRadius.circular(10.0),
        border: Border.all(width: 2, color: Colors.blue),
        // color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            contentPadding: EdgeInsets.zero,
            //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
            ),
            title: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "A for apple",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
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
                          "Kavita Lande",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                    Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),

            //dense: true,
            trailing:eyepdelete()
        ),
      ),
    ),
  );
}

Widget eyephone()
{
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      eyeIcon(),
      SizedBox(width: 5,),
      phoneIcon(),
    ],
  );
}

Widget eyepdelete()
{
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      eyeIcon(),
      SizedBox(width: 5,),
      deleteIcon(),
    ],
  );
}



Widget pagenationdetail(BuildContext context)
{
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(top:8.0,right: 15,left: 15,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
      Column(
      children: [
      Text("Items per page:",style: TextStyle(fontSize: 10,color: Colors.black),),
      DropdownButtonWidget(),
      ],
    ),
     Row(
    children: [
    backIcon(),
    SizedBox(width: 5,),
forwordIcon(),
],
)
        ],
      ),
    ),
  );
}


