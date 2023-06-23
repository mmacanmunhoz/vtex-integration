resource "aws_elastic_beanstalk_application" "this" {
  name        =  "${local.name_app}"
  description = "Vtex Integration"
}

resource "aws_elastic_beanstalk_environment" "this" {
  name         = "${local.name_app}"
  application  = aws_elastic_beanstalk_application.this.name
  cname_prefix = "${local.name_app}"

  solution_stack_name = "64bit Amazon Linux 2 v3.1.2 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.this.arn
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "True"
  }


  dynamic "setting" {
    for_each = local.app_env
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application_version" "this" {
  name        = "${local.name_app}-ebs-version"
  application = aws_elastic_beanstalk_application.this.name
  description = "application version created by terraform"
  bucket      = aws_s3_bucket.this.id
  key         = aws_s3_bucket_object.this.id
}
