package com.example.hwkotlin

data class WatchListEntry(
    val id: Int,
    val title: String,
    var isWatched: Boolean = false
)