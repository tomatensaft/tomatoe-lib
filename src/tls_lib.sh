#!/bin/sh
# SPDX-License-Identifier: MIT

# set -x

# load config file for default tls parameters
if [ -f  ${root_path}/conf/tls_lib.conf ]; then
   printf "$0: include default tls parameters from ${root_path}\n"
   . ${root_path}/conf/tls_lib.conf
else
   printf "$0: tls lib default parameters not found - exit\n"
   exit 1
fi

# check if script root path is set from main script
if [ ! -z ${root_path} ]; then
	printf "$0: script root path set - use ${root_path} for include\n"
else
	printf "$0: script rootpath ${root_path} not found\n"
	exit 1
fi

# include external libs from git module
if [ -f  ${root_path}/src/standard_lib.sh ]; then
   printf "$0: include script from ${root_path}\n"
   . ${root_path}/src/standard_lib.sh
else
   printf "$0: standardlib not found - exit\n"
   exit 1
fi


# inspect ssl cert
# $1 certification name
openssl_incpect() {

   # inspect TCER
   log -info "inspect certificates"
   openssl x509 -in $1 -noout -text   

}

# convet certificates
# $1 input cert
# $2 output format
openssl_x509_convert() {
   log -info "convert certificates"
}

# create x509 ecdsa cert from parameterfile
openssl_x509_ecdsa_curves() {

   log -info "ec param list curve"
   openssl ecparam -list_curves

}

# certificate with elliptic curve from parameterfile
openssl_x509_ecdsa() {

   # generate the root ca certificate and key
   log -info "generate root ca key"
   openssl ecparam -name prime256v1 -genkey -noout -out ${rootca_name}.key

   # generate server private key
   log -info "generate server private key"
   openssl ecparam -name prime256v1 -genkey -noout -out ${server_cert_name}.key

   # generate server public key
   log -info "generate public client key"
   openssl ec -in ${server_cert_name}.key -pubout -out ${client_cert_name}.key

   # create self sined certificate
   log -info "generate self signed cerificate request"
   openssl req -new -x509 -key ${server_cert_name}.key -subj ${server_cert_attributes} -out ${server_cert_name}.pem -days ${cert_duration}

   # convert pem to pfx
   log -info "export cert to pfx"
   openssl pkcs12 -export -inkey ${server_cert_name}.key -in ${server_cert_name}.pem -out ${server_cert_name}.pfx

   # finished
   log -info "cert generate finished"

}


# certificate rsa - for tls/mqtt/opcua from parameterfile
openssl_x509_rsa() {

   #ca private key
   log -info "generate ca private key"
   openssl genrsa -out ${rootca_name}.key 2048

   # generate root ca
   log -info "generate x.509 root certificate and sign"
   openssl req -x509 -new -nodes -key ${rootca_name}.key -sha256 -subj ${rootca_attributes} -days ${cert_duration} -out ${rootca_name}.pem

   # generate server key
   log -info "generate server private key"
   openssl genrsa -out ${server_cert_name}.key 2048

   # generate server csr signing request
   log -info "generate server singning request"
   openssl req -out ${server_cert_name}.csr -key ${server_cert_name}.key -subj ${server_cert_attributes} -new

   # sign server certificate
   log -info "sign server private certificate"
   openssl x509 -req -in ${server_cert_name}.csr -CA ${rootca_name}.pem -CAkey ${rootca_name}.key -CAcreateserial -out ${server_cert_name}.crt -days ${cert_duration} -sha256

   # generate client key
   log -info "generate client key"
   openssl genrsa -out ${client_cert_name}.key 2048

   # generate client csr signing request
   log -info "generate client singning request"
   openssl req -out ${client_cert_name}.csr -key ${client_cert_name}.key -subj ${client_cert_attributes} -new

   # sign client certificate
   log -info "sign client private certificate"
   openssl x509 -req -in ${client_cert_name}.csr -CA ${rootca_name}.pem -CAkey ${rootca_name}.key -CAcreateserial -out ${client_cert_name}.crt -days ${cert_duration} -sha256

   # convert certificates to pfx - with no password use -keypbe NONE -certpbe NONE
   # private and public pfx with password
   log -info "export to pfx"
   openssl pkcs12 -export -inkey ${server_cert_name}.key -in ${server_cert_name}.crt -out ${server_cert_name}.pfx
   openssl pkcs12 -export -inkey ${client_cert_name}.key -in ${client_cert_name}.crt -out ${client_cert_name}.pfx

   # export to pem
   log -info "export to pem"
   openssl x509 -in ${server_cert_name}.crt -out ${server_cert_name}.pem
   openssl x509 -in ${client_cert_name}.crt -out ${client_cert_name}.pem

   # export to der
   log -info "export to der"
   openssl x509 -outform der -in ${server_cert_name}.pem -out ${server_cert_name}.der
   openssl x509 -outform der -in ${client_cert_name}.pem -out ${client_cert_name}.der

   # export to pkcs7
   log -info "export to pkcs7"
   openssl crl2pkcs7 -nocrl -certfile ${server_cert_name}.pem -out ${server_cert_name}.p7b -certfile ${server_cert_name}.crt
   openssl crl2pkcs7 -nocrl -certfile ${client_cert_name}.pem -out ${client_cert_name}.p7b -certfile ${client_cert_name}.crt

   # export to pkcs8
   log -info "export to pkcs8"
   openssl pkcs8 -in ${server_cert_name}.pem -topk8 -nocrypt -out ${server_cert_name}.pk8
   openssl pkcs8 -in ${client_cert_name}.pem -topk8 -nocrypt -out ${client_cert_name}.pk8

   # finished
   log -info "cert generate finished"

}

# remove all cert folders
openssl_remove_data() {

   log -info "remove all cert data"
   rm -rf ./certdata_*
}