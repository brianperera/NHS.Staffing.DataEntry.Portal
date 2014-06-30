$(document).ready(function () {

    //Change when text change
    BackgroundColorEventHandler();

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        BackgroundColorEventHandler();
    });

});

function BackgroundColorEventHandler() {

    //Change when text change
    $('#MainContent_RN_PlannedNumber_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_HCA_PlannedNumber_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_HCA_TodayNonTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_RN_TodayNonTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_HCA_TodayBank_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_RN_TodayBank_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_HCA_TodayTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_RN_TodayTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_Overrride_HCA_TodayNonTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_Overrride_RN_TodayNonTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_Overrride_HCA_TodayBank_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_Overrride_RN_TodayBank_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_Overrride_HCA_TodayTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_Overrride_RN_TodayTrust_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_RN_OptimumStaffing_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_HCA_OptimumStaffing_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_RN_SafeStaffing_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

    $('#MainContent_HCA_SafeStaffing_TextBox').change(function () {

        var inputValue = $(this).val();

        if (inputValue.length == 0 || inputValue == '0') {
            $(this).css("background-color", "White");
        }
        else {
            $(this).css("background-color", "LightBlue");
        }

    });

}