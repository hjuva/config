# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="henning"

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
unsetopt correct

SVN_SHOW_BRANCH=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn brew osx)

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
function al { alias | grep  "^$1" ; }
function fn { typeset -f | grep  "^$1" ; }

alias fnd='typeset -f'

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
function sc { scp $1 sos610: }

alias l="ls -la"
alias c="clear"
alias ip="ipconfig getifaddr en4"
alias iph="ipconfig getifaddr en0"
alias prf="cat ~/.profile | pbcopy"


# launch
alias setwls="~/code/oracle/wls12c/wlserver/server/bin/setWLSEnv.sh"
function fuseesb {
    ju 1.7
    ~/code/fuse/current/bin/fuse
}
function nodemanager {
    ju 1.6
    ~/code/oracle/wls12c/wlserver/server/bin/startNodeManager.sh
}
function adminserver {
    ju 1.6
    ~/code/oracle/aimsdomain200/startWebLogic.sh
}

# dirs
alias ".."="cd .."
alias "..."="cd .. && cd .."
alias code="cd ~/code"
alias fuse="cd ~/code/fuse/current"
alias aimsd="cd ~/code/aimsdoc"

function aims { 
    cd ~/code/aims/dev/integration/integrationapplication
    ju 1.6
}
function aimsp { 
    cd ~/code/aimspublic/dev/esb
    ju 1.7
}
alias ah="cd ~/code/aims_filestore"
alias eclipse="cd /Applications/eclipse/Eclipse.app/Contents/MacOS"
alias maven="cd /usr/local/Cellar/maven/3.1.1"
alias down="cd ~/Downloads"

# mvn
function it { mvn failsafe:integration-test -Dit.test="$1" ; }
alias mci="nocorrect mvn clean install"
alias mcist="mci -DskipTests"
alias mpt="mvn process-test-resources"
alias mpr="mvn process-resources"   
function mrprep { mvn release:prepare -Prelease -Dtag="$1" -DreleaseVersion="$1" -DdevelopmentVersion="$2"-SNAPSHOT -DscmCommentPrefix="AIMS-$3:" -Darguments="-DskipTests" ; }
alias mrperf="mvn release:perform -Prelease -Darguments=-DskipTests"
alias mrc="mvn release:clean -Prelease"

# git
alias gs="git status"
function gci { git commit -m "$1" ; }
alias ga="git add ."
alias pull="git pull"
alias push="git push"
alias gsu="git submodule update"

# svn
function sci { svn ci -m"$1"; }
function sres { svn resolve --accept=working PATH "$1"; }
function sigs { svn propset svn:ignore "$1" .; }
alias sig="svn propedit svn:ignore ."
alias saa="svn --force --depth infinity add ."
function sa { svn add "$1" ; }
alias sst="svn st"
alias sup="svn up"
alias sco="svn checkout $1 $2"
alias srevall="svn revert --depth=infinity ."
function srev { svn revert $1 ; }
alias sls="svn ls https://sos610.lv.no:18080/svn/aimspublic/branches"
alias si="svn info"
function slog { svn log --limit $1 -v ; }

#JAVA
alias jl="/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home | uniq"
alias jv="java -version"
alias jps="jps -v"

function ju() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
}
ju 1.6

# Customize to your needs...
export M2_HOME=~/maven/apache-maven-3.1.1
export PATH=$M2_HOME/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/lib/node_modules:~/code/oracle/wls12c/wlserver/server/bin:~/code/oracle/wls12c/wlserver/common/bin
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8"
export DPOST_USER=HJ
export DPOST_HOME=~/code/dp_home
export EDITOR='subl -w'

# AIMS
export MW_HOME=~/code/oracle/wls12c
export WL_HOME=~/code/oracle/wls12c
export ORACLE_HOME=~/code/oracle
export USER_MEM_ARGS="-Xmx1024m -XX:MaxPermSize=256m"
export MANAGED_PORT=7003
export AIMS_HOSTNAME=aims1
export AIMS2_HOSTNAME=aims2
export AIMS_ENVIRONMENT=UNITTEST
export AIMS_FILESTORE="/Users/henningjuva/code/aims_filestore"
export AIMS_CACHE_MULTICAST_PORT=9541
export AIMS_HAZELCAST_PORT=9552
export AIMS_CACHE_INTERFACE_ENABLED=false
export AIMS_CACHE_INTERFACE_RANGE="10.0.140.*"
export FUSE_ESB_HOME=/Users/henningjuva/code/fuse/current


#source /Users/henningjuva/code/oracle/wls12c/wlserver/server/bin/setWLSEnv.sh


export no_proxy=localhost,aims1,aims2,10.0.140.47
function proxy (){    
    export http_proxy=proxy.lv.no:80
    export https_proxy=proxy.lv.no:80
}
function noproxy (){    
    unset http_proxy
    unset https_proxy
}
