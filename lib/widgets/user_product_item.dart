import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  // ignore: use_key_in_widget_constructors
  const UserProductItem(this.title, this.imageUrl);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.edit),
                  color: Theme.of(context).primaryColor,
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}