import 'package:flutter/material.dart';
import 'package:m_app_event/account/edit_profile.dart';
import 'package:m_app_event/login.dart';

class NavBar_admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Govermnet user'),
            accountEmail: Text('govuser123@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child:
                      Icon(Icons.supervised_user_circle_sharp) // Image.network(
                  //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  //   fit: BoxFit.cover,
                  //   width: 90,
                  //   height: 90,
                  // ),
                  ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: NetworkImage(
              //         'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
              //         ),
            ),
          ),

          Divider(),
          ListTile(
            title: Text('Edit Profile'),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.currency_rupee),
          //   title: Text('Reward'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => RewardPage(
          //                 rewardAmount: 2000,
          //               )),
          //     );
          //   },
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Switch Account'),
            leading: Icon(Icons.swipe_vertical_sharp),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Mpp()),
              );
            },
          ),
        ],
      ),
    );
  }
}
