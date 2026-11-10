% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(10).translation = [0.0 0.0 0.0];
smiData.RigidTransform(10).angle = 0.0;
smiData.RigidTransform(10).axis = [0.0 0.0 0.0];
smiData.RigidTransform(10).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 90];  % mm
smiData.RigidTransform(1).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [1 0 0];
smiData.RigidTransform(1).ID = "B[Link2-1:-:Link3-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-499.99999999989075 -1.1368683772161603e-12 90.000000000596003];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [1 -4.3458446643827447e-30 -5.9971058934458239e-13];
smiData.RigidTransform(2).ID = "F[Link2-1:-:Link3-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [1.0769163338864018e-10 -4.4408920985006262e-13 90.000000000000028];  % mm
smiData.RigidTransform(3).angle = 3.14159265358979;  % rad
smiData.RigidTransform(3).axis = [-1 -1.021027095637329e-27 5.9835605265557402e-13];
smiData.RigidTransform(3).ID = "B[Link3-1:-:Link4-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-417.45521225275843 -144.99999999999721 90.000000000007674];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897833;  % rad
smiData.RigidTransform(4).axis = [-1 -2.3109115953591401e-30 4.6960758856101002e-16];
smiData.RigidTransform(4).ID = "F[Link3-1:-:Link4-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 49.999999999999936];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [1 0 -7.095680565804364e-17];
smiData.RigidTransform(5).ID = "B[Link4-1:-:Link5-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-194.99999999998292 -4.8800075092003681e-11 49.999999999979394];  % mm
smiData.RigidTransform(6).angle = 3.141592653589186;  % rad
smiData.RigidTransform(6).axis = [-1 8.0876571933878219e-29 -2.6637533702657277e-16];
smiData.RigidTransform(6).ID = "F[Link4-1:-:Link5-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 0 140];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = "B[1-1:-:Link2-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [5.6843418860808015e-14 -336 5.6843418860808015e-14];  % mm
smiData.RigidTransform(8).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(8).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(8).ID = "F[1-1:-:Link2-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 0 0];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = "B[1-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [0 0 0];  % mm
smiData.RigidTransform(10).angle = 0;  % rad
smiData.RigidTransform(10).axis = [0 0 0];
smiData.RigidTransform(10).ID = "F[1-1:-:]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(5).mass = 0.0;
smiData.Solid(5).CoM = [0.0 0.0 0.0];
smiData.Solid(5).MoI = [0.0 0.0 0.0];
smiData.Solid(5).PoI = [0.0 0.0 0.0];
smiData.Solid(5).color = [0.0 0.0 0.0];
smiData.Solid(5).opacity = 0.0;
smiData.Solid(5).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 15.460639633459735;  % kg
smiData.Solid(1).CoM = [-308.43881699811146 0 3.6892324716431651e-10];  % mm
smiData.Solid(1).MoI = [156962.05123223487 715196.9417141336 620732.60216079094];  % kg*mm^2
smiData.Solid(1).PoI = [-0.00010828412597263146 5.5492730175505079e-07 0];  % kg*mm^2
smiData.Solid(1).color = [0.79607843137254897 0.82352941176470584 0.93725490196078431];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Link3*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 12.187629641742538;  % kg
smiData.Solid(2).CoM = [-288.34609481788277 -26.509134661327177 -4.4232660618023258e-06];  % mm
smiData.Solid(2).MoI = [80599.061290869256 329031.88601175486 363247.46994975623];  % kg*mm^2
smiData.Solid(2).PoI = [-0.0019025573003361113 0.0020250102359728691 -42588.909369272806];  % kg*mm^2
smiData.Solid(2).color = [0.79607843137254897 0.82352941176470584 0.93725490196078431];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Link4*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 14.514672177107817;  % kg
smiData.Solid(3).CoM = [9.1269942174907992e-07 -122.92426271037968 -3.0210031574533954e-06];  % mm
smiData.Solid(3).MoI = [281386.79253985616 109489.90648613205 308061.79399495164];  % kg*mm^2
smiData.Solid(3).PoI = [0.0020858231763095053 0.0037287227885779112 -0.0012978363136210069];  % kg*mm^2
smiData.Solid(3).color = [0.79607843137254897 0.82352941176470584 0.93725490196078431];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Link2*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 1.1799716762685379;  % kg
smiData.Solid(4).CoM = [-170.57447328938258 -1.9453738918758264e-05 0];  % mm
smiData.Solid(4).MoI = [2134.783291480052 6280.2096739676272 6788.025991168839];  % kg*mm^2
smiData.Solid(4).PoI = [0.0012905019648591001 0 0.00011591657217565068];  % kg*mm^2
smiData.Solid(4).color = [0.79607843137254897 0.82352941176470584 0.93725490196078431];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "Link5*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 17.49124744495181;  % kg
smiData.Solid(5).CoM = [0.22206535692178311 -0.22990004625173718 74.10864208354019];  % mm
smiData.Solid(5).MoI = [317193.53365818108 316886.22740203119 440249.99296205706];  % kg*mm^2
smiData.Solid(5).PoI = [-96.946602057827448 93.642790157405273 620.57903931509134];  % kg*mm^2
smiData.Solid(5).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = "1*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(4).Rz.Pos = 0.0;
smiData.RevoluteJoint(4).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = -37.592190094897354;  % deg
smiData.RevoluteJoint(1).ID = "[Link2-1:-:Link3-1]";

smiData.RevoluteJoint(2).Rz.Pos = 35.541396006784311;  % deg
smiData.RevoluteJoint(2).ID = "[Link3-1:-:Link4-1]";

smiData.RevoluteJoint(3).Rz.Pos = -4.2078030810470395;  % deg
smiData.RevoluteJoint(3).ID = "[Link4-1:-:Link5-1]";

smiData.RevoluteJoint(4).Rz.Pos = -36.204507625631976;  % deg
smiData.RevoluteJoint(4).ID = "[1-1:-:Link2-1]";

