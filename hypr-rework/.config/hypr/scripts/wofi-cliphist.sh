#!/bin/bash

function show_list() {
    cliphist list | wofi --dmenu | cliphist decode | wl-copy
}

pkill -x wofi || show_list
