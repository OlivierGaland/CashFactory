# CashFactory
Lightweight docker image stack (using docker-compose) running many passive income applications (proxy and bandwidth share) : Honeygain , EarnApp , IPRoyal Pawns , PacketStream , Peer2Profit . 
Expected raw revenue is around $30-$40 per month (Jan 2022 estimation), 24/7 power cost to deduce.

Those tools are using your computer to route traffic, I'm personnally using it running on two different ips (my home connection and my 4G backup connection). Those kind of ip are working well, but I believe this won't be the case on some ips (like vpn for instance). Keep in mind if you have several ip, you can run a stack on each ip to increase revenue, but running several time this stack on same ip should not give you more (and some tools supported won't allow it).

Installation (you can open www/index.html file to have a more interactive install section) :

- Install linux OS on your host machine (a low consuming and cheap linux compatible box if you want a dedicated computer) or you can use an already set linux server running 24/7 as this software is very low ressources consuming. 
- Download CashFactory latest release in $HOME directory : cd $HOME, then : wget https://github.com/OlivierGaland/CashFactory/archive/refs/tags/v1.0.tar.gz , then uncompress : tar -xvf v1.0.tar.gz
- Edit created directory name to CashFactory and cd inside : mv CashFactory-1.0 CashFactory ; cd CashFactory
- Run install script (Need to run it as sudo -supervisor-) : sudo ./setup.sh
- Create an account for the app(s) you want to use (7 app supported : see Registering section below)
- Update .env file with the account details (put your account informations in defined environment variables)
- (Optional) If you don't want to use all app : comment or delete the corresponding section in docker-compose.yml
- Special procedure for Earnapp : you will need to add your device in the dashboard, to get the id use Portainer to open "exec console" on the Earnapp container (or through ssh enter: docker exec -it cashfactory_Earnapp_1 sh) and type : earnapp showid, to add the device you need to enter this link in your browser https://earnapp.com/r/your-id replacing "your-id" with the id you found earlier with show-id.
- Special procedure for Bitping : you will need to enter manually credential to initialize (TODO : easiest way ?), in $HOME/CashFactory type : sudo docker run -it -v $HOME/CashFactory/data/bitping/:/root/.bitping bitping/bitping-node:latest , then enter your credential , once this is done CTL-C to end container

Registering section and supported cash earning apps :

This is the list of applications supported (or to be supported) by this docker stack.
Please, as this software is free, consider using the register link below to create your account for each app, this will add you in my referral list and I will get a reward from this company.
This won't cost you anything and motivate me to maintain this software by adding new applications and providing support to customers.

- Supported [Register Earnapp](https://earnapp.com/i/p34wpf4)
- Supported [Register Honeygain](https://r.honeygain.me/GALAN2C368)
- Supported [Register Peer2profit](https://p2pr.me/164081436561ccd71d961f2)
- Supported [Register IPRoyal Pawns](https://iproyal.com/pawns?r=455236)
- Supported [Register Packetstream](https://packetstream.io/?psr=32GQ)
- Supported [Register Traffmonetizer](https://traffmonetizer.com/?aff=52057)
- Supported [Register Bitping](https://app.bitping.com?r=XLr65_of) : This tool only pay in crypto (BitcoinSV)
- Not yet supported [Register Spider Income](https://income.spider.dev/r/galan21l65) : linux version under dev (prerequisite for CashFactory implementation). Warning : I get no income on this one since a few monthes

Start/stop procedure :

- Start stack : sudo docker-compose up -d (in CashFactory directory)
- Stop stack : sudo docker-compose down (in CashFactory directory)

Day to day management :

- Bookmarks for applications is available on a web interface on host (http server port 80), if you install it on a machine already using port 80 (like a NAS for instance) you must change the Webserver port in docker-compose.yaml from "80:80" to "your_custom_port:80" or the entire stack will fail (as dependent on Webserver)
- Docker management for container and applications command/log is available on a web interface (Portainer) on host (http server port 9000). A basic knowledge of docker and docker-compose could also be helpfull (how to stop/star specific container, images policy, ssh on a container ...)

License : 

- This product is free for use and may be copied and distributed freely in its original form.
- Personal modifications are allowed for your personal use, but modified copy are not allowed for distribution.

Compatibility :

- Currently tested and running on a NUC computer with Ubuntu 20.04 server / docker 20.10.12 / docker-compose 1.25.0 ; hardware is N3150 celeron processor (4% load average), 8Gb memory (450 Mb used) and 120Gb disk (10 Gb used) 
- Should be working on any x86/amd64 computer running Linux+docker with a very basic setup (low end CPU / 1Gb memory / 20Gb disk / 10Mb ethernet adapter)   
- Other architecture not yet confirmed to be working (Windows / Mac)
- Confirmed working on ubuntu 20.04 server, 22.04 server 
- Confirmed actually not working on Raspberry
- Confirmed working on Synology NAS using VM (ubuntu 20.04 installed)
- You may experience issues with earnapp if using debian : earnapp container exiting with error 255 (prefer using ubuntu 20.04)

TODO list :

- Add new applications when they appear (should be dockerizable to be elligible)
- Do a compatibility list based on user feedback / solve compatibility issue if possible
- Beta version : solve coming bugs

Contact :

- bugs/requests : this github page (section : Issue or Discussion)
- email : galand.olivier.david@gmail.com
 
Web interface with quick links to dashboards on port 80 (uhttpd server) and Web interface on port 9000 (Portainer container) below :

![image](https://user-images.githubusercontent.com/26048157/147865719-519d33ce-7da2-4fa8-8a37-0d7254696fd5.png)
![image](https://user-images.githubusercontent.com/26048157/147866347-595bfbad-fedf-48a1-8764-e52b6e06bfbe.png)
