#!/bin/bash

echo "********************************************************************************"
echo ""
echo "Setting up the host."
echo ""
echo "********************************************************************************"

cd setup_host
./basics.sh
./install-nvidia-drivers.sh
cd ..

echo "********************************************************************************"
echo ""
echo "Creating the docker container."
echo ""
echo "********************************************************************************"

./autonomous_sys_build_vm/install_ros.sh

echo "********************************************************************************"
echo ""
echo "All done. "
echo ""
echo "********************************************************************************"

