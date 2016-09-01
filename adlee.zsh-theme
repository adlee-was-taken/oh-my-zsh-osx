# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# % ~/.oh-my-zsh/themes/adlee.zsh-theme
# === ADLee's zsh (oh-my-zsh) Theme ===
# =====================================

# === Compact Prompt Mode ===
# ===========================
# ==== To enable: export PROMPT_COMPACT=true
#PROMPT_COMPACT=false
if [[ "$PROMPT_COMPACT" == "" ]];then
PROMPT_COMPACT=false
fi
# === Prompt Design Elements ===
# ==============================
# ==== LP_[...] = Left Promt
# ==== RP_[...] = Right Prompt
# ==== P_[...] = Both Prompts
#
ZTM_ADLEE_P_START='%{$FG[245]%}◑┬%{$reset_color$FG[245]%}'
ZTM_ADLEE_P_COMPACT_START='%{$FG[245]%}◑─%{$reset_color$FG[245]%}'
ZTM_ADLEE_UP_START='%{$FG[245]%} ╰%{$reset_color$FG[245]%}'
ZTM_ADLEE_RP_START='%{$FG[245]%}─%{$reset_color$FG[245]%}'
ZTM_ADLEE_RP_END='%{$FG[245]%}─┬◐%{$reset_color$FG[245]%}'
ZTM_ADLEE_LP_END='%{$FG[245]%}─◐%{$reset_color$FG[245]%}'
ZTM_ADLEE_P_DIV='%{$FG[245]%}─%{$reset_color$FG[245]%}'
ZTM_ADLEE_TXT_GRY='%{$FG[245]%}'
ZTM_ADLEE_TXT_RST='%{$reset_color%}'

# === VIM Prompt Formatting ===
# =============================
function vim_prompt () {
if ! $PROMPT_COMPACT;then
	VIM_NORMAL_PROMPT="%{$FG[245]%}◑─⟨⋅⋅%{$FX[bold]$FG[124]%}⚡⌘⚡%{$reset_color%}%{$FG[245]%}⋅⋅⟩─╯"
    VIM_INSERT_PROMPT="%{$FG[245]%}◑─⟨⋅⋅%{$reset_color%}%{$FG[154]$FX[bold]%}«⎕»%{$reset_color%}%{$FG[245]%}⋅⋅⟩─╯%{$reset_color%}"
else
    VIM_NORMAL_PROMPT="%{$FG[245]%}⟨%{$FX[bold]$FG[124]%}⚡⌘⚡%{$reset_color%}%{$FG[245]%}⟩"
    VIM_INSERT_PROMPT="%{$FG[245]%}⟨%{$reset_color%}%{$FG[154]$FX[bold]%}«⎕»%{$reset_color%}%{$FG[245]%}⟩%{$reset_color%}"
fi
RPS1="${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT}"
RPS2=$RPS1
}

vim_prompt

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# === Load oh-my-zsh Plugins ===
# ==============================
#
plugins=(vi-mode)

# ==== Text formatting local vars.
export ZTM_ADLEE_P_TXT_GREY='%{$FG[245]%}'
export ZTM_ADLEE_P_TXT_RESET='%{$reset_color%}'

# === ZTM_ADLEE_PrepPrompt Function ===
# =====================================
# ==== Gather system stats displayed in prompt.
#
ZTM_ADLEE_PrepPrompt() {

# ==== P_BATT = Runs script that returns battery charge %
export ZTM_ADLEE_P_BATT='%{$FX[bold]$FG[160]%}$(~/.zsh/battery.sh)%%%{$reset_color$FG[245]%}'
# ==== P_IPADD = Current 'en0' IP address
export ZTM_ADLEE_P_IPADD='%{$FX[bold]$FG[136]%}$(~/.zsh/ipaddr.sh)%{$reset_color$FG[245]%}'
# ==== P_CURDIR = Working DIR
export ZTM_ADLEE_P_CURDIR='%{$FX[bold]$FG[179]%}%~%{$reset_color$FG[245]%}'
# ==== P_CURGIT = Working DIR's Git Info
export ZTM_ADLEE_P_CURGIT='%{$(git_prompt_info)$FG[245]%}'
# ==== P_CMDNUM = Current command 'history' number
export ZTM_ADLEE_P_CMDNUM='%{$FX[bold]$FG[245]%}!%{$reset_color%}%{$FX[bold]$FG[005]%}%h%{$reset_color$FG[245]%}'
# ==== P_PCHAR = Prompt character (%/#)
export ZTM_ADLEE_P_PCHAR='%{$FG[245]%}%{$FX[bold]$FG[069]%}%#%{$reset_color%} '
# ==== P_FREE = Amount of available RAM (in MB)
export ZTM_ADLEE_P_RUNFREE=$(python ~/.zsh/free.py | tail -2 | head -1 | awk '{print $3}')
export ZTM_ADLEE_P_FREE='%{$FX[bold]$FG[006]$ZTM_ADLEE_P_RUNFREE$FG[245]%}MB%{$reset_color$FG[245]%}'
# ==== P_CONN = Run python script that checks internet connectivity and returns √ or X
export ZTM_ADLEE_P_CONN='%{$(python ~/.zsh/is_conn.py)$FG[245]%}'

}

# === ZTM_ADLEE_BuildPrompt Function ===
# =======================
# ==== This func assembles the empire.
#
ZTM_ADLEE_BuildPrompt() {

# === Prompt Utility Elements ===
# ===============================
# ==== P_USER = Current System User
# ==== P_ATSIGN = '@' -- for between USER'@'HOST
# ==== P_HOST = System Hostname
export ZTM_ADLEE_P_USER='%{$FX[bold]$FG[196]%}%n%{$reset_color$FG[245]%}'
export ZTM_ADLEE_P_ATSIGN='%{$FX[bold]$FG[196]%}@%{$reset_color$FG[245]%}'
export ZTM_ADLEE_P_HOST='%{$FX[bold]$FG[196]%}%m%{$reset_color$FG[245]%}'
# ==== P_TIME = Current time (24hr)
# ==== P_STIME = Current time (without seconds)
# ==== P_DATE = Current date: YYYY-MM-DD
# ==== P_SDATE = Current date: YY/MM/DD
export ZTM_ADLEE_P_TIME='%{$FG[069]%}%D{%I:%M:%S}%{$reset_color$FG[245]%}'
export ZTM_ADLEE_P_STIME='%{$FG[069]%}%D{%I:%M}%{$reset_color$FG[245]%}'
export ZTM_ADLEE_P_DATE='%{$FG[069]%}%D{%Y-%m-%d}%{$reset_color$FG[245]%}'
export ZTM_ADLEE_P_SDATE='%{$FG[069]%}%D{%b}⋅%D{%d}'

# ==== Run ZTM_ADLEE_PrepPrompt function to gather system stats for prompt.
ZTM_ADLEE_PrepPrompt

# === Assemble Prompt Components ===
# ==================================
# ==== [LU]Left-Upper : [ user@hostname ] - [ √/X (Internet Connected) ] - [ PWD ]
export ZTM_ADLEE_LU_PMPT=$ZTM_ADLEE_P_START''$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_USER''$ZTM_ADLEE_P_ATSIGN\
$ZTM_ADLEE_P_HOST'⟩'$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_TXT_GREY'⇝www⇝:'$ZTM_ADLEE_P_TXT_RESET''$ZTM_ADLEE_P_CONN'⟩'$ZTM_ADLEE_P_DIV\
'⟨'$ZTM_ADLEE_P_CURDIR'⟩'$ZTM_ADLEE_P_DIV''$ZTM_ADLEE_P_CURGIT
# ==== [RU]Right-Upper : [ Free RAM in MB ] - [ Batt. Charge % ] - [ en0:<IP> ]
export ZTM_ADLEE_RU_PMPT=$ZTM_ADLEE_RP_START'⟨'$ZTM_ADLEE_P_FREE'⟩'$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_BATT'⟩'\
$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_TXT_GREY'en0:'$ZTM_ADLEE_P_TXT_RESET''$ZTM_ADLEE_P_IPADD'⟩'$ZTM_ADLEE_RP_END
# ==== [L]Lower : Date & Time - Current Command History #
export ZTM_ADLEE_L_PMPT=$ZTM_ADLEE_UP_START''$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_SDATE'⋅'$ZTM_ADLEE_P_TIME'⟩'\
$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_CMDNUM'⟩'$ZTM_ADLEE_LP_END' '$ZTM_ADLEE_P_PCHAR
# ==== [SM]Small (Compact) : User - PWD 
export ZTM_ADLEE_SM_PMPT=$ZTM_ADLEE_P_COMPACT_START'⟨'$ZTM_ADLEE_P_USER'⟩'$ZTM_ADLEE_P_DIV'⟨'$ZTM_ADLEE_P_CURDIR'⟩'\
$ZTM_ADLEE_LP_END' '$ZTM_ADLEE_P_PCHAR

# === Calculate and Create Filler for Full-Width Prompt (top-line) ===
# ====================================================================
# ==== Prompt displays 7 types of variable data, we need the len of each to calculate fill.
# ==== Get width of hostname (UL Box1)
local host_width;host_width=$(hostname | cut  -d '.' -f1 | tr -d " \t\n\r" | wc -m)
# ==== Get width of PWD (UL Box3)
local pwd_width;pwd_width=$(pwd | sed -e 's/\/Users\/alee/~/g' | wc -m)
# ==== Get width of Git tag (UL Box3)
local git_width;git_width=$(git_prompt_info |  tr -d '%{}'| sed -e 's/[\x01-\x1F\x7F]//g' | col -bx | wc -m) 
if [ $git_width -gt 0 ];then  
  git_width=$(( $git_width - 1 ))  # === For some reason width is off by 1, thus this.
fi
# ==== Get width of battery charge % (UR Box2)
local batt_width;batt_width=$(~/.zsh/battery.sh | tr -d " \t\n\r" | wc -m)
# ==== Get width of en0's IP address (UR Box3)
local ip_width;ip_width=$(~/.zsh/ipaddr.sh | tr -d " \t\n\r" | wc -m)
# ==== Get width of current user (UL Box1)
local user_width;user_width=$(whoami | tr -d " \t\n\r" | wc -m)
# ==== Get width of free memory (UR Box 1)
local mem_width;mem_width=$(python ~/.zsh/free.py | tail -2 | head -1 | awk '{print $3}'| tr -d " \t\n\r" | wc -m)

#Account for other (design) characters
local desch;desch=38
local ldesch;ldesch=23

#Set $prompt_comp to global $PROMPT_COMPACT
export ZTM_ADLEE_PROMPT_AUTOCOMPACT=$PROMPT_COMPACT

#Figure out how many 'fill' chars we need.
local i_filler;i_filler=$(( $COLUMNS-$desch-$host_width-$pwd_width-$git_width-$batt_width-$ip_width-$user_width-$mem_width ))
local j_filler;j_filler=$(( $COLUMNS-$ldesch-$host_width-$pwd_width-$git_width-$user_width ))
#Export 'P_FILL' variable with proper number of filler chars.
local p_fill;p_fill="%{$FG[245]%}${(l:${i_filler}::─:)}${reset_color}"
local p_left_fill;p_left_fill="%{$FG[245]%}${(l:${j_filler}::─:)}${reset_color}"

# === Check Console Width and Adjust Prompt Accordingly ===
# =========================================================

#If there is enough room (width) display complete (full-info) prompt.
if [[ $i_filler -ge 0 ]]; then
  export ZTM_ADLEE_U_PMPT=$ZTM_ADLEE_LU_PMPT''$p_fill''$ZTM_ADLEE_RU_PMPT
  export ZTM_ADLEE_M_PMPT=$ZTM_ADLEE_L_PMPT
#If there is not enough room for even the top-left part of prompt, switch to compact mode.
elif [[ $COLUMNS -lt $(( $host_width + $pwd_width + $git_width + $user_width + ( $desch / 2 ) )) ]]; then
  export ZTM_ADLEE_PROMPT_AUTOCOMPACT=true
  export ZTM_ADLEE_M_PMPT=$ZTM_ADLEE_L_PMPT
#Otherwise just show upper-left and lower-left prompts.
else
  export ZTM_ADLEE_U_PMPT=$ZTM_ADLEE_LU_PMPT''$ZTM_ADLEE_P_DIV''$p_left_fill''$ZTM_ADLEE_RP_END
  export ZTM_ADLEE_M_PMPT=$ZTM_ADLEE_L_PMPT
fi

} # End of ZTM_ADLEE_BuildPrompt()


# === PreExec Function ===
# ========================
#
preexec () {

ZTM_ADLEE_PrepPrompt

}

# === PreCMD Function ===
# =======================
# ==== This func runs before prompt is redrawn.
#
precmd() {

ZTM_ADLEE_BuildPrompt

#If the $PROMPT_COMPACT is 'enabled' display the small prompt: single line w/ less info.
if ! $ZTM_ADLEE_PROMPT_AUTOCOMPACT ;then
  print -rP "${ZTM_ADLEE_U_PMPT}"
  export PROMPT=$ZTM_ADLEE_M_PMPT
else
  export PROMPT=$ZTM_ADLEE_SM_PMPT
fi

# === VIM Prompt Formatting ===
# =============================
function zle-line-init zle-keymap-select {
    vim_prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

} # ---> End of precmd()

# === Auto-update prompt for accurate time/date ===
# =================================================
TMOUT=1
TRAPALRM() {
    ZTM_ADLEE_BuildPrompt
    if [[ "$WIDGET" != "expand-or-complete" ]]; then
        vim_prompt
        zle reset-prompt
    fi
}

# === Git Prompt Formatting ===
# =============================
ZSH_THEME_GIT_PROMPT_PREFIX="⟨%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color$FG[245]%}⟩"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""


function histsearch() { fc -lim "$@" 1 }


