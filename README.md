Falcon-How-To
=============

## Demo Falcon Application

#### Notes
env.sh contains path info

## Steps to run:

#### Load Pig application
./deployapp.sh

#### Create database and snapshot table
./createddl.sh

#### Load snapshot history data
./historyload.sh

#### Load delta data
./deltasload.sh

### Add entities to Falcon

#### First, set the Falcon URL env var
./seturl.sh

#### Load entities
```sh
falcon entity -type cluster -file cluster-one.xml -submit
falcon entity -type feed -file feed-in.xml -submit
falcon entity -type feed -file feed-out.xml -submit
falcon entity -type process -file gen-snapshot.xml -submit
```

#### View entities in the Falcon UI
[ go to browser ]

#### Schedule the process
falcon entity -type process -name snapshot -schedule

