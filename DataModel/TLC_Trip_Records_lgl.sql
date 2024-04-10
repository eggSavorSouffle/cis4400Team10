CREATE SCHEMA INSTANCE;

CREATE TABLE TLC_Trip_Records.INSTANCE.DIm_HighVolumeForServices ( 
	HVFS_ID int64 NOT NULL  ,
	HVFHS_LicenseNumber string  ,
	HVFHS_Name string  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.DIm_HighVolumeForServices ADD PRIMARY KEY ( HVFS_ID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_Base ( 
	BaseID int64 NOT NULL  ,
	DispatchingBaseNum string  ,
	BaseLicenseNumber string  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_Base ADD PRIMARY KEY ( BaseID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_Date ( 
	DateID int64 NOT NULL  ,
	DateOriginalFormat string  ,
	DateISO_Format datetime  ,
	Year int64  ,
	Quarter int64  ,
	Month int64  ,
	DayNumber int64  ,
	HourNumber int64  ,
	MonthName string  ,
	DayName string  ,
	WeekofName int64  ,
	WeekofYear int64  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_Date ADD PRIMARY KEY ( DateID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_Location ( 
	LocationID int64 NOT NULL  ,
	Borough string  ,
	ServiceZone string  ,
	Zone string  ,
	Lattitude numeric  ,
	Longitude numeric  ,
	IsBelow60thLine boolean  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_Location ADD PRIMARY KEY ( LocationID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_PaymentType ( 
	PaymentTypeID int64 NOT NULL  ,
	PaymentType string  ,
	PaymentDescription string  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_PaymentType ADD PRIMARY KEY ( PaymentTypeID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_RateCode ( 
	RateCodeID int64 NOT NULL  ,
	RateCodeName string  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_RateCode ADD PRIMARY KEY ( RateCodeID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_TripType ( 
	TripTypeID int64 NOT NULL  ,
	TripType string  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_TripType ADD PRIMARY KEY ( TripTypeID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Dim_Vendor ( 
	VendorID int64 NOT NULL  ,
	VendorName string  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Dim_Vendor ADD PRIMARY KEY ( VendorID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.Entity ( 
 );

CREATE TABLE TLC_Trip_Records.INSTANCE.Facts_Trip ( 
	FactsID int64 NOT NULL  ,
	VendorID int64 NOT NULL  ,
	PaymentTypeID int64 NOT NULL  ,
	PickupLocationID int64 NOT NULL  ,
	PickupDateID int64 NOT NULL  ,
	DropoffLocationID int64 NOT NULL  ,
	DropoffDateID int64 NOT NULL  ,
	TripTypeID int64 NOT NULL  ,
	HVFHS_ID int64 NOT NULL  ,
	RateCodeID int64 NOT NULL  ,
	BaseID int64 NOT NULL  ,
	PassengerCount int64  ,
	TripDistance numeric  ,
	FareAmount numeric  ,
	ExtraAmount numeric  ,
	MTA_Tax numeric  ,
	ImprovementSurcharge numeric  ,
	TipAmount numeric  ,
	TollsAmount numeric  ,
	TotalAmount numeric  ,
	CongestionSurcharge numeric  ,
	AirportFee numeric  ,
	SalesTax numeric  ,
	DriverPay numeric  ,
	BasePassengerFare numeric  ,
	BlackCarFund numeric  ,
	SubwayAmount numeric  ,
	LIRR_Amount numeric  ,
	NewTotalAmount numeric  
 );

ALTER TABLE TLC_Trip_Records.INSTANCE.Facts_Trip ADD PRIMARY KEY ( FactsID )  NOT ENFORCED;

CREATE TABLE TLC_Trip_Records.INSTANCE.PaymentType ( 
 );
