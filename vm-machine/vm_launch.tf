resource "vsphere_virtual_machine" "kubenode" {
  count            = "${var.launch_configuration_1["number_of_instace"]}"
  name             = "kube-node-${count.index+1}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus                     = "${var.launch_configuration_1["number_of_cpu"]}"
  memory                       = "${var.launch_configuration_1["memory"]}"
  scsi_type                    = "${data.vsphere_virtual_machine.template.scsi_type}"
  guest_id                     = "centos7_64Guest"
  wait_for_guest_net_timeout   = 0
  wait_for_guest_net_routable  = false

  disk {
    label            = "disk0"
    # size             = "${var.launch_configuration_1["disk_size"]}"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
      }

   clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
   }

#   provisioner "file" {
#     source      = "${var.launch_configuration_1.["public_key"]}"
#     destination = "/home/centos/.ssh/authorized_keys"

#     connection {
#       type        = "${var.launch_configuration_1.["connection_type"]}"
#       user        = "${var.launch_configuration_1.["connection_user"]}"
#       password    = "${var.launch_configuration_1.["connection_password"]}"
#     }
# }

  # provisioner "file" {
  #   source      = "install_docker.sh"
  #   destination = "/tmp/"

  #   connection {
  #     host        = "${vsphere_virtual_machine.kubenode.default_ip_address}"
  #     type        = "${var.launch_configuration_1.["connection_type"]}"
  #     user        = "${var.launch_configuration_1.["connection_user"]}"
  #     password    = "${var.launch_configuration_1.["connection_user"]}"
  #     timeout = "10m"
  #   }
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/*sh",
  #     "sudo /tmp/install_docker.sh",
  #   ]
  #   connection {
  #     host         = "${vsphere_virtual_machine.kubenode.default_ip_address}"
  #     type         = "${var.launch_configuration_1.["connection_type"]}"
  #     user         = "${var.launch_configuration_1.["connection_user"]}"
  #     password     = "${var.launch_configuration_1.["connection_user"]}"
  #   }
  # }
  # # user_data = "${file("install_docker.sh")}"
}
