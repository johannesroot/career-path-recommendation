% Define the criteria for each department
software_skill([programming, web_design, system_design, project_management, security_analysis]).
software_future_career([iot, web_development, app_development, system_design, system_development]).
software_academic_background([undergraduate, post_graduate, high_school]).
software_interest([technology, computers, web]).

computer_science_skill([algorithms, data_structures, machine_learning, artificial_intelligence, databases]).
computer_science_future_career([data_scientist, machine_learning_engineer, researcher, software_developer, database_administrator]).
computer_science_academic_background([undergraduate, post_graduate, high_school]).
computer_science_interest([computing, data_analysis, research, innovation]).

civil_engineering_skill([structural_analysis, construction_management, surveying, geotechnical_engineering, environmental_engineering]).
civil_engineering_future_career([structural_engineer, construction_manager, surveyor, geotechnical_engineer, environmental_engineer]).
civil_engineering_academic_background([undergraduate, post_graduate, high_school]).
civil_engineering_interest([building, infrastructure, environment, design]).

mechanical_engineering_skill([thermodynamics, fluid_mechanics, materials_science, robotics, manufacturing]).
mechanical_engineering_future_career([mechanical_engineer, robotics_engineer, manufacturing_engineer, materials_engineer, automotive_engineer]).
mechanical_engineering_academic_background([undergraduate, post_graduate, high_school]).
mechanical_engineering_interest([machines, robotics, manufacturing, design]).

metrology_skill([measurement_techniques, calibration, quality_control, instrumentation, data_analysis]).
metrology_future_career([metrologist, quality_control_specialist, calibration_technician, instrumentation_engineer, data_analyst]).
metrology_academic_background([undergraduate, post_graduate, high_school]).
metrology_interest([precision, measurement, quality, data]).

electrical_engineering_skill([circuit_design, power_systems, electronics, signal_processing, control_systems]).
electrical_engineering_future_career([electrical_engineer, electronics_engineer, power_engineer, control_systems_engineer, telecommunications_engineer]).
electrical_engineering_academic_background([undergraduate, post_graduate, high_school]).
electrical_engineering_interest([electricity, electronics, power, control]).

% Rules to recommend each department
recommend_software_engineering(Skill, FutureCareer, AcademicBackground, Interest) :-
    software_skill(Skills),
    software_future_career(FutureCareers),
    software_academic_background(AcademicBackgrounds),
    software_interest(Interests),
    member(Skill, Skills),
    member(FutureCareer, FutureCareers),
    member(AcademicBackground, AcademicBackgrounds),
    member(Interest, Interests),
    write('Matched Software Engineering criteria'), nl.

recommend_computer_science(Skill, FutureCareer, AcademicBackground, Interest) :-
    computer_science_skill(Skills),
    computer_science_future_career(FutureCareers),
    computer_science_academic_background(AcademicBackgrounds),
    computer_science_interest(Interests),
    member(Skill, Skills),
    member(FutureCareer, FutureCareers),
    member(AcademicBackground, AcademicBackgrounds),
    member(Interest, Interests),
    write('Matched Computer Science criteria'), nl.

recommend_civil_engineering(Skill, FutureCareer, AcademicBackground, Interest) :-
    civil_engineering_skill(Skills),
    civil_engineering_future_career(FutureCareers),
    civil_engineering_academic_background(AcademicBackgrounds),
    civil_engineering_interest(Interests),
    member(Skill, Skills),
    member(FutureCareer, FutureCareers),
    member(AcademicBackground, AcademicBackgrounds),
    member(Interest, Interests),
    write('Matched Civil Engineering criteria'), nl.

recommend_mechanical_engineering(Skill, FutureCareer, AcademicBackground, Interest) :-
    mechanical_engineering_skill(Skills),
    mechanical_engineering_future_career(FutureCareers),
    mechanical_engineering_academic_background(AcademicBackgrounds),
    mechanical_engineering_interest(Interests),
    member(Skill, Skills),
    member(FutureCareer, FutureCareers),
    member(AcademicBackground, AcademicBackgrounds),
    member(Interest, Interests),
    write('Matched Mechanical Engineering criteria'), nl.

recommend_metrology(Skill, FutureCareer, AcademicBackground, Interest) :-
    metrology_skill(Skills),
    metrology_future_career(FutureCareers),
    metrology_academic_background(AcademicBackgrounds),
    metrology_interest(Interests),
    member(Skill, Skills),
    member(FutureCareer, FutureCareers),
    member(AcademicBackground, AcademicBackgrounds),
    member(Interest, Interests),
    write('Matched Metrology criteria'), nl.

recommend_electrical_engineering(Skill, FutureCareer, AcademicBackground, Interest) :-
    electrical_engineering_skill(Skills),
    electrical_engineering_future_career(FutureCareers),
    electrical_engineering_academic_background(AcademicBackgrounds),
    electrical_engineering_interest(Interests),
    member(Skill, Skills),
    member(FutureCareer, FutureCareers),
    member(AcademicBackground, AcademicBackgrounds),
    member(Interest, Interests),
    write('Matched Electrical Engineering criteria'), nl.

% Rule to check if at least 3 criteria are met and recommend the department
recommend_department(Skill, FutureCareer, AcademicBackground, Interest, Department) :-
    (recommend_software_engineering(Skill, FutureCareer, AcademicBackground, Interest) -> Department = 'Software Engineering';
     recommend_computer_science(Skill, FutureCareer, AcademicBackground, Interest) -> Department = 'Computer Science';
     recommend_civil_engineering(Skill, FutureCareer, AcademicBackground, Interest) -> Department = 'Civil Engineering';
     recommend_mechanical_engineering(Skill, FutureCareer, AcademicBackground, Interest) -> Department = 'Mechanical Engineering';
     recommend_metrology(Skill, FutureCareer, AcademicBackground, Interest) -> Department = 'Metrology';
     recommend_electrical_engineering(Skill, FutureCareer, AcademicBackground, Interest) -> Department = 'Electrical Engineering').

