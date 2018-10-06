$(function () {
    var availableTags = [
        "ActionScript",
        "AppleScript",
        "Asp",
        "C",
        "C++",
        "HTML 5",
        "Java",
        "JavaScript",
        "JSP",
        "PHP"
    ];
    $("#tags").autocomplete({
        source: availableTags
    });
});
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})