FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-devel
WORKDIR /srv
RUN pip install vllm==0.6.2 --no-cache-dir
ENV HF_TOKEN="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"
ENTRYPOINT ["python", "-m", "vllm.entrypoints.openai.api_server", \
            "--host", "0.0.0.0", "--port", "8080", \
            "--model", "meta-llama/Llama-3.2-3B", \
            "--dtype=half", \
            "--max_model_len", "6000", \
            "--kv-cache-dtype", "fp8", \
            "--tensor-parallel-size", "1", \
            "--cpu-offload-gb", "2.0", \
            "--gpu-memory-utilization", "0.95", \
            "--device", "cuda"]