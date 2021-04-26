# Listado Registros del Tipo A ##
echo " ### Listado de registros de tipo A - (IPv4) ###"
dig google.es A +short
echo "************************************************"
echo ""
## Listado Registros del TIPO PTR ##
echo "### Listado de registros de tipo PTR - (Reverse DNS) ###"
dig -x 172.217.19.131
echo "************************************************"
echo ""

## Listado Registros del tipo MX ##
echo "### Listado de registros de tipo MX - (Servidores de correo) ###"
dig google.es MX +noall +answer