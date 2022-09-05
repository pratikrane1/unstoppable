import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/csr/csr_bloc.dart';
import 'package:unstoppable/Blocs/csr/csr_event.dart';
import 'package:unstoppable/Blocs/csr/csr_state.dart';
import 'package:unstoppable/Utils/application.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import '../../Constant/theme_colors.dart';
import '../../Models/csr_model.dart';
import '../../widgets/drawer.dart';


class CSRScreen extends StatefulWidget{
  @override
  State<CSRScreen> createState()=> _CSRScreenState();
}

class _CSRScreenState extends State<CSRScreen>{

  CSRBloc? _csrBloc;
  CSRData? csrData;

  void initState() {
    // TODO: implement initState
    super.initState();

    _csrBloc = BlocProvider.of<CSRBloc>(context);
    _csrBloc!.add(OnLoadingCSR(
        userId: Application.vendorLogin!.userId.toString()));
  }


  _launchWhatsapp(BuildContext context, CSRData data) async {
    var whatsapp = "+91"+data.mobile.toString();
    var message = "Hi Unstoppable Team, I would like to know more about how to grow business. Can you please help me?";

    var whatsappURl_android = "whatsapp://send?phone=" + whatsapp +
        "&text=$message";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DrawerWidget()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Your CSR'),
      ),
      body: BlocBuilder<CSRBloc, CSRState>(builder: (context, state) {
        if (state is CSRSuccess) {
          csrData = state.data;
        }
        if(state is CSRLoading){

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
                    child: csrData!=null
                        ?
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Text("Name:",style:
                              TextStyle(color: ThemeColors.scaffoldBgColor, fontSize: 20),),
                              SizedBox(width: 20,),
                              Text(csrData!.name.toString(),style:
                              TextStyle(color: ThemeColors.scaffoldBgColor, fontSize: 18),),
                            ],
                          ),

                          SizedBox(height: 15,),

                          Row(
                            children: [
                              Text("Contact:",style:
                              TextStyle(color: ThemeColors.scaffoldBgColor, fontSize: 20),),
                              SizedBox(width: 10,),

                              Text(csrData!.mobile.toString(),style:
                              TextStyle(color: ThemeColors.scaffoldBgColor, fontSize: 18),),
                              InkWell(child: Icon(Icons.whatsapp,color: Colors.green,size: 35,),
                              onTap: (){
                                _launchWhatsapp(context, csrData!);
                              },),
                            ],
                          )

                        ],
                      ),
                    )
                        :
                    Center(child: CircularProgressIndicator(),)
                ),
              ),
            ),
          ),
        );
      })

      // SingleChildScrollView(
      //   child: Container(
      //     child: Column(
      //         children: <Widget>[
      //         ]
      //     ),
      //   ),
      // ),
    );
  }
}
