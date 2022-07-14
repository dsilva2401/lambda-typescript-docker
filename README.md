# AWS Lambda using Typescript and Docker

## First Setup

### 1. Setup your env file

Create a `.env` file in the root of your project and set your project variables.
`IMAGE_NAME` variable is used to tag your image locally and must be the same name as the ECR repository.

Example
```text
IMAGE_NAME=your-image-name
AWS_REGION=us-east-2
AWS_ACCOUNT_ID=123123123123
FUNCTION_NAME=yourFunctionName
```

### 2. Create an ECR Repository  in AWS Console

Create a repository using the same name as in the .env file (`IMAGE_NAME` variable)

### 3. Push your first image to your repo

To push the image execute the next command: `make push-image`

### 4. Create a new lambda function inside AWS Console 

Create a lambda function in the same AWS Region using the name you set in the `.env` file (`FUNCTION_NAME` variable) and select the container option with your ECR Repository.

### 4. Deploy your changes to lambda

Execute the next command to deploy your changes to AWS Lambda: `make deploy`.

Now you can test your function in the AWS Console.