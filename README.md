## Graphite + Carbon + Grafana

An all-in-one image running graphite, carbon-cache and grafana. **Version**: 0.9.12.

This image contains a sensible default configuration of graphite,
carbon-cache and grafana.


### Ports

- `80`: graphite web interface
- `2003`: carbon-cache line receiver (the standard graphite protocol)
- `2004`: carbon-cache pickle receiver
- `3000`: grafana dashboard
- `7002`: carbon-cache query port (used by the web interface)

### Data volumes

Graphite data is stored at `/var/lib/graphite/storage/whisper` within the
container. Grafana database is stored at `/usr/share/grafana/data`. If you wish to store your metrics outside the container (highly
recommended) and save your Grafana dashboard configuration you can use docker's data volumes feature.

**Note**: It may take around a minute in the first time for grafana to load because of some model migrations and initalizations, please be patient :)

### Running the image

Here is an example that stores the data at `/var/lib/gmonitor` on the host and connects grafana and carbon-cache ports to host:

    docker run -v /var/lib/gmonitor/graphite:/var/lib/graphite/storage/whisper \
               -v /var/lib/gmonitor/grafana/data:/usr/share/grafana/data \
               -p 2003:2003 -p 3000:3000 \
               -d alexmercer/graphite-grafana

You can log into the administrative interface of Grafana with the username `admin` and password `admin`. These passwords can
be changed through the web interface.

The first thing to do is adding graphite data source in grafana using it's interface. The graphite url is `http://localhost:80`

### Technical details

By default, this instance of carbon-cache uses the following retention periods
resulting in whisper files of approximately 2.5MiB.

    10s:8d,1m:31d,10m:1y,1h:5y

For more information, see [the
repository](https://github.com/nickstenning/dockerfiles/tree/master/graphite).
