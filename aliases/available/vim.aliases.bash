cite 'about-alias'
about-alias 'vim abbreviations'

alias v='mvim -v'
alias vim='mvim -v'
alias vv=/usr/bin/vim

case $ostype in
  darwin*)
    alias vim="mvim --remote-tab"
    ;;
  *)
    ;;
esac
