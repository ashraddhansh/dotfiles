if status is-interactive
# Commands to run in interactive sessions can go here
fish_vi_key_bindings
date
end

zoxide init --cmd cd fish | source
starship init fish | source
set -U fish_greeting ""

alias c="clear"
alias ff="fastfetch"

alias up='uptime --pretty' # clear terminal
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

fish_add_path ~/.local/My-Scripts-and-Tools/


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

set -gx EDITOR nvim
