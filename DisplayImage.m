function [  ] = DisplayImage( im , strTitle )
% This function desplays the input image, "im", and gives it the title
% "strTitle".

    % Add default value to argments
    figure;
    imshow(im);

    title(strTitle); % Add - Create title automatically!!
    % rect = getrect;
    % disp(rect(:));
end

