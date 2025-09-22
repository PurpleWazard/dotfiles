#!/bin/bash


host=$(cat /etc/hostname | tr -d '[:space:]')

if [ "$host" = "WackPad" ]; then
  echo "wackpad"

  ln -s ./WackPad.conf ./system.conf

elif [ "$host" = "WackTop" ]; then
  echo "wacktop"

  ln -s ./WackTop.conf ./system.conf

else
  echo "none"
fi

echo "done"


