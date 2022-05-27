# Python
alias py='python3'

# Activate virtual environment
alias act='. ./venv/bin/activate'

# Docker aliases
alias dockerps='docker ps --format="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"'

# Docker Compose
alias dcc='docker-compose'

# Remove "none" docker images
alias docker-cleanup-none='docker rmi -f $(docker images | grep -Poi "(?<=<none>)\s+\b\w+\b" | sed "s/\s*//g")'

# cd up dir
alias '...'='../..'
alias '....'='../../..'
alias '.....'='../../../..'

# aws auto completion
complete -C '/usr/local/bin/aws_completer' aws

# Switch Kubernetes context
alias kns='kubectl config set-context --current --namespace'
#
# kubectl auto completion
# source <(kubectl completion zsh)


# Editor padrão kubectl
export KUBE_EDITOR='/usr/local/bin/vim'

alias k=kubectl


