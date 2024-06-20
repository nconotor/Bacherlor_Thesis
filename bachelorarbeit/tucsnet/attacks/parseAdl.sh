#!/bin/bash
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i arpServer.adl -o arpServer.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i arpServerLate.adl -o arpServerLate.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i arpStudent.adl -o arpStudent.xml &&

yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i ddosSmall.adl -o ddosSmall.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i ddosMedium.adl -o ddosMedium.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i ddosLarge.adl -o ddosLarge.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i ddosSmallDisable.adl -o ddosSmallDisable.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i ddosMediumDisable.adl -o ddosMediumDisable.xml &&
yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i ddosLargeDisable.adl -o ddosLargeDisable.xml &&


yes y | python2.7 ../../../../interpreter/interpreter/interpreter.py -i portPassive.adl -o portPassive.xml 