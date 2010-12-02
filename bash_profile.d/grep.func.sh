function cgrep()
{
    find . -type f \( -name "*\.c*" -or -name "*\.h" \) -print0 | xargs -0 grep --color -n "$@"
}

function jgrep()
{
    find . -type f -name "*\.java" -print0 | xargs -0 grep --color -n "$@"
}
