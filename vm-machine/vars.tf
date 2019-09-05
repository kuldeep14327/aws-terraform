variable "vsphere_user" {
	default = ""
}

variable "vsphere_password" {
	default = ""
}
variable "vsphere_server" {
	default = ""
}

# Comment this line out if you use datastore clusters

variable "datacenter_name" {
	default = ""
}

# Comment this line out if you use datastore clusters

variable "datastore_name" {
	default = ""
}

# Comment this line out if you use datastore clusters

variable "compute_cluster_name" {
	default = ""
}

# Comment this line out if you use network_name

variable "network_name" {
	default = ""
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
