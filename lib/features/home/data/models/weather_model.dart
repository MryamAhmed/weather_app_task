class WeatherModel{
  String cityName;
  String weatherState;
  num degree;

  WeatherModel({required this.cityName,required this.degree,required this.weatherState});


  factory WeatherModel.fromJson(jsonData){
    return WeatherModel(
        cityName:jsonData["name"],
        degree: jsonData["main"]['temp'],
        weatherState: jsonData["weather"]["main"]
    );
  }

  String getImage() {
    if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
      return 'assets/images/clear.png';
    }
    else if (
    weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow')
    {
      return 'assets/images/snow.png';
    }
    else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog')
    {
      return 'assets/images/cloudy.png';
    }
    else if (weatherState == 'Patchy rain possible' || weatherState == 'Heavy Rain' || weatherState == 'Showers	')
    {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState == 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else
    {
      return 'assets/images/clear.png';
    }
  }
}