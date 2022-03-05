#!/bin/bash
LOCATE(){
if [ -z "$loc" ]
then
   loc=$(pwd)
else
   cd $loc
fi
}

