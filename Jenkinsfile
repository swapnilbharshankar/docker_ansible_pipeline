node('docker'){
    stage 'Checkout'
        checkout scm
    stage 'Create Container using Ansible'
        sh "ansible-playbook ansible-playbook.yml"
}