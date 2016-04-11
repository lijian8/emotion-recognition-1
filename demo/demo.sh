#!/bin/sh

if [ -z "$1" ] ; then
  echo "Enter the image # in private-test-images dir as argument!"
  exit 1
fi

echo "[STEP:1] Backup the original test_batch.bin file ..."
mv /tmp/fer2013_data/fer2013-batches-bin/test_batch.bin /tmp/fer2013_data/fer2013-batches-bin/backup_test_batch.bin

echo "\n[STEP:2] Generate a test_batch.bin file for the 1 selected image ..."
ruby generate-1img-testbatch.rb $1

echo "\n[STEP:3] Copy this new test_batch.bin file into /tmp/fer_2013 dir ..."
cp private-test-1.bin /tmp/fer2013_data/fer2013-batches-bin/test_batch.bin

echo "\n[STEP:4] Execute the python code to evaluate the image ..."
python ../fer2013_eval_bc.py 2> /dev/null

echo "\n[STEP:5] Restore back the original test_batch.bin file ..."
rm -rf /tmp/fer2013_data/fer2013-batches-bin/test_batch.bin
mv /tmp/fer2013_data/fer2013-batches-bin/backup_test_batch.bin /tmp/fer2013_data/fer2013-batches-bin/test_batch.bin

echo "\nDONE!"
