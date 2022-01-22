# SNORT

<img src="https://res-3.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_120,w_120,f_auto,b_white,q_auto:eco/v1480679929/iwzduqxdvnpqxdrmmmn0.png" width="200" height="200"/>


## INTRODUCTION

Docker image of [snort](https://www.snort.org/)

Forked from [oda-alexandre/snort](https://github.com/oda-alexandre/snort)

Implements Mikrotik Calea traffic inspection via via trafr.

## INSTALL

```mkdir $HOME/snort```

```docker run -it --name snort -v ${HOME}/snort:/snort -v ${HOME}/snort:/etc/snort -v ${HOME}/snort:/usr/local/lib -v ${HOME}/snort:/var/log/snort -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN --restart always grinco/trafr```

