class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimeZoneCoordinate timezone;


  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String,dynamic>json){
    final coordinates = LocationCoordinates(
        latitude:json['coordinates']['latitude'],
        longtitude:json['coordinates']['longtitude']);

    final street = LocationStreet(
        number:json['street']['number'],
        name:json['street']['name']);

    final timezone = LocationTimeZoneCoordinate(
        offset:json['timezone']['offset'],
        description:json['timezone']['description']);

   return UserLocation(
      city:json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: street,
      coordinates:coordinates,
      timezone:timezone,
    );
  }
}

class LocationStreet{
  final int number;
  final String name;
   LocationStreet({
    required this.number,
    required this.name,
   });
  
}

class LocationCoordinates{
  final String latitude;
  final String longtitude;

  LocationCoordinates({
    required this.latitude,
    required this.longtitude,
  });

}

class LocationTimeZoneCoordinate{
  final String offset;
  final String description;

  LocationTimeZoneCoordinate({
    required this.offset,
    required this.description,
  });


}

