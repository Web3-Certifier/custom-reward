## About
Use this repository to create a reward for your Web3 Certifier exam with custom reward amount for each user. Users that pass your exam will get rewarded according to the formula that you define.

## Requirements
- [Foundryup](https://book.getfoundry.sh/getting-started/installation)
- You must have created an exam on [Web3 Certifier](https://web3certifier.com). Make sure you include information about custom reward functionality at the description of the exam.

## Usage
1. Run the following command on linux terminal 
```bash
git clone https://github.com/Web3-Certifier/custom-reward.git; cd custom-reward; cp .env.example .env
```
2. Change the values of the `.env` file (change at least ALCHEMY_API_KEY, DEPLOYER_PRIVATE_KEY, EXAM_ID) (the DEPLOYER_PRIVATE_KEY should be the one that created the exam)
3. Modify the `src/CustomReward.sol` file
4. Run `make build; make deploy-w3c-reward-celo`

## Test
Add a test file on `/test/Examples/` directory and run `make test`

Note: test with exam id 37 on Celo and id 69 on Sepolia