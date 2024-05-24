class UserDetailsModel {
    int? id;
    String? username;
    String? email;
    String? firstName;
    String? lastName;
    String? gender;
    String? image;
    String? token;

    UserDetailsModel({
        this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.gender,
        this.image,
        this.token,
    });

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
     return UserDetailsModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
    };
}
