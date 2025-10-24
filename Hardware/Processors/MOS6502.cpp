

#include "MOS6502.hpp"

/*~~~ Default Constructor ~~~*/
MOS6502::MOS6502()
{

}

/*~~~ Destructor ~~~*/
MOS6502::~MOS6502()
{

}

/*~~~ Copy Constructor ~~~*/
MOS6502::MOS6502(MOS6502 const& rhs)
{
	(void)rhs;
}

/*~~~ Assignment Overload ~~~*/
MOS6502 MOS6502::operator=(MOS6502 const& rhs)
{
	(void)rhs;
	return (*this);
}