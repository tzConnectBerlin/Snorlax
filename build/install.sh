#!/bin/bash

lazy_folder="./bin/lazy"
hex_files=${lazy_folder}/*.hex

echo "Installing contract..."
tezos-client originate contract snorlax transferring 0 from alice \
	running bin/main.tz --init "`cat bin/storage.tz`" --burn-cap 0.5 --force

for f in ${hex_files}
do
	filename=${f##*/}
	filename_without_extension=${filename%.[^.]*}
	lambda_name=${filename_without_extension#*.}
	echo "Installing ${filename} as ${lambda_name}..."
	tezos-client transfer 0 from alice to snorlax --burn-cap 0.5 \
		--entrypoint installLambda --arg \(Pair\ \"${lambda_name}\"\ `cat ${f}`\)
done

echo "Sealing contract..."
tezos-client transfer 0 from alice to snorlax --burn-cap 0.5 --entrypoint sealContract
