#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
pushd $SCRIPT_DIR

if [[ "$*" = *wasm* ]]; then HOST_PLATFORM=EMSCRIPTEN; fi
if [[ "$*" = *clean* ]]; then rm -rf build; fi
if [ ! -d "build" ]; then mkdir build; fi

cd build

if [[ $HOST_PLATFORM = EMSCRIPTEN ]]; then
    CONAN_PROFILE=$SCRIPT_DIR/env/emscripten.profile
    conan install .. -pr "$CONAN_PROFILE"
    source activate.sh
fi

cmake .. -DCMAKE_BUILD_TYPE=Debug -DCONAN_PROFILE=$CONAN_PROFILE
cmake --build .

# uncomment if you whish to insall build target
# cmake --build . --target install

if [[ $HOST_PLATFORM = EMSCRIPTEN ]]; then
    source deactivate.sh
fi

popd
