%% PrePlan
% Kirk Boyd - 12/11/2022

classdef preplan < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        PrePlanUIFigure                 matlab.ui.Figure
        TopRotationVelocityzradsecondEditField  matlab.ui.control.NumericEditField
        TopRotationVelocityzradsecondEditFieldLabel  matlab.ui.control.Label
        ComputeButton                   matlab.ui.control.Button
        Task1WithMoxyCoinFlipSlider     matlab.ui.control.Slider
        Task1WithMoxyCoinFlipRandomStartOrientationLabel  matlab.ui.control.Label
        FiretorpedoesthroughproperopeningLabel_2  matlab.ui.control.Label
        Task6CashorSmashOctagon         matlab.ui.control.Slider
        Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label_2  matlab.ui.control.Label
        OpeningSizeDropDown             matlab.ui.control.DropDown
        OpeningSizeDropDownLabel        matlab.ui.control.Label
        FiretorpedoesthroughproperopeningLabel  matlab.ui.control.Label
        LiftoffcoverforextrapointsLabel  matlab.ui.control.Label
        PlaceproperitemmarkersinbinLabel  matlab.ui.control.Label
        BumpTeamBuoyLabel               matlab.ui.control.Label
        ManeuverforStylePointsLabel     matlab.ui.control.Label
        RandomStartOrientationLabel     matlab.ui.control.Label
        Task5SurviveTheShootoutTorpedoes  matlab.ui.control.Slider
        Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label  matlab.ui.control.Label
        Task4bCollectingBonusSlider     matlab.ui.control.Slider
        Task4bCollectingBonusLiftoffcoverforextrapointsLabel  matlab.ui.control.Label
        Task4aCollectingPickPlaceSlider  matlab.ui.control.Slider
        Task4aCollectingPickPlaceSliderLabel  matlab.ui.control.Label
        Task3MaketheGradeBuoysSlider    matlab.ui.control.Slider
        Task3MaketheGradeBuoysSliderLabel  matlab.ui.control.Label
        Task2ChooseYourSideGateSlider   matlab.ui.control.Slider
        Task2ChooseYourSideGateManeuverforStylePointsLabel  matlab.ui.control.Label
        Label                           matlab.ui.control.Label
        SelectPriorityConfidenceofEachTaskLabel  matlab.ui.control.Label
        WhichtaskswillbeattemptedLabel  matlab.ui.control.Label
        TopRiseVelocityzmeterssecondEditField_3  matlab.ui.control.NumericEditField
        TopRiseVelocityzmeterssecondEditField_3Label  matlab.ui.control.Label
        TopStrafeVelocityymeterssecondEditField  matlab.ui.control.NumericEditField
        TopStrafeVelocityymeterssecondEditFieldLabel  matlab.ui.control.Label
        TopForwardVelocityxmeterssecondEditField  matlab.ui.control.NumericEditField
        TopForwardVelocityxmeterssecondEditFieldLabel  matlab.ui.control.Label
        WhichSideDropDown               matlab.ui.control.DropDown
        WhichSideDropDownLabel          matlab.ui.control.Label
        SubHeightzmetersEditField       matlab.ui.control.NumericEditField
        SubHeightzmetersEditFieldLabel  matlab.ui.control.Label
        SubWidthymetersEditField        matlab.ui.control.NumericEditField
        SubWidthymetersEditFieldLabel   matlab.ui.control.Label
        SubLengthxmetersEditField       matlab.ui.control.NumericEditField
        SubLengthxmetersEditFieldLabel  matlab.ui.control.Label
    end

    
    properties (Access = public)
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ComputeButton
        function ComputeButtonPushed(app, ~)
            clc;
            fileName = "preplan.json";
            startPos = [1.5,3,1.2]; % location where sub begins trial
            %task1coords = startPos;
            task2coords = [4.5,3.8,1.2];
            task3coords = [6.1,7.8,1.2];
            task4coords = [9.8,13.3,1.2];
            task5coords = [2.3,15.5,1.2];
            task6coords = [3.7,20.6,1.2];
            %compute = 1;
            s.length = app.SubLengthxmetersEditField.Value;
            s.width = app.SubWidthymetersEditField.Value;
            s.height = app.SubHeightzmetersEditField.Value;
            s.poolLength = 22.8; %m
            s.poolWidth = 12.2; %m
            s.poolDepth = 2.4; %m at shallowest point for safety
            s.maxVelX = app.TopForwardVelocityxmeterssecondEditField.Value;
            s.maxVelY = app.TopStrafeVelocityymeterssecondEditField.Value;
            s.maxVelZ = app.TopRiseVelocityzmeterssecondEditField_3.Value;
            s.maxVelAlpha = app.TopRotationVelocityzradsecondEditField.Value; %rad/s
            s.maxVelBeta = s.maxVelAlpha; %rad/s
            s.maxVelGamma =  s.maxVelAlpha; %rad/s
            s.obstLength = 3.05; %m
            s.obstWidth = 3.05; %m
            s.obstHeight = 2.4; %m
            s.team = app.WhichSideDropDown.Value;
            s.task1conf = app.Task1WithMoxyCoinFlipSlider.Value;
            s.task2conf = app.Task2ChooseYourSideGateSlider.Value;
            s.task3conf = app.Task3MaketheGradeBuoysSlider.Value;
            s.task4conf_a = app.Task4aCollectingPickPlaceSlider.Value;
            s.task4conf_b = app.Task4bCollectingBonusSlider.Value;
            s.task5conf = app.Task5SurviveTheShootoutTorpedoes.Value;
            s.task6conf = app.Task6CashorSmashOctagon.Value;
            s.torpedoHoleSize = app.OpeningSizeDropDown.Value;
            s.coords = startPos;
            % Check and store event occurrences
            if s.task1conf > 0
                s.task1 = true;
            else
                s.task1 = false;
            end
            if s.task2conf > 0
                s.task2 = true;
            else
                s.task2 = false;
            end
            if s.task3conf > 0
                s.task3 = true;
            else
                s.task3 = false;
            end
            if s.task4conf_a > 0
                s.task4_a = true;
            else
                s.task4_b = false;
            end
            if s.task4conf_b > 0
                s.task4_b = true;
            else
                s.task4_b = false;
            end
            if s.task5conf > 0
                s.task5 = true;
            else
                s.task5 = false;
            end
            if s.task6conf > 0
                s.task6 = true;
            else
                s.task6 = false;
            end
            if s.task4conf_a || s.task4conf_b
                s.task4 = true;
            else
                s.task4 = false;
            end
            % Establish task order
            if s.task2
                % task2 must precede all others if it occurs
                s.coords = [s.coords; task2coords];
                if s.task3
                    if s.task4
                        if s.task5
                            if s.task6
                                % all tasks
                                % sort by priority, by default shortest
                                % path
                                tasks = [s.task3conf,task3coords;...
                                    s.task4conf_a,task4coords;s.task5conf,...
                                    task5coords;s.task6conf,task6coords];
                                [~,I] = sort(tasks(:,1),'descend');
                                s.coords = [s.coords;tasks(I(1),2:4);...
                                    tasks(I(2),2:4);tasks(I(3),2:4);...
                                    tasks(I(4),2:4)];
                            end
                        elseif s.task6 
                            % all but task 5
                            if s.task6conf>s.task3conf % 6 before 3
                                if s.task6conf>s.task4conf % 6 before 4
                                    if s.task4conf>s.task3conf % 4 before 3
                                        %2643
                                        s.coords = [s.coords;task6coords;task4coords;task3coords];
                                    else
                                        %2634
                                        s.coords = [s.coords;task6coords;task3coords;task4coords];
                                    end
                                elseif s.task4conf>s.task6conf % 4 before 6 which is before 3
                                    %2463
                                    s.coords = [s.coords;task4coords;task6coords;task3coords];
                                end
                            elseif s.task4conf>s.task3conf % 4 before 3
                                %2436
                                s.coords = [s.coords;task4coords;task3coords;task6coords];
                            elseif s.task6conf>s.task4conf
                                %2364
                                s.coords = [s.coords;task4coords;task6coords;task4coords];
                            else
                                %2346 shortest path
                                s.coords = [s.coords;task3coords;task4coords;task6coords];
                            end
                        end
                    elseif s.task5
                        if s.task6
                            % task 2,3,5,6
                            if s.task6conf>s.task5conf
                                if s.task5conf>s.task3conf
                                    %2653
                                    s.coords = [s.coords;task6coords;task5coords;task3coords];
                                else
                                    %2635
                                    s.coords = [s.coords;task6coords;task3coords;task5coords];
                                end
                            elseif s.task5conf>s.task3conf
                                if s.task6conf>s.task3conf
                                    %2563
                                    s.coords = [s.coords;task5coords;task6coords;task3coords];
                                else
                                    %2536
                                    s.coords = [s.coords;task5coords;task3coords;task6coords];
                                end
                            else
                                % follow shortest: 2356
                                s.coords = [s.coords;task3coords;task5coords;task6coords];
                            end

                        else
                            % task 2,3,5
                            % 235 is shortest path, so follow unless 5 was
                            % given priority
                            if s.task5conf>s.task3conf
                                s.coords = [s.coords;task5coords;task3coords];
                            else
                                s.coords = [s.coords;task3coords;task5coords];
                            end
                        end
                    elseif s.task6
                        % tasks 2,3,6
                        % 236 is shortest path, so follow unless 6 was
                        % given priority
                        if s.task6conf>s.task3conf
                            s.coords = [s.coords;task6coords;task3coords];
                        else
                            s.coords = [s.coords;task3coords;task6coords];
                        end
                    end
                elseif s.task4
                    if s.task5
                        if s.task6
                            % tasks 2,4,5,6
                            if task5conf > task4conf
                                if task6conf > task5conf
                                    s.coords = [s.coords; task6coords;
                                        task5coords; task4coords];
                                elseif task6conf > task4conf
                                    s.coords = [s.coords;task5coords;
                                        task6coords;task4coords];
                                else
                                    s.coords = [s.coords;task5coords;task4coords;task6coords];
                                end
                            elseif task6conf>task4conf_b
                                s.coords = [s.coords;task6coords;task4coords;task5coords];
                            else 
                                % if no other task has priority, follow
                                % shortest path
                                s.coords = [s.coords;task4coords;task5coords;task6coords];
                            end
                        else
                            % tasks 2,4,5
                            % path 245 is shorter than 254, so unless 
                            % confidence with 5 is higher, order is 245
                            if task5conf > task4conf
                                s.coords = [s.coords;task5coords;task4coords];
                            else
                                s.coords = [s.coords;task4coords;task5coords];
                            end
                        end
                    elseif s.task6
                        % tasks 2,4,6
                        % task 4 is on the way to 6, so unless confidence
                        % with 6 is higher, order is 2,5,6
                        if task6conf > task4conf
                            s.coords = [s.coords;task6coords;task4coords];
                        else
                            s.coords = [s.coords;task4coords;task6coords];
                        end
                    end
                elseif s.task5
                    if s.task6
                        % tasks 2,5,6
                        % task 5 is on the way to 6, so unless confidence
                        % with 6 is higher, order is 2,5,6
                        if task6conf > task5conf
                            s.coords = [s.coords;task6coords;task5coords];
                        else
                            s.coords = [s.coords;task5coords;task6coords];
                        end
                    else
                        % tasks 2,5
                        s.coords = [s.coords;task5coords];
                    end
                elseif s.task6
                    % tasks 2,6
                    s.coords = [s.coords;task6coords];
                end
            else
                
            end % if task2

            output = jsonencode(s,PrettyPrint=true);
            fid = fopen(fileName,'w');
            fprintf(fid,output);
            fclose("all");
            disp("Data Written to preplan.json")
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create PrePlanUIFigure and hide until all components are created
            app.PrePlanUIFigure = uifigure('Visible', 'off');
            app.PrePlanUIFigure.Position = [100 100 632 521];
            app.PrePlanUIFigure.Name = 'PrePlan';

            % Create SubLengthxmetersEditFieldLabel
            app.SubLengthxmetersEditFieldLabel = uilabel(app.PrePlanUIFigure);
            app.SubLengthxmetersEditFieldLabel.Position = [17 488 130 22];
            app.SubLengthxmetersEditFieldLabel.Text = 'Sub Length - x [meters]';

            % Create SubLengthxmetersEditField
            app.SubLengthxmetersEditField = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.SubLengthxmetersEditField.Limits = [0 1.83];
            app.SubLengthxmetersEditField.Position = [162 488 100 22];
            app.SubLengthxmetersEditField.Value = 1.83;

            % Create SubWidthymetersEditFieldLabel
            app.SubWidthymetersEditFieldLabel = uilabel(app.PrePlanUIFigure);
            app.SubWidthymetersEditFieldLabel.Position = [17 467 130 22];
            app.SubWidthymetersEditFieldLabel.Text = 'Sub Width - y [meters]';

            % Create SubWidthymetersEditField
            app.SubWidthymetersEditField = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.SubWidthymetersEditField.Limits = [0 0.91];
            app.SubWidthymetersEditField.Position = [162 467 100 22];
            app.SubWidthymetersEditField.Value = 0.91;

            % Create SubHeightzmetersEditFieldLabel
            app.SubHeightzmetersEditFieldLabel = uilabel(app.PrePlanUIFigure);
            app.SubHeightzmetersEditFieldLabel.Position = [17 446 130 22];
            app.SubHeightzmetersEditFieldLabel.Text = 'Sub Height - z [meters]';

            % Create SubHeightzmetersEditField
            app.SubHeightzmetersEditField = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.SubHeightzmetersEditField.Limits = [0 0.91];
            app.SubHeightzmetersEditField.Position = [162 446 100 22];
            app.SubHeightzmetersEditField.Value = 0.91;

            % Create WhichSideDropDownLabel
            app.WhichSideDropDownLabel = uilabel(app.PrePlanUIFigure);
            app.WhichSideDropDownLabel.HorizontalAlignment = 'right';
            app.WhichSideDropDownLabel.Position = [442 310 72 22];
            app.WhichSideDropDownLabel.Text = 'Which Side?';

            % Create WhichSideDropDown
            app.WhichSideDropDown = uidropdown(app.PrePlanUIFigure);
            app.WhichSideDropDown.Items = {'G-Man', 'Bootlegger'};
            app.WhichSideDropDown.Position = [529 310 96 22];
            app.WhichSideDropDown.Value = 'Bootlegger';

            % Create TopForwardVelocityxmeterssecondEditFieldLabel
            app.TopForwardVelocityxmeterssecondEditFieldLabel = uilabel(app.PrePlanUIFigure);
            app.TopForwardVelocityxmeterssecondEditFieldLabel.Position = [281 488 224 22];
            app.TopForwardVelocityxmeterssecondEditFieldLabel.Text = 'Top Forward Velocity - x [meters/second]';

            % Create TopForwardVelocityxmeterssecondEditField
            app.TopForwardVelocityxmeterssecondEditField = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.TopForwardVelocityxmeterssecondEditField.Limits = [0 Inf];
            app.TopForwardVelocityxmeterssecondEditField.Position = [504 488 87 22];
            app.TopForwardVelocityxmeterssecondEditField.Value = 1.5;

            % Create TopStrafeVelocityymeterssecondEditFieldLabel
            app.TopStrafeVelocityymeterssecondEditFieldLabel = uilabel(app.PrePlanUIFigure);
            app.TopStrafeVelocityymeterssecondEditFieldLabel.Position = [282 467 211 22];
            app.TopStrafeVelocityymeterssecondEditFieldLabel.Text = 'Top Strafe Velocity - y [meters/second]';

            % Create TopStrafeVelocityymeterssecondEditField
            app.TopStrafeVelocityymeterssecondEditField = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.TopStrafeVelocityymeterssecondEditField.Limits = [0 Inf];
            app.TopStrafeVelocityymeterssecondEditField.Position = [504 467 87 22];
            app.TopStrafeVelocityymeterssecondEditField.Value = 1;

            % Create TopRiseVelocityzmeterssecondEditField_3Label
            app.TopRiseVelocityzmeterssecondEditField_3Label = uilabel(app.PrePlanUIFigure);
            app.TopRiseVelocityzmeterssecondEditField_3Label.Position = [282 446 203 22];
            app.TopRiseVelocityzmeterssecondEditField_3Label.Text = 'Top Rise Velocity - z [meters/second]';

            % Create TopRiseVelocityzmeterssecondEditField_3
            app.TopRiseVelocityzmeterssecondEditField_3 = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.TopRiseVelocityzmeterssecondEditField_3.Limits = [0 Inf];
            app.TopRiseVelocityzmeterssecondEditField_3.Position = [504 446 87 22];
            app.TopRiseVelocityzmeterssecondEditField_3.Value = 0.5;

            % Create WhichtaskswillbeattemptedLabel
            app.WhichtaskswillbeattemptedLabel = uilabel(app.PrePlanUIFigure);
            app.WhichtaskswillbeattemptedLabel.FontWeight = 'bold';
            app.WhichtaskswillbeattemptedLabel.Position = [17 407 183 22];
            app.WhichtaskswillbeattemptedLabel.Text = 'Which tasks will be attempted?';

            % Create SelectPriorityConfidenceofEachTaskLabel
            app.SelectPriorityConfidenceofEachTaskLabel = uilabel(app.PrePlanUIFigure);
            app.SelectPriorityConfidenceofEachTaskLabel.Position = [17 394 513 22];
            app.SelectPriorityConfidenceofEachTaskLabel.Text = 'Select priority/confidence of each task. (If a task will not be attempted, assign confidence of 0)';

            % Create Label
            app.Label = uilabel(app.PrePlanUIFigure);
            app.Label.Position = [21 374 25 22];
            app.Label.Text = '';

            % Create Task2ChooseYourSideGateManeuverforStylePointsLabel
            app.Task2ChooseYourSideGateManeuverforStylePointsLabel = uilabel(app.PrePlanUIFigure);
            app.Task2ChooseYourSideGateManeuverforStylePointsLabel.FontWeight = 'bold';
            app.Task2ChooseYourSideGateManeuverforStylePointsLabel.Position = [20 313 188 22];
            app.Task2ChooseYourSideGateManeuverforStylePointsLabel.Text = 'Task 2: Choose Your Side - Gate';

            % Create Task2ChooseYourSideGateSlider
            app.Task2ChooseYourSideGateSlider = uislider(app.PrePlanUIFigure);
            app.Task2ChooseYourSideGateSlider.Limits = [0 10];
            app.Task2ChooseYourSideGateSlider.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task2ChooseYourSideGateSlider.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task2ChooseYourSideGateSlider.FontWeight = 'bold';
            app.Task2ChooseYourSideGateSlider.Position = [266 332 162 3];
            app.Task2ChooseYourSideGateSlider.Value = 9;

            % Create Task3MaketheGradeBuoysSliderLabel
            app.Task3MaketheGradeBuoysSliderLabel = uilabel(app.PrePlanUIFigure);
            app.Task3MaketheGradeBuoysSliderLabel.FontWeight = 'bold';
            app.Task3MaketheGradeBuoysSliderLabel.Position = [19 268 186 22];
            app.Task3MaketheGradeBuoysSliderLabel.Text = {'Task 3: Make the Grade - Buoys'; ''};

            % Create Task3MaketheGradeBuoysSlider
            app.Task3MaketheGradeBuoysSlider = uislider(app.PrePlanUIFigure);
            app.Task3MaketheGradeBuoysSlider.Limits = [0 10];
            app.Task3MaketheGradeBuoysSlider.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task3MaketheGradeBuoysSlider.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task3MaketheGradeBuoysSlider.FontWeight = 'bold';
            app.Task3MaketheGradeBuoysSlider.Position = [265 287 162 3];
            app.Task3MaketheGradeBuoysSlider.Value = 8;

            % Create Task4aCollectingPickPlaceSliderLabel
            app.Task4aCollectingPickPlaceSliderLabel = uilabel(app.PrePlanUIFigure);
            app.Task4aCollectingPickPlaceSliderLabel.FontWeight = 'bold';
            app.Task4aCollectingPickPlaceSliderLabel.Position = [19 225 196 22];
            app.Task4aCollectingPickPlaceSliderLabel.Text = {'Task 4a: Collecting - Pick & Place'; ''};

            % Create Task4aCollectingPickPlaceSlider
            app.Task4aCollectingPickPlaceSlider = uislider(app.PrePlanUIFigure);
            app.Task4aCollectingPickPlaceSlider.Limits = [0 10];
            app.Task4aCollectingPickPlaceSlider.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task4aCollectingPickPlaceSlider.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task4aCollectingPickPlaceSlider.FontWeight = 'bold';
            app.Task4aCollectingPickPlaceSlider.Position = [265 244 162 3];
            app.Task4aCollectingPickPlaceSlider.Value = 7;

            % Create Task4bCollectingBonusLiftoffcoverforextrapointsLabel
            app.Task4bCollectingBonusLiftoffcoverforextrapointsLabel = uilabel(app.PrePlanUIFigure);
            app.Task4bCollectingBonusLiftoffcoverforextrapointsLabel.FontWeight = 'bold';
            app.Task4bCollectingBonusLiftoffcoverforextrapointsLabel.Position = [19 182 162 22];
            app.Task4bCollectingBonusLiftoffcoverforextrapointsLabel.Text = 'Task 4b: Collecting - Bonus';

            % Create Task4bCollectingBonusSlider
            app.Task4bCollectingBonusSlider = uislider(app.PrePlanUIFigure);
            app.Task4bCollectingBonusSlider.Limits = [0 10];
            app.Task4bCollectingBonusSlider.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task4bCollectingBonusSlider.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task4bCollectingBonusSlider.FontWeight = 'bold';
            app.Task4bCollectingBonusSlider.Position = [265 201 162 3];
            app.Task4bCollectingBonusSlider.Value = 6;

            % Create Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label = uilabel(app.PrePlanUIFigure);
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label.FontWeight = 'bold';
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label.Position = [18 143 243 22];
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label.Text = 'Task 5: Survive the Shootout - Torpedoes';

            % Create Task5SurviveTheShootoutTorpedoes
            app.Task5SurviveTheShootoutTorpedoes = uislider(app.PrePlanUIFigure);
            app.Task5SurviveTheShootoutTorpedoes.Limits = [0 10];
            app.Task5SurviveTheShootoutTorpedoes.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task5SurviveTheShootoutTorpedoes.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task5SurviveTheShootoutTorpedoes.FontWeight = 'bold';
            app.Task5SurviveTheShootoutTorpedoes.Position = [265 160 162 3];
            app.Task5SurviveTheShootoutTorpedoes.Value = 5;

            % Create RandomStartOrientationLabel
            app.RandomStartOrientationLabel = uilabel(app.PrePlanUIFigure);
            app.RandomStartOrientationLabel.Position = [22 350 149 22];
            app.RandomStartOrientationLabel.Text = '(Random Start Orientation)';

            % Create ManeuverforStylePointsLabel
            app.ManeuverforStylePointsLabel = uilabel(app.PrePlanUIFigure);
            app.ManeuverforStylePointsLabel.Position = [23 301 151 22];
            app.ManeuverforStylePointsLabel.Text = '(Maneuver for Style Points)';

            % Create BumpTeamBuoyLabel
            app.BumpTeamBuoyLabel = uilabel(app.PrePlanUIFigure);
            app.BumpTeamBuoyLabel.Position = [22 256 107 22];
            app.BumpTeamBuoyLabel.Text = '(Bump Team Buoy)';

            % Create PlaceproperitemmarkersinbinLabel
            app.PlaceproperitemmarkersinbinLabel = uilabel(app.PrePlanUIFigure);
            app.PlaceproperitemmarkersinbinLabel.Position = [24 213 195 22];
            app.PlaceproperitemmarkersinbinLabel.Text = '(Place proper item marker(s) in bin)';

            % Create LiftoffcoverforextrapointsLabel
            app.LiftoffcoverforextrapointsLabel = uilabel(app.PrePlanUIFigure);
            app.LiftoffcoverforextrapointsLabel.Position = [23 170 161 22];
            app.LiftoffcoverforextrapointsLabel.Text = '(Lift off cover for extra points)';

            % Create FiretorpedoesthroughproperopeningLabel
            app.FiretorpedoesthroughproperopeningLabel = uilabel(app.PrePlanUIFigure);
            app.FiretorpedoesthroughproperopeningLabel.Position = [22 129 220 22];
            app.FiretorpedoesthroughproperopeningLabel.Text = '(Fire torpedoes through proper opening)';

            % Create OpeningSizeDropDownLabel
            app.OpeningSizeDropDownLabel = uilabel(app.PrePlanUIFigure);
            app.OpeningSizeDropDownLabel.HorizontalAlignment = 'right';
            app.OpeningSizeDropDownLabel.Position = [442 138 77 22];
            app.OpeningSizeDropDownLabel.Text = 'Opening Size';

            % Create OpeningSizeDropDown
            app.OpeningSizeDropDown = uidropdown(app.PrePlanUIFigure);
            app.OpeningSizeDropDown.Items = {'Large', 'Small'};
            app.OpeningSizeDropDown.Position = [534 138 71 22];
            app.OpeningSizeDropDown.Value = 'Large';

            % Create Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label_2
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label_2 = uilabel(app.PrePlanUIFigure);
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label_2.FontWeight = 'bold';
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label_2.Position = [19 92 196 22];
            app.Task4bCollectingBonusLiftoffcoverforextrapointsSlider_2Label_2.Text = 'Task 6: Cash or Smash - Octagon';

            % Create Task6CashorSmashOctagon
            app.Task6CashorSmashOctagon = uislider(app.PrePlanUIFigure);
            app.Task6CashorSmashOctagon.Limits = [0 10];
            app.Task6CashorSmashOctagon.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task6CashorSmashOctagon.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task6CashorSmashOctagon.FontWeight = 'bold';
            app.Task6CashorSmashOctagon.Position = [265 111 162 3];
            app.Task6CashorSmashOctagon.Value = 4;

            % Create FiretorpedoesthroughproperopeningLabel_2
            app.FiretorpedoesthroughproperopeningLabel_2 = uilabel(app.PrePlanUIFigure);
            app.FiretorpedoesthroughproperopeningLabel_2.Position = [22 80 220 22];
            app.FiretorpedoesthroughproperopeningLabel_2.Text = '(Fire torpedoes through proper opening)';

            % Create Task1WithMoxyCoinFlipRandomStartOrientationLabel
            app.Task1WithMoxyCoinFlipRandomStartOrientationLabel = uilabel(app.PrePlanUIFigure);
            app.Task1WithMoxyCoinFlipRandomStartOrientationLabel.FontWeight = 'bold';
            app.Task1WithMoxyCoinFlipRandomStartOrientationLabel.Position = [20 362 171 22];
            app.Task1WithMoxyCoinFlipRandomStartOrientationLabel.Text = 'Task 1: With Moxy - Coin Flip';

            % Create Task1WithMoxyCoinFlipSlider
            app.Task1WithMoxyCoinFlipSlider = uislider(app.PrePlanUIFigure);
            app.Task1WithMoxyCoinFlipSlider.Limits = [0 10];
            app.Task1WithMoxyCoinFlipSlider.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.Task1WithMoxyCoinFlipSlider.MinorTicks = [0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
            app.Task1WithMoxyCoinFlipSlider.FontWeight = 'bold';
            app.Task1WithMoxyCoinFlipSlider.Position = [265 381 162 3];
            app.Task1WithMoxyCoinFlipSlider.Value = 10;

            % Create ComputeButton
            app.ComputeButton = uibutton(app.PrePlanUIFigure, 'push');
            app.ComputeButton.ButtonPushedFcn = createCallbackFcn(app, @ComputeButtonPushed, true);
            app.ComputeButton.FontSize = 18;
            app.ComputeButton.FontWeight = 'bold';
            app.ComputeButton.Position = [251 17 130 36];
            app.ComputeButton.Text = 'Compute!';

            % Create TopRotationVelocityzradsecondEditFieldLabel
            app.TopRotationVelocityzradsecondEditFieldLabel = uilabel(app.PrePlanUIFigure);
            app.TopRotationVelocityzradsecondEditFieldLabel.Position = [282 426 204 22];
            app.TopRotationVelocityzradsecondEditFieldLabel.Text = 'Top Rotation Velocity - z [rad/second]';

            % Create TopRotationVelocityzradsecondEditField
            app.TopRotationVelocityzradsecondEditField = uieditfield(app.PrePlanUIFigure, 'numeric');
            app.TopRotationVelocityzradsecondEditField.Limits = [0 Inf];
            app.TopRotationVelocityzradsecondEditField.Position = [504 426 87 22];
            app.TopRotationVelocityzradsecondEditField.Value = 0.1;

            % Show the figure after all components are created
            app.PrePlanUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = preplan

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.PrePlanUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.PrePlanUIFigure)
        end
    end
end