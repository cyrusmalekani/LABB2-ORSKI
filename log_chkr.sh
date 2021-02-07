rad=$(tail -1 /usr/log/test1.log | cut -f1 -d ' ')

if [ '$rad' = '10' ]
then
   echo '### LOG HAS REACHED 10 LINES ###'
   echo '### SAVING TO log_test1.bak ###'
   cat /tmp/log/test1.log >> /tmp/log/log_test1.bak
   echo '### Cleaning! ###'
   echo '' > /usr/log/test1.log
else
   echo '# LOG LOOKS FINE #'
fi
