import boto3

# Let's use Amazon S3

s3 = boto3.resource('s3')

# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)

# Upload a new file
data = open('/Users/saupathak/Devops/kubernetes/ovn_kubernetes.png', 'rb')
s3.Bucket('kopsstatenew').put_object(Key='ovn_kubernetes.png', Body=data)
