#!/bin/bash
oc patch $1 --patch '{"spec":{"template":{"metadata":{"annotations":{"sidecar.istio.io/inject": "true"}}}}}'
