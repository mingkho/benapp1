namespace BenefitsApp;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Claims
{
    key ClaimID : UUID
        @Core.Computed;
    ClaimDate : Date;
    Provider : String(100);
    Amount : Decimal(25,2);
    Comment : String;
    ClaimReceipts : Association to many Receipts on ClaimReceipts.Claim = $self;
    ClaimTypes : Association to one ClaimTypes;
}

entity Receipts
{
    key ReceiptID : UUID
        @Core.Computed;
    ReceiptNumber : String(100);
    ReceiptDate : Date;
    Attachment : LargeBinary
        @Core.MediaType : FileType;
    FileType : String(100)
        @Core.IsMediaType;
    Claim : Association to one Claims;
}

entity ClaimTypes
{
    key ID : Integer
        @Core.Computed;
    Description : String(100);
}
