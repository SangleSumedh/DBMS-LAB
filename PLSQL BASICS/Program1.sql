SET SERVEROUT ON
SET VERIFY OFF
   
DECLARE 
   message  varchar2(20):= 'Hello, World!'; 
BEGIN 
   dbms_output.put_line(message);
END; 
/ 

-- OUTPUT
  
-- Hello, World!
