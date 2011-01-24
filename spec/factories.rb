Factory.define :user do |user|
  user.name                  "Harold Giraldo  "
  user.email                 "harold@hlmbusiness.com  "
  user.password              "hgr0221"
  user.password_confirmation "hgr0221"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end