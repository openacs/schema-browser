ad_page_contract {
    This is file /www/doc/schema-browser/function-body.tcl.  Currently
    it only handles Postgres function bodies, and is called on to
    expand function bodies referenced by triggers.

    @param oid The oid of the pg_proc entry

    @author Don Baccus
    @creation-date September, 2001

} {
    oid:notnull,integer
}


set html "[ad_header "[ad_system_name]  One Trigger's Function Body "]

<h2>[ad_system_name] Schema Browser</h2>
[ad_context_bar_ws [list index.tcl "Schema Browser"] "One Trigger's Function Body"]
"


db_1row function_body ""

append html "
<hr>
<blockquote><pre>$prosrc</pre></blockquote>
[ad_footer]
"

doc_return 200 text/html $html
