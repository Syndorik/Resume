package allani.alexandre.myweatherapp;



import org.json.JSONException;
import org.json.JSONObject;

public class WeatherHourly {


    private String mtxt_hour1;
    private String mimg_hour1_weather;
    private String mtxt_hour1_temp;
    private String mtxt_hour1_rainfall;

    private String mtxt_hour2;
    private String mimg_hour2_weather;
    private String mtxt_hour2_temp;
    private String mtxt_hour2_rainfall;

    private String mtxt_hour3;
    private String mimg_hour3_weather;
    private String mtxt_hour3_temp;
    private String mtxt_hour3_rainfall;

    private String mtxt_hour4;
    private String mimg_hour4_weather;
    private String mtxt_hour4_temp;
    private String mtxt_hour4_rainfall;

    private String mtxt_hour5;
    private String mimg_hour5_weather;
    private String mtxt_hour5_temp;
    private String mtxt_hour5_rainfall;



    public static WeatherHourly fromJSON(JSONObject jsonObject){
        WeatherHourly weatherHourly = new WeatherHourly();
        try{
            weatherHourly.mtxt_hour1 = jsonObject.getJSONArray("hourly_forecast").getJSONObject(0).getJSONObject("FCTTIME").getString("hour_padded")
                    +":" + jsonObject.getJSONArray("hourly_forecast").getJSONObject(0).getJSONObject("FCTTIME").getString("min");

            weatherHourly.mtxt_hour2 = jsonObject.getJSONArray("hourly_forecast").getJSONObject(1).getJSONObject("FCTTIME").getString("hour_padded")
                    +":" + jsonObject.getJSONArray("hourly_forecast").getJSONObject(1).getJSONObject("FCTTIME").getString("min");

            weatherHourly.mtxt_hour3 = jsonObject.getJSONArray("hourly_forecast").getJSONObject(2).getJSONObject("FCTTIME").getString("hour_padded")
                    +":" + jsonObject.getJSONArray("hourly_forecast").getJSONObject(2).getJSONObject("FCTTIME").getString("min");

            weatherHourly.mtxt_hour4 = jsonObject.getJSONArray("hourly_forecast").getJSONObject(3).getJSONObject("FCTTIME").getString("hour_padded")
                    +":" + jsonObject.getJSONArray("hourly_forecast").getJSONObject(3).getJSONObject("FCTTIME").getString("min");

            weatherHourly.mtxt_hour5 = jsonObject.getJSONArray("hourly_forecast").getJSONObject(4).getJSONObject("FCTTIME").getString("hour_padded")
                    +":" + jsonObject.getJSONArray("hourly_forecast").getJSONObject(4).getJSONObject("FCTTIME").getString("min");


            weatherHourly.mimg_hour1_weather = jsonObject.getJSONArray("hourly_forecast").getJSONObject(0).getString("icon");
            weatherHourly.mimg_hour2_weather = jsonObject.getJSONArray("hourly_forecast").getJSONObject(1).getString("icon");
            weatherHourly.mimg_hour3_weather = jsonObject.getJSONArray("hourly_forecast").getJSONObject(2).getString("icon");
            weatherHourly.mimg_hour4_weather = jsonObject.getJSONArray("hourly_forecast").getJSONObject(3).getString("icon");
            weatherHourly.mimg_hour5_weather = jsonObject.getJSONArray("hourly_forecast").getJSONObject(4).getString("icon");

            weatherHourly.mtxt_hour1_temp = jsonObject.getJSONArray("hourly_forecast").getJSONObject(0).getJSONObject("temp").getString("metric") +"°C";
            weatherHourly.mtxt_hour2_temp = jsonObject.getJSONArray("hourly_forecast").getJSONObject(1).getJSONObject("temp").getString("metric")+"°C";
            weatherHourly.mtxt_hour3_temp = jsonObject.getJSONArray("hourly_forecast").getJSONObject(2).getJSONObject("temp").getString("metric")+"°C";
            weatherHourly.mtxt_hour4_temp = jsonObject.getJSONArray("hourly_forecast").getJSONObject(3).getJSONObject("temp").getString("metric")+"°C";
            weatherHourly.mtxt_hour5_temp = jsonObject.getJSONArray("hourly_forecast").getJSONObject(4).getJSONObject("temp").getString("metric")+"°C";

            weatherHourly.mtxt_hour1_rainfall = jsonObject.getJSONArray("hourly_forecast").getJSONObject(0).getString("humidity")+ "%";
            weatherHourly.mtxt_hour2_rainfall = jsonObject.getJSONArray("hourly_forecast").getJSONObject(1).getString("humidity")+ "%";
            weatherHourly.mtxt_hour3_rainfall = jsonObject.getJSONArray("hourly_forecast").getJSONObject(2).getString("humidity")+ "%";
            weatherHourly.mtxt_hour4_rainfall = jsonObject.getJSONArray("hourly_forecast").getJSONObject(3).getString("humidity")+ "%";
            weatherHourly.mtxt_hour5_rainfall = jsonObject.getJSONArray("hourly_forecast").getJSONObject(4).getString("humidity")+ "%";


            return weatherHourly;

        }
        catch (JSONException e){
            e.printStackTrace();
            return null;
        }
    }

    public String getMtxt_hour1() {
        return mtxt_hour1;
    }

    public String getMimg_hour1_weather() {
        return mimg_hour1_weather;
    }

    public String getMtxt_hour1_temp() {
        return mtxt_hour1_temp;
    }

    public String getMtxt_hour1_rainfall() {
        return mtxt_hour1_rainfall;
    }

    public String getMtxt_hour2() {
        return mtxt_hour2;
    }

    public String getMimg_hour2_weather() {
        return mimg_hour2_weather;
    }

    public String getMtxt_hour2_temp() {
        return mtxt_hour2_temp;
    }

    public String getMtxt_hour2_rainfall() {
        return mtxt_hour2_rainfall;
    }

    public String getMtxt_hour3() {
        return mtxt_hour3;
    }

    public String getMimg_hour3_weather() {
        return mimg_hour3_weather;
    }

    public String getMtxt_hour3_temp() {
        return mtxt_hour3_temp;
    }

    public String getMtxt_hour3_rainfall() {
        return mtxt_hour3_rainfall;
    }

    public String getMtxt_hour4() {
        return mtxt_hour4;
    }

    public String getMimg_hour4_weather() {
        return mimg_hour4_weather;
    }

    public String getMtxt_hour4_temp() {
        return mtxt_hour4_temp;
    }

    public String getMtxt_hour4_rainfall() {
        return mtxt_hour4_rainfall;
    }

    public String getMtxt_hour5() {
        return mtxt_hour5;
    }

    public String getMimg_hour5_weather() {
        return mimg_hour5_weather;
    }

    public String getMtxt_hour5_temp() {
        return mtxt_hour5_temp;
    }

    public String getMtxt_hour5_rainfall() {
        return mtxt_hour5_rainfall;
    }
}
