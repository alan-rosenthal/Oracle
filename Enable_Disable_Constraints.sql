--------------------------------------------------------------------------------------------
--	Create Script to DISABLE and ENABLE All Constraints for a List of Tables
--
--	This script will create two scripts.  The first one will disable all constraints
--	and the second one will enable all constraints.
--
--	You can enter either the owner schema name or a list of tables. 
--
--	This works best if you run it in a tool that disables the output in a grid or table
--	such as SQL Developer, Toad, or Golden.
--
--	Alan Rosenthal
--	November 2016
-------------------------------------------------------------------------------------------


  SELECT table_name, 
         constraint_name, 
         'ALTER TABLE ' || LOWER(owner) || '.' || LOWER(table_name) || ' DISABLE CONSTRAINT ' || LOWER(constraint_name) || ' ;' as disable_command, 
         'ALTER TABLE ' || LOWER(owner) || '.' || LOWER(table_name) || ' ENABLE CONSTRAINT '  || LOWER(constraint_name) || ' ;' as enable_command 
    FROM user_constraints 
   WHERE constraint_type = 'R' AND 
         status          = 'ENABLED' AND 
         owner           = '<schema owner>' AND 
         table_name      IN ( '<list of tables>' )
ORDER BY 1, 2
/



