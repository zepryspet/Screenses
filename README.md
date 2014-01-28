Screenses
=========

Script to obtain the TOP policies using the session text file extracted from the ScreenOs Juniper firewall

Note: You can obtain the TOP [IPs & Ports , source and destination] from the Juniper Site https://tools.juniper.net/fsa/control
This Script Just complement the previously solution and obtains the TOP policies [The most used policies in the session table]

Important: The Scrip doesn't connect to your firewall, It just read the file that you save.


1. Enable login in your SSH client and save the output in a file named session.txt, If you use Putty you can obtain the information in the following link http://my.kualo.com/knowledgebase/888-how-to-create-a-log-file-of-your-putty-session.html 
2. Download the session table, you can perform that task via SSH with the following commands,
  set console page 0
  get session
  set console page 20
3. Download the script and place it in the same folder and execute it [or the executable if you're in windows], Be sure that the session filw it's called session.txt and that this file is place in the same script folder.
4. The policy ranking is going to be saved in the file topolicies.txt [located in the same folder], just open it with a notepad and analyze your traffic.


Good luck,

Gerardo.
