# brew install go

# defaut is /usr/local/bin/go
export GOROOT=`dirname \`which go\``

# go workspace
if [ ! -d "${HOME}/go" ]; then
    dirs=("src" "bin" "pkg")
    for d in ${dirs[@]}
    do
        mkdir -p ${HOME}/go/${d}
        echo mkdir ${HOME}/go/${d}
    done
fi

export GOPATH="${HOME}/go"

# you can use "go env" to check env setting
