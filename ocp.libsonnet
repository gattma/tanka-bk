{
  ocp:: {
    route: {
      new(name, to, host = null, targetPort = 8080, tls = true): {
        apiVersion: 'route.openshift.io/v1',
        kind: 'Route',
        metadata: {
          name: name,
        },
        spec: {

          host: host,
          to: {
            kind: 'Service',
            name: to,
            weight: 100,
          },
          port: {
            targetPort: targetPort,
          },
          tls: if tls then {
            termination: 'edge',
            insecureEdgeTerminationPolicy: 'Redirect',
          } else null,
        },
      }
    }
  }
}