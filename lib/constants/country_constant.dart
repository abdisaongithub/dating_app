const labelKosovo = 'Kosovë';

class Country {
  static List<String> countryCodes = [
    '+355',
    '+43',
    '+43',
    '+49',
    '+383',
    '+389',
    '+41',
    '+90',
    '+44',
    '+251',
  ];
}

class CountryCode {
  final String flagPath;
  final String countryName;
  final String countryCode;

  CountryCode({
    required this.flagPath,
    required this.countryName,
    required this.countryCode,
  });

  static List<CountryCode> listCountryCodesDefaultList() {
    const flagBasePath = "assets/images/flags/";
    return [
      CountryCode(
        flagPath: "${flagBasePath}icon-flag-albania-circle.svg",
        countryName: "Albania",
        countryCode: "+355",
      ),
      CountryCode(flagPath: "${flagBasePath}icon-flag-austria-circle.svg", countryName: "Austria", countryCode: "+43"),
      CountryCode(flagPath: "${flagBasePath}icon-flag-france-circle.svg", countryName: "France", countryCode: "+33"),
      CountryCode(flagPath: "${flagBasePath}icon-flag-germany-circle.svg", countryName: "Germany", countryCode: "+49"),
      CountryCode(flagPath: "${flagBasePath}icon-flag-italy-circle.svg", countryName: "Italia", countryCode: "+39"),
      CountryCode(flagPath: "${flagBasePath}icon-flag-kosovo-circle.svg", countryName: "Kosovo", countryCode: "+383"),
      CountryCode(
          flagPath: "${flagBasePath}icon-flag-northmacedonia-circle.svg",
          countryName: "North Macedonia",
          countryCode: "+389"),
      CountryCode(
          flagPath: "${flagBasePath}icon-flag-switzerland-circle.svg", countryName: "Switzerland", countryCode: "+41"),
      CountryCode(flagPath: "${flagBasePath}icon-flag-turkey-circle.svg", countryName: "Turkey", countryCode: "+90"),
      CountryCode(
          flagPath: "${flagBasePath}icon-flag-uk-circle.svg", countryName: "United Kingdom", countryCode: "+44"),
      CountryCode(
          flagPath: "${flagBasePath}icon-flag-ethiopia-circle.svg", countryName: "Ethiopia", countryCode: "+251"),
    ];
  }

  static CountryCode listCountryCodesDefaultSelection() {
    const flagBasePath = "assets/images/flags/";
    return CountryCode(
      flagPath: "${flagBasePath}icon-flag-kosovo-circle.svg",
      countryName: "Kosovo",
      countryCode: "+383",
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CountryCode &&
        countryCode == other.countryCode &&
        countryName == other.countryCode &&
        flagPath == other.flagPath;
  }

  @override
  int get hashCode {
    return super.hashCode;
  }
}
