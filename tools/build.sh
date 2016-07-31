#!/bin/sh

COURSES=$(echo courses/*.md | xargs -n 1 basename -s .md)

set -e

rsync -a --delete assets/reveal.js deploy_dir/
rsync -a --delete assets/css deploy_dir/

for course in $COURSES ; do
  sed -n 's/^\* \[\([^\]*\)\](\([^)]*\))/\1\2/p' courses/${course}.md |
  while IFS= read title file ; do
    input=courses/$file

    # Prepare the leaf presentation file
    pres_out=deploy_dir/pres/$(dirname $file)/$(basename $file .md).html
    if [ ! -r $pres_out -o $input -nt $pres_out ] ; then
      mkdir -p deploy_dir/pres/$(dirname $file)
      echo Building $pres_out
      {
	sed "s/TITLE_HERE/$title/" assets/presentation-top.html
	tr -d \\r <$input
	cat assets/presentation-bottom.html
      } >$pres_out

    fi

    hand_out=deploy_dir/handouts/$(dirname $file)/$(basename $file .md).html
    if [ ! -r $hand_out -o $input -nt $hand_out ] ; then
      mkdir -p deploy_dir/handouts/$(dirname $file)
      echo Building $hand_out
      {
	sed "s/TITLE_HERE/$title/" assets/index-top.html
	{
	  echo "# $title"
	  cat $input
	} |
	pandoc -f markdown_github -t html
	cat assets/index-bottom.html
      } >$hand_out
    fi
  done

  # Prepare the course index files
  mkdir -p deploy_dir/{pres,handouts}
  {
    sed "s/TITLE_HERE/Coding Bootcamp: Table of contents/" assets/index-top.html
    pandoc -f markdown_github -t html courses/${course}.md |
    sed '/href/s/\.md"/.html"/'
    cat assets/index-bottom.html
  } |
  tee deploy_dir/pres/${course}.html >deploy_dir/handouts/${course}.html

done
