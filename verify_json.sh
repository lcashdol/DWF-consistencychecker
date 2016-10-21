#!/bin/bash
# Larry W. Cashdollar, 10/20/2016
# Simple script to verify .json entries against the template.
# apt-get install python-pip
# pip install json-spec
# Bulk Checking:
# $ for x in `seq 1000112 1000155`; do ./verify_json.sh $x; done
# Checking CVE-2016-1000112:OK
# Checking CVE-2016-1000113:OK
# Checking CVE-2016-1000114:OK
#.
#.
#.


YEAR="2016"
TEMPLATE="CVE-template.json"
JSONBIN="/usr/local/bin/json"

echo -n "Checking CVE-2016-$1:"
$JSONBIN validate --schema-file=$TEMPLATE --document-file=$1/CVE-$YEAR-$1.json 

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
