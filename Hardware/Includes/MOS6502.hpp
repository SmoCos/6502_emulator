
#pragma once

#include <cstdint>





class MOS6502
{
	public:
		MOS6502();
		~MOS6502();
		MOS6502(MOS6502 const& rhs);
		MOS6502 operator=(MOS6502 const& rhs);

	private:

	// Array of 40 for each pin

		// Register Accumulator, Register X, Register Y, Register Stack Pointer [Be aware of the offset]
		uint8_t		_registerA, _registerX, _registerY, _registerSP;
		
		// Processor status flags Negative - Overflow - *unused* - Break - Decimal - Interrupt Disable - Zero - Carry
		uint8_t		_registerP;
		
		// Register ProgramCounter,
		uint16_t	_registerPC;

	// Memory - Should it be here or external since there is no built in memory...

};