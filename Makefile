.PHONY: build deploy-reward-sepolia deploy-reward-arbitrum deploy-reward-celo deploy-w3c-reward-sepolia deploy-w3c-reward-arbitrum deploy-w3c-reward-celo

-include .env

# Deploy and Verify the Custom Reward contract
deploy-reward-sepolia:
	@forge script script/DeployCustomReward.s.sol:DeployCustomReward --rpc-url https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --optimizer-runs 1 --via-ir -vvvv
deploy-reward-arbitrum:
	@forge script script/DeployCustomReward.s.sol:DeployCustomReward --rpc-url https://arb-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ARBITRUM_API_KEY) --optimizer-runs 1 --via-ir -vvvv
deploy-reward-celo:
	@forge script script/DeployCustomReward.s.sol:DeployCustomReward --rpc-url https://celo-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(CELO_API_KEY) --optimizer-runs 1 --via-ir -vvvv

# Create a reward on Web3Certifier with custom reward contract
deploy-w3c-reward-sepolia:
	@forge script script/DeployCustomRewardOnW3C.s.sol:DeployCustomRewardOnW3C --rpc-url https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) --optimizer-runs 1 --via-ir -vvvv
deploy-w3c-reward-arbitrum:
	@forge script script/DeployCustomRewardOnW3C.s.sol:DeployCustomRewardOnW3C --rpc-url https://arb-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ARBITRUM_API_KEY) --optimizer-runs 1 --via-ir -vvvv
deploy-w3c-reward-celo:
	@forge script script/DeployCustomRewardOnW3C.s.sol:DeployCustomRewardOnW3C --rpc-url https://celo-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY} --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(CELO_API_KEY) --optimizer-runs 1 --via-ir -vvvv
