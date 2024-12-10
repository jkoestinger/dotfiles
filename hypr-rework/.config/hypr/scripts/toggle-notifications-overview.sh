#!/bin/bash

function show_panel() {
    swaync-client -t -sw
}

pkill -x swaync-client || show_panel
