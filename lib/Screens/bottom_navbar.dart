import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/dashboard.dart';
import 'package:unstoppable/Screens/Products/unstoppableProducts.dart';
import 'package:unstoppable/widgets/drawer.dart';

import 'businessNetworking.dart';
import 'buyingRequirmentForm.dart';
import 'Product Enquiry/customerEnquiries.dart';

class BottomNavigation extends StatefulWidget {
  int index;
   BottomNavigation({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    UnstoppableProducts(),
    BusinessNetworking(),
    BuyingRequirmentSubmit(),
    CustomerEnquiries(),
  ];

  void _onItemTapped(int index) {

      setState(() {
        _selectedIndex = index;
      });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index!=null){
      setState(() {
        _selectedIndex = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      // drawer: DrawerWidget(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
          // MyBottomNavigation(_onItemTapped, _selectedIndex)
          SizedBox(
            height: 70,
            child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Color(0xff389B4B),
                icon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xff389B4B),
                icon: Icon(Icons.business),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xff389B4B),
                icon: Icon(Icons.school),
                label: 'Networking',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xff389B4B),
                icon: Icon(Icons.business),
                label: 'Buying Req',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xff389B4B),
                icon: Icon(Icons.school),
                label: 'Enquires',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,

            backgroundColor: Colors.red,
            onTap: _onItemTapped,
            elevation: 20,
        ),
      ),
          ),
    );
  }
}
