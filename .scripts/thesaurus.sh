#!/usr/bin/env bash

curl --silent "https://www.thesaurus.com/browse/$1" |

	grep -e 'https://www.thesaurus.com/browse/' \
	     -e 'class="similarity-level-label"' \
			 -e 'class="part-of-speech-label"' \
			 -e 'class="definition"' \
	     -e 'class="synonym-antonym-panel-label"'\
	     -A 1 --no-group-separator |
			 sed 's/\(<div.*">\)\|\(href.*\)\|\(<\/div>\)\|\(<.\?span>\)\|\(.*link.*\)//g' | sed '/^\s*$/d'
