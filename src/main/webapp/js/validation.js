/**
 * http://ryanswanson.com/regexp/#start
 */
// EMP 정규식
// "pro15010111".validationID();
String.prototype.validationIDCODE = function(){
	return /^pro\d{7,9}$/.test(this);
};
// "20150101"
String.prototype.validationPASS = function(){
	return /\w{4,8}$/.test(this);
};
// "홍길동".validationNM();
String.prototype.validationNM = function(){
	return /^[가-힣]{2,4}$/.test(this);
};
String.prototype.validationMAIL = function(){
	return /[0-9a-zA-Z]{4,10}@[a-z]+\.([a-z]+){3}$/.test(this);
};

String.prototype.validationENCPN = function(){
	return /^(19\d{2}|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|(1|2)[0-9]|3[0-1])$/.test(this);
};

//String.prototype.validationGENDER = function(){
//	return /^(m|w)$/.test(this);
//};
//String.prototype.validationMARRY = function(){
//	return /^(y|n)$/.test(this);
//};
//String.prototype.validationARMY = function(){
//	return /^(y|n)$/.test(this);
//};
//String.prototype.validationLEVEL = function(){
//	return /^\d+$/.test(this);
//};

String.prototype.validationPHONE = function(){
	return /^01(0|1|6|7|9)-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationROLE = function(){
	return /^(DEP|PM|PL|MANAGER)$/.test(this);
};



// PROD 정규식
String.prototype.validationPRODID = function(){
	return /^P[0-9]{9}$/.test(this);
};
String.prototype.validationPRODNM = function(){
	return /^[a-zA-Z가-힣]{1,20}$/.test(this);
};
String.prototype.validationPRODNUMBER = function(){
	return /^[0-9]+$/.test(this);
};
String.prototype.validationPRODTEXT = function(){
	return /^[ㄱ-ㅎ가-힣 ]+$/.test(this);
};
String.prototype.validationPRODDATE = function(){
	return /^(19|20)\d{2}-(0|1)[0-9]{1}-\d{2}$/.test(this);
};
String.prototype.validationPRODBUYER = function(){
	return /^P[0-9]{5}$/.test(this);
};

// BUYER 정규식
String.prototype.validationBUYERID = function(){
	return /^P[0-9]{5}$/.test(this);
};
String.prototype.validationBUYERNM = function(){
	return /^[a-zA-Z가-힣]{1,20}$/.test(this);
};
String.prototype.validationBUYERCHARGER = function(){
	return /^[가-힣]{2,4}$/.test(this);
};
String.prototype.validationBUYERBANK = function(){
	return /^[가-힣]{2,10}$/.test(this);
};
String.prototype.validationBUYERCOMTEL = function(){
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationBUYERFAX = function(){
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationBUYERMAIL = function(){
	return /[0-9a-zA-Z]{4,8}@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};
