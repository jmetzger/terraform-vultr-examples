# Example for vultr 

## 1. virtual-server 

```
docker run --entrypoint="" -it hashicorp/terraform sh
```

```
# in terminal
cd
git clone https://github.com/jmetzger/terraform-vultr-examples
cd terraform-vultr-examples
cd virtual-server
```

```
# set the righ value in here
export TF_VAR_VULTR_API_KEY=
```

```
terraform init
terraform plan
terraform apply -auto-approve
``` 
