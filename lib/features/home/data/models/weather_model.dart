class WeatherModel{
  String cityName;
  String weatherState;
  num degree;

  WeatherModel({required this.cityName,required this.degree,required this.weatherState});

  factory WeatherModel.fromJson(jsonData){
    return WeatherModel(
        cityName:jsonData["name"],
        degree: jsonData["main"]['temp'],
        weatherState: jsonData["weather"][0]["main"]
    );
  }

  String getImage() {
    if (weatherState == 'Sunny'  ) {
      return 'assets/images/sunny.jpg';
    }
    else if (
    weatherState == 'Blizzard' ||   weatherState == 'Showers' ||weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow')
    {
      return 'assets/images/snow.jpg';
    }
    else if ( weatherState == 'partly cloudy'||  weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog')
    {
      return 'assets/images/cloudy.jpeg';
    }
    else if (weatherState == 'Patchy rain possible' || weatherState == 'Heavy Rain'|| weatherState == 'Rain' )
    {
      return 'assets/images/rainy.jpg';
    } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState == 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' )
    {
      return 'assets/images/thunderstorm.jpeg';
    } else
    {
      return 'assets/images/clear.jpeg';
    }
  }
}