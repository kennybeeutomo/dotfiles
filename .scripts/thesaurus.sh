#!/usr/bin/env bash
# Script to look up thesaurus of a word on thesaurus.com
# Todo: use pup to parse html

curl --silent "https://www.thesaurus.com/browse/$1" |

	grep -e 'https://www.thesaurus.com/browse/' \
	     -e 'class="similarity-level-label"' \
			 -e 'class="part-of-speech-label"' \
			 -e 'class="definition"' \
	     -e 'class="synonym-antonym-panel-label"'\
	     -A 1 --no-group-separator |
			 sed 's/\(<div.*">\)\|\(href.*\)\|\(<\/div>\)\|\(<.\?span>\)\|\(.*link.*\)//g' | sed '/^\s*$/d'
