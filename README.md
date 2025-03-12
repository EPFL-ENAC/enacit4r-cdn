# ENACIT4Research CDN

Hosted on https://enacit4r-cdn.epfl.ch/

# How do I upload my dataset ?

1. install _s3cmd_

   - [on Windows](https://tecadmin.net/setup-s3cmd-in-windows/)
   - on Mac OS :
     ```bash
     brew install s3cmd
     ```
   - on Ubuntu :
     ```bash
     sudo apt install s3cmd
     ```

2. configure _s3cmd_

   ```bash
   s3cmd --configure
   ```

   Answers :

   - Access Key : documented in enacit4r KeeWeb
   - Secret Key : idem
   - Region : keep default
   - S3 Endpoint : s3.epfl.ch
   - DNS-style bucket+hostname:port template for accessing a bucket : s3.epfl.ch/%(bucket)
   - Encryption password : keep empty
   - Path to GPG program : keep default
   - Use HTTPS protocol : Yes
   - HTTP Proxy server name : keep empty
   - Test access with supplied credentials? : Yes
   - Save settings? : Yes

3. upload your project data to S3 storage

   ```bash
   export BUCKET_NAME="documented in enacit-linux-sysadmins KeeWeb"
   export VERSION_NAME=$(date +%F)

   s3cmd put --recursive --acl-public --guess-mime-type myProjectDataOrDist s3://${BUCKET_NAME}/myProject/${VERSION_NAME}/
   ```

4. Use it

https://enacit4r-cdn.epfl.ch/myProject/2022-05-08/path/to/my/file

# Local Development Setup

To run this service locally for development or testing purposes:

1. Create a `.env` file (or modify your existing one) with the variables found in `.env.example`:

2. Generate self-signed certificates (if needed):

   ```bash
   make generate-selfsigned-cert
   ```

3. Start the service:

   ```bash
   make run
   ```

4. Test access:

   ```bash
   curl -k https://localhost/path/to/resource
   ```

   Note: The `-k` flag is needed to accept the self-signed certificate.
