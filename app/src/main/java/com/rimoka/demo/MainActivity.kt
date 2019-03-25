package com.rimoka.demo

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.util.Log.i

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    /**
     * This is demo
     */
    private fun a() {
        i("TAGG", "This is demo")
    }
}
