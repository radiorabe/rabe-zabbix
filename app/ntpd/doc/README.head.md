Monitoring for ntpd.

There is both a template for authoritative ntpd servers as well as for simple
clock slaves. They share most items and differ in what exactly gets triggered.

The client template takes special care to check that all configured servers 
are valid peers while the server configuration will focus more on making sure 
that a local cluster of ntpd services stays in sync with an NTP pool.

Basics that do not differ from the client to the server are in a common
template which the individual server and client templates reference.
