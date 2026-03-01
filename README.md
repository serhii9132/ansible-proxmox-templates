# ansible-proxmox-templates

#### This playbook automates the mass deployment and configuration of Proxmox VE templates

Supported images:
```sh
- Debian 12
- Debian 13
- Ubuntu 22.04
- Ubuntu 24.04
- AlmaLinux 8.10
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
  </tr>
</thead>
<tbody>
  <tr>
    <td>proxmox_api_host</td>
    <td>Specify the target host of the Proxmox VE cluster/td>
    <td>str</td>
  </tr>
  <tr>
    <td>proxmox_api_user</td>
    <td>Specify the user to authenticate with/td>
    <td>str</td>
  </tr>
  <tr>
    <td>proxmox_api_token_id</td>
    <td>Specify the token ID</td>
    <td>str</td>
  </tr>
  <tr>
    <td>proxmox_api_token_secret</td>
    <td>Specify the token secret</td>
    <td>str</td>
  </tr>
  <tr>
    <td>proxmox_node</td>
    <td>Proxmox VE node on which to operate</td>
    <td>str</td>
  </tr>
   <tr>
    <td>proxmox_ci_hash_root_pass</td>
    <td>Hashed password for the root user</td>
    <td>str</td>
  </tr>
   <tr>
    <td>proxmox_ci_ssh_pub_key</td>
    <td>SSH key to assign to the root user</td>
    <td>str</td>
  </tr>
</tbody>
</table>

### Usage
```sh
bash bootstrap.sh
```

### License
MIT