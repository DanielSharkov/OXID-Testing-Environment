<?php
function _description() {
    $sentences = func_get_args();

    $list = '';
    foreach ($sentences[3] as $index => $text) {
        $list .= '<li>'.$text.'</li>';
    }

    return "$sentences[0]<br>
        <a href=\"\" target=\"_blank\">
            $sentences[1]
        </a>
        <hr>
        $sentences[2]
        <ul>$list</ul>
        <hr>
        <span class=\"dash-red-font\">
        $sentences[4]
    </span>";
}
?>