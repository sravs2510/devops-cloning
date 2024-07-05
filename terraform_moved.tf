moved {
  from = module.create_in_vpc.aws_eip.eip_nat_gateway
  to   = module.create_in_vpc[0].aws_eip.eip_nat_gateway
}
moved {
  from = module.create_in_vpc.aws_internet_gateway.vpc_gateway
  to   = module.create_in_vpc[0].aws_internet_gateway.vpc_gateway
}
moved {
  from = module.create_in_vpc.aws_main_route_table_association.route_table_association
  to   = module.create_in_vpc[0].aws_main_route_table_association.route_table_association
}
moved {
  from = module.create_in_vpc.aws_nat_gateway.nat_gateway
  to   = module.create_in_vpc[0].aws_nat_gateway.nat_gateway
}
moved {
  from = module.create_in_vpc.aws_route_table.main_routetable
  to   = module.create_in_vpc[0].aws_route_table.main_routetable
}
moved {
  from = module.create_in_vpc.aws_route_table.private_route_table
  to   = module.create_in_vpc[0].aws_route_table.private_route_table
}
moved {
  from = module.create_in_vpc.aws_route_table.public_route_table
  to   = module.create_in_vpc[0].aws_route_table.public_route_table
}
moved {
  from = module.create_in_vpc.aws_route_table_association.private[0]
  to   = module.create_in_vpc[0].aws_route_table_association.private[0]
}
moved {
  from = module.create_in_vpc.aws_route_table_association.private[1]
  to   = module.create_in_vpc[0].aws_route_table_association.private[1]
}
moved {
  from = module.create_in_vpc.aws_route_table_association.private[2]
  to   = module.create_in_vpc[0].aws_route_table_association.private[2]
}
moved {
  from = module.create_in_vpc.aws_route_table_association.public[0]
  to   = module.create_in_vpc[0].aws_route_table_association.public[0]
}
moved {
  from = module.create_in_vpc.aws_route_table_association.public[1]
  to   = module.create_in_vpc[0].aws_route_table_association.public[1]
}
moved {
  from = module.create_in_vpc.aws_route_table_association.public[2]
  to   = module.create_in_vpc[0].aws_route_table_association.public[2]
}
moved {
  from = module.create_in_vpc.aws_security_group.cyborg_security_group
  to   = module.create_in_vpc[0].aws_security_group.cyborg_security_group
}
moved {
  from = module.create_in_vpc.aws_security_group.lambda_security_group
  to   = module.create_in_vpc[0].aws_security_group.lambda_security_group
}
moved {
  from = module.create_in_vpc.aws_subnet.private_subnet[0]
  to   = module.create_in_vpc[0].aws_subnet.private_subnet[0]
}
moved {
  from = module.create_in_vpc.aws_subnet.private_subnet[1]
  to   = module.create_in_vpc[0].aws_subnet.private_subnet[1]
}
moved {
  from = module.create_in_vpc.aws_subnet.private_subnet[2]
  to   = module.create_in_vpc[0].aws_subnet.private_subnet[2]
}
moved {
  from = module.create_in_vpc.aws_subnet.public_subnet[0]
  to   = module.create_in_vpc[0].aws_subnet.public_subnet[0]
}
moved {
  from = module.create_in_vpc.aws_subnet.public_subnet[1]
  to   = module.create_in_vpc[0].aws_subnet.public_subnet[1]
}
moved {
  from = module.create_in_vpc.aws_subnet.public_subnet[2]
  to   = module.create_in_vpc[0].aws_subnet.public_subnet[2]
}
moved {
  from = module.create_in_vpc.aws_vpc.main
  to   = module.create_in_vpc[0].aws_vpc.main
}
moved {
  from = module.create_in_vpc.aws_vpc_endpoint.dynamodb_endpoint
  to   = module.create_in_vpc[0].aws_vpc_endpoint.dynamodb_endpoint
}
moved {
  from = module.create_in_vpc.aws_vpc_endpoint.efs_endpoint
  to   = module.create_in_vpc[0].aws_vpc_endpoint.efs_endpoint
}
moved {
  from = module.create_in_vpc.aws_vpc_endpoint.s3_endpoint
  to   = module.create_in_vpc[0].aws_vpc_endpoint.s3_endpoint
}
