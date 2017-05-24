## Today's objectives
* Create a VM at ~okeanos
* Set-up all required packages
 * An operatign system [Ubuntu Server 16.04 LTS]
 * MySQL server
 * PhpMyAdmin
 * Apache Tomcat
* Learn about **servers adrministration** (just the tip of the iceberg)


## Today's objective
<img src=media/okeanos_matrix.jpg width=900 height=400 /></br>
* The *blue* pill is not a choice...


## ~okeanos - an Ocean of resources!
* Connect to ~okeanos using the following link: 
		https://accounts.okeanos.grnet.gr/ui/
 * In the **LOGIN using** choose the **CLASSIC ACCOUNT** option
 * Fill in the same **email** and **password** that you used to create your account
* In order to join an availabe project of ~okeanos follow the link:
		https://accounts.okeanos.grnet.gr/ui/projects
 * and choose **Join** a project. In the **search** area, search for project
 	**bootcamp2.afdemp.gr** 
 	and ask to join
* Wait to be be accepted!


## Create your first Virtual Machine!
* At the [Cyclades](https://cyclades.okeanos.grnet.gr/ui/) User Interface, click the **New Machine+** orange button
<img src=media/okeanos_01_new_machine.png width=800 height=400 />
* There are 5 Steps in order to create a VM


## Creating a VM - Step 1 (Image)
* From the **Images** left list select the **System**
* From the **Available images** on the right list select the **Ubuntu Server LST** (Ubuntu Server 16.04.2 LTS), and click **next**
<br><img src=media/okeanos_02_ubuntu_server.png width=800 height=400 />


## Creating a VM - Step 2 (Flavor)
* Select, *2x* at the **CPU**, *4 GB* at the **RAM** and *20 GB* at the **Disk Size** 
* Click the green **next** button
<br><img src=media/okeanos_03_step2.png width=800 height=400 />


## Creating a VM - Step 3 (Networking)
* Be sure that you have an **Internet (public IPv4)** selected. 
* **Create new if necessary!**
<br><img src=media/okeanos_03_step3.png width=800 height=400 />



## Creating a VM - Step 4 (Personalize)
* Fill in a *Machine name* and click the green *next* button
* No other options are necessary to be filled
<br><img src=media/okeanos_03_step4.png width=800 height=400 />


## Creating a VM - Step 5 (Confirm)
* Be sure that the settings for your VM are correct and then click the orange **create machine** button
<br><img src=media/okeanos_03_step5.png width=800 height=400 />
* **Caution!!** Save the temporary password that is going to appear after clicking the *create machine*


## Storing the temporary password
* Save the temporary password that appeared on your screen. **If you lose this password you have to repeat all steps form the beginning!**
<br><img src=media/okeanos_03_stepFinal.png width=800 height=400 />


## It's alive! - details of your system
Congratulations, your system is up and running!
<img src=media/okeanos_03_stepFinal2.png width=500 height=250 />
* At the bottom of the page there is public IPv4 address from which you can connect from everywhere
* The default user created with the VM is **user** and the password the one that you saved at the end of Step 5


## Connect to your VM
For Windows, download and run [Putty](https://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)
<br><img src=media/okeanos_putty.png width=300 height=300 />
* Fill the **Host Name (or IP address)** field with ```user@your-vm-public-ipv4``` and the **Port** field with ```22``` 
* Press **Open** (and **Yes** if a *Putty Alert-Warning* window pops up)


## Connect to your VM (2)
* For Linux or MacOS devices, open a terminal and use the following command
		ssh user@your-vm-public-ipv4
* If your connection is declined and you received the following message
		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
* Execute the following command
		sudo ssh-keygen -R your-ipv4
* If your connection is successful then your terminal will control your VM until you use the following command
		logout 


## Am I connected?
* If the connection was successful you should see something similar to the following picture

<img src=media/okeanos_putty_connected.png width=650 height=400 />


## Security - our first priority!
* Let's change the password of the default **user**
* In your terminal type the following command (as shown in the screen-shot)
		passwd
* **Note** that filling the password is not visible on the screen!

<img src=media/okeanos_passwd.png width=450 height=200 />


## Update your system
* It's important to keep your system up to date with the latest updates installed. Update your system by executing the following command in your terminal:
		sudo apt-get -y update && sudo apt-get -y upgrade
* Enter your password if asked, and respond "Y" or "y" if asked the following
		Do you want to continue? [Y/n]
* Press **Enter** and wait until the installation is complete (it might take some time!)


## Update your system (2)
* Select the second option if you are promted to update the *Grub*
		Keep the local version currently installed

<img src=media/grubUpdate1.png width=700 height=400 />


## Update your system (3)
* Select the first option in the *Configuring grup-pc* screen
		/dev/vda

<img src=media/grubUpdate2.png width=700 height=400 />


## MySQL server
* In order to install the latest MySQL server in your system execute the following command in your terminal:
		sudo apt-get -y install mysql-server
* Enter a **password** when asked (see the following figure). <!-- Using the same as your **user** might help you remember it easier.  -->

<img src=media/okeanos_mysql.png width=700 height=350 />


## Install a Web-Server and a MySQL web-manager
* Execute the following commands in your terminal:
 * First install the **Apache Web-Server**
		sudo apt-get -y install apache2
 * then install **PHP** 
		sudo apt-get -y install php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0 libapache2-mod-php7.0
* finally, install **phpMyAdmin**
		sudo apt-get -y install phpmyadmin


## Configure phpMyAdmin
* In the next screen select the **apache2** option. 
* **!!Important!!** Press **space** on your **apache2** selection. Only if an asterisk (```*```) is marked on the left of the **apache2** proceed with **ok**

<img src=media/okeanos_phpMyAdmin.png width=320 height=400 /><img src=media/asterisk.png width=400 height=300 />


## Configure phpMyAdmin (2)
* Select **Yes** if you are prompted with a pink **Configuring phphmyadmin** screen
* When asked, enter your MySQL *root* password in the corresponding screen


## Connect to your MySQL server remotely
* Access your MySQL server through a Web-Browser at 
		http://your-ipv4/phpmyadmin/
* Enter your MySQL *root* credentials in the following form, ang click **Go**

<img src=media/okeanos_phpMyAdmin3.png width=300 height=250 />
* If you see raw code (instead of the login page) try the following (next slide)


## Connect to your MySQL server remotely (2)
* In a terminal execute the following
		sudo nano /etc/apache2/apache2.conf
* Add the following line at the end of the file
		Include /etc/phpmyadmin/apache.conf
* Press **CTLR + o** to save the changes, **Enter** to verify, and **CTRL + x** to exit the edit mode
* Restart the Apache server
		sudo systemctl restart apache2
* reload the **phpMyAdmin** page


## Download Java JDK & Apache Tomcat
* First we need to install the latest Java Development Kit. Execute the following command in the terminal
		sudo apt-get -y install default-jdk
* Create a Tomcat group and user for security purpose
		sudo groupadd tomcat;
		sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
* Download Tomcat 8.5 from the following link (it's curl -Omicron! not zero)
		curl -O http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.tar.gz


## Install Apache Tomcat
* Create a directory that will store the apache tomcat and unzip the tar.gz that you downloaded earlier in this directory. Execute the following commands
		sudo mkdir /opt/tomcat;
		sudo tar xzvf apache-tomcat-8.5.15.tar.gz -C /opt/tomcat --strip-components=1
* Set-up the permissions for Tomcat. Execute the following commands
		cd /opt/tomcat;
		sudo chgrp -R tomcat /opt/tomcat;
		sudo chmod -R g+r conf;
		sudo chmod g+x conf;
		sudo chown -R tomcat webapps/ work/ temp/ logs/


## Configure Apache Tomcat
* In your terminal execute the following command to edit the **tomcat.service** file
		sudo nano /etc/systemd/system/tomcat.service
* Copy-paste the following text in the file (erplace the existing)

```
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
```


## Configure Apache Tomcat (2)
* Press **CTLR + o** to save the changes, **Enter** to verify, and **CTRL + x** to exit
* Allow traffic to port 8080 used by Apache Tomcat by executing the following command
		sudo ufw allow 8080
* Restart Tomcat and set to open on start-up
		sudo systemctl stop tomcat;
		sudo systemctl start tomcat;
		sudo systemctl enable tomcat;
* Check if Tomcat is running and listening to the 8080 port. In a web-browser open:
		http://your-ipv4:8080
* If everything is fine you should see a web-page like the one in the next slide!


## Configure Apache Tomcat (3)
<br><img src=media/okeanos_tomcat.png width=800 height=400 />


## Configure Apache Tomcat (4)
* In order to access the **manager-gui** and the **admin-gui** we need to provide credentials at the **tomcat-users** xml file:
		sudo nano /opt/tomcat/conf/tomcat-users.xml
* Add the following line (with your own "admin" and "password" credentials)
```xml
<user username="admin" password="password" roles="manager-gui,admin-gui"/>
```
after the (replace the green line)
		<tomcat-users xmlns="http://tomcat.apache.org/xml"
		              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
		              version="1.0">
		        <!-- ADD YOUR LINE HERE -->
* Press **CTLR + o** to save the changes, **Enter** to verify, and **CTRL + x** to exit


## Configure Apache Tomcat (5)
* In order to allow external access to the **manager-gui** and the **admin-gui** we should edit the **context** xml file, by executing the following command:
		sudo nano /opt/tomcat/webapps/manager/META-INF/context.xml
* Navigate to the file until you find the following entry
		<Context antiResourceLocking="false" privileged="true" >
		<Valve className="org.apache.catalina.valves.RemoteAddrValve"
		         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
		</Context>
* Comment the <Valve className... /> element by adding ```<!--``` at the beginning and ```-->``` at the end, like:
		<Context antiResourceLocking="false" privileged="true" >
		<!--<Valve className="org.apache.catalina.valves.RemoteAddrValve"
		         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />-->
		</Context>


## Configure Apache Tomcat (6)
* Press **CTLR + o** to save the changes, **Enter** to verify, and **CTRL + x** to exit
* Make the same changes as in the previous file to the following **context** xml file by executing the command
		sudo nano /opt/tomcat/webapps/host-manager/META-INF/context.xml
* Restart tomcat 
``` 
sudo systemctl restart tomcat
```


## Testing Apache Tomcat
* Access your tomcat web-api from a web browser from the following link ```http://your-ipv4:8080```
* Make sure that **Manager App** and **Host Manager** pages are accessible
* When asked for credentials, provide those that you selected in slide "Configure Apache Tomcat (4)"

<img src=media/okeanos_tomcat_creds.png width=700 height=300 />


## Export your local database
* Open the MySQL Workbench, connect to your local database and then go to the Menu **Server-->Data Export**
 
<img src=media/okeanosMySqlWorkbench.png width=900 height=500 />


## Export your local database (2)
* In the **Objects Selection** tab, select the schema that you want to Export
* Be sure that the *Include Create Schema* check box at the bottom is checked and press **Start Export**
* Click "Continue Anyway" if you get a **mysqldump Version Mismatch** Warning


## Upload your database
* Open the PhpMyAdmin of your VM from a browser
		http://you-ipv4/phpmyadmin/
* Enter your MySQL credentials and click **go**
* From the top-menu select **Import** like in the screen-shot presented in the next slide


## Upload your database (2)
<img src=media/okeanos_phpmyadmin_import.png width=900 height=500 />


## Upload your database (3)
* Select **Choose file**, navigate to the *dump* file that you exported earlier with MySQL Workbench and select the **dump** file and then click **Go** at the end of the page

<img src=media/okeanos_phpmyadmin_import2.png width=650 height=350 />


## Export your Java Web Application
* (step 1) be sure that the database credentials in your Java code are the correct for your MySQL at ~okeanos
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/the_db_name", 
		"root", "your_password");

<img src=media/okeanos_eclipse_db_connection_creds.png width=650 height=400 />


## Export your Java Web Application (2)
* Save all changed files and "Right-click" on the **Project-->Export-->WAR file**
* Be sure that (1) is saved in a location that you remember and (2) is optimized for Tomcat 8.0
* Click **Finish**
<img src=media/okeanos_eclipse_export_war.png width=450 height=400 />


## Deploy your Java Web Application
* go to 
		http://your-ipv4:8080/manager/html
* Enter the credentials that you declared for the Tomcat management if asked
* In the **WAR file to deploy** sub-section of the **Deploy** section click the **Choose File** and select the "CodingBootcampJSPExercise1.war" that you exported earlier on your Desktop
* Then click **Deploy**
* Soon the page should be refreshed and at the top your Servlet should be visible! (Check the next screen-shot)


## Run your Java-Web Application
<img src=media/okeanos_tomcat_deploy.png width=650 height=350 />
* Click the **/CodingBootcampJSPExercise1** and check if your web-application is alive!
* You can *Stop*, *Reload*, *Undeploy* web-applications


## Run your Java-Web Application (2)
* In order to redeploy your web-application, first *Undeploy* and then follow the **Deploy the WAR file on the remote server** instruction from the beginning. 


## Hands-on! Exercise
* Port your personal assignment in the Remote Server that you just set up!
 * **Export** your local database in a dump file and **import** it to your remote mysql server through *phpMyAdmin* UI
 * **Export** your Java-web-application to a WAR file and **deploy** it to the remote apache tomcat server through the *Tomcat Web Application Manager*  
 * **Test** the functionalities of your web-app!


## Further reading - dive deeper! 
* Basic Linux commands ([link](https://www.pcsteps.com/5010-basic-linux-commands-terminal/))
* The complete Bash command list ([link](http://ss64.com/bash/))
* Linux *users*, *groups* and *permissions* ([link](https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-permissions))
* A basic MySQL-server tutorial ([link](https://www.digitalocean.com/community/tutorials/a-basic-mysql-tutorial))
* How to make your Linux server more secure ([link](https://www.linux.com/learn/how-make-your-linux-server-more-secure))
* 20 Linux Server Hardening Security Tips (advanced) ([link](https://www.cyberciti.biz/tips/linux-security.html))