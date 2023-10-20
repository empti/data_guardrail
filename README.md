<div align="center">
    <img src="Voyager_logo.png" alt="Logo" width="100" height="100">
</div>

# Data Guardrail
Detect and Classify Sensitive Data from Cloud Storage

## (Recommended) Run the application in a Docker container:
```sh
docker build -t data_guardrail_api:v0.10 .
docker container run -d -p 6155:6155 -p 8501:8501 data_guardrail_api:v0.10
```

## (Dev only) Run the application in a virtual environment 
```sh
python3 -m venv .env
virtualenv .env
source .env/bin/activate
chmod u+x setup.sh
./setup.sh
chmod u+x runner.sh
./runner.sh
```


## To run a quick test: 
```sh
curl -i -H "Content-Type: application/json" -X POST --data @examples/test.json http://127.0.0.1:6155/dg/api/v0.1/classify 
```

## To run the full test, use the following script
```sh
chmod u+x test_basic.sh
test_basic.sh
```
## The test data (request body) is defined in the following file:
```
examples/body.json
```

## To generate more test data into example/ directory
```sh
python generate_message.py 
python generate_message.py test.json --person True --phone True
```
