import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Utils/application.dart';
import '../Blocs/customerEnquiries/customerEnquiries_bloc.dart';
import '../Blocs/customerEnquiries/customerEnquiries_event.dart';
import '../Blocs/customerEnquiries/customerEnquiries_state.dart';
import '../Models/customerEnquiries_model.dart';
import '../widgets/seeIcon.dart';

class CustomerEnquiriesDetails  extends StatefulWidget{
   String? userId='1';
   CustomerEnquiriesDetails({Key? key, this.userId}) : super(key: key);
  @override
  State<CustomerEnquiriesDetails> createState() => _CustomerEnquiriesDetailsState();
}

class _CustomerEnquiriesDetailsState extends State<CustomerEnquiriesDetails> {
  CustomerEnquiriesBloc? _customerEnquiriesBloc;
  List<CustomerEnquiriesModel> customerEnquiriesList=[];
  CustomerEnquiriesModel? customerEnquiriesModel;
  void initState() {
    // TODO: implement initState
    super.initState();

    _customerEnquiriesBloc = BlocProvider.of<CustomerEnquiriesBloc>(context);
  //  _customerEnquiriesBloc!.add(OnLoadingCustomerEnquiriesList(userid: Application.vendorLogin!.userId.toString()));
    _customerEnquiriesBloc!.add(OnLoadingCustomerEnquiriesList(
        userid: widget.userId.toString()));

  }

  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45.10,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.deepOrange[500],
        leading: Icon(CupertinoIcons.chevron_left,color: Colors.white,size: 18,),
        //leading: Center(child: Text("<",style: TextStyle(color: Colors.white,fontSize: 30),)),
        title: Text("Customer Enquiries Details",style: TextStyle(fontSize: 15),),

      ),
      body:BlocBuilder<CustomerEnquiriesBloc,CustomerEnquiriesState>(builder:(context,state) {
      if (state is CustomerEnquiriesListSuccess) {
        customerEnquiriesList = state.CustomerEnquiriesList!;
      }
      return SafeArea(
        child: Container(
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
                  child: ListView(
                    children: [
                      productName(context,customerEnquiriesModel!),
                      customerName(context,customerEnquiriesModel!),
                      Email(context,customerEnquiriesModel!),
                      mobileNo(context,customerEnquiriesModel!),
                      Date(context,customerEnquiriesModel!),
                      Messages(context,customerEnquiriesModel!),
                      SizedBox(height: 4,),
                      delete(),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ),
      );

      })

    );
  }
}


Widget deleteUpdateIcon(){
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          deleteIcon(),
          SizedBox(width: 15,),
          //editIcon(),
        ],
      ),
    ),
  );
}

Widget Messages(BuildContext context,CustomerEnquiriesModel customerEnquiriesModel)
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 10.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Messages",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:14),),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  height: 150,
                  child:ListView(
                    children: [
                      Text(customerEnquiriesModel.message.toString())
                    ]
                  )
              )
          ),
        ],
      ),
    ),
  );
}


Widget productName(BuildContext context,CustomerEnquiriesModel customerEnquiriesModel)
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Product Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
              Row(
                children: [
                  Icon(Icons.account_tree,color: Colors.black54,size: 15,),
                  SizedBox(width: 7,),
                  //Text(customerEnquiriesModel.prodName.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
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

Widget customerName(BuildContext context,CustomerEnquiriesModel customerEnquiriesModel)
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.account_circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text(customerEnquiriesModel.name.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}


Widget Email(BuildContext context,CustomerEnquiriesModel customerEnquiriesModel)
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.mail,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text(customerEnquiriesModel.email.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
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

Widget mobileNo(BuildContext context,CustomerEnquiriesModel customerEnquiriesModel)
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Mobile No.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.phone_android,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text(customerEnquiriesModel.mobileNo.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Date(BuildContext context,CustomerEnquiriesModel customerEnquiriesModel)
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.account_balance_wallet_sharp,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              //Text(customerEnquiriesModel.addedDate.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}