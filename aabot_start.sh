eval `ssh-agent`
ssh-add /home/vbmart/.ssh/id_rsa_bitbucket

cd /home/vbmart/web/aabot_git/astroalertbot_v2/
git fetch --all
git reset --hard origin/master

docker stop aabot1
docker rm aabot1
docker rmi aabot

docker build /home/vbmart/web/aabot_git/astroalertbot_v2/ -t aabot
docker run --name aabot1 -d --restart=always --net=webserver -v /home/vbmart/web/aabot_files:/usr/src/app/files aabot
