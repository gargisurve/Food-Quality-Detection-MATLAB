function FoodQualityGUI
    % Create main figure
    f = uifigure('Name','Food Quality Detection','Position',[300 100 700 500],...
                 'Color',[0.95 0.97 1]); % light blue background

    % Title Label
    lblTitle = uilabel(f,'Text','🍎 Food Quality Detection System 🍞',...
        'Position',[150 440 400 40],'FontSize',18,...
        'FontWeight','bold','FontColor',[0.1 0.3 0.6]);

    % Axes for image display
    ax1 = uiaxes(f,'Position',[50 180 250 220],'Box','on');
    ax2 = uiaxes(f,'Position',[400 180 250 220],'Box','on');

    % Custom dark-colored titles
    title(ax1,'Original Image','Color',[0.1 0.1 0.3],'FontWeight','bold');
    title(ax2,'Spoiled Region Detection','Color',[0.1 0.1 0.3],'FontWeight','bold');

    % Load Button
    btnLoad = uibutton(f,'push','Text','📂 Load Food Image',...
        'FontSize',12,'FontWeight','bold','BackgroundColor',[0.2 0.6 1],...
        'FontColor','w','Position',[100 110 180 50],...
        'ButtonPushedFcn', @(btn,event) loadImage());

    % Exit Button
    btnExit = uibutton(f,'push','Text','❌ Exit',...
        'FontSize',12,'FontWeight','bold','BackgroundColor',[0.9 0.2 0.2],...
        'FontColor','w','Position',[420 110 180 50],...
        'ButtonPushedFcn', @(btn,event) close(f));

    % Result Label (with dark heading style)
    lblResult = uilabel(f,'Text','Result: ',...
        'Position',[200 40 300 50],'FontSize',16,...
        'FontWeight','bold','HorizontalAlignment','center',...
        'FontColor',[0.1 0.1 0.3]); % dark navy

    %% Nested function for image processing
    function loadImage()
        [filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp'}, 'Select a Food Image');
        if isequal(filename,0)
            return;
        end
        img = imread(fullfile(pathname, filename));
        imshow(img,'Parent',ax1);

        % --- Preprocessing ---
        img = imresize(img, [256 256]);
        hsvImg = rgb2hsv(img);
        filteredImg = medfilt2(rgb2gray(img), [3 3]);

        % --- Segmentation ---
        S = hsvImg(:,:,2);
        V = hsvImg(:,:,3);
        mask = (S > 0.2 & V < 0.5);
        mask = imfill(mask,'holes');
        mask = bwareaopen(mask,50);

        imshow(mask,'Parent',ax2);

        % --- Feature Extraction ---
        meanVal = mean2(hsvImg(:,:,3));
        glcm = graycomatrix(filteredImg,'Offset',[2 0]);
        stats = graycoprops(glcm,{'Contrast'});
        contrastVal = stats.Contrast;
        spoiledPercent = (nnz(mask)/numel(mask))*100;

        % --- Classification ---
        if (spoiledPercent > 5 || meanVal < 0.4 || contrastVal > 50)
            result = 'STALE / ROTTEN ❌';
            lblResult.Text = ['Result: ' result];
            lblResult.FontColor = [0.85 0.1 0.1]; % red
        else
            result = 'FRESH ✅';
            lblResult.Text = ['Result: ' result];
            lblResult.FontColor = [0.1 0.6 0.2]; % green
        end
    end
end
