mkdir $1_$2
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$1/$2/pulls > $1_$2/pulls.json
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$1/$2/commits > $1_$2/commits.json
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$1/$2/issues > $1_$2/issues.json
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$1/$2/events > $1_$2/events.json
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$1/$2/contributors > $1_$2/contributors.json
