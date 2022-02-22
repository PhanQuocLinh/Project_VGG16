+TESTNAME=$TESTNAME
-voptargs=+acc work.top 
-l ./result/log/$TESTNAME.log
-wlf ./result/$TESTNAME.wlf
-do "log -r /*;do wave_chrk.do /*; run 3ns "