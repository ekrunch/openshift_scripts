#!/bin/bash
#oc get route -n istio-system istio-ingressgateway
export GATEWAY_URL=$(oc get route -n istio-system istio-ingressgateway -o jsonpath='{.spec.host}')
curl -k -o /dev/null -s -w "%{http_code}\n" http://$GATEWAY_URL/productpage
