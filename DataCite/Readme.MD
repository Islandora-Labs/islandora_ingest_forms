## XML Form Builder DataCite Form

This form is based on the [DataCite 3 schema](https://schema.datacite.org/meta/kernel-3/index.html).

The form was built using the [sample xml record](https://schema.datacite.org/meta/kernel-3/example/datacite-example-full-v3.1.xml) provided by DataCite.

Controlled vocabularies listed in the appendices of the [schema documentation](http://schema.datacite.org/meta/kernel-3/doc/DataCite-MetadataKernel_v3.1.pdf) have been implemented in the form for the following elements:

* dateType
* language
* resourceTypeGeneral
* relationType
* descriptionType

## DataCite to DC transform

The included transform, datacite-kernel3_to_oaidc.xsl, provides a basic XSLT v1 crosswalk from Datacite v3 to OAI DC. To utilize the transform when associating the form, copy it to the [path to your drupal modules]/modules/islandora_xml_forms/builder/transforms directory on your site.
