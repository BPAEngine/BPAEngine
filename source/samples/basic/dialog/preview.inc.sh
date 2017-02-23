QUESTIONS=("What is your name?"
           "How old are you?"
           "How many kids do you have?")
IFS=""
for question in ${QUESTIONS[*]}; do
  echo "Asking a question: ${question}"
  plymouth ask-question --prompt="${question}"
  sleep 1
done
plymouth unpause-progress
