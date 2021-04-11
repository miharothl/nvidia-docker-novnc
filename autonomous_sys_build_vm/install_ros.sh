# noVNC + TurboVNC + VirtualGL
# Useful links for the software we are using:
# http://novnc.com
# https://turbovnc.org
# https://virtualgl.org

#apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#    ca-certificates \
#    curl wget emacs vim less sudo lsof net-tools git htop gedit gedit-plugins \
#    unzip zip psmisc xz-utils \
#    libglib2.0-0 libxext6 libsm6 libxrender1 \
#    libpython-dev libsuitesparse-dev libeigen3-dev libsdl1.2-dev doxygen graphviz libignition-math2-dev \
#    gcc \
#    libc6-dev \
#    lubuntu-desktop xvfb xterm terminator zenity mesa-utils \
#    make cmake \
#    python \
#    python-numpy \
#    x11-xkb-utils \
#    xauth \
#    xfonts-base \
#    xkb-data && \
#    rm -rf /var/lib/apt/lists/*
#
## Install miniconda
#cd /tmp && \
#    curl -fsSL -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
#    chmod u+x Miniconda3-latest-Linux-x86_64.sh && \
#    ./Miniconda3-latest-Linux-x86_64.sh -b

## Install desktop file for this user
#mkdir -p /root/Desktop
#cp ./firefox.desktop_applications /usr/share/applications/firefox.desktop
#cp ./terminator.desktop /root/Desktop
#mkdir -p /root/.config/terminator
#cp ./terminator_config /root/.config/terminator/config
#cp ./firefox.desktop /root/Desktop
#cp ./galculator.desktop /root/Desktop
#cp ./htop.desktop /root/Desktop
#cp ./self.pem /root/self.pem
#
## Precede bash on all new terminator shells with vglrun so that 3d graphics apps will use the GPU
#perl -pi -e 's/^Exec=terminator$/Exec=terminator -e "vglrun bash"/g' /usr/share/applications/terminator.desktop

# Install udacity desktop background (YMMV)
#cp ./background.png /usr/share/lubuntu/wallpapers/1604-lubuntu-default-wallpaper.png

#RUN mkdir -p /root/.vnc
#COPY ./xstartup.turbovnc /root/.vnc/xstartup.turbovnc
#RUN chmod a+x /root/.vnc/xstartup.turbovnc

# Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

apt-get update -y && \
    apt-get install -y ros-kinetic-desktop-full

apt-get install -y ros-kinetic-navigation && \
    apt-get install -y ros-kinetic-roscpp && \
    apt-get install -y ros-kinetic-joy && \
    apt-get install -y ros-kinetic-kobuki-safety-controller && \
    apt-get install -y ros-kinetic-yocs-velocity-smoother && \
    apt-get install -y ros-kinetic-turtlebot-bringup && \
    apt-get install -y ros-kinetic-geometry-msgs && \
    apt-get install -y ros-kinetic-yocs-cmd-vel-mux && \
    apt-get install -y ros-kinetic-diagnostic-aggregator && \
    apt-get install -y ros-kinetic-depthimage-to-laserscan && \
    apt-get install -y ros-kinetic-gazebo-ros && \
    apt-get install -y ros-kinetic-kobuki-gazebo-plugins && \
    apt-get install -y ros-kinetic-robot-pose-ekf && \
    apt-get install -y ros-kinetic-robot-state-publisher && \
    apt-get install -y ros-kinetic-turtlebot-description && \
    apt-get install -y ros-kinetic-turtlebot-navigation && \
    apt-get install -y ros-kinetic-xacro

apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
apt install -y python-rosdep

rosdep init
rosdep update

# Upgrade gazebo to gazebo v7
sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
apt-get update -y && apt-get install -y gazebo7

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

echo 'export LC_ALL="C"' >> ~/.bashrc


## Add miniconda to root's PATH
echo "export PATH=/root/miniconda3:$PATH" >> /root/.bashrc
#
# Create some useful default aliases
printf "%s\n" \
           "alias cp=\"cp -i\"" \
           "alias mv=\"mv -i\"" \
           "alias rm=\"rm -i\"" >> /root/.bash_aliases

