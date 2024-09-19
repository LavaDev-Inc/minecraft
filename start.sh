#!/bin/bash

# Display a title and a separator
echo -e "\n\033[1;32mLavaDev - Java 17 and Minecraft Server Installer\033[0m"
echo "-------------------------------------------"

# Download and extract Java 17
echo -e "\n\033[1;34mDownloading and extracting Java 17...\033[0m"
wget https://download.java.net/java/GA/jdk17/0d483333a00540d886bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz -O openjdk-17_linux-x64_bin.tar.gz
tar -xzf openjdk-17_linux-x64_bin.tar.gz

# Set environment variables
echo -e "\n\033[1;34mSetting environment variables...\033[0m"
export JAVA_HOME=$(pwd)/jdk-17
export PATH=$JAVA_HOME/bin:$PATH

# Update the system alternatives
echo -e "\n\033[1;34mUpdating system alternatives...\033[0m"
sudo update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1
sudo update-alternatives --set java $JAVA_HOME/bin/java
sudo update-alternatives --set javac $JAVA_HOME/bin/javac

# Download Minecraft server JAR
echo -e "\n\033[1;34mDownloading Minecraft server JAR...\033[0m"
SERVER_JAR_LINK="https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/365/downloads/paper-1.20.4-365.jar"
wget "$SERVER_JAR_LINK" -O server.jar

# Accept the Minecraft EULA
echo -e "\n\033[1;34mAccepting Minecraft EULA...\033[0m"
echo "eula=true" > eula.txt

# Modify server.properties to set online-mode to false
echo -e "\n\033[1;34mConfiguring server.properties...\033[0m"
echo "online-mode=false" > server.properties

# Launch the Minecraft server
echo -e "\n\033[1;34mLaunching Minecraft server...\033[0m"
java -Xmx1G -Xms1G -jar server.jar nogui