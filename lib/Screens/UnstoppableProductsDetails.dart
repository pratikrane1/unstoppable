import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/products/bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import '../Utils/application.dart';
import '../widgets/seeIcon.dart';

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
          toolbarHeight: 45.10,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.deepOrange[500],
          leading: Icon(
            CupertinoIcons.chevron_left,
            color: Colors.white,
            size: 18,
          ),
          title: Text(
            "Products Details",
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductDetailSuccess) {
            productDetail = state.data;
          }
          if(state is ProductDetailLoading){

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
                        deleteUpdateIcon()
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
Widget deleteUpdateIcon() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          deleteIcon(),
          SizedBox(
            width: 15,
          ),
          editIcon(),
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
                      Text(productDetail.description.toString())
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
