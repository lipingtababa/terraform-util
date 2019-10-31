This repo is to collect all the pitfalls, traps, limitations and workaround I found in terraform.

List 
- User data doesn't guarantee successful mount of volumes and could result in deadly consequence.
- you are not able to attach a list of volumes to a list of instances by for_each or ofr loop. The only way out is to copy and paste
- detaching a volum from a instance is asynchronical for AWS and will not finish until the volume is umounted and it could take like 14 days to wait for the umounting.
