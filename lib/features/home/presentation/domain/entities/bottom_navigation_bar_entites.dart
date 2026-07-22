class BottomNavigationBarEntites {
  final String activeImage;
  final String inActiveImage;
  final String name;

  BottomNavigationBarEntites({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}
   List<BottomNavigationBarEntites> get bottomNavigationBarItems => [
    BottomNavigationBarEntites(
      activeImage: 'assets/images/home.svg',
      inActiveImage: 'assets/images/ihome.svg',
      name: 'الرئيسية',
    ),

    BottomNavigationBarEntites(
      activeImage: 'assets/images/product.svg',
      inActiveImage: 'assets/images/iproduct.svg',
      name: 'المنتجات',
    ),
    BottomNavigationBarEntites(
      activeImage: 'assets/images/icart (3).svg',
      inActiveImage: 'assets/images/iicart (1).svg',
      name: 'سلة التسوق',
    ),
    BottomNavigationBarEntites(
      activeImage: 'assets/images/user.svg',
      inActiveImage: 'assets/images/iuser.svg',
      name: 'حسابي',
    ),
  ];

