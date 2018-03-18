#!/bin/bash
#set +m
#shopt -s lastpipe
read var1 var2 < <(echo "hello world")
#echo "Hello world" | read var1 var2
echo $var1
echo $var2
