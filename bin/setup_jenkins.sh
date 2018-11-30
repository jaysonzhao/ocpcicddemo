#!/bin/bash
# Setup Jenkins Project
if [ "$#" -ne 3 ]; then
    echo "Usage:"
    echo "  $0 GUID REPO CLUSTER"
    echo "  Example: $0 wkha https://github.com/redhat-gpte-devopsautomation/advdev_homework_template.git na311.openshift.opentlc.com"
    exit 1
fi

GUID=$1
REPO=$2
CLUSTER=$3
echo "Setting up Jenkins in project ${GUID}-jenkins from Git Repo ${REPO} for Cluster ${CLUSTER}"

# Set up Jenkins with sufficient resources
# TBD

# Create custom agent container image with skopeo
# TBD

# Create pipeline build config pointing to the ${REPO} with contextDir `openshift-tasks`
# TBD

# Make sure that Jenkins is fully up and running before proceeding!
while : ; do
  echo "Checking if Jenkins is Ready..."
  READY_REPLICAS=$(oc get dc jenkins -o yaml -n ${GUID}-jenkins|grep readyReplicas|awk -c '{print $2}')
  [[ "$READY_REPLICAS" == "1" ]] || break
  echo "...no. Sleeping 10 seconds."
  sleep 10
done
