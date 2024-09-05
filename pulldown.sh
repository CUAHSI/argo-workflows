#!/bin/bash

workflows=$(kubectl get workflowtemplates.argoproj.io -n workflows -o jsonpath="{range .items[*]}{.metadata.name}{'\n'}")

IFS=$'\n' read -r -d '' -a array <<< "$workflows"

for item in "${array[@]}"; do
  echo "Processing: $item"
  kubectl get workflowtemplates.argoproj.io "$item" -n workflows -o yaml > workflows/"$item".yml
done


