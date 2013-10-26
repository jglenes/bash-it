SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
SCM_GIT_CHAR="${bold_green}±${normal}"
SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

history -a
history -c
history -r

case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

PS3=">> "

is_vim_shell() {
	if [ ! -z "$VIMRUNTIME" ]
	then
		echo "[${cyan}vim shell${normal}]"
	fi
}

function prompt_clock() {
  if [[ -z "$THEME_PROMPT_CLOCK_FORMAT" ]]
  then
      clock="\t"
  else
      clock=$THEME_PROMPT_CLOCK_FORMAT
  fi
}

modern_scm_prompt() {
	CHAR=$(scm_char)
	if [ $CHAR = $SCM_NONE_CHAR ]
	then
		return
	else
		echo "[$(scm_char)][$(scm_prompt_info)]"
	fi
}

function virtualenv_toggle {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      virtualenv=`basename "$VIRTUAL_ENV"`
      VIRTUALENV_THEME_PROMPT_PREFIX="${bold_green}py: ${reset_color}"
      VIRTUALENV_THEME_PROMPT_SUFFIX=""
      echo -e "$VIRTUALENV_THEME_PROMPT_PREFIX$virtualenv$VIRTUALENV_THEME_PROMPT_SUFFIX"
   else
       echo "\w"
   fi
}

prompt() {
	if [ $? -ne 0 ]
	then
		# Yes, the indenting on these is weird, but it has to be like
		# this otherwise it won't display properly.

    PS1="\[\w\]\n${TITLEBAR}${bold_red}┌─${reset_color}$(modern_scm_prompt)[${cyan}\W${normal}][$(battery_charge)]$(is_vim_shell)
${bold_red}└─▪${normal} "
	else
      PS1="\n[${white}\t${normal}][${bold_purple}$(virtualenv_toggle)${normal}]\n${TITLEBAR}┌─[${bold_cyan}\u${normal}][${bold_green}$(battery_charge)${normal}]$(is_vim_shell)
└─▪$(modern_scm_prompt) "
	fi
}

PS2="└─▪ "



PROMPT_COMMAND=prompt

