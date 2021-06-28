!/bin/bash
                               
sudo apt update 1>/dev/null 2>&1;
sudo apt install torsocks privoxy tor curl obfs4proxy proxychains4 feh;
sudo systemctl enable tor privoxy;
sudo systemctl start tor;      
sudo systemctl start privoxy;  
sudo cp /etc/privoxy/config /home/$(logname)/config;
sudo cp /etc/privoxy/config /root/config;
echo "forward-socks5t   /               127.0.0.1:9050 ." >> /etc/privoxy/config;
echo "forward-socks5t   /               127.0.0.1:9050 ." >> /home/$(logname)/config;
echo "forward-socks5t   /               127.0.0.1:9050 ." >> /root/config;
sudo curl -s "https://raw.githubusercontent.com/unprogramable/TorBridge/master/tbcli-installer"|sudo bash;
echo "Get And Set Tor new Bridges...";
proxychains tbcli -a;
echo "Use Tor Proxy On Cli Shell?"
read answer
answer=${answer:-'y'}
case $answer in
        y|Y)
                clear
                "Starting Tor Cli proxy🤘🤘..";
                echo "export http_proxy="http://127.0.0.1:8118" >> /etc/profile.d/proxy.sh;
                echo "export https_proxy="https://127.0.0.1:8118" >> /etc/profile.d/proxy.sh;
                echo "Done! :)";
                ;;
        n|N)
                echo "Just Set Your System/Browser/App Proxy to 127.0.0.1:8118 And Rock🤘🤘";
                ;;

echo "All Done :)";
