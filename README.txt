LocalStack Node.js + Terraform Demo

Prerequisites:
- Docker + LocalStack running on localhost:4566
- AWS CLI
- Terraform

Steps:
1. Run: terraform init
2. Run: terraform plan
3. Run: terraform apply -auto-approve
4. Check: aws --endpoint-url=http://localhost:4566 lambda list-functions
5. Invoke:
   aws --endpoint-url=http://localhost:4566 lambda invoke --function-name localstack-nodejs-demo response.json
6. Read response.json
