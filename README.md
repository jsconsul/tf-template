# GCP Cloud Functions Terraform Template

A comprehensive, production-ready Terraform template for deploying Google Cloud Functions with Pub/Sub messaging infrastructure across multiple environments (production, staging, and test).

## Template Overview

This Terraform template provides a complete infrastructure-as-code solution for GCP Cloud Functions that:

- ** Cloud Functions**: Deploys scalable HTTP-triggered functions for webhook processing
- ** Pub/Sub Integration**: Handles asynchronous message processing with configurable retention
- ** Cloud Storage**: Manages function source code deployment and application data
- ** Multi-Environment**: Supports independent prod, staging, and test deployments
- ** Security**: Implements IAM, Secret Manager integration, and environment isolation
- ** Modular Design**: Reusable modules for consistent infrastructure patterns
- ** CI/CD Automation**: Google Cloud Build integration for automated deployments
- ** Branch-based Deployment**: Automatic environment selection based on Git branches

## Prerequisites

1. **Google Cloud Project**: Active GCP project with billing enabled
2. **Terraform**: Version compatible with Google provider 5.10.0
3. **Authentication**: GCP credentials configured (via `gcloud auth` or service account)
4. **Storage Buckets**: Pre-created GCS buckets for:
   - Terraform state storage (`cloud-function-prod`, `cloud-function-staging`, `cloud-function`)
   - Cloud Function source code storage
   - Application data storage
5. **Service Account**: IAM service account with appropriate permissions
6. **Secret Manager**: Credentials stored in Secret Manager (secret name: "credentials")
7. **Cloud Build API**: Enabled for automated deployments (optional)
8. **Source Repository**: Connected to Cloud Build for CI/CD (optional)

## Required Permissions

The service account needs these IAM roles:
- `roles/cloudfunctions.admin`
- `roles/pubsub.admin`
- `roles/storage.admin`
- `roles/secretmanager.secretAccessor`
- `roles/logging.admin`
- `roles/iam.serviceAccountUser`

**Additional permissions for Cloud Build automation:**
- `roles/cloudbuild.builds.builder`
- `roles/source.repos.admin` (if using Cloud Source Repositories)

## Automated Deployment with Cloud Build

This template includes Google Cloud Build configuration for automated CI/CD deployments. The automation is controlled by two key files:

### Cloud Build Configuration (`cloudbuild.yaml`)

The `cloudbuild.yaml` file defines the build pipeline that:
- Sets executable permissions on the deployment script
- Runs Terraform provisioning using the appropriate environment
- Uses branch-based deployment strategy

### Deployment Script (`script.sh`)

The `script.sh` handles environment-specific deployments:
- **`test` branch**: Deploys to test environment
- **`staging` branch**: Deploys to staging environment  
- **`main` branch**: Deploys to production environment

### Setting Up Automated Deployment

1. **Enable Cloud Build API**

2. **Connect Your Repository**

3. **Configure Branch Protection**

**Automated Deployment**: Push changes to the appropriate branch:
- Push to `test` → Automatic deployment to test environment
- Push to `staging` → Automatic deployment to staging environment  
- Push to `main` → Automatic deployment to production environment
