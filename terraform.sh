#!/usr/bin/env bash

state_store_resource_group="contino-moj-tf-state"
state_store_storage_acccount="continomojtfstate"
bootstrap_state_storage_container="contino-moj-tfstate-container"
productEnvironment="local"
product="rhubarb" 

getCreds() {
    export TF_VAR_tenant_id=$ARM_TENANT_ID
    export TF_VAR_object_id=$ARM_CLIENT_ID
}

source getCreds

terraform init \
    -backend-config "storage_account_name=$state_store_storage_acccount" \
    -backend-config "container_name=$bootstrap_state_storage_container" \
    -backend-config "resource_group_name=$state_store_resource_group" \
    -backend-config "key=$product/$productEnvironment/terraform.tfstate" 

terraform "$@"
