FROM quay.io/openshift/origin-cli:latest
ARG HELM_VERSION=3.4.2
RUN curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar --strip-components=1 -C /usr/local/bin -xzf - linux-amd64/helm
