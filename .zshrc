# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#.                             dstufft.zsh-theme             jbergantine.zsh-theme         mortalscumbag.zsh-theme       sorin.zsh-theme
#..                            duellj.zsh-theme              jispwoso.zsh-theme            mrtazz.zsh-theme              sporty_256.zsh-theme
#Soliah.zsh-theme              eastwood.zsh-theme            jnrowe.zsh-theme              murilasso.zsh-theme           steeef.zsh-theme
#afowler.zsh-theme             edvardm.zsh-theme             jonathan.zsh-theme            muse.zsh-theme                sunaku.zsh-theme
#alanpeabody.zsh-theme         evan.zsh-theme                josh.zsh-theme                nanotech.zsh-theme            sunrise.zsh-theme
#apple.zsh-theme               example.zsh-theme             jreese.zsh-theme              nebirhos.zsh-theme            superjarin.zsh-theme
#arrow.zsh-theme               fino.zsh-theme                jtriley.zsh-theme             nicoulaj.zsh-theme            suvash.zsh-theme
#aussiegeek.zsh-theme          fishy.zsh-theme               juanghurtado.zsh-theme        norm.zsh-theme                takashiyoshida.zsh-theme
#awesomepanda.zsh-theme        flazz.zsh-theme               kardan.zsh-theme              obraun.zsh-theme              terminalparty.zsh-theme
#bira.zsh-theme                fletcherm.zsh-theme           kennethreitz.zsh-theme        philips.zsh-theme             theunraveler.zsh-theme
#blinks.zsh-theme              fox.zsh-theme                 kolo.zsh-theme                pmcgee.zsh-theme              tjkirch.zsh-theme
#candy.zsh-theme               frisk.zsh-theme               kphoen.zsh-theme              pygmalion.zsh-theme           tonotdo.zsh-theme
#clean.zsh-theme               funky.zsh-theme               lambda.zsh-theme              re5et.zsh-theme               trapd00r.zsh-theme
#cloud.zsh-theme               fwalch.zsh-theme              linuxonly                     rgm.zsh-theme                 wedisagree.zsh-theme
#crunch.zsh-theme              gallifrey.zsh-theme           lukerandall.zsh-theme         risto.zsh-theme               wezm+.zsh-theme
#cypher.zsh-theme              gallois.zsh-theme             macovsky-ruby.zsh-theme       rixius.zsh-theme              wezm.zsh-theme
#dallas.zsh-theme              garyblessington.zsh-theme     macovsky.zsh-theme            rkj-repos.zsh-theme           wuffers.zsh-theme
#darkblood.zsh-theme           gentoo.zsh-theme              maran.zsh-theme               rkj.zsh-theme                 xiong-chiamiov-plus.zsh-theme
#daveverwer.zsh-theme          geoffgarside.zsh-theme        mgutz.zsh-theme               robbyrussell.zsh-theme        xiong-chiamiov.zsh-theme
#dieter.zsh-theme              gnzh.zsh-theme                mh.zsh-theme                  sammy.zsh-theme               zhann.zsh-theme
#dogenpunk.zsh-theme           gozilla.zsh-theme             mikeh.zsh-theme               simple.zsh-theme
#dpoggi.zsh-theme              humza.zsh-theme               miloshadzic.zsh-theme         skaro.zsh-theme
#dst.zsh-theme                 imajes.zsh-theme              minimal.zsh-theme             smt.zsh-theme

ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Faster autocompletion
setopt NO_cdable_vars
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
#zstyle ':completion:*' hosts off
hosts=('grep "Host " ~/.ssh/config | cut -d " " -f2 | grep -v "*"')
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $hosts

setopt menu_complete

# Disable autocorrect
unsetopt correct_all

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git mvn)

# Faster git completion
__git_files () {
    _wanted files expl 'local files' _files
}

source $ZSH/oh-my-zsh.sh

# Aliases

# General
function f { find . -name "*$1*" | xargs grep "$2" | grep -v target| grep -v ".svn"; }
function findn { find . -name "*$1*" | grep -v ".svn" | grep -v "target" ; }
function finds { find "$1" | grep -v ".svn" ; }
function size { du -h -d "$1"; }
function duh { find . -type f -size +"$1"000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }' ; }
function hi { history | grep "$1" ; }
function en { env | grep "$1" ; }
function grp { grep -Ir --exclude="*\.svn*" "$1" *  ; }

alias deploy="cp ~/code/aimspublic/0_0_2/dev/esb/service-core/target/service-core-1.0.0-SNAPSHOT.kar /Users/henningjuva/code/fuse/fuse-esb-7.0.0.fuse-061/deploy"
alias e="subl"
alias ez="e ~/.zshrc"
alias sz="source ~/.zshrc"
function cz {
    cd ~/config
    git commit -a -m "$1"
    cd -
}
function pz {
    cd ~/config
    git push
    cd -
}
alias l="ls -la"
alias c="clear"
alias ip="ipconfig getifaddr en4"

# launch
alias fuse="cd ~/code/fuse/fuse-esb-7.0.0.fuse-061"
alias fuseesb="~/code/fuse/fuse-esb-7.0.0.fuse-061/bin/fuseesb"
alias setwls="~/code/oracle/wls12c/wlserver/server/bin/setWLSEnv.sh"

# dirs
alias ".."="cd .."
alias "..."="cd .. && cd .."
alias code="cd ~/code"
alias aims="cd ~/code/aims/"
alias aimsp="cd ~/code/aimspublic/dev/esb"
alias ah="cd ~/code/aims_filestore"
alias eclipse="cd /Applications/eclipse/Eclipse.app/Contents/MacOS"
alias maven="cd /usr/local/Cellar/maven/3.1.1"

# mvn
function it { mvn failsafe:integration-test -Dit.test="$1" ; }
alias mvn="mvn-color"
alias mci="mvn clean install"
alias mcist="mci -DskipTests"
alias mpt="mvn process-test-resources"
alias mpr="mvn process-resources"


# git
alias gs="git status"
function gci { git commit -m "$1" ; }
alias ga="git add ."
alias pull="git pull"
alias push="git push"
alias gsu="git submodule update"

# svn
function ci { svn ci -m"$1"; }
function res { svn resolve --accept=working PATH "$1"; }
function igs { svn propset svn:ignore "$1" .; }
alias ig="svn propedit svn:ignore ."
alias add="svn --force --depth infinity add ."
alias st="svn st"
alias up="svn up"
alias revert="svn revert --depth=infinity ."

#JAVA
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
    java -version
}
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# Customize to your needs...
export PATH=/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/lib/node_modules:~/code/oracle/wls12c/wlserver/server/bin:~/code/oracle/wls12c/wlserver/common/bin
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8"
export DPOST_USER=HJ
export DPOST_HOME=~/code/dp_home
export DPOST_WEBAPP_REPO="/Users/henningjuva/code/digipost-webapp"
export DPOST_POSTIT_REPO="/Users/henningjuva/code/digipost-postit"
export EDITOR='subl -w'

# AIMS
export WL_HOME=~/code/oracle/wls12c
export MW_HOME=~/code/oracle/wls12c
export ORACLE_HOME=~/code/oracle
export USER_MEM_ARGS="-Xmx1024m -XX:MaxPermSize=256m"
export MANAGED_PORT=7003
export AIMS_HOSTNAME=10.0.140.133
export AIMS2_HOSTNAME=10.0.140.133
export AIMS_ENVIRONMENT=UNITTEST
export AIMS_FILESTORE="/Users/henningjuva/code/aims_filestore"
export AIMS_CACHE_MULTICAST_PORT=9541
export AIMS_HAZELCAST_PORT=9552
export AIMS_CACHE_INTERFACE_ENABLED=false
export AIMS_CACHE_INTERFACE_RANGE="10.0.140.*"
export FUSE_ESB_HOME=/Users/henningjuva/code/fuse/fuse-esb-7.0.0.fuse-061


# source /Users/henningjuva/code/oracle/wls12c/wlserver/server/bin/setWLSEnv.sh

#test

export no_proxy=localhost,aims1,aims2,10.0.140.133
function proxy (){    
    export http_proxy=proxy.lv.no:80
    export https_proxy=proxy.lv.no:80
}
function noproxy (){    
    unset http_proxy
    unset https_proxy
}
proxy