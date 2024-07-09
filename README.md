# Mobile Store

## This application is an online store for mobile devices.
## It uses microservices architecture, using MassTransit and RabbitMQ.
## Application backend is deployed as docker containers and the frontend is React-Redux with TypeScript + Chakra UI

## To run, execute initializeDb.sql script on local instance, register in stripe and put public key in MobileStoreUI project stripeConfig.ts, and private key to according config section in MobileStore.Api project's appsettings.json. Register in MailTrap and put the credentials in MailTrapOptions section in appsettings.json in MobileStore.Email.Service project, and put your email in EmailOptions section.
## Finally set docker-compose as startup project and run. For front-end - npm i -> npm run start.
