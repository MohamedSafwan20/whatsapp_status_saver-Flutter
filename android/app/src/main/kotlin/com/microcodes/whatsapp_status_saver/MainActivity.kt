package com.microcodes.whatsapp_status_saver

import android.content.Intent
import android.provider.MediaStore
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val channel = "status.saver.app"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call, result ->
            if (call.method == "GALLERY") {
                try {
                    openGallery()

                    result.success(true)

                } catch (e: Error) {
                    result.error("500", e.message, null)
                }

            } else {
                result.notImplemented()
            }
        }
    }

    private fun openGallery() {
        val intent = Intent(Intent.ACTION_VIEW, MediaStore.Images.Media.INTERNAL_CONTENT_URI)
        startActivity(intent)
    }

}
