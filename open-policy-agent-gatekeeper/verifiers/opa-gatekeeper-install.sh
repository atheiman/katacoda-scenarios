kubectl wait -n gatekeeper-system pod --all --for=condition=Ready --timeout=3m && echo "done"
