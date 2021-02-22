# LABB2 med ORSKI

Solution to the following problem:

Build following functions:

a. Every 10th second control if the file "/var/testfil1" has been changed.
IF it has, write a linenumber (start on one) and a timestamp and with the message that - "The file has changed" - to a logfile in a suitable place.

b. Everytime the log-file contains atleast 10 lines, the contents shall be appended to the end of another file, also in a suitable place - a bak-file - and the logfile must be emptied until the next line becomes written.

c. Once an hour the bak-file shall be deleted.

---

Installation instructions:

(install mplayer for added bonus!)

Extract and run setup_labb2.sh with sudo rights.


$ sudo ./setup_labb2.sh

everything should be set up correctly.

PS. the cron job is set to execute every 5 minutes but the lab expects an hour, just change the first argument in the cronjob to 0 in setuo_labb2.sh

I.E. 
(every 5 minutes)
echo "*/5 * * * * /usr/local/bin/bak_del.sh" | crontab 
to
(every hour)
echo "0 * * * * /usr/local/bin/bak_del.sh" | crontab

---

What the script actually does is, put the necessary scripts in /usr/local/bin/
The file to be checked is /var/testfil1
And the logs are stored in /tmp/log/

I've added a script which wasn't really necessary for the actual excersize called file_changer.sh, that appends incrementing numbers to /var/testfil1 - this is for testing purposes.

So basically file_checker.sh checks every 10 seconds if /var/testfil1 has been changed.
IF it has - it makes a log (line#, timestamp, message) in /tmp/log/labb2.log
WHEN it has reached 10 lines, it then empties /tmp/log/labb2.log and appends the data that was in it to /tmp/log/labb2.bak
Every 5th minute (that's the schedualed demo time - but excersize says an hour) there's a crontab job that get's run, it runs bak_del.sh
Which just removes and makes the file again with correct permissions.

---

There's room for a lot of improvement but slow and steady wins the race! :D
