# Options 
setopt globdots
setopt INC_APPEND_HISTORY

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history

bindkey -v  # enable vi mode (required for zsh-vi-mode plugin)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search


# Plugins
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme # p10k theme
source ~/.config/zsh/vi/zsh-vi-mode.zsh  # vi mode
source ~/.config/zsh/sudo_plugin.zsh  # esc-esc for repeat in sudo
source ~/.config/zsh/fs/fast-syntax-highlighting.zsh  # syntax-highlighting
source ~/.config/zsh/as/zsh-autosuggestions.zsh  # autosuggestions
source ~/.config/zsh/cb/zsh-system-clipboard.zsh  # yank to clipboard in vi mode
source ~/.config/zsh/tt/termtitle.zsh # termtitle

# Env
export ZDOTDIR="$HOME/.config/zsh/"  # zsh config directory

export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

export SUDO_EDITOR='/usr/bin/nvim'  # neovim as default sudo editor

export PATH="$HOME/.local/share/bob/nightly/nvim-linux64/bin:$PATH"
export PATH="$PATH:/home/$USER/.local/bin"
export PATH="$HOME:/home/hatredholder/go/bin:$PATH"

## Golang Env
export PATH="$PATH:/usr/local/go/bin"

# ZSH Tab Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# Aliases
alias cd..="cd .."
alias CLEAR="clear"

alias uninstall="sudo pacman -R"
alias install="sudo pacman -S"

alias v="nvim"
alias vi="vim"

alias cat="bat --theme base16"

alias ls="exa -a --color=always --icons --group-directories-first"
alias la="exa -a --color=always --icons --group-directories-first"
alias l="exa -a --color=always --icons --group-directories-first -lah"

alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot -h now"

alias lf=lf-ueberzug

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/hatredholder/.spicetify


# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;} # launch tmux on zsh startup

# Zoxide configuration

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && [[ "$1" = '-' ]]; then
        if [[ -n "${OLDPWD}" ]]; then
            __zoxide_cd "${OLDPWD}"
        else
            # shellcheck disable=SC2016
            \builtin printf 'zoxide: $OLDPWD is not set'
            return 1
        fi
    elif [[ "$#" -eq 1 ]] && [[ -d "$1" ]]; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query -i -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin unalias cd &>/dev/null || \builtin true
function cd() {
    __zoxide_z "$@"
}

\builtin unalias cdi &>/dev/null || \builtin true
function cdi() {
    __zoxide_zi "$@"
}

if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -i -- ${words[2,-1]})"; then
                __zoxide_result="${result}"
            else
                __zoxide_result=''
            fi
            \builtin printf '\e[5n'
        fi
    }

    function __zoxide_z_complete_helper() {
        \builtin local result="${__zoxide_z_prefix}${__zoxide_result}"
        # shellcheck disable=SC2296
        [[ -n "${__zoxide_result}" ]] && LBUFFER="${LBUFFER}${(q-)result}"
        \builtin zle reset-prompt
    }

    \builtin zle -N __zoxide_z_complete_helper
    \builtin bindkey "\e[0n" __zoxide_z_complete_helper
    if [[ "${+functions[compdef]}" -ne 0 ]]; then
        \compdef -d cd
        \compdef -d cdi
        \compdef __zoxide_z_complete cd
    fi
fi

# =============================================================================
eval "$(zoxide init zsh)"

## Terminal Colors + Icons
export LS_COLORS="di=32;01:ex=34"
export LF_ICONS="\
fi=:\
di=:\
ln=:\
pi=|:\
so=ﯲ:\
db=:\
cd=c:\
or=:\
su=:\
sg=:\
tw=:\
ow=w:\
st=:\
ex=:\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.7z=:\
*.a=:\
*.aac=:\
*.ace=:\
*.ai=:\
*.alz=:\
*.apk=:\
*.arc=:\
*.arj=:\
*.asf=:\
*.asm=:\
*.asp=:\
*.au=:\
*.aup=:\
*.avi=:\
*.avi=:\
*.bash=:\
*.bat=:\
*.bmp=:\
*.bz2=:\
*.bz=:\
*.c++=:\
*.c=:\
*.cab=:\
*.cbr=:\
*.cbz=:\
*.cc=:\
*.cgm=:\
*.class=:\
*.clj=:\
*.cljc=:\
*.cljs=:\
*.cmake=:\
*.cmd=:\
*.coffee=:\
*.conf=:\
*.cp=:\
*.cpio=:\
*.cpp=:\
*.cs=:\
*.css=:\
*.cue=:\
*.cvs=:\
*.cxx=:\
*.d=:\
*.dart=:\
*.db=:\
*.deb=:\
*.diff=:\
*.dl=:\
*.dll=:\
*.doc=:\
*.docx=:\
*.dump=:\
*.dwm=:\
*.dz=:\
*.ear=:\
*.edn=:\
*.eex=:\
*.efi=:\
*.ejs=:\
*.elf=:\
*.elm=:\
*.emf=:\
*.epub=:\
*.erl=:\
*.esd=:\
*.ex=:\
*.exe=:\
*.exs=:\
*.f#=:\
*.fifo=|:\
*.fish=:\
*.flac=:\
*.flc=:\
*.fli=:\
*.flv=:\
*.flv=:\
*.fs=:\
*.fsi=:\
*.fsscript=:\
*.fsx=:\
*.gem=:\
*.gif=:\
*.git=:\
*.gl=:\
*.go=:\
*.gz=:\
*.gzip=:\
*.h=:\
*.hbs=:\
*.hh=:\
*.hpp=:\
*.hrl=:\
*.hs=:\
*.htaccess=:\
*.htm=:\
*.html=:\
*.htpasswd=:\
*.ico=:\
*.img=:\
*.ini=:\
*.iso=:\
*.jar=:\
*.java=:\
*.jl=:\
*.jpeg=:\
*.jpg=:\
*.js=:\
*.json=:\
*.jsx=:\
*.key=:\
*.less=:\
*.lha=:\
*.lhs=:\
*.log=:\
*.lrz=:\
*.lua=:\
*.lz4=:\
*.lz=:\
*.lzh=:\
*.lzma=:\
*.lzo=:\
*.m2v=:\
*.m4a=:\
*.m4v=:\
*.markdown=:\
*.md=:\
*.mid=:\
*.midi=:\
*.mjpeg=:\
*.mjpg=:\
*.mka=:\
*.mkv=:\
*.ml=λ:\
*.mli=λ:\
*.mng=:\
*.mov=:\
*.mp3=:\
*.mp4=:\
*.mp4v=:\
*.mpc=:\
*.mpeg=:\
*.mpg=:\
*.msi=:\
*.mustache=:\
*.nix=:\
*.nuv=:\
*.o=:\
*.oga=:\
*.ogg=:\
*.ogm=:\
*.ogv=:\
*.ogx=:\
*.opus=:\
*.pbm=:\
*.pcx=:\
*.pdf=:\
*.pgm=:\
*.php=:\
*.pl=:\
*.pm=:\
*.png=:\
*.ppk=:\
*.ppm=:\
*.ppt=:\
*.pptx=:\
*.pro=:\
*.ps1=:\
*.psb=:\
*.psd=:\
*.pub=:\
*.py=:\
*.pyc=:\
*.pyd=:\
*.pyo=:\
*.qt=:\
*.ra=:\
*.rar=:\
*.rb=:\
*.rc=:\
*.rlib=:\
*.rm=:\
*.rmvb=:\
*.rom=:\
*.rpm=:\
*.rs=:\
*.rss=:\
*.rtf=:\
*.rz=:\
*.s=:\
*.sar=:\
*.scala=:\
*.scss=:\
*.sh=:\
*.slim=:\
*.sln=:\
*.so=:\
*.spx=:\
*.sql=:\
*.styl=:\
*.suo=:\
*.svg=:\
*.svgz=:\
*.swm=:\
*.t7z=:\
*.t=:\
*.tar=:\
*.taz=:\
*.tbz2=:\
*.tbz=:\
*.tga=:\
*.tgz=:\
*.tif=:\
*.tiff=:\
*.tlz=:\
*.ts=:\
*.twig=:\
*.txz=:\
*.tz=:\
*.tzo=:\
*.tzst=:\
*.vim=:\
*.vimrc=:\
*.vob=:\
*.war=:\
*.wav=:\
*.wav=:\
*.webm=:\
*.wim=:\
*.wmv=:\
*.xbm=:\
*.xbps=:\
*.xcf=:\
*.xhtml=:\
*.xls=:\
*.xlsx=:\
*.xml=:\
*.xpm=:\
*.xspf=:\
*.xul=:\
*.xwd=:\
*.xz=:\
*.yaml=:\
*.yml=:\
*.yuv=:\
*.z=:\
*.zip=:\
*.zoo=:\
*.zsh=:\
*.zst=:\
*.src=:\
*.ebuild=
"
