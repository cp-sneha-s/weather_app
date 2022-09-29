

class CityLocation{
  String name;
  double lat;
  double lon;
  String country;
  CityLocation({
    required this.lon,
    required this.lat,
   required this.country,
    required this.name
});

  factory CityLocation.fromJson(Map<String,dynamic> map){
    return CityLocation(
        lon: map['lon'],
        lat: map['lat'],
        country: map['country'],
        name:map['state']);
  }
}