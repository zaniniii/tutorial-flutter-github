import 'package:flutter/material.dart';

import 'package:ninelabs_repositories/api_service.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositórios'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: ApiService.getRepositories(),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(repository!.description.toString()),
                leading: CircleAvatar(
                  radius: 48.0,
                  backgroundImage: NetworkImage(repository?.avatar),
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
    );
  }
}
