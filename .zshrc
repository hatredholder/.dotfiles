# Options 
setopt globdots
setopt INC_APPEND_HISTORY
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Plugins
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/sudo_plugin.zsh
source ~/.config/zsh/fs/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/as/zsh-autosuggestions.zsh

# Env
export PATH="$HOME/.local/share/bob/nightly/nvim-linux64/bin:$PATH"
export LS_COLORS="di=32;01:ex=34"

export LF_ICONS="\
fi=:\
di=:\
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
tw=:\
st=:\
ow=:\
dt=:\
di=:\
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

# ZSH Tab Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# Aliases
alias cd..="cd .."

alias unin="sudo dnf uninstall"
alias install="sudo dnf install"

alias v="nvim"

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

colorscript --exec bars
export PATH=$PATH:/home/hatredholder/.spicetify

# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;} # launch tmux on zsh startup
