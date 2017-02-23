echo "Reproducing updates..."
IFS=$'\r\n' GLOBIGNORE='*' command eval  'LOG=($(cat /var/log/boot.log))'
for ((I=0; I<$DURATION * 2; I++)); do
  plymouth update --status="${LOG[$I]}";
  sleep 0.5;
  done;
