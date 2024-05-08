BEGIN {
	sendPkt =0
	recvPkt=0
	forwardPkt=0
}

{
packet=$19
event = $1
if(event =="s" && packet =="AGT") {
	sendPkt++;
}

if(event =="r" && packet == "AGT") {
	recvPkt++;
}

if(event =="f" && packet == "RTR") {
	fowardPkt++;
}

}

END {
	printf ("The send packet are %d :\n ", sendPkt);
	printf ("The Received packet are :%d \n ", recvPkt);
	printf ("The Forwarded packet are: %d \n ", forwardPkt);
	printf (" packet Delivery Ratio :%f \n ", (recvPkt/sendPkt));
}
