# GitHub Actions - Overview.

Within this section, you will find information regarding the GitHub Actions used in this repository.

## Glossary.

- Authenticate to Google Cloud.
This action authenticates to Google Cloud using the service account and the workload_identity_provider
```yml
- name: Authenticate to Google Cloud
  id: auth
  uses: google-github-actions/auth@v0.4.0
  with:
    workload_identity_provider: projects/787448687190/locations/global/workloadIdentityPools/yorch-financial-pool/providers/github
    service_account: github-actions-runner@yorch-financial.iam.gserviceaccount.com
```

- Set up Google Cloud SDK.
This action allows us to interact with products ande services from Google Cloud
```yml
- name: Set up Google Cloud SDK
  uses: google-github-actions/setup-gcloud@v1.0.0
```

- Authenticate Docker with GC Artifact Registry.
This action authenticate Docker with Google Cloud Artifact Registry.
```yml
- name: Authorize push to Google Cloud Artifact Registry
  run: gcloud auth configure-docker us-central1-docker.pkg.dev
```
