<master>
<property name="context">@context;literal@</property>
<property name="doc(title)">@page_title;literal@</property>

<if @table_description@ not nil>
@table_description;noquote@
</if>

<hr><h3>Tables:</h3>
@table_list;noquote@

