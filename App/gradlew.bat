package it.minut.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    private final String TAG = "inventory";
    // url: https://finepointmobile.com/api/inventory/v1/message

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    protected void onStart() {
        super.onStart();

        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://finepointmobile.com/api/inventory/v1/message");
            conn = (HttpURLConnection) url.openConnection();
            String result = "";
//            if(conn.getResponseCode() == 200){
//                InputStream in = new BufferedInputStream(conn.getInputStream());
//                if (in != null) {
//                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in));
//                    String line = "";
//
//                    while ((line = bufferedReader.readLine()) != null)
//                        result += line;
//
//                    in.close();
//                }

//            }

            Log.d(TAG, "onCreate: message = " + result);


        } catch (MalformedURLException e) {
            Log.d(TAG, "onCreate: URL not valid");
        } catch (IOException e) {
            Log.d(TAG, "onCreate: Could not connect to url");
        }
        finally {
            if(conn != null)
                conn.disconnect();
        }
    }

    public void goToAddProductView(View view){
        startActivity(new Intent(this, AddProductActivity.class));
    }
}
                                                                                                                             