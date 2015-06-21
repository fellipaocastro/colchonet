web: bash -c "bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}"
migrate: bash -c "rake db:migrate"
