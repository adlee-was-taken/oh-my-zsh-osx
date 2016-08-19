# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# % ~/.oh-my-zsh/themes/adlee.zsh-theme
# === ADLee's zsh (oh-my-zsh) Theme ===
# === 2016-07-19 - Pindrop Security ===
# =====================================

# === Compact Prompt Mode ===
# ===========================
#PROMPT_COMPACT="enabled"
if [[ "$PROMPT_COMPACT" == "" ]];then
PROMPT_COMPACT='disabled'
fi
# === Prompt Design Elements ===
# ==============================
# ==== LP_[...] = Left Promt
# ==== RP_[...] = Right Prompt
# ==== P_[...] = Both Prompts
#
ZTM_ADLEE_P_START='%{$FG[239]%}Ҩ%{$reset_color%}'
ZTM_ADLEE_UP_START='%{$FG[239]%}Ҩ%{$reset_color%}'
ZTM_ADLEE_RP_START='%{$FG[239]%}%{$reset_color%}'
ZTM_ADLEE_RP_END='%{$FG[239]%}Ҩ%{$reset_color%}'
ZTM_ADLEE_LP_DIV='%{$FG[239]%}•Ҩ•%{$reset_color%}'
ZTM_ADLEE_P_DIV='%{$FG[239]%}•%{$reset_color%}'
ZTM_ADLEE_TXT_GRY='%{$FG[239]%}'
ZTM_ADLEE_TXT_RST='%{$reset_color%}'

# === PreCMD Function ===
# =======================
# ==== This func runs before prompt is redrawn.
#
precmd() {

# === Prompt Utility Elements ===
# ===============================
# ==== P_USER = Current System User
# ==== P_ATSIGN = '@' -- for between USER'@'HOST
# ==== P_HOST = System Hostname
export ZTM_ADLEE_P_USER='%{$FX[bold]$FG[136]%}%n%{$reset_color%}'
export ZTM_ADLEE_P_ATSIGN='%{$FX[bold]$FG[136]%}@%{$reset_color%}'
export ZTM_ADLEE_P_HOST='%{$FX[bold]$FG[136]%}%m%{$reset_color%}'
# ==== P_TIME = Current time (24hr)
# ==== P_STIME = Current time (without seconds)
# ==== P_DATE = Current date: YYYY-MM-DD
# ==== P_SDATE = Current date: YY/MM/DD
export ZTM_ADLEE_P_TIME='%{$FG[069]%}%D{%I:%M:%S}%{$reset_color%}'
export ZTM_ADLEE_P_STIME='%{$FG[069]%}%D{%I:%M}%{$reset_color%}'
export ZTM_ADLEE_P_DATE='%{$FG[069]%}%D{%Y-%m-%d}%{$reset_color%}'
export ZTM_ADLEE_P_SDATE='%{$FG[069]%}%D{%y/%m/%d}%{$reset_color%}'
# ==== P_BATT = Runs script that returns battery charge %
export ZTM_ADLEE_P_BATT='%{$FX[bold]$FG[160]%}$(~/.zsh/battery.sh)%%%{$reset_color%}'
# ==== P_IPADD = Current 'en0' IP address
export ZTM_ADLEE_P_IPADD='%{$FX[bold]$FG[136]%}$(~/.zsh/ipaddr.sh)%{$reset_color%}'
# ==== P_CURDIR = Working DIR
export ZTM_ADLEE_P_CURDIR='%{$FX[bold]$FG[179]%}%~%{$reset_color%}$(git_prompt_info)'
# ==== P_CMDNUM = Current command 'history' number
export ZTM_ADLEE_P_CMDNUM='%{$FX[bold]$FG[239]%}!%{$reset_color%}%{$FX[bold]$FG[005]%}%h%{$reset_color%}'
# ==== P_PCHAR = Prompt character (%/#)
export ZTM_ADLEE_P_PCHAR='%{$FG[239]%}•Ҩ%{$reset_color%} %{$FG[239]%}%{$FX[bold]$FG[069]%}%#%{$reset_color%} '
# ==== P_FREE = Amount of available RAM (in MB)
local run_free;run_free=$(python ~/.zsh/free.py | tail -2 | head -1 | awk '{print $3}')
export ZTM_ADLEE_P_FREE='%{$FX[bold]$FG[006]$run_free$FG[239]%}MB%{$reset_color%}'
# ==== P_CONN = Run python script that checks internet connectivity and returns √ or X
export ZTM_ADLEE_P_CONN='%{$(python ~/.zsh/is_conn.py)%}'
# ==== Text formatting local vars.
local txt_grey;txt_grey='%{$FG[239]%}'
local txt_reset;txt_reset='%{$reset_color%}'

# === Assemble Prompt Components ===
# ==================================
# ==== [LU]Left-Upper : [ user@hostname ] - [ √/X (Internet Connected) ] - [ PWD ]
export ZTM_ADLEE_LU_PMPT=$ZTM_ADLEE_UP_START''$ZTM_ADLEE_P_DIV'[ '$ZTM_ADLEE_P_USER''$ZTM_ADLEE_P_ATSIGN\
$ZTM_ADLEE_P_HOST' ]'$ZTM_ADLEE_P_DIV'[ '$ZTM_ADLEE_P_CONN' ]'$ZTM_ADLEE_P_DIV'[ '$ZTM_ADLEE_P_CURDIR' ]'\
$ZTM_ADLEE_P_DIV
# ==== [RU]Right-Upper : [ Free RAM in MB ] - [ Batt. Charge % ] - [ en0:<IP> ]
export ZTM_ADLEE_RU_PMPT=$ZTM_ADLEE_P_DIV''$ZTM_ADLEE_RP_START'[ '$ZTM_ADLEE_P_FREE' ]'\
$ZTM_ADLEE_P_DIV'[ '$ZTM_ADLEE_P_BATT' ]'$ZTM_ADLEE_P_DIV'[ '$txt_grey'en0:'$txt_reset''$ZTM_ADLEE_P_IPADD' ]'\
$ZTM_ADLEE_P_DIV''$ZTM_ADLEE_RP_END
# ==== [L]Lower : Date & Time - Current Command History #
export ZTM_ADLEE_L_PMPT=$ZTM_ADLEE_UP_START''$ZTM_ADLEE_P_DIV''$ZTM_ADLEE_P_DATE''$ZTM_ADLEE_P_DIV''$ZTM_ADLEE_P_TIME''\
$ZTM_ADLEE_LP_DIV''$ZTM_ADLEE_P_CMDNUM''$ZTM_ADLEE_P_PCHAR
# ==== [SM]Small (Compact) : User - Current Command History # 
export ZTM_ADLEE_SM_PMPT=$ZTM_ADLEE_P_USER''$ZTM_ADLEE_P_DIV''$ZTM_ADLEE_P_CMDNUM''$ZTM_ADLEE_P_PCHAR

# === Calculate and Create Filler for Full-Width Prompt (top-line) ===
# ====================================================================
# ==== Prompt displays 7 types of variable data, we need the len of each to calculate fill.
# ==== Get width of hostname (UL Box1)
local papp1;papp1=$(hostname | cut  -d '.' -f1 | tr -d " \t\n\r" | wc -m)
# ==== Get width of PWD (UL Box3)
local papp2;papp2=$(pwd | sed -e 's/\/Users\/alee/~/g' | wc -m)
# ==== Get width of Git tag (UL Box3)
local papp3;papp3=$(git_prompt_info |  tr -d '%{}'| sed -e 's/[\x01-\x1F\x7F]//g' | col -bx | wc -m)
# ==== Get width of battery charge % (UR Box2)
local papp4;papp4=$(~/.zsh/battery.sh | tr -d " \t\n\r" | wc -m)
# ==== Get width of en0's IP address (UR Box3)
local papp5;papp5=$(~/.zsh/ipaddr.sh | tr -d " \t\n\r" | wc -m)
# ==== Get width of current user (UL Box1)
local papp6;papp6=$(whoami | tr -d " \t\n\r" | wc -m)
# ==== Get width of free memory (UR Box 1)
local papp7;papp7=$(python ~/.zsh/free.py | tail -2 | head -1 | awk '{print $3}'| tr -d " \t\n\r" | wc -m)

#Account for other (design) characters
local desch;desch=42

#Set $prompt_comp to global $PROMPT_COMPACT
local prompt_comp;prompt_comp=$PROMPT_COMPACT

#Figure out how many 'fill' chars we need.
local i_filler;i_filler=$(( $COLUMNS - $desch - $papp1 - $papp2 - $papp3 - $papp4 - $papp5 - $papp6 - $papp7 ))
#Export 'P_FILL' variable with proper number of filler chars.
local p_fill;p_fill="%{$FG[239]%}${(l:${i_filler}::°º°˚:)}${reset_color}"


# === Check Console Width and Adjust Prompt Accordingly ===
# =========================================================

#If there is enough room (width) display complete (full-info) prompt.
if [[ $i_filler -ge 0 ]]; then
  export ZTM_ADLEE_U_PMPT=$ZTM_ADLEE_LU_PMPT''$p_fill''$ZTM_ADLEE_RU_PMPT
  export ZTM_ADLEE_M_PMPT=$ZTM_ADLEE_L_PMPT
#If there is not enough room for even the top-left part of prompt, switch to compact mode.
elif [[ $COLUMNS -lt $(( $papp1 + $papp2 + $papp3 + $papp6 + ( $desch / 2 ) )) ]]; then
  prompt_comp="enabled"
  export ZTM_ADLEE_M_PMPT=$ZTM_ADLEE_L_PMPT
#Otherwise just show upper-left and lower-left prompts (no upper-right or fill).
else
  export ZTM_ADLEE_U_PMPT=$ZTM_ADLEE_LU_PMPT''$ZTM_ADLEE_UP_START
  export ZTM_ADLEE_M_PMPT=$ZTM_ADLEE_L_PMPT
fi

#If the $PROMPT_COMPACT is 'enabled' display the small prompt: single line w/ less info.
if [[ "$prompt_comp" !=  "enabled" ]];then
  print -rP "${ZTM_ADLEE_U_PMPT}"
  export PROMPT=$ZTM_ADLEE_M_PMPT
else
  export PROMPT=$ZTM_ADLEE_SM_PMPT
fi

} # ---> End of precmd()

# === Auto-update prompt for accurate time/date ===
# =================================================
TMOUT=1
TRAPALRM() {
    if [[ "$WIDGET" != "expand-or-complete" ]]; then
        zle reset-prompt
    fi
}

# === Git Prompt Formatting ===
# =============================
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

