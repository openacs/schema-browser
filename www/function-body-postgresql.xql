<?xml version="1.0"?>
<queryset>
<rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="function_body">      
      <querytext>

         select
           prosrc
         from
           pg_proc
         where
           oid = :oid

      </querytext>
</fullquery>
 
</queryset>
