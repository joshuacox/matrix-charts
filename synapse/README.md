
# synapse chart

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
