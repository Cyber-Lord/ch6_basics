import 'package:flutter/material.dart';

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({required this.title, required this.icon});

  List<TodoMenuItem> foodList = [
    TodoMenuItem(title: "Fast Food", icon: Icon(Icons.fastfood_rounded)),
    TodoMenuItem(title: "Remind Me", icon: Icon(Icons.alarm_add)),
    TodoMenuItem(title: "Flight", icon: Icon(Icons.flight)),
    TodoMenuItem(title: "Music", icon: Icon(Icons.audiotrack)),
  ];
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (() {}),
          )
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text("Bottom"),
            ),
          ),
          preferredSize: Size.fromHeight(75.0),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                  onPressed: (() {}),
                  icon: Icon(Icons.flight),
                  iconSize: 30,
                  color: Colors.green.shade500,
                ),
                const ContainerWithBoxDecorationWidget(),
                Divider(),
                const ColumnWidget(),
                Divider(),
                const RowWidget(),
                Divider(),
                const ColumnAndRowWidgetNesting(),
                Image(
                  image: AssetImage("lib/assets/images/ratio.jpg"),
                  fit: BoxFit.cover,
                )
                //   Image.network(
                //       "https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/TunnelBear_screenshot.png/220px-TunnelBear_screenshot.png")
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.play_arrow),
            Icon(Icons.pause),
            Icon(Icons.delete_forever),
            Padding(padding: EdgeInsets.all(32.0))
          ],
        ),
      ),
    );
  }
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({Key, key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.lightGreen.shade500]),
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  color: Colors.grey,
                ),
              ]),
          child: Center(
            child: Text(
              "Container",
              style: TextStyle(
                color: Colors.purpleAccent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepPurple,
                decorationStyle: TextDecorationStyle.dotted,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Column 1"),
        Divider(),
        Text("Column 2"),
        Divider(),
        Text("Column 3"),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({Key, key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Row 1"),
        Padding(padding: EdgeInsets.all(16.0)),
        Text("Row 2"),
        Padding(padding: EdgeInsets.all(16.0)),
        Text("Row 3")
      ],
    );
  }
}

class ColumnAndRowWidgetNesting extends StatelessWidget {
  const ColumnAndRowWidgetNesting({Key, key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Column and Row Nesting 1"),
        Text("Column and Row Nesting 2"),
        Text("Column and Row Nesting 3"),
        Padding(padding: EdgeInsets.all(16.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Row Nesting 1"),
            Text("Row Nesting 2"),
            Text("Row Nesting 3"),
          ],
        ),
      ],
    );
  }
}

// class PopupMenuButtonWidget extends StatelessWidget
//     implements PreferredSizeWidget {
//   const PopupMenuButtonWidget({Key, key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.lightGreen.shade100,
//       height: preferredSize.height,
//       width: double.infinity,
//       child: Center(
//         child: PopupMenuButton<TodoMenuItem>(
//           icon: Icon(Icons.view_list),
//           onSelected: ((valueSelected) {
//             print("Value Selected : ${valueSelected.title}");
//           }),
//           itemBuilder: (BuildContext context) {
//             return foodList.map((TodoMenuItem todoMenuItem) {
//               return PopupMenuItem<TodoMenuItem>(
//                 value: todoMenuItem,
//                 child: Row(
//                   children: [
//                     Icon(todoMenuItem.icon.icon),
//                     Padding(padding: EdgeInsets.all(16.0)),
//                     Text(todoMenuItem.title)
//                   ],
//                 ),
//               );
//             }).toList();
//           },
//         ),
//       ),
//     );
//   }
// }
