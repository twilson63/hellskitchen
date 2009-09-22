node[:users].each do |user_data|
  user user_data[:name] do
    comment "Deploy User"
    uid "1000"
    gid "Users"
    home "home/deploy"
    password user_data[:password]
  end
  
end