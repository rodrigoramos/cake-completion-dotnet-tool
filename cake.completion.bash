#!/usr/bin/env bash

if command -v dotnet-cake > /dev/null; then
    __dotnetcake_completion()  {
        local OPTS=($(grep -oP "(?<=Task\(\")[^\"]+" < build.cake))
        COMPREPLY=()
        for _opt_ in ${OPTS[@]}; do
            if [[ "$_opt_" == "$2"* ]]; then
                COMPREPLY+=("$_opt_")
            fi
        done
    }
    
    complete -F __dotnetcake_completion dotnet-cake
fi
