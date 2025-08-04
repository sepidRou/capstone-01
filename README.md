You’ve joined a small startup that’s building a web-based SaaS product.

Your task as a cloud engineer is to design and deploy the foundational Azure infrastructure using Terraform, following these requirements:

# Capstone-01

## 🔧 Components Deployed

- 🌐 **Virtual Network (VNet)** with public & private subnets  
- 🛡️ **NSGs** (Network Security Groups) for traffic control  
- 💻 **Linux VM** to simulate backend  
- 🌍 **App Service** for frontend  
- 📂 **Azure Storage Account** for blob storage  
- 🔐 **Key Vault** to store secrets  
- 📈 **Log Analytics Workspace** for monitoring 

## 📁 Structure
```bash
Capstone-01/
├── main.tf
├── terraform.tfvars
├── .gitignore
├── parts/
│   ├── network/
│   │   └── main.tf
│   ├── compute/
│   │   └── main.tf
│   └── Appservice/ 