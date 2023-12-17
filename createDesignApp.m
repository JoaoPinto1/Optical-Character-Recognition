function createDesignApp()

    function buttonCallback(~, ~)
        mpaper("", dropdown.Value)
    end

    % Create a MATLAB figure
    fig = figure('Name', 'Design App', 'Position', [100, 100, 400, 200]);
    
     % Add a text label above the dropdown
    uicontrol('Style', 'text', ...
        'Position', [80, 160, 300, 30], ...
        'String', 'Choose the classifier that will be used to recognize your digits', ...
        'HorizontalAlignment', 'center'); % Adjust the position and size as needed

    % Create a dropdown and make it taller
    dropdown = uicontrol('Style', 'popupmenu', ...
        'String', {'Filter + Classifier', 'One Layer classifier', 'Two Layer classifier'}, ...
        'Position', [100, 100, 200, 60]); 

    % Create a button
    button = uicontrol('Style', 'pushbutton', 'String', 'Draw Your Numbers', ...
        'Position', [100, 60, 200, 40], 'Callback', @buttonCallback);
    
        % Change the background color of the button
    button.BackgroundColor = [135, 206, 235] / 255; % RGB values for Sky Blue

end

