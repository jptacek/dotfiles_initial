## .bashrc is run each time a terminal is created. Things like path, colors
##     etc should be here. If a user logs on remotely, it also gets run
## .bash_profile is executed for each interactive login. You can put things
##     here you don't want to see at each prompt. For example, diagnostics


function my_ip_wired() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig enx0050b667e645 | awk '/inet addr/ { print "Wired " $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}
function my_ip_wireless() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig wlo1 | awk '/inet addr/ { print "Wireless: " $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additional information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}UTC date :$NC " ; date -u
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip_wired
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip_wireless
    echo
}
