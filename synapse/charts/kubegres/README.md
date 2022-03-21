# kubegres chart

### Operator

Due to [this](https://stackoverflow.com/questions/60283240/helm-chart-how-do-i-install-dependencies-first) discussion I am leaving the operator to be installed beforehand manually, with

```
kubectl apply -f operator.yaml
```

If you don't then you will get errors about the kubegres CRD not being defined.

### Usage

Modify the values.yaml to your liking and install using helm as usual:

```
helm install -f /tmp/values-test.yaml kubegrestest ./
```
