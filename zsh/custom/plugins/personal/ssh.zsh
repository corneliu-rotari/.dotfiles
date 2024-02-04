scd() {
	ssh -t "$1" "cd /mnt/app/bin ; exec \$SHELL -l"
}

openstack() {
   ssh -J "corneliu.rotari@fep.grid.pub.ro" "student@$1"
}
