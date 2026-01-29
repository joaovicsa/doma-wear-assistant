package com.example.my_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.media.AudioDeviceCallback
import android.media.AudioDeviceInfo

class MainActivity: FlutterActivity() {
    private val CHANNEL = "doma.com/audio_helper"


    private val audioDeviceCallback = object : AudioDeviceCallback() {
        override fun onAudioDevicesAdded(addedDevices: Array<out AudioDeviceInfo>?) {

            println("Dispositivo de áudio conectado");

        }

        override fun onAudioDevicesRemoved(removedDevices: Array<out AudioDeviceInfo>?) {

        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager


        audioManager.registerAudioDeviceCallback(audioDeviceCallback, null)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->

        }
    }


    override fun onDestroy() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        audioManager.unregisterAudioDeviceCallback(audioDeviceCallback)
        super.onDestroy()
    }
}