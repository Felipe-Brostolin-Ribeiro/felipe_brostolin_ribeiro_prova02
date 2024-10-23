import 'package:flutter/material.dart';
import 'package:worldskills/features/login/login_page.dart';

import '../../core/local_storage/store.dart';

class DisciplinaPage extends StatefulWidget {
  const DisciplinaPage({super.key});

  @override
  State<DisciplinaPage> createState() => _DisciplinaPageState();
}

class _DisciplinaPageState extends State<DisciplinaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Image.asset("assets/Logo.png"),
            ElevatedButton(
              onPressed: () {
                final Store store = Store();
                store.clear();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.logout),
                  Text("Log out"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
