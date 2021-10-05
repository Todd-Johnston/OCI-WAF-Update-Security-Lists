# OCI-WAF-Update-Security-Lists
Contained is a simple script for generating the JSON document required for updating Oracle Cloud Infrastructure security lists with all current OCI Web Application Firewall CIDR ranges listed by Oracle.

## Description
Currently, security lists in OCI have to be manually configured to allow the CIDR ranges of the WAF servers. This is a tedious task even when using the OCI CLI interface but this script eliminates most of the work by generating a JSON file with most paramaters configured in the correct format.

A list of these CIDR ranges can be found at https://docs.oracle.com/en-us/iaas/Content/WAF/Concepts/gettingstarted.htm.

By default this script specifies the destination port as 443 and the protocol as TCP. This can be changed by editing the script.

## Getting Started
Clone the repository or download the generate_sec_list.sh file to your cloud shell on the OCI console. You may also download the cidr_ranges.txt file but it is recommended you create a new file by copying the listed ranges from the link above to ensure they are current.

Also ensure that you have setup your cloud shell CLI correctly - https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliconfigure.htm#Configuring_the_CLI.

This method also requires the security list to have been created in the OCI console, which is detailed here - https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/securitylists.htm. Note that you will need the OCID of the target security list.

### Installing
You may have to make the script executable if running in the OCI cloud shell e.g.
```
chmod +x generate_sec_list.sh 
```

### Executing program
Execute the script in the same location as your cidr_ranges.txt file
```
bash ./generate_sec_list.sh > security_list.json 
```
Once the script has finished, use the following CLI command to update the required security list with the target OCID
```
oci network security-list update --security-list-id $yoursecuritylistOCID --ingress-security-rules file://security_list.json
```
e.g.
```
oci network security-list update --security-list-id ocid1.securitylist.someocid13131 --ingress-security-rules file://security_list.json
```


## Help
This script can be modified to produce/change any paramaters that are accepted by the CLI update security list command. If there is interest multiple versions of the script can be made to accomodate for different requirements e.g. port 80 and protocol "all".

## Authors
[Todd Johnston](https://github.com/Todd-Johnston)

## Version History
 0.1
     Initial Release

## Acknowledgments
[Sam Eu - A simple guide to adding rules to security lists using OCI CLI](https://blogs.oracle.com/cloud-infrastructure/post/a-simple-guide-to-adding-rules-to-security-lists-using-oci-cli)
[BaptiSS - Lockdown OCI WAF Origin using CloudShell (SecList)](https://github.com/BaptisS/oci_waf_seclist)
[DomPizzie - A simple README.md template](https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc)
