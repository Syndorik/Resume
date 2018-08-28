package allani.alexandre.myweatherapp;


import android.widget.ImageView;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

public class WeatherForecast {
   private String mtext_day0_maxmin;

    private String mtext_day1;
    private String mtext_day1_maxmin;
    private String mimg_day1_weather;
    private String mtext_day1_rainfall;

    private String mtext_day2;
    private String mtext_day2_maxmin;
    private String mimg_day2_weather;
    private String mtext_day2_rainfall;

    private String mtext_day3;
    private String mtext_day3_maxmin;
    private String mimg_day3_weather;
    private String mtext_day3_rainfall;

    public static WeatherForecast fromJSON(JSONObject jsonObject){
        WeatherForecast weatherForecast = new WeatherForecast();
        try{
            weatherForecast.mtext_day1 = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(1).getJSONObject("date").getString("weekday");
            weatherForecast.mtext_day2 = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(2).getJSONObject("date").getString("weekday");
            weatherForecast.mtext_day3 = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(3).getJSONObject("date").getString("weekday");



            weatherForecast.mtext_day0_maxmin = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(0).getJSONObject("high").getString("celsius")+
                    "°C/"+
                    jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast").getJSONArray("forecastday")
                            .getJSONObject(0).getJSONObject("low").getString("celsius") +"°C";

            weatherForecast.mtext_day1_maxmin = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(1).getJSONObject("high").getString("celsius")+
                    "°C/"+
                    jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast").getJSONArray("forecastday")
                            .getJSONObject(1).getJSONObject("low").getString("celsius") +"°C";

            weatherForecast.mtext_day2_maxmin = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(2).getJSONObject("high").getString("celsius")+
                    "°C/"+
                    jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast").getJSONArray("forecastday")
                            .getJSONObject(1).getJSONObject("low").getString("celsius") +"°C";
            weatherForecast.mtext_day3_maxmin = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(3).getJSONObject("high").getString("celsius")+
                    "°C/"+
                    jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast").getJSONArray("forecastday")
                            .getJSONObject(1).getJSONObject("low").getString("celsius") +"°C";


            weatherForecast.mimg_day1_weather =  jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(1).getString("icon");
            weatherForecast.mimg_day2_weather =  jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(2).getString("icon");
            weatherForecast.mimg_day3_weather =  jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(3).getString("icon");


            weatherForecast.mtext_day1_rainfall = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(1).getString("avehumidity") + "%";
            weatherForecast.mtext_day2_rainfall = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(2).getString("avehumidity") + "%";
            weatherForecast.mtext_day3_rainfall = jsonObject.getJSONObject("forecast").getJSONObject("simpleforecast")
                    .getJSONArray("forecastday").getJSONObject(3).getString("avehumidity") + "%";







            return weatherForecast;

        }
        catch (JSONException e){
            e.printStackTrace();
            return null;
        }
    }

    public String getMtext_day0_maxmin() {
        return mtext_day0_maxmin;
    }

    public String getMtext_day1() {
        return mtext_day1;
    }

    public String getMtext_day1_maxmin() {
        return mtext_day1_maxmin;
    }

    public String getMimg_day1_weather() {
        return mimg_day1_weather;
    }

    public String getMtext_day1_rainfall() {
        return mtext_day1_rainfall;
    }

    public String getMtext_day2() {
        return mtext_day2;
    }

    public String getMtext_day2_maxmin() {
        return mtext_day2_maxmin;
    }

    public String getMimg_day2_weather() {
        return mimg_day2_weather;
    }

    public String getMtext_day2_rainfall() {
        return mtext_day2_rainfall;
    }

    public String getMtext_day3() {
        return mtext_day3;
    }

    public String getMtext_day3_maxmin() {
        return mtext_day3_maxmin;
    }

    public String getMimg_day3_weather() {
        return mimg_day3_weather;
    }

    public String getMtext_day3_rainfall() {
        return mtext_day3_rainfall;
    }
}
