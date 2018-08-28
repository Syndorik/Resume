package allani.alexandre.myweatherapp;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;



public class WeatherConditions {
    private String today_temp;
    private String today_weather_txt;
    private  String today_weather_img;
    private String location;
    private String today_rainfall;

    public static WeatherConditions fromJSON(JSONObject jsonObject){
        WeatherConditions weatherConditions = new WeatherConditions();
        try{
            weatherConditions.location = jsonObject.getJSONObject("current_observation").getJSONObject("display_location").getString("city");
            weatherConditions.today_temp = Integer.toString(jsonObject.getJSONObject("current_observation").getInt("temp_c"))+"°C";
            weatherConditions.today_weather_txt = jsonObject.getJSONObject("current_observation").getString("weather");
            weatherConditions.today_rainfall = "Humidity : "+ jsonObject.getJSONObject("current_observation").getString("relative_humidity")+ "%";
            weatherConditions.today_weather_img = jsonObject.getJSONObject("current_observation").getString("icon");
            return weatherConditions;

        }
        catch (JSONException e){
            e.printStackTrace();
            return null;
        }
    }

    public String getToday_temp() {
        return today_temp;
    }

    public String getToday_weather_txt() {
        return today_weather_txt;
    }

    public String getToday_weather_img() {
        return today_weather_img;
    }

    public String getLocation() {
        return location;
    }

    public String getToday_rainfall() {
        return today_rainfall;
    }
}
