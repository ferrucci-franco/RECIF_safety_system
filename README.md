# Safety system of RECIF project

The RECIF project was launched in 2018 with the objective of studying and implementing the coupling of a hydrogen chain (electrolyzer + storage + fuel cell) and a thermochemical unit in the tropical insular region of French Polynesia. The thermochemical unit is designed to recover waste heat from the electrolyzer and fuel cell to enable deferred cooling production for air conditioning purposes. This coupling permits an improvement in the overall efficiency of the installation.

The RECIF installation is located on the campus of French Polynesia University and it comprises a hybrid inverter, PV panels, a PEM electrolyzer for H2 production, a H2 storage tank, a PEM fuel cell for electricity production from stored H2, a Li-ion battery pack for power balance and short-term energy storage, a controllable electrical load, and a custom-made air conditioning system with a barium chloride/ammonia thermochemical unit. All these components are installed in a 20-foot container. 

This is the list of material that the reader will find in thi repository:
-  All the electrical diagrams (power and control), including the brand and model of all the components (bill of material). 
-  The  description  of  the  safety  PLC  programming  code  developed  in  Ladder  language,  accompanied  by  the corresponding PLC project file (using **ABB Pluto Manager** software). 
-  The descriptive system document for the intrinsically safe circuits (according to *IEC 60079-25*). 
-  The project file created with **SISTEMA** tool used to compute the safety system reliability. 
-  A list of all ATEX equipment, including brand, model and ATEX marking. 
-  The complete study of the evolution of the gas concentration inside the container due to a gas leak, with the corresponding Matlab/Simulink files. 

For updates, please visit the project website at <https://recherche.upf.pf/fr/projet/recif/>.
