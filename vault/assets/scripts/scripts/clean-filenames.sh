#!bash

### PERL eRE
# install rename
# move items into vault
#   vault separation
#   separators to "-"
#   import generate id

# --- rename ---
# transcode
# remove transcoding artifacts (% and other code selectors)
rename -z \                 # clean filename
  -e 's/\(|\)//g' \         #   braces
  -e 's/-|—/-/g' \          #   multiple and differing separators
  -e 's/\d+\D?-//g' \       #   remove numbered starts
  -e 's/(a|(of)|to)-//g' \  #   "a" and other particles at start
  -e 's/-+\.?-+/-/g'        #   remove multiple separators
  # remove markdown title markings

# dedupe

# remove ID from name, add frontmatter
$frontmatter = `
  ---
  id: ${id}
  title: ${title}
  desc: ''
  updated:
  created:
  ---
  `

# define in RE
$SEP = /-/;                       #   separator
$TITLE = match1                   #   title
$ID = lastSegment.                #   id
$DOMAIN = firstSegment.isDomain()

#
