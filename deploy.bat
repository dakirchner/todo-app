
set S3_BUCKET=dakirchner-todo-app
set INPUT_FILE=sam-template.yaml
set OUTPUT_FILE=sam-template-output.yaml
set STAGE_NAME=dev
set STACK_NAME=todo-app-java-%STAGE_NAME%

aws cloudformation package --template-file %INPUT_FILE% --output-template-file %OUTPUT_FILE% --s3-bucket %S3_BUCKET%
aws cloudformation deploy --template-file %OUTPUT_FILE% --stack-name %STACK_NAME% --parameter-overrides StageName=%STAGE_NAME% --capabilities CAPABILITY_IAM
