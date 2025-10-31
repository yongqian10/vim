#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get upgrade

# install python3 build dependencies
# #install qt build dependencies
#   sudo apt install bison build-essential flex git gperf gyp libxext-dev libasound2-dev libavcodec-dev libavformat-dev libavutil-dev libcups2-dev libdbus-1-dev libdrm-dev libegl1-mesa-dev libevent-dev libfontconfig1-dev libfreetype6-dev libjsoncpp-dev libminizip-dev libnss3-dev libopus-dev libpci-dev libprotobuf-dev libpulse-dev libre2-dev libsnappy-dev libsrtp2-dev libssl-dev libudev-dev libvpx-dev libwebp-dev libx11-dev libx11-xcb-dev libxcb-glx0-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-shm0-dev libxcb-sync0-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb1-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxfixes-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev libxrandr-dev libxkbfile-dev libxrender-dev libxss-dev libxtst-dev ninja-build nodejs protobuf-compiler python python2
#   sudo apt install libxshmfence-dev

# install protoc build dependencies
#   sudo apt install autoconf libtool

# for coc
#   sudo apt install clangd

sudo apt-get install csh
sudo apt-get install tcsh

sudo useradd -m -s /usr/bin/tcsh -G sudo yongqian
sudo useradd -m -s /usr/bin/tcsh -G sudo sorabh
sudo useradd -m -s /usr/bin/tcsh -G sudo phuikei

sudo usermod -a -G rd yongqian
sudo usermod -a -G rd sorabh
sudo usermod -a -G rd phuikei

sudo passwd yongqian 12341234
sudo passwd sorabh 12341234
sudo passwd phuikei 12341234

sudo apt install xfce4 xfce4-goodies
sudo apt install tightvncserver
sudo apt install xorg dbus-x11 x11-xserver-utils xrdp xfonts-base autocutsel xfonts-75dpi xfonts-100dpi

rm -r ~/.vnc
mkdir ~/.vnc
echo -e "#!/bin/bash\nxrdb $HOME/.Xresources\nstartxfce4 &"  >  ~/.vnc/xstartup

sudo chmod +x ~/.vnc/xstartup
vncserver

sudo rm -rf /home/yongqian/.vnc
sudo rm -rf /home/sorabh/.vnc
sudo rm -rf /home/phuikei/.vnc

sudo cp -r ~/.vnc /home/yongqian
sudo cp -r ~/.vnc /home/sorabh
sudo cp -r ~/.vnc /home/phuikei

sudo chown -R yongqian:rd /home/yongqian/.vnc
sudo chown -R sorabh:rd /home/sorabh/.vnc
sudo chown -R phuikei:rd /home/phuikei/.vnc

echo -e "[Unit]\n\
Description=Start TightVNC server at startup\n\
After=syslog.target network.target\n\n\
[Service]\n\
Type=forking\n\
User=yongqian\n\
Group=rd\n\
WorkingDirectory=/home/yongqian\n\n\
PIDFile=/home/yongqian/.vnc%H:%i.pid\n\
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1\n\
ExecStart=/usr/bin/vncserver :%i -depth 24 -geometry 1920x1200 -localhost\n\
ExecStop=/usr/bin/vncserver -kill :%i\n\n\
[Install]\n\
WantedBy=multi-user.target"  >  yongqianvncserver@.service

sudo mv yongqianvncserver@.service /etc/systemd/system

echo -e "[Unit]\n\
Description=Start TightVNC server at startup\n\
After=syslog.target network.target\n\n\
[Service]\n\
Type=forking\n\
User=sorabh\n\
Group=rd\n\
WorkingDirectory=/home/sorabh\n\n\
PIDFile=/home/sorabh/.vnc%H:%i.pid\n\
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1\n\
ExecStart=/usr/bin/vncserver :%i -depth 24 -geometry 1920x1200 -localhost\n\
ExecStop=/usr/bin/vncserver -kill :%i\n\n\
[Install]\n\
WantedBy=multi-user.target"  >  sorabhvncserver@.service

sudo mv sorabhvncserver@.service /etc/systemd/system

echo -e "[Unit]\n\
Description=Start TightVNC server at startup\n\
After=syslog.target network.target\n\n\
[Service]\n\
Type=forking\n\
User=phuikei\n\
Group=rd\n\
WorkingDirectory=/home/phuikei\n\n\
PIDFile=/home/phuikei/.vnc%H:%i.pid\n\
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1\n\
ExecStart=/usr/bin/vncserver :%i -depth 24 -geometry 1920x1200 -localhost\n\
ExecStop=/usr/bin/vncserver -kill :%i\n\n\
[Install]\n\
WantedBy=multi-user.target"  >  phuikeivncserver@.service

sudo mv phuikeivncserver@.service /etc/systemd/system

sudo systemctl daemon-reload
sudo systemctl enable yongqianvncserver@12.service
sudo systemctl start yongqianvncserver@12
sudo systemctl status yongqianvncserver@12

sudo systemctl enable sorabhvncserver@16.service
sudo systemctl start sorabhvncserver@16
sudo systemctl status sorabhvncserver@16

sudo systemctl enable phuikeivncserver@18.service
sudo systemctl start phuikeivncserver@18
sudo systemctl status phuikeivncserver@18
