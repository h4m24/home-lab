import os
from proxmoxer import ProxmoxAPI
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Proxmox API credentials
PROXMOX_HOST = os.getenv("PROXMOX_HOST")
PROXMOX_USER = os.getenv("PROXMOX_USER")
PROXMOX_TOKEN_NAME = os.getenv("PROXMOX_TOKEN_NAME")
PROXMOX_TOKEN_VALUE = os.getenv("PROXMOX_TOKEN_VALUE")
VERIFY_SSL = True  # Set to True if using a valid SSL certificate

# Cloud-init configuration
NODE = os.getenv("NODE")
VM_ID = 8001  # Replace with your VM ID
STORAGE = os.getenv("STORAGE")
DISK_SIZE = "2G"  # Replace with the disk size for the cloud-init volume
CLOUD_INIT_FILE = "user-data.yaml"  # Replace with your cloud-init file name

def create_cloud_init_volume():
    try:
        # Check if the cloud-init YAML file exists
        if not os.path.exists(CLOUD_INIT_FILE):
            raise FileNotFoundError(f"Cloud-init file '{CLOUD_INIT_FILE}' not found in the current directory.")

        # Connect to the Proxmox API using API token
        proxmox = ProxmoxAPI(PROXMOX_HOST, user=PROXMOX_USER, token_name=PROXMOX_TOKEN_NAME, token_value=PROXMOX_TOKEN_VALUE, verify_ssl=VERIFY_SSL)

        # Check if the VM exists
        vm_exists = proxmox.nodes(NODE).qemu.get(VM_ID)
        if not vm_exists:
            raise ValueError(f"VM with ID {VM_ID} does not exist on node {NODE}.")

        # Create the cloud-init volume
        response = proxmox.nodes(NODE).qemu(VM_ID).config.post(
            ciuser="asdasdasdasdasdasd",  # Replace with the default user for cloud-init
            cipassword="asdasdasdas"  # Replace with the default password for cloud-init
        )

        print(f"Cloud-init configuration updated successfully: {response}")
    except Exception as e:
        print(f"Failed to configure cloud-init: {e}")

if __name__ == "__main__":
    create_cloud_init_volume()
