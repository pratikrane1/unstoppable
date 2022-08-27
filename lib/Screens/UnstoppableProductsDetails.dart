import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/products/bloc.dart';
import 'package:unstoppable/Constant/theme_colors.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Screens/add_product.dart';
import 'package:unstoppable/Screens/product_Images.dart';
import 'package:unstoppable/Screens/unstoppableProducts.dart';
import '../Utils/application.dart';
import '../config/image.dart';
import '../widgets/seeIcon.dart';
import 'package:flutter_html/flutter_html.dart';



class UnstoppableProductsDetails extends StatefulWidget {
  var productId;
  UnstoppableProductsDetails({Key? key, this.productId}) : super(key: key);
  @override
  State<UnstoppableProductsDetails> createState() =>
      _UnstoppableProductsDetailsState();
}

class _UnstoppableProductsDetailsState
    extends State<UnstoppableProductsDetails> {
  ProductBloc? _productBloc;
  ProductDetail? productDetail;

  void initState() {
    // TODO: implement initState
    super.initState();

    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc!.add(OnLoadingProductDetail(
        prodId: widget.productId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => DrawerWidget()));
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Products Details'),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductDetailSuccess) {
            productDetail = state.data;
          }
          if(state is ProductDetailLoading){

          }
          if(state is DeleteProductSuccess){
            Fluttertoast.showToast(msg: "Product deleted successfully");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));
             Navigator.pop(context);
          }
          return Container(
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(16.0),
              color: Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: productDetail!=null
                        ?
                    ListView(
                      children: [
                        categoryName(context, productDetail!),
                        subcategoryName(context, productDetail!),
                        subsubcategoryName(context, productDetail!),
                        productName(context, productDetail!),
                        price(context, productDetail!),
                        Descriptions(context, productDetail!),
                        // deleteUpdateIcon(context,productDetail!)
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // For Images Button
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductImages(productId: productDetail!.productId)));
                              },
                              child: Container(
                                width: 40,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5.0),
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
                                          Icons.picture_in_picture,
                                          color: Colors.white,
                                          size: 21,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            // For Delete Icon
                            InkWell(
                                onTap: (){
                                _productBloc!.add(DeleteProduct(productid: productDetail!.productId.toString()));
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
                                            CupertinoIcons.delete,
                                            color: Colors.white,
                                            size: 21,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            // For Edit Icon
                            InkWell(
                                onTap: (){
                                  EditProduct(context,productDetail!);
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
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 21,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                      ],
                    )
                        :
                        Center(child: CircularProgressIndicator(),)
                  ),
                ),
              ),
            ),
          );
        }));
  }
}

// Widget Descriptions(){
//   return ListTile(
//
//       title:Text("Descriptions",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:14),),
//       subtitle:SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//               height: 200,
//               child:ListView(
//                 children: [
//                   Text("A computer is a machine that uses electronics to input, process, store, and output data. Data is information such as numbers, words, and lists. Input of data means to read information from a keyboard, a storage device like a hard drive, or a sensor. The computer processes or changes the data by following the instructions in software programs. A computer program is a list of instructions the computer has to perform. Programs usually perform mathematical calculations, modify data, or move it around. The data is then saved in a storage device, shown on a display, or sent to another computer. Computers can be connected together to form a network such as the internet, allowing the computers to communicate with each other."),
//                 ],
//               )
//           )
//       ),
//
//   );
// }

Future EditProduct(BuildContext context, ProductDetail productDetail) {
  return showModalBottomSheet(
      isScrollControlled: true,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0))),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(child: AddProductScreen(productDetail:productDetail));
      });
}

Widget deleteUpdateIcon(BuildContext context,ProductDetail productDetail) {
  return
    Padding(
    padding: EdgeInsets.only(top: 18.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // For Images Button
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductImages(productId: productDetail.productId)));
            },
            child: Container(
              width: 40,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
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
                        Icons.picture_in_picture,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),

          // For Delete Icon
          InkWell(
            onTap: (){

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
                      CupertinoIcons.delete,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: 15,
          ),
      // For Edit Icon
      InkWell(
        onTap: (){
          EditProduct(context,productDetail);
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
                  Icons.edit,
                  color: Colors.white,
                  size: 21,
                ),
              ),
            ],
          ),
        ),
      )),
        ],
      ),
    ),
  );
}

Widget Descriptions(BuildContext context,ProductDetail productDetail) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 10.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descriptions",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  height: 150,
                  child: ListView(
                    children: [
                      // Text(productDetail.description.toString())
                      Html(data
                  :productDetail.description.toString())
                    ],
                  ))),
        ],
      ),
    ),
  );
}

Widget categoryName(BuildContext context,ProductDetail productDetail) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 8.0,
    ),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_tree,
                    color: Colors.black54,
                    size: 15,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    productDetail.categoryName.toString(),
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          nameIcon(),
        ],
      ),
    ),
  );
}

Widget subcategoryName(BuildContext context, ProductDetail productDetail) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 8.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sub Category",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.account_tree,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                //"Laptops, Pc, Mainframes & Computers",
                productDetail.subCategoryName.toString(),
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget subsubcategoryName(BuildContext context, ProductDetail productDetail) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sub Sub Category",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.account_tree,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
               // "Computer Systems",
                productDetail.ssCategoryName.toString(),
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Widget productName()
// {
//   return ListTile(
//     title: Text("Product Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:18),),
//     subtitle: Row(
//       children: [
//         Icon(Icons.account_balance_wallet_sharp,color: Colors.black54,size: 15,),
//         SizedBox(width: 7,),
//         Text("Product 1",style: TextStyle(color: Colors.black54,fontSize:13),),
//       ],
//     ),
//   );
// }

Widget productName(BuildContext context, ProductDetail productDetail) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Name",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.account_tree,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                //"Product 1",
                productDetail.productName.toString(),
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget price(BuildContext context, ProductDetail productDetail) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.account_tree,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                productDetail.price.toString(),
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
