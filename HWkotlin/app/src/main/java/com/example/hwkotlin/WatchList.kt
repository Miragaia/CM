package com.example.hwkotlin

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyListState
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable

@Composable
fun WatchList(
    watchList: List<WatchListEntry>,
    listState: LazyListState,
    onToggleWatched: (Int) -> Unit,
    onDelete: (Int) -> Unit
) {
    LazyColumn(state = listState) {
        items(watchList) { entry ->
            WatchListItem(
                entry = entry,
                onToggleWatched = { onToggleWatched(entry.id) },
                onDelete = { onDelete(entry.id) }
            )
        }
    }
}