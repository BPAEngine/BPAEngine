QUESTIONS=("What is your name?"
           "Do you like this feature?")
IFS=""
for question in ${QUESTIONS[*]}; do
  sleep 1
  echo "Asking a question: ${question}"
  plymouth ask-question --prompt="${question}"
done

plymouth change-mode --shutdown

for question in ${QUESTIONS[*]}; do
  sleep 1
  echo "Asking a question: ${question}"
  plymouth ask-question --prompt="${question}"
done

plymouth unpause-progress
