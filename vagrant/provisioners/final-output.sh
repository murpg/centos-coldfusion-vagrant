#!/bin/bash

echo "Starting ColdFusion 11 instance"
systemctl restart coldfusion
systemctl restart nginx

systemctl enable coldfusion
systemctl enable nginx

echo ""
echo "========================================================================"
echo ""
echo "http://$1 ($2)"
echo ""
echo ""
echo "ColdFusion 11 Administrator UI"
echo "http://$1/CFIDE/administrator/index.cfm"
echo ""
echo ""
echo "========================================================================"
