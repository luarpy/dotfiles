#!/bin/bash

case $1 in
	"toggle-mode")
                if xset -q | grep 'Enabled' -q ; then
                       # xset -dpms
                        xset s off
                else
   	              # xset +dpms
                        xset s on
                fi
		;;
	"show-mode")
                if xset -q | grep 'Enabled' -q ; then
                  # off
                        echo "off"
                else
                  # on
   	                echo ""
                fi
		;;
esac
