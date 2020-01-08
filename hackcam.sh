#!/usr/bin/env bash
#====================HEADER=========================================|
#AUTOR
# Jefferson 'slackjeff' Rocha
#
#HACKCAM - It's only simple ;)
#===================================================================|

#==================TESTES
# Verificando existencia de dependencias
for x in 'v4l2-ctl' 'mplayer'; do
    which "$x" &>/dev/null || { echo "${x} is required. ABORTED."; exit 1 ;}
done
# Pegando o device da pessoa
DEVICE=$(v4l2-ctl --list-devices | grep '^[[:blank:]]/dev/video[0-9]' | sed 's/\t//')
DEVICE=${DEVICE:=/dev/video0} # Vazia? armazena /dev/video0

#=================INICIO
gst-launch-1.0 v4l2src device="${DEVICE}" ! video/x-raw,framerate=30/1 ! xvimagesink &>/dev/null
