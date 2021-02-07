# LABB2 med ORSKI
Labb2 i Linux med ORSKI

Extract and set execution rights for setup_labb2.sh;

ex. sudo chmod 777 ./setup_labb2.sh

everything should be set up correctly.

PS. the cron job is set to execute every 5 minutes but the lab expects an hour, just change the first argument in the cronjob to 0

I.E. 
(every 5 minutes)
echo "*/5 * * * * /usr/bin/log_deleter.sh" | crontab 
to
(every hour)
echo "0 * * * * /usr/bin/log_deleter.sh" | crontab
