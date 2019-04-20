/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization.
*/

VK.config.loadingSessionText = "Loading the session..."; // Loading session text
VK.config.firstColor = [255, 150, 0];
VK.config.secondColor = [0, 191, 255];
VK.config.thirdColor = [52, 152, 219];

VK.backgrounds.list = [ // Backgrounds list, can be on local or distant (http://....)
    "img/pixelated.jpg",
    "img/joe.jpg",
    "img/rori.jpg",
];
VK.backgrounds.duration = 3000; // Background duration (in ms) before transition (the transition lasts 2000 ms)

VK.tips.enable = true; //Enable tips (true : enable, false : prevent)
VK.tips.list = [ // Tips list
    "Press F1 to pull up your phone. Emergency services can be found in the 'favorites' menu.",
    "The yellow/blue bars above the minimap represent your hunger and thirst.",
    "A full list of our emotes can be found on the Discord.",
    "Around here we call Kat the Fastest Dev in the West",
];

VK.music.url = "music/nodoubt.ogg"; // Music url, can be on local or distant (http://....) ("NONE" to desactive music)
VK.music.volume = 0.2; // Music volume (0-1)
VK.music.title = "Hella Good - No Doubt"; // Music title ("NONE" to desactive)
VK.music.submitedBy = "suggested by Kat"; // Music submited by... ("NONE" to desactive)

VK.info.logo = "icon/pixelated.png"; // Logo ("NONE" to desactive)
VK.info.text = NONE; // Bottom right corner text ("NONE" to desactive)
VK.info.website = "https://pixelatedrp.weebly.com/"; // Website url ("NONE" to desactive)
VK.info.ip = "145.239.74.177:2302"; // Your server ip and port ("ip:port")

VK.social.discord = ".me/vulkanoa"; // Discord url ("NONE" to desactive)
VK.social.twitter = NONE; // Twitter url ("NONE" to desactive)
VK.social.facebook = NONE; // Facebook url ("NONE" to desactive)
VK.social.youtube = NONE; // Youtube url ("NONE" to desactive)
VK.social.twitch = NONE; // Twitch url ("NONE" to desactive)

VK.players.enable = true; // Enable the players count of the server (true : enable, false : prevent)
VK.players.multiplePlayersOnline = "@players online"; // @players equals the players count
VK.players.onePlayerOnline = "1 player online"; // Text when only one player is on the server
VK.players.noPlayerOnline = "No players online"; // Text when the server is empty
