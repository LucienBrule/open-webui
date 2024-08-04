# Operations

This directory contains the files necessary for "ops" or operations.

The directory structure is as follows:

```text
ops
├── docker
│   ├── compose     # Docker compose files
│   └── images      # Docker images
├── kubernetes
│   ├── helm        # Helm charts
│   └── manifest    # Kubernetes manifests
├── makefiles       # Modular makefiles
│   ├── backend.mk
│   ├── docker.mk
│   └── frontend.mk
└── README.md       # This file
```
## Details 

** docker/compose **

- Docker compose files for local development testing and light production use.
- <insert description of bases here>

** docker/images **

- Docker images for the project.
- <insert description of bases here>

** kubernetes/helm **

- Helm charts for the project.
- As of now Helm charts are hosted in a seperate repository.
- You can find the repository [here](https://github.com/open-webui/helm-charts).

** kubernetes/manifest **

- Raw Kubernetes manifests for the project.
- Use these manifests with the kustomization.yaml file to configure them to your needs.