unzip -o bin/as3c2dm.swc -x catalog.xml

/Applications/Adobe\ Flash\ Builder\ 4.6/sdks/4.6.0/bin/adt -package -storetype pkcs12 -keystore ~/Projects/cert/my-android-cert.pfx -target ane as3c2dm.ane src/extension.xml -swc bin/as3c2dm.swc -platform Android-ARM library.swf as3c2dm.jar

cp as3c2dm.ane ../as3c2dm-example/extensions/

rm library.swf as3c2dm.jar
