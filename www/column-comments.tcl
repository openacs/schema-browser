ad_page_contract {
    This is /www/doc/schema-browser/column-comments.tcl

    @param table_name
    @param column_name

    @author ?
    @creation-date ?
    @cvs-id $Id$
} {
    table_name:notnull
    column_name:notnull
}


set error_count 0
set error_message ""

if { ![info exists table_name] || $table_name == "" } {
    incr error_count
    append error_message "<li>variable table_name not found"
}

if { ![info exists column_name] || $column_name == "" } {
    incr error_count
    append error_message "<li>variable column_name not found"
}

if { $error_count > 0 } {
    ad_return_complaint $error_count $error_message
    ad_script_abort
}



set comments [db_string -default "" unused "
select comments from user_col_comments where table_name = upper(:table_name) and column_name = upper(:column_name)"
]

set href [export_vars -base index {table_name}]
set page_content [subst {
<h2>ArsDigita Schema Browser</h2>
<hr>
    <a href="[ns_quotehtml $href]">Tables</a> : Column Comment
<p>
<b>Enter or revise the comment on $table_name.$column_name:</b>
<form method=post action="column-comments-2">
[export_vars -form {table_name column_name}]
<textarea name="comments" rows="4" cols="40" wrap="soft">$comments</textarea>
<p>
<input type="submit" value="Save comment">
</form>
<hr>
}]


doc_return 200 text/html $page_content

