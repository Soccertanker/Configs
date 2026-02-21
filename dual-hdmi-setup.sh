#!/bin/bash

set -eu

pipewire_pulse_confdir="$HOME/.config/pipewire/pipewire-pulse.conf.d/"

mkdir -p $pipewire_pulse_confdir

cp dual-hdmi.conf $pipewire_pulse_confdir

printf "\033[33mTo use dual HDMI, give AI this prompt: I am on Fedora using PipeWire. I have a GPU with multiple HDMI ports and I want to output audio to two of them simultaneously. Please walk me through:

    Switching the GPU profile to 'Pro Audio' using pavucontrol.

    Using pactl list short sinks to identify the specific pro-output node names.

    Creating a persistent module-combine-sink configuration in ~/.config/pipewire/pipewire-pulse.conf.d/ to bridge those specific nodes.

    Setting the new combined sink as the system default using wpctl.\033[0m\n"
