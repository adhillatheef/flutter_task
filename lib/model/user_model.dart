import 'package:hive/hive.dart';
part 'user_model.g.dart';


@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String gender;

  @HiveField(1)
  final Name name;

  @HiveField(2)
  final Location location;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final Login login;

  @HiveField(5)
  final Dob dob;

  @HiveField(6)
  final Registered registered;

  @HiveField(7)
  final String phone;

  @HiveField(8)
  final String cell;

  @HiveField(9)
  final Id id;

  @HiveField(10)
  final Picture picture;

  @HiveField(11)
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'] as String? ?? '',
      name: json['name'] != null ? Name.fromJson(json['name']) : Name.empty(),
      location: json['location'] != null ? Location.fromJson(json['location']) : Location.empty(),
      email: json['email'] as String? ?? '',
      login: json['login'] != null ? Login.fromJson(json['login']) : Login.empty(),
      dob: json['dob'] != null ? Dob.fromJson(json['dob']) : Dob.empty(),
      registered: json['registered'] != null ? Registered.fromJson(json['registered']) : Registered.empty(),
      phone: json['phone'] as String? ?? '',
      cell: json['cell'] as String? ?? '',
      id: json['id'] != null ? Id.fromJson(json['id']) : Id.empty(),
      picture: json['picture'] != null ? Picture.fromJson(json['picture']) : Picture.empty(),
      nat: json['nat'] as String? ?? '',
    );
  }

}

@HiveType(typeId: 1)
class Name {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String first;

  @HiveField(2)
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'] as String? ?? '',
      first: json['first'] as String? ?? '',
      last: json['last'] as String? ?? '',
    );
  }

  factory Name.empty() {
    return Name(
      title: '',
      first: '',
      last: '',
    );
  }
}

@HiveType(typeId: 2)
class Location {
  @HiveField(0)
  final Street street;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String state;

  @HiveField(3)
  final String country;

  @HiveField(4)
  final String postcode;

  @HiveField(5)
  final Coordinates coordinates;

  @HiveField(6)
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json['street'] != null ? Street.fromJson(json['street']) : Street.empty(),
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      country: json['country'] as String? ?? '',
      postcode: json['postcode']?.toString() ?? '',
      coordinates: json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : Coordinates.empty(),
      timezone: json['timezone'] != null ? Timezone.fromJson(json['timezone']) : Timezone.empty(),
    );
  }

  factory Location.empty() {
    return Location(
      street: Street.empty(),
      city: '',
      state: '',
      country: '',
      postcode: '',
      coordinates: Coordinates.empty(),
      timezone: Timezone.empty(),
    );
  }
}

@HiveType(typeId: 3)
class Street {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  factory Street.empty() {
    return Street(number: 0, name: ''); // You can set default values as per your requirements
  }

}

@HiveType(typeId: 4)
class Coordinates {
  @HiveField(0)
  final String latitude;

  @HiveField(1)
  final String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }

  factory Coordinates.empty() {
    return Coordinates(latitude: '', longitude: ''); // Default empty coordinates
  }
}

@HiveType(typeId: 5)
class Timezone {
  @HiveField(0)
  final String offset;

  @HiveField(1)
  final String description;

  Timezone({
    required this.offset,
    required this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'] ?? '',
      description: json['description'] ?? '',
    );
  }

  factory Timezone.empty(){
    return Timezone(offset: '', description: '');
  }
}

@HiveType(typeId: 6)
class Login {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String salt;

  @HiveField(4)
  final String md5;

  @HiveField(5)
  final String sha1;

  @HiveField(6)
  final String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json['uuid'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      salt: json['salt'] ?? '',
      md5: json['md5'] ?? '',
      sha1: json['sha1'] ?? '',
      sha256: json['sha256'] ?? '',
    );
  }

  factory Login.empty(){
    return Login(uuid: '',
        username: '',
        password: '',
        salt: '',
        md5: '',
        sha1: '',
        sha256: '');
  }
}

@HiveType(typeId: 7)
class Dob {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: json['date'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  factory Dob.empty(){
    return Dob(date: '', age: 0);
  }
}

@HiveType(typeId: 8)
class Registered {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final int age;

  Registered({
    required this.date,
    required this.age,
  });

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(
      date: json['date'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  factory Registered.empty(){
    return Registered(date: '', age: 0);
  }
}

@HiveType(typeId: 9)
class Id {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String value;

  Id({
    required this.name,
    required this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'] ?? '',
      value: json['value'] ?? '',
    );
  }

  factory Id.empty(){
    return Id(name: '', value: '');
  }
}

@HiveType(typeId: 10)
class Picture {
  @HiveField(0)
  final String large;

  @HiveField(1)
  final String medium;

  @HiveField(2)
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'] ?? '',
      medium: json['medium'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  factory Picture.empty(){
    return Picture(large: '', medium: '', thumbnail: '');
  }
}

class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      seed: json['seed'],
      results: json['results'],
      page: json['page'],
      version: json['version'],
    );
  }
}

class ApiResponse {
  final List<User> results;
  final Info info;

  ApiResponse({
    required this.results,
    required this.info,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var resultsJson = json['results'] as List;
    List<User> resultsList = resultsJson.map((i) => User.fromJson(i)).toList();

    return ApiResponse(
      results: resultsList,
      info: Info.fromJson(json['info']),
    );
  }
}
