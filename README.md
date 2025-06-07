# Paperless-AI Helm Chart

This Helm chart deploys Paperless-AI in a Kubernetes cluster.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `paperless-ai`:

```bash
helm install paperless-ai ./paperless-ai
```

## Configuration

The following table lists the configurable parameters of the Paperless-AI chart and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `replicaCount` | Number of replicas | `1` |
| `image.repository` | Image repository | `clusterzx/paperless-ai` |
| `image.tag` | Image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `service.type` | Service type | `ClusterIP` |
| `service.port` | Service port | `3000` |
| `ingress.enabled` | Enable ingress | `false` |
| `persistence.enabled` | Enable persistence | `true` |
| `persistence.size` | Persistence size | `10Gi` |
| `persistence.storageClass` | Persistence storage class | `""` |
| `persistence.accessMode` | Persistence access mode | `ReadWriteOnce` |
| `env` | Environment variables to pass to the container | `HOST: "0.0.0.0"` |

## Example values.yaml for NodePort

```yaml
service:
  type: NodePort
  port: 3000
  nodePort: 30000
```

## Example values.yaml with custom environment variables

```yaml
env:
  HOST: "0.0.0.0"
  DEBUG: "true"
  API_KEY: "your-api-key"
  CUSTOM_SETTING: "value"
```
