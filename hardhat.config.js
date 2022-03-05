require("@nomiclabs/hardhat-waffle");
require('dotenv').config()

module.exports = {
	solidity: "0.8.4",
	networks: {
		hardhat: {
			chainId: 1337
		},
		mumbai : {
			url : process.env.ALCHEMY_URL,
			accounts : [process.env.PVT_KEY]
		}
	}
}
