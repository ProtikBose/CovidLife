class todayDailyData {
  int _updated;
  String _country;
  CountryInfo _countryInfo;
  int _cases;
  int _todayCases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _todayRecovered;
  int _active;
  int _critical;
  int _casesPerOneMillion;
  int _deathsPerOneMillion;
  int _tests;
  int _testsPerOneMillion;
  int _population;
  String _continent;
  int _oneCasePerPeople;
  int _oneDeathPerPeople;
  int _oneTestPerPeople;
  double _activePerOneMillion;
  double _recoveredPerOneMillion;
  int _criticalPerOneMillion;

  todayDailyData(
      {int updated,
      String country,
      CountryInfo countryInfo,
      int cases,
      int todayCases,
      int deaths,
      int todayDeaths,
      int recovered,
      int todayRecovered,
      int active,
      int critical,
      int casesPerOneMillion,
      int deathsPerOneMillion,
      int tests,
      int testsPerOneMillion,
      int population,
      String continent,
      int oneCasePerPeople,
      int oneDeathPerPeople,
      int oneTestPerPeople,
      double activePerOneMillion,
      double recoveredPerOneMillion,
      int criticalPerOneMillion}) {
    this._updated = updated;
    this._country = country;
    this._countryInfo = countryInfo;
    this._cases = cases;
    this._todayCases = todayCases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._todayRecovered = todayRecovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
    this._deathsPerOneMillion = deathsPerOneMillion;
    this._tests = tests;
    this._testsPerOneMillion = testsPerOneMillion;
    this._population = population;
    this._continent = continent;
    this._oneCasePerPeople = oneCasePerPeople;
    this._oneDeathPerPeople = oneDeathPerPeople;
    this._oneTestPerPeople = oneTestPerPeople;
    this._activePerOneMillion = activePerOneMillion;
    this._recoveredPerOneMillion = recoveredPerOneMillion;
    this._criticalPerOneMillion = criticalPerOneMillion;
  }

  int get updated => _updated;
  set updated(int updated) => _updated = updated;
  String get country => _country;
  set country(String country) => _country = country;
  CountryInfo get countryInfo => _countryInfo;
  set countryInfo(CountryInfo countryInfo) => _countryInfo = countryInfo;
  int get cases => _cases;
  set cases(int cases) => _cases = cases;
  int get todayCases => _todayCases;
  set todayCases(int todayCases) => _todayCases = todayCases;
  int get deaths => _deaths;
  set deaths(int deaths) => _deaths = deaths;
  int get todayDeaths => _todayDeaths;
  set todayDeaths(int todayDeaths) => _todayDeaths = todayDeaths;
  int get recovered => _recovered;
  set recovered(int recovered) => _recovered = recovered;
  int get todayRecovered => _todayRecovered;
  set todayRecovered(int todayRecovered) => _todayRecovered = todayRecovered;
  int get active => _active;
  set active(int active) => _active = active;
  int get critical => _critical;
  set critical(int critical) => _critical = critical;
  int get casesPerOneMillion => _casesPerOneMillion;
  set casesPerOneMillion(int casesPerOneMillion) =>
      _casesPerOneMillion = casesPerOneMillion;
  int get deathsPerOneMillion => _deathsPerOneMillion;
  set deathsPerOneMillion(int deathsPerOneMillion) =>
      _deathsPerOneMillion = deathsPerOneMillion;
  int get tests => _tests;
  set tests(int tests) => _tests = tests;
  int get testsPerOneMillion => _testsPerOneMillion;
  set testsPerOneMillion(int testsPerOneMillion) =>
      _testsPerOneMillion = testsPerOneMillion;
  int get population => _population;
  set population(int population) => _population = population;
  String get continent => _continent;
  set continent(String continent) => _continent = continent;
  int get oneCasePerPeople => _oneCasePerPeople;
  set oneCasePerPeople(int oneCasePerPeople) =>
      _oneCasePerPeople = oneCasePerPeople;
  int get oneDeathPerPeople => _oneDeathPerPeople;
  set oneDeathPerPeople(int oneDeathPerPeople) =>
      _oneDeathPerPeople = oneDeathPerPeople;
  int get oneTestPerPeople => _oneTestPerPeople;
  set oneTestPerPeople(int oneTestPerPeople) =>
      _oneTestPerPeople = oneTestPerPeople;
  double get activePerOneMillion => _activePerOneMillion;
  set activePerOneMillion(double activePerOneMillion) =>
      _activePerOneMillion = activePerOneMillion;
  double get recoveredPerOneMillion => _recoveredPerOneMillion;
  set recoveredPerOneMillion(double recoveredPerOneMillion) =>
      _recoveredPerOneMillion = recoveredPerOneMillion;
  int get criticalPerOneMillion => _criticalPerOneMillion;
  set criticalPerOneMillion(int criticalPerOneMillion) =>
      _criticalPerOneMillion = criticalPerOneMillion;

  todayDailyData.fromJson(Map<String, dynamic> json) {
    _updated = json['updated'];
    _country = json['country'];
    _countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _continent = json['continent'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this._updated;
    data['country'] = this._country;
    if (this._countryInfo != null) {
      data['countryInfo'] = this._countryInfo.toJson();
    }
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['todayRecovered'] = this._todayRecovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['casesPerOneMillion'] = this._casesPerOneMillion;
    data['deathsPerOneMillion'] = this._deathsPerOneMillion;
    data['tests'] = this._tests;
    data['testsPerOneMillion'] = this._testsPerOneMillion;
    data['population'] = this._population;
    data['continent'] = this._continent;
    data['oneCasePerPeople'] = this._oneCasePerPeople;
    data['oneDeathPerPeople'] = this._oneDeathPerPeople;
    data['oneTestPerPeople'] = this._oneTestPerPeople;
    data['activePerOneMillion'] = this._activePerOneMillion;
    data['recoveredPerOneMillion'] = this._recoveredPerOneMillion;
    data['criticalPerOneMillion'] = this._criticalPerOneMillion;
    return data;
  }
}

class CountryInfo {
  int _iId;
  String _iso2;
  String _iso3;
  int _lat;
  int _long;
  String _flag;

  CountryInfo(
      {int iId, String iso2, String iso3, int lat, int long, String flag}) {
    this._iId = iId;
    this._iso2 = iso2;
    this._iso3 = iso3;
    this._lat = lat;
    this._long = long;
    this._flag = flag;
  }

  int get iId => _iId;
  set iId(int iId) => _iId = iId;
  String get iso2 => _iso2;
  set iso2(String iso2) => _iso2 = iso2;
  String get iso3 => _iso3;
  set iso3(String iso3) => _iso3 = iso3;
  int get lat => _lat;
  set lat(int lat) => _lat = lat;
  int get long => _long;
  set long(int long) => _long = long;
  String get flag => _flag;
  set flag(String flag) => _flag = flag;

  CountryInfo.fromJson(Map<String, dynamic> json) {
    _iId = json['_id'];
    _iso2 = json['iso2'];
    _iso3 = json['iso3'];
    _lat = json['lat'];
    _long = json['long'];
    _flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._iId;
    data['iso2'] = this._iso2;
    data['iso3'] = this._iso3;
    data['lat'] = this._lat;
    data['long'] = this._long;
    data['flag'] = this._flag;
    return data;
  }
}
