#!make
include .env
export $(shell sed 's/=.*//' .env)

VERSION_CODE=`node -e "console.log(Math.floor(Date.now()/100000));"`

push-image:
	@npx tsc
	@docker build -t ${IMAGE_NAME} . 
	@aws ecr get-login-password --region ${AWS_REGION} | docker login  --username AWS  --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
	@docker tag ${IMAGE_NAME} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:${VERSION_CODE}
	@docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:${VERSION_CODE}

update-lambda-image:
	@aws lambda update-function-code --region ${AWS_REGION} --function-name ${FUNCTION_NAME} --image-uri ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:${VERSION_CODE}

deploy:
	@$(MAKE) push-image
	@$(MAKE) update-lambda-image