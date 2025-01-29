Rubber ducky deploys 0_deploy.sh

0_deploy.sh runs 1_setup.sh headless and disowned (because 0_deploy.sh is run with a terminal window)

1_setup.sh connects 2_updater.sh to cron and starts it disowned

2_updater.sh curls and runs 3_main.py from the github every 30s
