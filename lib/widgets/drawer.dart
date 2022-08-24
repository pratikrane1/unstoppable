import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unstoppable/Screens/Leads.dart';
import 'package:unstoppable/Screens/change_password.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';
import 'package:unstoppable/Screens/manageAllBuyingRequirement.dart';
import 'package:unstoppable/Screens/reward.dart';
import 'package:unstoppable/Screens/unstoppableOrders.dart';
import 'package:unstoppable/Screens/unstoppable_orders.dart';
import 'package:unstoppable/Utils/application.dart';
import 'package:unstoppable/constant/font_size.dart';

import '../Blocs/companyProfile/comapny_profile_state.dart';
import '../Blocs/companyProfile/company_profile_block.dart';
import '../Blocs/companyProfile/company_profile_event.dart';
import '../Blocs/login/login_bloc.dart';
import '../Blocs/login/login_event.dart';
import '../Blocs/login/login_state.dart';
import '../Models/company_profile_model.dart';
import '../Screens/bottom_navbar.dart';
import '../Screens/businessNetworking.dart';
import '../Screens/business_networking_lead.dart';
import '../Screens/company_profile.dart';
import '../Screens/payment_history.dart';
import '../Screens/product_I_am_buying.dart';
import '../constant/theme_colors.dart';
import 'app_button.dart';

class DrawerWidget extends StatefulWidget {

  DrawerWidget({Key? key}):super(key:key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}
class _DrawerWidgetState extends State<DrawerWidget>{


  CompanyProfileBloc? _companyProbileBloc;
  List<CompanyProfileModel>? companyData;



  @override
  void initState() {
    super.initState();
    _companyProbileBloc = BlocProvider.of<CompanyProfileBloc>(context);
    _companyProbileBloc!.add(OnLoadingCompanyProfileList(userid: Application.vendorLogin!.userId.toString()));
    // _companyProbileBloc!.add(OnLoadingCompanyProfileList(userid: "874"));
    // final _nameController = TextEditingController(text: companyData![0].name.toString());
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
              // Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Profile'),
        ),
        body:
        BlocBuilder<CompanyProfileBloc, CompanyProfileState>(builder: (context, state) {
          if (state is CompanyProfileSuccess) {
            companyData = state.companyProfileData;
            // setData(companyData!);
          }

          if(state is CompanyProfileListLoadFail){
            companyData=[];
            // setData(companyData!);
          }

          return companyData!=null
            ?
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(Images.bg),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child:
              ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  // SizedBox(
                  //   height: 50,
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: ThemeColors.baseThemeColor,
                  //   child: Row(
                  //     children: [
                  //       SizedBox(width: 20,),
                  //       InkWell(
                  //         onTap: (){
                  //           // Navigator.popAndPushNamed(context, MaterialPageRoute(builder: (context) => BottomNavigation()))
                  //           Navigator.of(context).pop();
                  //         },
                  //         child: Icon(Icons.arrow_back_ios,color: ThemeColors.whiteTextColor,),
                  //
                  //       ),
                  //       SizedBox(
                  //         width: 20,
                  //       ),
                  //       Text("More", style: TextStyle(fontSize: FontSize.large, color: ThemeColors.whiteTextColor),)
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.orange,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  _Rewards(context),
                  _BussinessOpp(context),
                  _MyTools(context),
                  _Settings(context, companyData![0]),
                  _ShareUrl(context),
                  _LogOutButton(context)
                ],
              ),
            )
              :
              Center(child: CircularProgressIndicator());
        }
        )

      ),
    );
  }
}


Widget _Rewards(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Rewards()));
    },
    child: Card(
      elevation: 1,
      margin: EdgeInsets.all(10),
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.card_giftcard,
              color: ThemeColors.drawerTextColor,
            ),
            title: const Text(
              'Rewards',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          )
        ],
      ),
    ),
  );
}


_RemoverUser() async {
  SharedPreferences userData = await SharedPreferences.getInstance();
  await userData.clear();
}

Widget _LogOutButton(BuildContext context) {
  LoginBloc? _loginBloc;
  return  Container(color: Colors.white,
          child:Padding(
              padding: EdgeInsets.all(20.0),
              child:

              //updated on 14/01/2022
              AppButton(
                onPressed: (){
                  Application.preferences!.remove('user');
                  // _RemoverUser();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                        (Route<dynamic> route) => false,
                  );
                },
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                text: 'Logout',
                // loading: profile is LogoutLoading,
                // disableTouchWhenLoading: true,
              )
          )
      );
    // )

  //   InkWell(
  //
  //   onTap: () {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => SignInPage()));
  //   },
  //   child: AppButton(
  //     text: "Log Out",
  //   ),
  // );
}



Widget _BussinessOpp(BuildContext context) {
  return Card(
    elevation: 1,
    margin: EdgeInsets.all(10),
    color: Colors.white,
    shadowColor: Colors.blueGrey,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    child: ExpansionTile(
      leading: Icon(
        CupertinoIcons.pencil_ellipsis_rectangle,
        color: ThemeColors.drawerTextColor,
      ),
      title: Text(
        'Business Opportunity',
        style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
      ),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 0.1,
          ))),
          child: ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Leads()));
            },
            title: const Text(
              'Leads',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border(
        //           bottom: BorderSide(
        //     width: 0.1,
        //   ))),
        //   child: ListTile(
        //     onTap: () {
        //       Navigator.pushReplacement(context,
        //           MaterialPageRoute(builder: (context) => BusinessNetworking()));
        //     },
        //     title: const Text(
        //       'Business Networking',
        //       style:
        //           TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
        //     ),
        //   ),
        // ),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BusinessNetworking()));
          },
          title: const Text(
            'Business Networking',
            style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BusinessNetworkingLead()));
          },
          title: const Text(
            'Your BNC',
            style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Widget _MyTools(BuildContext context) {
  return Card(
    elevation: 1,
    margin: EdgeInsets.all(10),
    color: Colors.white,
    shadowColor: Colors.blueGrey,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    child: ExpansionTile(
      leading: Icon(
        Icons.shopping_bag_sharp,
        color: ThemeColors.drawerTextColor,
      ),
      title: Text(
        'My Tools',
        style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
      ),
      children: <Widget>[
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border(
        //           bottom: BorderSide(
        //     width: 0.1,
        //   ))),
        //   child: ListTile(
        //     onTap: () {},
        //     title: const Text(
        //       'Buying Requirement Forms',
        //       style:
        //           TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
        //     ),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 0.1,
          ))),
          child: ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ManageAllBuyingRequirement()));
            },
            title: const Text(
              'Manage All Buying Requirements',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 0.1,
          ))),
          child: ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProductIamBuying()));

            },
            title: const Text(
              'Product I am Buying',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => UnstoppableOrders()));
          },
          title: const Text('My Unstoppable Orders',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16)),
        ),
      ],
    ),
  );
}

Widget _Settings(BuildContext context, CompanyProfileModel companyData) {
  return Card(
    elevation: 1,
    margin: EdgeInsets.all(10),
    color: Colors.white,
    shadowColor: Colors.blueGrey,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    child: ExpansionTile(
      leading: Icon(
        Icons.settings,
        color: ThemeColors.drawerTextColor,
      ),
      title: Text(
        'Settings',
        style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
      ),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 0.1,
          ))),
          child: ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EditPasswordPage()));
            },
            title: const Text(
              'Change Password',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PaymentHistory()));
          },
          title: const Text(
            'Payment History',
            style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CompanyProfileEditPage(companyData: companyData,)));
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => CompanyProfileUpdate()));
          },
          title: const Text(
            'Company Profile',
            style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Widget _ShareUrl(BuildContext context) {
  return InkWell(
    child: Card(
      elevation: 1,
      margin: EdgeInsets.all(10),
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.share,
              color: ThemeColors.drawerTextColor,
            ),
            title: const Text(
              'Share Referal Code URL',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
            onTap: () {},
          )
        ],
      ),
    ),
  );
}
