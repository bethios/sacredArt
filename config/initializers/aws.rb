Aws.config.update({
                      region: 'us-east-2',
                      credentials: Aws::Credentials.new(Figaro.env.AWS_ACCESS_KEY_ID, Figaro.env.AWS_SECRET_ACCESS_KEY),
                  })

S3_BUCKET = Figaro.env.S3_Bucket