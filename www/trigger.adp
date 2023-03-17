<master>
  <property name="doc(title)">@page_title;literal@</property>
  <property name="context">@context;literal@</property>

  <hr>
  create or replace trigger @trigger_name@
  @triggering_event@ @trigger_type@
  <br>
  @trigger_body@

