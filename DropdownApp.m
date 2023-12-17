function createDesignApp()
    % Create a MATLAB figure
    fig = figure('Name', 'Design App', 'Position', [100, 100, 400, 200]);

    % Create a dropdown
    dropdown = uicontrol('Style', 'popupmenu', 'String', ...
        {'Filter + Classifier', 'One Layer', 'One Layer'}, ...
        'Position', [100, 140, 200, 30]);

    % Create a button
    button = uicontrol('Style', 'pushbutton', 'String', 'Draw Your Numbers', ...
        'Position', [100, 80, 200, 40], 'Callback', @buttonCallback);

    % Initialize classifierType variable
    classifierType = 0;

    % Callback function for the button
    function buttonCallback(~, ~)
        selectedOption = dropdown.Value;
        
        if selectedOption == 1
            classifierType = 1;
        elseif selectedOption == 2
            classifierType = 2;
        elseif selectedOption == 3
            classifierType = 3;
        end
        
        % Call the mpaper function
        mpaper(classifierType);
    end
end

