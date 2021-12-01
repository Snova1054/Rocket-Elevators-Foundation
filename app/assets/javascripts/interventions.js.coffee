jQuery ->
    $('#intervention_building_id').parent().hide()
    $('#intervention_battery_id').parent().hide()
    buildings = $('#intervention_building_id').html()
    $('#intervention_customer_id').change ->
        customer = $('#intervention_customer_id :selected').text()
        options = $(buildings).filter("optgroup[label='#{customer}']").html()
        if options
            $('#intervention_building_id').empty()
            $('#intervention_building_id').html(options)
            $('#intervention_building_id')
            .prepend($('<option>').val(0).text("None"));
            $("#intervention_building_id").val($("#intervention_building_id option:first").val()); #Makes the "None be the first value selected"
            $('#intervention_building_id').parent().show()
            $('#intervention_battery_id').empty() #added to empty and hide after changing the customer selected to something else
            $('#intervention_battery_id').parent().hide()
        else
            $('#intervention_building_id').empty()
            $('#intervention_building_id').parent().hide()
            $('#intervention_battery_id').empty() #added to empty and hide after changing the customer selected to NONE
            $('#intervention_battery_id').parent().hide()


    batteries = $('#intervention_battery_id').html()
    $('#intervention_building_id').change ->
        building = $('#intervention_building_id :selected').text()
        options1 = $(batteries).filter("optgroup[label='#{building}']").html()
        if options1
            $('#intervention_battery_id').empty()
            $('#intervention_battery_id').html(options1)
            $('#intervention_battery_id')
            .prepend($('<option>').val(0).text("None"));
            $("#intervention_battery_id").val($("#intervention_battery_id option:first").val()); #Makes the "None be the first value selected"
            $('#intervention_battery_id').parent().show()
        else
            $('#intervention_battery_id').empty()
            $('#intervention_battery_id').parent().hide()
