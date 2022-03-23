# synapse chart

This Chart installs the python reference server for [matrix](https://matrix.org/)

## Dependencies

### Kubegres Operator

Due to [this](https://stackoverflow.com/questions/60283240/helm-chart-how-do-i-install-dependencies-first) discussion I am leaving the kubegres operator to be installed beforehand with the shellscript:

```
./deps.sh
```

If you don't then you will get errors about the kubegres CRD not being defined.

### Usage

Modify the values.yaml to your liking and install using helm as usual:

```
helm install -f /tmp/values-test.yaml test ./
```

Then await on the kubegres and synapse pods to be `Running`:

```
kubectl get pods
NAME                              READY   STATUS    RESTARTS   AGE
nginx-7bd849c599-zmfpx            1/1     Running   0          6h3m
synwin-kubegres-1-0               1/1     Running   0          6m21s
synwin-kubegres-2-0               1/1     Running   0          6m8s
synwin-kubegres-3-0               1/1     Running   0          5m35s
synwin-synapse-67fd8fc665-xvfvx   1/1     Running   0          6m22s
```

Afterwards you can setup an admin user.

First login to one of the synapse pods:

```
kubectl exec -it $(kubectl get pods|grep test-synapse|awk '{print $1}'|tail -n1) -- /bin/bash
```

Then register_new_matrix_user on localhost port 8008:

```
register_new_matrix_user -u testy -p DEADBEEF -a -c /etc/synapse/homeserver.yaml http://localhost:8008
```

Now go pick a [client](https://matrix.org/docs/projects/try-matrix-now/#clients) and join your new server.

That command has an `-h` option for help:

```
register_new_matrix_user -h
usage: register_new_matrix_user [-h] [-u USER] [-p PASSWORD] [-t USER_TYPE] [-a | --no-admin] (-c CONFIG | -k SHARED_SECRET) [server_url]

Used to register new users with a given homeserver when registration has been disabled. The homeserver must be configured with the 'registration_shared_secret' option set.

positional arguments:
  server_url            URL to use to talk to the homeserver. Defaults to 'https://localhost:8448'.

optional arguments:
  -h, --help            show this help message and exit
  -u USER, --user USER  Local part of the new user. Will prompt if omitted.
  -p PASSWORD, --password PASSWORD
                        New password for user. Will prompt if omitted.
  -t USER_TYPE, --user_type USER_TYPE
                        User type as specified in synapse.api.constants.UserTypes
  -a, --admin           Register new user as an admin. Will prompt if --no-admin is not set either.
  --no-admin            Register new user as a regular user. Will prompt if --admin is not set either.
  -c CONFIG, --config CONFIG
                        Path to server config file. Used to read in shared secret.
  -k SHARED_SECRET, --shared-secret SHARED_SECRET
                        Shared secret as defined in server config file.
```
