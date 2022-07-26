class Images {
  static const String splash = "assets/splash.png";

  static const String logo = "assets/images/orderly_logo.png";
  static const String fb = "assets/images/fb.png";
  static const String google = "assets/images/google.png";
  static const String phone = "assets/images/phone.png";
  static const String bg = "assets/images/bg.png";
  static const String manager = "assets/images/manager.png";
  static const String managerActive = "assets/images/manager-active.png";
  static const String customer = "assets/images/customer.png";
  static const String customerActive = "assets/images/customer-active.png";
  static const String camera = "assets/images/camera.png";
  static const String gallery = "assets/images/gallery.png";
  static const String cameraBlue = "assets/images/camera_blue.png";
  static const String home = "assets/images/home.png";
  static const String homeActive = "assets/images/home-active.png";
  static const String producer = "assets/images/producer.png";
  static const String producerActive = "assets/images/producer-active.png";
  static const String order = "assets/images/order.png";
  static const String orderActive = "assets/images/order-active.png";
  static const String profile = "assets/images/profile.png";
  static const String profileActive = "assets/images/profile-active.png";
  static const String search = "assets/images/search.png";
  static const String notiIcon = "assets/images/notification.png";
  static const String cart = "assets/images/cart.png";
  static const String arrow = "assets/images/arrow.png";
  static const String truckFull = "assets/images/truck-full.png";
  static const String minus = "assets/images/minus.png";
  static const String plus = "assets/images/plus.png";
  static const String delete = "assets/images/delete.png";
  static const String filter = "assets/images/filter.png";
  static const String profile_pic='assets/images/profile-male.png';
  static const String calender='assets/images/calender.png';
  static const String razorpay='assets/images/razor.png';
  static const String stripe='assets/images/stripe.png';
  static const String edit='assets/images/edit.png';
  static const String inventory='assets/images/inventory.png';
  static const String inventoryActive='assets/images/inventory-active.png';
  static const String claim='assets/images/claim.png';
  static const String claimActive='assets/images/claim-active.png';
  static const String addItem='assets/images/add-item.png';
  static const String map='assets/images/map.png';
  static const String mapNew='assets/images/map_new.png';
  static const String temp='assets/images/temp.png';


  ///Singleton factory
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  Images._internal();
}
