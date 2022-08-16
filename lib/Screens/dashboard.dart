import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Screens/search_page.dart';
import 'package:unstoppable/Utils/application.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:unstoppable/widgets/drawer.dart';

import '../widgets/bell_icon.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //final FirebaseAuth auth = FirebaseAuth.instance;
  String dropdownValue = 'My Acc';
  HomeBloc? _userHomeBloc;
  String totalProd="";
  int? totalInquiries,
      totalLeads,cancelledLeads,monthlyTarget,achievements;


  void initState() {
    // TODO: implement initState
    super.initState();
    _userHomeBloc = BlocProvider.of<HomeBloc>(context);
    _userHomeBloc!.add(OnLoadingHomeList(userid: Application.vendorLogin!.userId.toString()));

  }
  @override
  Widget build(BuildContext context) {
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
                Text("My Acc", style: TextStyle(color: ThemeColors.whiteTextColor),),
                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(
                //     Icons.keyboard_arrow_down_sharp,
                //     color: Colors.white,
                //     size: 30,
                //   ),
                //   elevation: 16,
                //   style: const TextStyle(
                //       color: ThemeColors.whiteTextColor,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                //   // underline: Container(
                //   //   height: 2,
                //   //   color: Colors.deepPurpleAccent,
                //   // ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //   },
                //   items: <String>['My Acc', 'Two', 'Free', 'Four']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value, style: TextStyle(color: ThemeColors.scaffoldBgColor),
                //       ),
                //     );
                //   }).toList(),
                // ),
                SizedBox(
                  width: 130,
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                  ),
                ),
                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body: Scaffold(
          body: BlocBuilder<HomeBloc,HomeState>(builder:(context,dashboard){
            return BlocListener<HomeBloc,HomeState>(listener: (context,state){
              if(state is HomeListSuccess){
                totalProd=state.totalProd;
                totalLeads=state.totalLeads;
                totalInquiries=state.totalEnquiry;
                monthlyTarget=state.monthlyTarget;
                achievements=state.achievements;
                cancelledLeads=state.cancelLeads;
              }
            },
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(15),
                childAspectRatio: 0.7,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Text(
                                totalProd.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Total Products',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff228B22),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Text(
                                totalInquiries.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Total Enquiries',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> EditPasswordPage()));

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff0d62a6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children:  [
                              Text(
                                totalLeads.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Total Leads',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PaymentHistory()));

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff0d62a6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children:  [
                              Text(
                                cancelledLeads.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Cancelled Leads',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ManageAllBuyingRequirementDetails()));
                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xffc77716),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children:  [
                              Text(
                                monthlyTarget.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Monthly Target',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CompanyProfileEditPage()));

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff2f7e32),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children:  [
                              Text(
                                achievements.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Achievements',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                            onTap: (){
                              // AddProduct(context);
                            },
                            child: Container(
                              height: 60,
                              margin: const EdgeInsets.only(left: 0, top: 0),
                              decoration: BoxDecoration(
                                color: const Color(0xff0d62a6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  <Widget>[
                                  Text(
                                    'More info',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          })

      ),
    );
  }
}
