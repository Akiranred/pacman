b=1/1
while true
do
	i=$(ssh root@192.168.30.161 kubectl get deployment --no-headers | awk '{print $2}')
	if [ "$i" == "$b" ]
	then
		echo "Port-forwarding started and you can access application now"
		echo "Thank you for waiting"
		ssh root@192.168.30.161 kubectl port-forward deployment/pacman --address 0.0.0.0 80:80 &
		break
	else
		echo "Waiting for deployment ready"
	fi
done
