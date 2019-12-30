# brew install go

# defaut is /usr/local/bin/go
export GOROOT="/usr/local/go"
export GOPATH="${HOME}/Golangspace"
export PATH=${GOROOT}/bin:$PATH
export PATH=${GOPATH}/bin:$PATH

# you can use "go env" to check env setting

create_go_space() {
    mkdir -p ${GOPATH}/src ${GOPATH}/pkg ${GOPATH}/bin
}
