container_name=$1

cd ..
CUDA_VISIBLE_DEVICES='0'

docker run --gpus '"'device=$CUDA_VISIBLE_DEVICES'"' --ipc=host --rm -it \
    --name $container_name \
    -e NVIDIA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES \
    --mount src=$(pwd),dst=/stable_diffusion,type=bind \
    -w /stable_diffusion \
    -p 8888:8888 \
    litcoderr/sd:latest \
    bash -c "bash" \
