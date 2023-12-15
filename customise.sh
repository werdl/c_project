function input() {
    local prompt=$1
    local default_value=$2

    printf "$prompt ($default_value): "
    read user_input

    # If the input is null or empty, use the default value
    if [ -z "$user_input" ]; then
        user_input=$default_value
    fi

    echo "$user_input"
}

function prepend() {
    local content=$1
    local file=$2

    # Create a temporary file to store the concatenated content
    tmpfile=$(mktemp)
    
    # Echo the content with a newline, followed by the existing file content, to the temporary file
    (echo -e "$content\n" && cat "$file") > "$tmpfile"

    # Move the temporary file back to the original file
    mv "$tmpfile" "$file"
}



printf "Welcome to your new C Project!\n"
name = $(input "Name:" "myprogram")

prepend "TARGET = $name" "Makefile"

printf "#!/bin/bash\n\nmake clean\n" > .git/hooks/pre-push

del = $(input "All done!\nDelete this script? [y/n]:" "n")

if [ del -eq "y" ]; then
    rm -rf customise.sh
fi


