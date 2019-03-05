#!/bin/bash

function checkIt()
{
 ps auxw | grep $1 | grep -v grep > /dev/null

 if [ $? != 0 ]
 then
   echo $1 "Service is Not Running";
 else
   echo $1 "Service is Running";
 fi;
}

checkIt "apache" > test_result.txt;
checkIt "mysql" >> test_result.txt;
