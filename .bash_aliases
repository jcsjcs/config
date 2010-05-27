###########
# GENERAL #
###########
alias home='cd ~' # the tilda is too hard to reach
alias l='ls -lah' # l for list style, a for all including hidden, h for human readable file sizes
alias h='history' # shortcut for history
alias c='clear' # shortcut to clear your terminal
alias ..='cd ..' # move up 1 dir
alias ...='cd ../..' # move up 2 dirs
#alias ebash='mate ~/.bash_profile &' # because i edit my bash_profile a lot with new things
alias rbash='source ~/.bash_profile' # same as previous, after editing you have to source it for the new stuff to work
alias grepinr='grep -inr --colour' # grep with colour, line nos, ignore case, recursive
# When working with two screens, move the top panel around. Especially useful if the power fails and external monitor with top panel is blank!
alias panel_left='gconftool-2 --set "/apps/panel/toplevels/top_panel_screen0/monitor" --type integer "1"; gconftool-2 --set "/apps/panel/toplevels/bottom_panel_screen0/monitor" --type integer "1"'
alias panel_right='gconftool-2 --set "/apps/panel/toplevels/top_panel_screen0/monitor" --type integer "0"; gconftool-2 --set "/apps/panel/toplevels/bottom_panel_screen0/monitor" --type integer "0"'
alias nz='echo The date and time right now in New Zealand is : `TZ=Pacific/Auckland date`.'

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
alias ss='script/server' # start up the beast
alias sc='script/console' # obvious
alias a='script/autospec' # makes autotesting even quicker

#############
# BOOKMARKS #
#############
alias bk-tt='cd /home/james/ra/tour_tailor_rails2/'
alias bk-fp='cd /home/james/ra/forrester_payroll/'

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

###########
# HOSTING #
###########
alias slicehost='ssh -p 31000 safe@173.45.235.184'
alias hetzner='ssh -p 30000 tourtailor@41.203.20.212'

