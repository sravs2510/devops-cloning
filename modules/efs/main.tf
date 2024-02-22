terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.efs_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.efs_region
}

resource "aws_efs_file_system" "efs" {
  provider        = aws.efs_region
  encrypted       = true
  throughput_mode = "elastic"
  tags = merge(
    tomap({ "Name" = var.efs_configuration.name }),
    tomap({ "STAGE" = var.STAGE }),
    var.DEFAULT_TAGS
  )
}

data "aws_iam_policy_document" "efs_policy" {
  provider = aws.efs_region
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "elasticfilesystem:ClientMount",
      "elasticfilesystem:ClientWrite",
    ]
    resources = [aws_efs_file_system.efs.arn]
  }
}

resource "aws_efs_file_system_policy" "efs_policy" {
  provider       = aws.efs_region
  file_system_id = aws_efs_file_system.efs.id
  policy         = data.aws_iam_policy_document.efs_policy.json
}

resource "aws_efs_mount_target" "efs_mount_target" {
  provider        = aws.efs_region
  file_system_id  = aws_efs_file_system.efs.id
  security_groups = toset([var.sg_id])

  for_each = length(var.private_subnets) == 3 ? {
    "subnet_id_1" = var.private_subnets[0]
    "subnet_id_2" = var.private_subnets[1]
    "subnet_id_3" = var.private_subnets[2]
  } : {}
  subnet_id = each.value
}

resource "aws_efs_access_point" "access_point" {
  provider       = aws.efs_region
  file_system_id = aws_efs_file_system.efs.id

  posix_user {
    uid            = "1000"
    gid            = "1000"
    secondary_gids = ["0"]
  }

  root_directory {
    creation_info {
      owner_uid   = 1000
      owner_gid   = 1000
      permissions = "0777"
    }
    path = var.efs_configuration.path
  }

  depends_on = [
    aws_efs_mount_target.efs_mount_target
  ]

  tags = merge(
    tomap({ "Name" = join("-", [var.efs_configuration.name, "access-point"]) }),
    tomap({ "STAGE" = var.STAGE }),
    var.DEFAULT_TAGS
  )
}
