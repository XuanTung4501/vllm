curl http://localhost:8080/v1/chat/completions \
-H "Content-Type: application/json" \
-d '{
"model": "meta-llama/Llama-3.2-3B",
"messages": [
{"role": "system", "content": "You are a helpful assistant."},
]
}'