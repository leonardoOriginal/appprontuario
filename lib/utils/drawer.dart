import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://media.istockphoto.com/id/1372002650/pt/foto/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.jpg?s=2048x2048&w=is&k=20&c=pu5HClqVZo3LqlDMESL7lfCzqTjWZD_98u5J85Qlszk=',
              ),
            ),
            accountName: const Text(
              "Leonardo Nunes",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "leonunes23@gmail.com",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF00A896)),
            title: const Text("Tela Inicial"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.personal_injury, color: Color(0xFF00A896)),
            title: const Text("Pacientes"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/pacientes");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month,
              color: Color(0xFF00A896),
            ),
            title: const Text("Agenda"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/calendario");
            },
          ),
          Expanded(child: SizedBox()),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF00A896)),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
