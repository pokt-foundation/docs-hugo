
ipfs init --profile server

ipfs daemon &

#cd app

hugo

cd public

HASH=$(ipfs add -q -r . | tail -1)

ipfs name publish $HASH
