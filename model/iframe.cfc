<cfcomponent extends="mura.bean.beanORM" entityName="iFrame" table="mura_iframe">

	<cfproperty name="iFrameID" fieldtype="id"> <!--- primary key --->
	<cfproperty name="Name" type="string" required="true" length="256" />
	<cfproperty name="url" type="string" required="true" length="1024" />
	<cfproperty name="height" type="int" required="false" />
	<cfproperty name="width" type="int" required="false" />
	<cfproperty name="scrolling" type="string" required="false" default="" />

</cfcomponent>

