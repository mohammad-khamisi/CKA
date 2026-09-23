apt update
apt install -y open-iscsi nfs-common
systemctl enable --now iscsid
systemctl status iscsid --no-pager
