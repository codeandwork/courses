#!/bin/sh

COURSES=$(ls courses/*.md | sed 's/\.md$//;s/courses\///')

set -e

rsync -a --delete --exclude=.git assets/reveal.js web/
rsync -a --delete assets/css web/

for course in $COURSES ; do
  sed -n 's/^\* \[\([^\]*\)\](\([^)]*\))/\1\2/p' courses/${course}.md |
  while IFS= read title file ; do
    input=courses/$file

    # Prepare the leaf presentation file
    pres_out=web/$(dirname $file)/$(basename $file .md)-p.html
    if [ ! -r $pres_out -o $input -nt $pres_out ] ; then
      mkdir -p web/$(dirname $file)
      echo Building $pres_out
      {
	sed "s/TITLE_HERE/$title/" assets/presentation-top.html
	tr -d \\r <$input
	cat assets/presentation-bottom.html
      } >$pres_out

    fi

    # Prepare handout file
    hand_out=web/$(dirname $file)/$(basename $file .md).html
    if [ ! -r $hand_out -o $input -nt $hand_out ] ; then
      mkdir -p web/$(dirname $file)
      echo Building $hand_out
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
  done

  # Deploy media files
  rsync -a --delete courses/$course/media web/$course/

  # Prepare the course index files
  for hp in '' -p ; do
    {
      sed "s/TITLE_HERE/Coding Bootcamp: Table of contents/" assets/index-top.html
      pandoc -f markdown_github -t html courses/${course}.md |
      sed '/href/s/\.md"/'$hp'.html"/'
      cat assets/index-bottom.html
    } >web/${course}${hp}.html
  done

done

sed 's/\.\.\///' web/admin/materials.html >web/index.html
