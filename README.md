# LABB2 med ORSKI

Solution to the following problem:

Build following functions:

a. Every 10th second control if the file "/var/testfil1" has been changed.
IF it has, write a linenumber (start on one) and a timestamp and with the message that the file has changed to a logfile in a suitable place.

b. Everytime the log-file contains atleast 10 lines, the contents shall be appended to the end of another file, also in a suitable place.
A bak-file, and the logfile must be emptied until the next line becomes written

c. Once an hour the bak-file shall be deleted.

---

Installation instructions:

Extract and run setup_labb2.sh with sudo rights.

$ sudo ./setup_labb2.sh

everything should be set up correctly.

PS. the cron job is set to execute every 5 minutes but the lab expects an hour, just change the first argument in the cronjob to 0 in setuo_labb2.sh

I.E. 
(every 5 minutes)
echo "*/5 * * * * /usr/bin/log_deleter.sh" | crontab 
to
(every hour)
echo "0 * * * * /usr/bin/log_deleter.sh" | crontab
