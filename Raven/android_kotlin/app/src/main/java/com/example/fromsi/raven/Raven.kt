package com.example.fromsi.raven

import processing.core.PApplet
import processing.core.PImage

class Raven : PApplet() {
    private val imgArray: MutableList<PImage> = mutableListOf()
    private var index = 0
    private var w = 0f
    private var h = 0f

    override fun settings() {
        size(displayWidth, displayHeight)

    }

    override fun setup() {
        frameRate(8f)

        for (i in 0 until 39) {
            imgArray.add(loadImage("raven_" + (i + 1) + ".webp"))
        }

        w = displayWidth.toFloat()
        h = displayHeight.toFloat()
    }

    override fun draw() {
        if (index < 39){
            image(imgArray[index++], 0f, 0f, w, h)
        } else {
            index = 0
            image(imgArray[index], 0f, 0f, w, h)
        }
    }
}