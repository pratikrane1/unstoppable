import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Screens/search_page.dart';
import 'package:unstoppable/Screens/unstoppableProducts.dart';
import 'package:unstoppable/Utils/application.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:unstoppable/widgets/drawer.dart';

import '../../widgets/bell_icon.dart';




class DashBoardCust extends StatefulWidget {
  const DashBoardCust({Key? key}) : super(key: key);

  @override
  _DashBoardCustState createState() => _DashBoardCustState();
}

class _DashBoardCustState extends State<DashBoardCust> {



  void initState() {
    // TODO: implement initState
    super.initState();


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
                Text("Unstoppable Trade", style: TextStyle(color: ThemeColors.whiteTextColor),),
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
                // SizedBox(
                //   width: 130,
                // ),
                // Expanded(
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.search,
                //       size: 30,
                //     ),
                //     onPressed: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => SearchPage()));
                //     },
                //   ),
                // ),
                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body: Scaffold(
          body: Container(child:Text("Welcome to unstoppable",style: TextStyle(fontSize: 16,color:Colors.green),)),

      ),
    );
  }
}
