component output="false" displayname="" accessors="true" {

	public function init(required any fw){
		variables.fw =arguments.fw;
		return this;
	}

	public function default(struct rc) {
		param name="rc.strMetaTitle" default="#application.stcThisSite.stcMetaData.strMetaTitle#";
		param name="rc.strMetaDescription" default="#application.stcThisSite.stcMetaData.strMetaDescription#";
		param name="rc.strMetaKeywords" default="#application.stcThisSite.stcMetaData.strMetaKeywords#";
		rc.strMetaTitle = 'Special Features at ' & rc.strMetaTitle;
	}
}
