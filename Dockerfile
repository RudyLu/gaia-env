from lightsofapollo/ubuntu-node:latest
maintainer Rudy Lu <left.lu@gmail.com>


# start by installing all our ubuntu packages
run sudo apt-get -y update
run sudo apt-get -yq install git-core curl wget firefox build-essential xvfb \
                             python-pip man python-virtualenv

run useradd -d /home/tester -s /bin/bash -m tester;

env HOME /home/tester
env SHELL /bin/bash
env USER tester
env LOGNAME tester
env PATH $PATH:/home/tester/bin
workdir /home/tester

run npm install npm@latest -g

# run some more root commands which change frequently
copy ./bin/entrypoint /home/tester/bin/entrypoint
copy ./bin/buildbot_step /home/tester/bin/buildbot_step
run chmod a+x /home/tester/bin/entrypoint
