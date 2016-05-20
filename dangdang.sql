use master;
go

create database db_dangdang;
go

use db_dangdang;
go

create table DANGDANG_CATEGORY
(
  DdCategoryId int primary key identity(1,1),
  DdFatherCategoryId int not null,
  DdCategoryName varchar(128) not null,
  DdCategoryDesc varchar(128),
  DdCategoryBackup varchar(128)
)
go

create table DANGDANG_PRODUCT
(
  DdProductId int primary key identity(1,1),
  DdCategoryId int not null references DANGDANG_CATEGORY(DdCategoryId),
  DdProductName varchar(128) not null,
  DdProductImage varchar(128) not null,
  DdProductBigImage varchar(128) not null,
  DdProductSmallImage varchar(128) not null,
  DdProductPrice numeric(8,2) not null check(DdProductPrice>0),
  DdProductLowPrice numeric(8,2) not null check(DdProductLowPrice>0),
  DdProductQuantity int not null check(DdProductQuantity>=0),
  DdProductBackup varchar(128)
)
go

create table DANGDANG_CUSTOMER
(
  DdCustomerEmail varchar(128) primary key,
  DdCustomerPassword varchar(128) not null,
  DdCustomerState int default(0),
  DdCustomerBackup varchar(128)
)
go

create table DANGDANG_ORDER
(
  DdOrderId nchar(16) primary key,
  DdCustomerEmail varchar(128) not null references DANGDANG_CUSTOMER(DdCustomerEmail),
  DdOrderName varchar(16) not null,
  DdOrderAddress varchar(256) not null,
  DdOrderDate varchar(16) not null,
  DdOrderPostcode varchar(16) not null,
  DdOrderPhone varchar(24) not null,
  DdOrderSend varchar(128) not null,
  DdOrderPay varchar(16) not null,
  DdOrderState varchar(16) not null,
  DdOrderYunFei int not null check(DdOrderYunFei>=0),
  DdOrderAmount numeric(8,2) not null check(DdOrderAmount>0),
  DdOrderBackup varchar(128)
)
go

create table DANGDANG_ORDER_ITEM
(
  DdOrderItemId int primary key identity(1,1),
  DdOrderId nchar(16) not null references DANGDANG_ORDER(DdOrderId),
  DdProductId int not null references DANGDANG_PRODUCT(DdProductId),
  DdProductName varchar(128) not null,
  DdProductLowPrice numeric(8,2) not null check(DdProductLowPrice>0),
  DdOrderItemNum int not null check(DdOrderItemNum>0),
  DdOrderItemAmount numeric(8,2) not null check(DdOrderItemAmount>0),
  DdOrderItemBackup varchar(128)
)
go

insert into DANGDANG_CATEGORY
values(0,'美妆','化妆品','');
insert into DANGDANG_PRODUCT values(1,'欧珀莱时光锁系列','oubolai.jpg','oubolaibig.jpg','oubolaismall.jpg',220.0,130.0,100,'');
insert into DANGDANG_PRODUCT values(1,'雅诗兰黛 柔丝焕采洗面奶','yashilan.jpg','yashilanbig.jpg','yashilansmall.jpg',80.0,39.90,100,'');
insert into DANGDANG_PRODUCT values(1,'欧莱雅睫毛膏眼影套装','oulaiya.jpg','oulaiyabig.jpg','oulaiyasmall.jpg',300.0,259.0,100,'');
go

select *from DANGDANG_PRODUCT;
go

create proc selectproductbycategoryid @categoryid int
as
  begin
       select * from DANGDANG_PRODUCT where DdCategoryId=@categoryid;
  end
go
exec selectproductbycategoryid 1;
go

create proc selectproductbyproductid @productid int
as
  begin
       select * from DANGDANG_PRODUCT where DdProductId=@productid;
  end
go  
exec selectproductbyproductid 1;
go


create proc insertcustomer @customeremail varchar(128),@password varchar(128)
as
  begin
       insert into DANGDANG_CUSTOMER values(@customeremail,@password,default,'');
  end
go
--exec insertcustomer 'a@a.com','aaa';
--go 
exec insertcustomer 'aa@a.com','123456'
go

select *from DANGDANG_CUSTOMER;
go

create proc selectcustomerbyemail @email varchar(128)
as
  begin
       select * from DANGDANG_CUSTOMER where DdCustomerEmail=@email;
  end
go
exec selectcustomerbyemail 'aa@a.com';
go

select *from DANGDANG_CUSTOMER;
go


create proc addorderitem
	@orderid nchar(16),
	@productid int,
	@productname varchar(128),
	@productprice numeric(8,2),
	@productnumber int,
	@productjine numeric(8,2),
	@orderitembackup varchar(128)
as
	begin
		insert DANGDANG_ORDER_ITEM
		(DdOrderId,DdProductId,DdProductName,DdProductLowPrice,DdOrderItemNum,DdOrderItemAmount,DdOrderItemBackup)
		values
		(@orderid,@productid ,@productname ,@productprice ,@productnumber ,@productjine ,@orderitembackup)
end
go

create function CreateOrderId()
returns nchar(16)--声明返回类型
as
begin
	--声明需要使用的变量
    declare @result nchar(16);
    declare @latedid nchar(16);
    declare @oldid int;
    
    select top 1 @latedid=DdOrderId
    from DANGDANG_ORDER
    where LEFT(DdOrderId,8)=CONVERT(char(8),GETDATE(),112)
    order by DdOrderId desc
    
    if @latedid is null
		set @oldid=0;
	else
		set @oldid=CONVERT(int,RIGHT(@latedid,8));
		
	set @result=CONVERT(char(8),GETDATE(),112)+RIGHT(CONVERT(char(9),@oldid+1+100000000),8);
	return @result;
end

create proc addorder
	@orderid nchar(16) output,
	@orderemail varchar(128),
	@ordername varchar(16),
	@orderdate varchar(16),
	@orderaddress varchar(256),
	@orderphone varchar(24),
	@orderpostcode varchar(16),
	@ordersendway varchar(128),
	@orderpayway varchar(16),
	@orderstate varchar(16),
	@orderyunfei int,
	@orderjine numeric(8,2),
	@orderbackup varchar(128)
as
	begin
		begin tran createid
		select DdOrderId from DANGDANG_ORDER (tablockx) where 1=0;
		set @orderid=dbo.CreateOrderId();
		if(@@ERROR=0)
		begin
			insert into DANGDANG_ORDER values(@orderid ,@orderemail,@ordername ,@orderaddress,@orderdate ,@orderpostcode ,@orderphone,@ordersendway,@orderpayway ,@orderstate ,@orderyunfei ,@orderjine ,@orderbackup );
			if(@@ERROR=0)
			begin
				commit tran createid;
				return 1;
			end;
		end;
		rollback tran createid;
		return 0;		
	end;
go

create proc selectorderbyemail @email varchar(128)
as
	begin
		select * from DANGDANG_ORDER where DdCustomerEmail=@email;
	end
go
exec selectorderbyemail 'Q@a.com';
go