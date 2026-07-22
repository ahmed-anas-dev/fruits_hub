import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_state.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/bottom_navigation_bar_entites.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_views.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_views.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/profile_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  late final List<Widget> screens;
  initState() {
    super.initState();
    screens = [HomeViews(), ProductViews(), CartView(), ProfileView()];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("تم اضافة البند الى السلة"),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is CartRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("تم حذف البند من السلة"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: Container(
          width: 375,
          height: 100,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 25,
                offset: Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: bottomNavigationBarItems.asMap().entries.map((e) {
              var index = e.key;
              var item = e.value;
              return Expanded(
                flex: index == selectedIndex ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: BottomItem(
                    isSelected: selectedIndex == index,
                    bottomNavigationBarEntites: item,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class InActive extends StatelessWidget {
  InActive({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

class Active extends StatelessWidget {
  const Active({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 1),

        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37) /* Green1-500 */,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            SizedBox(width: 4),
            Text(
              name,
              style: AppTextStyles.bold13600.copyWith(
                color: const Color(0xFF1B5E37),
              ) /* Green1-500 */,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  BottomItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntites,
  });
  final bool isSelected;
  final BottomNavigationBarEntites bottomNavigationBarEntites;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isSelected
          ? Active(
              image: bottomNavigationBarEntites.activeImage,
              name: bottomNavigationBarEntites.name,
            )
          : InActive(image: bottomNavigationBarEntites.inActiveImage),
    );
  }
}
