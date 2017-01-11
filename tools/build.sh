#!/bin/sh
#
# Local build of the material into the web directory
#

COURSES=$(ls courses/*.md | sed 's/\.md$//;s/courses\///')

set -e

if [ -n "$DEBUG" ] ; then
  pandoc --version
  set -x
fi

rsync -a --delete --exclude=.git assets/reveal.js web/
rsync -a --delete assets/css web/

# Succeed if output must be built
# As a side effect provide feedback and create the output directory
build_required()
{
  local in=$1
  local out=$2

  if [ ! -r $out -o $in -nt $out ] ; then
    mkdir -p $(dirname $out)
    echo Building $out
    return 0
  else
    return 1
  fi
}

for course in $COURSES ; do
  sed -n 's/^\* \[\([^\]*\)\](\([^)]*\))/\1\2/p' courses/${course}.md |
  while IFS= read title file ; do
    input=courses/$file
    case $file in
      *.md) # Markdown
	# Prepare the leaf presentation file
	pres_out=web/$(dirname $file)/$(basename $file .md)-p.html
	if build_required $input $pres_out ; then
	  {
	    sed "s/TITLE_HERE/$title/" assets/presentation-top.html
	    tr -d \\r <$input
	    cat assets/presentation-bottom.html
	  } >$pres_out
	fi

	# Prepare handout file
	hand_out=web/$(dirname $file)/$(basename $file .md).html
	if build_required $input $hand_out ; then
	  {
	    sed "s/TITLE_HERE/$title/" assets/index-top.html
	    {
	      echo "# Coding Bootcamp: $title"
	      cat $input
	    } |
	    pandoc -f markdown_github -t html
	    cat assets/index-bottom.html
	  } >$hand_out
	fi
	;;

      *.ipynb) # Python notebook
	# Prepare the leaf presentation file
	pres_out=web/$(dirname $file)/$(basename $file .ipynb)-p.html
	if build_required $input $pres_out ; then
	  jupyter nbconvert $input --to slides --stdout \
	    --reveal-prefix=../reveal.js >$pres_out
	fi

	# Prepare handout file
	hand_out=web/$(dirname $file)/$(basename $file .ipynb).html
	if build_required $input $hand_out ; then
	  jupyter nbconvert $input --to html --stdout >$hand_out
	fi
    esac
  done

  # Deploy media files
  rsync -a --delete courses/$course/media web/$course/
  rsync -a --delete courses/common/media web/common/

  # Prepare the course index files
  for hp in '' -p ; do
    {
      sed "s/TITLE_HERE/Coding Bootcamp: Table of contents/" assets/index-top.html
      pandoc -f markdown_github -t html courses/${course}.md |
      sed '/href/{;s/\.md"/'$hp'.html"/;s/\.ipynb"/'$hp'.html"/;}'
      cat assets/index-bottom.html
    } >web/${course}${hp}.html
  done

done

sed 's/\.\.\///' web/admin/materials.html >web/index.html
