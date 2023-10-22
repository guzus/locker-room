include .env

deploy:
	forge script DeployScript --rpc-url ${RPC_URL} --verify --broadcast --legacy
