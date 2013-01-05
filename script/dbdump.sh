#!/bin/bash

mysqldump -h us-cdbr-east-02.cleardb.com -u b91bef6f78b00c -p --ssl-ca=cleardb-ca-cert.pem --ssl-cert=b91bef6f78b00c-cert.pem --ssl-key=b91bef6f78b00c-key.pem heroku_65dfe35aa936704 > $1
