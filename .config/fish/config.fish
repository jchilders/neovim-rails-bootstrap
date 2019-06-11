set --universal fish_greeting ""

# https://fishshell.com/docs/current/index.html#editor
set -g fish_key_bindings fish_vi_key_bindings

# https://github.com/michaeldfallen/git-radar#customise-your-prompt
set --universal --export GIT_RADAR_FORMAT "%{branch} %{changes}"
# set --local GIT_RADAR_FORMAT "-=> %{branch} %{(:local} %{changes:)}"

set -g fish_user_paths /usr/local/sbin $fish_user_paths
set -g fish_user_paths ~/.local/bin $fish_user_paths

# Qt5.5 and its qmake binary is required by capybara-webkit gem
# http://download.qt.io/archive/qt/5.5/5.5.1/
# https://stackoverflow.com/questions/33728905/qt-creator-project-error-xcode-not-set-up-properly-you-may-need-to-confirm-t/35098040#35098040
set -g fish_user_paths ~/Qt5.5.1/5.5/clang_64/bin $fish_user_paths

# MySQL Stuff
set --universal --export DYLD_LIBRARY_PATH /usr/local/mysql/lib

# Agency Gateway stuff
set --universal --export UNICORN_WORKERS 1
# Port to run AG UI on
# see: ~/.config/fish/fish_variables
# set --universal --export PORT 4200

# Remora (PAM Admin) stuff
set --universal --export REMORA_DB_USERNAME sms_user

# rvm stuff
function __check_rvm --on-variable PWD --description 'Change Ruby version on directory change'
  chrvm
end

alias   bi='bundle install'
alias   cat='bat'
alias   l='ls -alGp'
alias   rc='rails console'
alias   rs='rails s'
alias   rdbm='rake db:migrate'
alias   rdbms='rake db:migrate:status'
alias   vi='nvim'
alias   vim='nvim'

set -x CLASSPATH ./lib/log4j-1.2.17.jar # For SMS

test -s /Users/jchilders/.nvm-fish/nvm.fish; and source /Users/jchilders/.nvm-fish/nvm.fish