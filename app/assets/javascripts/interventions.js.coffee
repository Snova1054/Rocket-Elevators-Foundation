jQuery ->
    $('#intervention_building_id').parent().hide()
    $('#intervention_battery_id').parent().hide()
    $('#intervention_column_id').parent().hide()
    $('#intervention_elevator_id').parent().hide()
    $('.submits').hide()
    buildings = $('#intervention_building_id').html()
    $('#intervention_customer_id').change ->
        customer = $('#intervention_customer_id :selected').text()
        options = $(buildings).filter("optgroup[label='#{customer}']").html()
        if options
            $('#intervention_building_id').empty()
            $('#intervention_building_id').html(options)
            $('#intervention_building_id')
            .prepend($('<option>').val(null).text("Select a Building"));
            $("#intervention_building_id").val($("#intervention_building_id option:first").val()); #Makes the "None be the first value selected"
            $('#intervention_building_id').parent().show()
            $('#intervention_battery_id').empty() #added to empty and hide after changing the customer selected to something else
            $('#intervention_battery_id').parent().hide()
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()
        else
            $('#intervention_building_id').empty()
            $('#intervention_building_id').parent().hide()
            $('#intervention_battery_id').empty() #added to empty and hide after changing the customer selected to NONE
            $('#intervention_battery_id').parent().hide()
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()

    batteries = $('#intervention_battery_id').html()
    $('#intervention_building_id').change ->
        building = $('#intervention_building_id :selected').text()
        options1 = $(batteries).filter("optgroup[label='#{building}']").html()
        if options1
            $('#intervention_battery_id').empty()
            $('#intervention_battery_id').html(options1)
            $('#intervention_battery_id')
            .prepend($('<option>').val(null).text("Select a Battery"));
            $("#intervention_battery_id").val($("#intervention_battery_id option:first").val()); #Makes the "None be the first value selected"
            $('#intervention_battery_id').parent().show()
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()
        else
            $('#intervention_battery_id').empty()
            $('#intervention_battery_id').parent().hide()
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()

    columns = $('#intervention_column_id').html()
    $('#intervention_battery_id').change ->
        battery = $('#intervention_battery_id :selected').text()
        options2 = $(columns).filter("optgroup[label='#{battery}']").html()
        if options2
            $('#intervention_column_id').empty()
            $('#intervention_column_id').html(options2)
            $('#intervention_column_id')
            .prepend($('<option>').val(null).text("None"));
            $("#intervention_column_id").val($("#intervention_column_id option:first").val()); #Makes the "None be the first value selected"
            $('#intervention_column_id').parent().show()
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()
        else
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()

    elevators = $('#intervention_elevator_id').html()
    $('#intervention_column_id').change ->
        column = $('#intervention_column_id :selected').text()
        options3 = $(elevators).filter("optgroup[label='#{column}']").html()
        if options3
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').html(options3)
            $('#intervention_elevator_id')
            .prepend($('<option>').val(null).text("None"));
            $("#intervention_elevator_id").val($("#intervention_elevator_id option:first").val()); #Makes the "None be the first value selected"
            $('#intervention_elevator_id').parent().show()
        else
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()

    $('#new_intervention').change ->
        $('.submits').hide()
        option_battery = $("#intervention_battery_id :selected").val()
        option_text = $('#intervention_report').val()
        if option_battery and option_battery != undefined and option_text and option_text != ""
            $('.submits').show()
        else
            $('.submits').hide()
    $('#intervention_report').keydown ->
        $('.submits').hide()
        option_battery = $("#intervention_battery_id :selected").val()
        option_text = $('#intervention_report').val()
        if option_battery and option_battery != undefined and option_text and option_text != ""
            $('.submits').show()
        else
            $('.submits').hide()
