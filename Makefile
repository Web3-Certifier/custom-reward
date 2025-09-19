.PHONY: build test clean deploy-reward-sepolia deploy-reward-celo deploy-w3c-reward-sepolia deploy-w3c-reward-celo

-include .env

# Clean
clean:
	@forge clean

# Build
build:
	@forge compile

# Test
test:
	@forge test --fork-url https://celo-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} -vv

# Deploy and Verify the Custom Reward contract
deploy-reward-sepolia:
	@forge script script/DeployCustomReward.s.sol:DeployCustomReward --rpc-url https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --verifier-url https://api.etherscan.io/v2/api?chainid=11155111 -vv
deploy-reward-celo:
	@forge script script/DeployCustomReward.s.sol:DeployCustomReward --rpc-url https://celo-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --verifier-url https://api.etherscan.io/v2/api?chainid=42220 -vv

# Create a reward on Web3Certifier with custom reward contract
deploy-w3c-reward-sepolia:
	@forge script script/DeployCustomRewardOnW3C.s.sol:DeployCustomRewardOnW3C --rpc-url https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --verifier-url https://api.etherscan.io/v2/api?chainid=11155111 -vv
deploy-w3c-reward-celo:
	@forge script script/DeployCustomRewardOnW3C.s.sol:DeployCustomRewardOnW3C --rpc-url https://celo-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --verifier-url https://api.etherscan.io/v2/api?chainid=42220 -vv
