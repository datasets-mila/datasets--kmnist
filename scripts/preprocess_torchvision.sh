#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

_SNAME=$(basename "$0")

source scripts/utils.sh echo -n

mkdir -p logs/

python3 -m pip install -r scripts/requirements_torchvision.txt

# Move data files to KMNIST/raw as it is where torchvision looks for KMNIST raw files
mkdir -p KMNIST/raw
git mv t10k-*.gz train-*.gz KMNIST/raw
git-annex fsck --fast KMNIST/raw

python3 scripts/preprocess_torchvision.py \
	1>>logs/${_SNAME}.out_$$ 2>>logs/${_SNAME}.err_$$

# Delete raw files
git rm -rf KMNIST/raw md5sums
rm -r KMNIST/raw

git-annex add -c annex.largefiles=anything KMNIST
