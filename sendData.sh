#!/bin/bash
#send parsed JSON data to openTSDB
python3 json_parser.py
curl --header "Content-Type: application/json" --header "Expect:" -v -X POST http://192.168.1.247:8080/api/put?details=true -d @test_metrics.json
