require "./clop.cr"

optionstr= <<-END
  Description: Command line option parser sample code
  Long description:
    Test program for the class Clop (Command line option parser),
    (c) 2020, Jun Makino

    By running the file (typing "crystal clopsample.cr"), you can check whether
    it still behaves correctly.  Maximum help is provided with --hellp
    ("crystal clopsample.cr -- --help").
 

  Short name: -s
  Long name:		--softening_length
  Default value: 	0.0
  Variable name: 	eps             
  Description:		Softening length for Plummer softening, where rs2=r**2+eps**2 is used in place of r**2.
  Long description:                        
      This option sets the softening length used to calculate the force
      between two particles.  The calculation scheme comforms to standard

  Short name: 		-n
  Long name:		--number_of_particles
  Value type:		int
  Default value:	none
  Variable name:	n_particles
  Print name:		N
  Description:		Number of particles
  Long description:
    Number of particles in an N-body snapshot.

  Short name:		-x
  Long name:  		--extra_diagnostics
  Value type:  		bool
  Variable name:	xdiag
  Description:		Extra diagnostics
  Long description:
    The following extra diagnostics will be printed:

      acceleration (for all integrators)
      jerk (for the Hermite integrator)


  Short name:		-v
  Long name:		--shift_velocity
  Value type:		float vector         
  Default value:	3,4,5
  Variable name:	vcom
  Description:		Shifts center of mass velocity
  Long description:
    The center of mass of the N-body system will be shifted by this amount.
    If the vector has fewer components than the dimensionality of the N-body
    system, zeroes will be added to the vector.
    If the vector has more components than the dimensionality of the N-body
    system, the extra components will be disgarded.

  Short name:		-o
  Long name:		--output_file_name
  Value type:		string
  Variable name:	output_file_name
  Print name:	 	         
  Description:		Name of the outputfile
  Long description:
    Name of the snapshot output file.
    The snapshot contains the mass, position, and velocity values
    for all particles in an N-body system.
END

clop_init(__LINE__, __FILE__, __DIR__, "optionstr")
# {{system("head  -#{__LINE__ -1} #{__FILE__}>  #{__DIR__}/.tmp.cr")}}
#data = YAML.parse(add_option_tag(optionstr))
                  
options=CLOP.new(optionstr,ARGV)
pp! options

a= options.eps
pp! a.class
pp! a

