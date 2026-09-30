#----------------------------compaction-----------------------------------
# get the current revision number
REV=$(etcdctl endpoint status -w json | jq -r '.[0].Status.header.revision')

# delete all history older than this revision
etcdctl compact $REV

------------------------------Defragmentation---------------------------------
# ONE member at a time: followers first, leader last
etcdctl --endpoints=https://10.0.1.11:2379 defrag
etcdctl endpoint status --cluster -w table     # check DB SIZE went down, member healthy
etcdctl --endpoints=https://10.0.1.12:2379 defrag
etcdctl --endpoints=https://10.0.1.10:2379 defrag   # leader last

# then remove the alarm
etcdctl alarm disarm
