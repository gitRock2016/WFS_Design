
-- �Q�܂�
select dealer_id,product_id from dealers_detail_products
where dealer_id=1

-- ��i���o�^�f�[�^�A���[���o�b�N�p
delete from dealers_detail_products_saledate where dealer_id='1' and product_id in ('3','4','5','6');
delete from dealers_detail_products_imgs where dealer_id='1' and product_id in ('3','4','5','6');
delete from dealers_detail_products_categories where dealer_id='1' and product_id in ('3','4','5','6');
delete from dealers_detail_products where dealer_id='1' and product_id in ('3','4','5','6');

