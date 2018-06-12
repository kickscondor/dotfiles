# oh my zsh path
export ZSH=~/.oh-my-zsh

# minimalist theme
ZSH_THEME="gallois"

# no auto titling
DISABLE_AUTO_TITLE="true"

# plugins
plugins=(git tmux rsync z)

# load oh my zsh (love the 'd' command and such!)
source $ZSH/oh-my-zsh.sh

# load local settings
source ~/.profile-common
source ~/.profile

# format titles for screen and rxvt
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen*)
    print -Pn "\ek$a:$3\e\\"      # screen title (in ^A")
    ;;
  st-*|rxvt)
    print -Pn "\e]2;$2 | $a:$3\a" # plain xterm title
    ;;
  esac
}

# precmd is called just before the prompt is printed
function precmd() {
  title "zsh" "$USER@%m" "%55<...<%~"
}

# preexec is called just before any command line is executed
function preexec() {
  title "$1" "$USER@%m" "%35<...<%~"
}
