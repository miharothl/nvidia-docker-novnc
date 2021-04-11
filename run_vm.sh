/opt/TurboVNC/bin/vncserver -kill :1
sleep 1
#/opt/TurboVNC/bin/vncserver


touch ~/.Xauthority
xauth generate :0 . trusted
/opt/TurboVNC/bin/vncserver -SecurityTypes None

# Start NoVNC. self.pem is a self-signed cert.
if [ $? -eq 0 ] ; then
    /opt/noVNC/utils/launch.sh --vnc localhost:5901 --cert /root/self.pem --listen 40001;
fi
