namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting data base...", "Data deleted!") {%x(rails db:drop)}
      
      show_spinner("Creating data base...", "Data created!") {%x(rails db:create)}
        
      show_spinner("Data migrating...", "Data migrated") {%x(rails db:migrate)}
        
      show_spinner("Data seeding...", "Data successful!") {%x(rails db:seed)}
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  private

  def show_spinner(msg_start, msg_end)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
