package allani.alexandre.assignement;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.pm.PackageManager;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

/*
Resolution 44100/512 Hz = 85Hz

19000 bin : 219 -- 225 (18750 Hz -- 19250 Hz) //223
20000 bin : 229 -- 235 (19750 Hz -- 20250 Hz) //232
21000 bin : 244 -- 250 (20750 Hz -- 21250 Hz) //247

 */


public class MainActivity extends AppCompatActivity {



    //Request code for hte permissions

    TextView mtext;
    final int REQUEST_CODE = 1;
    String mshouldContinue = "OK";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mtext = findViewById(R.id.txt);
        mtext.setText("");

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            ActivityCompat.requestPermissions(this,new String[] {Manifest.permission.RECORD_AUDIO},  REQUEST_CODE);
            return;
        }

        new AsyncTaskRunner().execute("c", "c", "c");


    }

    @Override
    protected void onResume(){
        super.onResume();
        //new AsyncTaskRunner().execute("c","c","c");
    }



    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(requestCode == REQUEST_CODE){
            if(grantResults.length>0 && grantResults[0] == PackageManager.PERMISSION_GRANTED){
                Log.d("Debug","Permission Granted");
                new AsyncTaskRunner().execute("c", "c", "c");

            }else{
                Log.d("Debug","Permission Denied");
            }
        }
    }

    private class AsyncTaskRunner extends AsyncTask<String, String, String> {

        private final int SAMPLE_RATE = 44100;
        private final int BUFFER_SIZE = 1024;
        private final int HF = 0;
        private final int MF = 1;
        private final int BF = 2;
        private final int BFMIN = 221;//223
        private final int MFMIN = 229;
        private final int HFMIN = 245;
        private final int BFMAX = 225;
        private final int MFMAX = 234;
        private final int HFMAX = 249;//248
        private final double LEVEL = 4;

        private int numberofShort;
        private String cletter = "";
        private String toprint="";
        private String letter;
        private int previous = -1;
        private int counter =0;
        int overallcounter =0;
        int charCode;
        boolean reset;

        AudioRecord recorder =null;

        private boolean stopped = false;

        @Override
        protected String doInBackground(String... params) {
            recorder = new AudioRecord(MediaRecorder.AudioSource.MIC,SAMPLE_RATE, AudioFormat.CHANNEL_IN_MONO,AudioFormat.ENCODING_PCM_16BIT,BUFFER_SIZE);
            recorder.startRecording();
            while (!stopped){
                final short[] audioData = new short[BUFFER_SIZE];
                //Log.d("Debug",""+audioData[2]);
                numberofShort = recorder.read(audioData,0,BUFFER_SIZE);
                //Log.d("Debug",""+numberofShort);
                double FFTResult[] = new FFT(512).getFreqSpectrumFromShort(audioData);
                //Log.d("Debug",""+FFTResult.length);
                loop(FFTResult);

                overallcounter++;
                if(overallcounter>180){
                    reset = true;
                    toprint ="";
                    letter ="";
                    Log.d("Debug","Reset");
                    previous = BF;
                    publishProgress(letter);
                    overallcounter =0;
                    counter=0;
                    charCode=0;
                    cletter="";
                }
            }
            return "cc";

        }


        @Override
        protected void onPostExecute(String result) {

        }


        @Override
        protected void onPreExecute() {

        }


        @Override
        protected void onProgressUpdate(String... text) {
            Log.d("Debug","Here "+reset);
            update();


        }

        public void loop(double[] FFTResult){
            int max= 0;
            double ffmax= 0;

            //Log.d("Debug",""+FFTResult.length);
            for(int k=BFMIN; k< HFMAX; k++){
                //Log.d("Debug",""+FFTResult[k]+" "+k);
                if(FFTResult[k]>ffmax){
                    max = k;
                    ffmax = FFTResult[k];
                }
            }
            //Log.d("Debug",""+max);

            if((max>BFMIN) && (max<BFMAX) && ffmax>LEVEL){ //BF
                //Log.d("Debug","BF "+FFTResult[max]);
                if(previous==-1){
                    previous = BF;
                    counter++;
                }
                if(previous == BF){
                    //Log.d("Debug","BF "+FFTResult[max]);
                    //Log.d("Debug", "BF : Not supposed to be here // Bug")
                }
                else if (previous == MF){
                    Log.d("Debug","BF "+FFTResult[max]);
                    cletter += '0';
                    previous = BF;
                    counter++;
                }
                else if (previous == HF){
                    Log.d("Debug","BF "+FFTResult[max]);
                    cletter += '1';
                    previous = BF;
                    counter++;
                }
            }
            else if((max>MFMIN) && (max<MFMAX) && ffmax>LEVEL){ //MF
                //Log.d("Debug","MF "+FFTResult[max]+" " + previous);
                if(previous == MF){
                    //Log.d("Debug","MF "+FFTResult[max]+" " + previous);
                    //Log.d("Debug", "MF : Not supposed to be here // Bug");
                }
                else if (previous == BF){
                    Log.d("Debug","MF "+FFTResult[max]+" " + previous);
                    cletter += '1';
                    previous = MF;
                    counter++;
                }
                else if (previous == HF){
                    Log.d("Debug","MF "+FFTResult[max]+" " + previous);
                    cletter += '0';
                    previous = MF;
                    counter++;
                }

            }
            else if((max>HFMIN) && (max <HFMAX) && ffmax>LEVEL){
                //Log.d("Debug","HF "+FFTResult[max]);
                if(previous == HF){
                    //Log.d("Debug","HF "+FFTResult[max]);
                    // Log.d("Debug", "HF : Not supposed to be here // Bug");
                }
                else if (previous == BF){
                    Log.d("Debug","HF "+FFTResult[max]);
                    cletter += '0';
                    previous = HF;
                    counter++;
                }
                else if (previous == MF){
                    Log.d("Debug","HF "+FFTResult[max]);
                    cletter += '1';
                    previous = HF;
                    counter++;
                }
            }

            if(counter ==8) {
                reset = false;
                charCode = Integer.parseInt(cletter,2);
                charCode = charCode^0xff;
                letter = new Character((char)charCode).toString();
                Log.d("Debug",""+charCode);
                counter =0;
                cletter = "";
                overallcounter =0;
                publishProgress(letter);

            }
            //Log.d("Debug","END OF WHILE");

            //Log.d("Debug","#############################");
        }


        public void update(){
            Log.d("Debug",""+reset);
            if(reset){
                Toast.makeText(getApplicationContext(),"Reset", Toast.LENGTH_SHORT).show();
            }
            toprint = toprint + letter;
            mtext.setText(toprint);
        }




    }


}
