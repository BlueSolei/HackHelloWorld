SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
pushd $SCRIPT_DIR
cd build/bin
if [[ "$1" != "tests" ]]; then
    if [[ -f HackHelloWorld.html ]]; then
        source ../activate.sh
        emrun ./HackHelloWorld.html
        source ../deactivate.sh
    else
        ./HackHelloWorld
    fi
else
    ./HackHelloWorldTest
fi
popd
