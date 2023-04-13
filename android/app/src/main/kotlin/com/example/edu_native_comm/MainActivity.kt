package com.example.edu_native_comm

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.edureka.demo/messages").setMethodCallHandler { call, result ->

               if(call.method == "calculate") {
                   val a = call.argument<Double>("a")
                   val b = call.argument<Double>("b")

                   if(a != null && b != null ) {
                       val sum = a + b
                       result.success(sum)
                   }

                   result.error("INVALID_ARGUMENTS", "invalid arguments", null)

               }
                else
               {
                   result.notImplemented()
               }

         }

    }

}
