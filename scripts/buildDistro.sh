#!/bin/bash
proj='ldaphelper'
builddir='.'
srcdir='..'

if [ 't'$1 == 't' ]; then
	version=`date "+%Y%m%d"`
else
	version=$1
fi
echo "Creating version $version"

cd $srcdir
git tag -a "$version"
cd -

dest="$proj-$version"
echo "Making directory $dest"

mkdir -p $builddir/$dest
cp -r $srcdir/python/* $builddir/$dest
cd $builddir
tar -zcvf $dest.tgz $dest

