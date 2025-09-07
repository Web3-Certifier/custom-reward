## Create a reward on Web3 Certifier with custom eligibility criteria and reward amount

## Requirements
- [Foundryup](https://book.getfoundry.sh/getting-started/installation)

## Usage
- `git clone https://github.com/Web3-Certifier/custom-reward.git`
- `cd custom-reward`
- `cp .env.example .env`
- change the values of the .env file (at least ALCHEMY_API_KEY, DEPLOYER_PRIVATE_KEY, EXAM_ID) (the DEPLOYER_PRIVATE_KEY should be the one that created the exam)
- change the src/CustomReward.sol file
- `make build`
- `make deploy-w3c-reward-celo`

