import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unstoppable/Blocs/customerEnquiries/customerEnquiries_state.dart';
import '../Blocs/customerEnquiries/customerEnquiries_bloc.dart';
import '../Blocs/customerEnquiries/customerEnquiries_event.dart';
import '../Models/customerEnquiries_model.dart';
import '../Utils/application.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import '../widgets/dropdown.dart';
import '../widgets/icons_buttons.dart';
import 'bottom_navbar.dart';
import 'customerEnquiriesDetails.dart';



class CustomerEnquiries  extends StatefulWidget{
  @override
  State<CustomerEnquiries> createState() => _CustomerEnquiriesState();
}

class _CustomerEnquiriesState extends State<CustomerEnquiries> {
  CustomerEnquiriesBloc? _customerEnquiriesBloc;
  List<CustomerEnquiriesModel> customerEnquiriesList=[];
  List<CustomerEnquiriesModel> searchResult=[];
  bool flagNoDataAvailable=false;
  final TextEditingController _searchcontroller = TextEditingController();
  bool _isSearching=false;


  void initState() {
    // TODO: implement initState
    super.initState();
    _customerEnquiriesBloc = BlocProvider.of<CustomerEnquiriesBloc>(context);
    _customerEnquiriesBloc!.add(OnLoadingCustomerEnquiriesList(userid: Application.vendorLogin!.userId.toString()));

  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void searchOperation(String searchText) {
    searchResult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < customerEnquiriesList.length; i++) {
        CustomerEnquiriesModel customerEnquiriesModel = new CustomerEnquiriesModel();
        customerEnquiriesModel.name = customerEnquiriesList[i].name.toString();
        customerEnquiriesModel.productName = customerEnquiriesList[i].productName.toString();
        customerEnquiriesModel.categoryName = customerEnquiriesList[i].categoryName.toString();
        customerEnquiriesModel.productId = customerEnquiriesList[i].productId.toString();
        customerEnquiriesModel.subCategoryName = customerEnquiriesList[i].subCategoryName.toString();
        customerEnquiriesModel.ssCategoryName = customerEnquiriesList[i].ssCategoryName.toString();
        customerEnquiriesModel.email = customerEnquiriesList[i].email.toString();
        customerEnquiriesModel.mobileNo = customerEnquiriesList[i].mobileNo.toString();

        if (customerEnquiriesModel.productName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            customerEnquiriesModel.categoryName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            customerEnquiriesModel.email.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            customerEnquiriesModel.mobileNo.toString().toLowerCase().contains(searchText.toLowerCase()) ) {
          flagNoDataAvailable=false;
          searchResult.add(customerEnquiriesModel);
        }
      }
      setState(() {
        if(searchResult.length==0){
          flagNoDataAvailable=true;
        }
      });
    }
  }

  Widget buildCustomerEnquiriesList(List<CustomerEnquiriesModel> customerEnquiriesList) {
    if (customerEnquiriesList.length<=0) {
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
        return customerEnquiriesCard(context,customerEnquiriesList[index]);
      },
      itemCount: customerEnquiriesList.length,
    );
  }
//////////////////////////////

  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Enquiries"),
                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
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
                        ListTile(
                          title:Padding(
                            padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 0.0),
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
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
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
                          // trailing:Icon(Icons.more_vert)  ,
                        ),
                        // info(),
                        //for product ListView
                        Expanded(child:Container(
                            margin: EdgeInsets.only(bottom: 70.0),
                            height: MediaQuery.of(context).size.height,
                            child:searchResult.length != 0 ||
                                _searchcontroller.text.isNotEmpty
                                ?
                            buildCustomerEnquiriesList(searchResult)
                                :
              buildCustomerEnquiriesList(customerEnquiriesList)),
                        )],),

                   // SizedBox(height: 5,),
                    //info(),
                    //for product ListView


                    // Positioned(
                    //     bottom: 5.0,
                    //     right: 5.0,
                    //     left: 5.0,
                    //     child: pagenationdetail(context)),
                  ],
                ),
              ),
            ),
          ),
        );

      })

    );
  }
}


Widget customerEnquiriesCard(BuildContext context,CustomerEnquiriesModel customerEnquiriesData){
  return InkWell(

    onTap: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CustomerEnquiriesDetails(customerEnquiriesdata: customerEnquiriesData)));

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerEnquiriesDetails(userId:customerEnquiriesData.userId)));
    },
    child: Padding(
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
             // leading: nameIcon(),
            leading: CachedNetworkImage(
              filterQuality: FilterQuality.medium,
              // imageUrl: Api.PHOTO_URL + widget.users.avatar,
              // imageUrl:
              // "https://picsum.photos/250?image=9",
              imageUrl: customerEnquiriesData.productImage == ""
                  ? "https://picsum.photos/250?image=9"
                  : customerEnquiriesData.productImage.toString(),
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
                      customerEnquiriesData.productName.toString(),
                    //  "Desktop Computer",
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
                            customerEnquiriesData.name.toString(),
                           // "Jayesh Ghoyal",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(width: 20,)
                        ],
                      ),
                      Text(
                        customerEnquiriesData.mobileNo.toString(),
                        //"+91 1234567890",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),

              //dense: true,
              trailing:phoneIcon(),
          ),
        ),
      ),
    ),
  );
}


Widget pagegnation()
{
  return Column(
    children: [
      Text("Items per page:",style: TextStyle(fontSize: 14,color: Colors.black),),
      DropdownButtonWidget(),
    ],
  );
}

Widget backForwordIcons(){
  return Row(
    children: [
      backIcon(),
      SizedBox(width: 5,),
      forwordIcon(),
    ],
  );
}
Widget pagenationdetail(BuildContext context)
{
  return Padding(
    padding: const EdgeInsets.only(top:15.0,right: 15,left: 15,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pagegnation(),
        backForwordIcons()
      ],
    ),
  );
}


