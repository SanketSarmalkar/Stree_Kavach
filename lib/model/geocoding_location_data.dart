// ignore_for_file: non_constant_identifier_names

class GeocodingLocationData {
  final String Name;
  final String Street;
  final String ISOCountryCode;
  final String Country;
  final String postalCode;
  final String SubAdministrativeArea;
  final String locality;
  final String SubLocality;
  final String thoroughfare;
  final String subThoroughfare;

  GeocodingLocationData(
      {required this.Name,
      required this.Street,
      required this.ISOCountryCode,
      required this.Country,
      required this.postalCode,
      required this.SubAdministrativeArea,
      required this.locality,
      required this.SubLocality,
      required this.thoroughfare,
      required this.subThoroughfare});
}
