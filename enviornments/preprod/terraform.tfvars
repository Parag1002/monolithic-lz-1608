
rgs_parent={
  rg1 = {
    name   = "rg-nsn1"
    location = "centralindia"

  }
 rg2 = {
    name   = "rg-nsn2"
    location = "centralindia"

  }

}

vnets_parent = {
    vnet1 = {
      name                = "nsn1_virtual_network"
      resource_group_name = "rg-nsn1"
      location            = "Centralindia"
      address_space       = ["10.0.0.0/16"]
    
  }
}

subnet_parent = {
    snet1 = {
      name                 = "frontend_subnet"
      resource_group_name  = "rg-nsn1"
      virtual_network_name = "nsn1_virtual_network"
      address_prefixes     = ["10.0.1.0/24"]
    }

    snet2 = {
      name                 = "backend_subnet"
      resource_group_name  = "rg-nsn1"
      virtual_network_name = "nsn1_virtual_network"
      address_prefixes     = ["10.0.2.0/24"]
    }
  }


public_ips_parent = {
    pip1 = {
      name                = "pip-frontend-vm"
      resource_group_name = "rg-nsn1"
      location            = "centralindia"
      allocation_method   = "Static"
    }
    pip2 = {
      name                = "pip-backend-vm"
      resource_group_name = "rg-nsn1"
      location            = "centralindia"
      allocation_method   = "Static"
    }
}

vms_parent= {

     vm1 = {
      nic_name        = "frontend-vm-nic"
      location        = "centralindia"
      rg_name         = "rg-nsn1"
      nic_subnet_name = "frontend_subnet"
      nic_vnet_name   = "nsn1_virtual_network"
      nic_pip_name    = "pip-frontend-vm"
      vm_name         = "frontend-vm"
      vm_size         = "Standard_D4_v5"
      admin_username  = "devopsadmin"
      admin_password  = "Devops@123456"


    }

    vm2 = {
      nic_name        = "backend-vm-nic"
      location        = "centralindia"
      rg_name         = "rg-nsn1"
      nic_subnet_name = "backend_subnet"
      nic_vnet_name   = "nsn1_virtual_network"
      nic_pip_name    = "pip-backend-vm"
      vm_name         = "backend-vm"
      vm_size         = "Standard_D4_v5"
      admin_username  = "devopsadmin"
      admin_password  = "Devops@123456"

    }
  }









