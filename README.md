# Configuração do Cluster AWS EKS com Terraform

Este script Terraform permite que você provisione facilmente um cluster Amazon EKS (Elastic Kubernetes Service) na AWS. Amazon EKS é um serviço gerenciado de Kubernetes que facilita a implantação, gerenciamento e dimensionamento de aplicativos em contêiner usando Kubernetes.

## Pré-requisitos

Antes de começar, certifique-se de ter o seguinte:

- Conta AWS com permissões apropriadas para criar clusters EKS.
- Terraform instalado em sua máquina local. Você pode baixá-lo [aqui](https://www.terraform.io/downloads.html).
- AWS CLI instalado e configurado com credenciais apropriadas. Você pode baixá-lo [aqui](https://aws.amazon.com/cli/).

## Instruções de Configuração

1. Clone este repositório em sua máquina local:

    ```bash
    git clone git@github.com:postech-g38/terraform-eks.git
    ```

2. Navegue até o diretório clonado:

    ```bash
    cd terraform-eks
    ```


3. Inicialize o Terraform:

    ```bash
    terraform init
    ```

4. Revise o plano de execução:

    ```bash
    terraform plan
    ```

5. Aplique a configuração do Terraform para criar o cluster EKS:

    ```bash
    terraform apply
    ```

6. Uma vez que o cluster for provisionado, configure o `kubectl` para se comunicar com o cluster EKS recém-criado:

    ```bash
    aws eks --region us-west-2 update-kubeconfig --name byteburguer-eks-cluster
    ```

7. Verifique se o `kubectl` está configurado corretamente e se você pode acessar o cluster EKS:

    ```bash
    kubectl get nodes
    ```

## Limpeza

Para evitar incorrer em cobranças, certifique-se de destruir o cluster EKS após concluir os testes:

```bash
terraform destroy
```
