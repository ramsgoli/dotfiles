# PATH environment variable modifications should be made here.

export PATH="${PATH}:$(go env GOPATH)/bin"
export PATH="${PATH}:/Applications/IntelliJ IDEA.app/Contents/MacOS"

# >>> coursier install directory >>>
export PATH="$PATH:$(echo $HOME)/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
