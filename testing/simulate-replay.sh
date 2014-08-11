#! /bin/sh

# Simulate the Replay application with nc, so we can observe (and
# participate in) the traffic between the server and the Replay app.

BASE_URL=$1

if [ "$BASE_URL" = "" ]; then
	echo Base URL required!
	exit
fi

source common.sh

# Send a register-replay action for port 50000 to the server
user_login RaceCoordinator doyourbest
sleep 1 && ( curl_post action.php "action=register-replay&port=50000" | check_success ) &

echo Respond to replay messages with an \"OK\"
nc -c -k -l 50000