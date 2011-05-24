###########
# GENERAL #
###########
alias home='cd ~' # the tilda is too hard to reach
alias l='ls -lah' # l for list style, a for all including hidden, h for human readable file sizes
alias h='history' # shortcut for history
alias c='clear' # shortcut to clear your terminal
alias lessv='/usr/share/vim/vim72/macros/less.sh' # less via vim - syntax highlighting enabled
alias ..='cd ..' # move up 1 dir
alias ...='cd ../..' # move up 2 dirs
#alias ebash='mate ~/.bash_profile &' # because i edit my bash_profile a lot with new things
alias rbash='source ~/.bash_profile' # same as previous, after editing you have to source it for the new stuff to work
alias grepinr='grep -inr --colour' # grep with colour, line nos, ignore case, recursive
# When working with two screens, move the top panel around. Especially useful if the power fails and external monitor with top panel is blank!
alias panel_left='gconftool-2 --set "/apps/panel/toplevels/top_panel_screen0/monitor" --type integer "1"; gconftool-2 --set "/apps/panel/toplevels/bottom_panel_screen0/monitor" --type integer "1"'
alias panel_right='gconftool-2 --set "/apps/panel/toplevels/top_panel_screen0/monitor" --type integer "0"; gconftool-2 --set "/apps/panel/toplevels/bottom_panel_screen0/monitor" --type integer "0"'
alias nz='echo The date and time right now in New Zealand is : `TZ=Pacific/Auckland date`.'

function grepedi {
    grep -inr --colour --exclude-dir=edi/doc --exclude-dir=edi/logs $@ edi/*
}

alias ack='ack-grep'
function ackrb {
    ack-grep --ruby $@
}
function ackrails {
    ack-grep --ruby $@ app lib
}
function ackjs {
    ack-grep --js $@
}

alias yuimin='java -jar /home/james/download/javascripts/yuicompressor-2.4.2/build/yuicompressor-2.4.2.jar'

########
# RUBY #
########
alias irb='irb --readline -r irb/completion -rubygems' # use readline, completion and require rubygems by default for irb
# really awesome function, use: cdgem <gem name>, cd's into your gems directory and opens gem that best matches the gem name provided
function cdgem {
  cd /usr/lib/ruby/gems/1.8/gems/; cd `ls|grep $1|sort|tail -1`
}
# Run Ruby tests (tu|tf|ti <-l || --list> [[model1] [model2] ..])
alias tu="ruby_test unit"
alias tf="ruby_test functional"
alias ti="ruby_test integration"

#########
# RAILS #
#########
alias passre='touch tmp/restart.txt' # restart app served by passenger
# alias ss='script/server' # start up the beast
# alias sc='script/console' # obvious
# alias a='script/autospec' # makes autotesting even quicker

# Rails aliases changed to functions so they can work with Rails3 and earlier:
function ss {
  if [ -e script/rails ]; then
    script/rails server $@
  else
    script/server $@
  fi
}
function sc {
  if [ -e script/rails ]; then
    script/rails console $@
  else
    script/console $@
  fi
}
function sg {
  if [ -e script/rails ]; then
    script/rails generate $@
  else
    script/generate $@
  fi
}


#############
# BOOKMARKS #
#############
alias bk-tt='cd /home/james/ra/tour_tailor_rails2/'
alias bk-kc='cd /home/james/ra/kromco_mes/'
alias bk-cm='cd /home/james/ra/jmt_cms/; rvm 1.9.2'

###############
# TOUR TAILOR #
###############
alias tt='cd /home/james/ra/tour_tailor_rails2/; ruby script/server'
alias ttauto='cd /home/james/ra/tour_tailor_rails2/; autotest'
alias ttp='cd /home/james/ra/tour_tailor_rails2/; ruby script/server -e production'
alias ttr='cd /home/james/ra/tour_tailor_rails2/; rake devtools:passenger_restart'
alias ttu='cd /home/james/ra/tour_tailor_rails2/; cap job:rake_exec RAKE_CMD=devtools:list_users'

###########
# REDMINE #
###########
alias red='cd /home/james/ra/redmine-0.6.0/; ruby script/server -e production -p 3010'

###########
# RADIANT #
###########
alias rad='cd /home/james/ra/radiant_js/; ruby script/server -e production -p 3005'

##########
# APACHE #
##########
alias apahttp='sudo gvim /etc/apache2/httpd.conf'
alias apare='sudo apache2ctl restart'

#########
# SHOES #
#########
alias crap='cd /home/james/shoes/ashbb-code_wrapper_on_shoes04; shoes CWoS_v0.4b.shy'

############
# HOME GIT #
############
alias hgit='git --git-dir=$HOME/.homegit --work-tree=$HOME'

###########
# OPENVPN #
###########
alias vpnkromco='sudo openvpn --config /etc/openvpn/client.conf'
