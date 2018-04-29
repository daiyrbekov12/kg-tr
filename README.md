#Run bundle installer
1) bundle install

#Run migration
2) rails db:migrate

#Run seed file
3) rails db:seed


#Start elasticsearch on localhost:9200
4) service elasticsearch start

#Index all models
5) rake searchkick:reindex:all

#Start rails app
6) rails s
