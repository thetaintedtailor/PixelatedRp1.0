/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization. (I only give authorization by PM on FiveM.net (https://forum.fivem.net/u/TheGamerRespow))
*/

var VK = new Object(); // DO NOT CHANGE
VK.server = new Object(); // DO NOT CHANGE

VK.backgrounds = new Object(); // DO NOT CHANGE
VK.backgrounds.actual = 0; // DO NOT CHANGE
VK.backgrounds.way = true; // DO NOT CHANGE
VK.config = new Object(); // DO NOT CHANGE
VK.tips = new Object(); // DO NOT CHANGE
VK.music = new Object(); // DO NOT CHANGE
VK.info = new Object(); // DO NOT CHANGE
VK.social = new Object(); // DO NOT CHANGE
VK.players = new Object(); // DO NOT CHANGE 

//////////////////////////////// CONFIG

VK.config.loadingSessionText = "Loading the session..."; // Loading session text
VK.config.firstColor = [255, 1, 61];
VK.config.secondColor = [88, 35, 158];
VK.config.thirdColor = [172, 11, 67];

VK.backgrounds.list = [ // Backgrounds list, can be on local or distant (http://....)
    "img/1.jpg",
    "img/2.jpg",
];
VK.backgrounds.duration = 8000; // Background duration (in ms) before transition (the transition lasts 2000 ms)

VK.tips.enable = true; //Enable tips (true : enable, false : prevent)
VK.tips.list = [ // Tips list
    "Press F1 to pull up your phone. Emergency/legal/taxi services can be found in the 'services' menu.",
    "The yellow/blue bars above the minimap represent your hunger and thirst.",
    "Our EMS team is HIRING!",
    "Around here we call Kat the Fastest Dev in the West",
];

VK.music.volume = 0.08; // Music volume (0-1)
VK.music.url = "music/perfect_day.mp3"; // Music url, can be on local or distant (http://....) ("NONE" to desactive music)
VK.music.title = "Perfect Day - The Constellations"; // Music title ("NONE" to desactive)
VK.music.submitedBy = "suggested by Raj (IGN: Crazy Earl/McPoshface) "; // Music submited by... ("NONE" to desactive)

VK.info.logo = "https://i.postimg.cc/tCWn8Scx/pixelated.png"; // Logo ("NONE" to desactive)
VK.info.text = "NONE"; // Bottom right corner text ("NONE" to desactive)
VK.info.website = false; // Website url ("NONE" to desactive)
VK.info.ip = "185.249.196.40:32070"; // Your server ip and port ("ip:port")

VK.social.discord = "https://discord.gg/X2xq3w3"; // Discord url ("NONE" to desactive)
VK.social.twitter = false; // Twitter url ("NONE" to desactive)
VK.social.facebook = false; // Facebook url ("NONE" to desactive)
VK.social.youtube = false; // Youtube url ("NONE" to desactive)
VK.social.twitch = false; // Twitch url ("NONE" to desactive)

VK.players.enable = true; // Enable the players count of the server (true : enable, false : prevent)
VK.players.multiplePlayersOnline = "@players online"; // @players equals the players count
VK.players.onePlayerOnline = "1 player online"; // Text when only one player is on the server
VK.players.noPlayerOnline = "No players online"; // Text when the server is empty

////////////////////////////////
