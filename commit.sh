# copy rouge.css from css/all_highlights_css/xx.css currently native.css

cp css/all_highlights_css/native.css ./css/rouge.css

git config --global push.default matching

git config --global push.default simple

sh -x gen_dot.sh

sh -x gen_pdf.sh
git add gen_pdf.sh

git add ./css
git add _posts
git add dots
git add _includes
git add posts
git add _config.yml
git add assets
git add index.html
git add source_codes
git add gen_dot.*
git add commit.sh

python ./gen_urls.py
git add ./urls.txt
git add ./commit_windows.sh

git commit -m "xx"
echo `date`
git push --set-upstream origin master

curl -H 'Content-Type:text/plain' --data-binary @urls.txt "http://data.zz.baidu.com/urls?site=https://daiwk.github.io&token=yLCy2sKPeFnXzSvK"

# http://google.com/ping?sitemap=https://daiwk.github.io/urls.txt
