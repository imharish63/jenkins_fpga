# set up jenkins platform
This project is to test the Jenkins platform to we have set up using the instructions from https://vhdlwhiz.com/jenkins-for-fpga/

# scripts for fpga projects
I have created some based basic scripts of tcl, vhdl source file and xdc file.

# execution
A pipeline script Jenkinsfile is created. Upon invovking the build the Jenkins after the project is setup, jenkins access this repo and looks for the Jenkinsfile.
Finally it executes the project and generate the bitstream, which is accesible from the jenkins platform.
In case of build failure , It automatically notifies the user of wrong commit along with the log.
