roxmox VE 6.x release includes a feature to add custom cloud-init configs. Unfortunately there is **poor documentation**, so I had to figure this out by adding pieces of information together.

### The custom cloud-init files (user-data, meta-data, network-config)

The cloud-init files need to be stored in a **snippet**. This is not very well documented:

1. Go to `Storage View -> Storage -> Add -> Directory`
2. Give it an ID such as `snippets`, and specify any path on your host such as `/snippets`
3. Under `Content` choose `Snippets` and de-select `Disk image` (optional)
4. Upload (scp/rsync/whatever) your `user-data, meta-data, network-config` files to your _proxmox_ server in `/snippets/snippets/` (the directory should be there if you followed steps 1-3)

Finally, you just need to `qm set` with `--cicustom`, like this:

```
qm set 100 --cicustom "user=snippets:snippets/user-data,network=snippets:snippets/network-config,meta=snippets:snippets/meta-data"
```

Replace `100` with the ID of your VM.

### Add CloudInit Drive

Your VM **needs** a `CloudInit Drive` as well, since Proxmox adds your `cloud-init` data from your snippets into that drive (`/dev/sr0` ?). Leave the `Cloud-Init` UI settings to default, since they won't be used anyways.

### Warning

For the moment, you **can not** put the `user-data, meta-data, network-config` in any subdirectories, so something like this will fail:

```
qm set 100 --cicustom "user=snippets:snippets/cloud/data/user-data,network=snippets:snippets/cloud/data/network-config,meta=snippets:snippets/cloud/data/meta-data"
```

Finally, to apply the new cloud-init config you'll need to power off/on the VM (not reboot).

### Once booted

Once booted, your `platform/datasource` will be seen as `nocloud` and not `OpenStack`... assuming you're familiar with `cloud-init`, everything else should work perfectly.

Hope this helps someone out there!
