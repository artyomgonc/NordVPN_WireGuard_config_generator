# WireGuard config file generator for NordVPN
First, <a href="https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Raspberry-Pi-Elementary-OS-and-Linux-Mint.htm">install NordVPN app</a> in Linux console and log into NordVPN account (in case login fails try ```--legacy```).  
Then, install the WireGuard ulitily via ```sudo apt install wireguard```. 
Set protocol by ```nordvpn set technology nordlynx```.

Now, run the script using the following command: ```sudo ./get_conf #server_code#```. Choose server code from <a href="https://nordvpn.com/ovpn/">here</a>. Code ```al18``` corresponds to ```al18.nordvpn.com``` server. Script will generate a config file in the current directory.
