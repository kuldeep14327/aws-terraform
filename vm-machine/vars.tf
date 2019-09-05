variable "vsphere_user" {
	default = "KSADM441@vsphere.local"
}

variable "vsphere_password" {
	default = "Innovaccer@1"
}
variable "vsphere_server" {
	default = "10.10.3.30"
}

# Comment this line out if you use datastore clusters

variable "datacenter_name" {
	default = "InnoDC"
}

# Comment this line out if you use datastore clusters

variable "datastore_name" {
	default = "DevOpsEMC02"
}

# Comment this line out if you use datastore clusters

variable "compute_cluster_name" {
	default = "InnoDevops01"
}

# Comment this line out if you use network_name

variable "network_name" {
	default = "DevOpsvlan14"
}

variable "template_name" {
	default = "Centos7 minimal"
}

variable "launch_configuration_1" {
	type = "map"
	default = {
		"number_of_instace" = "3"
        "number_of_cpu"     = "2"
        "memory"            = "4096"
        "disk_size"         = "50"
		"connection_type"   = "ssh"
		"connection_user"   = "root"
    	"connection_password"    = "Root@123"
    }
}

variable "launch_configuration_2" {
	type = "map"
	default = {
		"number_of_instace" = "1"
        "number_of_cpu"     = "4"
        "memory"            = "4096"
        "disk_size"         = "100"
    }
}
