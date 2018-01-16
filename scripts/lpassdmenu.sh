#!/usr/bin/env bash
#
# https://github.com/cspeterson
#
# Quick search LastPass to clipboard via dmenu
#
# Pop-up dmenu to search just as the LastPass browser plugin.
# Password for selected entry is put into clipboard
#
# ## Requires:
# * cut
# * dmenu
# * lpass (https://github.com/lastpass/lastpass-cli)
# * sed
#
# ## INSTALL (Ubuntu)
# ```
# sudo apt-get update
# # Lastpass cli is the lastpass cli client from LastPass themselves
# sudo apt-get install dmenu lastpass-cli
# mkdir $HOME/.bin
# wget -O $HOME/.bin/lastpass-cli
# https://raw.githubusercontent.com/cspeterson/dotfiles/master/.bin/lastpass-dmenu
# chmod +x $HOME/.bin/lastpass-cli
# # Login to lastpass-cli one time and it will remember your email for the
# # future
# lpass login myuser@email.tld
# ```
# Then bind a key combo to the script in your window manager and you're good to go.

IFS=$'\n'
# List all entries in LastPass vault into dmenu formatted as follows
# Folder/subfolder/Name of Site [username at site] [id: id for lookup]
entries=($(lpass ls --long \
  | cut -d ' ' -f 3- \
  | sed 's/\[username: /[/' \
  | sed 's/\(.*\)\(\[.*\]\) \(\[.*\]\)/\1 \3 \2/')
  )

# Get id from dmenu user selection
selid=$(printf '%s\n' "${entries[@]}" \
  | dmenu -nf '#ebdbb4' -nb '#282828' -sb '#458588' -sf '#282828' -fn 'Ubuntu Mono-10:normal' -i -p 'LastPass: ' -l 7 -w 800 -x 0 -y 0 -h 25 \
  | sed 's/^.*\[id: \([0-9]\{1,\}\)\].*$/\1/')

# Password to clipboard
lpass show --clip --password ${selid}
