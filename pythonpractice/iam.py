import boto3
iam = boto3.client('iam')
users = iam.list_users()
for key in users['Users']:
    print key['UserName']