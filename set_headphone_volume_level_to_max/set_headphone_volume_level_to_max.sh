#!/bin/bash

while [ 1 ]; do
  amixer -c 0 -- sset Headphone playback 100% > /dev/null
  sleep 1
done	
