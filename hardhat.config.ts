import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@openzeppelin/hardhat-upgrades";
import "hardhat-deploy";
import { config as dotenvConfig } from "dotenv";

dotenvConfig();

const PrivateKey: string = process.env.PRIVATE_KEY || "";
const AlchemyUrl: string = process.env.ALCHEMY_RPC_URL || "";

const config: HardhatUserConfig = {
  solidity: {
 

      compilers: [
      {
        version: "0.8.20",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },

        },
      },{
        version: "0.8.12",
        settings: {
          optimizer: {
            enabled: true,
            runs: 10000,
          },
        },
      },
      {
        version: "0.8.17",
        settings: {
          optimizer: {
            enabled: true,
            runs: 10000,
          },
        },
      }
    ],
  },
  networks: {
    goerli: {
      url: AlchemyUrl,
      accounts: [PrivateKey],
    },
    sepolia: {
      url: AlchemyUrl,
      accounts: [PrivateKey],
    },
    mainnet: {
      url: AlchemyUrl,
      accounts: [PrivateKey],
    },
  },

  namedAccounts: {
    deployer: {
      default: 0,
    },
  },
};

export default config;
