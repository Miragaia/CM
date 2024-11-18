package com.example.hwkotlin

import android.annotation.SuppressLint
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.compose.runtime.remember
import androidx.compose.runtime.mutableStateOf


import androidx.compose.material3.Scaffold
import androidx.compose.runtime.getValue
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Button
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.saveable.mapSaver
import androidx.compose.runtime.setValue
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.compose.ui.Alignment
import androidx.compose.ui.unit.dp


@Composable
fun WatchlistApp() {
    val watchListState = rememberSaveable {
        mutableStateOf(preFilledEntries())
    }

    var entryIdCounter by rememberSaveable { mutableStateOf(preFilledEntries().size + 1) }

    val textFieldValueSaver = remember {
        mapSaver(
            save = { mapOf("text" to it.text) },
            restore = { TextFieldValue(it["text"] as String) }
        )
    }
    val newEntryTitle = rememberSaveable(stateSaver = textFieldValueSaver) { mutableStateOf(TextFieldValue("")) }
    val listState = rememberLazyListState()

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        Text("Watch List", style = MaterialTheme.typography.titleLarge)

        Spacer(modifier = Modifier.height(16.dp))

        // Add New Entry
        Row(modifier = Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
            OutlinedTextField(
                value = newEntryTitle.value,
                onValueChange = { newEntryTitle.value = it },
                label = { Text("Add a new movie/series") },
                modifier = Modifier.weight(1f)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Button(onClick = {
                if (newEntryTitle.value.text.isNotBlank()) {
                    watchListState.value += WatchListEntry(
                        id = entryIdCounter++,
                        title = newEntryTitle.value.text
                    )
                    newEntryTitle.value = TextFieldValue("") // Clear input field
                }
            }) {
                Text("Add")
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        WatchList(
            watchList = watchListState.value,
            listState = listState,
            onToggleWatched = { id ->
                watchListState.value = watchListState.value.map { entry ->
                    if (entry.id == id) entry.copy(isWatched = !entry.isWatched) else entry
                }
            },
            onDelete = { id ->
                watchListState.value = watchListState.value.filter { it.id != id }
            }
        )
    }
}

fun preFilledEntries(): List<WatchListEntry> {
    return listOf(
        WatchListEntry(1, "Stranger Things"),
        WatchListEntry(2, "Breaking Bad"),
        WatchListEntry(3, "The Witcher")
    )
}

@Preview
@Composable
fun PreviewWatchlistApp() {
    WatchlistApp()
}


