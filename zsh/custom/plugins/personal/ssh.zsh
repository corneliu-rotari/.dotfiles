scd() {
	ssh -t "$1" "cd /mnt/app/bin ; exec \$SHELL -l"
}

sc()
{
  sshpass -e ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oHostKeyAlgorithms=+ssh-rsa "root@$1" 
}

openstack() {
   ssh -J "corneliu.rotari@fep.grid.pub.ro" "student@$1"
}
