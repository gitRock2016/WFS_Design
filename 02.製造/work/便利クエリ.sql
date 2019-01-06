
-- ２まで
select dealer_id,product_id from dealers_detail_products
where dealer_id=1

-- 作品情報登録データ、ロールバック用
delete from dealers_detail_products_saledate where dealer_id='1' and product_id in ('3','4','5','6');
delete from dealers_detail_products_imgs where dealer_id='1' and product_id in ('3','4','5','6');
delete from dealers_detail_products_categories where dealer_id='1' and product_id in ('3','4','5','6');
delete from dealers_detail_products where dealer_id='1' and product_id in ('3','4','5','6');

