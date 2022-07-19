import 'package:flutter/material.dart';

import '../screens/order_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black54,
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                ),
                Text(
                  'Hello Friend!',
                  style: TextStyle(
                    color: Colors.black54
                  ),
                )
              ],
            ), 
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.shop,
              color: Colors.white,
            ), 
            title: const Text(
              'Shop', 
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.white,
            ), 
            title: const Text(
              'Orders',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Colors.white,
            ), 
            title: const Text(
              'Manage Product',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
          
        ],
      ),
    );
  }
}