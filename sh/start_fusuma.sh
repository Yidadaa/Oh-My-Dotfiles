#!/bin/bash

fusuma &
syndaemon -t -k -i 1 -d &
ss-qt5 &