package allani.alexandre.myweatherapp;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONObject;

import java.nio.file.WatchEvent;
import java.security.Permission;

import cz.msebera.android.httpclient.Header;

public class WeatherController extends AppCompatActivity {

    //Request code for hte permissions
    final int REQUEST_CODE = 1;

    //URL of wunderground
    final String URL = "http://api.wunderground.com/api/";

    //Key to use the API
    final String KEY_API = "8799bf700aa9d74b/";

    //GPS URL
    final String GPS_URL = URL+KEY_API+"geolookup/q/";

    //FORECAST URL
    final String FORECAST_URL = URL+KEY_API+"/forecast";

    //CONDITION URL
    final String CONDITION_URL = URL + KEY_API+ "/conditions";

    //HOURLY FORECAST
    final String HOURLY_URL = URL + KEY_API + "/hourly";

    //Time between location updates in milisecond
    final long MIN_TIME = 5000;

    //Distance between update location in meter
    final float MIN_DIST = 1000;

    //Location provider
    String LOCATION_PROVIDER = LocationManager.NETWORK_PROVIDER; //use  LocationManager.GPS_PROVIDER



    //View variables
    //FIRST PART

    TextView mtext_loc;
    TextView mtext_today_temp;
    TextView mtext_today_weather;
    TextView mtext_today_max_min;
    TextView mtext_today_rainfall;
    ImageView mimg_today_weather;

    //SECOND PART
    TextView mtext_day1;
    TextView mtext_day1_maxmin;
    ImageView mimg_day1_weather;
    TextView mtext_day1_rainfall;

    TextView mtext_day2;
    TextView mtext_day2_maxmin;
    ImageView mimg_day2_weather;
    TextView mtext_day2_rainfall;

    TextView mtext_day3;
    TextView mtext_day3_maxmin;
    ImageView mimg_day3_weather;
    TextView mtext_day3_rainfall;

    //THIRD PART

    TextView mtxt_hour1;
    ImageView mimg_hour1_weather;
    TextView mtxt_hour1_temp;
    TextView mtxt_hour1_rainfall;

    TextView mtxt_hour2;
    ImageView mimg_hour2_weather;
    TextView mtxt_hour2_temp;
    TextView mtxt_hour2_rainfall;

    TextView mtxt_hour3;
    ImageView mimg_hour3_weather;
    TextView mtxt_hour3_temp;
    TextView mtxt_hour3_rainfall;

    TextView mtxt_hour4;
    ImageView mimg_hour4_weather;
    TextView mtxt_hour4_temp;
    TextView mtxt_hour4_rainfall;

    TextView mtxt_hour5;
    ImageView mimg_hour5_weather;
    TextView mtxt_hour5_temp;
    TextView mtxt_hour5_rainfall;

    //GPS Variable
    LocationListener mLocationListener;
    LocationManager mLocationManager;
    ImageButton  mImbut;
    String mCity = "NoLocation";
    String mZmw = "NoLocation";
    boolean refresh = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_weather_controller);

        //Link to the layout

        //FIRST PART
        mtext_loc = findViewById(R.id.text_loc);
        mtext_today_temp = findViewById(R.id.text_today_temp);
        mtext_today_weather = findViewById(R.id.text_today_weather);
        mtext_today_max_min = findViewById(R.id.text_today_max_min);
        mtext_today_rainfall = findViewById(R.id.text_today_rainfall);
        mimg_today_weather = findViewById(R.id.img_today_weather);

        //SECOND PART
        mtext_day1 = findViewById(R.id.text_day1);
        mtext_day1_maxmin = findViewById(R.id.text_day1_maxmin);
        mimg_day1_weather = findViewById(R.id.img_day1_weather);
        mtext_day1_rainfall = findViewById(R.id.text_day1_rainfall);

        mtext_day2 = findViewById(R.id.text_day2);
        mtext_day2_maxmin = findViewById(R.id.text_day2_maxmin);
        mimg_day2_weather = findViewById(R.id.img_day2_weather);
        mtext_day2_rainfall = findViewById(R.id.text_day2_rainfall);

        mtext_day3 = findViewById(R.id.text_day3);
        mtext_day3_maxmin = findViewById(R.id.text_day3_maxmin);
        mimg_day3_weather = findViewById(R.id.img_day3_weather);
        mtext_day3_rainfall = findViewById(R.id.text_day3_rainfall);

        //THIRD PART

        mtxt_hour1 = findViewById(R.id.txt_hour1);
        mimg_hour1_weather = findViewById(R.id.img_hour1_weather);
        mtxt_hour1_temp = findViewById(R.id.txt_hour1_temp);
        mtxt_hour1_rainfall = findViewById(R.id.txt_hour1_rainfall);

        mtxt_hour2 = findViewById(R.id.txt_hour2);
        mimg_hour2_weather = findViewById(R.id.img_hour2_weather);
        mtxt_hour2_temp = findViewById(R.id.txt_hour2_temp);
        mtxt_hour2_rainfall = findViewById(R.id.txt_hour2_rainfall);

        mtxt_hour3 = findViewById(R.id.txt_hour3);
        mimg_hour3_weather = findViewById(R.id.img_hour3_weather);
        mtxt_hour3_temp = findViewById(R.id.txt_hour3_temp);
        mtxt_hour3_rainfall = findViewById(R.id.txt_hour3_rainfall);

        mtxt_hour4 = findViewById(R.id.txt_hour4);
        mimg_hour4_weather = findViewById(R.id.img_hour4_weather);
        mtxt_hour4_temp = findViewById(R.id.txt_hour4_temp);
        mtxt_hour4_rainfall = findViewById(R.id.txt_hour4_rainfall);

        mtxt_hour5 = findViewById(R.id.txt_hour5);
        mimg_hour5_weather = findViewById(R.id.img_hour5_weather);
        mtxt_hour5_temp = findViewById(R.id.txt_hour5_temp);
        mtxt_hour5_rainfall = findViewById(R.id.txt_hour5_rainfall);

        mImbut = findViewById(R.id.img_change_activity);

        mImbut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                refresh = true;
                Toast.makeText(WeatherController.this,"Refreshing",Toast.LENGTH_SHORT).show();
                getWeather();
                refresh = false;

            }
        });

        getWeather();
        Log.d("Debug","Je suis là");

    }

    @Override
    protected void onResume() {
        super.onResume();
        getWeather();
    }

    /*
    This method is getting first the location from the API LocationManager
    And then it is getting the weather from the API http://api.openweathermap.org/data/2.5/weather
     */
    private void getWeather() {
        mLocationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        //This object check the different possible state, location changed, GPS enabled or disabled
        mLocationListener = new LocationListener() {
            @Override
            public void onLocationChanged(Location location) {;
                String longitude = String.valueOf(location.getLongitude());
                String lattitude = String.valueOf(location.getLatitude());
                Log.d("Debug","Longitude "+longitude);
                Log.d("Debug","Lattitude "+lattitude);
                String coordinates = lattitude + ","+ longitude + ".json";
                String url = GPS_URL + coordinates;
                apiCallCity(url);


            }

            @Override
            public void onStatusChanged(String s, int i, Bundle bundle) {

            }

            @Override
            public void onProviderEnabled(String s) {

            }

            @Override
            public void onProviderDisabled(String s) {
                Toast.makeText(WeatherController.this, "GPS localization disabled", Toast.LENGTH_SHORT);
            }
        };

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            ActivityCompat.requestPermissions(this,new String[] {Manifest.permission.ACCESS_FINE_LOCATION},  REQUEST_CODE);
            return;
        }
        mLocationManager.requestLocationUpdates(LOCATION_PROVIDER, MIN_TIME, MIN_DIST, mLocationListener);

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(requestCode == REQUEST_CODE){
            if(grantResults.length>0 && grantResults[0] == PackageManager.PERMISSION_GRANTED){
                Log.d("Debug","Permission Granted");
                getWeather();
            }else{
                Log.d("Debug","Permission Denied");
            }
        }
    }

    private void apiCallCity(String url){
        AsyncHttpClient client = new AsyncHttpClient();
        client.get(url,new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response){
                Log.d("Debug","Succes apicallCIty the JSON is : "+ response.toString());
                CityValues mcityValues = CityValues.fromJSON(response);
                mCity= mcityValues.getCityName();
                mZmw = mcityValues.getZmwURL();
                String url = CONDITION_URL + mZmw + ".json";
                apiCurrentWeather(url,mZmw);

            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable e, JSONObject response){
                Log.d("Debug","Fail"+ e.toString());
                Log.d("Debug","SatusCode "+statusCode);
                Toast.makeText(WeatherController.this,"Request Failed", Toast.LENGTH_SHORT).show();

            }
        });
    }

    private void apiCurrentWeather(String url,String izmw){
        final String url2 = FORECAST_URL + izmw + ".json";
        final String cizmv  = izmw;

        AsyncHttpClient client = new AsyncHttpClient();
        client.get(url,new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response){
                Log.d("Debug","Succes the WWWWWWWWWWW JSON is : "+ response.toString());
                WeatherConditions mweatherConditions = WeatherConditions.fromJSON(response);
                update1(mweatherConditions);
                apiCallWeather(url2, cizmv);
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable e, JSONObject response){
                Log.d("Debug","Fail"+ e.toString());
                Log.d("Debug","SatusCode "+statusCode);
                Toast.makeText(WeatherController.this,"Request Failed", Toast.LENGTH_SHORT).show();

            }

        });
    }



    private void apiCallWeather(String url, String izmv){
        final String url2 = HOURLY_URL + izmv + ".json";

        AsyncHttpClient client = new AsyncHttpClient();
        client.get(url,new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response){
                Log.d("Debug","Succes the JSON is : "+ response.toString());
                WeatherForecast weatherForecast = WeatherForecast.fromJSON(response);
                update2(weatherForecast);
                apiCallHourly(url2);
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable e, JSONObject response){
                Log.d("Debug","Fail"+ e.toString());
                Log.d("Debug","SatusCode "+statusCode);
                Toast.makeText(WeatherController.this,"Request Failed", Toast.LENGTH_SHORT).show();

            }
        });
    }


    private void apiCallHourly(String url){
        AsyncHttpClient client = new AsyncHttpClient();
        client.get(url,new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response){
                Log.d("Debug","Succes the JSON is : "+ response.toString());
                WeatherHourly weatherHourly = WeatherHourly.fromJSON(response);
                update3(weatherHourly);

            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable e, JSONObject response){
                Log.d("Debug","Fail"+ e.toString());
                Log.d("Debug","SatusCode "+statusCode);
                Toast.makeText(WeatherController.this,"Request Failed", Toast.LENGTH_SHORT).show();

            }
        });
    }

    //iconID = getResources().getIdentifier(weather.getIconName(),"drawable",getPackageName());

    private int getDrawRessource(String icon){
        switch (icon) {
            case "clear":
                return getResources().getIdentifier("sunny", "drawable", getPackageName());
            case "cloudy":
                return getResources().getIdentifier("overcast", "drawable", getPackageName());
            case "flurries":
                return getResources().getIdentifier("snow4", "drawable", getPackageName());
            case "fog":
                return getResources().getIdentifier("haze", "drawable", getPackageName());
            case "hazy":
                return getResources().getIdentifier("fog", "drawable", getPackageName());
            case "partlysunny":
                return getResources().getIdentifier("cloud", "drawable", getPackageName());
            case "mostlycloudy":
                return getResources().getIdentifier("cloud", "drawable", getPackageName());
            case "mostlysunny":
                return getResources().getIdentifier("cloudy2", "drawable", getPackageName());
            case "partlycloudy":
                return getResources().getIdentifier("cloudy2", "drawable", getPackageName());
            case "sleet":
                return getResources().getIdentifier("snow4", "drawable", getPackageName());
            case "rain":
                return getResources().getIdentifier("shower3", "drawable", getPackageName());
            case "snow":
                return getResources().getIdentifier("snow5", "drawable", getPackageName());
            case "sunny":
                return getResources().getIdentifier("sunny", "drawable", getPackageName());
            case "tstorms":
                return getResources().getIdentifier("tstorm3", "drawable", getPackageName());
            case "chanceflurries":
                return getResources().getIdentifier("snow", "drawable", getPackageName());
            case "chancerain":
                return getResources().getIdentifier("shower3", "drawable", getPackageName());
            case "chancesleet":
                return getResources().getIdentifier("snow", "drawable", getPackageName());
            case "chancesnow":
                return getResources().getIdentifier("snow", "drawable", getPackageName());
            case "chancetstorms":
                return getResources().getIdentifier("tstorm1", "drawable", getPackageName());
            default:
                return getResources().getIdentifier("dunno", "drawable", getPackageName());
        }


    }

    private void update1(WeatherConditions weatherConditions){
        mtext_loc.setText(weatherConditions.getLocation());
        mtext_today_weather.setText(weatherConditions.getToday_weather_txt());
        mimg_today_weather.setImageResource(getDrawRessource(weatherConditions.getToday_weather_img()));
        mtext_today_temp.setText(weatherConditions.getToday_temp());
        mtext_today_rainfall.setText(weatherConditions.getToday_rainfall());
    }

    private void update2(WeatherForecast weatherForecast){
        mtext_today_max_min.setText(weatherForecast.getMtext_day0_maxmin());

        mtext_day1_maxmin.setText(weatherForecast.getMtext_day1_maxmin());
        mtext_day1_rainfall.setText(weatherForecast.getMtext_day1_rainfall());
        mtext_day1.setText(weatherForecast.getMtext_day1());
        mimg_day1_weather.setImageResource(getDrawRessource(weatherForecast.getMimg_day1_weather()));


        mtext_day2_maxmin.setText(weatherForecast.getMtext_day2_maxmin());
        mtext_day2_rainfall.setText(weatherForecast.getMtext_day2_rainfall());
        mtext_day2.setText(weatherForecast.getMtext_day2());
        mimg_day2_weather.setImageResource(getDrawRessource(weatherForecast.getMimg_day2_weather()));

        mtext_day3_maxmin.setText(weatherForecast.getMtext_day3_maxmin());
        mtext_day3_rainfall.setText(weatherForecast.getMtext_day3_rainfall());
        mtext_day3.setText(weatherForecast.getMtext_day3());
        mimg_day3_weather.setImageResource(getDrawRessource(weatherForecast.getMimg_day3_weather()));

    }

    private void update3(WeatherHourly weatherHourly){
        mtxt_hour1.setText(weatherHourly.getMtxt_hour1());
        mtxt_hour1_rainfall.setText(weatherHourly.getMtxt_hour1_rainfall());
        mtxt_hour1_temp.setText(weatherHourly.getMtxt_hour1_temp());
        mimg_hour1_weather.setImageResource(getDrawRessource(weatherHourly.getMimg_hour1_weather()));

        mtxt_hour2.setText(weatherHourly.getMtxt_hour2());
        mtxt_hour2_rainfall.setText(weatherHourly.getMtxt_hour2_rainfall());
        mtxt_hour2_temp.setText(weatherHourly.getMtxt_hour2_temp());
        mimg_hour2_weather.setImageResource(getDrawRessource(weatherHourly.getMimg_hour2_weather()));

        mtxt_hour3.setText(weatherHourly.getMtxt_hour3());
        mtxt_hour3_rainfall.setText(weatherHourly.getMtxt_hour3_rainfall());
        mtxt_hour3_temp.setText(weatherHourly.getMtxt_hour3_temp());
        mimg_hour3_weather.setImageResource(getDrawRessource(weatherHourly.getMimg_hour3_weather()));

        mtxt_hour4.setText(weatherHourly.getMtxt_hour4());
        mtxt_hour4_rainfall.setText(weatherHourly.getMtxt_hour4_rainfall());
        mtxt_hour4_temp.setText(weatherHourly.getMtxt_hour4_temp());
        mimg_hour4_weather.setImageResource(getDrawRessource(weatherHourly.getMimg_hour4_weather()));

        mtxt_hour5.setText(weatherHourly.getMtxt_hour5());
        mtxt_hour5_rainfall.setText(weatherHourly.getMtxt_hour5_rainfall());
        mtxt_hour5_temp.setText(weatherHourly.getMtxt_hour5_temp());
        mimg_hour5_weather.setImageResource(getDrawRessource(weatherHourly.getMimg_hour5_weather()));
        Toast.makeText(WeatherController.this,"Refreshed !",Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void onPause() {
        super.onPause();
        if(mLocationManager != null){
            mLocationManager.removeUpdates(mLocationListener);
        }
    }
}
