FROM registry.access.redhat.com/ubi8/ubi:8.5
ARG HELM_VERSION=3.8.1
ARG JQ_VERSION=1.6
ARG YQ_VERSION=4.22.1
ARG OC_VERSION=4.10.3
ARG TKN_VERSION=0.21.0
RUN dnf -y install gettext && \
    dnf clean all && \
    curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar --strip-components=1 -C /usr/local/bin -xzf - linux-amd64/helm && \
    curl -Lo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    curl -Lo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    curl -L https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux-${OC_VERSION}.tar.gz | tar -C /usr/local/bin -xzf - && \
    curl -L https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/pipeline/latest/tkn-linux-amd64-${TKN_VERSION}.tar.gz | tar --no-same-owner -C /usr/local/bin -xzf -
