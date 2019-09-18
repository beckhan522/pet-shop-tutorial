
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "192.168.10.15",
      port: 8545,
      network_id: "65000" // Match any network id
    }
  }
};
