import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unstoppable/Screens/Leads.dart';
import 'package:unstoppable/Screens/Payment%20History/payment_history_updated/payment_history_updated.dart';
import 'package:unstoppable/Screens/change_password.dart';
import 'package:unstoppable/Screens/dashboard.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';
import 'package:unstoppable/Screens/manageAllBuyingRequirement.dart';
import 'package:unstoppable/Screens/profile_screen.dart';
import 'package:unstoppable/Screens/reward.dart';
import 'package:unstoppable/Screens/unstoppableOrders.dart';
import 'package:unstoppable/Screens/unstoppable_orders.dart';
import 'package:unstoppable/Utils/application.dart';
import '../Blocs/User Profile/User_profile_api.dart';
import '../Blocs/companyProfile/comapny_profile_state.dart';
import '../Blocs/companyProfile/company_profile_block.dart';
import '../Blocs/companyProfile/company_profile_event.dart';
import '../Blocs/login/login_bloc.dart';
import '../Models/company_profile_model.dart';
import '../Models/user_profile_model.dart';
import '../Screens/CSR/csr_screen.dart';
import '../Screens/bottom_navbar.dart';
import '../Screens/businessNetworking.dart';
import '../Screens/YourBNC/business_networking_lead.dart';
import '../Screens/company_profile.dart';
import '../Screens/product_I_am_buying.dart';
import '../constant/theme_colors.dart';
import 'app_button.dart';
import 'package:flutter_share/flutter_share.dart';


class DrawerWidget extends StatefulWidget {

  DrawerWidget({Key? key}):super(key:key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}
class _DrawerWidgetState extends State<DrawerWidget>{


  CompanyProfileBloc? _companyProbileBloc;
  List<CompanyProfileModel>? companyData;
  List<UserProfileModel>? userProfileData;

  late Future<UserProfileModel> profileData;


  @override
  void initState() {
    super.initState();
    _companyProbileBloc = BlocProvider.of<CompanyProfileBloc>(context);
    // _companyProbileBloc!.add(OnLoadingUserProfile(userid: Application.vendorLogin!.userId.toString()));
    _companyProbileBloc!.add(OnLoadingCompanyProfileList(userid: Application.vendorLogin!.userId.toString()));

    profileData = getUserProfile();

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
                  MaterialPageRoute(builder: (context) => BottomNavigation(index: 0,)));
              // Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Unstoppable Trade'),
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

          //
          // if(state is UserProfileLoadFail){
          //   userProfileData=[];
          //   // setData(companyData!);
          // }

          return (companyData!=null)
            ?
              FutureBuilder<UserProfileModel>(
                  future: profileData,
                  builder: (context, snapshot){
                    if(snapshot.hasData){

                    }
                    else if (snapshot.hasError){
                      Fluttertoast.showToast(msg: "${snapshot.error}");
                      return Text("${snapshot.error}");
                    }
                    return Container(
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(Images.bg),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  child:
                  (snapshot.hasData)
                      ?
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
                        height: 0,
                      ),

                      SizedBox(
                          height: 200,
                          width: 300,
                          child: Center(
                            child: Image.asset('assets/images/Logo.png'),
                            // Text(
                            //   "Unstoppable",
                            //   style: TextStyle(fontSize: FontSize.xxLarge),
                            // ),
                          )),

                      // CircleAvatar(
                      //   radius: 70,
                      //   backgroundColor: Colors.orange,
                      //   child: Text(
                      //     "A",
                      //     style: TextStyle(fontSize: 40),
                      //   ),
                      // ),

                      SizedBox(
                        height: 0,
                      ),
                      _Home(context),
                      _Rewards(context),
                      _BussinessOpp(context),
                      _MyTools(context),
                      _Settings(context, companyData![0], snapshot.data!),
                      _CSR(context),
                      _ShareUrl(context),
                      _LogOutButton(context)
                    ],
                  )
                      :
                      Center(
                        child: CircularProgressIndicator(),
                      )
                );
              })

              :
              Center(child: CircularProgressIndicator());
        }
        )

      ),
    );
  }
}


Widget _Home(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavigation(index: 0,)));
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
              Icons.home,
              color: ThemeColors.drawerTextColor,
            ),
            title: const Text(
              'Home',
              style:
              TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          )
        ],
      ),
    ),
  );
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
                MaterialPageRoute(builder: (context) => BottomNavigation(index: 2,)));
          },
          title: const Text(
            'Business Networking',
            style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
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

Widget _Settings(BuildContext context, CompanyProfileModel companyData, UserProfileModel data) {
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
                  MaterialPageRoute(builder: (context) => ProfileScreen(profileData: data)));
            },
            title: const Text(
              'My Profile',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
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
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PaymentHistoryUpdated()));
          },
          title: const Text(
            'Payment History',
            style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
        ListTile(
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

      ],
    ),
  );
}
Future<void> shareReferralCode() async {
  await FlutterShare.share(
      title: 'Example share',
      text: 'Referral code: 205678',
      // linkUrl: 'https://flutter.dev/',
      // chooserTitle: 'Example Chooser Title'
  );
}

Widget _ShareUrl(BuildContext context) {
  return InkWell(
    onTap:(){

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
              Icons.share,
              color: ThemeColors.drawerTextColor,
            ),
            title: const Text(
              'Share Referal Code URL',
              style:
                  TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
            onTap: () {
              shareReferralCode();
            },
          )
        ],
      ),
    ),
  );
}


Widget _CSR(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CSRScreen()));
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
              Icons.apps_sharp,
              color: ThemeColors.drawerTextColor,
            ),
            title: const Text(
              'CSR',
              style:
              TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
            ),
          )
        ],
      ),
    ),
  );
}
