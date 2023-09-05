---
id: aw6ibyibtaun6jwtk030gd8
title: Common
desc: ''
updated: 1633199319564
created: 1633199319564
---
## Common Gateway Interface

From Wikipedia, the free encyclopedia
Jump to: [navigation](https://en.wikipedia.org/wiki/Common_Gateway_Interface#mw-head), [search](https://en.wikipedia.org/wiki/Common_Gateway_Interface#p-search)
This article is about the software interface between a web server and programs. For other uses, see [CGI (disambiguation)](https://en.wikipedia.org/wiki/CGI_(disambiguation)).

In [computing](https://en.wikipedia.org/wiki/Computing), **Common Gateway Interface** (**CGI**) offers a standard [protocol](https://en.wikipedia.org/wiki/Communications_protocol) for [web servers](https://en.wikipedia.org/wiki/Web_server) to execute programs that execute like [Console applications](https://en.wikipedia.org/wiki/Console_application) (also called [Command-line interface programs](https://en.wikipedia.org/wiki/Command-line_interface)) running on a [server](https://en.wikipedia.org/wiki/Server_(computing)) that [generates web pages dynamically](https://en.wikipedia.org/wiki/Dynamic_web_page). Such programs are known as _CGI scripts_ or simply as _CGIs_. The specifics of how the script is executed by the server are determined by the server. In the common case, a CGI script executes at the time a request is made and generates HTML.[[1]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-1>)

## Contents

 [hide] 

- [1 History](https://en.wikipedia.org/wiki/Common_Gateway_Interface#History)
- [2 Purpose of the CGI standard](https://en.wikipedia.org/wiki/Common_Gateway_Interface#Purpose_of_the_CGI_standard)
- [3 Using CGI scripts](https://en.wikipedia.org/wiki/Common_Gateway_Interface#Using_CGI_scripts)
- [4 Example](https://en.wikipedia.org/wiki/Common_Gateway_Interface#Example)
- [5 Deployment](https://en.wikipedia.org/wiki/Common_Gateway_Interface#Deployment)
- [6 Uses](https://en.wikipedia.org/wiki/Common_Gateway_Interface#Uses)
- [7 Alternatives](https://en.wikipedia.org/wiki/Common_Gateway_Interface#Alternatives)
- [8 See also](https://en.wikipedia.org/wiki/Common_Gateway_Interface#See_also)
- [9 References](https://en.wikipedia.org/wiki/Common_Gateway_Interface#References)
- [10 External links](https://en.wikipedia.org/wiki/Common_Gateway_Interface#External_links)

## History\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=1)]

[(image/gif)](https://en.wikipedia.org/wiki/File:CGIlogo.gif)[](https://en.wikipedia.org/wiki/File:CGIlogo.gif)The official CGI logo from the spec announcement

In 1993 the [National Center for Supercomputing Applications](https://en.wikipedia.org/wiki/National_Center_for_Supercomputing_Applications) (NCSA) team wrote the specification for calling command line executables on the www-talk mailing list;[[2]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-2>) however, NCSA no longer hosts the specification.[[3]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-3)[[4]](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-4>) The other Web server developers adopted it, and it has been a standard for Web servers ever since. A work group chaired by [Ken Coar](https://en.wikipedia.org/wiki/Ken_Coar) started in November 1997 to get the NCSA definition of CGI more formally defined.[[5]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-5>) This work resulted in [RFC 3875](https://tools.ietf.org/html/rfc3875), which specified CGI Version 1.1. Specifically mentioned in the RFC are the following contributors:[[6]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-6>)

- [Rob McCool](https://en.wikipedia.org/wiki/Rob_McCool) (author of the [NCSA HTTPd](https://en.wikipedia.org/wiki/NCSA_HTTPd) [Web Server](https://en.wikipedia.org/wiki/HTTP_Server))
- John Franks (author of the GN Web Server)
- [Ari Luotonen](https://en.wikipedia.org/wiki/Ari_Luotonen) (the developer of the [CERN httpd](https://en.wikipedia.org/wiki/CERN_httpd) Web Server)
- Tony Sanders (author of the Plexus Web Server)
- George Phillips (Web server maintainer at the [University of British Columbia](https://en.wikipedia.org/wiki/University_of_British_Columbia))

Historically CGI scripts were often written using the C language. [RFC 3875](https://tools.ietf.org/html/rfc3875) "The Common Gateway Interface (CGI)" partially defines CGI using C,[[7]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-7>) as in saying that environment variables "are accessed by the C library routine getenv() or variable environ".

## Purpose of the CGI standard\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=2)]

Each [web server](https://en.wikipedia.org/wiki/Web_server) runs [HTTP](https://en.wikipedia.org/wiki/HTTP) server software, which responds to requests from [web browsers](https://en.wikipedia.org/wiki/Web_browser). Generally, the HTTP server has a [directory (folder)](https://en.wikipedia.org/wiki/Directory_(computing)), which is designated as a document collection — files that can be sent to Web browsers connected to this server.[[8]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-8>) For example, if the Web server has the domain name `example.com`, and its document collection is stored at `/usr/local/apache/htdocs` in the local file system, then the Web server will respond to a request for `http://example.com/index.html` by sending to the browser the (pre-written) file `/usr/local/apache/htdocs/index.html`.

For pages constructed on the fly, the server software may defer requests to separate programs and relay the results to the requesting client (usually, a web browser that displays the page to the end user). In the early days of the web, such programs were usually small and written in a scripting language; hence, they were known as _scripts_.

Such programs usually require some additional information to be specified with the request. For instance, if Wikipedia were implemented as a script, one thing the script would need to know is whether the user is logged in and, if logged in, under which name. The content at the top of a Wikipedia page depends on this information.

HTTP provides ways for browsers to pass such information to the web server, e.g. as part of the URL. The server software must then pass this information through to the script somehow.

Conversely, upon returning, the script must provide all the information required by HTTP for a response to the request: the HTTP status of the request, the document content (if available), the document type (e.g. HTML, PDF, or plain text), etcetera.

Initially, different server software would use different ways to exchange this information with scripts. As a result, it wasn't possible to write scripts that would work unmodified for different server software, even though the information being exchanged was the same. Therefore, it was decided to establish a standard way for exchanging this information: CGI (the _Common Gateway Interface_, as it defines a common way for server software to interface with scripts). Webpage generating programs invoked by server software that operate according to the CGI standard are known as _CGI scripts_.

This standard was quickly adopted and is still supported by all well-known server software, such as [Apache](https://en.wikipedia.org/wiki/Apache_HTTP_Server), [IIS](https://en.wikipedia.org/wiki/Internet_Information_Services), [Nginx](https://en.wikipedia.org/wiki/Nginx), and (with an extension) [node.js](https://en.wikipedia.org/wiki/Node.js)-based servers.

An early use of CGI scripts was to process forms. In the beginning of HTML, HTML forms typically had an "action" attribute and a button designated as the "submit" button. When the submit button is pushed the URI specified in the "action" attribute would be sent to the server with the data from the form sent as a query string. If the "action" specifies a CGI script then the CGI script would be executed and it then produces a HTML page.

## Using CGI scripts\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=3)]

A web server allows its owner to configure which URLs shall be handled by which CGI scripts.

This is usually done by marking a directory within the document collection as containing CGI scripts - its name is often `cgi-bin`. For example, `/usr/local/apache/htdocs/cgi-bin` could be designated as a CGI directory on the web server. When a Web browser requests a URL that points to a file within the CGI directory (e.g., `http://example.com/cgi-bin/printenv.pl/with/additional/path?and=a&query=string`), then, instead of simply sending that file (`/usr/local/apache/htdocs/cgi-bin/printenv.pl`) to the Web browser, the HTTP server runs the specified script and passes the output of the script to the Web browser. That is, anything that the script sends to [standard output](https://en.wikipedia.org/wiki/Standard_output) is passed to the Web client instead of being shown on-screen in a terminal window.

As remarked above, the CGI standard defines how additional information passed with the request is passed to the script. For instance, if a slash and additional directory name(s) are appended to the URL immediately after the name of the script (in this example, `/with/additional/path`), then that path is stored in the `PATH_INFO` [environment variable](https://en.wikipedia.org/wiki/Environment_variable) before the script is called. If parameters are sent to the script via an [HTTP GET](https://en.wikipedia.org/wiki/HTTP_GET) request (a question mark appended to the URL, followed by param=value pairs; in the example, `?and=a&query=string`), then those parameters are stored in the `QUERY_STRING` environment variable before the script is called. If parameters are sent to the script via an [HTTP POST](https://en.wikipedia.org/wiki/HTTP_POST) request, they are passed to the script's [standard input](https://en.wikipedia.org/wiki/Standard_input). The script can then read these environment variables or data from standard input and adapt to the Web browser's request.[[9]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-9>)

When a web server executes a CGI script it provides input to the console/shell program using environment variables or "standard input". Standard input is like typing data into a console/shell program; in the case of a CGI script, the web server does the typing. The CGI script writes data out to "standard output" and that output is sent to the client (the web browser) as a HTML page.

## Example\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=4)]

The following [Perl](https://en.wikipedia.org/wiki/Perl) program shows all the environment variables passed by the Web server:

\#!/usr/bin/perl

=head1 DESCRIPTION

printenv — a CGI program that just prints its environment

=cut
print "Content-type: text/plain\\n\\n";

for my $var ( sort keys %ENV ) {
 printf "%s = \"%s\"\n", $var, $ENV{$var};
}

If a Web browser issues a request for the environment variables at `http://example.com/cgi-bin/printenv.pl/foo/bar?var1=value1&var2=with%20percent%20encoding`, a 64-bit [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) web server running [cygwin](https://en.wikipedia.org/wiki/Cygwin) returns the following information:

COMSPEC="C:\\Windows\\system32\\cmd.exe"
DOCUMENT_ROOT="C:/Program Files (x86)/Apache Software Foundation/Apache2.2/htdocs"
GATEWAY_INTERFACE="CGI/1.1"
HOME="/home/SYSTEM"
HTTP_ACCEPT="text/html,application/xhtml+xml,application/xml;q=0.9,_/_;q=0.8"
HTTP_ACCEPT_CHARSET="ISO-8859-1,utf-8;q=0.7,\*;q=0.7"
HTTP_ACCEPT_ENCODING="gzip, deflate"
HTTP_ACCEPT_LANGUAGE="en-us,en;q=0.5"
HTTP_CONNECTION="keep-alive"
HTTP_HOST="example.com"
HTTP_USER_AGENT="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20100101 Firefox/5.0"
PATH="/home/SYSTEM/bin:/bin:/cygdrive/c/progra~2/php:/cygdrive/c/windows/system32:..."
PATHEXT=".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC"
PATH_INFO="/foo/bar"
PATH_TRANSLATED="C:\\Program Files (x86)\\Apache Software Foundation\\Apache2.2\\htdocs\\foo\\bar"
QUERY_STRING="var1=value1&var2=with%20percent%20encoding"
REMOTE_ADDR="127.0.0.1"
REMOTE_PORT="63555"
REQUEST_METHOD="GET"
REQUEST_URI="/cgi-bin/printenv.pl/foo/bar?var1=value1&var2=with%20percent%20encoding"
SCRIPT_FILENAME="C:/Program Files (x86)/Apache Software Foundation/Apache2.2/cgi-bin/printenv.pl"
SCRIPT_NAME="/cgi-bin/printenv.pl"
SERVER_ADDR="127.0.0.1"
SERVER_ADMIN="(server admin's email address)"
SERVER_NAME="127.0.0.1"
SERVER_PORT="80"
SERVER_PROTOCOL="HTTP/1.1"
SERVER_SIGNATURE=""
SERVER_SOFTWARE="Apache/2.2.19 (Win32) PHP/5.2.17"
SYSTEMROOT="C:\\Windows"
TERM="cygwin"
WINDIR="C:\\Windows"

Some, but not all, of these variables are defined by the CGI standard. Some, such as `PATH_INFO`, `QUERY_STRING`, and the ones starting with `HTTP_`, pass information along from the HTTP request.

From the environment, it can be seen that the Web browser is [Firefox](https://en.wikipedia.org/wiki/Firefox) running on a [Windows 7](https://en.wikipedia.org/wiki/Windows_7) PC, the Web server is [Apache](https://en.wikipedia.org/wiki/Apache_HTTP_server) running on a system that emulates [Unix](https://en.wikipedia.org/wiki/Unix), and the CGI script is named `cgi-bin/printenv.pl`.

The program could then generate any content, write that to [standard output](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29), and the Web server will transmit it to the browser.

The following are [environment variables](https://en.wikipedia.org/wiki/Environment_variable) passed to CGI programs:

- **Server specific variables:**
  - `SERVER_SOFTWARE`: name/version of [HTTP server](https://en.wikipedia.org/wiki/HTTP_server).
  - `SERVER_NAME`: [host name](https://en.wikipedia.org/wiki/Host_name) of the server, may be [dot-decimal](https://en.wikipedia.org/wiki/Dot-decimal_notation) IP address.
  - `GATEWAY_INTERFACE`: CGI/version.
- **Request specific variables:**
  - `SERVER_PROTOCOL`: HTTP/version.
  - `SERVER_PORT`: [TCP port](https://en.wikipedia.org/wiki/TCP_port) (decimal).
  - `REQUEST_METHOD`: name of HTTP method (see above).
  - `PATH_INFO`: path suffix, if appended to URL after program name and a slash.
  - `PATH_TRANSLATED`: corresponding [full path](https://en.wikipedia.org/wiki/Full_path) as supposed by server, if `PATH_INFO` is present.
  - `SCRIPT_NAME`: relative path to the program, like `/cgi-bin/script.cgi`.
  - `QUERY_STRING`: the part of URL after [?](https://en.wikipedia.org/wiki/Question_mark) character. The [query string](https://en.wikipedia.org/wiki/Query_string) may be composed of \*name=value pairs separated with [ampersands](https://en.wikipedia.org/wiki/Ampersand) (such as var1=val1**&**var2=val2...) when used to submit [form](https://en.wikipedia.org/wiki/Form_(web)) data transferred via GET method as defined by HTML [application/x-www-form-urlencoded](https://en.wikipedia.org/wiki/Application/x-www-form-urlencoded).
  - `REMOTE_HOST`: host name of the client, unset if server did not perform such lookup.
  - `REMOTE_ADDR`: [IP address](https://en.wikipedia.org/wiki/IP_address) of the client (dot-decimal).
  - `AUTH_TYPE`: identification type, if applicable.
  - `REMOTE_USER` used for certain `AUTH_TYPE`s.
  - `REMOTE_IDENT`: see [ident](https://en.wikipedia.org/wiki/Ident_protocol), only if server performed such lookup.
  - `CONTENT_TYPE`: [Internet media type](https://en.wikipedia.org/wiki/Internet_media_type) of input data if PUT or POST method are used, as provided via HTTP header.
  - `CONTENT_LENGTH`: similarly, size of input data (decimal, in [octets](https://en.wikipedia.org/wiki/Octet_(computing))) if provided via HTTP header.
  - Variables passed by user agent (`HTTP_ACCEPT`, `HTTP_ACCEPT_LANGUAGE`, `HTTP_USER_AGENT`, `HTTP_COOKIE` and possibly others) contain values of corresponding [HTTP headers](https://en.wikipedia.org/wiki/HTTP_headers) and therefore have the same sense.

The program returns the result to the Web server in the form of standard output, beginning with a header and a [blank line](https://en.wikipedia.org/wiki/Line_(text_file)).

The header is encoded in the same way as an [HTTP header](https://en.wikipedia.org/wiki/List_of_HTTP_headers) and must include the [MIME type](https://en.wikipedia.org/wiki/MIME_type) of the document returned.[[10]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-10>) The headers, supplemented by the Web server, are generally forwarded with the response back to the user.

Here is a simple CGI program in Python along with the HTML that handles a simple addition problem.[[11]](<https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_note-11>)

<!DOCTYPE html>

<html>
 <body>
  <form action="add.cgi" method="POST">
   Enter two numbers to add:<br />
   First Number: <input type="text" name="num1" /><br />
   Second Number: <input type="text" name="num2" /><br />
   <input type="submit" value="Add" />
  </form>
 </body>
</html>

\#!/usr/bin/python

import cgi
import cgitb
cgitb.enable()

input_data=cgi.FieldStorage()

print 'Content-Type:text/html' #HTML is following
print                          #Leave a blank line
print '<h1>Addition Results</h1>'
try:
  num1=int(input_data["num1"].value)
  num2=int(input_data["num2"].value)
except:
  print '<p>Sorry, we cannot turn your inputs into numbers (integers).</p>'
  return 1
sum=num1+num2
print '<p>{0} + {1} = {2}</p>'.format(num1,num2,sum)

This Python CGI gets the inputs from the HTML and adds the two numbers together.

## Deployment\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=5)]

A Web server that supports CGI can be configured to interpret a [URL](https://en.wikipedia.org/wiki/Uniform_Resource_Locator) that it serves as a reference to a CGI script. A common convention is to have a `cgi-bin/` [directory](https://en.wikipedia.org/wiki/Directory_(computing)) at the base of the directory tree and treat all executable files within this directory (and no other, for security) as CGI scripts. Another popular convention is to use [filename extensions](https://en.wikipedia.org/wiki/Filename_extension); for instance, if CGI scripts are consistently given the extension `.cgi`, the web server can be configured to interpret all such files as CGI scripts. While convenient, and required by many prepackaged scripts, it opens the server to attack if a remote user can upload executable code with the proper extension.\[_[citation needed](https://en.wikipedia.org/wiki/Wikipedia:Citation_needed)_]

In the case of [HTTP PUT or POSTs](https://en.wikipedia.org/wiki/HTTP#Request_methods), the user-submitted data are provided to the program via the [standard input](https://en.wikipedia.org/wiki/Standard_input). The Web server creates a subset of the [environment variables](https://en.wikipedia.org/wiki/Environment_variable) passed to it and adds details pertinent to the HTTP environment.

## Uses\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=6)]

CGI is often used to process inputs information from the user and produce the appropriate output. An example of a CGI program is one implementing a [Wiki](https://en.wikipedia.org/wiki/Wiki). The user agent requests the name of an entry; the Web server executes the CGI; the CGI program retrieves the source of that entry's page (if one exists), transforms it into [HTML](https://en.wikipedia.org/wiki/HTML), and prints the result. The web server receives the input from the CGI and transmits it to the user agent. If the "Edit this page" link is clicked, the CGI populates an HTML `textarea` or other editing control with the page's contents, and saves it back to the server when the user submits the form in it.

## Alternatives\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=7)]

Calling a command generally means the invocation of a newly created [process](https://en.wikipedia.org/wiki/Process_(computing)) on the server. Starting the process can consume much more time and memory than the actual work of generating the output, especially when the program still needs to be [interpreted](https://en.wikipedia.org/wiki/Interpret) or [compiled](https://en.wikipedia.org/wiki/Compiler). If the command is called often, the resulting workload can quickly overwhelm the server.

The [overhead](https://en.wikipedia.org/wiki/Computational_overhead) involved in process creation can be reduced by techniques such as [FastCGI](https://en.wikipedia.org/wiki/FastCGI) that "prefork" interpreter processes, or by running the application code entirely within the web server, using extension modules such as [mod_perl](https://en.wikipedia.org/wiki/Mod_perl) or [mod_php](https://en.wikipedia.org/wiki/Mod_php). Another way to reduce the overhead is to use precompiled CGI programs, e.g. by writing them in languages such as [C](https://en.wikipedia.org/wiki/C_(programming_language)) or [C++](https://en.wikipedia.org/wiki/C%2B%2B), rather than interpreted or compiled-on-the-fly languages such as [Perl](https://en.wikipedia.org/wiki/Perl) or [PHP](https://en.wikipedia.org/wiki/PHP), or by implementing the page generating software as a custom webserver module.

Several approaches can be adopted for remedying this:

- The popular Web servers developed their own extension mechanisms that allows third-party software to run inside the web server itself, such as [Apache modules](https://en.wikipedia.org/wiki/Apache_modules), [NSAPI](https://en.wikipedia.org/wiki/Netscape_Server_Application_Programming_Interface) plugins and [ISAPI](https://en.wikipedia.org/wiki/ISAPI) plugins.
- [Simple Common Gateway Interface](https://en.wikipedia.org/wiki/Simple_Common_Gateway_Interface) or SCGI
- [FastCGI](https://en.wikipedia.org/wiki/FastCGI) allows a single, long-running process to handle more than one user request while keeping close to the CGI programming model, retaining the simplicity while eliminating the overhead of creating a new process for each request. Unlike converting an application to a web server plug-in, FastCGI applications remain independent of the web server.
- Replacement of the architecture for dynamic websites can also be used. This is the approach taken by [Java EE](https://en.wikipedia.org/wiki/Java_EE), which runs Java code in a Java servlet container in order to serve dynamic content and optionally static content. This approach replaces the overhead of generating and destroying processes with the much lower overhead of generating and destroying [threads](https://en.wikipedia.org/wiki/Thread_(computer_science)), and also exposes the programmer to the library that comes with [Java Platform, Standard Edition](https://en.wikipedia.org/wiki/Java_Platform,_Standard_Edition) on which the version of Java EE in use is based.

The optimal configuration for any Web application depends on application-specific details, amount of traffic, and complexity of the transaction; these tradeoffs need to be analyzed to determine the best implementation for a given task and time budget.

## See also\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=8)]

- [CGI.pm](https://en.wikipedia.org/wiki/CGI.pm)
- [FastCGI](https://en.wikipedia.org/wiki/FastCGI)
- [Perl Web Server Gateway Interface](https://en.wikipedia.org/wiki/Perl_Web_Server_Gateway_Interface)
- [Rack (web server interface)](https://en.wikipedia.org/wiki/Rack_(web_server_interface))
- [Web Server Gateway Interface](https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface)

## References\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=9)]

1. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-1)** [RFC3875: The Common Gateway Interface (CGI) Version 1.1](http://tools.ietf.org/html/rfc3875)
2. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-2)** [_Server Scripts_, by Rob McCool, _www-talk_ mailing list, Sun, 14 Nov 1993 19:24:47 -0600](http://1997.webhistory.org/www.lists/www-talk.1993q4/0485.html)
3. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-3)** [_The Common Gateway Interface_](https://web.archive.org/web/20100127161358/http://hoohoo.ncsa.illinois.edu/cgi/), archived from [the original](http://hoohoo.ncsa.uiuc.edu/cgi/) on 2010-01-27
4. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-4)** [CGI: Common Gateway Interface](http://www.w3.org/CGI/) at w3.org
5. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-5)** ["Common Gateway Interface RFC Project Page"](https://web.archive.org/web/20130825202222/http://ken.coar.org/cgi/). Archived from [the original](http://ken.coar.org/cgi/) on 2013-08-25.
6. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-6)** [RFC3875: The Common Gateway Interface (CGI) Version 1.1](http://tools.ietf.org/html/rfc3875)
7. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-7)** [RFC3875: The Common Gateway Interface (CGI) Version 1.1](http://tools.ietf.org/html/rfc3875)
8. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-8)** [Mapping URLs to Filesystem Locations Apache HTTP Server Version 2.2](http://httpd.apache.org/docs/2.2/urlmapping.html)
9. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-9)** Nelson, Anne Fulcher, and Nelson, William Harris Morehead. (2001). Building Electronic Commerce with Web Database Constructions. Boston, MA: Addison Wesley.
10. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-10)** [CGI Primer (Mirror at citycat.ru)](http://www.citycat.ru/doc/CGI/overview/primer.html)
11. **[Jump up ^](https://en.wikipedia.org/wiki/Common_Gateway_Interface#cite_ref-11)** ["Abacles HTML Forms"](http://www.abacles.com/html-forms.html). _[www.abacles.com](http://www.abacles.com)_. Retrieved 2016-04-06.

## External links\[[edit](https://en.wikipedia.org/w/index.php?title=Common_Gateway_Interface&action=edit&section=10)]

- [GNU cgicc](https://www.gnu.org/software/cgicc/), a C++ class library for writing CGI applications
- [CGI](https://metacpan.org/pod/CGI), a standard Perl module for CGI request parsing and HTML response generation
- [CGI Programming 101: Learn CGI Today!](http://www.cgi101.com/learn/), a CGI tutorial

\[[hide](https://en.wikipedia.org/wiki/Common_Gateway_Interface#)]

- [v](https://en.wikipedia.org/wiki/Template:Web_interfaces) ·
- [t](https://en.wikipedia.org/wiki/Template_talk:Web_interfaces) ·
- [e](https://en.wikipedia.org/w/index.php?title=Template:Web_interfaces&action=edit)

[Web interfaces](https://en.wikipedia.org/wiki/Web_API)

[Server-side](https://en.wikipedia.org/wiki/Server-side)

[Protocols](https://en.wikipedia.org/wiki/Communications_protocol)

- [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) ·
- CGI ·
- [SCGI](https://en.wikipedia.org/wiki/Simple_Common_Gateway_Interface) ·
- [FCGI](https://en.wikipedia.org/wiki/FastCGI) ·
- [AJP](https://en.wikipedia.org/wiki/Apache_JServ_Protocol) ·
- [WSRP](https://en.wikipedia.org/wiki/Web_Services_for_Remote_Portlets) ·
- [WebSocket](https://en.wikipedia.org/wiki/WebSocket)

[Server APIs](https://en.wikipedia.org/wiki/Server_Application_Programming_Interface)

- [C NSAPI](https://en.wikipedia.org/wiki/Netscape_Server_Application_Programming_Interface) ·
- [C ASAPI](https://en.wikipedia.org/wiki/Apache_HTTP_Server#Feature_overview) ·
- [C ISAPI](https://en.wikipedia.org/wiki/Internet_Server_Application_Programming_Interface) ·
- [COM ASP](https://en.wikipedia.org/wiki/Active_Server_Pages) ·
- [Java servlet](https://en.wikipedia.org/wiki/Java_servlet)
  - ([container](https://en.wikipedia.org/wiki/Web_container))

    ·
- [CLI OWIN](https://en.wikipedia.org/wiki/Open_Web_Interface_for_.NET) ·
- [ASP.NET Handler](https://en.wikipedia.org/wiki/HTTP_handler) ·
- [Python WSGI](https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface) ·
- [Ruby Rack](https://en.wikipedia.org/wiki/Rack_(web_server_interface)) ·
- [JavaScript JSGI](https://en.wikipedia.org/wiki/JSGI) ·
- [Perl PSGI](https://en.wikipedia.org/wiki/PSGI) ·
- [Lua WSAPI](https://en.wikipedia.org/wiki/Kepler_(software)#Frameworks) ·
- [Portlet](https://en.wikipedia.org/wiki/Portlet)
  - ([container](https://en.wikipedia.org/wiki/Portlet_container))

[Apache modules](https://en.wikipedia.org/wiki/Category:Apache_httpd_modules)

- [mod_jk](https://en.wikipedia.org/wiki/Mod_jk) ·
- [mod_lisp](https://en.wikipedia.org/wiki/Mod_lisp) ·
- [mod_mono](https://en.wikipedia.org/wiki/Mod_mono) ·
- [mod_parrot](https://en.wikipedia.org/wiki/Mod_parrot) ·
- [mod_perl](https://en.wikipedia.org/wiki/Mod_perl) ·
- [mod_php](https://en.wikipedia.org/wiki/PHP) ·
- [mod_proxy](https://en.wikipedia.org/wiki/Mod_proxy) ·
- [mod_python](https://en.wikipedia.org/wiki/Mod_python) ·
- [mod_wsgi](https://en.wikipedia.org/wiki/Mod_wsgi) ·
- [mod_ruby](https://en.wikipedia.org/wiki/Mod_ruby) ·
- [Phusion Passenger](https://en.wikipedia.org/wiki/Phusion_Passenger)

Topics

- [Web resource](https://en.wikipedia.org/wiki/Web_resource) vs. [Web service](https://en.wikipedia.org/wiki/Web_service) ·
- [Open API](https://en.wikipedia.org/wiki/Open_API) ·
- [Webhook](https://en.wikipedia.org/wiki/Webhook) ·
- [Application server](https://en.wikipedia.org/wiki/Application_server)
  - ([comparison](https://en.wikipedia.org/wiki/Comparison_of_application_servers))

    ·
- [Scripting](https://en.wikipedia.org/wiki/Server-side_scripting)

[Client-side](https://en.wikipedia.org/wiki/Client-side)

[Browser APIs](https://en.wikipedia.org/wiki/Browser_extension)

- [C NPAPI](https://en.wikipedia.org/wiki/NPAPI)
  - ([LiveConnect](https://en.wikipedia.org/wiki/NPAPI#LiveConnect) ·
  - [XPConnect](https://en.wikipedia.org/wiki/NPAPI#XPConnect))

    ·
- [C NPRuntime](https://en.wikipedia.org/wiki/NPAPI#NPRuntime) ·
- [C PPAPI](https://en.wikipedia.org/wiki/Google_Native_Client#Pepper)
  - ([NaCl](https://en.wikipedia.org/wiki/Google_Native_Client))

    ·
- [ActiveX](https://en.wikipedia.org/wiki/ActiveX) ·
- [BHO](https://en.wikipedia.org/wiki/Browser_Helper_Object) ·
- [XBAP](https://en.wikipedia.org/wiki/XAML_Browser_Applications) ·
- [WebAssembly](https://en.wikipedia.org/wiki/WebAssembly)

[Web APIs](https://en.wikipedia.org/wiki/Web_API#Client-side)

[W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium)

- [Audio](https://en.wikipedia.org/wiki/HTML5_Audio) ·
- [Canvas](https://en.wikipedia.org/wiki/Canvas_element) ·
- [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) ·
- [DOM](https://en.wikipedia.org/wiki/Document_Object_Model) ·
- [DOM events](https://en.wikipedia.org/wiki/DOM_events) ·
- [EME](https://en.wikipedia.org/wiki/Encrypted_Media_Extensions) ·
- [File](https://en.wikipedia.org/wiki/HTML5_File_API) ·
- [Geolocation](https://en.wikipedia.org/wiki/W3C_Geolocation_API) ·
- [IndexedDB](https://en.wikipedia.org/wiki/Indexed_Database_API) ·
- [MSE](https://en.wikipedia.org/wiki/Media_Source_Extensions) ·
- [SSE](https://en.wikipedia.org/wiki/Server-sent_events) ·
- [SVG](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) ·
- [Video](https://en.wikipedia.org/wiki/HTML5_video) ·
- [WebRTC](https://en.wikipedia.org/wiki/WebRTC) ·
- [WebSocket](https://en.wikipedia.org/wiki/WebSocket) ·
- [Web messaging](https://en.wikipedia.org/wiki/Web_Messaging) ·
- [Web storage](https://en.wikipedia.org/wiki/Web_storage) ·
- [Web worker](https://en.wikipedia.org/wiki/Web_worker) ·
- [XMLHttpRequest](https://en.wikipedia.org/wiki/XMLHttpRequest)

[Khronos](https://en.wikipedia.org/wiki/Khronos_Group)

- [WebCL](https://en.wikipedia.org/wiki/WebCL) ·
- [WebGL](https://en.wikipedia.org/wiki/WebGL)

Others

- [Gears](https://en.wikipedia.org/wiki/Gears_(software)) ·
- [Web SQL Database](https://en.wikipedia.org/wiki/Web_SQL_Database) (formerly W3C)

Topics

- [Ajax](https://en.wikipedia.org/wiki/Ajax_(programming)) vs. [DHTML](https://en.wikipedia.org/wiki/Dynamic_HTML) ·
- [Mashup](https://en.wikipedia.org/wiki/Mashup_(web_application_hybrid)) ·
- [Web IDL](https://en.wikipedia.org/wiki/Web_IDL) ·
- [Scripting](https://en.wikipedia.org/wiki/Client-side_scripting)

Topics

- [Dynamic web page](https://en.wikipedia.org/wiki/Dynamic_web_page) ·
- [Open Web Platform](https://en.wikipedia.org/wiki/Open_Web_Platform) ·
- [Rich Internet application](https://en.wikipedia.org/wiki/Rich_Internet_application) ·
- [Web application](https://en.wikipedia.org/wiki/Web_application)

[Categories](https://en.wikipedia.org/wiki/Help:Category):

- [Servers (computing)](https://en.wikipedia.org/wiki/Category:Servers_(computing))
- [Web technology](https://en.wikipedia.org/wiki/Category:Web_technology)
- [World Wide Web](https://en.wikipedia.org/wiki/Category:World_Wide_Web)

