# brew install go

# defaut is /usr/local/bin/go
export GOROOT="/usr/local/go"
export GOPATH="${HOME}/go"
export PATH=${GOROOT}/bin:$PATH

# you can use "go env" to check env setting
