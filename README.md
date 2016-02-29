# kombit-web-java
Sample Java Web Application using Context Handler

Document Reference: D.03.08.00001

## <a name=“introduction”></a>Introduction

This guide describes how to configure the sample Java web application using Context Handler for login.

In the KOMBIT Støttesystemer information model, a web application that authenticates users based on an assertion issued by Context Handler (CH) is referred to as a Brugervendt system. In the following guide the terms `Brugervendt system` and `web application` will be used interchangeably.

After completing this guide, the Java-based sample web application will be configured and ready to be used.

It is assumed that the reader is a Java developer knowledgeable in the following technologies used to develop this Java-based sample. This includes:* JDK 1.7
* Glassfish application server
* HTTP and HTTPS
* X509v3 Certificates

## Overview Of The Sample Java Web Application
The Java-based sample web application is based on the open source project OIOSAML.JavaThe demo web site in OIOSAML.Java is used to demonstrate how to send a SAML2.0 AuthRequest, how to receive and process a SAML2.0 response containing a SAML2.0 assertion. This guide explains how to configure the sample web application (websitedemo) based on a SAML2.0 metadata document from the identity provider with which the sample web application will be used. In this sample, the identity provider is the `Context Handler`.
In this guide the metadata-file for the KOMBIT Støttesystemer Context Handler in the project environment is used.

## <a name=“prerequisites”></a>Prerequisites
This following prerequisites are needed:* Windows Server 2012R2
* JDK 7 
* NetBeans 8, installed with Glassfish and Metro framework
* Unlimited Strength Cryptography file downloaded from Oracle and installed.
* Glassfish configured with HTTPS. In this guide, it is assumed that the hostname of the Glassfish instance is `claimapp.projekt-stoettesystemerne.dk`, and that Glassfish is listening on SSL on port `8181`.

## <a name=“setup”></a>Setup
To use this sample do the following:

1. Either clone the repository <https://github.com/Safewhere/kombit-web-java.git> to `C:\kombit-web-java`, or unpack the provided zip-file `kombit-web-java.zip` to `C:\kombit-web-java`.
2. Copy `C:\kombit-web-java\Kombit.Samples.CH.WebsiteDemo\oiosaml-config` to `C:\oiosaml-config`
3. Build the Netbeans project in `C:\kombit-web-java\`
4. Copy the folder `C:\kombit-web-java\Kombit.Samples.CH.WebsiteDemo` to the autodeploy folder of Glassfish (e.g. `C:\Program Files\glassfish-4.1\glassfish\domains\domain1\autodeploy`)
5. Since the Glassfish server is running , it automatically deploys the website to `C:\Program Files\glassfish-4.1\glassfish\domains\domain1\applications\Kombit.Samples.CH.WebsiteDemo`
6. Open a browser and point it to <https://claimapp.projekt-stoettesystemerne.dk:8181/>
7. Click the [Page requiring Login](https://claimapp.projekt-stoettesystemerne.dk:8181/priv1.jsp) to login using the Context Handler. 
