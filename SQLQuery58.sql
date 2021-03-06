USE [POS]
GO
/****** Object:  StoredProcedure [dbo].[Clear_All_Data]    Script Date: 2017-11-15 11:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Clear_All_Data] 

AS
BEGIN
delete from [customer].[Customer_Details]
delete from [dbo].[AutoServiceDetails]
delete from [dbo].[BankAccount]
delete from [dbo].[CashAccount]
delete from [dbo].[CashHeader]
delete from [dbo].[CompanyDetails]
delete from [expences].[workers_details]
delete from [Finance].[Bank_Account]
delete from [Finance].[Bank_Transactions]
delete from [Finance].[Cash]
delete from [GRN].[GRN_Details]
delete from [GRN].[GRN_Details_Temp]
delete from [GRN].[GRN_Header]
delete from [Sales].[Cheque]
delete from [Sales].[Cheque_Tempory]
delete from [Sales].[Invoice_Details]
delete from [Sales].[Invoice_Details_temp]
delete from [Sales].[Invoice_Header]
delete from [Sales].[Mobile_Transaction]
delete from [Sales].[Tempory_Save_Mobile_Transaction]
delete from [stock].[ItemDetails]
delete from [Suppliers].[Supplier_Details]
delete from [transactions].[Cash_and_Cheque]
delete from [transactions].[Transactions]
delete from [dbo].[Sales_Return_Details]
delete from [dbo].[Sales_Return_Details_Temp]
delete from [dbo].[Sales_Return_Details_Temp]
delete from [stock].[ItemDetails]

END
