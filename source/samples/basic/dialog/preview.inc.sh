QUESTIONS=("What is your name?"
           "How old are you?"
           "How many kids do you have?")
IFS=""
for question in ${QUESTIONS[*]}; do
  sleep 1
  echo "Asking a question: ${question}"
  plymouth ask-question --prompt="${question}"
done
plymouth unpause-progress
