#!/bin/bash
rm -f user.ldif
let nom
read -p "Tu nombre: " nom
let ap
read -p "Tu apellido: " ap
var_ou=guerreros
var_dc1=malakor
var_dc2=sith
var_niud=10000
var_ngid=10000
var_pass=$nom
echo	dn: uid=$nom,ou=$var_ou,dc=$var_dc1,dc=$var_dc2 >> user.ldif
echo	objectClass:inetOrgPerson >> user.ldif
echo	objectClass:shadowAccount >> user.ldif
echo	objectClass:posixAccount >> user.ldif
echo	cn:$nom >> user.ldif
echo	sn:$ap >> user.ldif
echo	uid:$nom >> user.ldif
echo	userPassword:$var_pass >> user.ldif
echo	uidNumber:$var_niud >> user.ldif
echo	gidNumber:$var_ngid >> user.ldif
echo	homeDirectory: /home/$nom >> user.ldif
echo	shadowMax: 60 >> user.ldif
echo	shadowMin: 1 >> user.ldif
echo	shadowWarning: 7 >> user.ldif
echo	shadowInactive: 7 >> user.ldif
echo	shadowLastChange: 0 >> user.ldif
echo 	-e >> user.ldif
echo	dn: cn=$nom,ou=$var_ou,dc=$var_dc1,dc=$var_dc2 >> user.ldif
echo	objectClass: posixGroup >> user.ldif
echo	cn: $nom >> user.ldif
echo	gidNumber: $var_ngid >> user.ldif
echo	memberUid: $nom >> user.ldif

#ldapadd -x -D cn="admin",dc=$var_dc1,dc=$var_dc2 -W -f user.ldif
