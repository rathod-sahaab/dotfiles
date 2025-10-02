if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

abbr --add ga "git add"
abbr --add gaa "git add ."
abbr --add gacm --set-cursor "git add . && git commit -m \"%\""
abbr --add gam "git commit --amend"
abbr --add gb "git branch"
abbr --add gbd "git branch -D"
abbr --add gc "git commit"
abbr --add gch "git checkout"
abbr --add gchb "git checkout -b"
abbr --add gchm "git checkout master"
abbr --add gcm --set-cursor "git commit -m \"%\""
abbr --add gd "git diff"
abbr --add gl "git log"
abbr --add gp "git push"
abbr --add gpu "git push -u"
abbr --add gpull "git pull"
abbr --add gpullur "git pull upstream --rebase"
abbr --add gpuo "git push -u origin"
abbr --add gs "git status"
abbr --add ls exa

zoxide init fish | source
direnv hook fish | source
