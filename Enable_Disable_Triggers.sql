----------------------------------------------------------------------------------
--	Enable and Disable All Triggers for list of Schemas or Tables
--
--	This script will create two scripts that will disable and enable a list all
--	the triggers for list of schema owners or for a list of tables.
--
--	The script works best when run in a tool that displays the output in a grid
--	or table such as SQL Developer, Toad, or Golden.
--
--	Alan Rosenthal
--	November 2016
----------------------------------------------------------------------------------


  SELECT table_name, 
         trigger_name,
         'ALTER TRIGGER ' || LOWER(owner) || '.' || LOWER(trigger_name) || ' DISABLE ;' as disable_command, 
         'ALTER TRIGGER ' || LOWER(owner) || '.' || LOWER(trigger_name) || ' ENABLE ;' as enable_command 
    FROM all_triggers 
   WHERE status     = 'ENABLED' AND 
         owner      IN ('<list of schemas') AND
         table_name IN ('<list of tables>') 
ORDER BY 1, 2
/



