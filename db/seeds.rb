# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Cadastro de tipos de moendas no /mining_types_path
spinner = TTY::Spinner.new("[:spinner] Cadastrando os tipos de moedas...")
spinner.auto_spin

miningtypes = [
        {
          description: "Proof of Work",,02,1
          acronym: "PoW",
        },

        {
          description: "Proof of Stack",
          acronym: "PoS",
        },

        {
          description: "Proof of Capacity",
          acronym: "PoC",
        },
      ]

miningtypes.each do |mining_type|
  MiningType.find_or_create_by!(mining_type)
  spinner.success("Successful!")
end

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=040",
        mining_type: MiningType.all.sample
      },

      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png?v=040",
        mining_type: MiningType.all.sample
      },

      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://cryptologos.cc/logos/dash-dash-logo.png?v=040",
        mining_type: MiningType.all.sample
      },

      {
        description: "Dogecoin",
        acronym: "DOGE",
        url_image: "https://cryptologos.cc/logos/dogecoin-doge-logo.png?v=040",
        mining_type: MiningType.all.sample
      }
    ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
  spinner.success("Successful!")
end

