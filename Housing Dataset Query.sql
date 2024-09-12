select *
from dbo.[Nashville Sheet]


--standardize Date Format

select SaleDate, convert(date,saledate)
from dbo.[Nashville Sheet]

update [Nashville Sheet]
set SaleDate = CONVERT(date,saledate)

Alter Table [Nashville Sheet]
Add SaledateConverted Date;

Update [Nashville Sheet]
Set SaleDateConverted = CONVERT(Date,SaleDate)

select SaleDateConverted, convert(date,saledate)
from dbo.[Nashville Sheet]



-- Popullate Property Address Data

select SaleDateConverted, convert(date,saledate)
from dbo.[Nashville Sheet]

select PropertyAddress
from dbo.[Nashville Sheet]
where PropertyAddress is null


select *
from dbo.[Nashville Sheet]
--where PropertyAddress is null
order by ParcelID


select *
from dbo.[Nashville Sheet] A
join dbo.[Nashville Sheet] B
on A.ParcelID = b.ParcelID
and A.[UniqueID ] <> B.[UniqueID ]



select A.ParcelID,A.PropertyAddress,B.ParcelID,B.PropertyAddress
from dbo.[Nashville Sheet] A
join dbo.[Nashville Sheet] B
on A.ParcelID = b.ParcelID
and A.[UniqueID ] <> B.[UniqueID ]
where A.PropertyAddress is null



select A.ParcelID,A.PropertyAddress,B.ParcelID,B.PropertyAddress ,isnull(A.propertyAddress,B.PropertyAddress )
from dbo.[Nashville Sheet] A
join dbo.[Nashville Sheet] B
on A.ParcelID = b.ParcelID
and A.[UniqueID ] <> B.[UniqueID ]
where A.PropertyAddress is null



Update A
SET PropertyAddress = ISNULL(A.propertyAddress,B.PropertyAddress )
from dbo.[Nashville Sheet] A
join dbo.[Nashville Sheet] B
on A.ParcelID = b.ParcelID
and A.[UniqueID ] <> B.[UniqueID ]
where A.PropertyAddress is null


--Narrowing Address to (Address,City,State)



select PropertyAddress
from dbo.[Nashville Sheet]
--where PropertyAddress is null
--order by ParcelID



-- Charindex is used to search (i.e Cntrl F) 



select
SUBSTRING (PropertyAddress,1,CHARINDEX(',',PropertyAddress)) as Address

from dbo.[Nashville Sheet]





select
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)) as Address,

CHARINDEX(',',PropertyAddress) as Address

from dbo.[Nashville Sheet]






select
SUBSTRING (PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address

from dbo.[Nashville Sheet]




select
SUBSTRING (PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address
,SUBSTRING (PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) as Address

from dbo.[Nashville Sheet]





Alter Table [Nashville Sheet]
Add PropertySplitAddress Nvarchar(255);


update [Nashville Sheet]
set PropertySplitAddress = SUBSTRING (PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)



Alter Table [Nashville Sheet]
Add PropertySplitCity Nvarchar(255);


update [Nashville Sheet]
set PropertySplitCity = SUBSTRING (PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress))






--Using Parsename to delimit

select*
from dbo.[Nashville Sheet]



select OwnerAddress
from dbo.[Nashville Sheet]


select 
PARSENAME(Replace(OwnerAddress,',','.'), 3)
,PARSENAME(Replace(OwnerAddress,',','.'), 2)
,PARSENAME(Replace(OwnerAddress,',','.'), 1)
from dbo.[Nashville Sheet]







Alter Table [Nashville Sheet]
Add OwnerSplitAddress Nvarchar(255);


update [Nashville Sheet]
set OwnerSplitAddress = PARSENAME(Replace(OwnerAddress,',','.'), 3)



Alter Table [Nashville Sheet]
Add OwnerSplitCity Nvarchar(255);


update [Nashville Sheet]
set OwnerSplitCity = PARSENAME(Replace(OwnerAddress,',','.'), 2)




Alter Table [Nashville Sheet]
Add OwnerSplitState Nvarchar(255);


update [Nashville Sheet]
set OwnerSplitState = PARSENAME(Replace(OwnerAddress,',','.'), 1)





--OR




Alter Table [Nashville Sheet]
Add Owner1SplitAddress Nvarchar(255);

Alter Table [Nashville Sheet]
Add Owner1SplitCity Nvarchar(255);

Alter Table [Nashville Sheet]
Add Owner1SplitState Nvarchar(255);




update [Nashville Sheet]
set Owner1SplitAddress = PARSENAME(Replace(OwnerAddress,',','.'), 3)


update [Nashville Sheet]
set Owner1SplitCity = PARSENAME(Replace(OwnerAddress,',','.'), 2)

update [Nashville Sheet]
set Owner1SplitState = PARSENAME(Replace(OwnerAddress,',','.'), 1)


select*
from dbo.[Nashville Sheet]


--Remove Y / N (Change to Yes /No)

select Distinct (SoldAsVacant)
from dbo.[Nashville Sheet]


select Distinct (SoldAsVacant), Count(SoldAsVacant)
from dbo.[Nashville Sheet]
group by [SoldAsVacant]

order by 2



select [SoldAsVacant]
, Case when SoldAsVacant = 'Y' Then 'Yes'
       when SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   End

From dbo.[Nashville Sheet]



Update [Nashville Sheet]
Set SoldAsVacant = Case When SoldAsVacant = 'Y' Then 'Yes'
       when SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   End


	   
select Distinct (SoldAsVacant), Count(SoldAsVacant)
from dbo.[Nashville Sheet]
group by [SoldAsVacant]

order by 2


--Removing Duplicates
Select*,
		Row_Number() Over(
		Partition By ParcelID,
					PropertyAddress,
					SalePrice,
					SaleDate,
					LegalReference
					Order By
					UniqueID
					) row_num

from dbo.[Nashville Sheet]
order by ParcelID


With RowNumCTE AS(
Select*,
		Row_Number() Over(
		Partition By ParcelID,
					PropertyAddress,
					SalePrice,
					SaleDate,
					LegalReference
					Order By
					UniqueID
					) row_num

from dbo.[Nashville Sheet]
--order by ParcelID
)

select*
from RowNumCTE


With RowNumCTE AS(
Select*,
		Row_Number() Over(
		Partition By ParcelID,
					PropertyAddress,
					SalePrice,
					SaleDate,
					LegalReference
					Order By
					UniqueID
					) row_num

from dbo.[Nashville Sheet]
--order by ParcelID
)

select*
from RowNumCTE
where row_num > 1
order by PropertyAddress





With RowNumCTE AS(
Select*,
		Row_Number() Over(
		Partition By ParcelID,
					PropertyAddress,
					SalePrice,
					SaleDate,
					LegalReference
					Order By
					UniqueID
					) row_num

from dbo.[Nashville Sheet]
--order by ParcelID
)

Delete
from RowNumCTE
where row_num > 1
--order by PropertyAddress


-- Del Unused Columns (!!! Do not Delete Raw Data!!!)

select*
from dbo.[Nashville Sheet]


Alter Table dbo.[Nashville Sheet]
Drop Column OwnerAddress,TaxDistrict,PropertyAddress,Owner1SplitAddress,Owner1SplitCity,Owner1SplitState


Alter Table dbo.[Nashville Sheet]
Drop Column SaleDate


