

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/authentication/authentication_bloc.dart';
import 'package:unstoppable/Blocs/home/home_bloc.dart';
import 'package:unstoppable/Blocs/login/login_bloc.dart';
import 'package:unstoppable/Blocs/theme/theme_bloc.dart';
import 'package:unstoppable/Repository/UserRepository.dart';

import 'Blocs/addProductForm/addProductForm_bloc.dart';
import 'Blocs/companyProfile/company_profile_block.dart';
import 'Blocs/customerEnquiries/customerEnquiries_bloc.dart';
import 'Blocs/leads/leads_block.dart';
import 'Blocs/products/product_bloc.dart';

class AppBloc {
  static final userRepository = UserRepository();
  static final themeBloc = ThemeBloc();

  static final authBloc = AuthBloc(userRepository: userRepository);
  static final loginBloc = LoginBloc(userRepository: userRepository);
  static final homeBloc = HomeBloc(dashboardRepo: userRepository);
  static final productBloc = ProductBloc(productRepo: userRepository);
  static final customerEnquiriesBloc = CustomerEnquiriesBloc(customerEnquiriesModelRepo: userRepository);
  static final productImageBloc = AddProductFormBloc(productImageRepo: userRepository);
  static final leadBloc = LeadsBloc(leadsRepo: userRepository);
  static final companyProfileBloc = CompanyProfileBloc(companyProfileRepo: userRepository);



  static final List<BlocProvider> providers = [
    // BlocProvider<ApplicationBloc>(
    //   create: (context) => applicationBloc,
    // ),
    // BlocProvider<LanguageBloc>(
    //   create: (context) => languageBloc,
    // ),
    BlocProvider<ThemeBloc>(
      create: (context) => themeBloc,
    ),
    BlocProvider<AuthBloc>(
      create: (context) => authBloc,
    ),
    BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
    ),
    BlocProvider<HomeBloc>(
      create: (context) => homeBloc,
    ),
    BlocProvider<ProductBloc>(
      create: (context) => productBloc,
    ),
    BlocProvider<CustomerEnquiriesBloc>(
      create: (context) => customerEnquiriesBloc,
    ),

    BlocProvider<AddProductFormBloc>(
      create: (context) => productImageBloc,
    ),
    BlocProvider<LeadsBloc>(
      create: (context) => leadBloc,
    ),
    BlocProvider<CompanyProfileBloc>(
      create: (context) => companyProfileBloc,
    ),

  ];

  static void dispose() {
    // applicationBloc.close();
    // languageBloc.close();
    // themeBloc.close();
    authBloc.close();
    loginBloc.close();
    homeBloc.close();
    productBloc.close();
    leadBloc.close();
    customerEnquiriesBloc.close();
    productImageBloc.close();
    companyProfileBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
