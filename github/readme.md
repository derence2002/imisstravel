This container receives a Github repo and returns its name, clone URL, last commit date and last author

docker build . -t derence2002/mycurl:alpine

Sample run:
docker run -it --rm derence2002/mycurl:alpine sh curl.sh
Please provide the Github repo:
octocat/Spoon-Knife
Name,Clone_URL,Last Commit Date,Last Author
Spoon-Knife,https://github.com/octocat/Spoon-Knife.git,2014-02-12T23,The Octocat
