# clop-crystal

A CLI genrator for Crystal

## Installation

You need to place clop.cr in your Crystal's require search path.

## Getting started

Download clopsample.cr and

    crystal clopsample.cr  -- -h

should show the auto-generated help message for clopsample.cr.
To use clop.cr, first define some string variable which contains
the description in YAML-like (slightly enhanced) format. If the name
of the valiable is "optionstr", add the following two lines:

    clop_init(__LINE__, __FILE__, __DIR__, "optionstr")
    options=CLOP.new(optionstr,ARGV)

after optionstr is defined. the CLOP class is automatically generated
and initialized to contain the option parameters described in the text.

    crystal clopsample.cr  -- -n 10

should show

    options # => #<CLOP:0x7f86626a9680
     @eps=0.0,
     @n_particles=10,
     @output_file_name="",
     @vcom=[3.0, 4.0, 5.0],
     @xdiag=false>
    a.class # => Float64
    a # => 0.0

We can see that eps, n_particles, and other member varialbles have
types specified in the option description text and have values either
default or given in command line parameters. Since they have proper
types, type inference works for  assignments like the following, 

    a= options.eps

and a has the type Float64 (determined at the compile time).

## Structure of the option description text

A minimal example would be:

    Description: Command line option parser sample code
    Long description:
      Test program for the class Clop (Command line option parser),
      (c) 2020, Jun Makino

      By running the file (typing "crystal clopsample.cr"), you can check whether
      it still behaves correctly.  Maximum help is provided with --hellp
      ("crystal clopsample.cr -- --help").
 

    Short name: -s
    Long name:		--softening_length
    Value type:		float
    Default value: 	0.0
    Variable name: 	eps             
    Description:		Softening lengt
        Plummer softening, where rs2=r**2+eps**2 is used in place of r**2.
    Long description:                        
        This option sets the softening length used to calculate the force
        between two particles.  The calculation scheme comforms to standard

The text should contain Description and Long Desctipion tags as the
fitst two entries in usual YAML format. After that,  blocks
with Short name, Long name ... can appear multiple times.

Short name: short option. actually can be of whatever length.

Long name: long option. actually can be of whatever length.

Value type: At present, int, float, float vector (actuallt float
            array), bool, and string are supprted and relognized

Default value: if "none" is give, this option becomes a required one

Variable name: the name of instance variable within class CLOP.

## Limitation

* Short option with value without whitespace (such as -n10) is not
  supported.
* No way to use same option multiple times (such as -s 1 -s 2 ...).
  You can use string  as -s 1,2 and then decode it.
* Descriptions should not contain the text like "A: B", since it is
  interpret as YAML tag-data pair. "A:B" is okay.

## To do

* give some human-readable error message for problems of option definition text
  
