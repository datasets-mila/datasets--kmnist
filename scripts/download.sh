#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

for file_url in \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/train-images-idx3-ubyte.gz train-images-idx3-ubyte.gz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/train-labels-idx1-ubyte.gz train-labels-idx1-ubyte.gz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/t10k-images-idx3-ubyte.gz t10k-images-idx3-ubyte.gz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/t10k-labels-idx1-ubyte.gz t10k-labels-idx1-ubyte.gz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/kmnist-train-imgs.npz kmnist-train-imgs.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/kmnist-train-labels.npz kmnist-train-labels.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/kmnist-test-imgs.npz kmnist-test-imgs.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/kmnist-test-labels.npz kmnist-test-labels.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/kmnist/kmnist_classmap.csv kmnist_classmap.csv" \
	"http://codh.rois.ac.jp/kmnist/dataset/k49/k49-train-imgs.npz k49-train-imgs.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/k49/k49-train-labels.npz k49-train-labels.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/k49/k49-test-imgs.npz k49-test-imgs.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/k49/k49-test-labels.npz k49-test-labels.npz" \
	"http://codh.rois.ac.jp/kmnist/dataset/k49/k49_classmap.csv k49_classmap.csv"
do
	echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

md5sum -c md5sums
md5sum *.csv *.npz >> md5sums
