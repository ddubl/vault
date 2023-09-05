---
id: d4jamthfp5nxjcwt9t17zjn
title: DNS
desc: ''
updated: 1633199319598
created: 1633199319598
---
## DNS Record Definitions

### Summary

DNS (Domain Name System) entries take a human friendly name, such as store.example.com, and translates it to an IP address. DNS can be quickly updated with some propagation time. There are a number of DNS Entries you are able to create. The following DNS Entries can be created or modified from within the **DNS Zone Editor**.

### A Record

An A record (Address Record) points a domain or subdomain to an IP address.

(image/png)[Learn more about A Records](http://bluehost.com/cgi/help/a_record)

### CNAME

A CNAME (Canonical Name) points one domain or subdomain to another domain name, allowing you to update one A Record each time you make a change, regardless of how many Host Records need to resolve to that IP address.

(image/png)[Learn more about CNAMEs](http://bluehost.com/cgi/help/cname)

### MX Entry

An MX (Mail Exchanger) Entry directs email to a particular mail server. Like a CNAME, MX Entries must point to a domain and never point directly to an IP address.

(image/png)[Learn more about MX Entrys](http://bluehost.com/cgi/help/mxentry)

### TXT Entry

A TXT (Text) Entry was originally intended for human-readable text. These records are dynamic and can be used for several purposes.

(image/png)[Learn more about TXT Records](http://bluehost.com/cgi/help/txt_record)

### SRV record

An SRV (Service) record points one domain to another domain name using a specific destination port. SRV records allow specific services, such as VOIP or IM, to be be directed to a separate location.

(image/jpeg)[Learn more about SRV Records](http://bluehost.com/cgi/help/srv_record)

### AAAA Record

An AAAA record points a domain or subdomain to an IPv6 address.

(image/png)[Learn more about AAAA Records](http://bluehost.com/cgi/help/aaaa_record)

### DNS Glossary:

**Zone File:**

This is where all the DNS records are stored for a domain.

**Host Record:**

This is the domain or subdomain you wish to use. The @ symbol is used to indicate the root domain itself. In our example the Host Record 'ftp' would be for the subdomain ftp.google.com and '@' would be google.com itself.

**Points to:**

This is the destination server that the domain or subdomain is sending the traffic to.

**TTL:**

The 'time to live' value indicates the amount of time the record is cached by a DNS Server, such as your Internet service provider. The default (and lowest accepted) value is 14400 seconds (4 hours). You do not normally need to modify this value.

**Action:**

This allows you to modify or remove existing records.

**Weight:**

This is similar to priority, as it controls the order in which multiple records are used. Records are grouped with other records that have the same Priority value. As with MX Entries, lower numbers are used before higher numbers.

**Port:**

This is used by the server or computer to process traffic to specific services, ensuring that all traffic comes through the door that it's expected on.

**Target:**

This is the destination that the record is sending the traffic to.

This record would send traffic from service.example.com to listerning.otherexample.com over port 5060. SRV records generally require advanced knowledge of server administration to use.

Knowledgebase Article (image/png)
Was this resource helpful?
Did this resolve your issue?
Please add any other comments or suggestions about this content:

## Recommended Help Content

\[

#### What is an A Record?

Definition of an A Record (updated 381 days ago)

](<https://my.bluehost.com/cgi/help/a_record)[>

#### How to setup an MX Record

How to use the DNS Zone Editor to create a new MX Record (updated 1576 days ago)

](<https://my.bluehost.com/cgi/help/mx)[>

#### What is a CNAME

Definition of a CNAME (updated 389 days ago)

](<https://my.bluehost.com/cgi/help/cname>)

## Related Help Content

\[

#### How to Modify Your DNS Records

How Do I Add/Edit DNS settings for my cNAME, ARecord and TXT entries? (updated 74 days ago)

](<https://my.bluehost.com/cgi/help/559)[>

#### What is a TXT Record

Definition of a TXT Record (updated 1341 days ago)

](<https://my.bluehost.com/cgi/help/txt_record)[>

#### What is an SRV Record

Definition of an SRV Record (updated 1330 days ago)

](<https://my.bluehost.com/cgi/help/srv_record)[>

#### What is an AAAA Record

A definition of AAAA Records (updated 1330 days ago)

](<https://my.bluehost.com/cgi/help/aaaa_record)[>

#### Edit Reseller DNS Zone Template

Explains how to edit the DNS Zone Timplate. (updated 492 days ago)

](<https://my.bluehost.com/cgi/help/2197)[>

#### Wildcard Subdomains or DNS

Do you support wildcard subdomains or wildcard DNS entries? (updated 1277 days ago)

](<https://my.bluehost.com/cgi/help/527)[>

#### Pointing domain to Wix's service

How I do point my domain to my Wix account? (updated 1673 days ago)

](<https://my.bluehost.com/cgi/help/596)[>

#### DNS Entry Already Exists - Error Message in WHM

Explains how to fix the DNS entry already exists warning (updated 331 days ago)

](<https://my.bluehost.com/cgi/help/2198>)

