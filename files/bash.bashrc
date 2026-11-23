_ix_make() {
    local current=${COMP_WORDS[COMP_CWORD]} directory=. i target
    for ((i=1; i<COMP_CWORD; i++)); do
        if [[ ${COMP_WORDS[i]} == -C ]]; then
            directory=${COMP_WORDS[i+1]}
            ((i++))
        fi
    done
    COMPREPLY=()
    while IFS= read -r target; do
        [[ $target == "$current"* ]] && COMPREPLY+=("$target")
    done < <(make -C "$directory" -qp 2>/dev/null |
        awk -F: '/^[a-zA-Z0-9][^=$#[:space:]]*:/ {print $1}' | sort -u)
}
complete -F _ix_make make
