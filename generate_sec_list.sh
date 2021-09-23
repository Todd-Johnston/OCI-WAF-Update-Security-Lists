#!/bin/bash
total_lines=`cat cidr_ranges.txt | wc -l`
lines_no=0
echo "["
while read -r line;
do
  lines_no=$(( $lines_no + 1 ));
  echo " {";
  echo "  \"icmp-options\": "null",";
  echo "  \"source\": \"${line}\",";
  echo "  \"source-type\": \"CIDR_BLOCK\",";
  echo "  \"protocol\": \"6\",";
  echo "  \"is-stateless\": "false",";
  echo "  \"tcp-options\": " {" \"destination-port-range\": "{" \"max\": \"443\", \"min\": \"443\" }, \"source-port-range\": "null" "}",";
  echo "  \"udp-options\": "null" ";
  if [[ $lines_no -eq $total_lines ]]; then
   echo " }"; 
  else
   echo " },";
  fi
done < cidr_ranges.txt
echo "]"
