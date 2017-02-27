STEP_DURATION=$(($DURATION / 3))

sleep $STEP_DURATION

plymouth change-mode --shutdown
sleep $STEP_DURATION

plymouth change-mode --updates
sleep $STEP_DURATION
