ad_page_contract {
    This is file /www/doc/schema-browser/trigger.tcl

    @param trigger_name

    @author ?
    @creation-date ?
    @cvs-id $Id$

} {
    trigger_name:notnull
}

set page_title "[ad_system_name] One trigger"
set context [list "One Trigger"]

db_1row unused "
    select
        EVENT_OBJECT_TABLE as table_name,
        EVENT_MANIPULATION as trigger_type,
        ACTION_TIMING triggering_event,
        ACTION_STATEMENT as trigger_body
    from
        INFORMATION_SCHEMA.TRIGGERS
    where
        TRIGGER_NAME = :trigger_name"

set trigger_name [string tolower $trigger_name]

regsub -all ";" $trigger_body ";<br> " trigger_body
regsub "begin" $trigger_body "begin<br>" trigger_body
set trigger_body [ad_text_to_html -- $trigger_body]
