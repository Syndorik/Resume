package allani.alexandre.myweatherapp;

import org.json.JSONException;
import org.json.JSONObject;



public class CityValues {
    private String cityName;
    private String zmwURL;

    public static CityValues fromJSON(JSONObject jsonObject){
        CityValues cityValues = new CityValues();
        try{
            cityValues.cityName = jsonObject.getJSONObject("location").getString("city");
            cityValues.zmwURL = jsonObject.getJSONObject("location").getString("l");
            return cityValues;

        }
        catch (JSONException e){
            e.printStackTrace();
            return null;
        }
    }

    public String getCityName() {
        return cityName;
    }

    public String getZmwURL() {
        return zmwURL;
    }
}
