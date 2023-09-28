
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/widgets/size_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../View_model/auth_admin.dart';
import '../../core/utils/size_utils.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  late AuthAdminViewModel _authViewModel;




   Widget build(BuildContext context) {
    _authViewModel = context.watch<AuthAdminViewModel>();

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0.r), // Adjust the radius as needed
          // bottomRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(

            decoration: BoxDecoration(
              color: AppColors.deepRed,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColors.deepRed),
              accountName:
              Text(
                "Hello,",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail:FutureBuilder<String>(
                future: getUserEmail(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...'); // Placeholder while loading
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(snapshot.data ?? '',
                    style: TextStyle(
                      color: AppColors.white,
                    ),); // Display the email
                  }
                },
              ),
              // currentAccountPictureSize: Size.square(50),
              // currentAccountPicture: CircleAvatar(
              //   backgroundColor: Color.fromARGB(255, 165, 255, 137),
              //   child: Text(
              //     "A",
              //     style: TextStyle(fontSize: 30.0, color: Colors.blue),
              //   ), //Text
              // ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          // Padding(
          //   padding: getPadding(left: 50.Sw, top: 10.Sh),
          //   child: ListTile(
          //     leading: const Icon(Icons.person),
          //     title: const Text(' My Profile '),
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: getPadding(left: 20.Sw, right: 20.Sh, top: 10.Sh),
          //   // EdgeInsets.symmetric(horizontal: 40.0.Sw,vertical: 25.Sh),
          //   child: const Divider(
          //     thickness: 2,
          //     color: Color.fromARGB(255, 204, 204, 204),
          //   ),
          // ),
          Padding(
            padding: getPadding(left: 50.Sw, top: 10.Sh),
            child: ListTile(
              leading:  Icon(Icons.logout,
              color: AppColors.black,
              ),
              title: const Text('LogOut'),
              onTap: () {
                _authViewModel.signOut();
              },
            ),
          ),
          Padding(
            padding: getPadding(left: 20.Sw, right: 20.Sw, top: 10.Sh),
            // EdgeInsets.symmetric(horizontal: 40.0.Sw,vertical: 25.Sh),
            child: const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),

        ],
      ),
    ); //Drawer
  }
}
Future<String> getUserEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email') ?? '';
}
