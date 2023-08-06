module "network" {
  source                = "./network"
  reg                   = var.isoft_reg
  vpc_cidr              = var.isoft_vpc_cidr
  public_subnet_1_cidr  = var.isoft_public_subnet_1_cidr
  public_subnet_2_cidr  = var.isoft_public_subnet_2_cidr
  private_subnet_1_cidr = var.isoft_private_subnet_1_cidr
  private_subnet_2_cidr = var.isoft_private_subnet_2_cidr
}

