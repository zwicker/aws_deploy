# README
## Introduction

This is a basic rails app that allows the user to create bulk create instances and register their IDs on a database. This application will deploy Amazon AMI images to the Sydney AWS region, this could easily be expanded to include


## Instructions

### Environment Variables

The following AWS credentials need to be loaded into environment variables before running

```
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''
```

## Installation
```
bundle install
rake db:migrate
```

## Running the application

```
rails s
```

## Docker locally

```
docker run -t -e AWS_ACCESS_KEY_ID='' \
  -e AWS_SECRET_ACCESS_KEY='' \
  -p 3000:3000 zwicker/awsdeploy
```
