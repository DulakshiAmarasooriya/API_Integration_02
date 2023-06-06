class UserName{
  final String title;
  final String first;
  final String last;

  UserName(
    {
      required this.title,
      required this.first,
      required this.last,
    }
  );
factory UserName.fromMap(Map<String,dynamic>json){
  return UserName(
      title: json['name']['title'],
      first: json['name']['first'],
      last: json['name']['last'],
    );
}
}