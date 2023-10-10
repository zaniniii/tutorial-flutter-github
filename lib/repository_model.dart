class RepositoryModel {
  String? name, user, description;
  Map<String, dynamic>? owner;

  RepositoryModel({
    this.name,
    this.owner,
    this.description,
    this.user,
  });

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    user = json['user'];
    owner = json['owner'];
    description = json['description'];
  }
}
