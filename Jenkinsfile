pipeline {
    agent any

    environment {
        API_HOST         = credentials('proxmox_api_host')
        API_USER         = credentials('proxmox_api_user')
        API_TOKEN_ID     = credentials('proxmox_api_token_id')
        API_TOKEN_SECRET = credentials('proxmox_api_token_secret')
        PVE_NODE         = credentials('proxmox_node')
        PVE_HOST         = credentials('ansible_host')
        PVE_PORT         = credentials('ansible_port')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                credentialsId: 'github_repo_cred', 
                url: 'git@github.com:serhii9132/ansible-proxmox-templates.git'
            }
        }

        stage('Deploy') {
            steps {
                ansiblePlaybook(
                    playbook: 'playbook.yaml',
                    inventory: 'inventory.yaml',
                    credentialsId: 'proxmox_ssh_credentials', 
                    extras: "--ssh-common-args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'",
                    extraVars: [
                        ansible_host: [value: env.PVE_HOST, hidden: false],
                        ansible_port: [value: env.PVE_PORT, hidden: false],
                        proxmox_api_host: [value: env.API_HOST, hidden: false],
                        proxmox_api_user: [value: env.API_USER, hidden: false],
                        proxmox_api_token_id: [value: env.API_TOKEN_ID, hidden: true], 
                        proxmox_api_token_secret: [value: env.API_TOKEN_SECRET, hidden: true],
                        proxmox_node: [value: env.PVE_NODE, hidden: false],
                        proxmox_vm_network: [value: '{"net0": "virtio,bridge=vmbr0"}', hidden: false]
                    ]
                )
            }
        }
    }
}