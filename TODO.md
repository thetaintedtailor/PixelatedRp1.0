# TODO

## mods (in priority order)
1) https://github.com/N3MTV/gcphone - WORKING
    - lous: start esx_addons_gcphone
    - lous: start start gcphone
    - no potential duplicates to consider in lou's server.cfg
    - house activity: still needs database integration (but having errors)
    - - currently testing without it
2) https://forum.fivem.net/t/release-esx-custom-scoreboard-with-jobs-online/84767
    - new: not on lou's server.cfg
3) https://forum.fivem.net/t/release-esx-non-esx-legacyfuel-system/148442
    - lous: start esx_legacyfuel
    - no potential duplicates to consider in lou's server.cfg
4) https://forum.fivem.net/t/release-esx-kashacters-multi-character/251613
    - louis: start esx_kashacters
    - no potential duplicates to consider in lou's server.cfg
5) https://forum.fivem.net/t/trundles-roleplay-animations-updated-10-26/171735 - WORKING
    - kat actively working: "Radiant_Animations" is the complete, working animation mod. "Pixelated_Animations" is the non-working refactor attempt. 
	- Switching between the two via server config (you can comment out Pixelated_Animations, then commment in Radiant_Animations to see all of the working animations)
6) https://github.com/condolent/esx_repairkit - DONE
    - kat - DONE
    - house to update production database - DONE
7) https://forum.fivem.net/t/release-finger-pointing-by-geekness/103722 - DONE
    - kat to add custom code mod - DONE
8) https://github.com/ESX-PUBLIC/esx_vehiclelock
    - envy new request

    

## misc
1) create automated python script to perform ftp push
2) planning to port server hosting (from zap-hosting to AWS)
    - want to try to get us off of it as soon as possible, but in order for me to do so, i need to be able to gradually test on dev server (my aws server) with 2 people, then 5 people, then 10 people, then 20 people, then 32 people (or at least up to 15 or 20 people).... these tests will probably consist of about 10 or 15 minutes of them just running around and driving.... and then me asking them questions in a group audio chat afterwards.... the testing would probably begin in a week or two
3) AWS fee assessment
    - i just finished your cost anlysis with zap vs aws
    - zap is giving you 16GB of RAM and claiming to give you 3Ghz to 4.5Ghz processor, however they are using AWS under the hood.... i'm pretty sure, but they are definitely using the same exact processors and hardware as AWS, and those processors don't come in 3 to 4.5Ghz
    - you are paying for 16GB of RAM, but they don't tell you how many processor cores you are paying for (which is weird also), which is more important than the frequency (the speed)
    - over the past 4 days since you started.... you have used less than 2GB of RAM at any given time, and that is with 10 players max at any given time.... basically, i don't see you going over 4GB, but we will see this month
    - if you don't go over 4GB, then with AWS, you will be paying a min of $33 to $69 per month
    - if you use up to 8GB then you will be paying $69 to $130 per month roughly (w/ aws)
    - if you go up to 16GB (which i doubt), you will be paying $133 to $169 per month (w/ aws)
    - i don't really see you going up to 16GB (i dunno maybe), but either way, you would be saving a lot of money with AWS, because aws is reliable... you can't even ssh into the command line of your servers so i can run some basic unix commands to check the hardware, so if you go up to that 16GB and you go up to 30+ donations, and your server crashes, you lose a lot of money, and it will cost more money to get that user base back (you lose users), and the 16GB with aws is almost exactly the same price (but 'gauranteed')
    3) delete git commit (SHA: 1c825a68a59635f54b990437512fb3080eb74e88) 
        - perminantly delete from git history (contains security vulnerabilities) 
