FROM registry.access.redhat.com/ubi8/ubi:8.4
ARG HELM_VERSION=3.6.0
ARG JQ_VERSION=1.6
ARG YQ_VERSION=4.9.3
ARG OC_VERSION=4.7.14
ARG TKN_VERSION=0.17.2
RUN dnf -y install gettext && \
    dnf clean all && \
    curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar --strip-components=1 -C /usr/local/bin -xzf - linux-amd64/helm && \
    curl -Lo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    curl -Lo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    rm -f /usr/bin/oc && \
    curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp-dev-preview/latest-4.7/openshift-client-linux-${OC_VERSION}.tar.gz | tar -C /usr/local/bin -xzf - && \
    curl -L http://mirror.openshift.com/pub/openshift-v4/clients/pipeline/${TKN_VERSION}/tkn-linux-amd64-${TKN_VERSION}.tar.gz | tar -C /usr/local/bin -xzf -
