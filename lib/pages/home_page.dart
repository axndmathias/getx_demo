import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/globlal_controller.dart';
import 'package:getx_demo/controller/home_controller.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        //id: 'text',
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                  id: 'favorites',
                  builder: (_) => FlatButton(
                    onPressed: null,
                    child: Text("Favoritos (${_.favorites.length})"),
                  ),
                ),
              ],
            ),
            //body: HomeList(),
            body: ProductList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _.incremtar();
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

class HomeList extends StatelessWidget {
  const HomeList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loading) {
          return Center(
            child: LinearProgressIndicator(),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final User user = _.users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
              onTap: () => _.showUserProfile(user),
            );
          },
          itemCount: _.users.length,
        );
      },
    );
  }
}

class HomeLabel extends StatelessWidget {
  const HomeLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text',
      builder: (_) => Text(
        _.contador.toString(),
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       init: HomeController(),
//       builder: (_) => Scaffold(
//         body: Center(
//           child: Text(_.contador.toString()),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _.incrementar();
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
