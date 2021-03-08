rm -rf docs
make html
cd build/html
grep -rl _static . | xargs sed -i -e "s/_static/static/g"
grep -rl _sources . | xargs sed -i -e "s/_sources/sources/g"
cp -rf _static static
cp -rf _sources sources
cd ..
# rm -rf ../docs
cp -rf html ../docs
cd ../docs
cp -rf images images
grep -rl static . | xargs sed -i -e "s/images/images/g"
grep -rl sources . | xargs sed -i -e "s/images/images/g"
# grep -rl . . | xargs sed -i -e "s/\"
find . -type f -print0 | xargs -0 perl -pi -e "s/\?digest.*\"/\"/g"
cd ..
git add .
git commit -m "refresh"
git push origin master