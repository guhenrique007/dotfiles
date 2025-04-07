#!/bin/bash

# Verifica se o HDMI-A-0 está conectado
if xrandr | grep "HDMI-A-0 connected"; then
    # Define HDMI-A-0 como monitor principal e mantém eDP ativo
    xrandr --output HDMI-A-0 --primary --auto --output eDP --auto --right-of HDMI-A-0
else
    # Usa a tela do notebook como principal, mantendo ela ativa
    xrandr --output eDP --primary --auto
fi
