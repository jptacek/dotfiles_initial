## .bashrc is run each time a terminal is created. Things like path, colors
##     etc should be here. If a user logs on remotely, it also gets run
## .bash_profile is executed for each interactive login. You can put things
##     here you don't want to see at each prompt. For example, diagnostics

function my_ip_wired() # Get IP adress on ethernet.
{
    MY_IPW=$(/sbin/ifconfig enx0050b667e645 | awk '/inet / { print "Wired " $2 } ' )
    echo ${MY_IPW:-"Not connected"}
}
function my_ip_wireless() # Get IP adress on ethernet.
{
    MY_IPWL=$(/sbin/ifconfig wlo1 | awk '/inet / { print "Wireless: " $2 } ' )
    echo ${MY_IPWL:-"Not connected"}
}


function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additional information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n$NC "
    echo -n "Local IP Address :$NC " ; my_ip_wired
    echo -n "Local IP Address :$NC " ; my_ip_wireless
    echo -n "External IP Address :$NC " ; dig +short myip.opendns.com @resolver1.opendns.com
    echo
}
## Environment variables
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
export ANDROID_HOME=/home/john/Android/Sdk
export GOBIN=$HOME/work/bin

export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:.
export PATH=$PATH:/usr/local/go/bin

export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

## Execute bash Profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
source ~/azure.completion.sh
