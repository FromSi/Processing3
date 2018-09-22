package com.example.fromsi.raven

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.content.Intent
import android.view.ViewGroup
import android.view.Window
import android.view.WindowManager
import android.widget.FrameLayout
import processing.core.PApplet
import processing.android.PFragment
import processing.android.CompatUtils

class MainActivity : AppCompatActivity() {

    private var sketch: PApplet? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        requestWindowFeature(Window.FEATURE_NO_TITLE)
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN)

        val frame = FrameLayout(this)
        frame.id = CompatUtils.getUniqueViewId()

        setContentView(
                frame,
                ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                )
        )

        sketch = Raven()
        val fragment = PFragment(sketch)
        fragment.setView(frame, this)
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        if (sketch != null) {
            sketch!!.onRequestPermissionsResult(
                    requestCode, permissions, grantResults)
        }
    }

    public override fun onNewIntent(intent: Intent) {
        if (sketch != null) {
            sketch!!.onNewIntent(intent)
        }
    }
}
