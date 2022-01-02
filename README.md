# CashFactory
Lightweight docker image running many passive income applications (proxy and bandwidth share) : Honeygain , EarnApp , IPRoyal Pawns , PacketStream , Peer2Profit . 
Expected raw revenue is around $30-$40 per month (Jan 2022 estimation), 24/7 power cost to deduce.

Installation (you can open www/index.html file to have a more interactive install section) :

- Install linux OS on your host machine (a low consuming and cheap linux compatible box) 
- Download CashFactory project from github : git clone https://github.com/OlivierGaland/CashFactory.git
- Go into created directory : cd CashFactory
- Run install script (Need to run it as sudo -supervisor-) : sudo ./setup.sh
- Create an account for the app you want to use (5 app supported : see Registering section below)
- Update .env file with the account details
- (Optional) If you don't want to use all app : comment or delete the corresponding section in docker-compose.yml
- Special procedure for Earnapp : you will need to add your device id in the dashboard, to get the id use Portainer to open "exec console" on the Earnapp container and type : earnapp showid

Registering section and supported cash earning apps :

This is the list of applications supported (or to be supported) by this docker stack.
Please, as this software is free, consider using the register link below to create your account for each app, this will add you in my referral list and I will get a reward from this company.
This won't cost you anything and motivate me to maintain this software by adding new applications and providing support to customers.

- Supported [Earnapp](https://earnapp.com/i/p34wpf4)
- Supported [Honeygain](https://r.honeygain.me/GALAN2C368)
- Supported [Peer2profit](https://peer2profit.com/r/164081436561ccd71d961f2/en)
- Supported [IPRoyal Pawns](https://iproyal.com/pawns?r=455236)
- Supported [Packetstream](https://packetstream.io/?psr=32GQ)
- Not yet supported [Spider Income](https://income.spider.dev/r/galan21l65)

Start/stop procedure :

- Start stack : sudo docker-compose up -d (in CashFactory directory)
- Stop stack : sudo docker-compose down (in CashFactory directory)

Day to day management :

- Bookmarks for applications is available on a web interface on host (http server port 80) !bug Portainer bookmark is not working use manually port 9000 to access
- Docker management for container and applications command/log is available on a web interface (Portainer) on host (http server port 9000)

License : 

- This product is free for use and may be copied and distributed freely in its original form.
- Personal modifications are allowed for your personal use, but modified copy are not allowed for distribution.

Compatibility :

- Currently tested and running on a NUC computer with Ubuntu 20.04 server / docker 20.10.12 / docker-compose 1.25.0 ; hardware is N3150 celeron processor (4% load average), 8Gb memory (450 Mb used) and 120Gb disk (10 Gb used) 
- Should be working on any x86/amd64 computer running Linux+docker with a very basic setup (low end CPU / 1Gb memory / 20Gb disk / 10Mb ethernet adapter)   
- Other architecture not yet confirmed to be working (Windows / Mac / Raspberry)

TODO list :

- Add new applications when they appear (should be dockerizable to be elligible)
- Do a compatibility list based on user feedback / solve compatibility issue if possible
- Beta version : solve coming bugs

Contact :

- bugs/requests : this github page (section : Issue)
- email : galand.olivier.david@gmail.com
 
Web interface on port 80 screenshot :

![image](https://user-images.githubusercontent.com/26048157/147865719-519d33ce-7da2-4fa8-8a37-0d7254696fd5.png)
