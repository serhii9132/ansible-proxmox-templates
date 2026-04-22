# ansible-proxmox-templates

#### This playbook automates the mass deployment and configuration of Proxmox VE templates

Supported images:
```sh
- Debian 12
- Debian 13
- Ubuntu 22.04
- Ubuntu 24.04
- AlmaLinux 8.10
- AlmaLinux 9.7
- AlmaLinux 10.1
```

### Notes
- Allowed root login via SSH keys
- Package qemu-guest-agent has been pre-installed
- Template parameters: 
    - CPU: 2 cores
    - RAM: 4 GB
    - Disk: ${base_size_of_cloudinit_image} + 30 Gb 

### Playbook variables

<table>
<thead>
  <tr>
    <th>Name</th>
    <th>Comment</th>
    <th>Type</th>
    <th>Default value</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>proxmox_target</td>
    <td>Comma-separated names of the templates to be deployed</td>
    <td>str</td>
    <td>all</td>
  </tr>
  <tr>
    <td>proxmox_api_host</td>
    <td>Specify the target host of the Proxmox VE cluster</td>
    <td>str</td>
    <td>''</td>
  </tr>
  <tr>
    <td>proxmox_api_user</td>
    <td>Specify the user to authenticate with</td>
    <td>str</td>
    <td>''</td>
  </tr>
  <tr>
    <td>proxmox_api_token_id</td>
    <td>Specify the token ID</td>
    <td>str</td>
    <td>''</td>
  </tr>
  <tr>
    <td>proxmox_api_token_secret</td>
    <td>Specify the token secret</td>
    <td>str</td>
    <td>''</td>
  </tr>
  <tr>
    <td>proxmox_node</td>
    <td>Proxmox VE node on which to operate</td>
    <td>str</td>
    <td>''</td>
  </tr>
   <tr>
    <td>proxmox_ci_hash_root_pass</td>
    <td>Hashed password for the root user</td>
    <td>str</td>
    <td>''</td>
  </tr>
   <tr>
    <td>proxmox_ci_ssh_pub_key</td>
    <td>SSH key to assign to the root user</td>
    <td>str</td>
    <td>''</td>
  </tr>
  <tr>
    <td>proxmox_vm_network</td>
    <td>The network interface parameters for the VM</td>
    <td>dict</td>
    <td>net0: virtio,bridge=vmbr0</td>
  </tr>
</tbody>
</table>

### Usage
Examples for playbook execution:
```sh
bash bootstrap.sh -l -pve-dev
bash bootstrap.sh -e "proxmox_target=debian-12" -l pve-dev
bash bootstrap.sh -e "proxmox_target=debian-12,debian-13,ubuntu-24.04" -l pve-dev
```

### License
MIT