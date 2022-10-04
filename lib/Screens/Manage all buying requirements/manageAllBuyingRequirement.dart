import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unstoppable/Blocs/manageAllBuyingRequirement/manageAllBuyingRequirement_block.dart';
import 'package:unstoppable/Blocs/manageAllBuyingRequirement/manageAllBuyingRequirement_state.dart';
import 'package:unstoppable/Blocs/manageAllBuyingRequirement/manageAllBuyingRequirements_event.dart';
import '../../Models/manageAllBuyingRequirements_model.dart';
import '../../Utils/application.dart';
import '../../constant/theme_colors.dart';
import '../../widgets/bell_icon.dart';
import '../../widgets/drawer.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/icons_buttons.dart';
import 'ManageAllBuyingRequirementDetails.dart';
import '../bottom_navbar.dart';



class ManageAllBuyingRequirement  extends StatefulWidget{
  @override
  State<ManageAllBuyingRequirement> createState() => _ManageAllBuyingRequirementState();
}

class _ManageAllBuyingRequirementState extends State<ManageAllBuyingRequirement> {
  ManageAllBuyingRequirementBloc? _allBuyingRequirementBloc;
  List<ManageAllBuyingRequirementModel> allBuyingRequirementList=[];
  List<ManageAllBuyingRequirementModel> searchResult=[];
  bool showLoadingIndicator = false;
  bool flagNoDataAvailable=false;
  final TextEditingController _searchcontroller = TextEditingController();
  bool _isSearching=false;
  int offset = 0;



  void initState() {
    // TODO: implement initState
    super.initState();

    _allBuyingRequirementBloc = BlocProvider.of<ManageAllBuyingRequirementBloc>(context);
    _allBuyingRequirementBloc!.add(OnLoadingManageAllBuyingRequirementList(userid: Application.vendorLogin!.userId.toString()));
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
      for (int i = 0; i < allBuyingRequirementList.length; i++) {
        ManageAllBuyingRequirementModel allBuyingRequirement = new ManageAllBuyingRequirementModel();
        allBuyingRequirement.prodName = allBuyingRequirementList[i].prodName.toString();
        allBuyingRequirement.catId = allBuyingRequirementList[i].catId.toString();
        allBuyingRequirement.subcatId = allBuyingRequirementList[i].subcatId.toString();
        allBuyingRequirement.useCase = allBuyingRequirementList[i].useCase.toString();
        allBuyingRequirement.type = allBuyingRequirementList[i].type.toString();
        allBuyingRequirement.unitType = allBuyingRequirementList[i].unitType.toString();


        if (allBuyingRequirement.prodName.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            allBuyingRequirement.catId.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            allBuyingRequirement.useCase.toString().toLowerCase().contains(searchText.toLowerCase()) ||
            allBuyingRequirement.type.toString().toLowerCase().contains(searchText.toLowerCase()) ||
          allBuyingRequirement.unitType.toString().toLowerCase().contains(searchText.toLowerCase()) ) {
          flagNoDataAvailable=false;
          searchResult.add(allBuyingRequirement);
        }
      }
      setState(() {
        if(searchResult.length==0){
          flagNoDataAvailable=true;
        }
      });
    }
  }


  Widget buildLeadList(
      BuildContext context, List<ManageAllBuyingRequirementModel> allBuyingRequirementList) {
    if (allBuyingRequirementList.length <= 0) {
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
        return infoManage(context, allBuyingRequirementList[index]);
      },
      itemCount: allBuyingRequirementList.length,
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:
      AppBar(
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
        centerTitle: false,
        title: Text("Manage All Buying Requirements"),
      ),

      body:BlocBuilder<ManageAllBuyingRequirementBloc, ManageAllBuyingRequirementState>(builder: (context, state) {
        if (state is ManageAllBuyingRequirementListSuccess) {
          allBuyingRequirementList = state.manageAllBuyingList!;
          // pageCount = (productList.length / rowsPerPage).ceilToDouble();
          // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
        }
        if (state is ManageAllBuyingRequirementListLoading) {
          flagNoDataAvailable = false;
        }

        // if (state is ProductDetailLoadFail) {
        //   flagNoDataAvailable = true;
        // }
        return
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.87,
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
                            // trailing: Icon(Icons.more_vert),
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
                              buildLeadList(context,searchResult)
                                  :
                              buildLeadList(context,allBuyingRequirementList))
                          )
                              :
                          Container(
                              margin: EdgeInsets.only(top:200.0),
                              child: Center(child:Text("No Data Available"),))
                          // Expanded(child:
                          //     Padding(
                          //       padding: EdgeInsets.only(bottom:20.0),
                          //         child:buildProductList(context, productList))
                          // // LayoutBuilder(builder: (context, constraint) {
                          // //   return Column(
                          // //     children: [
                          // //       Container(
                          // //         // height: constraint.maxHeight - dataPagerHeight,
                          // //         height: 400,
                          // //         child: loadListView(constraint),
                          // //       ),
                          // //       Container(
                          // //         // height: dataPagerHeight,
                          // //         child: SfDataPagerTheme(
                          // //             data: SfDataPagerThemeData(
                          // //               // backgroundColor: Colors.indigo,
                          // //               itemBorderRadius: BorderRadius.circular(5),
                          // //             ),
                          // //             child: SfDataPager(
                          // //                 itemPadding: EdgeInsets.all(10.0),
                          // //                 availableRowsPerPage: [10, 20, 30],
                          // //                 onRowsPerPageChanged: (int? rowsPerPage) {
                          // //                   setState(() {
                          // //                     _rowsPerPage = rowsPerPage!;
                          // //                     // employeeDataSource.updateDataGriDataSource();
                          // //                   });
                          // //                 },
                          // //                 pageItemBuilder: (String itemName) {
                          // //                   if (itemName == 'Next') {
                          // //                     return Container(
                          // //                       decoration: BoxDecoration(
                          // //                         shape: BoxShape.rectangle,
                          // //                         borderRadius:  BorderRadius.circular(5.0),
                          // //                         //color: Color(0xffc32c37),
                          // //                         color: Colors.indigo,
                          // //                         // border: Border.all(color: Colors.black, width: 1)
                          // //                       ),
                          // //                       child: Center(
                          // //                         child: Icon(
                          // //                           CupertinoIcons.arrow_right,
                          // //                           color: Colors.white,
                          // //                           size: 21,
                          // //                         ),
                          // //                       ),
                          // //                     );
                          // //                   }
                          // //                   if (itemName == 'Previous') {
                          // //                     return Container(
                          // //                       decoration: BoxDecoration(
                          // //                         shape: BoxShape.rectangle,
                          // //                         borderRadius:  BorderRadius.circular(5.0),
                          // //                         //color: Color(0xffc32c37),
                          // //                         color: Colors.indigo,
                          // //                         // border: Border.all(color: Colors.black, width: 1)
                          // //                       ),
                          // //                       child: Center(
                          // //                         child: Icon(
                          // //                           CupertinoIcons.arrow_left,
                          // //                           color: Colors.white,
                          // //                           size: 21,
                          // //                         ),
                          // //                       ),
                          // //                     );
                          // //                   }
                          // //                 },
                          // //                 firstPageItemVisible: false,
                          // //                 lastPageItemVisible: false,
                          // //                 visibleItemsCount: 0,
                          // //                 pageCount: double.parse(productList.length.toString()),
                          // //                 onPageNavigationStart: (pageIndex) {
                          // //                   setState(() {
                          // //                     showLoadingIndicator = true;
                          // //                   });
                          // //                 },
                          // //                 onPageNavigationEnd: (pageIndex) {
                          // //                   setState(() {
                          // //                     showLoadingIndicator = false;
                          // //                   });
                          // //                 },
                          // //
                          // //                 delegate:
                          // //                 // CustomSliverChildBuilderDelegate(buildProductList(context,productList))
                          // //                 //   ..addListener(rebuildList))),
                          // //                 CustomSliverChildBuilderDelegate(indexBuilder)
                          // //                   ..addListener(rebuildList)))
                          // //       )
                          // //     ],
                          // //   );
                          // // })
                          // ),
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
                                              allBuyingRequirementList=[];
                                              if(offset==0){
                                                _allBuyingRequirementBloc!.add(OnLoadingManageAllBuyingRequirementList(userid: Application.vendorLogin!.userId.toString()));

                                              }else {
                                                offset -= 10;
                                                _allBuyingRequirementBloc!.add(OnLoadingManageAllBuyingRequirementList(
                                                    userid: Application.vendorLogin!
                                                        .userId.toString()
                                                ));
                                              }
                                            },
                                            child:Container(
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
                                            allBuyingRequirementList=[];
                                            offset+=10;
                                            _allBuyingRequirementBloc!.add(OnLoadingManageAllBuyingRequirementList(userid: Application.vendorLogin!.userId.toString(),));
                                          },
                                          child:Container(
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
            ),
          );
      }
      )

    );
  }
}

Widget searchDot()
{
  return ListTile(
    title:Searchbar() ,
    trailing:Icon(Icons.more_vert) ,
  );
}

Widget info(){
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 500,
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
                leading: nameIcon(),
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Table",
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
                              "Require tables for office use",
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
                          "2022-04-01",
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
                trailing:Container(
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
                            Icons.remove_red_eye_rounded,
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


Widget infoManage(BuildContext context, ManageAllBuyingRequirementModel allBuyingRequirementData){
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
                    allBuyingRequirementData.prodName.toString(),
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
                          allBuyingRequirementData.description.toString(),
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
                      allBuyingRequirementData.catName.toString(),
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
            trailing:Container(
              width: 40,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:  BorderRadius.circular(5.0),
                //color: Color(0xffc32c37),
                color: ThemeColors.buttonColor,
                // border: Border.all(color: Colors.black, width: 1)
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ManageAllBuyingRequirementDetails(allBuyingRequirementData: allBuyingRequirementData)));
                },
                child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
Widget pagenationdetail()
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


