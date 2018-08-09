# general
alias cls='clear'
alias v='vim'
alias ag='Ag'

# docker
alias dc='docker-compose'
alias drmc="docker rm \$(docker ps -qa --no-trunc --filter 'status=exited')"
alias drmv="docker volume rm \$(docker volume ls -qf dangling=true)"
alias drmi="docker rmi \$(docker images | grep '^<none>' | awk '{print $3}')"
alias docker-clean="drmc;drmv;drmi"

# git
alias gco='git checkout'
alias gl='git pull'
alias gs='git status'
alias dif='git diff'
alias gb='git branch'
alias add='git add'
alias commit='git commit -m'
alias gpo='git push origin $(git_current_branch)'

# grpc_cli
# alias grpc_cli='docker run -v `pwd`:/defs --rm -it namely/grpc-cli'
alias mkgrpc='docker run -v `pwd`:/defs namely/protoc-all:1.9'

# kubernetes
alias kb='kubectl'

# virtualenv
alias vnv='source vnv/bin/activate'
alias venv='source venv/bin/activate'

# for fun
alias datnot='dotnet'
