FROM public.ecr.aws/lambda/nodejs:12

COPY ./build/ .

COPY package.json package.json

RUN npm install

CMD ["index.handler"]