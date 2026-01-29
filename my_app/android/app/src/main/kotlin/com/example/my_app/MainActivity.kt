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

    // Definimos o callback como uma variável de classe para podermos remover depois
    private val audioDeviceCallback = object : AudioDeviceCallback() {
        override fun onAudioDevicesAdded(addedDevices: Array<out AudioDeviceInfo>?) {
            // Passo 3: Detectou novo dispositivo (ex: fone conectado)
            println("Dispositivo de áudio conectado");
            // Aqui você pode enviar um sinal para o Flutter avisando que o fone conectou
        }

        override fun onAudioDevicesRemoved(removedDevices: Array<out AudioDeviceInfo>?) {
            // Passo 3: Dispositivo removido
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager

        // REGISTRO DO PASSO 3: Começa a monitorar assim que o app inicia
        audioManager.registerAudioDeviceCallback(audioDeviceCallback, null)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // Seus outros métodos (como o do Passo 2 e 4)
        }
    }

    // IMPORTANTE: Limpeza para evitar gastar bateria ou memória
    override fun onDestroy() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        audioManager.unregisterAudioDeviceCallback(audioDeviceCallback)
        super.onDestroy()
    }
}