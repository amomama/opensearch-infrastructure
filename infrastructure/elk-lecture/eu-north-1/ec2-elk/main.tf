resource "aws_instance" "this" {
  for_each = var.ec2_instance

  # todo

  provisioner "local-exec" {
    environment = {
      PROVISION = length(each.value["ansible_playbook"]) > 0 ? true : false
    }

    command = "sleep 10 && $PROVISION && ANSIBLE_SSH_RETRIES=10 ANSIBLE_ROLES_PATH=`git rev-parse --show-toplevel`/provisioning/roles ansible-playbook -i '${self.public_ip},' -u ${each.value["ansible_remote_user"]} --private-key ${each.value["ansible_private_key"]} ${each.value["ansible_playbook"]} || echo Provision skipped"
  }
}
