Aws.config.update({
                      s3_region: 'us-east-2',
                      credentials: Aws::Credentials.new(Figaro.env.AWSAccessKeyId, Figaro.env.AWSSecretKey),
                  })

S3_BUCKET = Aws::S3::Resource.new.bucket(Figaro.env.S3_Bucket)