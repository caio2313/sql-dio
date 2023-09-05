start transaction;

alter table clients add column email varchar(60);

insert into clients(fName, Minit, lastName, CPF, Address) value (
'Marco', 'MM', 'Mathias', '48962821087', 'Rua direita, 4'
);
commit;

DELIMITER //

CREATE PROCEDURE pr_pr()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK TO savepoint_rollback;
    END;
    START TRANSACTION;

    SAVEPOINT savepoint_rollback;
    
    select c.*, p.* from clients as c join payment as p on c.idClient = p.idClientPay join orders as o on c.idClient = o.idOrderClient;
    
    IF o.paymentBoleto = 'yes' THEN
        UPDATE payment SET typePayment = 'Boleto' where o.idOrderClient = p.idClientPay;
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
    
    end //
    
    delimiter ;

#mysqldump --user root --password --databases transaction_mode > transaction_backup_sqlmy.sql



