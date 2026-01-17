#!/bin/bash


host=$(cat /etc/hostname | tr -d '[:space:]')

if [ "$host" = "WackPad" ]; then
  echo "wackpad"

  ln -sf ./WackPad.conf ./system.conf

elif [ "$host" = "WackTop" ]; then
  echo "wacktop"

  ln -sf ./WackTop.conf ./system.conf

else
  echo "none"
fi

echo "done"


