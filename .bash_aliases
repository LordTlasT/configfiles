# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -laX'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# For dmenu layout
alias dmenu="dmenu -p '>' -l 5 -fn 'xft:Ubuntu Mono:pixelsize=18' -nb '#002434' -nf '#2aa198' -sb '#002b36' -sf '#eee8d5'"
alias dmenu_run="dmenu_run -p '>' -l 5 -fn 'xft:Ubuntu Mono:pixelsize=18' -nb '#002434' -nf '#2aa198' -sb '#002b36' -sf '#eee8d5'"

# For when launching GUI apps under sudo
alias sudo='sudo GTK_THEME=Solarized-Dark-Blue'

# when launching mpv add a new socket 
# alias mpv='mpv --input-ipc-server=/tmp/mpvsocket'
