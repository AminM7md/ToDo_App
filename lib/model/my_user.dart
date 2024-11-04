class MyUser {
  static const String collectionName = "users";
  String? id;    // make nullable because iam not sure that data will return
  String? name;
  String? email;

  MyUser({required this.id, required this.name, required this.email});


  ///json => object
  MyUser.fromFireStore(Map<String, dynamic>? data):this(
    id: data!["id"] as String,
    name: data!["name"] as String,
    email: data!["email"] as String,
  );

  ///object => json
  Map<String, dynamic> toFireStore(){
    return{
      "id" : id,
      "name" : name,
      "email" : email,
    };
  }
}