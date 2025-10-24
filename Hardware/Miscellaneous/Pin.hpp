

#pragma once

#include <cstdint>


// enum e_PinType
// {
// 	VPB = 1,											// Vector Pull
// 	RDY,												// Ready
// 	PHI1O,												// Phase 1 Out Clock
// 	IRQB,												// Interrupt Request
// 	MLB, 												// Memory Lock
// 	SYNC,												// Synchronize
// 	VDD,												// Positive Power Supply
// 	A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11,	// Address Bus
// 	VSS,												// Internal Logic Ground
// 	A12, A13, A14, A15,									// Address Bus
// 	D7, D6, D5, D4, D3, D2, D1, D0,						// Data Bus
// 	RWB,												// Read/Write
// 	NC,													// No Connection
// 	BE,													// Bus Enable
// 	PHI2,												// Phase 2 In clock
// 	SOB,												// Set Overflow
// 	PHI2O,												// Phase 2 Out Clock
// 	RESB												// Reset
// };


enum class e_PinDirection
{
	INPUT,
	OUTPUT,
	BIDIRECTIONAL,
	OPENDRAIN,
	HIGHIMPEDANCE
};

enum class e_PinType
{
	DIGITAL,
	ANALOG,
	POWER,
	GROUND,
	CLOCK,
	SPECIAL
};


class Pin
{
	public:
		Pin(/* args */);
		~Pin();
	
	
	private:
		int8_t	_Vmax;
		
		int8_t	_HzMax;

};


