import 'package:flutter/material.dart';

import 'package:tutorial_api_git/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Repositórios",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var repositories = snapshot.data;
            return ListView.separated(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                var repository = repositories[index];
                return ListTile(
                  dense: true,
                  title: Text(
                    repository!.name.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    repository!.description.toString(),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 48,
                    backgroundImage:
                        NetworkImage(repository?.owner['avatar_url']),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: ApiService.getRepositories(),
      ),
    );
  }
}
