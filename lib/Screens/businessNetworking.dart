import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unstoppable/Blocs/businessOpportunity/bloc.dart';
import 'package:unstoppable/Models/businessNetworking_model.dart';
import 'package:unstoppable/Screens/notification.dart';
import 'package:unstoppable/Utils/application.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import '../widgets/dropdown.dart';
import '../widgets/icons_buttons.dart';
import 'bottom_navbar.dart';



class BusinessNetworking  extends StatefulWidget{
  @override
  State<BusinessNetworking> createState() => _BusinessNetworkingState();
}

class _BusinessNetworkingState extends State<BusinessNetworking> {
    BusinessOpprtunityBloc? businessOpprtunityBloc;
    int offset=0;
    bool _isSearching=false,flagNoDataAvailable=false;
    List<Requirements> businessNetworkingList=[];
    List<Requirements> searchResult=[];
    final TextEditingController _searchcontroller = TextEditingController();


    void initState() {
    // TODO: implement initState
    super.initState();
    businessOpprtunityBloc = BlocProvider.of<BusinessOpprtunityBloc>(context);
    businessOpprtunityBloc!.add(OnLoadingBusinesNetworkingList(
        userid: Application.vendorLogin!.userId.toString(),
        offset: offset.toString()));
    _isSearching = false;

  }

  //for searc functionality
    void _handleSearchStart() {
      setState(() {
        _isSearching = true;
      });
    }

    void searchOperation(String searchText) {
      searchResult.clear();
      if (_isSearching != null) {
        for (int i = 0; i < businessNetworkingList.length; i++) {
          Requirements product = new Requirements();
          product.bussinessName = businessNetworkingList[i].bussinessName.toString();
          product.prodName = businessNetworkingList[i].prodName.toString();
          product.productId = businessNetworkingList[i].productId.toString();
          product.mobileNo = businessNetworkingList[i].mobileNo.toString();
          product.email = businessNetworkingList[i].email.toString();
          product.type = businessNetworkingList[i].type.toString();
          product.id = businessNetworkingList[i].id.toString();



          if (product.bussinessName.toString().toLowerCase().contains(
              searchText.toLowerCase()) ||
              product.prodName.toString().toLowerCase().contains(
                  searchText.toLowerCase()) ||
              product.email.toString().toLowerCase().contains(
                  searchText.toLowerCase()) ||
              product.mobileNo.toString().toLowerCase().contains(
                  searchText.toLowerCase())||product.type.toString().toLowerCase().contains(
              searchText.toLowerCase())) {
            flagNoDataAvailable = false;
            searchResult.add(product);
          }
        }
        setState(() {
          if (searchResult.length == 0) {
            flagNoDataAvailable = true;
          }
        });
      }
    }

    Widget buildBusinessNetworkingList(
        BuildContext context, List<Requirements> businessNetworkingList) {
      if (businessNetworkingList.length <= 0) {
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
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //business name
                      Text(
                          businessNetworkingList[index].bussinessName.toString(),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            //color: Theme.of(context).accentColor
                          ),
                        ),
                   SizedBox(height: 8.0,),
                   //prod name
                Text(
                                businessNetworkingList[index].prodName.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                ),
                              ),
                      SizedBox(height: 3.0,),
                      //email
                      Text(
                        businessNetworkingList[index].email.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 3.0,),
                      //mobile
                      Text(
                        businessNetworkingList[index].mobileNo.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 3.0,),
                        //type
                      Text(
                        businessNetworkingList[index].type.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontSize: 14.0,
                        ),
                      ),


                    ],
                  ),

                  //dense: true,
                  //trailing:eyephone()
                ),
              ),
            ),
          );
        },
        itemCount: businessNetworkingList.length,
      );
    }

  // For Bell Icon
  Widget bellIcon()
  {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: Color(0xffc32c37),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1)),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationPage()));

        },
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 21,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 5, left: 4),
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color(0xffc32c37),
                      color: Colors.green,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        "",
                        // _counter.toString(),
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Business Networking"),

                bellIcon(),
              ],
            ),
          ],
        ),
      ),

      drawer: DrawerWidget(),
      body:BlocBuilder<BusinessOpprtunityBloc,BusinessOpportunityState>(builder: (context,state){
        return BlocListener<BusinessOpprtunityBloc,BusinessOpportunityState>(listener: (context,state){
          if(state is BusinessNetworkingListSuccess){
            flagNoDataAvailable=false;
            businessNetworkingList=state.businessNetworkingList!;
          }
          if(state is BusinessNetworkingListLoadFail){
            flagNoDataAvailable=true;
          }
        },
        child:SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Searchbar(),
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
                                prefixIcon:  IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    size: 25.0,
                                  ),
                                  onPressed: () {
                                    _handleSearchStart();
                                  },
                                ),
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
                          ),// Expanded ,
                          //trailing:Icon(Icons.more_vert) ,
                        ),
                        SizedBox(height: 5,),
                        /// FOR CARD INFO DISPLAY
                        flagNoDataAvailable==false?
                        Expanded(child:
                        Container(
                            height: MediaQuery.of(context).size.height,
                            child:searchResult.length != 0 ||
                                _searchcontroller.text.isNotEmpty
                                ?
                            buildBusinessNetworkingList(context, searchResult)
                                :
                            // (businessNetworkingList.length != 0)
                            // ?
                            buildBusinessNetworkingList(context, businessNetworkingList)
                                // :
                                // Center(child: Text("No Data Available",
                                // style: TextStyle(fontSize: 20),),)

                        ))
                            :
                        Container(
                            margin: EdgeInsets.only(top:180.0),
                            child: Center(child:Text("No Data Available"),))
                      ],
                    )
                   ,

                  ],
                ),
              ),
            ),
          ),
        ));
      })

    );
  }
}

Widget searchDot()
{
  return ListTile(
    title:Padding(
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
    ),// Expanded ,
    //trailing:Icon(Icons.more_vert) ,
  );
}

Widget info(){
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 450,
          child:ListView(
            children: [
          Padding(
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
                        "Amolak sweets",
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
                              "Ajay tiki",
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
                          "Processing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),

                //dense: true,
                trailing:eyephone()
            ),
          ),
        ),
      ),
            ],
          )
      )
  );
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


Widget infoCard(){
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
                  "Amolak sweets",
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
                        "Ajay tiki",
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
                        "Processing",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),

          //dense: true,
          trailing:eyephone()
        ),
      ),
    ),
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

Widget pagegnation()
{
  return Column(
    children: [
      Text("Items per page:",style: TextStyle(fontSize: 10,color: Colors.black),),
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
Widget pagenationdetail()
{
  return Padding(
    padding: const EdgeInsets.only(top:8.0,right: 15,left: 15,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pagegnation(),
        backForwordIcons()
      ],
    ),
  );
}


