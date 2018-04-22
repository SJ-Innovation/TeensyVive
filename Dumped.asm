
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 11 0a 00 00 c9 09 00 00     ... ............
      10:	c9 09 00 00 c9 09 00 00 c9 09 00 00 c9 09 00 00     ................
      20:	c9 09 00 00 c9 09 00 00 c9 09 00 00 11 0a 00 00     ................
      30:	11 0a 00 00 c9 09 00 00 5d 21 00 00 99 23 00 00     ........]!...#..
      40:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      50:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      60:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      70:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      80:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      90:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      a0:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      b0:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      c0:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      d0:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      e0:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
      f0:	11 0a 00 00 b5 24 00 00 11 0a 00 00 e1 25 00 00     .....$.......%..
     100:	11 0a 00 00 0d 27 00 00 11 0a 00 00 11 0a 00 00     .....'..........
     110:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     120:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     130:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     140:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     150:	11 0a 00 00 0d 05 00 00 49 05 00 00 11 0a 00 00     ........I.......
     160:	11 0a 00 00 79 10 00 00 11 0a 00 00 11 0a 00 00     ....y...........
     170:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     180:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     190:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     1a0:	11 0a 00 00 11 0a 00 00 11 0a 00 00 11 0a 00 00     ................
     1b0:	11 0a 00 00 11 0a 00 00 11 0a 00 00                 ............

000001bc <ResetHandler>:
	volatile int n;
#endif
	//volatile int count;

#ifdef KINETISK
	WDOG_UNLOCK = WDOG_UNLOCK_SEQ1;
     1bc:	4b56      	ldr	r3, [pc, #344]	; (318 <ResetHandler+0x15c>)
     1be:	f24c 5220 	movw	r2, #50464	; 0xc520
{
     1c2:	b510      	push	{r4, lr}
	WDOG_UNLOCK = WDOG_UNLOCK_SEQ1;
     1c4:	801a      	strh	r2, [r3, #0]
	WDOG_UNLOCK = WDOG_UNLOCK_SEQ2;
     1c6:	f64d 1228 	movw	r2, #55592	; 0xd928
     1ca:	801a      	strh	r2, [r3, #0]
	__asm__ volatile ("nop");
     1cc:	bf00      	nop
	__asm__ volatile ("nop");
     1ce:	bf00      	nop
#endif
	// programs using the watchdog timer or needing to initialize hardware as
	// early as possible can implement startup_early_hook()
	startup_early_hook();
     1d0:	f000 fc22 	bl	a18 <startup_early_hook>
	// enable clocks to always-used peripherals
#if defined(__MK20DX128__)
	SIM_SCGC5 = 0x00043F82;		// clocks active to all GPIO
	SIM_SCGC6 = SIM_SCGC6_RTC | SIM_SCGC6_FTM0 | SIM_SCGC6_FTM1 | SIM_SCGC6_ADC0 | SIM_SCGC6_FTFL;
#elif defined(__MK20DX256__)
	SIM_SCGC3 = SIM_SCGC3_ADC1 | SIM_SCGC3_FTM2;
     1d4:	4b51      	ldr	r3, [pc, #324]	; (31c <ResetHandler+0x160>)
     1d6:	f04f 6210 	mov.w	r2, #150994944	; 0x9000000
     1da:	601a      	str	r2, [r3, #0]
	SIM_SCGC5 = 0x00043F82;		// clocks active to all GPIO
     1dc:	4a50      	ldr	r2, [pc, #320]	; (320 <ResetHandler+0x164>)
     1de:	609a      	str	r2, [r3, #8]
	SIM_SCGC6 = SIM_SCGC6_RTC | SIM_SCGC6_FTM0 | SIM_SCGC6_FTM1 | SIM_SCGC6_ADC0 | SIM_SCGC6_FTFL;
     1e0:	4a50      	ldr	r2, [pc, #320]	; (324 <ResetHandler+0x168>)
     1e2:	60da      	str	r2, [r3, #12]
	UART0_C2 = UART_C2_TE;
	PORTB_PCR17 = PORT_PCR_MUX(3);
#endif
#ifdef KINETISK
	// if the RTC oscillator isn't enabled, get it started early
	if (!(RTC_CR & RTC_CR_OSCE)) {
     1e4:	4a50      	ldr	r2, [pc, #320]	; (328 <ResetHandler+0x16c>)
     1e6:	6813      	ldr	r3, [r2, #0]
     1e8:	f413 7380 	ands.w	r3, r3, #256	; 0x100
     1ec:	d104      	bne.n	1f8 <ResetHandler+0x3c>
		RTC_SR = 0;
     1ee:	494f      	ldr	r1, [pc, #316]	; (32c <ResetHandler+0x170>)
     1f0:	600b      	str	r3, [r1, #0]
		RTC_CR = RTC_CR_SC16P | RTC_CR_SC4P | RTC_CR_OSCE;
     1f2:	f44f 53a8 	mov.w	r3, #5376	; 0x1500
     1f6:	6013      	str	r3, [r2, #0]
	}
#endif
	// release I/O pins hold, if we woke up from VLLS mode
	if (PMC_REGSC & PMC_REGSC_ACKISO) PMC_REGSC |= PMC_REGSC_ACKISO;
     1f8:	4b4d      	ldr	r3, [pc, #308]	; (330 <ResetHandler+0x174>)
     1fa:	781a      	ldrb	r2, [r3, #0]
     1fc:	0711      	lsls	r1, r2, #28
     1fe:	d503      	bpl.n	208 <ResetHandler+0x4c>
     200:	781a      	ldrb	r2, [r3, #0]
     202:	f042 0208 	orr.w	r2, r2, #8
     206:	701a      	strb	r2, [r3, #0]
    // since this is a write once register, make it visible to all F_CPU's
    // so we can into other sleep modes in the future at any speed
#if defined(__MK66FX1M0__)
	SMC_PMPROT = SMC_PMPROT_AHSRUN | SMC_PMPROT_AVLP | SMC_PMPROT_ALLS | SMC_PMPROT_AVLLS;
#else
	SMC_PMPROT = SMC_PMPROT_AVLP | SMC_PMPROT_ALLS | SMC_PMPROT_AVLLS;
     208:	4b4a      	ldr	r3, [pc, #296]	; (334 <ResetHandler+0x178>)
#endif
    
	// TODO: do this while the PLL is waiting to lock....
	while (dest < &_edata) *dest++ = *src++;
     20a:	494b      	ldr	r1, [pc, #300]	; (338 <ResetHandler+0x17c>)
	SMC_PMPROT = SMC_PMPROT_AVLP | SMC_PMPROT_ALLS | SMC_PMPROT_AVLLS;
     20c:	222a      	movs	r2, #42	; 0x2a
     20e:	701a      	strb	r2, [r3, #0]
     210:	4a4a      	ldr	r2, [pc, #296]	; (33c <ResetHandler+0x180>)
     212:	4b4b      	ldr	r3, [pc, #300]	; (340 <ResetHandler+0x184>)
	while (dest < &_edata) *dest++ = *src++;
     214:	428b      	cmp	r3, r1
     216:	d204      	bcs.n	222 <ResetHandler+0x66>
     218:	f852 0f04 	ldr.w	r0, [r2, #4]!
     21c:	f843 0b04 	str.w	r0, [r3], #4
     220:	e7f8      	b.n	214 <ResetHandler+0x58>
     222:	4b48      	ldr	r3, [pc, #288]	; (344 <ResetHandler+0x188>)
	dest = &_sbss;
	while (dest < &_ebss) *dest++ = 0;
     224:	4948      	ldr	r1, [pc, #288]	; (348 <ResetHandler+0x18c>)
     226:	2200      	movs	r2, #0
     228:	428b      	cmp	r3, r1
     22a:	d202      	bcs.n	232 <ResetHandler+0x76>
     22c:	f843 2b04 	str.w	r2, [r3], #4
     230:	e7fa      	b.n	228 <ResetHandler+0x6c>

	// default all interrupts to medium priority level
	for (i=0; i < NVIC_NUM_INTERRUPTS + 16; i++) _VectorsRam[i] = _VectorsFlash[i];
     232:	4946      	ldr	r1, [pc, #280]	; (34c <ResetHandler+0x190>)
     234:	4a46      	ldr	r2, [pc, #280]	; (350 <ResetHandler+0x194>)
     236:	2300      	movs	r3, #0
     238:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
     23c:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
     240:	3301      	adds	r3, #1
     242:	2b6f      	cmp	r3, #111	; 0x6f
     244:	d1f8      	bne.n	238 <ResetHandler+0x7c>
     246:	4b43      	ldr	r3, [pc, #268]	; (354 <ResetHandler+0x198>)
	for (i=0; i < NVIC_NUM_INTERRUPTS; i++) NVIC_SET_PRIORITY(i, 128);
     248:	4a43      	ldr	r2, [pc, #268]	; (358 <ResetHandler+0x19c>)
     24a:	2180      	movs	r1, #128	; 0x80
     24c:	f803 1b01 	strb.w	r1, [r3], #1
     250:	4293      	cmp	r3, r2
     252:	d1fb      	bne.n	24c <ResetHandler+0x90>
	SCB_VTOR = (uint32_t)_VectorsRam;	// use vector table in RAM
     254:	4b41      	ldr	r3, [pc, #260]	; (35c <ResetHandler+0x1a0>)
     256:	4a3d      	ldr	r2, [pc, #244]	; (34c <ResetHandler+0x190>)
     258:	601a      	str	r2, [r3, #0]
	//  C6[PLLS] bit is written to 0
	//  C2[LP] bit is written to 1
#else
    #if defined(KINETISK)
    // enable capacitors for crystal
    OSC0_CR = OSC_SC8P | OSC_SC2P | OSC_ERCLKEN;
     25a:	4b41      	ldr	r3, [pc, #260]	; (360 <ResetHandler+0x1a4>)
     25c:	228a      	movs	r2, #138	; 0x8a
     25e:	701a      	strb	r2, [r3, #0]
    #elif defined(KINETISL)
    // enable capacitors for crystal
    OSC0_CR = OSC_SC8P | OSC_SC2P | OSC_ERCLKEN;
    #endif
	// enable osc, 8-32 MHz range, low power mode
	MCG_C2 = MCG_C2_RANGE0(2) | MCG_C2_EREFS;
     260:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
     264:	2224      	movs	r2, #36	; 0x24
     266:	705a      	strb	r2, [r3, #1]
	// switch to crystal as clock source, FLL input = 16 MHz / 512
	MCG_C1 =  MCG_C1_CLKS(2) | MCG_C1_FRDIV(4);
     268:	22a0      	movs	r2, #160	; 0xa0
     26a:	701a      	strb	r2, [r3, #0]
	// wait for crystal oscillator to begin
	while ((MCG_S & MCG_S_OSCINIT0) == 0) ;
     26c:	799a      	ldrb	r2, [r3, #6]
     26e:	0792      	lsls	r2, r2, #30
     270:	d5fc      	bpl.n	26c <ResetHandler+0xb0>
	// wait for FLL to use oscillator
	while ((MCG_S & MCG_S_IREFST) != 0) ;
     272:	799a      	ldrb	r2, [r3, #6]
     274:	06d4      	lsls	r4, r2, #27
     276:	d4fc      	bmi.n	272 <ResetHandler+0xb6>
	// wait for MCGOUT to use oscillator
	while ((MCG_S & MCG_S_CLKST_MASK) != MCG_S_CLKST(2)) ;
     278:	4a3a      	ldr	r2, [pc, #232]	; (364 <ResetHandler+0x1a8>)
     27a:	7993      	ldrb	r3, [r2, #6]
     27c:	f003 030c 	and.w	r3, r3, #12
     280:	2b08      	cmp	r3, #8
     282:	4b38      	ldr	r3, [pc, #224]	; (364 <ResetHandler+0x1a8>)
     284:	d1f9      	bne.n	27a <ResetHandler+0xbe>
    #endif
   #else
    #if F_CPU == 72000000
	MCG_C5 = MCG_C5_PRDIV0(5);		 // config PLL input for 16 MHz Crystal / 6 = 2.667 Hz
    #else
	MCG_C5 = MCG_C5_PRDIV0(3);		 // config PLL input for 16 MHz Crystal / 4 = 4 MHz
     286:	2203      	movs	r2, #3
     288:	711a      	strb	r2, [r3, #4]
    #if F_CPU == 168000000
	MCG_C6 = MCG_C6_PLLS | MCG_C6_VDIV0(18); // config PLL for 168 MHz output
    #elif F_CPU == 144000000
	MCG_C6 = MCG_C6_PLLS | MCG_C6_VDIV0(12); // config PLL for 144 MHz output
    #elif F_CPU == 120000000
	MCG_C6 = MCG_C6_PLLS | MCG_C6_VDIV0(6); // config PLL for 120 MHz output
     28a:	2246      	movs	r2, #70	; 0x46
     28c:	715a      	strb	r2, [r3, #5]
    #error "This clock speed isn't supported..."
    #endif
   #endif

	// wait for PLL to start using xtal as its input
	while (!(MCG_S & MCG_S_PLLST)) ;
     28e:	799a      	ldrb	r2, [r3, #6]
     290:	0690      	lsls	r0, r2, #26
     292:	d5fc      	bpl.n	28e <ResetHandler+0xd2>
	// wait for PLL to lock
	while (!(MCG_S & MCG_S_LOCK0)) ;
     294:	4a33      	ldr	r2, [pc, #204]	; (364 <ResetHandler+0x1a8>)
     296:	7991      	ldrb	r1, [r2, #6]
     298:	4b32      	ldr	r3, [pc, #200]	; (364 <ResetHandler+0x1a8>)
     29a:	0649      	lsls	r1, r1, #25
     29c:	d5fb      	bpl.n	296 <ResetHandler+0xda>
	#endif
	SIM_CLKDIV2 = SIM_CLKDIV2_USBDIV(2);
#elif F_CPU == 120000000
	// config divisors: 120 MHz core, 60 MHz bus, 24 MHz flash, USB = 128 * 2 / 5
	#if F_BUS == 60000000
	SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) | SIM_CLKDIV1_OUTDIV4(4);
     29e:	4a32      	ldr	r2, [pc, #200]	; (368 <ResetHandler+0x1ac>)
     2a0:	f04f 7182 	mov.w	r1, #17039360	; 0x1040000
     2a4:	6011      	str	r1, [r2, #0]
	#elif F_BUS == 120000000
	SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(0) | SIM_CLKDIV1_OUTDIV4(4);
	#else
	#error "This F_CPU & F_BUS combination is not supported"
	#endif
	SIM_CLKDIV2 = SIM_CLKDIV2_USBDIV(4) | SIM_CLKDIV2_USBFRAC;
     2a6:	2109      	movs	r1, #9
     2a8:	6051      	str	r1, [r2, #4]
#error "Error, F_CPU must be 192, 180, 168, 144, 120, 96, 72, 48, 24, 16, 8, 4, or 2 MHz"
#endif

#if F_CPU > 16000000
	// switch to PLL as clock source, FLL input = 16 MHz / 512
	MCG_C1 = MCG_C1_CLKS(0) | MCG_C1_FRDIV(4);
     2aa:	2220      	movs	r2, #32
     2ac:	701a      	strb	r2, [r3, #0]
	// wait for PLL clock to be used
	while ((MCG_S & MCG_S_CLKST_MASK) != MCG_S_CLKST(3)) ;
     2ae:	799a      	ldrb	r2, [r3, #6]
     2b0:	f002 020c 	and.w	r2, r2, #12
     2b4:	2a0c      	cmp	r2, #12
     2b6:	d1fa      	bne.n	2ae <ResetHandler+0xf2>
	// USB uses PLL clock, trace is CPU clock, CLKOUT=OSCERCLK0
	#if defined(KINETISK)
	#if F_CPU == 216000000 || F_CPU == 180000000
	SIM_SOPT2 = SIM_SOPT2_USBSRC | SIM_SOPT2_IRC48SEL | SIM_SOPT2_TRACECLKSEL | SIM_SOPT2_CLKOUTSEL(6);
	#else
	SIM_SOPT2 = SIM_SOPT2_USBSRC | SIM_SOPT2_PLLFLLSEL | SIM_SOPT2_TRACECLKSEL | SIM_SOPT2_CLKOUTSEL(6);
     2b8:	4b2c      	ldr	r3, [pc, #176]	; (36c <ResetHandler+0x1b0>)
     2ba:	4a2d      	ldr	r2, [pc, #180]	; (370 <ResetHandler+0x1b4>)
     2bc:	601a      	str	r2, [r3, #0]
    // since we are not going into "stop mode" i removed it
	SMC_PMCTRL = SMC_PMCTRL_RUNM(2); // VLPR mode :-)
#endif

	// initialize the SysTick counter
	SYST_RVR = (F_CPU / 1000) - 1;
     2be:	4b2d      	ldr	r3, [pc, #180]	; (374 <ResetHandler+0x1b8>)
     2c0:	4a2d      	ldr	r2, [pc, #180]	; (378 <ResetHandler+0x1bc>)
     2c2:	601a      	str	r2, [r3, #0]
	SYST_CVR = 0;
     2c4:	2200      	movs	r2, #0
     2c6:	605a      	str	r2, [r3, #4]
	SYST_CSR = SYST_CSR_CLKSOURCE | SYST_CSR_TICKINT | SYST_CSR_ENABLE;
     2c8:	2207      	movs	r2, #7
     2ca:	f843 2c04 	str.w	r2, [r3, #-4]
	SCB_SHPR3 = 0x20200000;  // Systick = priority 32
     2ce:	4a2b      	ldr	r2, [pc, #172]	; (37c <ResetHandler+0x1c0>)
     2d0:	f8c3 2d0c 	str.w	r2, [r3, #3340]	; 0xd0c

	//init_pins();
	__enable_irq();
     2d4:	b662      	cpsie	i

	_init_Teensyduino_internal_();
     2d6:	f000 fc77 	bl	bc8 <_init_Teensyduino_internal_>

#if defined(KINETISK)
	// RTC initialization
	if (RTC_SR & RTC_SR_TIF) {
     2da:	4b14      	ldr	r3, [pc, #80]	; (32c <ResetHandler+0x170>)
     2dc:	681b      	ldr	r3, [r3, #0]
     2de:	07da      	lsls	r2, r3, #31
     2e0:	d505      	bpl.n	2ee <ResetHandler+0x132>
		// compiled-in time will be stale.  Write a special
		// flag into the VBAT register file indicating the
		// RTC is set with known-stale time and should be
		// updated when fresh time is known.
		#if ARDUINO >= 10600
		rtc_set((uint32_t)&__rtc_localtime);
     2e2:	4827      	ldr	r0, [pc, #156]	; (380 <ResetHandler+0x1c4>)
     2e4:	f000 fc5e 	bl	ba4 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0x5A94C3A5;
     2e8:	4b26      	ldr	r3, [pc, #152]	; (384 <ResetHandler+0x1c8>)
     2ea:	4a27      	ldr	r2, [pc, #156]	; (388 <ResetHandler+0x1cc>)
     2ec:	601a      	str	r2, [r3, #0]
	}
	if ((RCM_SRS0 & RCM_SRS0_PIN) && (*(uint32_t *)0x4003E01C == 0x5A94C3A5)) {
     2ee:	4b27      	ldr	r3, [pc, #156]	; (38c <ResetHandler+0x1d0>)
     2f0:	781b      	ldrb	r3, [r3, #0]
     2f2:	065b      	lsls	r3, r3, #25
     2f4:	d509      	bpl.n	30a <ResetHandler+0x14e>
     2f6:	4c23      	ldr	r4, [pc, #140]	; (384 <ResetHandler+0x1c8>)
     2f8:	4b23      	ldr	r3, [pc, #140]	; (388 <ResetHandler+0x1cc>)
     2fa:	6822      	ldr	r2, [r4, #0]
     2fc:	429a      	cmp	r2, r3
     2fe:	d104      	bne.n	30a <ResetHandler+0x14e>
		// Our compiled-in time will be very fresh, so set
		// the RTC with this, and clear the VBAT resister file
		// data so we don't mess with the time after it's been
		// set well.
		#if ARDUINO >= 10600
		rtc_set((uint32_t)&__rtc_localtime);
     300:	481f      	ldr	r0, [pc, #124]	; (380 <ResetHandler+0x1c4>)
     302:	f000 fc4f 	bl	ba4 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f002 fd6b 	bl	2de4 <__libc_init_array>

	startup_late_hook();
     30e:	f000 fb89 	bl	a24 <startup_late_hook>
	main();
     312:	f000 fa25 	bl	760 <main>
     316:	e7fe      	b.n	316 <ResetHandler+0x15a>
     318:	4005200e 	.word	0x4005200e
     31c:	40048030 	.word	0x40048030
     320:	00043f82 	.word	0x00043f82
     324:	2b000001 	.word	0x2b000001
     328:	4003d010 	.word	0x4003d010
     32c:	4003d014 	.word	0x4003d014
     330:	4007d002 	.word	0x4007d002
     334:	4007e000 	.word	0x4007e000
     338:	1fff91f4 	.word	0x1fff91f4
     33c:	0000392c 	.word	0x0000392c
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91f4 	.word	0x1fff91f4
     348:	1fff9620 	.word	0x1fff9620
     34c:	1fff8200 	.word	0x1fff8200
     350:	00000000 	.word	0x00000000
     354:	e000e400 	.word	0xe000e400
     358:	e000e45f 	.word	0xe000e45f
     35c:	e000ed08 	.word	0xe000ed08
     360:	40065000 	.word	0x40065000
     364:	40064000 	.word	0x40064000
     368:	40048044 	.word	0x40048044
     36c:	40048004 	.word	0x40048004
     370:	000510c0 	.word	0x000510c0
     374:	e000e014 	.word	0xe000e014
     378:	0001d4bf 	.word	0x0001d4bf
     37c:	20200000 	.word	0x20200000
     380:	5ab7eb85 	.word	0x5ab7eb85
     384:	4003e01c 	.word	0x4003e01c
     388:	5a94c3a5 	.word	0x5a94c3a5
     38c:	4007f000 	.word	0x4007f000
     390:	ffffffff 	.word	0xffffffff
     394:	ffffffff 	.word	0xffffffff
     398:	ffffffff 	.word	0xffffffff
     39c:	ffffffff 	.word	0xffffffff
     3a0:	ffffffff 	.word	0xffffffff
     3a4:	ffffffff 	.word	0xffffffff
     3a8:	ffffffff 	.word	0xffffffff
     3ac:	ffffffff 	.word	0xffffffff
     3b0:	ffffffff 	.word	0xffffffff
     3b4:	ffffffff 	.word	0xffffffff
     3b8:	ffffffff 	.word	0xffffffff
     3bc:	ffffffff 	.word	0xffffffff
     3c0:	ffffffff 	.word	0xffffffff
     3c4:	ffffffff 	.word	0xffffffff
     3c8:	ffffffff 	.word	0xffffffff
     3cc:	ffffffff 	.word	0xffffffff
     3d0:	ffffffff 	.word	0xffffffff
     3d4:	ffffffff 	.word	0xffffffff
     3d8:	ffffffff 	.word	0xffffffff
     3dc:	ffffffff 	.word	0xffffffff
     3e0:	ffffffff 	.word	0xffffffff
     3e4:	ffffffff 	.word	0xffffffff
     3e8:	ffffffff 	.word	0xffffffff
     3ec:	ffffffff 	.word	0xffffffff
     3f0:	ffffffff 	.word	0xffffffff
     3f4:	ffffffff 	.word	0xffffffff
     3f8:	ffffffff 	.word	0xffffffff
     3fc:	ffffffff 	.word	0xffffffff

00000400 <flashconfigbytes>:
     400:	ffffffff ffffffff ffffffff fffff9de     ................

00000410 <__do_global_dtors_aux>:
     410:	b510      	push	{r4, lr}
     412:	4c05      	ldr	r4, [pc, #20]	; (428 <__do_global_dtors_aux+0x18>)
     414:	7823      	ldrb	r3, [r4, #0]
     416:	b933      	cbnz	r3, 426 <__do_global_dtors_aux+0x16>
     418:	4b04      	ldr	r3, [pc, #16]	; (42c <__do_global_dtors_aux+0x1c>)
     41a:	b113      	cbz	r3, 422 <__do_global_dtors_aux+0x12>
     41c:	4804      	ldr	r0, [pc, #16]	; (430 <__do_global_dtors_aux+0x20>)
     41e:	f3af 8000 	nop.w
     422:	2301      	movs	r3, #1
     424:	7023      	strb	r3, [r4, #0]
     426:	bd10      	pop	{r4, pc}
     428:	1fff91f4 	.word	0x1fff91f4
     42c:	00000000 	.word	0x00000000
     430:	00003928 	.word	0x00003928

00000434 <frame_dummy>:
     434:	4b08      	ldr	r3, [pc, #32]	; (458 <frame_dummy+0x24>)
     436:	b510      	push	{r4, lr}
     438:	b11b      	cbz	r3, 442 <frame_dummy+0xe>
     43a:	4908      	ldr	r1, [pc, #32]	; (45c <frame_dummy+0x28>)
     43c:	4808      	ldr	r0, [pc, #32]	; (460 <frame_dummy+0x2c>)
     43e:	f3af 8000 	nop.w
     442:	4808      	ldr	r0, [pc, #32]	; (464 <frame_dummy+0x30>)
     444:	6803      	ldr	r3, [r0, #0]
     446:	b903      	cbnz	r3, 44a <frame_dummy+0x16>
     448:	bd10      	pop	{r4, pc}
     44a:	4b07      	ldr	r3, [pc, #28]	; (468 <frame_dummy+0x34>)
     44c:	2b00      	cmp	r3, #0
     44e:	d0fb      	beq.n	448 <frame_dummy+0x14>
     450:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     454:	4718      	bx	r3
     456:	bf00      	nop
     458:	00000000 	.word	0x00000000
     45c:	1fff91f8 	.word	0x1fff91f8
     460:	00003928 	.word	0x00003928
     464:	1fff91f4 	.word	0x1fff91f4
     468:	00000000 	.word	0x00000000

0000046c <SensorNode::SensorNode(SensorPinData_t)>:
        }
        CurrentLEDState = LEDState;
    }
}

SensorNode::SensorNode(SensorPinData_t PinData) {
     46c:	b430      	push	{r4, r5}
     46e:	b084      	sub	sp, #16
     470:	ac01      	add	r4, sp, #4
     472:	e884 000e 	stmia.w	r4, {r1, r2, r3}
     476:	4605      	mov	r5, r0
    _PinData = PinData;
     478:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
     47c:	f105 02cc 	add.w	r2, r5, #204	; 0xcc
     480:	e882 000b 	stmia.w	r2, {r0, r1, r3}

}
     484:	4628      	mov	r0, r5
     486:	b004      	add	sp, #16
     488:	bc30      	pop	{r4, r5}
     48a:	4770      	bx	lr

0000048c <SensorNode::Init()>:


void SensorNode::Init() {
     48c:	b538      	push	{r3, r4, r5, lr}
     48e:	4604      	mov	r4, r0
	size_t print(char c)				{ return write((uint8_t)c); }
	size_t print(const char s[])			{ return write(s); }
	size_t print(const __FlashStringHelper *f)	{ return write((const char *)f); }

	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
	size_t print(int n)				{ return print((long)n); }
     490:	4d18      	ldr	r5, [pc, #96]	; (4f4 <SensorNode::Init()+0x68>)
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     492:	4819      	ldr	r0, [pc, #100]	; (4f8 <SensorNode::Init()+0x6c>)
     494:	210e      	movs	r1, #14
     496:	f001 fc77 	bl	1d88 <usb_serial_write>
     49a:	f8d4 10cc 	ldr.w	r1, [r4, #204]	; 0xcc
     49e:	4628      	mov	r0, r5
     4a0:	f000 f9f6 	bl	890 <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
     4a4:	f894 00cc 	ldrb.w	r0, [r4, #204]	; 0xcc
     4a8:	2100      	movs	r1, #0
     4aa:	f000 fc81 	bl	db0 <pinMode>
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
     4ae:	f894 00d0 	ldrb.w	r0, [r4, #208]	; 0xd0
     4b2:	2100      	movs	r1, #0
     4b4:	f000 fc7c 	bl	db0 <pinMode>
    pinMode(_PinData.LED2Pin, INPUT);
     4b8:	f894 00d4 	ldrb.w	r0, [r4, #212]	; 0xd4
     4bc:	2100      	movs	r1, #0
     4be:	f000 fc77 	bl	db0 <pinMode>
    Angles[STATION_A][HORZ] = 0;
     4c2:	2300      	movs	r3, #0
     4c4:	f8c4 30b0 	str.w	r3, [r4, #176]	; 0xb0
    Angles[STATION_A][VERT] = 0;
     4c8:	f8c4 30b4 	str.w	r3, [r4, #180]	; 0xb4
    Angles[STATION_B][HORZ] = 0;
     4cc:	f8c4 30b8 	str.w	r3, [r4, #184]	; 0xb8
    Angles[STATION_B][VERT] = 0;
     4d0:	f8c4 30bc 	str.w	r3, [r4, #188]	; 0xbc
    Location[X_AXIS] = 0;
     4d4:	f8c4 30c0 	str.w	r3, [r4, #192]	; 0xc0
    Location[Y_AXIS] = 0;
     4d8:	f8c4 30c4 	str.w	r3, [r4, #196]	; 0xc4
    Location[Z_AXIS] = 0;
     4dc:	f8c4 30c8 	str.w	r3, [r4, #200]	; 0xc8
     4e0:	2109      	movs	r1, #9
     4e2:	4806      	ldr	r0, [pc, #24]	; (4fc <SensorNode::Init()+0x70>)
     4e4:	f001 fc50 	bl	1d88 <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
	size_t print(const Printable &obj)		{ return obj.printTo(*this); }
	size_t println(void);
	size_t println(const String &s)			{ return print(s) + println(); }
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
     4e8:	4628      	mov	r0, r5

    Serial.println(" Complete");
}
     4ea:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     4ee:	f000 ba49 	b.w	984 <Print::println()>
     4f2:	bf00      	nop
     4f4:	1fff88f8 	.word	0x1fff88f8
     4f8:	00003738 	.word	0x00003738
     4fc:	00003748 	.word	0x00003748

00000500 <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     500:	4770      	bx	lr
     502:	bf00      	nop

00000504 <SensorNode::GetPulsePin()>:

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}
     504:	f890 00cc 	ldrb.w	r0, [r0, #204]	; 0xcc
     508:	4770      	bx	lr
     50a:	bf00      	nop

0000050c <pit1_isr>:
void PLLSyncB() {
    LastPLLTriggers[STATION_B] = CURRENT_TIME;
}


void pit1_isr() { // Pit1 on sync A
     50c:	b470      	push	{r4, r5, r6}
    PIT_TFLG1 = PIT_TFLG_TIF; // Clear interrupt flag
    PIT_TCTRL2 = 0; // Disable PIT2
     50e:	4b09      	ldr	r3, [pc, #36]	; (534 <pit1_isr+0x28>)
    PIT_TFLG1 = PIT_TFLG_TIF; // Clear interrupt flag
     510:	4e09      	ldr	r6, [pc, #36]	; (538 <pit1_isr+0x2c>)
    PIT_TFLG2 = PIT_TFLG_TIF; // Clear PIT2 Interrupt (so as not to immediately interrupt)
     512:	4c0a      	ldr	r4, [pc, #40]	; (53c <pit1_isr+0x30>)
    LastPLLTriggers[STATION_A] = CURRENT_TIME;
     514:	480a      	ldr	r0, [pc, #40]	; (540 <pit1_isr+0x34>)
     516:	490b      	ldr	r1, [pc, #44]	; (544 <pit1_isr+0x38>)
    PIT_TFLG1 = PIT_TFLG_TIF; // Clear interrupt flag
     518:	2201      	movs	r2, #1
    PIT_TCTRL2 = 0; // Disable PIT2
     51a:	2500      	movs	r5, #0
    PIT_TFLG1 = PIT_TFLG_TIF; // Clear interrupt flag
     51c:	6032      	str	r2, [r6, #0]
    PIT_TCTRL2 = 0; // Disable PIT2
     51e:	601d      	str	r5, [r3, #0]
    PIT_TFLG2 = PIT_TFLG_TIF; // Clear PIT2 Interrupt (so as not to immediately interrupt)
     520:	6022      	str	r2, [r4, #0]
    PIT_TCTRL2 |= PIT_TCTRL_TIE | PIT_TCTRL_TEN; // Enable for the PIT2 interrupt, and start a new cycle.
     522:	681a      	ldr	r2, [r3, #0]
     524:	f042 0203 	orr.w	r2, r2, #3
     528:	601a      	str	r2, [r3, #0]
    LastPLLTriggers[STATION_A] = CURRENT_TIME;
     52a:	6803      	ldr	r3, [r0, #0]
     52c:	43db      	mvns	r3, r3
     52e:	600b      	str	r3, [r1, #0]
    PLLSyncA();
}
     530:	bc70      	pop	{r4, r5, r6}
     532:	4770      	bx	lr
     534:	40037128 	.word	0x40037128
     538:	4003711c 	.word	0x4003711c
     53c:	4003712c 	.word	0x4003712c
     540:	40037104 	.word	0x40037104
     544:	1fff9214 	.word	0x1fff9214

00000548 <pit2_isr>:

void pit2_isr() { // Pit2 on sync B
     548:	b430      	push	{r4, r5}
    PIT_TFLG2 = PIT_TFLG_TIF; //Clear interrupt flag
    PIT_TCTRL2 = 0; // Disable another interrupt by disabling timer
     54a:	4906      	ldr	r1, [pc, #24]	; (564 <pit2_isr+0x1c>)
    PIT_TFLG2 = PIT_TFLG_TIF; //Clear interrupt flag
     54c:	4c06      	ldr	r4, [pc, #24]	; (568 <pit2_isr+0x20>)
    LastPLLTriggers[STATION_B] = CURRENT_TIME;
     54e:	4b07      	ldr	r3, [pc, #28]	; (56c <pit2_isr+0x24>)
     550:	4a07      	ldr	r2, [pc, #28]	; (570 <pit2_isr+0x28>)
    PIT_TFLG2 = PIT_TFLG_TIF; //Clear interrupt flag
     552:	2501      	movs	r5, #1
    PIT_TCTRL2 = 0; // Disable another interrupt by disabling timer
     554:	2000      	movs	r0, #0
    PIT_TFLG2 = PIT_TFLG_TIF; //Clear interrupt flag
     556:	6025      	str	r5, [r4, #0]
    PIT_TCTRL2 = 0; // Disable another interrupt by disabling timer
     558:	6008      	str	r0, [r1, #0]
    LastPLLTriggers[STATION_B] = CURRENT_TIME;
     55a:	681b      	ldr	r3, [r3, #0]
     55c:	43db      	mvns	r3, r3
     55e:	6053      	str	r3, [r2, #4]
    PLLSyncB();
}
     560:	bc30      	pop	{r4, r5}
     562:	4770      	bx	lr
     564:	40037128 	.word	0x40037128
     568:	4003712c 	.word	0x4003712c
     56c:	40037104 	.word	0x40037104
     570:	1fff9214 	.word	0x1fff9214

00000574 <PhaseLockTimeLock(unsigned long, unsigned long)>:
//    LastCallTime = Now;
//    LastStationEmu = CurrentStationEmu;
//}


void PhaseLockTimeLock(u_int32_t LastHardwareRiseA, u_int32_t LastHardwareRiseB) {
     574:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    static u_int32_t LastLastHardwareRiseA = 0;
    static u_int32_t LastLastHardwareRiseB = 0;
    static u_int32_t LastLastDelta = 0;

    u_int32_t LastToThisA = LastHardwareRiseA - LastLastHardwareRiseA;
     578:	f8df 80b4 	ldr.w	r8, [pc, #180]	; 630 <PhaseLockTimeLock(unsigned long, unsigned long)+0xbc>
    u_int32_t LastToThisB = LastHardwareRiseB - LastLastHardwareRiseB;
     57c:	4e25      	ldr	r6, [pc, #148]	; (614 <PhaseLockTimeLock(unsigned long, unsigned long)+0xa0>)
    u_int32_t LastDelta = LastHardwareRiseB - LastHardwareRiseA;

    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
     57e:	f8d8 2000 	ldr.w	r2, [r8]
     582:	6833      	ldr	r3, [r6, #0]
     584:	4f24      	ldr	r7, [pc, #144]	; (618 <PhaseLockTimeLock(unsigned long, unsigned long)+0xa4>)
    InterSyncTime = (0.9 * InterSyncTime) + (0.1 * ((LastDelta + LastLastDelta) / 2));
     586:	f8df 90ac 	ldr.w	r9, [pc, #172]	; 634 <PhaseLockTimeLock(unsigned long, unsigned long)+0xc0>
     58a:	4d24      	ldr	r5, [pc, #144]	; (61c <PhaseLockTimeLock(unsigned long, unsigned long)+0xa8>)
    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
     58c:	4413      	add	r3, r2
     58e:	1acb      	subs	r3, r1, r3
void PhaseLockTimeLock(u_int32_t LastHardwareRiseA, u_int32_t LastHardwareRiseB) {
     590:	4682      	mov	sl, r0
    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
     592:	1818      	adds	r0, r3, r0
void PhaseLockTimeLock(u_int32_t LastHardwareRiseA, u_int32_t LastHardwareRiseB) {
     594:	b083      	sub	sp, #12
    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
     596:	0840      	lsrs	r0, r0, #1
void PhaseLockTimeLock(u_int32_t LastHardwareRiseA, u_int32_t LastHardwareRiseB) {
     598:	460c      	mov	r4, r1
    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
     59a:	f002 fa4f 	bl	2a3c <__aeabi_ui2f>
     59e:	4920      	ldr	r1, [pc, #128]	; (620 <PhaseLockTimeLock(unsigned long, unsigned long)+0xac>)
     5a0:	f002 faa4 	bl	2aec <__aeabi_fmul>
     5a4:	4683      	mov	fp, r0
     5a6:	6838      	ldr	r0, [r7, #0]
     5a8:	f002 fa48 	bl	2a3c <__aeabi_ui2f>
     5ac:	491d      	ldr	r1, [pc, #116]	; (624 <PhaseLockTimeLock(unsigned long, unsigned long)+0xb0>)
     5ae:	f002 fa9d 	bl	2aec <__aeabi_fmul>
     5b2:	4601      	mov	r1, r0
     5b4:	4658      	mov	r0, fp
     5b6:	f002 f991 	bl	28dc <__addsf3>
     5ba:	f002 fbe7 	bl	2d8c <__aeabi_f2uiz>
     5be:	4683      	mov	fp, r0
    InterSyncTime = (0.9 * InterSyncTime) + (0.1 * ((LastDelta + LastLastDelta) / 2));
     5c0:	f8d9 0000 	ldr.w	r0, [r9]
    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
     5c4:	f8c7 b000 	str.w	fp, [r7]
    u_int32_t LastDelta = LastHardwareRiseB - LastHardwareRiseA;
     5c8:	ebca 0704 	rsb	r7, sl, r4
    InterSyncTime = (0.9 * InterSyncTime) + (0.1 * ((LastDelta + LastLastDelta) / 2));
     5cc:	4438      	add	r0, r7
     5ce:	0840      	lsrs	r0, r0, #1
     5d0:	f002 fa34 	bl	2a3c <__aeabi_ui2f>
     5d4:	4912      	ldr	r1, [pc, #72]	; (620 <PhaseLockTimeLock(unsigned long, unsigned long)+0xac>)
     5d6:	f002 fa89 	bl	2aec <__aeabi_fmul>
     5da:	9001      	str	r0, [sp, #4]
     5dc:	6828      	ldr	r0, [r5, #0]
     5de:	f002 fa2d 	bl	2a3c <__aeabi_ui2f>
     5e2:	4910      	ldr	r1, [pc, #64]	; (624 <PhaseLockTimeLock(unsigned long, unsigned long)+0xb0>)
     5e4:	f002 fa82 	bl	2aec <__aeabi_fmul>
     5e8:	9b01      	ldr	r3, [sp, #4]
     5ea:	4601      	mov	r1, r0
     5ec:	4618      	mov	r0, r3
     5ee:	f002 f975 	bl	28dc <__addsf3>
     5f2:	f002 fbcb 	bl	2d8c <__aeabi_f2uiz>
    PIT_LDVAL1 = Delta;
     5f6:	4a0c      	ldr	r2, [pc, #48]	; (628 <PhaseLockTimeLock(unsigned long, unsigned long)+0xb4>)
    InterSyncTime = (0.9 * InterSyncTime) + (0.1 * ((LastDelta + LastLastDelta) / 2));
     5f8:	6028      	str	r0, [r5, #0]
    PIT_LDVAL1 = Delta;
     5fa:	f8c2 b000 	str.w	fp, [r2]
    PIT_LDVAL2 = Delta;
     5fe:	4b0b      	ldr	r3, [pc, #44]	; (62c <PhaseLockTimeLock(unsigned long, unsigned long)+0xb8>)

    SetPIT1Interrupt(InterPulseTime);
    SetPIT2Interrupt(InterSyncTime);
     600:	682a      	ldr	r2, [r5, #0]
    PIT_LDVAL2 = Delta;
     602:	601a      	str	r2, [r3, #0]

    LastLastDelta = LastDelta;
     604:	f8c9 7000 	str.w	r7, [r9]
    LastLastHardwareRiseA = LastHardwareRiseA;
     608:	f8c8 a000 	str.w	sl, [r8]
    LastLastHardwareRiseB = LastHardwareRiseB;
     60c:	6034      	str	r4, [r6, #0]
}
     60e:	b003      	add	sp, #12
     610:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     614:	1fff9220 	.word	0x1fff9220
     618:	1fff8800 	.word	0x1fff8800
     61c:	1fff8804 	.word	0x1fff8804
     620:	3dcccccd 	.word	0x3dcccccd
     624:	3f666666 	.word	0x3f666666
     628:	40037110 	.word	0x40037110
     62c:	40037120 	.word	0x40037120
     630:	1fff921c 	.word	0x1fff921c
     634:	1fff9210 	.word	0x1fff9210

00000638 <InitTimer()>:
//    return F_BUS / 1000000;
//}
// PIT 0 - Current Time, loaded with uint32max and counts down.
// PIT 1 - Phaselock Timer on SyncA
// PIT 2 - Phaselock Timer on SyncB
void InitTimer() {
     638:	b5f0      	push	{r4, r5, r6, r7, lr}
    noInterrupts();
     63a:	b672      	cpsid	i
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     63c:	4a0b      	ldr	r2, [pc, #44]	; (66c <InitTimer()+0x34>)
    PIT_MCR = 0;
     63e:	4f0c      	ldr	r7, [pc, #48]	; (670 <InitTimer()+0x38>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     640:	6813      	ldr	r3, [r2, #0]

    PIT_LDVAL0 = UINT32_MAX; // Setup current time PIT. Free Running. Never stops
     642:	4e0c      	ldr	r6, [pc, #48]	; (674 <InitTimer()+0x3c>)
    PIT_TCTRL0 = PIT_TCTRL_TEN;
     644:	4c0c      	ldr	r4, [pc, #48]	; (678 <InitTimer()+0x40>)

    PIT_LDVAL1 = UINT32_MAX; // Start up the timer, will interrupt soon. This will be changed by phaselock loop
     646:	480d      	ldr	r0, [pc, #52]	; (67c <InitTimer()+0x44>)
    PIT_TCTRL1 = PIT_TCTRL_TEN | PIT_TCTRL_TIE;
     648:	490d      	ldr	r1, [pc, #52]	; (680 <InitTimer()+0x48>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     64a:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
     64e:	6013      	str	r3, [r2, #0]
    PIT_MCR = 0;
     650:	f04f 0e00 	mov.w	lr, #0
    PIT_LDVAL0 = UINT32_MAX; // Setup current time PIT. Free Running. Never stops
     654:	f04f 33ff 	mov.w	r3, #4294967295
    PIT_TCTRL0 = PIT_TCTRL_TEN;
     658:	2501      	movs	r5, #1
    PIT_TCTRL1 = PIT_TCTRL_TEN | PIT_TCTRL_TIE;
     65a:	2203      	movs	r2, #3
    PIT_MCR = 0;
     65c:	f8c7 e000 	str.w	lr, [r7]
    PIT_LDVAL0 = UINT32_MAX; // Setup current time PIT. Free Running. Never stops
     660:	6033      	str	r3, [r6, #0]
    PIT_TCTRL0 = PIT_TCTRL_TEN;
     662:	6025      	str	r5, [r4, #0]
    PIT_LDVAL1 = UINT32_MAX; // Start up the timer, will interrupt soon. This will be changed by phaselock loop
     664:	6003      	str	r3, [r0, #0]
    PIT_TCTRL1 = PIT_TCTRL_TEN | PIT_TCTRL_TIE;
     666:	600a      	str	r2, [r1, #0]

    //PIT_LDVAL2 = UINT32_MAX; // Start up the timer, will interrupt soon. This will be changed by phaselock loop
    //PIT_TCTRL2 = PIT_TCTRL_TEN | PIT_TCTRL_TIE;
    interrupts();
     668:	b662      	cpsie	i
     66a:	bdf0      	pop	{r4, r5, r6, r7, pc}
     66c:	4004803c 	.word	0x4004803c
     670:	40037000 	.word	0x40037000
     674:	40037100 	.word	0x40037100
     678:	40037108 	.word	0x40037108
     67c:	40037110 	.word	0x40037110
     680:	40037118 	.word	0x40037118

00000684 <Interrupt0Change()>:
            Nodes[ID].NewSweepPinInterrupt(LastCallToNow,Now);\
        }\
    }\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);
     684:	4b15      	ldr	r3, [pc, #84]	; (6dc <Interrupt0Change()+0x58>)
     686:	681b      	ldr	r3, [r3, #0]
     688:	43db      	mvns	r3, r3
     68a:	b662      	cpsie	i
     68c:	4914      	ldr	r1, [pc, #80]	; (6e0 <Interrupt0Change()+0x5c>)
     68e:	680a      	ldr	r2, [r1, #0]
     690:	1a9a      	subs	r2, r3, r2
     692:	f5b2 6fe1 	cmp.w	r2, #1800	; 0x708
     696:	d908      	bls.n	6aa <Interrupt0Change()+0x26>
     698:	b430      	push	{r4, r5}
     69a:	f241 2048 	movw	r0, #4680	; 0x1248
     69e:	f6a2 6488 	subw	r4, r2, #3720	; 0xe88
     6a2:	4284      	cmp	r4, r0
     6a4:	600b      	str	r3, [r1, #0]
     6a6:	d901      	bls.n	6ac <Interrupt0Change()+0x28>
     6a8:	bc30      	pop	{r4, r5}
     6aa:	4770      	bx	lr
Pulse LatestHardwareBaseSync[2];

//
void NewSyncPinInterrupt(u_int8_t SourceNode, u_int32_t PulseLength, u_int32_t PulseStartTime) {
    static Pulse LastDetectedSync = {0, 0};
    if (!IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime,
     6ac:	480d      	ldr	r0, [pc, #52]	; (6e4 <Interrupt0Change()+0x60>)
     6ae:	6841      	ldr	r1, [r0, #4]
     6b0:	1a59      	subs	r1, r3, r1
     6b2:	f5b1 6fe1 	cmp.w	r1, #1800	; 0x708
     6b6:	d9f7      	bls.n	6a8 <Interrupt0Change()+0x24>
                  PULSETRAIN_SYNC_DISCREPANCY)) { // New Sync Pulse? (multiple nodes feed same function)
        u_int8_t SourceStation = IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime, US_TO_TICKS(1000));

        LastDetectedSync.StartTime = LatestHardwareBaseSync[SourceStation].StartTime = PulseStartTime;
     6b8:	f64e 2460 	movw	r4, #60000	; 0xea60
     6bc:	4d0a      	ldr	r5, [pc, #40]	; (6e8 <Interrupt0Change()+0x64>)
        LastDetectedSync.Length = LatestHardwareBaseSync[SourceStation].Length = PulseLength;
     6be:	6002      	str	r2, [r0, #0]
        LastDetectedSync.StartTime = LatestHardwareBaseSync[SourceStation].StartTime = PulseStartTime;
     6c0:	42a1      	cmp	r1, r4
     6c2:	bf94      	ite	ls
     6c4:	210c      	movls	r1, #12
     6c6:	2100      	movhi	r1, #0
     6c8:	186c      	adds	r4, r5, r1
        LastDetectedSync.Length = LatestHardwareBaseSync[SourceStation].Length = PulseLength;
     6ca:	506a      	str	r2, [r5, r1]
        LatestHardwareBaseSync[SourceStation].New = true;
     6cc:	7a21      	ldrb	r1, [r4, #8]
        LastDetectedSync.StartTime = LatestHardwareBaseSync[SourceStation].StartTime = PulseStartTime;
     6ce:	6043      	str	r3, [r0, #4]
        LatestHardwareBaseSync[SourceStation].New = true;
     6d0:	f041 0201 	orr.w	r2, r1, #1
        LastDetectedSync.StartTime = LatestHardwareBaseSync[SourceStation].StartTime = PulseStartTime;
     6d4:	6063      	str	r3, [r4, #4]
        LatestHardwareBaseSync[SourceStation].New = true;
     6d6:	7222      	strb	r2, [r4, #8]
void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);
     6d8:	e7e6      	b.n	6a8 <Interrupt0Change()+0x24>
     6da:	bf00      	nop
     6dc:	40037104 	.word	0x40037104
     6e0:	1fff9230 	.word	0x1fff9230
     6e4:	1fff9224 	.word	0x1fff9224
     6e8:	1fff9234 	.word	0x1fff9234

000006ec <__tcf_0>:
SensorNode Nodes[] = {SENSOR_1_PINS};
     6ec:	4801      	ldr	r0, [pc, #4]	; (6f4 <__tcf_0+0x8>)
     6ee:	f7ff bf07 	b.w	500 <SensorNode::~SensorNode()>
     6f2:	bf00      	nop
     6f4:	1fff9250 	.word	0x1fff9250

000006f8 <MainSetup()>:
void MainSetup() {
     6f8:	b510      	push	{r4, lr}
    pinMode(LED_BUILTIN, OUTPUT);
     6fa:	2101      	movs	r1, #1
     6fc:	200d      	movs	r0, #13
        Nodes[i].Init();
     6fe:	4c12      	ldr	r4, [pc, #72]	; (748 <MainSetup()+0x50>)
    pinMode(LED_BUILTIN, OUTPUT);
     700:	f000 fb56 	bl	db0 <pinMode>
    delay(2000);
     704:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     708:	f000 fb8e 	bl	e28 <delay>
        Nodes[i].Init();
     70c:	4620      	mov	r0, r4
     70e:	f7ff febd 	bl	48c <SensorNode::Init()>
    delay(100);
     712:	2064      	movs	r0, #100	; 0x64
     714:	f000 fb88 	bl	e28 <delay>
    InitTimer(); //Start up better timer (If using)
     718:	f7ff ff8e 	bl	638 <InitTimer()>
     71c:	2112      	movs	r1, #18
     71e:	480b      	ldr	r0, [pc, #44]	; (74c <MainSetup()+0x54>)
     720:	f001 fb32 	bl	1d88 <usb_serial_write>
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
     724:	4620      	mov	r0, r4
     726:	f7ff feed 	bl	504 <SensorNode::GetPulsePin()>
     72a:	2204      	movs	r2, #4
     72c:	4908      	ldr	r1, [pc, #32]	; (750 <MainSetup()+0x58>)
     72e:	f000 f9b9 	bl	aa4 <attachInterrupt>
     732:	2108      	movs	r1, #8
     734:	4807      	ldr	r0, [pc, #28]	; (754 <MainSetup()+0x5c>)
     736:	f001 fb27 	bl	1d88 <usb_serial_write>
     73a:	4807      	ldr	r0, [pc, #28]	; (758 <MainSetup()+0x60>)
     73c:	f000 f922 	bl	984 <Print::println()>
			} else if (pin == 11) {
				CORE_PIN11_PORTSET = CORE_PIN11_BITMASK;
			} else if (pin == 12) {
				CORE_PIN12_PORTSET = CORE_PIN12_BITMASK;
			} else if (pin == 13) {
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     740:	4b06      	ldr	r3, [pc, #24]	; (75c <MainSetup()+0x64>)
     742:	2220      	movs	r2, #32
     744:	601a      	str	r2, [r3, #0]
     746:	bd10      	pop	{r4, pc}
     748:	1fff9250 	.word	0x1fff9250
     74c:	00003754 	.word	0x00003754
     750:	00000685 	.word	0x00000685
     754:	00003768 	.word	0x00003768
     758:	1fff88f8 	.word	0x1fff88f8
     75c:	400ff084 	.word	0x400ff084

00000760 <main>:
//
//    }

}

int main() {
     760:	b580      	push	{r7, lr}
     762:	4f30      	ldr	r7, [pc, #192]	; (824 <main+0xc4>)
     764:	4c30      	ldr	r4, [pc, #192]	; (828 <main+0xc8>)
    u_int32_t RunStartTime = CURRENT_TIME;
     766:	4e31      	ldr	r6, [pc, #196]	; (82c <main+0xcc>)
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_A;
     768:	4d31      	ldr	r5, [pc, #196]	; (830 <main+0xd0>)
    MainSetup();
     76a:	f7ff ffc5 	bl	6f8 <MainSetup()>
    delay(200);
     76e:	20c8      	movs	r0, #200	; 0xc8
     770:	f000 fb5a 	bl	e28 <delay>
    if (LatestHardwareBaseSync[STATION_A].New) {
     774:	46b8      	mov	r8, r7
     776:	e001      	b.n	77c <main+0x1c>
    while (true) {
        MainLoop();
        yield(); // Critical for interrupts. For some reason. TODO Investigate.
     778:	f001 fc5a 	bl	2030 <yield>
    if (LatestHardwareBaseSync[STATION_A].New) {
     77c:	7a3b      	ldrb	r3, [r7, #8]
    u_int32_t RunStartTime = CURRENT_TIME;
     77e:	6832      	ldr	r2, [r6, #0]
    if (LatestHardwareBaseSync[STATION_A].New) {
     780:	07d8      	lsls	r0, r3, #31
    u_int32_t RunStartTime = CURRENT_TIME;
     782:	ea6f 0202 	mvn.w	r2, r2
    if (LatestHardwareBaseSync[STATION_A].New) {
     786:	d51b      	bpl.n	7c0 <main+0x60>
        noInterrupts();
     788:	b672      	cpsid	i
        LatestHardwareBaseSync[STATION_A].New = false;
     78a:	f898 1008 	ldrb.w	r1, [r8, #8]
        Pulse SafeCopy = LatestHardwareBaseSync[STATION_A];
     78e:	f8d8 3000 	ldr.w	r3, [r8]
        LatestHardwareBaseSync[STATION_A].New = false;
     792:	f36f 0100 	bfc	r1, #0, #1
     796:	f888 1008 	strb.w	r1, [r8, #8]
        interrupts();
     79a:	b662      	cpsie	i
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_A;
     79c:	4925      	ldr	r1, [pc, #148]	; (834 <main+0xd4>)
     79e:	eb03 0343 	add.w	r3, r3, r3, lsl #1
     7a2:	011b      	lsls	r3, r3, #4
     7a4:	fba1 1303 	umull	r1, r3, r1, r3
     7a8:	095b      	lsrs	r3, r3, #5
     7aa:	f6a3 13c5 	subw	r3, r3, #2501	; 0x9c5
     7ae:	fba5 1303 	umull	r1, r3, r5, r3
     7b2:	f3c3 1347 	ubfx	r3, r3, #5, #8
     7b6:	f013 0304 	ands.w	r3, r3, #4
     7ba:	bf18      	it	ne
     7bc:	7823      	ldrbne	r3, [r4, #0]
     7be:	7023      	strb	r3, [r4, #0]
    if (LatestHardwareBaseSync[STATION_B].New) {
     7c0:	7d3b      	ldrb	r3, [r7, #20]
     7c2:	07d9      	lsls	r1, r3, #31
     7c4:	d519      	bpl.n	7fa <main+0x9a>
        noInterrupts();
     7c6:	b672      	cpsid	i
        LatestHardwareBaseSync[STATION_B].New = false;
     7c8:	f898 1014 	ldrb.w	r1, [r8, #20]
        Pulse SafeCopy = LatestHardwareBaseSync[STATION_B];
     7cc:	f8d8 300c 	ldr.w	r3, [r8, #12]
        LatestHardwareBaseSync[STATION_B].New = false;
     7d0:	f36f 0100 	bfc	r1, #0, #1
     7d4:	f888 1014 	strb.w	r1, [r8, #20]
        interrupts();
     7d8:	b662      	cpsie	i
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_B;
     7da:	4916      	ldr	r1, [pc, #88]	; (834 <main+0xd4>)
     7dc:	eb03 0343 	add.w	r3, r3, r3, lsl #1
     7e0:	011b      	lsls	r3, r3, #4
     7e2:	fba1 1303 	umull	r1, r3, r1, r3
     7e6:	095b      	lsrs	r3, r3, #5
     7e8:	f6a3 13c5 	subw	r3, r3, #2501	; 0x9c5
     7ec:	fba5 1303 	umull	r1, r3, r5, r3
     7f0:	061b      	lsls	r3, r3, #24
     7f2:	bf4c      	ite	mi
     7f4:	7823      	ldrbmi	r3, [r4, #0]
     7f6:	2301      	movpl	r3, #1
     7f8:	7023      	strb	r3, [r4, #0]
            (RunStartTime - LatestHardwareBaseSync[STATION_B].StartTime) >= 1 * PULSETRAIN_LENGTH_TICKS;
     7fa:	f8d7 e010 	ldr.w	lr, [r7, #16]
    if (CurrentHardwareStationLock == DUAL_STATION_LOCK) {
     7fe:	490e      	ldr	r1, [pc, #56]	; (838 <main+0xd8>)
            (RunStartTime - LatestHardwareBaseSync[STATION_A].StartTime) >= 1 * PULSETRAIN_LENGTH_TICKS;
     800:	6878      	ldr	r0, [r7, #4]
    if (CurrentHardwareStationLock == DUAL_STATION_LOCK) {
     802:	ebce 0302 	rsb	r3, lr, r2
     806:	428b      	cmp	r3, r1
     808:	bf94      	ite	ls
     80a:	2300      	movls	r3, #0
     80c:	2301      	movhi	r3, #1
     80e:	1a12      	subs	r2, r2, r0
     810:	428a      	cmp	r2, r1
     812:	bf94      	ite	ls
     814:	461a      	movls	r2, r3
     816:	1c5a      	addhi	r2, r3, #1
     818:	2a02      	cmp	r2, #2
     81a:	d1ad      	bne.n	778 <main+0x18>
        PhaseLockTimeLock(LatestHardwareBaseSync[STATION_A].StartTime, LatestHardwareBaseSync[STATION_B].StartTime);
     81c:	4671      	mov	r1, lr
     81e:	f7ff fea9 	bl	574 <PhaseLockTimeLock(unsigned long, unsigned long)>
     822:	e7a9      	b.n	778 <main+0x18>
     824:	1fff9234 	.word	0x1fff9234
     828:	1fff924c 	.word	0x1fff924c
     82c:	40037104 	.word	0x40037104
     830:	10624dd3 	.word	0x10624dd3
     834:	88888889 	.word	0x88888889
     838:	0007a10b 	.word	0x0007a10b

0000083c <_GLOBAL__sub_I_SENSOR_1_PINS>:
    }
    return 0;
     83c:	b508      	push	{r3, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     83e:	4b06      	ldr	r3, [pc, #24]	; (858 <_GLOBAL__sub_I_SENSOR_1_PINS+0x1c>)
     840:	4806      	ldr	r0, [pc, #24]	; (85c <_GLOBAL__sub_I_SENSOR_1_PINS+0x20>)
     842:	cb0e      	ldmia	r3, {r1, r2, r3}
     844:	f7ff fe12 	bl	46c <SensorNode::SensorNode(SensorPinData_t)>
     848:	4a05      	ldr	r2, [pc, #20]	; (860 <_GLOBAL__sub_I_SENSOR_1_PINS+0x24>)
     84a:	4906      	ldr	r1, [pc, #24]	; (864 <_GLOBAL__sub_I_SENSOR_1_PINS+0x28>)
     84c:	2000      	movs	r0, #0
     84e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     852:	f002 b837 	b.w	28c4 <__aeabi_atexit>
     856:	bf00      	nop
     858:	1fff8808 	.word	0x1fff8808
     85c:	1fff9250 	.word	0x1fff9250
     860:	1fff87fc 	.word	0x1fff87fc
     864:	000006ed 	.word	0x000006ed

00000868 <Print::write(unsigned char const*, unsigned int)>:
#include "Print.h"



size_t Print::write(const uint8_t *buffer, size_t size)
{
     868:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	size_t count = 0;
	while (size--) count += write(*buffer++);
     86a:	b172      	cbz	r2, 88a <Print::write(unsigned char const*, unsigned int)+0x22>
     86c:	4606      	mov	r6, r0
     86e:	460f      	mov	r7, r1
     870:	4614      	mov	r4, r2
     872:	2500      	movs	r5, #0
     874:	6833      	ldr	r3, [r6, #0]
     876:	f817 1b01 	ldrb.w	r1, [r7], #1
     87a:	681b      	ldr	r3, [r3, #0]
     87c:	4630      	mov	r0, r6
     87e:	4798      	blx	r3
     880:	3c01      	subs	r4, #1
     882:	4405      	add	r5, r0
     884:	d1f6      	bne.n	874 <Print::write(unsigned char const*, unsigned int)+0xc>
	return count;
}
     886:	4628      	mov	r0, r5
     888:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	size_t count = 0;
     88a:	4615      	mov	r5, r2
     88c:	e7fb      	b.n	886 <Print::write(unsigned char const*, unsigned int)+0x1e>
     88e:	bf00      	nop

00000890 <Print::print(long)>:
	return count;
}


size_t Print::print(long n)
{
     890:	b5f0      	push	{r4, r5, r6, r7, lr}
	uint8_t sign=0;

	if (n < 0) {
     892:	2900      	cmp	r1, #0
{
     894:	b08b      	sub	sp, #44	; 0x2c
     896:	4604      	mov	r4, r0
	if (n < 0) {
     898:	db1b      	blt.n	8d2 <Print::print(long)+0x42>
	} else if (base == 1) {
		base = 10;
	}


	if (n == 0) {
     89a:	d15a      	bne.n	952 <Print::print(long)+0xc2>
		buf[sizeof(buf) - 1] = '0';
     89c:	2330      	movs	r3, #48	; 0x30
     89e:	f88d 3025 	strb.w	r3, [sp, #37]	; 0x25
	}
	if (sign) {
		i--;
		buf[i] = '-';
	}
	return write(buf + i, sizeof(buf) - i);
     8a2:	6823      	ldr	r3, [r4, #0]
     8a4:	4a35      	ldr	r2, [pc, #212]	; (97c <Print::print(long)+0xec>)
     8a6:	685f      	ldr	r7, [r3, #4]
     8a8:	4297      	cmp	r7, r2
     8aa:	d14a      	bne.n	942 <Print::print(long)+0xb2>
	while (size--) count += write(*buffer++);
     8ac:	2500      	movs	r5, #0
	return write(buf + i, sizeof(buf) - i);
     8ae:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     8b2:	460e      	mov	r6, r1
     8b4:	440d      	add	r5, r1
     8b6:	2700      	movs	r7, #0
     8b8:	e001      	b.n	8be <Print::print(long)+0x2e>
     8ba:	6823      	ldr	r3, [r4, #0]
     8bc:	3601      	adds	r6, #1
	while (size--) count += write(*buffer++);
     8be:	681b      	ldr	r3, [r3, #0]
     8c0:	7831      	ldrb	r1, [r6, #0]
     8c2:	4620      	mov	r0, r4
     8c4:	4798      	blx	r3
     8c6:	42b5      	cmp	r5, r6
     8c8:	4407      	add	r7, r0
     8ca:	d1f6      	bne.n	8ba <Print::print(long)+0x2a>
     8cc:	4638      	mov	r0, r7
}
     8ce:	b00b      	add	sp, #44	; 0x2c
     8d0:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     8d2:	4b2b      	ldr	r3, [pc, #172]	; (980 <Print::print(long)+0xf0>)
	return printNumber(n, 10, sign);
     8d4:	4249      	negs	r1, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     8d6:	fba3 2301 	umull	r2, r3, r3, r1
     8da:	08db      	lsrs	r3, r3, #3
     8dc:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     8e0:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
     8e4:	3130      	adds	r1, #48	; 0x30
     8e6:	f88d 1025 	strb.w	r1, [sp, #37]	; 0x25
			if (n == 0) break;
     8ea:	2b00      	cmp	r3, #0
     8ec:	d044      	beq.n	978 <Print::print(long)+0xe8>
		sign = '-';
     8ee:	262d      	movs	r6, #45	; 0x2d
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     8f0:	4d23      	ldr	r5, [pc, #140]	; (980 <Print::print(long)+0xf0>)
		sign = '-';
     8f2:	2221      	movs	r2, #33	; 0x21
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     8f4:	fba5 0103 	umull	r0, r1, r5, r3
     8f8:	08c9      	lsrs	r1, r1, #3
     8fa:	eb01 0081 	add.w	r0, r1, r1, lsl #2
			i--;
     8fe:	3a01      	subs	r2, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     900:	eba3 0340 	sub.w	r3, r3, r0, lsl #1
			i--;
     904:	b2d2      	uxtb	r2, r2
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     906:	a80a      	add	r0, sp, #40	; 0x28
     908:	4410      	add	r0, r2
     90a:	3330      	adds	r3, #48	; 0x30
     90c:	f800 3c24 	strb.w	r3, [r0, #-36]
			if (n == 0) break;
     910:	460b      	mov	r3, r1
     912:	2900      	cmp	r1, #0
     914:	d1ee      	bne.n	8f4 <Print::print(long)+0x64>
	if (sign) {
     916:	b35e      	cbz	r6, 970 <Print::print(long)+0xe0>
		i--;
     918:	1e55      	subs	r5, r2, #1
     91a:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     91c:	ab0a      	add	r3, sp, #40	; 0x28
     91e:	442b      	add	r3, r5
     920:	222d      	movs	r2, #45	; 0x2d
     922:	f803 2c24 	strb.w	r2, [r3, #-36]
     926:	f1c5 0022 	rsb	r0, r5, #34	; 0x22
	return write(buf + i, sizeof(buf) - i);
     92a:	6823      	ldr	r3, [r4, #0]
     92c:	4a13      	ldr	r2, [pc, #76]	; (97c <Print::print(long)+0xec>)
     92e:	685f      	ldr	r7, [r3, #4]
     930:	a901      	add	r1, sp, #4
     932:	4297      	cmp	r7, r2
     934:	4429      	add	r1, r5
     936:	d107      	bne.n	948 <Print::print(long)+0xb8>
	while (size--) count += write(*buffer++);
     938:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     93c:	2800      	cmp	r0, #0
     93e:	d1b8      	bne.n	8b2 <Print::print(long)+0x22>
     940:	e7c5      	b.n	8ce <Print::print(long)+0x3e>
	return write(buf + i, sizeof(buf) - i);
     942:	2001      	movs	r0, #1
     944:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     948:	4602      	mov	r2, r0
     94a:	4620      	mov	r0, r4
     94c:	47b8      	blx	r7
}
     94e:	b00b      	add	sp, #44	; 0x2c
     950:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     952:	4b0b      	ldr	r3, [pc, #44]	; (980 <Print::print(long)+0xf0>)
     954:	fba3 2301 	umull	r2, r3, r3, r1
     958:	08db      	lsrs	r3, r3, #3
     95a:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     95e:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
     962:	3230      	adds	r2, #48	; 0x30
     964:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
			if (n == 0) break;
     968:	2b00      	cmp	r3, #0
     96a:	d09a      	beq.n	8a2 <Print::print(long)+0x12>
	uint8_t sign=0;
     96c:	2600      	movs	r6, #0
     96e:	e7bf      	b.n	8f0 <Print::print(long)+0x60>
     970:	4615      	mov	r5, r2
     972:	f1c2 0022 	rsb	r0, r2, #34	; 0x22
     976:	e7d8      	b.n	92a <Print::print(long)+0x9a>
			if (n == 0) break;
     978:	2221      	movs	r2, #33	; 0x21
     97a:	e7cd      	b.n	918 <Print::print(long)+0x88>
     97c:	00000869 	.word	0x00000869
     980:	cccccccd 	.word	0xcccccccd

00000984 <Print::println()>:
{
     984:	b530      	push	{r4, r5, lr}
	return write(buf, 2);
     986:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     988:	490d      	ldr	r1, [pc, #52]	; (9c0 <Print::println()+0x3c>)
     98a:	4a0e      	ldr	r2, [pc, #56]	; (9c4 <Print::println()+0x40>)
	return write(buf, 2);
     98c:	685c      	ldr	r4, [r3, #4]
	uint8_t buf[2]={'\r', '\n'};
     98e:	8809      	ldrh	r1, [r1, #0]
{
     990:	b083      	sub	sp, #12
     992:	4294      	cmp	r4, r2
	uint8_t buf[2]={'\r', '\n'};
     994:	f8ad 1004 	strh.w	r1, [sp, #4]
     998:	d10d      	bne.n	9b6 <Print::println()+0x32>
     99a:	4605      	mov	r5, r0
	while (size--) count += write(*buffer++);
     99c:	681b      	ldr	r3, [r3, #0]
     99e:	210d      	movs	r1, #13
     9a0:	4798      	blx	r3
     9a2:	682b      	ldr	r3, [r5, #0]
     9a4:	f89d 1005 	ldrb.w	r1, [sp, #5]
     9a8:	681b      	ldr	r3, [r3, #0]
     9aa:	4604      	mov	r4, r0
     9ac:	4628      	mov	r0, r5
     9ae:	4798      	blx	r3
     9b0:	4420      	add	r0, r4
}
     9b2:	b003      	add	sp, #12
     9b4:	bd30      	pop	{r4, r5, pc}
	return write(buf, 2);
     9b6:	a901      	add	r1, sp, #4
     9b8:	2202      	movs	r2, #2
     9ba:	47a0      	blx	r4
}
     9bc:	b003      	add	sp, #12
     9be:	bd30      	pop	{r4, r5, pc}
     9c0:	00003774 	.word	0x00003774
     9c4:	00000869 	.word	0x00000869

000009c8 <fault_isr>:
{
     9c8:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     9ca:	4c10      	ldr	r4, [pc, #64]	; (a0c <fault_isr+0x44>)
     9cc:	e008      	b.n	9e0 <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     9ce:	6823      	ldr	r3, [r4, #0]
     9d0:	0559      	lsls	r1, r3, #21
     9d2:	d40d      	bmi.n	9f0 <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     9d4:	6823      	ldr	r3, [r4, #0]
     9d6:	051a      	lsls	r2, r3, #20
     9d8:	d40f      	bmi.n	9fa <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     9da:	6823      	ldr	r3, [r4, #0]
     9dc:	04db      	lsls	r3, r3, #19
     9de:	d411      	bmi.n	a04 <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     9e0:	6823      	ldr	r3, [r4, #0]
     9e2:	0358      	lsls	r0, r3, #13
     9e4:	d5f3      	bpl.n	9ce <fault_isr+0x6>
     9e6:	f000 fb47 	bl	1078 <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     9ea:	6823      	ldr	r3, [r4, #0]
     9ec:	0559      	lsls	r1, r3, #21
     9ee:	d5f1      	bpl.n	9d4 <fault_isr+0xc>
     9f0:	f001 fd60 	bl	24b4 <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     9f4:	6823      	ldr	r3, [r4, #0]
     9f6:	051a      	lsls	r2, r3, #20
     9f8:	d5ef      	bpl.n	9da <fault_isr+0x12>
     9fa:	f001 fdf1 	bl	25e0 <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     9fe:	6823      	ldr	r3, [r4, #0]
     a00:	04db      	lsls	r3, r3, #19
     a02:	d5ed      	bpl.n	9e0 <fault_isr+0x18>
     a04:	f001 fe82 	bl	270c <uart2_status_isr>
     a08:	e7ea      	b.n	9e0 <fault_isr+0x18>
     a0a:	bf00      	nop
     a0c:	40048034 	.word	0x40048034

00000a10 <unused_isr>:
{
     a10:	b508      	push	{r3, lr}
	fault_isr();
     a12:	f7ff ffd9 	bl	9c8 <fault_isr>
     a16:	bf00      	nop

00000a18 <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
     a18:	4b01      	ldr	r3, [pc, #4]	; (a20 <startup_early_hook+0x8>)
     a1a:	2210      	movs	r2, #16
     a1c:	801a      	strh	r2, [r3, #0]
     a1e:	4770      	bx	lr
     a20:	40052000 	.word	0x40052000

00000a24 <startup_late_hook>:
static void startup_default_late_hook(void) {}
     a24:	4770      	bx	lr
     a26:	bf00      	nop

00000a28 <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
     a28:	4909      	ldr	r1, [pc, #36]	; (a50 <_sbrk+0x28>)
{
     a2a:	b508      	push	{r3, lr}
	prev = __brkval;
     a2c:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
     a2e:	b130      	cbz	r0, a3e <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
     a30:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
     a32:	4418      	add	r0, r3
     a34:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
     a38:	4290      	cmp	r0, r2
     a3a:	d202      	bcs.n	a42 <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
     a3c:	6008      	str	r0, [r1, #0]
	}
	return prev;
     a3e:	4618      	mov	r0, r3
}
     a40:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
     a42:	f002 f9c9 	bl	2dd8 <__errno>
     a46:	230c      	movs	r3, #12
     a48:	6003      	str	r3, [r0, #0]
			return (void *)-1;
     a4a:	f04f 30ff 	mov.w	r0, #4294967295
     a4e:	bd08      	pop	{r3, pc}
     a50:	1fff8814 	.word	0x1fff8814

00000a54 <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
     a54:	b4f0      	push	{r4, r5, r6, r7}
     a56:	1e4d      	subs	r5, r1, #1
     a58:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
     a5a:	2400      	movs	r4, #0
     a5c:	e000      	b.n	a60 <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
     a5e:	3401      	adds	r4, #1
		digit = val % radix;
     a60:	fbb0 f3f2 	udiv	r3, r0, r2
     a64:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a68:	2809      	cmp	r0, #9
     a6a:	f100 0730 	add.w	r7, r0, #48	; 0x30
     a6e:	bf8a      	itet	hi
     a70:	3037      	addhi	r0, #55	; 0x37
     a72:	b2f8      	uxtbls	r0, r7
     a74:	b2c0      	uxtbhi	r0, r0
     a76:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
     a7a:	4618      	mov	r0, r3
     a7c:	2b00      	cmp	r3, #0
     a7e:	d1ee      	bne.n	a5e <ultoa+0xa>
	}
	buf[i + 1] = 0;
     a80:	190a      	adds	r2, r1, r4
     a82:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
     a84:	b14c      	cbz	r4, a9a <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
     a86:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
     a88:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
     a8c:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
     a8e:	3301      	adds	r3, #1
     a90:	1ae0      	subs	r0, r4, r3
     a92:	4283      	cmp	r3, r0
		buf[i] = t;
     a94:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
     a98:	dbf5      	blt.n	a86 <ultoa+0x32>
	}
	return buf;
}
     a9a:	4608      	mov	r0, r1
     a9c:	bcf0      	pop	{r4, r5, r6, r7}
     a9e:	4770      	bx	lr

00000aa0 <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
     aa0:	4770      	bx	lr
     aa2:	bf00      	nop

00000aa4 <attachInterrupt>:
void attachInterrupt(uint8_t pin, void (*function)(void), int mode)
{
	volatile uint32_t *config;
	uint32_t cfg, mask;

	if (pin >= CORE_NUM_DIGITAL) return;
     aa4:	2821      	cmp	r0, #33	; 0x21
{
     aa6:	b4f0      	push	{r4, r5, r6, r7}
	if (pin >= CORE_NUM_DIGITAL) return;
     aa8:	d815      	bhi.n	ad6 <attachInterrupt+0x32>
	switch (mode) {
     aaa:	2a04      	cmp	r2, #4
     aac:	d813      	bhi.n	ad6 <attachInterrupt+0x32>
     aae:	e8df f002 	tbb	[pc, r2]
     ab2:	4c49      	.short	0x4c49
     ab4:	144f      	.short	0x144f
     ab6:	46          	.byte	0x46
     ab7:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     ab8:	4e2e      	ldr	r6, [pc, #184]	; (b74 <attachInterrupt+0xd0>)
	attachInterruptVector(IRQ_PORTD, port_D_isr);
	attachInterruptVector(IRQ_PORTE, port_E_isr);
	voidFuncPtr* isr_table = getIsrTable(config);
	if(!isr_table) return;
	uint32_t pin_index = getPinIndex(config);
	__disable_irq();
     aba:	b672      	cpsid	i
	cfg = *config;
     abc:	681a      	ldr	r2, [r3, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
     abe:	f422 2270 	bic.w	r2, r2, #983040	; 0xf0000
     ac2:	f042 7080 	orr.w	r0, r2, #16777216	; 0x1000000
	*config = cfg;
	isr_table[pin_index] = function;	// set the function pointer
     ac6:	f3c3 0484 	ubfx	r4, r3, #2, #5
	cfg |= mask;
     aca:	4328      	orrs	r0, r5
	*config = cfg;
     acc:	601a      	str	r2, [r3, #0]
	isr_table[pin_index] = function;	// set the function pointer
     ace:	f846 1024 	str.w	r1, [r6, r4, lsl #2]
	*config = cfg;			// enable the new interrupt
     ad2:	6018      	str	r0, [r3, #0]
	__enable_irq();
     ad4:	b662      	cpsie	i
	intFunc[pin] = function;	// set the function pointer
	cfg |= mask;
	*config = cfg;			// enable the new interrupt
	__enable_irq();
#endif
}
     ad6:	bcf0      	pop	{r4, r5, r6, r7}
     ad8:	4770      	bx	lr
	switch (mode) {
     ada:	f44f 2510 	mov.w	r5, #589824	; 0x90000
	config = portConfigRegister(pin);
     ade:	4c26      	ldr	r4, [pc, #152]	; (b78 <attachInterrupt+0xd4>)
     ae0:	eb04 03c0 	add.w	r3, r4, r0, lsl #3
     ae4:	685b      	ldr	r3, [r3, #4]
	if ((*config & 0x00000700) == 0) {
     ae6:	681a      	ldr	r2, [r3, #0]
     ae8:	f412 62e0 	ands.w	r2, r2, #1792	; 0x700
     aec:	d035      	beq.n	b5a <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
     aee:	4a23      	ldr	r2, [pc, #140]	; (b7c <attachInterrupt+0xd8>)
     af0:	4c23      	ldr	r4, [pc, #140]	; (b80 <attachInterrupt+0xdc>)
     af2:	4824      	ldr	r0, [pc, #144]	; (b84 <attachInterrupt+0xe0>)
     af4:	f8c2 419c 	str.w	r4, [r2, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     af8:	f103 4440 	add.w	r4, r3, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
     afc:	4e22      	ldr	r6, [pc, #136]	; (b88 <attachInterrupt+0xe4>)
     afe:	f8c2 01a4 	str.w	r0, [r2, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     b02:	f5a4 2092 	sub.w	r0, r4, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
     b06:	4f21      	ldr	r7, [pc, #132]	; (b8c <attachInterrupt+0xe8>)
     b08:	f8c2 61a0 	str.w	r6, [r2, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     b0c:	287c      	cmp	r0, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
     b0e:	4e20      	ldr	r6, [pc, #128]	; (b90 <attachInterrupt+0xec>)
     b10:	f8c2 71a8 	str.w	r7, [r2, #424]	; 0x1a8
     b14:	f8c2 61ac 	str.w	r6, [r2, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     b18:	d9ce      	bls.n	ab8 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     b1a:	f5a4 2294 	sub.w	r2, r4, #303104	; 0x4a000
     b1e:	2a7c      	cmp	r2, #124	; 0x7c
     b20:	d919      	bls.n	b56 <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     b22:	f5a4 2296 	sub.w	r2, r4, #307200	; 0x4b000
     b26:	2a7c      	cmp	r2, #124	; 0x7c
     b28:	d91f      	bls.n	b6a <attachInterrupt+0xc6>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     b2a:	f5a4 2298 	sub.w	r2, r4, #311296	; 0x4c000
     b2e:	2a7c      	cmp	r2, #124	; 0x7c
     b30:	d91d      	bls.n	b6e <attachInterrupt+0xca>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     b32:	f5a4 249a 	sub.w	r4, r4, #315392	; 0x4d000
     b36:	2c7c      	cmp	r4, #124	; 0x7c
     b38:	d8cd      	bhi.n	ad6 <attachInterrupt+0x32>
     b3a:	4e16      	ldr	r6, [pc, #88]	; (b94 <attachInterrupt+0xf0>)
     b3c:	e7bd      	b.n	aba <attachInterrupt+0x16>
	switch (mode) {
     b3e:	f44f 2530 	mov.w	r5, #720896	; 0xb0000
     b42:	e7cc      	b.n	ade <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
     b44:	f44f 2500 	mov.w	r5, #524288	; 0x80000
     b48:	e7c9      	b.n	ade <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
     b4a:	f44f 2540 	mov.w	r5, #786432	; 0xc0000
     b4e:	e7c6      	b.n	ade <attachInterrupt+0x3a>
	switch (mode) {
     b50:	f44f 2520 	mov.w	r5, #655360	; 0xa0000
     b54:	e7c3      	b.n	ade <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     b56:	4e10      	ldr	r6, [pc, #64]	; (b98 <attachInterrupt+0xf4>)
     b58:	e7af      	b.n	aba <attachInterrupt+0x16>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
     b5a:	f854 4030 	ldr.w	r4, [r4, r0, lsl #3]
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
			*config = PORT_PCR_MUX(1);
     b5e:	f44f 7080 	mov.w	r0, #256	; 0x100
		*portModeRegister(pin) = 0;
     b62:	f884 2280 	strb.w	r2, [r4, #640]	; 0x280
			*config = PORT_PCR_MUX(1);
     b66:	6018      	str	r0, [r3, #0]
     b68:	e7c1      	b.n	aee <attachInterrupt+0x4a>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     b6a:	4e0c      	ldr	r6, [pc, #48]	; (b9c <attachInterrupt+0xf8>)
     b6c:	e7a5      	b.n	aba <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     b6e:	4e0c      	ldr	r6, [pc, #48]	; (ba0 <attachInterrupt+0xfc>)
     b70:	e7a3      	b.n	aba <attachInterrupt+0x16>
     b72:	bf00      	nop
     b74:	1fff8818 	.word	0x1fff8818
     b78:	00003778 	.word	0x00003778
     b7c:	1fff8200 	.word	0x1fff8200
     b80:	1fff87d1 	.word	0x1fff87d1
     b84:	1fff8779 	.word	0x1fff8779
     b88:	1fff87a5 	.word	0x1fff87a5
     b8c:	1fff874d 	.word	0x1fff874d
     b90:	1fff8721 	.word	0x1fff8721
     b94:	1fff88f0 	.word	0x1fff88f0
     b98:	1fff8850 	.word	0x1fff8850
     b9c:	1fff88a0 	.word	0x1fff88a0
     ba0:	1fff88d0 	.word	0x1fff88d0

00000ba4 <rtc_set>:
{
     ba4:	b430      	push	{r4, r5}
	RTC_SR = 0;
     ba6:	4b05      	ldr	r3, [pc, #20]	; (bbc <rtc_set+0x18>)
	RTC_TPR = 0;
     ba8:	4d05      	ldr	r5, [pc, #20]	; (bc0 <rtc_set+0x1c>)
	RTC_TSR = t;
     baa:	4c06      	ldr	r4, [pc, #24]	; (bc4 <rtc_set+0x20>)
	RTC_SR = 0;
     bac:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
     bae:	2110      	movs	r1, #16
	RTC_SR = 0;
     bb0:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
     bb2:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
     bb4:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
     bb6:	6019      	str	r1, [r3, #0]
}
     bb8:	bc30      	pop	{r4, r5}
     bba:	4770      	bx	lr
     bbc:	4003d014 	.word	0x4003d014
     bc0:	4003d004 	.word	0x4003d004
     bc4:	4003d000 	.word	0x4003d000

00000bc8 <_init_Teensyduino_internal_>:
{
     bc8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     bcc:	4b6a      	ldr	r3, [pc, #424]	; (d78 <_init_Teensyduino_internal_+0x1b0>)
	FTM0_CNT = 0;
     bce:	496b      	ldr	r1, [pc, #428]	; (d7c <_init_Teensyduino_internal_+0x1b4>)
	FTM0_C1SC = 0x28;
     bd0:	4e6b      	ldr	r6, [pc, #428]	; (d80 <_init_Teensyduino_internal_+0x1b8>)
	FTM0_C3SC = 0x28;
     bd2:	4d6c      	ldr	r5, [pc, #432]	; (d84 <_init_Teensyduino_internal_+0x1bc>)
	FTM0_C4SC = 0x28;
     bd4:	4c6c      	ldr	r4, [pc, #432]	; (d88 <_init_Teensyduino_internal_+0x1c0>)
	FTM0_MOD = DEFAULT_FTM_MOD;
     bd6:	f8df c1d0 	ldr.w	ip, [pc, #464]	; da8 <_init_Teensyduino_internal_+0x1e0>
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     bda:	f8df e1d0 	ldr.w	lr, [pc, #464]	; dac <_init_Teensyduino_internal_+0x1e4>
	FTM0_C2SC = 0x28;
     bde:	4a6b      	ldr	r2, [pc, #428]	; (d8c <_init_Teensyduino_internal_+0x1c4>)
	FTM0_C5SC = 0x28;
     be0:	4f6b      	ldr	r7, [pc, #428]	; (d90 <_init_Teensyduino_internal_+0x1c8>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     be2:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
     be6:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
     be8:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
     bec:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
     bee:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
     bf2:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
     bf4:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
     bf8:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
     bfa:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
     bfe:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
     c00:	2000      	movs	r0, #0
     c02:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     c04:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
     c06:	f64e 71ff 	movw	r1, #61439	; 0xefff
     c0a:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     c0e:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
     c12:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
     c14:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
     c16:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
     c18:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
     c1a:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
     c1c:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
     c1e:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     c20:	2209      	movs	r2, #9
     c22:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
     c26:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
     c2a:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
     c2e:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
     c32:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
     c36:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
     c3a:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
     c3e:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     c40:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     c44:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
     c48:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
     c4c:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
     c50:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     c52:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     c56:	484f      	ldr	r0, [pc, #316]	; (d94 <_init_Teensyduino_internal_+0x1cc>)
	FTM2_MOD = DEFAULT_FTM_MOD;
     c58:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
     c5a:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
     c5e:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
     c62:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
     c64:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     c66:	6002      	str	r2, [r0, #0]
	analog_init();
     c68:	f001 fba4 	bl	23b4 <analog_init>

uint32_t micros(void)
{
	uint32_t count, current, istatus;

	__disable_irq();
     c6c:	b672      	cpsid	i
	current = SYST_CVR;
	count = systick_millis_count;
     c6e:	4d4a      	ldr	r5, [pc, #296]	; (d98 <_init_Teensyduino_internal_+0x1d0>)
	current = SYST_CVR;
     c70:	4b4a      	ldr	r3, [pc, #296]	; (d9c <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c72:	4a4b      	ldr	r2, [pc, #300]	; (da0 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     c74:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     c76:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c78:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     c7a:	b662      	cpsie	i
	 //systick_current = current;
	 //systick_count = count;
	 //systick_istatus = istatus & SCB_ICSR_PENDSTSET ? 1 : 0;
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c7c:	0151      	lsls	r1, r2, #5
     c7e:	d502      	bpl.n	c86 <_init_Teensyduino_internal_+0xbe>
     c80:	2b32      	cmp	r3, #50	; 0x32
     c82:	bf88      	it	hi
     c84:	3401      	addhi	r4, #1
#if defined(KINETISL) && F_CPU == 48000000
	return count * 1000 + ((current * (uint32_t)87381) >> 22);
#elif defined(KINETISL) && F_CPU == 24000000
	return count * 1000 + ((current * (uint32_t)174763) >> 22);
#endif
	return count * 1000 + current / (F_CPU / 1000000);
     c86:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     c8a:	4f46      	ldr	r7, [pc, #280]	; (da4 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     c8c:	f8df 910c 	ldr.w	r9, [pc, #268]	; d9c <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c90:	f8df 810c 	ldr.w	r8, [pc, #268]	; da0 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     c94:	33bf      	adds	r3, #191	; 0xbf
     c96:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     c9a:	fba7 1303 	umull	r1, r3, r7, r3
     c9e:	fb02 f404 	mul.w	r4, r2, r4
     ca2:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     ca6:	2632      	movs	r6, #50	; 0x32
	__disable_irq();
     ca8:	b672      	cpsid	i
	current = SYST_CVR;
     caa:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     cae:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     cb0:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     cb4:	b662      	cpsie	i
{
	uint32_t start = micros();

	if (ms > 0) {
		while (1) {
			while ((micros() - start) >= 1000) {
     cb6:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     cba:	33bf      	adds	r3, #191	; 0xbf
     cbc:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     cc0:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     cc4:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     cc8:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     ccc:	d002      	beq.n	cd4 <_init_Teensyduino_internal_+0x10c>
     cce:	2932      	cmp	r1, #50	; 0x32
     cd0:	bf88      	it	hi
     cd2:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     cd4:	fb00 3302 	mla	r3, r0, r2, r3
     cd8:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     cdc:	d304      	bcc.n	ce8 <_init_Teensyduino_internal_+0x120>
				ms--;
				if (ms == 0) return;
     cde:	3e01      	subs	r6, #1
     ce0:	d005      	beq.n	cee <_init_Teensyduino_internal_+0x126>
				start += 1000;
     ce2:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     ce6:	e7df      	b.n	ca8 <_init_Teensyduino_internal_+0xe0>
			}
			yield();
     ce8:	f001 f9a2 	bl	2030 <yield>
     cec:	e7dc      	b.n	ca8 <_init_Teensyduino_internal_+0xe0>
	usb_init();
     cee:	f000 ff1d 	bl	1b2c <usb_init>
	__disable_irq();
     cf2:	b672      	cpsid	i
	current = SYST_CVR;
     cf4:	4b29      	ldr	r3, [pc, #164]	; (d9c <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     cf6:	4a2a      	ldr	r2, [pc, #168]	; (da0 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     cf8:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     cfa:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     cfc:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     cfe:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     d00:	0152      	lsls	r2, r2, #5
     d02:	d502      	bpl.n	d0a <_init_Teensyduino_internal_+0x142>
     d04:	2b32      	cmp	r3, #50	; 0x32
     d06:	bf88      	it	hi
     d08:	3401      	addhi	r4, #1
	return count * 1000 + current / (F_CPU / 1000000);
     d0a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     d0e:	4f25      	ldr	r7, [pc, #148]	; (da4 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     d10:	f8df 9088 	ldr.w	r9, [pc, #136]	; d9c <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d14:	f8df 8088 	ldr.w	r8, [pc, #136]	; da0 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     d18:	33bf      	adds	r3, #191	; 0xbf
     d1a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     d1e:	fba7 1303 	umull	r1, r3, r7, r3
     d22:	fb02 f404 	mul.w	r4, r2, r4
     d26:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     d2a:	f44f 76af 	mov.w	r6, #350	; 0x15e
	__disable_irq();
     d2e:	b672      	cpsid	i
	current = SYST_CVR;
     d30:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     d34:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d36:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     d3a:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     d3c:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     d40:	33bf      	adds	r3, #191	; 0xbf
     d42:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     d46:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     d4a:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     d4e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     d52:	d002      	beq.n	d5a <_init_Teensyduino_internal_+0x192>
     d54:	2932      	cmp	r1, #50	; 0x32
     d56:	bf88      	it	hi
     d58:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     d5a:	fb00 3302 	mla	r3, r0, r2, r3
     d5e:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     d62:	d304      	bcc.n	d6e <_init_Teensyduino_internal_+0x1a6>
				if (ms == 0) return;
     d64:	3e01      	subs	r6, #1
     d66:	d005      	beq.n	d74 <_init_Teensyduino_internal_+0x1ac>
				start += 1000;
     d68:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     d6c:	e7df      	b.n	d2e <_init_Teensyduino_internal_+0x166>
			yield();
     d6e:	f001 f95f 	bl	2030 <yield>
     d72:	e7dc      	b.n	d2e <_init_Teensyduino_internal_+0x166>
     d74:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     d78:	e000e108 	.word	0xe000e108
     d7c:	40038004 	.word	0x40038004
     d80:	40038014 	.word	0x40038014
     d84:	40038024 	.word	0x40038024
     d88:	4003802c 	.word	0x4003802c
     d8c:	4003801c 	.word	0x4003801c
     d90:	40038034 	.word	0x40038034
     d94:	400b8000 	.word	0x400b8000
     d98:	1fff9328 	.word	0x1fff9328
     d9c:	e000e018 	.word	0xe000e018
     da0:	e000ed04 	.word	0xe000ed04
     da4:	88888889 	.word	0x88888889
     da8:	40038008 	.word	0x40038008
     dac:	4003800c 	.word	0x4003800c

00000db0 <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
     db0:	2821      	cmp	r0, #33	; 0x21
     db2:	d820      	bhi.n	df6 <pinMode+0x46>
	config = portConfigRegister(pin);
     db4:	4a1b      	ldr	r2, [pc, #108]	; (e24 <pinMode+0x74>)
     db6:	eb02 03c0 	add.w	r3, r2, r0, lsl #3
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     dba:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
     dbc:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     dbe:	d00f      	beq.n	de0 <pinMode+0x30>
     dc0:	2904      	cmp	r1, #4
     dc2:	d01d      	beq.n	e00 <pinMode+0x50>
		*portModeRegister(pin) = 0;
     dc4:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
     dc8:	2200      	movs	r2, #0
     dca:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
		if (mode == INPUT) {
     dce:	b199      	cbz	r1, df8 <pinMode+0x48>
		} else if (mode == INPUT_PULLUP) {
     dd0:	2902      	cmp	r1, #2
     dd2:	d022      	beq.n	e1a <pinMode+0x6a>
		} else if (mode == INPUT_PULLDOWN) {
     dd4:	2903      	cmp	r1, #3
     dd6:	d10d      	bne.n	df4 <pinMode+0x44>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
     dd8:	f44f 7281 	mov.w	r2, #258	; 0x102
     ddc:	601a      	str	r2, [r3, #0]
     dde:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     de0:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     de4:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     de8:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     dec:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
     dee:	681a      	ldr	r2, [r3, #0]
     df0:	f022 0220 	bic.w	r2, r2, #32
     df4:	601a      	str	r2, [r3, #0]
     df6:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
     df8:	f44f 7280 	mov.w	r2, #256	; 0x100
     dfc:	601a      	str	r2, [r3, #0]
     dfe:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     e00:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     e04:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     e08:	2001      	movs	r0, #1
     e0a:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     e0e:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
     e10:	681a      	ldr	r2, [r3, #0]
     e12:	f042 0220 	orr.w	r2, r2, #32
     e16:	601a      	str	r2, [r3, #0]
     e18:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
     e1a:	f240 1203 	movw	r2, #259	; 0x103
     e1e:	601a      	str	r2, [r3, #0]
     e20:	4770      	bx	lr
     e22:	bf00      	nop
     e24:	00003778 	.word	0x00003778

00000e28 <delay>:
{
     e28:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
     e2c:	4605      	mov	r5, r0
	__disable_irq();
     e2e:	b672      	cpsid	i
	count = systick_millis_count;
     e30:	4f20      	ldr	r7, [pc, #128]	; (eb4 <delay+0x8c>)
	current = SYST_CVR;
     e32:	4b21      	ldr	r3, [pc, #132]	; (eb8 <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e34:	4a21      	ldr	r2, [pc, #132]	; (ebc <delay+0x94>)
	current = SYST_CVR;
     e36:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     e38:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e3a:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     e3c:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     e3e:	0152      	lsls	r2, r2, #5
     e40:	d502      	bpl.n	e48 <delay+0x20>
     e42:	2b32      	cmp	r3, #50	; 0x32
     e44:	bf88      	it	hi
     e46:	3401      	addhi	r4, #1
	if (ms > 0) {
     e48:	b395      	cbz	r5, eb0 <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
     e4a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     e4e:	4e1c      	ldr	r6, [pc, #112]	; (ec0 <delay+0x98>)
	current = SYST_CVR;
     e50:	f8df 9064 	ldr.w	r9, [pc, #100]	; eb8 <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e54:	f8df 8064 	ldr.w	r8, [pc, #100]	; ebc <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
     e58:	33bf      	adds	r3, #191	; 0xbf
     e5a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     e5e:	fba6 1303 	umull	r1, r3, r6, r3
     e62:	fb02 f404 	mul.w	r4, r2, r4
     e66:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
     e6a:	b672      	cpsid	i
	current = SYST_CVR;
     e6c:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     e70:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e72:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     e76:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     e78:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     e7c:	33bf      	adds	r3, #191	; 0xbf
     e7e:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     e82:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     e86:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     e8a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     e8e:	d002      	beq.n	e96 <delay+0x6e>
     e90:	2932      	cmp	r1, #50	; 0x32
     e92:	bf88      	it	hi
     e94:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     e96:	fb00 3302 	mla	r3, r0, r2, r3
     e9a:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     e9e:	d304      	bcc.n	eaa <delay+0x82>
				if (ms == 0) return;
     ea0:	3d01      	subs	r5, #1
     ea2:	d005      	beq.n	eb0 <delay+0x88>
				start += 1000;
     ea4:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     ea8:	e7df      	b.n	e6a <delay+0x42>
			yield();
     eaa:	f001 f8c1 	bl	2030 <yield>
		}
     eae:	e7dc      	b.n	e6a <delay+0x42>
     eb0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     eb4:	1fff9328 	.word	0x1fff9328
     eb8:	e000e018 	.word	0xe000e018
     ebc:	e000ed04 	.word	0xe000ed04
     ec0:	88888889 	.word	0x88888889

00000ec4 <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
     ec4:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     ec6:	2b03      	cmp	r3, #3
     ec8:	d814      	bhi.n	ef4 <usb_rx+0x30>
	__disable_irq();
     eca:	b672      	cpsid	i
	ret = rx_first[endpoint];
     ecc:	490a      	ldr	r1, [pc, #40]	; (ef8 <usb_rx+0x34>)
     ece:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
     ed2:	b168      	cbz	r0, ef0 <usb_rx+0x2c>
{
     ed4:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
     ed6:	4c09      	ldr	r4, [pc, #36]	; (efc <usb_rx+0x38>)
     ed8:	8805      	ldrh	r5, [r0, #0]
     eda:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
     ede:	6846      	ldr	r6, [r0, #4]
     ee0:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
     ee4:	1b52      	subs	r2, r2, r5
     ee6:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
     eea:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
     eec:	bc70      	pop	{r4, r5, r6}
     eee:	4770      	bx	lr
	__enable_irq();
     ef0:	b662      	cpsie	i
}
     ef2:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     ef4:	2000      	movs	r0, #0
     ef6:	4770      	bx	lr
     ef8:	1fff9384 	.word	0x1fff9384
     efc:	1fff9608 	.word	0x1fff9608

00000f00 <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
     f00:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
     f02:	2803      	cmp	r0, #3
     f04:	d80b      	bhi.n	f1e <usb_tx_packet_count+0x1e>
	__disable_irq();
     f06:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
     f08:	4b07      	ldr	r3, [pc, #28]	; (f28 <usb_tx_packet_count+0x28>)
     f0a:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
     f0e:	b143      	cbz	r3, f22 <usb_tx_packet_count+0x22>
     f10:	2000      	movs	r0, #0
     f12:	685b      	ldr	r3, [r3, #4]
     f14:	3001      	adds	r0, #1
     f16:	2b00      	cmp	r3, #0
     f18:	d1fb      	bne.n	f12 <usb_tx_packet_count+0x12>
	__enable_irq();
     f1a:	b662      	cpsie	i
	return count;
     f1c:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
     f1e:	2000      	movs	r0, #0
}
     f20:	4770      	bx	lr
	uint32_t count=0;
     f22:	4618      	mov	r0, r3
     f24:	e7f9      	b.n	f1a <usb_tx_packet_count+0x1a>
     f26:	bf00      	nop
     f28:	1fff93d8 	.word	0x1fff93d8

00000f2c <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
     f2c:	b430      	push	{r4, r5}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
     f2e:	b672      	cpsid	i
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     f30:	4a2b      	ldr	r2, [pc, #172]	; (fe0 <usb_rx_memory+0xb4>)
     f32:	7813      	ldrb	r3, [r2, #0]
     f34:	071d      	lsls	r5, r3, #28
     f36:	d506      	bpl.n	f46 <usb_rx_memory+0x1a>
			if (table[index(i, RX, EVEN)].desc == 0) {
     f38:	4b2a      	ldr	r3, [pc, #168]	; (fe4 <usb_rx_memory+0xb8>)
     f3a:	6a19      	ldr	r1, [r3, #32]
     f3c:	2900      	cmp	r1, #0
     f3e:	d036      	beq.n	fae <usb_rx_memory+0x82>
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
     f40:	6a99      	ldr	r1, [r3, #40]	; 0x28
     f42:	2900      	cmp	r1, #0
     f44:	d041      	beq.n	fca <usb_rx_memory+0x9e>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     f46:	7853      	ldrb	r3, [r2, #1]
     f48:	071c      	lsls	r4, r3, #28
     f4a:	d506      	bpl.n	f5a <usb_rx_memory+0x2e>
			if (table[index(i, RX, EVEN)].desc == 0) {
     f4c:	4b25      	ldr	r3, [pc, #148]	; (fe4 <usb_rx_memory+0xb8>)
     f4e:	6c19      	ldr	r1, [r3, #64]	; 0x40
     f50:	2900      	cmp	r1, #0
     f52:	d03e      	beq.n	fd2 <usb_rx_memory+0xa6>
			if (table[index(i, RX, ODD)].desc == 0) {
     f54:	6c99      	ldr	r1, [r3, #72]	; 0x48
     f56:	2900      	cmp	r1, #0
     f58:	d039      	beq.n	fce <usb_rx_memory+0xa2>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     f5a:	7893      	ldrb	r3, [r2, #2]
     f5c:	0719      	lsls	r1, r3, #28
     f5e:	d505      	bpl.n	f6c <usb_rx_memory+0x40>
			if (table[index(i, RX, EVEN)].desc == 0) {
     f60:	4b20      	ldr	r3, [pc, #128]	; (fe4 <usb_rx_memory+0xb8>)
     f62:	6e19      	ldr	r1, [r3, #96]	; 0x60
     f64:	2900      	cmp	r1, #0
     f66:	d036      	beq.n	fd6 <usb_rx_memory+0xaa>
			if (table[index(i, RX, ODD)].desc == 0) {
     f68:	6e99      	ldr	r1, [r3, #104]	; 0x68
     f6a:	b189      	cbz	r1, f90 <usb_rx_memory+0x64>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     f6c:	78d3      	ldrb	r3, [r2, #3]
     f6e:	071b      	lsls	r3, r3, #28
     f70:	d507      	bpl.n	f82 <usb_rx_memory+0x56>
			if (table[index(i, RX, EVEN)].desc == 0) {
     f72:	4b1c      	ldr	r3, [pc, #112]	; (fe4 <usb_rx_memory+0xb8>)
     f74:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
     f78:	b37a      	cbz	r2, fda <usb_rx_memory+0xae>
			if (table[index(i, RX, ODD)].desc == 0) {
     f7a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
     f7e:	2111      	movs	r1, #17
     f80:	b13a      	cbz	r2, f92 <usb_rx_memory+0x66>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
     f82:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
     f84:	4b18      	ldr	r3, [pc, #96]	; (fe8 <usb_rx_memory+0xbc>)
     f86:	2200      	movs	r2, #0
     f88:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
     f8a:	bc30      	pop	{r4, r5}
	usb_free(packet);
     f8c:	f000 be70 	b.w	1c70 <usb_free>
			if (table[index(i, RX, ODD)].desc == 0) {
     f90:	210d      	movs	r1, #13
				usb_rx_memory_needed--;
     f92:	4c15      	ldr	r4, [pc, #84]	; (fe8 <usb_rx_memory+0xbc>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
     f94:	4d15      	ldr	r5, [pc, #84]	; (fec <usb_rx_memory+0xc0>)
				usb_rx_memory_needed--;
     f96:	7822      	ldrb	r2, [r4, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
     f98:	f843 5031 	str.w	r5, [r3, r1, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
     f9c:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
     fa0:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
     fa2:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
     fa4:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
     fa6:	7022      	strb	r2, [r4, #0]
				__enable_irq();
     fa8:	b662      	cpsie	i
}
     faa:	bc30      	pop	{r4, r5}
     fac:	4770      	bx	lr
			if (table[index(i, RX, EVEN)].desc == 0) {
     fae:	2204      	movs	r2, #4
				usb_rx_memory_needed--;
     fb0:	4c0d      	ldr	r4, [pc, #52]	; (fe8 <usb_rx_memory+0xbc>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
     fb2:	4d0f      	ldr	r5, [pc, #60]	; (ff0 <usb_rx_memory+0xc4>)
				usb_rx_memory_needed--;
     fb4:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
     fb6:	f843 5032 	str.w	r5, [r3, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
     fba:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
     fbe:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
     fc0:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
     fc2:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
     fc4:	7022      	strb	r2, [r4, #0]
				__enable_irq();
     fc6:	b662      	cpsie	i
				return;
     fc8:	e7ef      	b.n	faa <usb_rx_memory+0x7e>
			if (table[index(i, RX, ODD)].desc == 0) {
     fca:	2105      	movs	r1, #5
     fcc:	e7e1      	b.n	f92 <usb_rx_memory+0x66>
     fce:	2109      	movs	r1, #9
     fd0:	e7df      	b.n	f92 <usb_rx_memory+0x66>
			if (table[index(i, RX, EVEN)].desc == 0) {
     fd2:	2208      	movs	r2, #8
     fd4:	e7ec      	b.n	fb0 <usb_rx_memory+0x84>
     fd6:	220c      	movs	r2, #12
     fd8:	e7ea      	b.n	fb0 <usb_rx_memory+0x84>
     fda:	2210      	movs	r2, #16
     fdc:	e7e8      	b.n	fb0 <usb_rx_memory+0x84>
     fde:	bf00      	nop
     fe0:	000038b0 	.word	0x000038b0
     fe4:	1fff8000 	.word	0x1fff8000
     fe8:	1fff9401 	.word	0x1fff9401
     fec:	004000c8 	.word	0x004000c8
     ff0:	00400088 	.word	0x00400088

00000ff4 <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
     ff4:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
     ff6:	2b03      	cmp	r3, #3
     ff8:	d81d      	bhi.n	1036 <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
     ffa:	4a1b      	ldr	r2, [pc, #108]	; (1068 <usb_tx+0x74>)
     ffc:	0140      	lsls	r0, r0, #5
     ffe:	f040 0010 	orr.w	r0, r0, #16
{
    1002:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    1004:	4410      	add	r0, r2
	__disable_irq();
    1006:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
    1008:	4c18      	ldr	r4, [pc, #96]	; (106c <usb_tx+0x78>)
    100a:	5ce2      	ldrb	r2, [r4, r3]
    100c:	2a03      	cmp	r2, #3
    100e:	d81b      	bhi.n	1048 <usb_tx+0x54>
    1010:	e8df f002 	tbb	[pc, r2]
    1014:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
    1018:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    101a:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
    101c:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    101e:	f010 0f08 	tst.w	r0, #8
    1022:	bf14      	ite	ne
    1024:	23c8      	movne	r3, #200	; 0xc8
    1026:	2388      	moveq	r3, #136	; 0x88
    1028:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
    102c:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    102e:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
    1030:	6041      	str	r1, [r0, #4]
	__enable_irq();
    1032:	b662      	cpsie	i
}
    1034:	bc30      	pop	{r4, r5}
    1036:	4770      	bx	lr
		b++;
    1038:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
    103a:	2202      	movs	r2, #2
		break;
    103c:	e7ed      	b.n	101a <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
    103e:	2205      	movs	r2, #5
    1040:	e7eb      	b.n	101a <usb_tx+0x26>
		b++;
    1042:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
    1044:	2204      	movs	r2, #4
		break;
    1046:	e7e8      	b.n	101a <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
    1048:	4a09      	ldr	r2, [pc, #36]	; (1070 <usb_tx+0x7c>)
    104a:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    104e:	b138      	cbz	r0, 1060 <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
    1050:	4a08      	ldr	r2, [pc, #32]	; (1074 <usb_tx+0x80>)
    1052:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    1056:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
    1058:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
    105c:	b662      	cpsie	i
		return;
    105e:	e7e9      	b.n	1034 <usb_tx+0x40>
			tx_first[endpoint] = packet;
    1060:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    1064:	4a03      	ldr	r2, [pc, #12]	; (1074 <usb_tx+0x80>)
    1066:	e7f7      	b.n	1058 <usb_tx+0x64>
    1068:	1fff8000 	.word	0x1fff8000
    106c:	1fff9410 	.word	0x1fff9410
    1070:	1fff93d8 	.word	0x1fff93d8
    1074:	1fff93e8 	.word	0x1fff93e8

00001078 <usb_isr>:
}



void usb_isr(void)
{
    1078:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
    107c:	f8df b30c 	ldr.w	fp, [pc, #780]	; 138c <usb_isr+0x314>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
    1080:	f8df a30c 	ldr.w	sl, [pc, #780]	; 1390 <usb_isr+0x318>
{
    1084:	b087      	sub	sp, #28
    1086:	e044      	b.n	1112 <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
    1088:	4fab      	ldr	r7, [pc, #684]	; (1338 <usb_isr+0x2c0>)
    108a:	ea4f 0893 	mov.w	r8, r3, lsr #2
    108e:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
    1092:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    1094:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
    1098:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
    109c:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    109e:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
    10a2:	f003 04ff 	and.w	r4, r3, #255	; 0xff
    10a6:	2b00      	cmp	r3, #0
    10a8:	f040 8102 	bne.w	12b0 <usb_isr+0x238>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
    10ac:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
    10b0:	0c1b      	lsrs	r3, r3, #16
    10b2:	b299      	uxth	r1, r3
    10b4:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
    10b8:	2b00      	cmp	r3, #0
    10ba:	f000 80f0 	beq.w	129e <usb_isr+0x226>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
    10be:	4b9f      	ldr	r3, [pc, #636]	; (133c <usb_isr+0x2c4>)
					packet->index = 0;
    10c0:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    10c4:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    10c8:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    10cc:	2a00      	cmp	r2, #0
    10ce:	f000 82c5 	beq.w	165c <usb_isr+0x5e4>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    10d2:	4d9b      	ldr	r5, [pc, #620]	; (1340 <usb_isr+0x2c8>)
    10d4:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    10d8:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    10da:	4c9a      	ldr	r4, [pc, #616]	; (1344 <usb_isr+0x2cc>)
					rx_last[endpoint] = packet;
    10dc:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    10e0:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    10e4:	4419      	add	r1, r3
    10e6:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    10ea:	f000 fda1 	bl	1c30 <usb_malloc>
					if (packet) {
    10ee:	2800      	cmp	r0, #0
    10f0:	f000 82ad 	beq.w	164e <usb_isr+0x5d6>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    10f4:	4a94      	ldr	r2, [pc, #592]	; (1348 <usb_isr+0x2d0>)
    10f6:	4b95      	ldr	r3, [pc, #596]	; (134c <usb_isr+0x2d4>)
    10f8:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    10fc:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    1100:	bf18      	it	ne
    1102:	4613      	movne	r3, r2
						b->addr = packet->buf;
    1104:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    1108:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    110c:	2308      	movs	r3, #8
    110e:	f88b 3000 	strb.w	r3, [fp]
	status = USB0_ISTAT;
    1112:	f89b 4000 	ldrb.w	r4, [fp]
    1116:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    1118:	0761      	lsls	r1, r4, #29
    111a:	d51a      	bpl.n	1152 <usb_isr+0xda>
		if (usb_configuration) {
    111c:	4b8c      	ldr	r3, [pc, #560]	; (1350 <usb_isr+0x2d8>)
    111e:	781b      	ldrb	r3, [r3, #0]
    1120:	b1a3      	cbz	r3, 114c <usb_isr+0xd4>
			t = usb_reboot_timer;
    1122:	498c      	ldr	r1, [pc, #560]	; (1354 <usb_isr+0x2dc>)
    1124:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    1126:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    112a:	b122      	cbz	r2, 1136 <usb_isr+0xbe>
				usb_reboot_timer = --t;
    112c:	3b01      	subs	r3, #1
    112e:	b2db      	uxtb	r3, r3
    1130:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    1132:	b903      	cbnz	r3, 1136 <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    1134:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    1136:	4988      	ldr	r1, [pc, #544]	; (1358 <usb_isr+0x2e0>)
    1138:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    113a:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    113e:	b12a      	cbz	r2, 114c <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    1140:	3b01      	subs	r3, #1
    1142:	b2db      	uxtb	r3, r3
    1144:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    1146:	2b00      	cmp	r3, #0
    1148:	f000 8257 	beq.w	15fa <usb_isr+0x582>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    114c:	2304      	movs	r3, #4
    114e:	f88b 3000 	strb.w	r3, [fp]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    1152:	f004 0308 	and.w	r3, r4, #8
    1156:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    115a:	2b00      	cmp	r3, #0
    115c:	f000 80cc 	beq.w	12f8 <usb_isr+0x280>
		stat = USB0_STAT;
    1160:	f89a 3000 	ldrb.w	r3, [sl]
    1164:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    1166:	091e      	lsrs	r6, r3, #4
    1168:	d18e      	bne.n	1088 <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    116a:	089c      	lsrs	r4, r3, #2
    116c:	f8df 91c8 	ldr.w	r9, [pc, #456]	; 1338 <usb_isr+0x2c0>
	switch (pid) {
    1170:	f859 2034 	ldr.w	r2, [r9, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    1174:	eb09 01c4 	add.w	r1, r9, r4, lsl #3
	switch (pid) {
    1178:	f3c2 0283 	ubfx	r2, r2, #2, #4
    117c:	3a01      	subs	r2, #1
	buf = b->addr;
    117e:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    1180:	2a0c      	cmp	r2, #12
    1182:	f200 8088 	bhi.w	1296 <usb_isr+0x21e>
    1186:	e8df f002 	tbb	[pc, r2]
    118a:	7c7c      	.short	0x7c7c
    118c:	86868686 	.word	0x86868686
    1190:	86478686 	.word	0x86478686
    1194:	8686      	.short	0x8686
    1196:	07          	.byte	0x07
    1197:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    1198:	6808      	ldr	r0, [r1, #0]
    119a:	4d70      	ldr	r5, [pc, #448]	; (135c <usb_isr+0x2e4>)
		setup.word2 = *(uint32_t *)(buf + 4);
    119c:	684a      	ldr	r2, [r1, #4]
		ep0_tx_ptr = NULL;
    119e:	4f70      	ldr	r7, [pc, #448]	; (1360 <usb_isr+0x2e8>)
		ep0_tx_data_toggle = 1;
    11a0:	4e70      	ldr	r6, [pc, #448]	; (1364 <usb_isr+0x2ec>)
		setup.word1 = *(uint32_t *)(buf);
    11a2:	6028      	str	r0, [r5, #0]
	switch (setup.wRequestAndType) {
    11a4:	b281      	uxth	r1, r0
    11a6:	f240 6081 	movw	r0, #1665	; 0x681
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    11aa:	4b67      	ldr	r3, [pc, #412]	; (1348 <usb_isr+0x2d0>)
		setup.word2 = *(uint32_t *)(buf + 4);
    11ac:	606a      	str	r2, [r5, #4]
		ep0_tx_data_toggle = 1;
    11ae:	f04f 0e01 	mov.w	lr, #1
		ep0_tx_ptr = NULL;
    11b2:	2200      	movs	r2, #0
	switch (setup.wRequestAndType) {
    11b4:	4281      	cmp	r1, r0
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    11b6:	f849 3034 	str.w	r3, [r9, r4, lsl #3]
		ep0_tx_ptr = NULL;
    11ba:	603a      	str	r2, [r7, #0]
		table[index(0, TX, EVEN)].desc = 0;
    11bc:	f8c9 2010 	str.w	r2, [r9, #16]
		table[index(0, TX, ODD)].desc = 0;
    11c0:	f8c9 2018 	str.w	r2, [r9, #24]
		ep0_tx_data_toggle = 1;
    11c4:	f886 e000 	strb.w	lr, [r6]
		table[index(0, TX, EVEN)].desc = 0;
    11c8:	4c5b      	ldr	r4, [pc, #364]	; (1338 <usb_isr+0x2c0>)
	switch (setup.wRequestAndType) {
    11ca:	f200 80e3 	bhi.w	1394 <usb_isr+0x31c>
    11ce:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    11d2:	f080 8346 	bcs.w	1862 <usb_isr+0x7ea>
    11d6:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    11da:	f000 82fc 	beq.w	17d6 <usb_isr+0x75e>
    11de:	f200 828d 	bhi.w	16fc <usb_isr+0x684>
    11e2:	2980      	cmp	r1, #128	; 0x80
    11e4:	f000 8377 	beq.w	18d6 <usb_isr+0x85e>
    11e8:	2982      	cmp	r1, #130	; 0x82
    11ea:	f040 82fa 	bne.w	17e2 <usb_isr+0x76a>
    11ee:	88a9      	ldrh	r1, [r5, #4]
    11f0:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    11f4:	2904      	cmp	r1, #4
    11f6:	f200 82f4 	bhi.w	17e2 <usb_isr+0x76a>
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    11fa:	485b      	ldr	r0, [pc, #364]	; (1368 <usb_isr+0x2f0>)
		reply_buffer[0] = 0;
    11fc:	4c5b      	ldr	r4, [pc, #364]	; (136c <usb_isr+0x2f4>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    11fe:	0089      	lsls	r1, r1, #2
    1200:	4408      	add	r0, r1
		reply_buffer[0] = 0;
    1202:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1204:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1206:	7802      	ldrb	r2, [r0, #0]
    1208:	0793      	lsls	r3, r2, #30
    120a:	f140 8455 	bpl.w	1ab8 <usb_isr+0xa40>
    120e:	f884 e000 	strb.w	lr, [r4]
		datalen = 2;
    1212:	f04f 0e02 	mov.w	lr, #2
    1216:	e342      	b.n	189e <usb_isr+0x826>
		data = ep0_tx_ptr;
    1218:	4f51      	ldr	r7, [pc, #324]	; (1360 <usb_isr+0x2e8>)
    121a:	683a      	ldr	r2, [r7, #0]
		if (data) {
    121c:	b332      	cbz	r2, 126c <usb_isr+0x1f4>
			size = ep0_tx_len;
    121e:	4b54      	ldr	r3, [pc, #336]	; (1370 <usb_isr+0x2f8>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1220:	4e50      	ldr	r6, [pc, #320]	; (1364 <usb_isr+0x2ec>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1222:	4954      	ldr	r1, [pc, #336]	; (1374 <usb_isr+0x2fc>)
			size = ep0_tx_len;
    1224:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1226:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1228:	780d      	ldrb	r5, [r1, #0]
    122a:	2840      	cmp	r0, #64	; 0x40
    122c:	4686      	mov	lr, r0
    122e:	f045 0802 	orr.w	r8, r5, #2
    1232:	bf28      	it	cs
    1234:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1238:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    123a:	f084 0401 	eor.w	r4, r4, #1
    123e:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    1240:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1244:	bf0c      	ite	eq
    1246:	2488      	moveq	r4, #136	; 0x88
    1248:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    124a:	eb09 06c8 	add.w	r6, r9, r8, lsl #3
			ep0_tx_len -= size;
    124e:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    1250:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1254:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1258:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    125a:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    125c:	f849 4038 	str.w	r4, [r9, r8, lsl #3]
			data += size;
    1260:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    1262:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    1264:	2800      	cmp	r0, #0
    1266:	f000 8145 	beq.w	14f4 <usb_isr+0x47c>
    126a:	603a      	str	r2, [r7, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    126c:	4b3b      	ldr	r3, [pc, #236]	; (135c <usb_isr+0x2e4>)
    126e:	881a      	ldrh	r2, [r3, #0]
    1270:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    1274:	d10f      	bne.n	1296 <usb_isr+0x21e>
			setup.bRequest = 0;
    1276:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    1278:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    127a:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    127c:	4b3e      	ldr	r3, [pc, #248]	; (1378 <usb_isr+0x300>)
    127e:	701a      	strb	r2, [r3, #0]
    1280:	e009      	b.n	1296 <usb_isr+0x21e>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    1282:	4a36      	ldr	r2, [pc, #216]	; (135c <usb_isr+0x2e4>)
    1284:	8810      	ldrh	r0, [r2, #0]
    1286:	f242 0221 	movw	r2, #8225	; 0x2021
    128a:	4290      	cmp	r0, r2
    128c:	f000 8137 	beq.w	14fe <usb_isr+0x486>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    1290:	4a2d      	ldr	r2, [pc, #180]	; (1348 <usb_isr+0x2d0>)
    1292:	f849 2034 	str.w	r2, [r9, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1296:	4a39      	ldr	r2, [pc, #228]	; (137c <usb_isr+0x304>)
    1298:	2301      	movs	r3, #1
    129a:	7013      	strb	r3, [r2, #0]
    129c:	e736      	b.n	110c <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    129e:	4a2a      	ldr	r2, [pc, #168]	; (1348 <usb_isr+0x2d0>)
    12a0:	4b2a      	ldr	r3, [pc, #168]	; (134c <usb_isr+0x2d4>)
    12a2:	f019 0f08 	tst.w	r9, #8
    12a6:	bf18      	it	ne
    12a8:	4613      	movne	r3, r2
    12aa:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    12ae:	e72d      	b.n	110c <usb_isr+0x94>
				usb_free(packet);
    12b0:	f000 fcde 	bl	1c70 <usb_free>
				packet = tx_first[endpoint];
    12b4:	4a32      	ldr	r2, [pc, #200]	; (1380 <usb_isr+0x308>)
					switch (tx_state[endpoint]) {
    12b6:	4933      	ldr	r1, [pc, #204]	; (1384 <usb_isr+0x30c>)
				packet = tx_first[endpoint];
    12b8:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    12bc:	2b00      	cmp	r3, #0
    12be:	f000 81d1 	beq.w	1664 <usb_isr+0x5ec>
					tx_first[endpoint] = packet->next;
    12c2:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    12c4:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    12c6:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    12ca:	f103 0208 	add.w	r2, r3, #8
    12ce:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    12d2:	2c03      	cmp	r4, #3
    12d4:	d805      	bhi.n	12e2 <usb_isr+0x26a>
    12d6:	e8df f004 	tbb	[pc, r4]
    12da:	022c      	.short	0x022c
    12dc:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    12de:	2202      	movs	r2, #2
    12e0:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    12e2:	881a      	ldrh	r2, [r3, #0]
    12e4:	f019 0f08 	tst.w	r9, #8
    12e8:	bf0c      	ite	eq
    12ea:	2388      	moveq	r3, #136	; 0x88
    12ec:	23c8      	movne	r3, #200	; 0xc8
    12ee:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    12f2:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    12f6:	e709      	b.n	110c <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    12f8:	07e0      	lsls	r0, r4, #31
    12fa:	f100 8181 	bmi.w	1600 <usb_isr+0x588>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    12fe:	0621      	lsls	r1, r4, #24
    1300:	f100 81f2 	bmi.w	16e8 <usb_isr+0x670>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1304:	07a2      	lsls	r2, r4, #30
    1306:	d506      	bpl.n	1316 <usb_isr+0x29e>
		uint8_t err = USB0_ERRSTAT;
    1308:	4a1f      	ldr	r2, [pc, #124]	; (1388 <usb_isr+0x310>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    130a:	4920      	ldr	r1, [pc, #128]	; (138c <usb_isr+0x314>)
		uint8_t err = USB0_ERRSTAT;
    130c:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    130e:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    1310:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    1312:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1314:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    1316:	06e3      	lsls	r3, r4, #27
    1318:	d502      	bpl.n	1320 <usb_isr+0x2a8>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    131a:	4b1c      	ldr	r3, [pc, #112]	; (138c <usb_isr+0x314>)
    131c:	2210      	movs	r2, #16
    131e:	701a      	strb	r2, [r3, #0]
	}

}
    1320:	b007      	add	sp, #28
    1322:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    1326:	2204      	movs	r2, #4
    1328:	558a      	strb	r2, [r1, r6]
						break;
    132a:	e7da      	b.n	12e2 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    132c:	2205      	movs	r2, #5
    132e:	558a      	strb	r2, [r1, r6]
						break;
    1330:	e7d7      	b.n	12e2 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    1332:	2203      	movs	r2, #3
    1334:	558a      	strb	r2, [r1, r6]
						break;
    1336:	e7d4      	b.n	12e2 <usb_isr+0x26a>
    1338:	1fff8000 	.word	0x1fff8000
    133c:	1fff9384 	.word	0x1fff9384
    1340:	1fff9330 	.word	0x1fff9330
    1344:	1fff9608 	.word	0x1fff9608
    1348:	004000c8 	.word	0x004000c8
    134c:	00400088 	.word	0x00400088
    1350:	1fff940c 	.word	0x1fff940c
    1354:	1fff9395 	.word	0x1fff9395
    1358:	1fff9414 	.word	0x1fff9414
    135c:	1fff93f8 	.word	0x1fff93f8
    1360:	1fff932c 	.word	0x1fff932c
    1364:	1fff9394 	.word	0x1fff9394
    1368:	400720c0 	.word	0x400720c0
    136c:	1fff9404 	.word	0x1fff9404
    1370:	1fff9340 	.word	0x1fff9340
    1374:	1fff9400 	.word	0x1fff9400
    1378:	40072098 	.word	0x40072098
    137c:	40072094 	.word	0x40072094
    1380:	1fff93d8 	.word	0x1fff93d8
    1384:	1fff9410 	.word	0x1fff9410
    1388:	40072088 	.word	0x40072088
    138c:	40072080 	.word	0x40072080
    1390:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    1394:	f242 0021 	movw	r0, #8225	; 0x2021
    1398:	4281      	cmp	r1, r0
    139a:	f000 812a 	beq.w	15f2 <usb_isr+0x57a>
    139e:	f200 80d8 	bhi.w	1552 <usb_isr+0x4da>
    13a2:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    13a6:	f000 8276 	beq.w	1896 <usb_isr+0x81e>
    13aa:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    13ae:	f040 8218 	bne.w	17e2 <usb_isr+0x76a>
			if (table[i].desc & BDT_OWN) {
    13b2:	6a22      	ldr	r2, [r4, #32]
		usb_configuration = setup.wValue;
    13b4:	49b3      	ldr	r1, [pc, #716]	; (1684 <usb_isr+0x60c>)
    13b6:	78a8      	ldrb	r0, [r5, #2]
    13b8:	7008      	strb	r0, [r1, #0]
			if (table[i].desc & BDT_OWN) {
    13ba:	0612      	lsls	r2, r2, #24
    13bc:	f100 8337 	bmi.w	1a2e <usb_isr+0x9b6>
    13c0:	f8d9 2028 	ldr.w	r2, [r9, #40]	; 0x28
    13c4:	49b0      	ldr	r1, [pc, #704]	; (1688 <usb_isr+0x610>)
    13c6:	0613      	lsls	r3, r2, #24
    13c8:	f100 832c 	bmi.w	1a24 <usb_isr+0x9ac>
    13cc:	f8d9 2030 	ldr.w	r2, [r9, #48]	; 0x30
    13d0:	49ad      	ldr	r1, [pc, #692]	; (1688 <usb_isr+0x610>)
    13d2:	0615      	lsls	r5, r2, #24
    13d4:	f100 82ff 	bmi.w	19d6 <usb_isr+0x95e>
    13d8:	f8d9 2038 	ldr.w	r2, [r9, #56]	; 0x38
    13dc:	49aa      	ldr	r1, [pc, #680]	; (1688 <usb_isr+0x610>)
    13de:	0614      	lsls	r4, r2, #24
    13e0:	f100 82f4 	bmi.w	19cc <usb_isr+0x954>
    13e4:	f8d9 2040 	ldr.w	r2, [r9, #64]	; 0x40
    13e8:	49a7      	ldr	r1, [pc, #668]	; (1688 <usb_isr+0x610>)
    13ea:	0610      	lsls	r0, r2, #24
    13ec:	f100 8347 	bmi.w	1a7e <usb_isr+0xa06>
    13f0:	f8d9 2048 	ldr.w	r2, [r9, #72]	; 0x48
    13f4:	49a4      	ldr	r1, [pc, #656]	; (1688 <usb_isr+0x610>)
    13f6:	0612      	lsls	r2, r2, #24
    13f8:	f100 833c 	bmi.w	1a74 <usb_isr+0x9fc>
    13fc:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
    1400:	49a1      	ldr	r1, [pc, #644]	; (1688 <usb_isr+0x610>)
    1402:	0613      	lsls	r3, r2, #24
    1404:	f100 8331 	bmi.w	1a6a <usb_isr+0x9f2>
    1408:	f8d9 2058 	ldr.w	r2, [r9, #88]	; 0x58
    140c:	499e      	ldr	r1, [pc, #632]	; (1688 <usb_isr+0x610>)
    140e:	0615      	lsls	r5, r2, #24
    1410:	f100 8326 	bmi.w	1a60 <usb_isr+0x9e8>
    1414:	f8d9 2060 	ldr.w	r2, [r9, #96]	; 0x60
    1418:	499b      	ldr	r1, [pc, #620]	; (1688 <usb_isr+0x610>)
    141a:	0614      	lsls	r4, r2, #24
    141c:	f100 831b 	bmi.w	1a56 <usb_isr+0x9de>
    1420:	f8d9 2068 	ldr.w	r2, [r9, #104]	; 0x68
    1424:	4998      	ldr	r1, [pc, #608]	; (1688 <usb_isr+0x610>)
    1426:	0610      	lsls	r0, r2, #24
    1428:	f100 8310 	bmi.w	1a4c <usb_isr+0x9d4>
    142c:	f8d9 2070 	ldr.w	r2, [r9, #112]	; 0x70
    1430:	4995      	ldr	r1, [pc, #596]	; (1688 <usb_isr+0x610>)
    1432:	0612      	lsls	r2, r2, #24
    1434:	f100 8305 	bmi.w	1a42 <usb_isr+0x9ca>
    1438:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    143c:	4992      	ldr	r1, [pc, #584]	; (1688 <usb_isr+0x610>)
    143e:	0613      	lsls	r3, r2, #24
    1440:	f100 82fa 	bmi.w	1a38 <usb_isr+0x9c0>
    1444:	f8d9 2080 	ldr.w	r2, [r9, #128]	; 0x80
    1448:	498f      	ldr	r1, [pc, #572]	; (1688 <usb_isr+0x610>)
    144a:	0615      	lsls	r5, r2, #24
    144c:	f100 832e 	bmi.w	1aac <usb_isr+0xa34>
    1450:	f8d9 2088 	ldr.w	r2, [r9, #136]	; 0x88
    1454:	498c      	ldr	r1, [pc, #560]	; (1688 <usb_isr+0x610>)
    1456:	0614      	lsls	r4, r2, #24
    1458:	f100 8322 	bmi.w	1aa0 <usb_isr+0xa28>
    145c:	f8d9 2090 	ldr.w	r2, [r9, #144]	; 0x90
    1460:	4989      	ldr	r1, [pc, #548]	; (1688 <usb_isr+0x610>)
    1462:	0610      	lsls	r0, r2, #24
    1464:	f100 8316 	bmi.w	1a94 <usb_isr+0xa1c>
    1468:	f8d9 2098 	ldr.w	r2, [r9, #152]	; 0x98
    146c:	4986      	ldr	r1, [pc, #536]	; (1688 <usb_isr+0x610>)
    146e:	0612      	lsls	r2, r2, #24
    1470:	f100 830a 	bmi.w	1a88 <usb_isr+0xa10>
    1474:	4885      	ldr	r0, [pc, #532]	; (168c <usb_isr+0x614>)
    1476:	4a86      	ldr	r2, [pc, #536]	; (1690 <usb_isr+0x618>)
    1478:	4986      	ldr	r1, [pc, #536]	; (1694 <usb_isr+0x61c>)
    147a:	9001      	str	r0, [sp, #4]
    147c:	4886      	ldr	r0, [pc, #536]	; (1698 <usb_isr+0x620>)
    147e:	4c87      	ldr	r4, [pc, #540]	; (169c <usb_isr+0x624>)
    1480:	4d87      	ldr	r5, [pc, #540]	; (16a0 <usb_isr+0x628>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1482:	9402      	str	r4, [sp, #8]
{
    1484:	2300      	movs	r3, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1486:	9704      	str	r7, [sp, #16]
    1488:	9605      	str	r6, [sp, #20]
    148a:	4680      	mov	r8, r0
    148c:	461c      	mov	r4, r3
    148e:	460f      	mov	r7, r1
    1490:	4616      	mov	r6, r2
    1492:	9503      	str	r5, [sp, #12]
			p = rx_first[i];
    1494:	6830      	ldr	r0, [r6, #0]
			while (p) {
    1496:	b128      	cbz	r0, 14a4 <usb_isr+0x42c>
				n = p->next;
    1498:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    149a:	f000 fbe9 	bl	1c70 <usb_free>
			while (p) {
    149e:	4628      	mov	r0, r5
    14a0:	2d00      	cmp	r5, #0
    14a2:	d1f9      	bne.n	1498 <usb_isr+0x420>
			rx_first[i] = NULL;
    14a4:	2300      	movs	r3, #0
    14a6:	6033      	str	r3, [r6, #0]
			rx_last[i] = NULL;
    14a8:	9b03      	ldr	r3, [sp, #12]
			p = tx_first[i];
    14aa:	6838      	ldr	r0, [r7, #0]
			rx_last[i] = NULL;
    14ac:	461a      	mov	r2, r3
    14ae:	2300      	movs	r3, #0
    14b0:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
			while (p) {
    14b4:	b128      	cbz	r0, 14c2 <usb_isr+0x44a>
				n = p->next;
    14b6:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    14b8:	f000 fbda 	bl	1c70 <usb_free>
			while (p) {
    14bc:	4628      	mov	r0, r5
    14be:	2d00      	cmp	r5, #0
    14c0:	d1f9      	bne.n	14b6 <usb_isr+0x43e>
			tx_first[i] = NULL;
    14c2:	2200      	movs	r2, #0
    14c4:	603a      	str	r2, [r7, #0]
			tx_last[i] = NULL;
    14c6:	9a01      	ldr	r2, [sp, #4]
			switch (tx_state[i]) {
    14c8:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    14cc:	4611      	mov	r1, r2
    14ce:	2200      	movs	r2, #0
    14d0:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    14d4:	9a02      	ldr	r2, [sp, #8]
			tx_last[i] = NULL;
    14d6:	9101      	str	r1, [sp, #4]
			switch (tx_state[i]) {
    14d8:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    14da:	f04f 0100 	mov.w	r1, #0
    14de:	f822 1014 	strh.w	r1, [r2, r4, lsl #1]
			switch (tx_state[i]) {
    14e2:	2b03      	cmp	r3, #3
    14e4:	f200 812b 	bhi.w	173e <usb_isr+0x6c6>
    14e8:	e8df f013 	tbh	[pc, r3, lsl #1]
    14ec:	01250170 	.word	0x01250170
    14f0:	01250170 	.word	0x01250170
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    14f4:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    14f8:	bf18      	it	ne
    14fa:	2200      	movne	r2, #0
    14fc:	e6b5      	b.n	126a <usb_isr+0x1f2>
				*dst++ = *buf++;
    14fe:	4a69      	ldr	r2, [pc, #420]	; (16a4 <usb_isr+0x62c>)
    1500:	780d      	ldrb	r5, [r1, #0]
    1502:	7848      	ldrb	r0, [r1, #1]
    1504:	7015      	strb	r5, [r2, #0]
    1506:	7050      	strb	r0, [r2, #1]
    1508:	788d      	ldrb	r5, [r1, #2]
    150a:	78c8      	ldrb	r0, [r1, #3]
    150c:	7095      	strb	r5, [r2, #2]
    150e:	70d0      	strb	r0, [r2, #3]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1510:	6810      	ldr	r0, [r2, #0]
				*dst++ = *buf++;
    1512:	790d      	ldrb	r5, [r1, #4]
    1514:	7115      	strb	r5, [r2, #4]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1516:	2886      	cmp	r0, #134	; 0x86
				*dst++ = *buf++;
    1518:	794d      	ldrb	r5, [r1, #5]
    151a:	7989      	ldrb	r1, [r1, #6]
    151c:	7155      	strb	r5, [r2, #5]
    151e:	7191      	strb	r1, [r2, #6]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1520:	f000 819b 	beq.w	185a <usb_isr+0x7e2>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1524:	4960      	ldr	r1, [pc, #384]	; (16a8 <usb_isr+0x630>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1526:	4e61      	ldr	r6, [pc, #388]	; (16ac <usb_isr+0x634>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1528:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    152a:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    152c:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1530:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1532:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    1536:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1538:	bf0c      	ite	eq
    153a:	2188      	moveq	r1, #136	; 0x88
    153c:	21c8      	movne	r1, #200	; 0xc8
    153e:	f849 1032 	str.w	r1, [r9, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1542:	eb09 02c2 	add.w	r2, r9, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    1546:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    154a:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    154c:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    154e:	6051      	str	r1, [r2, #4]
    1550:	e69e      	b.n	1290 <usb_isr+0x218>
	switch (setup.wRequestAndType) {
    1552:	f242 2021 	movw	r0, #8737	; 0x2221
    1556:	4281      	cmp	r1, r0
    1558:	f040 81cb 	bne.w	18f2 <usb_isr+0x87a>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    155c:	4b54      	ldr	r3, [pc, #336]	; (16b0 <usb_isr+0x638>)
    155e:	4c55      	ldr	r4, [pc, #340]	; (16b4 <usb_isr+0x63c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    1560:	4955      	ldr	r1, [pc, #340]	; (16b8 <usb_isr+0x640>)
    1562:	78a8      	ldrb	r0, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    1564:	681d      	ldr	r5, [r3, #0]
    1566:	6025      	str	r5, [r4, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    1568:	f8cd e004 	str.w	lr, [sp, #4]
    156c:	7008      	strb	r0, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    156e:	2000      	movs	r0, #0
    1570:	9002      	str	r0, [sp, #8]
    1572:	4680      	mov	r8, r0
    1574:	4684      	mov	ip, r0
    1576:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1578:	494b      	ldr	r1, [pc, #300]	; (16a8 <usb_isr+0x630>)
    157a:	780d      	ldrb	r5, [r1, #0]
    157c:	f045 0e02 	orr.w	lr, r5, #2
    1580:	eb09 03ce 	add.w	r3, r9, lr, lsl #3
    1584:	9303      	str	r3, [sp, #12]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1586:	9b01      	ldr	r3, [sp, #4]
    1588:	2b00      	cmp	r3, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    158a:	9b03      	ldr	r3, [sp, #12]
    158c:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    158e:	bf0c      	ite	eq
    1590:	2488      	moveq	r4, #136	; 0x88
    1592:	24c8      	movne	r4, #200	; 0xc8
    1594:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    1598:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    159c:	f849 303e 	str.w	r3, [r9, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    15a0:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    15a2:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15a4:	f8df e0e0 	ldr.w	lr, [pc, #224]	; 1688 <usb_isr+0x610>
	ep0_tx_data_toggle ^= 1;
    15a8:	4b40      	ldr	r3, [pc, #256]	; (16ac <usb_isr+0x634>)
	ep0_tx_bdt_bank ^= 1;
    15aa:	f8df 80fc 	ldr.w	r8, [pc, #252]	; 16a8 <usb_isr+0x630>
	if (datalen == 0 && size < EP0_SIZE) return;
    15ae:	2800      	cmp	r0, #0
    15b0:	f040 811e 	bne.w	17f0 <usb_isr+0x778>
    15b4:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    15b8:	d11b      	bne.n	15f2 <usb_isr+0x57a>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    15ba:	f044 0c02 	orr.w	ip, r4, #2
    15be:	eb09 03cc 	add.w	r3, r9, ip, lsl #3
    15c2:	9c02      	ldr	r4, [sp, #8]
    15c4:	f8df e0c0 	ldr.w	lr, [pc, #192]	; 1688 <usb_isr+0x610>
    15c8:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15ca:	2a00      	cmp	r2, #0
    15cc:	f040 8126 	bne.w	181c <usb_isr+0x7a4>
    15d0:	0402      	lsls	r2, r0, #16
    15d2:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	ep0_tx_data_toggle ^= 1;
    15d6:	f89d 3004 	ldrb.w	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15da:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
	data += size;
    15de:	4404      	add	r4, r0
	ep0_tx_data_toggle ^= 1;
    15e0:	7033      	strb	r3, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    15e2:	700d      	strb	r5, [r1, #0]
	data += size;
    15e4:	4623      	mov	r3, r4
	if (datalen == 0 && size < EP0_SIZE) return;
    15e6:	2840      	cmp	r0, #64	; 0x40
    15e8:	d103      	bne.n	15f2 <usb_isr+0x57a>
    15ea:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    15ec:	4a33      	ldr	r2, [pc, #204]	; (16bc <usb_isr+0x644>)
	ep0_tx_ptr = data;
    15ee:	603b      	str	r3, [r7, #0]
	ep0_tx_len = datalen;
    15f0:	8010      	strh	r0, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    15f2:	4a33      	ldr	r2, [pc, #204]	; (16c0 <usb_isr+0x648>)
    15f4:	2301      	movs	r3, #1
    15f6:	7013      	strb	r3, [r2, #0]
    15f8:	e64d      	b.n	1296 <usb_isr+0x21e>
				if (t == 0) usb_serial_flush_callback();
    15fa:	f000 fcf5 	bl	1fe8 <usb_serial_flush_callback>
    15fe:	e5a5      	b.n	114c <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1600:	4b21      	ldr	r3, [pc, #132]	; (1688 <usb_isr+0x610>)
		USB0_CTL = USB_CTL_ODDRST;
    1602:	482f      	ldr	r0, [pc, #188]	; (16c0 <usb_isr+0x648>)
		ep0_tx_bdt_bank = 0;
    1604:	4928      	ldr	r1, [pc, #160]	; (16a8 <usb_isr+0x630>)
		table[index(0, TX, EVEN)].desc = 0;
    1606:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    1608:	f04f 0e02 	mov.w	lr, #2
    160c:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1610:	4f2c      	ldr	r7, [pc, #176]	; (16c4 <usb_isr+0x64c>)
		ep0_tx_bdt_bank = 0;
    1612:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1614:	492c      	ldr	r1, [pc, #176]	; (16c8 <usb_isr+0x650>)
    1616:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    1618:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    161a:	4e2c      	ldr	r6, [pc, #176]	; (16cc <usb_isr+0x654>)
		USB0_ISTAT = 0xFF;
    161c:	4d2c      	ldr	r5, [pc, #176]	; (16d0 <usb_isr+0x658>)
		USB0_ADDR = 0;
    161e:	4c2d      	ldr	r4, [pc, #180]	; (16d4 <usb_isr+0x65c>)
		table[index(0, TX, ODD)].desc = 0;
    1620:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1622:	210d      	movs	r1, #13
    1624:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    1626:	21ff      	movs	r1, #255	; 0xff
    1628:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    162a:	f8df e0b8 	ldr.w	lr, [pc, #184]	; 16e4 <usb_isr+0x66c>
		USB0_ISTAT = 0xFF;
    162e:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    1630:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1632:	4d29      	ldr	r5, [pc, #164]	; (16d8 <usb_isr+0x660>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1634:	4a29      	ldr	r2, [pc, #164]	; (16dc <usb_isr+0x664>)
		USB0_ERREN = 0xFF;
    1636:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    163a:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    163c:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    163e:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1642:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    1644:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1646:	60da      	str	r2, [r3, #12]
}
    1648:	b007      	add	sp, #28
    164a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    164e:	4a24      	ldr	r2, [pc, #144]	; (16e0 <usb_isr+0x668>)
						b->desc = 0;
    1650:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    1654:	7813      	ldrb	r3, [r2, #0]
    1656:	3301      	adds	r3, #1
    1658:	7013      	strb	r3, [r2, #0]
    165a:	e557      	b.n	110c <usb_isr+0x94>
						rx_first[endpoint] = packet;
    165c:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    1660:	4d0f      	ldr	r5, [pc, #60]	; (16a0 <usb_isr+0x628>)
    1662:	e53a      	b.n	10da <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    1664:	5d8b      	ldrb	r3, [r1, r6]
    1666:	2b03      	cmp	r3, #3
    1668:	f200 80f0 	bhi.w	184c <usb_isr+0x7d4>
    166c:	a201      	add	r2, pc, #4	; (adr r2, 1674 <usb_isr+0x5fc>)
    166e:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1672:	bf00      	nop
    1674:	0000110d 	.word	0x0000110d
    1678:	0000110d 	.word	0x0000110d
    167c:	00001731 	.word	0x00001731
    1680:	0000172b 	.word	0x0000172b
    1684:	1fff940c 	.word	0x1fff940c
    1688:	1fff8000 	.word	0x1fff8000
    168c:	1fff93e8 	.word	0x1fff93e8
    1690:	1fff9384 	.word	0x1fff9384
    1694:	1fff93d8 	.word	0x1fff93d8
    1698:	1fff9410 	.word	0x1fff9410
    169c:	1fff9608 	.word	0x1fff9608
    16a0:	1fff9330 	.word	0x1fff9330
    16a4:	1fff9610 	.word	0x1fff9610
    16a8:	1fff9400 	.word	0x1fff9400
    16ac:	1fff9394 	.word	0x1fff9394
    16b0:	1fff9328 	.word	0x1fff9328
    16b4:	1fff9618 	.word	0x1fff9618
    16b8:	1fff9424 	.word	0x1fff9424
    16bc:	1fff9340 	.word	0x1fff9340
    16c0:	40072094 	.word	0x40072094
    16c4:	400720c0 	.word	0x400720c0
    16c8:	00400088 	.word	0x00400088
    16cc:	40072088 	.word	0x40072088
    16d0:	40072080 	.word	0x40072080
    16d4:	40072098 	.word	0x40072098
    16d8:	1fff9344 	.word	0x1fff9344
    16dc:	1fff9398 	.word	0x1fff9398
    16e0:	1fff9401 	.word	0x1fff9401
    16e4:	4007208c 	.word	0x4007208c
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    16e8:	49bd      	ldr	r1, [pc, #756]	; (19e0 <usb_isr+0x968>)
		USB0_ISTAT = USB_ISTAT_STALL;
    16ea:	4bbe      	ldr	r3, [pc, #760]	; (19e4 <usb_isr+0x96c>)
    16ec:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    16ee:	200d      	movs	r0, #13
    16f0:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    16f2:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    16f4:	07a2      	lsls	r2, r4, #30
    16f6:	f57f ae0e 	bpl.w	1316 <usb_isr+0x29e>
    16fa:	e605      	b.n	1308 <usb_isr+0x290>
	switch (setup.wRequestAndType) {
    16fc:	f240 3202 	movw	r2, #770	; 0x302
    1700:	4291      	cmp	r1, r2
    1702:	f040 80ee 	bne.w	18e2 <usb_isr+0x86a>
    1706:	88a9      	ldrh	r1, [r5, #4]
    1708:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    170c:	2904      	cmp	r1, #4
    170e:	d868      	bhi.n	17e2 <usb_isr+0x76a>
    1710:	886a      	ldrh	r2, [r5, #2]
    1712:	2a00      	cmp	r2, #0
    1714:	d165      	bne.n	17e2 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    1716:	48b2      	ldr	r0, [pc, #712]	; (19e0 <usb_isr+0x968>)
    1718:	f8cd e004 	str.w	lr, [sp, #4]
    171c:	0089      	lsls	r1, r1, #2
    171e:	4408      	add	r0, r1
    1720:	7801      	ldrb	r1, [r0, #0]
    1722:	f041 0102 	orr.w	r1, r1, #2
    1726:	7001      	strb	r1, [r0, #0]
    1728:	e721      	b.n	156e <usb_isr+0x4f6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    172a:	2301      	movs	r3, #1
    172c:	558b      	strb	r3, [r1, r6]
						break;
    172e:	e4ed      	b.n	110c <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1730:	2300      	movs	r3, #0
    1732:	558b      	strb	r3, [r1, r6]
						break;
    1734:	e4ea      	b.n	110c <usb_isr+0x94>
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1736:	f04f 0301 	mov.w	r3, #1
    173a:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    173e:	3401      	adds	r4, #1
    1740:	2c04      	cmp	r4, #4
    1742:	f106 0604 	add.w	r6, r6, #4
    1746:	f107 0704 	add.w	r7, r7, #4
    174a:	f108 0801 	add.w	r8, r8, #1
    174e:	f47f aea1 	bne.w	1494 <usb_isr+0x41c>
			epconf = *cfg++;
    1752:	4ca5      	ldr	r4, [pc, #660]	; (19e8 <usb_isr+0x970>)
			*reg = epconf;
    1754:	4ba5      	ldr	r3, [pc, #660]	; (19ec <usb_isr+0x974>)
			epconf = *cfg++;
    1756:	7822      	ldrb	r2, [r4, #0]
		usb_rx_memory_needed = 0;
    1758:	4da5      	ldr	r5, [pc, #660]	; (19f0 <usb_isr+0x978>)
    175a:	9f04      	ldr	r7, [sp, #16]
    175c:	9e05      	ldr	r6, [sp, #20]
    175e:	2100      	movs	r1, #0
    1760:	7029      	strb	r1, [r5, #0]
			*reg = epconf;
    1762:	701a      	strb	r2, [r3, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    1764:	0713      	lsls	r3, r2, #28
    1766:	f100 8105 	bmi.w	1974 <usb_isr+0x8fc>
			epconf = *cfg++;
    176a:	7862      	ldrb	r2, [r4, #1]
			*reg = epconf;
    176c:	49a1      	ldr	r1, [pc, #644]	; (19f4 <usb_isr+0x97c>)
			table[index(i, TX, EVEN)].desc = 0;
    176e:	f8df 8290 	ldr.w	r8, [pc, #656]	; 1a00 <usb_isr+0x988>
			*reg = epconf;
    1772:	700a      	strb	r2, [r1, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    1774:	0710      	lsls	r0, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1776:	f04f 0100 	mov.w	r1, #0
    177a:	f8c9 1030 	str.w	r1, [r9, #48]	; 0x30
			table[index(i, TX, ODD)].desc = 0;
    177e:	f8c9 1038 	str.w	r1, [r9, #56]	; 0x38
			if (epconf & USB_ENDPT_EPRXEN) {
    1782:	f100 80e1 	bmi.w	1948 <usb_isr+0x8d0>
			*reg = epconf;
    1786:	499c      	ldr	r1, [pc, #624]	; (19f8 <usb_isr+0x980>)
			epconf = *cfg++;
    1788:	78a2      	ldrb	r2, [r4, #2]
			*reg = epconf;
    178a:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    178c:	2100      	movs	r1, #0
    178e:	f8c9 1050 	str.w	r1, [r9, #80]	; 0x50
			table[index(i, TX, ODD)].desc = 0;
    1792:	f8c9 1058 	str.w	r1, [r9, #88]	; 0x58
			if (epconf & USB_ENDPT_EPRXEN) {
    1796:	0711      	lsls	r1, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1798:	f8df 8264 	ldr.w	r8, [pc, #612]	; 1a00 <usb_isr+0x988>
			if (epconf & USB_ENDPT_EPRXEN) {
    179c:	f100 8100 	bmi.w	19a0 <usb_isr+0x928>
			epconf = *cfg++;
    17a0:	78e2      	ldrb	r2, [r4, #3]
			*reg = epconf;
    17a2:	4996      	ldr	r1, [pc, #600]	; (19fc <usb_isr+0x984>)
			table[index(i, TX, EVEN)].desc = 0;
    17a4:	4c96      	ldr	r4, [pc, #600]	; (1a00 <usb_isr+0x988>)
			*reg = epconf;
    17a6:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    17a8:	2100      	movs	r1, #0
			if (epconf & USB_ENDPT_EPRXEN) {
    17aa:	0712      	lsls	r2, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    17ac:	f8c9 1070 	str.w	r1, [r9, #112]	; 0x70
			table[index(i, TX, ODD)].desc = 0;
    17b0:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
			if (epconf & USB_ENDPT_EPRXEN) {
    17b4:	f100 80b0 	bmi.w	1918 <usb_isr+0x8a0>
    17b8:	7833      	ldrb	r3, [r6, #0]
    17ba:	9301      	str	r3, [sp, #4]
			table[index(i, TX, EVEN)].desc = 0;
    17bc:	2100      	movs	r1, #0
    17be:	f083 0201 	eor.w	r2, r3, #1
    17c2:	f8c9 1090 	str.w	r1, [r9, #144]	; 0x90
			table[index(i, TX, ODD)].desc = 0;
    17c6:	f8c9 1098 	str.w	r1, [r9, #152]	; 0x98
    17ca:	e6d0      	b.n	156e <usb_isr+0x4f6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    17cc:	f04f 0300 	mov.w	r3, #0
    17d0:	f888 3000 	strb.w	r3, [r8]
    17d4:	e7b3      	b.n	173e <usb_isr+0x6c6>
    17d6:	88a9      	ldrh	r1, [r5, #4]
    17d8:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    17dc:	2904      	cmp	r1, #4
    17de:	f240 808d 	bls.w	18fc <usb_isr+0x884>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    17e2:	4a7f      	ldr	r2, [pc, #508]	; (19e0 <usb_isr+0x968>)
    17e4:	230f      	movs	r3, #15
    17e6:	7013      	strb	r3, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    17e8:	4a86      	ldr	r2, [pc, #536]	; (1a04 <usb_isr+0x98c>)
    17ea:	2301      	movs	r3, #1
    17ec:	7013      	strb	r3, [r2, #0]
    17ee:	e552      	b.n	1296 <usb_isr+0x21e>
	if (size > EP0_SIZE) size = EP0_SIZE;
    17f0:	2840      	cmp	r0, #64	; 0x40
    17f2:	f67f aee2 	bls.w	15ba <usb_isr+0x542>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    17f6:	f044 0402 	orr.w	r4, r4, #2
    17fa:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    17fe:	9e02      	ldr	r6, [sp, #8]
    1800:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1802:	b1ba      	cbz	r2, 1834 <usb_isr+0x7bc>
	ep0_tx_data_toggle ^= 1;
    1804:	f89d 1004 	ldrb.w	r1, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1808:	4a7f      	ldr	r2, [pc, #508]	; (1a08 <usb_isr+0x990>)
	ep0_tx_data_toggle ^= 1;
    180a:	7019      	strb	r1, [r3, #0]
	data += size;
    180c:	4633      	mov	r3, r6
    180e:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    1810:	f888 5000 	strb.w	r5, [r8]
	data += size;
    1814:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1816:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    181a:	e6e7      	b.n	15ec <usb_isr+0x574>
	ep0_tx_data_toggle ^= 1;
    181c:	f89d 3004 	ldrb.w	r3, [sp, #4]
    1820:	7033      	strb	r3, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1822:	0402      	lsls	r2, r0, #16
	data += size;
    1824:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_bdt_bank ^= 1;
    1826:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1828:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	data += size;
    182c:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    182e:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
    1832:	e6d8      	b.n	15e6 <usb_isr+0x56e>
	ep0_tx_data_toggle ^= 1;
    1834:	f89d 1004 	ldrb.w	r1, [sp, #4]
    1838:	7019      	strb	r1, [r3, #0]
	data += size;
    183a:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    183c:	4a73      	ldr	r2, [pc, #460]	; (1a0c <usb_isr+0x994>)
	ep0_tx_bdt_bank ^= 1;
    183e:	f888 5000 	strb.w	r5, [r8]
    1842:	3840      	subs	r0, #64	; 0x40
	data += size;
    1844:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1846:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    184a:	e6cf      	b.n	15ec <usb_isr+0x574>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    184c:	f019 0f08 	tst.w	r9, #8
    1850:	bf0c      	ite	eq
    1852:	2302      	moveq	r3, #2
    1854:	2303      	movne	r3, #3
    1856:	558b      	strb	r3, [r1, r6]
						break;
    1858:	e458      	b.n	110c <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    185a:	4a6d      	ldr	r2, [pc, #436]	; (1a10 <usb_isr+0x998>)
    185c:	210f      	movs	r1, #15
    185e:	7011      	strb	r1, [r2, #0]
    1860:	e660      	b.n	1524 <usb_isr+0x4ac>
			if (list->addr == NULL) break;
    1862:	4a6c      	ldr	r2, [pc, #432]	; (1a14 <usb_isr+0x99c>)
    1864:	6854      	ldr	r4, [r2, #4]
    1866:	2c00      	cmp	r4, #0
    1868:	d0bb      	beq.n	17e2 <usb_isr+0x76a>
    186a:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    186c:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    1870:	e003      	b.n	187a <usb_isr+0x802>
		for (list = usb_descriptor_list; 1; list++) {
    1872:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    1874:	6854      	ldr	r4, [r2, #4]
    1876:	2c00      	cmp	r4, #0
    1878:	d0b3      	beq.n	17e2 <usb_isr+0x76a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    187a:	8813      	ldrh	r3, [r2, #0]
    187c:	4283      	cmp	r3, r0
    187e:	d1f8      	bne.n	1872 <usb_isr+0x7fa>
    1880:	8853      	ldrh	r3, [r2, #2]
    1882:	4573      	cmp	r3, lr
    1884:	d1f5      	bne.n	1872 <usb_isr+0x7fa>
				if ((setup.wValue >> 8) == 3) {
    1886:	0a00      	lsrs	r0, r0, #8
    1888:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    188a:	bf0c      	ite	eq
    188c:	f894 e000 	ldrbeq.w	lr, [r4]
					datalen = list->length;
    1890:	f8b2 e008 	ldrhne.w	lr, [r2, #8]
    1894:	e003      	b.n	189e <usb_isr+0x826>
		reply_buffer[0] = usb_configuration;
    1896:	4a60      	ldr	r2, [pc, #384]	; (1a18 <usb_isr+0x9a0>)
    1898:	4c60      	ldr	r4, [pc, #384]	; (1a1c <usb_isr+0x9a4>)
    189a:	7812      	ldrb	r2, [r2, #0]
    189c:	7022      	strb	r2, [r4, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    189e:	88e8      	ldrh	r0, [r5, #6]
    18a0:	4570      	cmp	r0, lr
    18a2:	f080 8131 	bcs.w	1b08 <usb_isr+0xa90>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    18a6:	495e      	ldr	r1, [pc, #376]	; (1a20 <usb_isr+0x9a8>)
    18a8:	780d      	ldrb	r5, [r1, #0]
    18aa:	2840      	cmp	r0, #64	; 0x40
    18ac:	4684      	mov	ip, r0
    18ae:	f045 0e02 	orr.w	lr, r5, #2
    18b2:	bf28      	it	cs
    18b4:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    18b8:	eb04 030c 	add.w	r3, r4, ip
    18bc:	eb09 02ce 	add.w	r2, r9, lr, lsl #3
    18c0:	9302      	str	r3, [sp, #8]
    18c2:	2301      	movs	r3, #1
    18c4:	6054      	str	r4, [r2, #4]
    18c6:	ebcc 0000 	rsb	r0, ip, r0
    18ca:	ea4f 480c 	mov.w	r8, ip, lsl #16
    18ce:	2200      	movs	r2, #0
    18d0:	9301      	str	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    18d2:	24c8      	movs	r4, #200	; 0xc8
    18d4:	e65e      	b.n	1594 <usb_isr+0x51c>
		reply_buffer[0] = 0;
    18d6:	4c51      	ldr	r4, [pc, #324]	; (1a1c <usb_isr+0x9a4>)
		datalen = 2;
    18d8:	f04f 0e02 	mov.w	lr, #2
		reply_buffer[0] = 0;
    18dc:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    18de:	7062      	strb	r2, [r4, #1]
    18e0:	e7dd      	b.n	189e <usb_isr+0x826>
	switch (setup.wRequestAndType) {
    18e2:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    18e6:	f47f af7c 	bne.w	17e2 <usb_isr+0x76a>
    18ea:	2301      	movs	r3, #1
    18ec:	2200      	movs	r2, #0
    18ee:	9301      	str	r3, [sp, #4]
    18f0:	e63d      	b.n	156e <usb_isr+0x4f6>
    18f2:	f242 3221 	movw	r2, #8993	; 0x2321
    18f6:	4291      	cmp	r1, r2
    18f8:	d0f7      	beq.n	18ea <usb_isr+0x872>
    18fa:	e772      	b.n	17e2 <usb_isr+0x76a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    18fc:	886a      	ldrh	r2, [r5, #2]
    18fe:	2a00      	cmp	r2, #0
    1900:	f47f af6f 	bne.w	17e2 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    1904:	4836      	ldr	r0, [pc, #216]	; (19e0 <usb_isr+0x968>)
    1906:	f8cd e004 	str.w	lr, [sp, #4]
    190a:	0089      	lsls	r1, r1, #2
    190c:	4408      	add	r0, r1
    190e:	7801      	ldrb	r1, [r0, #0]
    1910:	f021 0102 	bic.w	r1, r1, #2
    1914:	7001      	strb	r1, [r0, #0]
    1916:	e62a      	b.n	156e <usb_isr+0x4f6>
				p = usb_malloc();
    1918:	f000 f98a 	bl	1c30 <usb_malloc>
				if (p) {
    191c:	2800      	cmp	r0, #0
    191e:	f000 80e6 	beq.w	1aee <usb_isr+0xa76>
					table[index(i, RX, EVEN)].addr = p->buf;
    1922:	3008      	adds	r0, #8
    1924:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1928:	4838      	ldr	r0, [pc, #224]	; (1a0c <usb_isr+0x994>)
    192a:	f8c9 0080 	str.w	r0, [r9, #128]	; 0x80
				p = usb_malloc();
    192e:	f000 f97f 	bl	1c30 <usb_malloc>
    1932:	4a33      	ldr	r2, [pc, #204]	; (1a00 <usb_isr+0x988>)
				if (p) {
    1934:	2800      	cmp	r0, #0
    1936:	f000 80d4 	beq.w	1ae2 <usb_isr+0xa6a>
					table[index(i, RX, ODD)].addr = p->buf;
    193a:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    193c:	4932      	ldr	r1, [pc, #200]	; (1a08 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    193e:	f8c2 008c 	str.w	r0, [r2, #140]	; 0x8c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1942:	f8c2 1088 	str.w	r1, [r2, #136]	; 0x88
    1946:	e737      	b.n	17b8 <usb_isr+0x740>
				p = usb_malloc();
    1948:	f000 f972 	bl	1c30 <usb_malloc>
				if (p) {
    194c:	2800      	cmp	r0, #0
    194e:	f000 80bb 	beq.w	1ac8 <usb_isr+0xa50>
					table[index(i, RX, EVEN)].addr = p->buf;
    1952:	3008      	adds	r0, #8
    1954:	f8c8 0044 	str.w	r0, [r8, #68]	; 0x44
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1958:	482c      	ldr	r0, [pc, #176]	; (1a0c <usb_isr+0x994>)
    195a:	f8c9 0040 	str.w	r0, [r9, #64]	; 0x40
				p = usb_malloc();
    195e:	f000 f967 	bl	1c30 <usb_malloc>
    1962:	4a27      	ldr	r2, [pc, #156]	; (1a00 <usb_isr+0x988>)
				if (p) {
    1964:	2800      	cmp	r0, #0
    1966:	f000 80aa 	beq.w	1abe <usb_isr+0xa46>
					table[index(i, RX, ODD)].addr = p->buf;
    196a:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    196c:	4926      	ldr	r1, [pc, #152]	; (1a08 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    196e:	64d0      	str	r0, [r2, #76]	; 0x4c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1970:	6491      	str	r1, [r2, #72]	; 0x48
    1972:	e708      	b.n	1786 <usb_isr+0x70e>
				p = usb_malloc();
    1974:	f000 f95c 	bl	1c30 <usb_malloc>
				if (p) {
    1978:	2800      	cmp	r0, #0
    197a:	f000 80c1 	beq.w	1b00 <usb_isr+0xa88>
					table[index(i, RX, EVEN)].addr = p->buf;
    197e:	3008      	adds	r0, #8
    1980:	f8c9 0024 	str.w	r0, [r9, #36]	; 0x24
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1984:	4821      	ldr	r0, [pc, #132]	; (1a0c <usb_isr+0x994>)
    1986:	f8c9 0020 	str.w	r0, [r9, #32]
				p = usb_malloc();
    198a:	f000 f951 	bl	1c30 <usb_malloc>
    198e:	4a1c      	ldr	r2, [pc, #112]	; (1a00 <usb_isr+0x988>)
				if (p) {
    1990:	2800      	cmp	r0, #0
    1992:	f000 80b0 	beq.w	1af6 <usb_isr+0xa7e>
					table[index(i, RX, ODD)].addr = p->buf;
    1996:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1998:	491b      	ldr	r1, [pc, #108]	; (1a08 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    199a:	62d0      	str	r0, [r2, #44]	; 0x2c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    199c:	6291      	str	r1, [r2, #40]	; 0x28
    199e:	e6e4      	b.n	176a <usb_isr+0x6f2>
				p = usb_malloc();
    19a0:	f000 f946 	bl	1c30 <usb_malloc>
				if (p) {
    19a4:	2800      	cmp	r0, #0
    19a6:	f000 8098 	beq.w	1ada <usb_isr+0xa62>
					table[index(i, RX, EVEN)].addr = p->buf;
    19aa:	3008      	adds	r0, #8
    19ac:	f8c8 0064 	str.w	r0, [r8, #100]	; 0x64
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    19b0:	4816      	ldr	r0, [pc, #88]	; (1a0c <usb_isr+0x994>)
    19b2:	f8c9 0060 	str.w	r0, [r9, #96]	; 0x60
				p = usb_malloc();
    19b6:	f000 f93b 	bl	1c30 <usb_malloc>
    19ba:	4a11      	ldr	r2, [pc, #68]	; (1a00 <usb_isr+0x988>)
				if (p) {
    19bc:	2800      	cmp	r0, #0
    19be:	f000 8087 	beq.w	1ad0 <usb_isr+0xa58>
					table[index(i, RX, ODD)].addr = p->buf;
    19c2:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    19c4:	4910      	ldr	r1, [pc, #64]	; (1a08 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    19c6:	66d0      	str	r0, [r2, #108]	; 0x6c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    19c8:	6691      	str	r1, [r2, #104]	; 0x68
    19ca:	e6e9      	b.n	17a0 <usb_isr+0x728>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    19cc:	6bc8      	ldr	r0, [r1, #60]	; 0x3c
    19ce:	3808      	subs	r0, #8
    19d0:	f000 f94e 	bl	1c70 <usb_free>
    19d4:	e506      	b.n	13e4 <usb_isr+0x36c>
    19d6:	6b48      	ldr	r0, [r1, #52]	; 0x34
    19d8:	3808      	subs	r0, #8
    19da:	f000 f949 	bl	1c70 <usb_free>
    19de:	e4fb      	b.n	13d8 <usb_isr+0x360>
    19e0:	400720c0 	.word	0x400720c0
    19e4:	40072080 	.word	0x40072080
    19e8:	000038b0 	.word	0x000038b0
    19ec:	400720c4 	.word	0x400720c4
    19f0:	1fff9401 	.word	0x1fff9401
    19f4:	400720c8 	.word	0x400720c8
    19f8:	400720cc 	.word	0x400720cc
    19fc:	400720d0 	.word	0x400720d0
    1a00:	1fff8000 	.word	0x1fff8000
    1a04:	40072094 	.word	0x40072094
    1a08:	004000c8 	.word	0x004000c8
    1a0c:	00400088 	.word	0x00400088
    1a10:	1fff9395 	.word	0x1fff9395
    1a14:	000038b4 	.word	0x000038b4
    1a18:	1fff940c 	.word	0x1fff940c
    1a1c:	1fff9404 	.word	0x1fff9404
    1a20:	1fff9400 	.word	0x1fff9400
    1a24:	6ac8      	ldr	r0, [r1, #44]	; 0x2c
    1a26:	3808      	subs	r0, #8
    1a28:	f000 f922 	bl	1c70 <usb_free>
    1a2c:	e4ce      	b.n	13cc <usb_isr+0x354>
    1a2e:	6a60      	ldr	r0, [r4, #36]	; 0x24
    1a30:	3808      	subs	r0, #8
    1a32:	f000 f91d 	bl	1c70 <usb_free>
    1a36:	e4c3      	b.n	13c0 <usb_isr+0x348>
    1a38:	6fc8      	ldr	r0, [r1, #124]	; 0x7c
    1a3a:	3808      	subs	r0, #8
    1a3c:	f000 f918 	bl	1c70 <usb_free>
    1a40:	e500      	b.n	1444 <usb_isr+0x3cc>
    1a42:	6f48      	ldr	r0, [r1, #116]	; 0x74
    1a44:	3808      	subs	r0, #8
    1a46:	f000 f913 	bl	1c70 <usb_free>
    1a4a:	e4f5      	b.n	1438 <usb_isr+0x3c0>
    1a4c:	6ec8      	ldr	r0, [r1, #108]	; 0x6c
    1a4e:	3808      	subs	r0, #8
    1a50:	f000 f90e 	bl	1c70 <usb_free>
    1a54:	e4ea      	b.n	142c <usb_isr+0x3b4>
    1a56:	6e48      	ldr	r0, [r1, #100]	; 0x64
    1a58:	3808      	subs	r0, #8
    1a5a:	f000 f909 	bl	1c70 <usb_free>
    1a5e:	e4df      	b.n	1420 <usb_isr+0x3a8>
    1a60:	6dc8      	ldr	r0, [r1, #92]	; 0x5c
    1a62:	3808      	subs	r0, #8
    1a64:	f000 f904 	bl	1c70 <usb_free>
    1a68:	e4d4      	b.n	1414 <usb_isr+0x39c>
    1a6a:	6d48      	ldr	r0, [r1, #84]	; 0x54
    1a6c:	3808      	subs	r0, #8
    1a6e:	f000 f8ff 	bl	1c70 <usb_free>
    1a72:	e4c9      	b.n	1408 <usb_isr+0x390>
    1a74:	6cc8      	ldr	r0, [r1, #76]	; 0x4c
    1a76:	3808      	subs	r0, #8
    1a78:	f000 f8fa 	bl	1c70 <usb_free>
    1a7c:	e4be      	b.n	13fc <usb_isr+0x384>
    1a7e:	6c48      	ldr	r0, [r1, #68]	; 0x44
    1a80:	3808      	subs	r0, #8
    1a82:	f000 f8f5 	bl	1c70 <usb_free>
    1a86:	e4b3      	b.n	13f0 <usb_isr+0x378>
    1a88:	f8d1 009c 	ldr.w	r0, [r1, #156]	; 0x9c
    1a8c:	3808      	subs	r0, #8
    1a8e:	f000 f8ef 	bl	1c70 <usb_free>
    1a92:	e4ef      	b.n	1474 <usb_isr+0x3fc>
    1a94:	f8d1 0094 	ldr.w	r0, [r1, #148]	; 0x94
    1a98:	3808      	subs	r0, #8
    1a9a:	f000 f8e9 	bl	1c70 <usb_free>
    1a9e:	e4e3      	b.n	1468 <usb_isr+0x3f0>
    1aa0:	f8d1 008c 	ldr.w	r0, [r1, #140]	; 0x8c
    1aa4:	3808      	subs	r0, #8
    1aa6:	f000 f8e3 	bl	1c70 <usb_free>
    1aaa:	e4d7      	b.n	145c <usb_isr+0x3e4>
    1aac:	f8d1 0084 	ldr.w	r0, [r1, #132]	; 0x84
    1ab0:	3808      	subs	r0, #8
    1ab2:	f000 f8dd 	bl	1c70 <usb_free>
    1ab6:	e4cb      	b.n	1450 <usb_isr+0x3d8>
		datalen = 2;
    1ab8:	f04f 0e02 	mov.w	lr, #2
    1abc:	e6ef      	b.n	189e <usb_isr+0x826>
					usb_rx_memory_needed++;
    1abe:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1ac0:	6490      	str	r0, [r2, #72]	; 0x48
					usb_rx_memory_needed++;
    1ac2:	1c4a      	adds	r2, r1, #1
    1ac4:	702a      	strb	r2, [r5, #0]
    1ac6:	e65e      	b.n	1786 <usb_isr+0x70e>
					usb_rx_memory_needed++;
    1ac8:	782a      	ldrb	r2, [r5, #0]
    1aca:	3201      	adds	r2, #1
    1acc:	702a      	strb	r2, [r5, #0]
    1ace:	e744      	b.n	195a <usb_isr+0x8e2>
					usb_rx_memory_needed++;
    1ad0:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1ad2:	6690      	str	r0, [r2, #104]	; 0x68
					usb_rx_memory_needed++;
    1ad4:	1c4a      	adds	r2, r1, #1
    1ad6:	702a      	strb	r2, [r5, #0]
    1ad8:	e662      	b.n	17a0 <usb_isr+0x728>
					usb_rx_memory_needed++;
    1ada:	782a      	ldrb	r2, [r5, #0]
    1adc:	3201      	adds	r2, #1
    1ade:	702a      	strb	r2, [r5, #0]
    1ae0:	e767      	b.n	19b2 <usb_isr+0x93a>
					usb_rx_memory_needed++;
    1ae2:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1ae4:	f8c2 0088 	str.w	r0, [r2, #136]	; 0x88
					usb_rx_memory_needed++;
    1ae8:	1c4a      	adds	r2, r1, #1
    1aea:	702a      	strb	r2, [r5, #0]
    1aec:	e664      	b.n	17b8 <usb_isr+0x740>
					usb_rx_memory_needed++;
    1aee:	782a      	ldrb	r2, [r5, #0]
    1af0:	3201      	adds	r2, #1
    1af2:	702a      	strb	r2, [r5, #0]
    1af4:	e719      	b.n	192a <usb_isr+0x8b2>
					usb_rx_memory_needed++;
    1af6:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1af8:	6290      	str	r0, [r2, #40]	; 0x28
					usb_rx_memory_needed++;
    1afa:	1c4a      	adds	r2, r1, #1
    1afc:	702a      	strb	r2, [r5, #0]
    1afe:	e634      	b.n	176a <usb_isr+0x6f2>
					usb_rx_memory_needed++;
    1b00:	782a      	ldrb	r2, [r5, #0]
    1b02:	3201      	adds	r2, #1
    1b04:	702a      	strb	r2, [r5, #0]
    1b06:	e73e      	b.n	1986 <usb_isr+0x90e>
    1b08:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1b0c:	46f4      	mov	ip, lr
    1b0e:	bf28      	it	cs
    1b10:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    1b14:	eb04 030c 	add.w	r3, r4, ip
    1b18:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1b1a:	2301      	movs	r3, #1
    1b1c:	ebcc 000e 	rsb	r0, ip, lr
    1b20:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1b24:	2200      	movs	r2, #0
    1b26:	9301      	str	r3, [sp, #4]
    1b28:	e526      	b.n	1578 <usb_isr+0x500>
    1b2a:	bf00      	nop

00001b2c <usb_init>:



void usb_init(void)
{
    1b2c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    1b2e:	f000 fe59 	bl	27e4 <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    1b32:	4b29      	ldr	r3, [pc, #164]	; (1bd8 <usb_init+0xac>)
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1b34:	4829      	ldr	r0, [pc, #164]	; (1bdc <usb_init+0xb0>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1b36:	4c2a      	ldr	r4, [pc, #168]	; (1be0 <usb_init+0xb4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1b38:	4f2a      	ldr	r7, [pc, #168]	; (1be4 <usb_init+0xb8>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1b3a:	4d2b      	ldr	r5, [pc, #172]	; (1be8 <usb_init+0xbc>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
    1b3c:	f8df c0bc 	ldr.w	ip, [pc, #188]	; 1bfc <usb_init+0xd0>
	USB0_ERRSTAT = 0xFF;
    1b40:	f8df e0bc 	ldr.w	lr, [pc, #188]	; 1c00 <usb_init+0xd4>
	USB0_OTGISTAT = 0xFF;

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    1b44:	4e29      	ldr	r6, [pc, #164]	; (1bec <usb_init+0xc0>)
		table[i].desc = 0;
    1b46:	2200      	movs	r2, #0
    1b48:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    1b4a:	605a      	str	r2, [r3, #4]
		table[i].desc = 0;
    1b4c:	609a      	str	r2, [r3, #8]
		table[i].addr = 0;
    1b4e:	60da      	str	r2, [r3, #12]
		table[i].desc = 0;
    1b50:	611a      	str	r2, [r3, #16]
		table[i].addr = 0;
    1b52:	615a      	str	r2, [r3, #20]
		table[i].desc = 0;
    1b54:	619a      	str	r2, [r3, #24]
		table[i].addr = 0;
    1b56:	61da      	str	r2, [r3, #28]
		table[i].desc = 0;
    1b58:	621a      	str	r2, [r3, #32]
		table[i].addr = 0;
    1b5a:	625a      	str	r2, [r3, #36]	; 0x24
		table[i].desc = 0;
    1b5c:	629a      	str	r2, [r3, #40]	; 0x28
		table[i].addr = 0;
    1b5e:	62da      	str	r2, [r3, #44]	; 0x2c
		table[i].desc = 0;
    1b60:	631a      	str	r2, [r3, #48]	; 0x30
		table[i].addr = 0;
    1b62:	635a      	str	r2, [r3, #52]	; 0x34
		table[i].desc = 0;
    1b64:	639a      	str	r2, [r3, #56]	; 0x38
		table[i].addr = 0;
    1b66:	63da      	str	r2, [r3, #60]	; 0x3c
		table[i].desc = 0;
    1b68:	641a      	str	r2, [r3, #64]	; 0x40
		table[i].addr = 0;
    1b6a:	645a      	str	r2, [r3, #68]	; 0x44
		table[i].desc = 0;
    1b6c:	649a      	str	r2, [r3, #72]	; 0x48
		table[i].addr = 0;
    1b6e:	64da      	str	r2, [r3, #76]	; 0x4c
		table[i].desc = 0;
    1b70:	651a      	str	r2, [r3, #80]	; 0x50
		table[i].addr = 0;
    1b72:	655a      	str	r2, [r3, #84]	; 0x54
		table[i].desc = 0;
    1b74:	659a      	str	r2, [r3, #88]	; 0x58
		table[i].addr = 0;
    1b76:	65da      	str	r2, [r3, #92]	; 0x5c
		table[i].desc = 0;
    1b78:	661a      	str	r2, [r3, #96]	; 0x60
		table[i].addr = 0;
    1b7a:	665a      	str	r2, [r3, #100]	; 0x64
		table[i].desc = 0;
    1b7c:	669a      	str	r2, [r3, #104]	; 0x68
		table[i].addr = 0;
    1b7e:	66da      	str	r2, [r3, #108]	; 0x6c
		table[i].desc = 0;
    1b80:	671a      	str	r2, [r3, #112]	; 0x70
		table[i].addr = 0;
    1b82:	675a      	str	r2, [r3, #116]	; 0x74
		table[i].desc = 0;
    1b84:	679a      	str	r2, [r3, #120]	; 0x78
		table[i].addr = 0;
    1b86:	67da      	str	r2, [r3, #124]	; 0x7c
		table[i].desc = 0;
    1b88:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1b8c:	6801      	ldr	r1, [r0, #0]
		table[i].addr = 0;
    1b8e:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1b92:	f441 2180 	orr.w	r1, r1, #262144	; 0x40000
    1b96:	6001      	str	r1, [r0, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1b98:	f3c3 2107 	ubfx	r1, r3, #8, #8
    1b9c:	7021      	strb	r1, [r4, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1b9e:	f3c3 4007 	ubfx	r0, r3, #16, #8
	USB0_OTGISTAT = 0xFF;
    1ba2:	4913      	ldr	r1, [pc, #76]	; (1bf0 <usb_init+0xc4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1ba4:	7038      	strb	r0, [r7, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1ba6:	0e1b      	lsrs	r3, r3, #24
    1ba8:	702b      	strb	r3, [r5, #0]
	USB0_ISTAT = 0xFF;
    1baa:	23ff      	movs	r3, #255	; 0xff
    1bac:	f88c 3000 	strb.w	r3, [ip]

	// enable reset interrupt
	USB0_INTEN = USB_INTEN_USBRSTEN;

	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1bb0:	4d10      	ldr	r5, [pc, #64]	; (1bf4 <usb_init+0xc8>)
	USB0_ERRSTAT = 0xFF;
    1bb2:	f88e 3000 	strb.w	r3, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1bb6:	4810      	ldr	r0, [pc, #64]	; (1bf8 <usb_init+0xcc>)
	USB0_OTGISTAT = 0xFF;
    1bb8:	700b      	strb	r3, [r1, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    1bba:	2301      	movs	r3, #1
    1bbc:	7033      	strb	r3, [r6, #0]
	USB0_USBCTRL = 0;
    1bbe:	f884 2064 	strb.w	r2, [r4, #100]	; 0x64
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1bc2:	2670      	movs	r6, #112	; 0x70
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1bc4:	f44f 7400 	mov.w	r4, #512	; 0x200

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1bc8:	2210      	movs	r2, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    1bca:	f807 3c2c 	strb.w	r3, [r7, #-44]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1bce:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1bd0:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1bd2:	f881 20f8 	strb.w	r2, [r1, #248]	; 0xf8
    1bd6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1bd8:	1fff8000 	.word	0x1fff8000
    1bdc:	40048034 	.word	0x40048034
    1be0:	4007209c 	.word	0x4007209c
    1be4:	400720b0 	.word	0x400720b0
    1be8:	400720b4 	.word	0x400720b4
    1bec:	40072094 	.word	0x40072094
    1bf0:	40072010 	.word	0x40072010
    1bf4:	e000e449 	.word	0xe000e449
    1bf8:	e000e108 	.word	0xe000e108
    1bfc:	40072080 	.word	0x40072080
    1c00:	40072088 	.word	0x40072088

00001c04 <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    1c04:	f000 b8a4 	b.w	1d50 <usb_serial_flush_input>

00001c08 <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    1c08:	f000 b87c 	b.w	1d04 <usb_serial_peekchar>

00001c0c <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    1c0c:	f000 b856 	b.w	1cbc <usb_serial_getchar>

00001c10 <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    1c10:	f000 b890 	b.w	1d34 <usb_serial_available>

00001c14 <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    1c14:	f000 b9bc 	b.w	1f90 <usb_serial_flush_output>

00001c18 <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    1c18:	f000 b996 	b.w	1f48 <usb_serial_write_buffer_free>

00001c1c <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    1c1c:	4608      	mov	r0, r1
    1c1e:	4611      	mov	r1, r2
    1c20:	f000 b8b2 	b.w	1d88 <usb_serial_write>

00001c24 <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    1c24:	4608      	mov	r0, r1
    1c26:	f000 b983 	b.w	1f30 <usb_serial_putchar>
    1c2a:	bf00      	nop

00001c2c <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    1c2c:	4770      	bx	lr
    1c2e:	bf00      	nop

00001c30 <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    1c30:	b672      	cpsid	i
	avail = usb_buffer_available;
    1c32:	480d      	ldr	r0, [pc, #52]	; (1c68 <usb_malloc+0x38>)
    1c34:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    1c36:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    1c3a:	2b0b      	cmp	r3, #11
    1c3c:	dc10      	bgt.n	1c60 <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    1c3e:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1c42:	40d9      	lsrs	r1, r3
    1c44:	ea22 0201 	bic.w	r2, r2, r1
    1c48:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1c4a:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    1c4c:	4807      	ldr	r0, [pc, #28]	; (1c6c <usb_malloc+0x3c>)
    1c4e:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    1c52:	00db      	lsls	r3, r3, #3
    1c54:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    1c56:	2100      	movs	r1, #0
    1c58:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    1c5a:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    1c5c:	6051      	str	r1, [r2, #4]
}
    1c5e:	4770      	bx	lr
		__enable_irq();
    1c60:	b662      	cpsie	i
		return NULL;
    1c62:	2000      	movs	r0, #0
    1c64:	4770      	bx	lr
    1c66:	bf00      	nop
    1c68:	1fff8908 	.word	0x1fff8908
    1c6c:	1fff83bc 	.word	0x1fff83bc

00001c70 <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    1c70:	4b0d      	ldr	r3, [pc, #52]	; (1ca8 <usb_free+0x38>)
    1c72:	4a0e      	ldr	r2, [pc, #56]	; (1cac <usb_free+0x3c>)
    1c74:	1ac3      	subs	r3, r0, r3
    1c76:	fba2 2303 	umull	r2, r3, r2, r3
    1c7a:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    1c7c:	2b0b      	cmp	r3, #11
    1c7e:	d80c      	bhi.n	1c9a <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    1c80:	4a0b      	ldr	r2, [pc, #44]	; (1cb0 <usb_free+0x40>)
    1c82:	7812      	ldrb	r2, [r2, #0]
    1c84:	b952      	cbnz	r2, 1c9c <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    1c86:	b672      	cpsid	i
	usb_buffer_available |= mask;
    1c88:	480a      	ldr	r0, [pc, #40]	; (1cb4 <usb_free+0x44>)
    1c8a:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1c8e:	6802      	ldr	r2, [r0, #0]
    1c90:	fa21 f303 	lsr.w	r3, r1, r3
    1c94:	431a      	orrs	r2, r3
    1c96:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1c98:	b662      	cpsie	i
    1c9a:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    1c9c:	4a06      	ldr	r2, [pc, #24]	; (1cb8 <usb_free+0x48>)
    1c9e:	7812      	ldrb	r2, [r2, #0]
    1ca0:	2a00      	cmp	r2, #0
    1ca2:	d0f0      	beq.n	1c86 <usb_free+0x16>
		usb_rx_memory(p);
    1ca4:	f7ff b942 	b.w	f2c <usb_rx_memory>
    1ca8:	1fff83bc 	.word	0x1fff83bc
    1cac:	38e38e39 	.word	0x38e38e39
    1cb0:	1fff9401 	.word	0x1fff9401
    1cb4:	1fff8908 	.word	0x1fff8908
    1cb8:	1fff940c 	.word	0x1fff940c

00001cbc <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    1cbc:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    1cbe:	4d0f      	ldr	r5, [pc, #60]	; (1cfc <usb_serial_getchar+0x40>)
    1cc0:	6828      	ldr	r0, [r5, #0]
    1cc2:	b178      	cbz	r0, 1ce4 <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    1cc4:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    1cc6:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    1cc8:	18c1      	adds	r1, r0, r3
    1cca:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    1ccc:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    1cce:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    1cd0:	d202      	bcs.n	1cd8 <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    1cd2:	8043      	strh	r3, [r0, #2]
	}
	return c;
    1cd4:	4620      	mov	r0, r4
}
    1cd6:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    1cd8:	f7ff ffca 	bl	1c70 <usb_free>
		rx_packet = NULL;
    1cdc:	2300      	movs	r3, #0
	return c;
    1cde:	4620      	mov	r0, r4
		rx_packet = NULL;
    1ce0:	602b      	str	r3, [r5, #0]
    1ce2:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    1ce4:	4b06      	ldr	r3, [pc, #24]	; (1d00 <usb_serial_getchar+0x44>)
    1ce6:	781b      	ldrb	r3, [r3, #0]
    1ce8:	b12b      	cbz	r3, 1cf6 <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1cea:	2003      	movs	r0, #3
    1cec:	f7ff f8ea 	bl	ec4 <usb_rx>
    1cf0:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    1cf2:	2800      	cmp	r0, #0
    1cf4:	d1e6      	bne.n	1cc4 <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    1cf6:	f04f 30ff 	mov.w	r0, #4294967295
    1cfa:	bd38      	pop	{r3, r4, r5, pc}
    1cfc:	1fff9420 	.word	0x1fff9420
    1d00:	1fff940c 	.word	0x1fff940c

00001d04 <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    1d04:	b510      	push	{r4, lr}
	if (!rx_packet) {
    1d06:	4c09      	ldr	r4, [pc, #36]	; (1d2c <usb_serial_peekchar+0x28>)
    1d08:	6820      	ldr	r0, [r4, #0]
    1d0a:	b118      	cbz	r0, 1d14 <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    1d0c:	8843      	ldrh	r3, [r0, #2]
    1d0e:	4418      	add	r0, r3
    1d10:	7a00      	ldrb	r0, [r0, #8]
}
    1d12:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    1d14:	4b06      	ldr	r3, [pc, #24]	; (1d30 <usb_serial_peekchar+0x2c>)
    1d16:	781b      	ldrb	r3, [r3, #0]
    1d18:	b12b      	cbz	r3, 1d26 <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1d1a:	2003      	movs	r0, #3
    1d1c:	f7ff f8d2 	bl	ec4 <usb_rx>
    1d20:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    1d22:	2800      	cmp	r0, #0
    1d24:	d1f2      	bne.n	1d0c <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    1d26:	f04f 30ff 	mov.w	r0, #4294967295
    1d2a:	bd10      	pop	{r4, pc}
    1d2c:	1fff9420 	.word	0x1fff9420
    1d30:	1fff940c 	.word	0x1fff940c

00001d34 <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1d34:	4b04      	ldr	r3, [pc, #16]	; (1d48 <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    1d36:	4a05      	ldr	r2, [pc, #20]	; (1d4c <usb_serial_available+0x18>)
    1d38:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    1d3a:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1d3c:	b11b      	cbz	r3, 1d46 <usb_serial_available+0x12>
    1d3e:	881a      	ldrh	r2, [r3, #0]
    1d40:	885b      	ldrh	r3, [r3, #2]
    1d42:	1ad3      	subs	r3, r2, r3
    1d44:	4418      	add	r0, r3
	return count;
}
    1d46:	4770      	bx	lr
    1d48:	1fff9420 	.word	0x1fff9420
    1d4c:	1fff9608 	.word	0x1fff9608

00001d50 <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    1d50:	4b0b      	ldr	r3, [pc, #44]	; (1d80 <usb_serial_flush_input+0x30>)
    1d52:	781b      	ldrb	r3, [r3, #0]
    1d54:	b19b      	cbz	r3, 1d7e <usb_serial_flush_input+0x2e>
{
    1d56:	b510      	push	{r4, lr}
	if (rx_packet) {
    1d58:	4c0a      	ldr	r4, [pc, #40]	; (1d84 <usb_serial_flush_input+0x34>)
    1d5a:	6820      	ldr	r0, [r4, #0]
    1d5c:	b148      	cbz	r0, 1d72 <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    1d5e:	f7ff ff87 	bl	1c70 <usb_free>
		rx_packet = NULL;
    1d62:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    1d64:	2003      	movs	r0, #3
		rx_packet = NULL;
    1d66:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    1d68:	f7ff f8ac 	bl	ec4 <usb_rx>
		if (!rx) break;
    1d6c:	b130      	cbz	r0, 1d7c <usb_serial_flush_input+0x2c>
		usb_free(rx);
    1d6e:	f7ff ff7f 	bl	1c70 <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    1d72:	2003      	movs	r0, #3
    1d74:	f7ff f8a6 	bl	ec4 <usb_rx>
		if (!rx) break;
    1d78:	2800      	cmp	r0, #0
    1d7a:	d1f8      	bne.n	1d6e <usb_serial_flush_input+0x1e>
    1d7c:	bd10      	pop	{r4, pc}
    1d7e:	4770      	bx	lr
    1d80:	1fff940c 	.word	0x1fff940c
    1d84:	1fff9420 	.word	0x1fff9420

00001d88 <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    1d88:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    1d8c:	4a63      	ldr	r2, [pc, #396]	; (1f1c <usb_serial_write+0x194>)
{
    1d8e:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    1d90:	2301      	movs	r3, #1
    1d92:	7013      	strb	r3, [r2, #0]
	while (size > 0) {
    1d94:	9101      	str	r1, [sp, #4]
    1d96:	2900      	cmp	r1, #0
    1d98:	d06c      	beq.n	1e74 <usb_serial_write+0xec>
    1d9a:	f8df 8190 	ldr.w	r8, [pc, #400]	; 1f2c <usb_serial_write+0x1a4>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    1d9e:	4f60      	ldr	r7, [pc, #384]	; (1f20 <usb_serial_write+0x198>)
    1da0:	4604      	mov	r4, r0
    1da2:	f8d8 0000 	ldr.w	r0, [r8]
    1da6:	460e      	mov	r6, r1
		if (!tx_packet) {
    1da8:	2800      	cmp	r0, #0
    1daa:	f000 8081 	beq.w	1eb0 <usb_serial_write+0x128>
    1dae:	4d5d      	ldr	r5, [pc, #372]	; (1f24 <usb_serial_write+0x19c>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    1db0:	8843      	ldrh	r3, [r0, #2]
    1db2:	f1c3 0140 	rsb	r1, r3, #64	; 0x40
    1db6:	42b1      	cmp	r1, r6
    1db8:	bf28      	it	cs
    1dba:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    1dbc:	eb03 0901 	add.w	r9, r3, r1
    1dc0:	fa1f f989 	uxth.w	r9, r9
		dest = tx_packet->buf + tx_packet->index;
    1dc4:	f100 0208 	add.w	r2, r0, #8
		transmit_previous_timeout = 0;
    1dc8:	f04f 0e00 	mov.w	lr, #0
		size -= len;
    1dcc:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    1dce:	f8a0 9002 	strh.w	r9, [r0, #2]
		while (len-- > 0) *dest++ = *src++;
    1dd2:	f101 3cff 	add.w	ip, r1, #4294967295
		dest = tx_packet->buf + tx_packet->index;
    1dd6:	441a      	add	r2, r3
		transmit_previous_timeout = 0;
    1dd8:	f885 e000 	strb.w	lr, [r5]
		while (len-- > 0) *dest++ = *src++;
    1ddc:	2900      	cmp	r1, #0
    1dde:	d041      	beq.n	1e64 <usb_serial_write+0xdc>
    1de0:	f103 0508 	add.w	r5, r3, #8
    1de4:	330c      	adds	r3, #12
    1de6:	4403      	add	r3, r0
    1de8:	4405      	add	r5, r0
    1dea:	f104 0904 	add.w	r9, r4, #4
    1dee:	454d      	cmp	r5, r9
    1df0:	bf38      	it	cc
    1df2:	429c      	cmpcc	r4, r3
    1df4:	bf2c      	ite	cs
    1df6:	2301      	movcs	r3, #1
    1df8:	2300      	movcc	r3, #0
    1dfa:	2909      	cmp	r1, #9
    1dfc:	bf94      	ite	ls
    1dfe:	2300      	movls	r3, #0
    1e00:	f003 0301 	andhi.w	r3, r3, #1
    1e04:	2b00      	cmp	r3, #0
    1e06:	d04a      	beq.n	1e9e <usb_serial_write+0x116>
    1e08:	ea44 0305 	orr.w	r3, r4, r5
    1e0c:	079b      	lsls	r3, r3, #30
    1e0e:	d146      	bne.n	1e9e <usb_serial_write+0x116>
    1e10:	1f0b      	subs	r3, r1, #4
    1e12:	089b      	lsrs	r3, r3, #2
    1e14:	3301      	adds	r3, #1
    1e16:	f1bc 0f02 	cmp.w	ip, #2
    1e1a:	ea4f 0983 	mov.w	r9, r3, lsl #2
    1e1e:	d93c      	bls.n	1e9a <usb_serial_write+0x112>
    1e20:	f1a4 0a04 	sub.w	sl, r4, #4
    1e24:	469b      	mov	fp, r3
    1e26:	f10e 0e01 	add.w	lr, lr, #1
    1e2a:	f85a 3f04 	ldr.w	r3, [sl, #4]!
    1e2e:	f845 3b04 	str.w	r3, [r5], #4
    1e32:	45f3      	cmp	fp, lr
    1e34:	d8f7      	bhi.n	1e26 <usb_serial_write+0x9e>
    1e36:	4549      	cmp	r1, r9
    1e38:	444a      	add	r2, r9
    1e3a:	ebc9 0c0c 	rsb	ip, r9, ip
    1e3e:	eb04 0309 	add.w	r3, r4, r9
    1e42:	d061      	beq.n	1f08 <usb_serial_write+0x180>
    1e44:	781d      	ldrb	r5, [r3, #0]
    1e46:	7015      	strb	r5, [r2, #0]
    1e48:	f1bc 0f00 	cmp.w	ip, #0
    1e4c:	d023      	beq.n	1e96 <usb_serial_write+0x10e>
    1e4e:	785d      	ldrb	r5, [r3, #1]
    1e50:	7055      	strb	r5, [r2, #1]
    1e52:	f1bc 0f01 	cmp.w	ip, #1
    1e56:	d01e      	beq.n	1e96 <usb_serial_write+0x10e>
    1e58:	789b      	ldrb	r3, [r3, #2]
    1e5a:	7093      	strb	r3, [r2, #2]
    1e5c:	4421      	add	r1, r4
    1e5e:	f8b0 9002 	ldrh.w	r9, [r0, #2]
    1e62:	460c      	mov	r4, r1
		if (tx_packet->index >= CDC_TX_SIZE) {
    1e64:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
    1e68:	d80b      	bhi.n	1e82 <usb_serial_write+0xfa>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    1e6a:	4b2f      	ldr	r3, [pc, #188]	; (1f28 <usb_serial_write+0x1a0>)
    1e6c:	2205      	movs	r2, #5
    1e6e:	701a      	strb	r2, [r3, #0]
	while (size > 0) {
    1e70:	2e00      	cmp	r6, #0
    1e72:	d199      	bne.n	1da8 <usb_serial_write+0x20>
	}
	tx_noautoflush = 0;
	return ret;
    1e74:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    1e76:	4a29      	ldr	r2, [pc, #164]	; (1f1c <usb_serial_write+0x194>)
    1e78:	2300      	movs	r3, #0
    1e7a:	7013      	strb	r3, [r2, #0]
}
    1e7c:	b003      	add	sp, #12
    1e7e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    1e82:	2340      	movs	r3, #64	; 0x40
    1e84:	8003      	strh	r3, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1e86:	4601      	mov	r1, r0
    1e88:	2004      	movs	r0, #4
    1e8a:	f7ff f8b3 	bl	ff4 <usb_tx>
			tx_packet = NULL;
    1e8e:	2000      	movs	r0, #0
    1e90:	f8c8 0000 	str.w	r0, [r8]
    1e94:	e7e9      	b.n	1e6a <usb_serial_write+0xe2>
    1e96:	4421      	add	r1, r4
    1e98:	e7e1      	b.n	1e5e <usb_serial_write+0xd6>
		while (len-- > 0) *dest++ = *src++;
    1e9a:	4623      	mov	r3, r4
    1e9c:	e7d2      	b.n	1e44 <usb_serial_write+0xbc>
    1e9e:	3a01      	subs	r2, #1
    1ea0:	4421      	add	r1, r4
    1ea2:	f814 3b01 	ldrb.w	r3, [r4], #1
    1ea6:	f802 3f01 	strb.w	r3, [r2, #1]!
    1eaa:	428c      	cmp	r4, r1
    1eac:	d1f9      	bne.n	1ea2 <usb_serial_write+0x11a>
    1eae:	e7d6      	b.n	1e5e <usb_serial_write+0xd6>
				if (!usb_configuration) {
    1eb0:	783b      	ldrb	r3, [r7, #0]
    1eb2:	b35b      	cbz	r3, 1f0c <usb_serial_write+0x184>
    1eb4:	4d1b      	ldr	r5, [pc, #108]	; (1f24 <usb_serial_write+0x19c>)
    1eb6:	f24d 09e9 	movw	r9, #53481	; 0xd0e9
					tx_noautoflush = 1;
    1eba:	f04f 0a01 	mov.w	sl, #1
    1ebe:	e008      	b.n	1ed2 <usb_serial_write+0x14a>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1ec0:	f1b9 0901 	subs.w	r9, r9, #1
    1ec4:	d019      	beq.n	1efa <usb_serial_write+0x172>
    1ec6:	782b      	ldrb	r3, [r5, #0]
    1ec8:	b9bb      	cbnz	r3, 1efa <usb_serial_write+0x172>
				yield();
    1eca:	f000 f8b1 	bl	2030 <yield>
				if (!usb_configuration) {
    1ece:	783b      	ldrb	r3, [r7, #0]
    1ed0:	b1e3      	cbz	r3, 1f0c <usb_serial_write+0x184>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    1ed2:	2004      	movs	r0, #4
    1ed4:	f7ff f814 	bl	f00 <usb_tx_packet_count>
    1ed8:	2807      	cmp	r0, #7
    1eda:	d8f1      	bhi.n	1ec0 <usb_serial_write+0x138>
					tx_noautoflush = 1;
    1edc:	4b0f      	ldr	r3, [pc, #60]	; (1f1c <usb_serial_write+0x194>)
    1ede:	f883 a000 	strb.w	sl, [r3]
					tx_packet = usb_malloc();
    1ee2:	f7ff fea5 	bl	1c30 <usb_malloc>
    1ee6:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    1eea:	2800      	cmp	r0, #0
    1eec:	f47f af60 	bne.w	1db0 <usb_serial_write+0x28>
					tx_noautoflush = 0;
    1ef0:	4b0a      	ldr	r3, [pc, #40]	; (1f1c <usb_serial_write+0x194>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1ef2:	f1b9 0901 	subs.w	r9, r9, #1
					tx_noautoflush = 0;
    1ef6:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1ef8:	d1e5      	bne.n	1ec6 <usb_serial_write+0x13e>
					transmit_previous_timeout = 1;
    1efa:	2301      	movs	r3, #1
					return -1;
    1efc:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    1f00:	702b      	strb	r3, [r5, #0]
}
    1f02:	b003      	add	sp, #12
    1f04:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1f08:	4619      	mov	r1, r3
    1f0a:	e7a8      	b.n	1e5e <usb_serial_write+0xd6>
					tx_noautoflush = 0;
    1f0c:	4a03      	ldr	r2, [pc, #12]	; (1f1c <usb_serial_write+0x194>)
    1f0e:	2300      	movs	r3, #0
					return -1;
    1f10:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    1f14:	7013      	strb	r3, [r2, #0]
}
    1f16:	b003      	add	sp, #12
    1f18:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1f1c:	1fff9415 	.word	0x1fff9415
    1f20:	1fff940c 	.word	0x1fff940c
    1f24:	1fff941c 	.word	0x1fff941c
    1f28:	1fff9414 	.word	0x1fff9414
    1f2c:	1fff9418 	.word	0x1fff9418

00001f30 <usb_serial_putchar>:
{
    1f30:	b500      	push	{lr}
    1f32:	b083      	sub	sp, #12
    1f34:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    1f36:	2101      	movs	r1, #1
{
    1f38:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    1f3c:	4618      	mov	r0, r3
    1f3e:	f7ff ff23 	bl	1d88 <usb_serial_write>
}
    1f42:	b003      	add	sp, #12
    1f44:	f85d fb04 	ldr.w	pc, [sp], #4

00001f48 <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    1f48:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    1f4a:	4d0e      	ldr	r5, [pc, #56]	; (1f84 <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    1f4c:	4c0e      	ldr	r4, [pc, #56]	; (1f88 <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    1f4e:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    1f50:	2301      	movs	r3, #1
    1f52:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    1f54:	b128      	cbz	r0, 1f62 <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    1f56:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    1f58:	2300      	movs	r3, #0
    1f5a:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    1f5c:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    1f60:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    1f62:	4b0a      	ldr	r3, [pc, #40]	; (1f8c <usb_serial_write_buffer_free+0x44>)
    1f64:	781b      	ldrb	r3, [r3, #0]
    1f66:	b913      	cbnz	r3, 1f6e <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    1f68:	2000      	movs	r0, #0
    1f6a:	7020      	strb	r0, [r4, #0]
			return 0;
    1f6c:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1f6e:	2004      	movs	r0, #4
    1f70:	f7fe ffc6 	bl	f00 <usb_tx_packet_count>
		if (!usb_configuration ||
    1f74:	2807      	cmp	r0, #7
    1f76:	d8f7      	bhi.n	1f68 <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    1f78:	f7ff fe5a 	bl	1c30 <usb_malloc>
    1f7c:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1f7e:	2800      	cmp	r0, #0
    1f80:	d1e9      	bne.n	1f56 <usb_serial_write_buffer_free+0xe>
    1f82:	e7f1      	b.n	1f68 <usb_serial_write_buffer_free+0x20>
    1f84:	1fff9418 	.word	0x1fff9418
    1f88:	1fff9415 	.word	0x1fff9415
    1f8c:	1fff940c 	.word	0x1fff940c

00001f90 <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    1f90:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    1f92:	4b11      	ldr	r3, [pc, #68]	; (1fd8 <usb_serial_flush_output+0x48>)
    1f94:	781b      	ldrb	r3, [r3, #0]
    1f96:	b18b      	cbz	r3, 1fbc <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    1f98:	4e10      	ldr	r6, [pc, #64]	; (1fdc <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    1f9a:	4d11      	ldr	r5, [pc, #68]	; (1fe0 <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    1f9c:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    1f9e:	2701      	movs	r7, #1
    1fa0:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    1fa2:	b164      	cbz	r4, 1fbe <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    1fa4:	4a0f      	ldr	r2, [pc, #60]	; (1fe4 <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    1fa6:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    1fa8:	2700      	movs	r7, #0
    1faa:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1fac:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    1fae:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1fb0:	2004      	movs	r0, #4
    1fb2:	f7ff f81f 	bl	ff4 <usb_tx>
		tx_packet = NULL;
    1fb6:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    1fb8:	2300      	movs	r3, #0
    1fba:	702b      	strb	r3, [r5, #0]
    1fbc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    1fbe:	f7ff fe37 	bl	1c30 <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    1fc2:	4b08      	ldr	r3, [pc, #32]	; (1fe4 <usb_serial_flush_output+0x54>)
		if (tx) {
    1fc4:	b128      	cbz	r0, 1fd2 <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1fc6:	4601      	mov	r1, r0
    1fc8:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    1fca:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    1fcc:	f7ff f812 	bl	ff4 <usb_tx>
    1fd0:	e7f2      	b.n	1fb8 <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    1fd2:	701f      	strb	r7, [r3, #0]
    1fd4:	e7f0      	b.n	1fb8 <usb_serial_flush_output+0x28>
    1fd6:	bf00      	nop
    1fd8:	1fff940c 	.word	0x1fff940c
    1fdc:	1fff9418 	.word	0x1fff9418
    1fe0:	1fff9415 	.word	0x1fff9415
    1fe4:	1fff9414 	.word	0x1fff9414

00001fe8 <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    1fe8:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    1fea:	4b0e      	ldr	r3, [pc, #56]	; (2024 <usb_serial_flush_callback+0x3c>)
    1fec:	781b      	ldrb	r3, [r3, #0]
    1fee:	b973      	cbnz	r3, 200e <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    1ff0:	4c0d      	ldr	r4, [pc, #52]	; (2028 <usb_serial_flush_callback+0x40>)
    1ff2:	6821      	ldr	r1, [r4, #0]
    1ff4:	b161      	cbz	r1, 2010 <usb_serial_flush_callback+0x28>
    1ff6:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    1ffa:	884b      	ldrh	r3, [r1, #2]
    1ffc:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1ffe:	2004      	movs	r0, #4
    2000:	f7fe fff8 	bl	ff4 <usb_tx>
		tx_packet = NULL;
    2004:	6025      	str	r5, [r4, #0]
    2006:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    2008:	4b08      	ldr	r3, [pc, #32]	; (202c <usb_serial_flush_callback+0x44>)
    200a:	2201      	movs	r2, #1
    200c:	701a      	strb	r2, [r3, #0]
    200e:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    2010:	f7ff fe0e 	bl	1c30 <usb_malloc>
		if (tx) {
    2014:	2800      	cmp	r0, #0
    2016:	d0f7      	beq.n	2008 <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    2018:	4601      	mov	r1, r0
		}
	}
}
    201a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    201e:	2004      	movs	r0, #4
    2020:	f7fe bfe8 	b.w	ff4 <usb_tx>
    2024:	1fff9415 	.word	0x1fff9415
    2028:	1fff9418 	.word	0x1fff9418
    202c:	1fff9414 	.word	0x1fff9414

00002030 <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    2030:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    2032:	4c22      	ldr	r4, [pc, #136]	; (20bc <yield+0x8c>)
    2034:	7823      	ldrb	r3, [r4, #0]
    2036:	b103      	cbz	r3, 203a <yield+0xa>
    2038:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    203a:	2301      	movs	r3, #1
    203c:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    203e:	f7ff fe79 	bl	1d34 <usb_serial_available>
	if (Serial.available()) serialEvent();
    2042:	bb70      	cbnz	r0, 20a2 <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    2044:	f000 fa26 	bl	2494 <serial_available>
	if (Serial1.available()) serialEvent1();
    2048:	bb40      	cbnz	r0, 209c <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    204a:	f000 fab9 	bl	25c0 <serial2_available>
	if (Serial2.available()) serialEvent2();
    204e:	bb10      	cbnz	r0, 2096 <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    2050:	f000 fb4c 	bl	26ec <serial3_available>
	if (Serial3.available()) serialEvent3();
    2054:	b9e0      	cbnz	r0, 2090 <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    2056:	2300      	movs	r3, #0
    2058:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    205a:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    205e:	2b00      	cmp	r3, #0
    2060:	d1ea      	bne.n	2038 <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2062:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    2066:	b672      	cpsid	i
		EventResponder *first = firstYield;
    2068:	4b15      	ldr	r3, [pc, #84]	; (20c0 <yield+0x90>)
    206a:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    206c:	b1e0      	cbz	r0, 20a8 <yield+0x78>
		if (runningFromYield) {
    206e:	4c15      	ldr	r4, [pc, #84]	; (20c4 <yield+0x94>)
    2070:	7822      	ldrb	r2, [r4, #0]
    2072:	b9ca      	cbnz	r2, 20a8 <yield+0x78>
		firstYield = first->_next;
    2074:	6945      	ldr	r5, [r0, #20]
    2076:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    2078:	2301      	movs	r3, #1
    207a:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    207c:	b1c5      	cbz	r5, 20b0 <yield+0x80>
			firstYield->_prev = nullptr;
    207e:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    2080:	b901      	cbnz	r1, 2084 <yield+0x54>
    2082:	b662      	cpsie	i
		first->_triggered = false;
    2084:	2500      	movs	r5, #0
    2086:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    2088:	6883      	ldr	r3, [r0, #8]
    208a:	4798      	blx	r3
		runningFromYield = false;
    208c:	7025      	strb	r5, [r4, #0]
    208e:	e7d3      	b.n	2038 <yield+0x8>
	if (Serial3.available()) serialEvent3();
    2090:	f000 f98e 	bl	23b0 <serialEvent3()>
    2094:	e7df      	b.n	2056 <yield+0x26>
	if (Serial2.available()) serialEvent2();
    2096:	f000 f989 	bl	23ac <serialEvent2()>
    209a:	e7d9      	b.n	2050 <yield+0x20>
	if (Serial1.available()) serialEvent1();
    209c:	f000 f984 	bl	23a8 <serialEvent1()>
    20a0:	e7d3      	b.n	204a <yield+0x1a>
	if (Serial.available()) serialEvent();
    20a2:	f7ff fdc3 	bl	1c2c <serialEvent()>
    20a6:	e7cd      	b.n	2044 <yield+0x14>
		if (doit) __enable_irq();
    20a8:	2900      	cmp	r1, #0
    20aa:	d1c5      	bne.n	2038 <yield+0x8>
    20ac:	b662      	cpsie	i
    20ae:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    20b0:	4b05      	ldr	r3, [pc, #20]	; (20c8 <yield+0x98>)
    20b2:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    20b4:	2900      	cmp	r1, #0
    20b6:	d1e5      	bne.n	2084 <yield+0x54>
    20b8:	e7e3      	b.n	2082 <yield+0x52>
    20ba:	bf00      	nop
    20bc:	1fff9425 	.word	0x1fff9425
    20c0:	1fff9438 	.word	0x1fff9438
    20c4:	1fff943c 	.word	0x1fff943c
    20c8:	1fff9434 	.word	0x1fff9434

000020cc <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    20cc:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    20ce:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    20d0:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    20d2:	2c02      	cmp	r4, #2
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    20d4:	4603      	mov	r3, r0
		_data = data;
    20d6:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    20d8:	d00f      	beq.n	20fa <EventResponder::triggerEvent(int, void*)+0x2e>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    20da:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    20de:	b672      	cpsid	i
// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
	bool irq = disableInterrupts();
	if (_triggered == false) {
    20e0:	7f42      	ldrb	r2, [r0, #29]
    20e2:	b932      	cbnz	r2, 20f2 <EventResponder::triggerEvent(int, void*)+0x26>
		// not already triggered
		if (_type == EventTypeYield) {
    20e4:	7f00      	ldrb	r0, [r0, #28]
    20e6:	2801      	cmp	r0, #1
    20e8:	d00a      	beq.n	2100 <EventResponder::triggerEvent(int, void*)+0x34>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    20ea:	2803      	cmp	r0, #3
    20ec:	d012      	beq.n	2114 <EventResponder::triggerEvent(int, void*)+0x48>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    20ee:	2201      	movs	r2, #1
    20f0:	775a      	strb	r2, [r3, #29]
		if (doit) __enable_irq();
    20f2:	b901      	cbnz	r1, 20f6 <EventResponder::triggerEvent(int, void*)+0x2a>
    20f4:	b662      	cpsie	i
	}
    20f6:	bc10      	pop	{r4}
    20f8:	4770      	bx	lr
			(*_function)(*this);
    20fa:	6883      	ldr	r3, [r0, #8]
	}
    20fc:	bc10      	pop	{r4}
			(*_function)(*this);
    20fe:	4718      	bx	r3
			if (firstYield == nullptr) {
    2100:	4c11      	ldr	r4, [pc, #68]	; (2148 <EventResponder::triggerEvent(int, void*)+0x7c>)
    2102:	6820      	ldr	r0, [r4, #0]
    2104:	b1a0      	cbz	r0, 2130 <EventResponder::triggerEvent(int, void*)+0x64>
				_prev = lastYield;
    2106:	4811      	ldr	r0, [pc, #68]	; (214c <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2108:	615a      	str	r2, [r3, #20]
				_prev = lastYield;
    210a:	6802      	ldr	r2, [r0, #0]
    210c:	619a      	str	r2, [r3, #24]
				lastYield = this;
    210e:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2110:	6153      	str	r3, [r2, #20]
    2112:	e7ec      	b.n	20ee <EventResponder::triggerEvent(int, void*)+0x22>
			if (firstInterrupt == nullptr) {
    2114:	4c0e      	ldr	r4, [pc, #56]	; (2150 <EventResponder::triggerEvent(int, void*)+0x84>)
    2116:	6820      	ldr	r0, [r4, #0]
    2118:	b180      	cbz	r0, 213c <EventResponder::triggerEvent(int, void*)+0x70>
				_prev = lastInterrupt;
    211a:	480e      	ldr	r0, [pc, #56]	; (2154 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    211c:	615a      	str	r2, [r3, #20]
				_prev = lastInterrupt;
    211e:	6802      	ldr	r2, [r0, #0]
    2120:	619a      	str	r2, [r3, #24]
				lastInterrupt = this;
    2122:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2124:	6153      	str	r3, [r2, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2126:	4a0c      	ldr	r2, [pc, #48]	; (2158 <EventResponder::triggerEvent(int, void*)+0x8c>)
    2128:	f04f 5080 	mov.w	r0, #268435456	; 0x10000000
    212c:	6010      	str	r0, [r2, #0]
    212e:	e7de      	b.n	20ee <EventResponder::triggerEvent(int, void*)+0x22>
				lastYield = this;
    2130:	4a06      	ldr	r2, [pc, #24]	; (214c <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2132:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2134:	6198      	str	r0, [r3, #24]
				firstYield = this;
    2136:	6023      	str	r3, [r4, #0]
				lastYield = this;
    2138:	6013      	str	r3, [r2, #0]
    213a:	e7d8      	b.n	20ee <EventResponder::triggerEvent(int, void*)+0x22>
				lastInterrupt = this;
    213c:	4a05      	ldr	r2, [pc, #20]	; (2154 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    213e:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2140:	6198      	str	r0, [r3, #24]
				firstInterrupt = this;
    2142:	6023      	str	r3, [r4, #0]
				lastInterrupt = this;
    2144:	6013      	str	r3, [r2, #0]
    2146:	e7ee      	b.n	2126 <EventResponder::triggerEvent(int, void*)+0x5a>
    2148:	1fff9438 	.word	0x1fff9438
    214c:	1fff9434 	.word	0x1fff9434
    2150:	1fff9428 	.word	0x1fff9428
    2154:	1fff942c 	.word	0x1fff942c
    2158:	e000ed04 	.word	0xe000ed04

0000215c <pendablesrvreq_isr>:
	}
	enableInterrupts(irq);
}

void pendablesrvreq_isr(void)
{
    215c:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    215e:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    2162:	b672      	cpsid	i

void EventResponder::runFromInterrupt()
{
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    2164:	4c0c      	ldr	r4, [pc, #48]	; (2198 <pendablesrvreq_isr+0x3c>)
    2166:	6820      	ldr	r0, [r4, #0]
		if (first) {
    2168:	b180      	cbz	r0, 218c <pendablesrvreq_isr+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    216a:	4e0c      	ldr	r6, [pc, #48]	; (219c <pendablesrvreq_isr+0x40>)
				firstInterrupt->_prev = nullptr;
    216c:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    216e:	6943      	ldr	r3, [r0, #20]
    2170:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    2172:	b173      	cbz	r3, 2192 <pendablesrvreq_isr+0x36>
				firstInterrupt->_prev = nullptr;
    2174:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    2176:	b902      	cbnz	r2, 217a <pendablesrvreq_isr+0x1e>
    2178:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    217a:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    217c:	6883      	ldr	r3, [r0, #8]
    217e:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2180:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    2184:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    2186:	6820      	ldr	r0, [r4, #0]
		if (first) {
    2188:	2800      	cmp	r0, #0
    218a:	d1f0      	bne.n	216e <pendablesrvreq_isr+0x12>
		if (doit) __enable_irq();
    218c:	b902      	cbnz	r2, 2190 <pendablesrvreq_isr+0x34>
    218e:	b662      	cpsie	i
    2190:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    2192:	6033      	str	r3, [r6, #0]
    2194:	e7ef      	b.n	2176 <pendablesrvreq_isr+0x1a>
    2196:	bf00      	nop
    2198:	1fff9428 	.word	0x1fff9428
    219c:	1fff942c 	.word	0x1fff942c

000021a0 <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    21a0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	MillisTimer *timer = listActive;
    21a4:	4d74      	ldr	r5, [pc, #464]	; (2378 <MillisTimer::runFromTimer()+0x1d8>)
    21a6:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    21a8:	2c00      	cmp	r4, #0
    21aa:	d031      	beq.n	2210 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    21ac:	6823      	ldr	r3, [r4, #0]
    21ae:	2b00      	cmp	r3, #0
    21b0:	d12c      	bne.n	220c <MillisTimer::runFromTimer()+0x6c>
    21b2:	f8df 91d8 	ldr.w	r9, [pc, #472]	; 238c <MillisTimer::runFromTimer()+0x1ec>
			if (firstInterrupt == nullptr) {
    21b6:	4f71      	ldr	r7, [pc, #452]	; (237c <MillisTimer::runFromTimer()+0x1dc>)
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    21b8:	f8df 81d4 	ldr.w	r8, [pc, #468]	; 2390 <MillisTimer::runFromTimer()+0x1f0>
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    21bc:	461e      	mov	r6, r3
			MillisTimer *next = timer->_next;
    21be:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    21c0:	b103      	cbz	r3, 21c4 <MillisTimer::runFromTimer()+0x24>
    21c2:	60de      	str	r6, [r3, #12]
			listActive = next;
			timer->_state = TimerOff;
			EventResponderRef event = *(timer->_event);
    21c4:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    21c6:	602b      	str	r3, [r5, #0]
			event.triggerEvent(0, timer);
    21c8:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    21ca:	7526      	strb	r6, [r4, #20]
			event.triggerEvent(0, timer);
    21cc:	681b      	ldr	r3, [r3, #0]
    21ce:	454b      	cmp	r3, r9
    21d0:	d157      	bne.n	2282 <MillisTimer::runFromTimer()+0xe2>
		if (_type == EventTypeImmediate) {
    21d2:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    21d4:	6046      	str	r6, [r0, #4]
		if (_type == EventTypeImmediate) {
    21d6:	2b02      	cmp	r3, #2
		_data = data;
    21d8:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    21da:	d056      	beq.n	228a <MillisTimer::runFromTimer()+0xea>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    21dc:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    21e0:	b672      	cpsid	i
	if (_triggered == false) {
    21e2:	7f43      	ldrb	r3, [r0, #29]
    21e4:	b943      	cbnz	r3, 21f8 <MillisTimer::runFromTimer()+0x58>
		if (_type == EventTypeYield) {
    21e6:	7f01      	ldrb	r1, [r0, #28]
    21e8:	2901      	cmp	r1, #1
    21ea:	f000 8088 	beq.w	22fe <MillisTimer::runFromTimer()+0x15e>
		} else if (_type == EventTypeInterrupt) {
    21ee:	2903      	cmp	r1, #3
    21f0:	f000 8091 	beq.w	2316 <MillisTimer::runFromTimer()+0x176>
		_triggered = true;
    21f4:	2301      	movs	r3, #1
    21f6:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    21f8:	b902      	cbnz	r2, 21fc <MillisTimer::runFromTimer()+0x5c>
    21fa:	b662      	cpsie	i
			if (timer->_reload) {
    21fc:	6863      	ldr	r3, [r4, #4]
    21fe:	2b00      	cmp	r3, #0
    2200:	d12c      	bne.n	225c <MillisTimer::runFromTimer()+0xbc>
    2202:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    2204:	b124      	cbz	r4, 2210 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    2206:	6823      	ldr	r3, [r4, #0]
    2208:	2b00      	cmp	r3, #0
    220a:	d0d8      	beq.n	21be <MillisTimer::runFromTimer()+0x1e>
			timer->_ms--;
    220c:	3b01      	subs	r3, #1
    220e:	6023      	str	r3, [r4, #0]
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2210:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    2214:	b672      	cpsid	i
			}
			timer = listActive;
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    2216:	4a5a      	ldr	r2, [pc, #360]	; (2380 <MillisTimer::runFromTimer()+0x1e0>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2218:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    221a:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    221c:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    221e:	b903      	cbnz	r3, 2222 <MillisTimer::runFromTimer()+0x82>
    2220:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    2222:	2800      	cmp	r0, #0
    2224:	f000 80a5 	beq.w	2372 <MillisTimer::runFromTimer()+0x1d2>
    2228:	682c      	ldr	r4, [r5, #0]
	_state = TimerActive;
    222a:	2702      	movs	r7, #2
		_prev = nullptr;
    222c:	f04f 0e00 	mov.w	lr, #0
		MillisTimer *next = waiting->_next;
    2230:	6886      	ldr	r6, [r0, #8]
	if (listActive == nullptr) {
    2232:	2c00      	cmp	r4, #0
    2234:	d05f      	beq.n	22f6 <MillisTimer::runFromTimer()+0x156>
	} else if (_ms < listActive->_ms) {
    2236:	6803      	ldr	r3, [r0, #0]
    2238:	6821      	ldr	r1, [r4, #0]
    223a:	428b      	cmp	r3, r1
    223c:	d23a      	bcs.n	22b4 <MillisTimer::runFromTimer()+0x114>
		listActive->_ms -= _ms;	
    223e:	1acb      	subs	r3, r1, r3
		_next = listActive;
    2240:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2242:	f8c0 e00c 	str.w	lr, [r0, #12]
		listActive->_ms -= _ms;	
    2246:	4601      	mov	r1, r0
    2248:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    224a:	60e0      	str	r0, [r4, #12]
	_state = TimerActive;
    224c:	7507      	strb	r7, [r0, #20]
    224e:	4630      	mov	r0, r6
    2250:	460c      	mov	r4, r1
	while (waiting) {
    2252:	2e00      	cmp	r6, #0
    2254:	d1ec      	bne.n	2230 <MillisTimer::runFromTimer()+0x90>
    2256:	6029      	str	r1, [r5, #0]
    2258:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	if (listActive == nullptr) {
    225c:	6828      	ldr	r0, [r5, #0]
    225e:	4a46      	ldr	r2, [pc, #280]	; (2378 <MillisTimer::runFromTimer()+0x1d8>)
				timer->_ms = timer->_reload;
    2260:	6023      	str	r3, [r4, #0]
	if (listActive == nullptr) {
    2262:	2800      	cmp	r0, #0
    2264:	d073      	beq.n	234e <MillisTimer::runFromTimer()+0x1ae>
	} else if (_ms < listActive->_ms) {
    2266:	6801      	ldr	r1, [r0, #0]
    2268:	428b      	cmp	r3, r1
    226a:	d211      	bcs.n	2290 <MillisTimer::runFromTimer()+0xf0>
		listActive->_ms -= _ms;	
    226c:	1acb      	subs	r3, r1, r3
		_next = listActive;
    226e:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2270:	60e6      	str	r6, [r4, #12]
		listActive->_ms -= _ms;	
    2272:	6003      	str	r3, [r0, #0]
		listActive->_prev = this;
    2274:	60c4      	str	r4, [r0, #12]
		listActive = this;
    2276:	6014      	str	r4, [r2, #0]
    2278:	4620      	mov	r0, r4
	_state = TimerActive;
    227a:	2302      	movs	r3, #2
    227c:	7523      	strb	r3, [r4, #20]
    227e:	4604      	mov	r4, r0
    2280:	e7c1      	b.n	2206 <MillisTimer::runFromTimer()+0x66>
			event.triggerEvent(0, timer);
    2282:	4622      	mov	r2, r4
    2284:	2100      	movs	r1, #0
    2286:	4798      	blx	r3
    2288:	e7b8      	b.n	21fc <MillisTimer::runFromTimer()+0x5c>
			(*_function)(*this);
    228a:	6883      	ldr	r3, [r0, #8]
    228c:	4798      	blx	r3
    228e:	e7b5      	b.n	21fc <MillisTimer::runFromTimer()+0x5c>
	} else if (_ms < listActive->_ms) {
    2290:	4686      	mov	lr, r0
    2292:	e003      	b.n	229c <MillisTimer::runFromTimer()+0xfc>
			if (_ms < timer->_ms) {
    2294:	6811      	ldr	r1, [r2, #0]
    2296:	428b      	cmp	r3, r1
    2298:	4696      	mov	lr, r2
    229a:	d349      	bcc.n	2330 <MillisTimer::runFromTimer()+0x190>
		while (timer->_next) {
    229c:	f8de 2008 	ldr.w	r2, [lr, #8]
		_ms -= timer->_ms;
    22a0:	1a5b      	subs	r3, r3, r1
    22a2:	6023      	str	r3, [r4, #0]
		while (timer->_next) {
    22a4:	2a00      	cmp	r2, #0
    22a6:	d1f5      	bne.n	2294 <MillisTimer::runFromTimer()+0xf4>
		_next = nullptr;
    22a8:	60a2      	str	r2, [r4, #8]
		_prev = timer;
    22aa:	f8c4 e00c 	str.w	lr, [r4, #12]
		timer->_next = this;
    22ae:	f8ce 4008 	str.w	r4, [lr, #8]
    22b2:	e7e2      	b.n	227a <MillisTimer::runFromTimer()+0xda>
	} else if (_ms < listActive->_ms) {
    22b4:	46a4      	mov	ip, r4
    22b6:	e003      	b.n	22c0 <MillisTimer::runFromTimer()+0x120>
			if (_ms < timer->_ms) {
    22b8:	6811      	ldr	r1, [r2, #0]
    22ba:	428b      	cmp	r3, r1
    22bc:	4694      	mov	ip, r2
    22be:	d30c      	bcc.n	22da <MillisTimer::runFromTimer()+0x13a>
		while (timer->_next) {
    22c0:	f8dc 2008 	ldr.w	r2, [ip, #8]
		_ms -= timer->_ms;
    22c4:	1a5b      	subs	r3, r3, r1
    22c6:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    22c8:	2a00      	cmp	r2, #0
    22ca:	d1f5      	bne.n	22b8 <MillisTimer::runFromTimer()+0x118>
		_next = nullptr;
    22cc:	6082      	str	r2, [r0, #8]
		_prev = timer;
    22ce:	f8c0 c00c 	str.w	ip, [r0, #12]
		timer->_next = this;
    22d2:	4621      	mov	r1, r4
    22d4:	f8cc 0008 	str.w	r0, [ip, #8]
    22d8:	e7b8      	b.n	224c <MillisTimer::runFromTimer()+0xac>
				_prev = timer->_prev;
    22da:	68d2      	ldr	r2, [r2, #12]
    22dc:	60c2      	str	r2, [r0, #12]
				_next = timer;
    22de:	f8c0 c008 	str.w	ip, [r0, #8]
				timer->_prev = this;
    22e2:	f8cc 000c 	str.w	r0, [ip, #12]
				_prev->_next = this;
    22e6:	68c2      	ldr	r2, [r0, #12]
				timer->_ms -= _ms;
    22e8:	1acb      	subs	r3, r1, r3
				_prev->_next = this;
    22ea:	6090      	str	r0, [r2, #8]
				_state = TimerActive;
    22ec:	4621      	mov	r1, r4
				timer->_ms -= _ms;
    22ee:	f8cc 3000 	str.w	r3, [ip]
				_state = TimerActive;
    22f2:	7507      	strb	r7, [r0, #20]
    22f4:	e7ab      	b.n	224e <MillisTimer::runFromTimer()+0xae>
		_next = nullptr;
    22f6:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    22f8:	60c4      	str	r4, [r0, #12]
    22fa:	4601      	mov	r1, r0
    22fc:	e7a6      	b.n	224c <MillisTimer::runFromTimer()+0xac>
			if (firstYield == nullptr) {
    22fe:	f8df e094 	ldr.w	lr, [pc, #148]	; 2394 <MillisTimer::runFromTimer()+0x1f4>
    2302:	f8de 1000 	ldr.w	r1, [lr]
    2306:	b339      	cbz	r1, 2358 <MillisTimer::runFromTimer()+0x1b8>
				_prev = lastYield;
    2308:	491e      	ldr	r1, [pc, #120]	; (2384 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    230a:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    230c:	680b      	ldr	r3, [r1, #0]
    230e:	6183      	str	r3, [r0, #24]
				lastYield = this;
    2310:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2312:	6158      	str	r0, [r3, #20]
    2314:	e76e      	b.n	21f4 <MillisTimer::runFromTimer()+0x54>
			if (firstInterrupt == nullptr) {
    2316:	6839      	ldr	r1, [r7, #0]
    2318:	b329      	cbz	r1, 2366 <MillisTimer::runFromTimer()+0x1c6>
				_prev = lastInterrupt;
    231a:	491b      	ldr	r1, [pc, #108]	; (2388 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    231c:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    231e:	680b      	ldr	r3, [r1, #0]
    2320:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    2322:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2324:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2326:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    232a:	f8c8 3000 	str.w	r3, [r8]
    232e:	e761      	b.n	21f4 <MillisTimer::runFromTimer()+0x54>
				_prev = timer->_prev;
    2330:	68d2      	ldr	r2, [r2, #12]
    2332:	60e2      	str	r2, [r4, #12]
				_next = timer;
    2334:	f8c4 e008 	str.w	lr, [r4, #8]
				timer->_prev = this;
    2338:	f8ce 400c 	str.w	r4, [lr, #12]
				_prev->_next = this;
    233c:	68e2      	ldr	r2, [r4, #12]
				timer->_ms -= _ms;
    233e:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    2340:	2102      	movs	r1, #2
				_prev->_next = this;
    2342:	6094      	str	r4, [r2, #8]
				timer->_ms -= _ms;
    2344:	f8ce 3000 	str.w	r3, [lr]
				_state = TimerActive;
    2348:	7521      	strb	r1, [r4, #20]
    234a:	4604      	mov	r4, r0
    234c:	e75b      	b.n	2206 <MillisTimer::runFromTimer()+0x66>
		_next = nullptr;
    234e:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2350:	60e0      	str	r0, [r4, #12]
		listActive = this;
    2352:	6014      	str	r4, [r2, #0]
    2354:	4620      	mov	r0, r4
    2356:	e790      	b.n	227a <MillisTimer::runFromTimer()+0xda>
				lastYield = this;
    2358:	4b0a      	ldr	r3, [pc, #40]	; (2384 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    235a:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    235c:	6181      	str	r1, [r0, #24]
				firstYield = this;
    235e:	f8ce 0000 	str.w	r0, [lr]
				lastYield = this;
    2362:	6018      	str	r0, [r3, #0]
    2364:	e746      	b.n	21f4 <MillisTimer::runFromTimer()+0x54>
				lastInterrupt = this;
    2366:	4b08      	ldr	r3, [pc, #32]	; (2388 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2368:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    236a:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    236c:	6038      	str	r0, [r7, #0]
				lastInterrupt = this;
    236e:	6018      	str	r0, [r3, #0]
    2370:	e7d9      	b.n	2326 <MillisTimer::runFromTimer()+0x186>
    2372:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    2376:	bf00      	nop
    2378:	1fff9430 	.word	0x1fff9430
    237c:	1fff9428 	.word	0x1fff9428
    2380:	1fff9440 	.word	0x1fff9440
    2384:	1fff9434 	.word	0x1fff9434
    2388:	1fff942c 	.word	0x1fff942c
    238c:	000020cd 	.word	0x000020cd
    2390:	e000ed04 	.word	0xe000ed04
    2394:	1fff9438 	.word	0x1fff9438

00002398 <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    2398:	4a02      	ldr	r2, [pc, #8]	; (23a4 <systick_isr+0xc>)
    239a:	6813      	ldr	r3, [r2, #0]
    239c:	3301      	adds	r3, #1
    239e:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    23a0:	f7ff befe 	b.w	21a0 <MillisTimer::runFromTimer()>
    23a4:	1fff9328 	.word	0x1fff9328

000023a8 <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    23a8:	4770      	bx	lr
    23aa:	bf00      	nop

000023ac <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    23ac:	4770      	bx	lr
    23ae:	bf00      	nop

000023b0 <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    23b0:	4770      	bx	lr
    23b2:	bf00      	nop

000023b4 <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    23b4:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    23b6:	4829      	ldr	r0, [pc, #164]	; (245c <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    23b8:	4a29      	ldr	r2, [pc, #164]	; (2460 <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    23ba:	4b2a      	ldr	r3, [pc, #168]	; (2464 <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    23bc:	4d2a      	ldr	r5, [pc, #168]	; (2468 <analog_init+0xb4>)
	VREF_TRM = 0x60;
    23be:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    23c0:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    23c2:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    23c4:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    23c6:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    23c8:	4c28      	ldr	r4, [pc, #160]	; (246c <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    23ca:	2b08      	cmp	r3, #8
    23cc:	d030      	beq.n	2430 <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    23ce:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    23d0:	4827      	ldr	r0, [pc, #156]	; (2470 <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    23d2:	4928      	ldr	r1, [pc, #160]	; (2474 <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    23d4:	d037      	beq.n	2446 <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    23d6:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    23d8:	bf0c      	ite	eq
    23da:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    23dc:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    23de:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    23e0:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    23e2:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    23e4:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    23e6:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    23e8:	4b23      	ldr	r3, [pc, #140]	; (2478 <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    23ea:	4924      	ldr	r1, [pc, #144]	; (247c <analog_init+0xc8>)
	if (analog_reference_internal) {
    23ec:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    23ee:	4a24      	ldr	r2, [pc, #144]	; (2480 <analog_init+0xcc>)
	if (analog_reference_internal) {
    23f0:	b1bb      	cbz	r3, 2422 <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    23f2:	2301      	movs	r3, #1
    23f4:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    23f6:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    23f8:	4b22      	ldr	r3, [pc, #136]	; (2484 <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    23fa:	4923      	ldr	r1, [pc, #140]	; (2488 <analog_init+0xd4>)
	num = analog_num_average;
    23fc:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    23fe:	4a23      	ldr	r2, [pc, #140]	; (248c <analog_init+0xd8>)
	if (num <= 1) {
    2400:	2b01      	cmp	r3, #1
    2402:	d926      	bls.n	2452 <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    2404:	2b04      	cmp	r3, #4
    2406:	d90f      	bls.n	2428 <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    2408:	2b08      	cmp	r3, #8
    240a:	d91e      	bls.n	244a <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    240c:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    240e:	bf94      	ite	ls
    2410:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2412:	2387      	movhi	r3, #135	; 0x87
    2414:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2416:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    2418:	4b1d      	ldr	r3, [pc, #116]	; (2490 <analog_init+0xdc>)
    241a:	2201      	movs	r2, #1
    241c:	701a      	strb	r2, [r3, #0]
}
    241e:	bc30      	pop	{r4, r5}
    2420:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2422:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2424:	6013      	str	r3, [r2, #0]
    2426:	e7e7      	b.n	23f8 <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2428:	2384      	movs	r3, #132	; 0x84
    242a:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    242c:	6013      	str	r3, [r2, #0]
    242e:	e7f3      	b.n	2418 <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2430:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2434:	490f      	ldr	r1, [pc, #60]	; (2474 <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2436:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2438:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    243a:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    243c:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    243e:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2440:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2442:	600b      	str	r3, [r1, #0]
    2444:	e7d0      	b.n	23e8 <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2446:	2239      	movs	r2, #57	; 0x39
    2448:	e7f7      	b.n	243a <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    244a:	2385      	movs	r3, #133	; 0x85
    244c:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    244e:	6013      	str	r3, [r2, #0]
    2450:	e7e2      	b.n	2418 <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    2452:	2380      	movs	r3, #128	; 0x80
    2454:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2456:	6013      	str	r3, [r2, #0]
    2458:	e7de      	b.n	2418 <analog_init+0x64>
    245a:	bf00      	nop
    245c:	40074000 	.word	0x40074000
    2460:	40074001 	.word	0x40074001
    2464:	1fff890c 	.word	0x1fff890c
    2468:	4003b008 	.word	0x4003b008
    246c:	4003b00c 	.word	0x4003b00c
    2470:	400bb008 	.word	0x400bb008
    2474:	400bb00c 	.word	0x400bb00c
    2478:	1fff9445 	.word	0x1fff9445
    247c:	4003b020 	.word	0x4003b020
    2480:	400bb020 	.word	0x400bb020
    2484:	1fff890d 	.word	0x1fff890d
    2488:	4003b024 	.word	0x4003b024
    248c:	400bb024 	.word	0x400bb024
    2490:	1fff9444 	.word	0x1fff9444

00002494 <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2494:	4a05      	ldr	r2, [pc, #20]	; (24ac <serial_available+0x18>)
	tail = rx_buffer_tail;
    2496:	4b06      	ldr	r3, [pc, #24]	; (24b0 <serial_available+0x1c>)
	head = rx_buffer_head;
    2498:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    249a:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    249c:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    249e:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    24a0:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    24a2:	bf38      	it	cc
    24a4:	3040      	addcc	r0, #64	; 0x40
    24a6:	1ac0      	subs	r0, r0, r3
}
    24a8:	4770      	bx	lr
    24aa:	bf00      	nop
    24ac:	1fff94d0 	.word	0x1fff94d0
    24b0:	1fff944d 	.word	0x1fff944d

000024b4 <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    24b4:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    24b6:	4b38      	ldr	r3, [pc, #224]	; (2598 <uart0_status_isr+0xe4>)
    24b8:	791a      	ldrb	r2, [r3, #4]
    24ba:	f012 0f30 	tst.w	r2, #48	; 0x30
    24be:	d02c      	beq.n	251a <uart0_status_isr+0x66>
		__disable_irq();
    24c0:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    24c2:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    24c4:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    24c8:	2900      	cmp	r1, #0
    24ca:	d03d      	beq.n	2548 <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    24cc:	b662      	cpsie	i
			head = rx_buffer_head;
    24ce:	4f33      	ldr	r7, [pc, #204]	; (259c <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    24d0:	4933      	ldr	r1, [pc, #204]	; (25a0 <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    24d2:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    24d4:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    24d6:	4e33      	ldr	r6, [pc, #204]	; (25a4 <uart0_status_isr+0xf0>)
					n = UART0_D;
    24d8:	461c      	mov	r4, r3
			head = rx_buffer_head;
    24da:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    24dc:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    24de:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    24e0:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    24e2:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    24e4:	bf28      	it	cs
    24e6:	2300      	movcs	r3, #0
				if (newhead != tail) {
    24e8:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    24ea:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    24ee:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    24f0:	bf1c      	itt	ne
    24f2:	54f1      	strbne	r1, [r6, r3]
    24f4:	4618      	movne	r0, r3
			} while (--avail > 0);
    24f6:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    24fa:	d1f0      	bne.n	24de <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    24fc:	4b2a      	ldr	r3, [pc, #168]	; (25a8 <uart0_status_isr+0xf4>)
    24fe:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2500:	b2c2      	uxtb	r2, r0
    2502:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2504:	b14b      	cbz	r3, 251a <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2506:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2508:	bf36      	itet	cc
    250a:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    250e:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2510:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2512:	2827      	cmp	r0, #39	; 0x27
    2514:	bfc4      	itt	gt
    2516:	2201      	movgt	r2, #1
    2518:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    251a:	491f      	ldr	r1, [pc, #124]	; (2598 <uart0_status_isr+0xe4>)
    251c:	78ca      	ldrb	r2, [r1, #3]
    251e:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2520:	0615      	lsls	r5, r2, #24
    2522:	d416      	bmi.n	2552 <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    2524:	0652      	lsls	r2, r2, #25
    2526:	d50d      	bpl.n	2544 <uart0_status_isr+0x90>
    2528:	4b1b      	ldr	r3, [pc, #108]	; (2598 <uart0_status_isr+0xe4>)
    252a:	791b      	ldrb	r3, [r3, #4]
    252c:	065b      	lsls	r3, r3, #25
    252e:	d509      	bpl.n	2544 <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2530:	4b1e      	ldr	r3, [pc, #120]	; (25ac <uart0_status_isr+0xf8>)
		transmitting = 0;
    2532:	491f      	ldr	r1, [pc, #124]	; (25b0 <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2534:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2536:	2200      	movs	r2, #0
    2538:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    253a:	b103      	cbz	r3, 253e <uart0_status_isr+0x8a>
    253c:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    253e:	4b16      	ldr	r3, [pc, #88]	; (2598 <uart0_status_isr+0xe4>)
    2540:	223c      	movs	r2, #60	; 0x3c
    2542:	70da      	strb	r2, [r3, #3]
	}
}
    2544:	bcf0      	pop	{r4, r5, r6, r7}
    2546:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2548:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    254a:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    254c:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    254e:	b662      	cpsie	i
    2550:	e7e3      	b.n	251a <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2552:	790b      	ldrb	r3, [r1, #4]
    2554:	061c      	lsls	r4, r3, #24
    2556:	d5e5      	bpl.n	2524 <uart0_status_isr+0x70>
		head = tx_buffer_head;
    2558:	4b16      	ldr	r3, [pc, #88]	; (25b4 <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    255a:	4e17      	ldr	r6, [pc, #92]	; (25b8 <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    255c:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    255e:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2560:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    2562:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2564:	429c      	cmp	r4, r3
    2566:	d00e      	beq.n	2586 <uart0_status_isr+0xd2>
    2568:	4d14      	ldr	r5, [pc, #80]	; (25bc <uart0_status_isr+0x108>)
    256a:	e001      	b.n	2570 <uart0_status_isr+0xbc>
    256c:	42a3      	cmp	r3, r4
    256e:	d00a      	beq.n	2586 <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    2570:	3301      	adds	r3, #1
    2572:	2b40      	cmp	r3, #64	; 0x40
    2574:	bf28      	it	cs
    2576:	2300      	movcs	r3, #0
			avail = UART0_S1;
    2578:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    257a:	5ce8      	ldrb	r0, [r5, r3]
    257c:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    257e:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    2580:	7d08      	ldrb	r0, [r1, #20]
    2582:	2807      	cmp	r0, #7
    2584:	d9f2      	bls.n	256c <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    2586:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    2588:	4903      	ldr	r1, [pc, #12]	; (2598 <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    258a:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    258c:	790b      	ldrb	r3, [r1, #4]
    258e:	0618      	lsls	r0, r3, #24
    2590:	bf44      	itt	mi
    2592:	237c      	movmi	r3, #124	; 0x7c
    2594:	70cb      	strbmi	r3, [r1, #3]
    2596:	e7c5      	b.n	2524 <uart0_status_isr+0x70>
    2598:	4006a000 	.word	0x4006a000
    259c:	1fff94d0 	.word	0x1fff94d0
    25a0:	1fff944d 	.word	0x1fff944d
    25a4:	1fff9490 	.word	0x1fff9490
    25a8:	1fff9448 	.word	0x1fff9448
    25ac:	1fff94d4 	.word	0x1fff94d4
    25b0:	1fff944c 	.word	0x1fff944c
    25b4:	1fff94d8 	.word	0x1fff94d8
    25b8:	1fff94d1 	.word	0x1fff94d1
    25bc:	1fff9450 	.word	0x1fff9450

000025c0 <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    25c0:	4a05      	ldr	r2, [pc, #20]	; (25d8 <serial2_available+0x18>)
	tail = rx_buffer_tail;
    25c2:	4b06      	ldr	r3, [pc, #24]	; (25dc <serial2_available+0x1c>)
	head = rx_buffer_head;
    25c4:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    25c6:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    25c8:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    25ca:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    25cc:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    25ce:	bf38      	it	cc
    25d0:	3040      	addcc	r0, #64	; 0x40
    25d2:	1ac0      	subs	r0, r0, r3
}
    25d4:	4770      	bx	lr
    25d6:	bf00      	nop
    25d8:	1fff954c 	.word	0x1fff954c
    25dc:	1fff94e1 	.word	0x1fff94e1

000025e0 <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    25e0:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    25e2:	4b38      	ldr	r3, [pc, #224]	; (26c4 <uart1_status_isr+0xe4>)
    25e4:	791a      	ldrb	r2, [r3, #4]
    25e6:	f012 0f30 	tst.w	r2, #48	; 0x30
    25ea:	d02c      	beq.n	2646 <uart1_status_isr+0x66>
		__disable_irq();
    25ec:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    25ee:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    25f0:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    25f4:	2900      	cmp	r1, #0
    25f6:	d03d      	beq.n	2674 <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    25f8:	b662      	cpsie	i
			head = rx_buffer_head;
    25fa:	4f33      	ldr	r7, [pc, #204]	; (26c8 <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    25fc:	4933      	ldr	r1, [pc, #204]	; (26cc <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    25fe:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2600:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2602:	4e33      	ldr	r6, [pc, #204]	; (26d0 <uart1_status_isr+0xf0>)
					n = UART1_D;
    2604:	461c      	mov	r4, r3
			head = rx_buffer_head;
    2606:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2608:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    260a:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    260c:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    260e:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2610:	bf28      	it	cs
    2612:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2614:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2616:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    261a:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    261c:	bf1c      	itt	ne
    261e:	54f1      	strbne	r1, [r6, r3]
    2620:	4618      	movne	r0, r3
			} while (--avail > 0);
    2622:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2626:	d1f0      	bne.n	260a <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2628:	4b2a      	ldr	r3, [pc, #168]	; (26d4 <uart1_status_isr+0xf4>)
    262a:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    262c:	b2c2      	uxtb	r2, r0
    262e:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2630:	b14b      	cbz	r3, 2646 <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2632:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2634:	bf36      	itet	cc
    2636:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    263a:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    263c:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    263e:	2827      	cmp	r0, #39	; 0x27
    2640:	bfc4      	itt	gt
    2642:	2201      	movgt	r2, #1
    2644:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    2646:	491f      	ldr	r1, [pc, #124]	; (26c4 <uart1_status_isr+0xe4>)
    2648:	78ca      	ldrb	r2, [r1, #3]
    264a:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    264c:	0615      	lsls	r5, r2, #24
    264e:	d416      	bmi.n	267e <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    2650:	0652      	lsls	r2, r2, #25
    2652:	d50d      	bpl.n	2670 <uart1_status_isr+0x90>
    2654:	4b1b      	ldr	r3, [pc, #108]	; (26c4 <uart1_status_isr+0xe4>)
    2656:	791b      	ldrb	r3, [r3, #4]
    2658:	065b      	lsls	r3, r3, #25
    265a:	d509      	bpl.n	2670 <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    265c:	4b1e      	ldr	r3, [pc, #120]	; (26d8 <uart1_status_isr+0xf8>)
		transmitting = 0;
    265e:	491f      	ldr	r1, [pc, #124]	; (26dc <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2660:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2662:	2200      	movs	r2, #0
    2664:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2666:	b103      	cbz	r3, 266a <uart1_status_isr+0x8a>
    2668:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    266a:	4b16      	ldr	r3, [pc, #88]	; (26c4 <uart1_status_isr+0xe4>)
    266c:	223c      	movs	r2, #60	; 0x3c
    266e:	70da      	strb	r2, [r3, #3]
	}
}
    2670:	bcf0      	pop	{r4, r5, r6, r7}
    2672:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2674:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    2676:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2678:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    267a:	b662      	cpsie	i
    267c:	e7e3      	b.n	2646 <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    267e:	790b      	ldrb	r3, [r1, #4]
    2680:	061c      	lsls	r4, r3, #24
    2682:	d5e5      	bpl.n	2650 <uart1_status_isr+0x70>
		head = tx_buffer_head;
    2684:	4b16      	ldr	r3, [pc, #88]	; (26e0 <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    2686:	4e17      	ldr	r6, [pc, #92]	; (26e4 <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    2688:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    268a:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    268c:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    268e:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2690:	429c      	cmp	r4, r3
    2692:	d00e      	beq.n	26b2 <uart1_status_isr+0xd2>
    2694:	4d14      	ldr	r5, [pc, #80]	; (26e8 <uart1_status_isr+0x108>)
    2696:	e001      	b.n	269c <uart1_status_isr+0xbc>
    2698:	42a3      	cmp	r3, r4
    269a:	d00a      	beq.n	26b2 <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    269c:	3301      	adds	r3, #1
    269e:	2b28      	cmp	r3, #40	; 0x28
    26a0:	bf28      	it	cs
    26a2:	2300      	movcs	r3, #0
			avail = UART1_S1;
    26a4:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    26a6:	5ce8      	ldrb	r0, [r5, r3]
    26a8:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    26aa:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    26ac:	7d08      	ldrb	r0, [r1, #20]
    26ae:	2807      	cmp	r0, #7
    26b0:	d9f2      	bls.n	2698 <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    26b2:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    26b4:	4903      	ldr	r1, [pc, #12]	; (26c4 <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    26b6:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    26b8:	790b      	ldrb	r3, [r1, #4]
    26ba:	0618      	lsls	r0, r3, #24
    26bc:	bf44      	itt	mi
    26be:	237c      	movmi	r3, #124	; 0x7c
    26c0:	70cb      	strbmi	r3, [r1, #3]
    26c2:	e7c5      	b.n	2650 <uart1_status_isr+0x70>
    26c4:	4006b000 	.word	0x4006b000
    26c8:	1fff954c 	.word	0x1fff954c
    26cc:	1fff94e1 	.word	0x1fff94e1
    26d0:	1fff950c 	.word	0x1fff950c
    26d4:	1fff94dc 	.word	0x1fff94dc
    26d8:	1fff9550 	.word	0x1fff9550
    26dc:	1fff94e0 	.word	0x1fff94e0
    26e0:	1fff9554 	.word	0x1fff9554
    26e4:	1fff954d 	.word	0x1fff954d
    26e8:	1fff94e4 	.word	0x1fff94e4

000026ec <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    26ec:	4a05      	ldr	r2, [pc, #20]	; (2704 <serial3_available+0x18>)
	tail = rx_buffer_tail;
    26ee:	4b06      	ldr	r3, [pc, #24]	; (2708 <serial3_available+0x1c>)
	head = rx_buffer_head;
    26f0:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    26f2:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    26f4:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    26f6:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    26f8:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    26fa:	bf38      	it	cc
    26fc:	3040      	addcc	r0, #64	; 0x40
    26fe:	1ac0      	subs	r0, r0, r3
}
    2700:	4770      	bx	lr
    2702:	bf00      	nop
    2704:	1fff95c8 	.word	0x1fff95c8
    2708:	1fff955d 	.word	0x1fff955d

0000270c <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    270c:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    270e:	4b2b      	ldr	r3, [pc, #172]	; (27bc <uart2_status_isr+0xb0>)
    2710:	791a      	ldrb	r2, [r3, #4]
    2712:	0694      	lsls	r4, r2, #26
    2714:	d51f      	bpl.n	2756 <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    2716:	482a      	ldr	r0, [pc, #168]	; (27c0 <uart2_status_isr+0xb4>)
			n = UART2_D;
    2718:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    271a:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    271c:	4929      	ldr	r1, [pc, #164]	; (27c4 <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    271e:	3301      	adds	r3, #1
    2720:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    2722:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    2724:	bfc8      	it	gt
    2726:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    2728:	428b      	cmp	r3, r1
			n = UART2_D;
    272a:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    272c:	d003      	beq.n	2736 <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    272e:	4c26      	ldr	r4, [pc, #152]	; (27c8 <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    2730:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    2732:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    2734:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    2736:	4a25      	ldr	r2, [pc, #148]	; (27cc <uart2_status_isr+0xc0>)
    2738:	6811      	ldr	r1, [r2, #0]
    273a:	b161      	cbz	r1, 2756 <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    273c:	4a24      	ldr	r2, [pc, #144]	; (27d0 <uart2_status_isr+0xc4>)
    273e:	7812      	ldrb	r2, [r2, #0]
    2740:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    2742:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2744:	bf36      	itet	cc
    2746:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    274a:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    274c:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    274e:	2b27      	cmp	r3, #39	; 0x27
    2750:	bfc4      	itt	gt
    2752:	2301      	movgt	r3, #1
    2754:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    2756:	4a19      	ldr	r2, [pc, #100]	; (27bc <uart2_status_isr+0xb0>)
    2758:	78d3      	ldrb	r3, [r2, #3]
    275a:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    275c:	0618      	lsls	r0, r3, #24
    275e:	d411      	bmi.n	2784 <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    2760:	065a      	lsls	r2, r3, #25
    2762:	d50d      	bpl.n	2780 <uart2_status_isr+0x74>
    2764:	4b15      	ldr	r3, [pc, #84]	; (27bc <uart2_status_isr+0xb0>)
    2766:	791b      	ldrb	r3, [r3, #4]
    2768:	065b      	lsls	r3, r3, #25
    276a:	d509      	bpl.n	2780 <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    276c:	4b19      	ldr	r3, [pc, #100]	; (27d4 <uart2_status_isr+0xc8>)
		transmitting = 0;
    276e:	491a      	ldr	r1, [pc, #104]	; (27d8 <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    2770:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2772:	2200      	movs	r2, #0
    2774:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2776:	b103      	cbz	r3, 277a <uart2_status_isr+0x6e>
    2778:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    277a:	4b10      	ldr	r3, [pc, #64]	; (27bc <uart2_status_isr+0xb0>)
    277c:	222c      	movs	r2, #44	; 0x2c
    277e:	70da      	strb	r2, [r3, #3]
	}
}
    2780:	bc30      	pop	{r4, r5}
    2782:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2784:	7911      	ldrb	r1, [r2, #4]
    2786:	0609      	lsls	r1, r1, #24
    2788:	d5ea      	bpl.n	2760 <uart2_status_isr+0x54>
		head = tx_buffer_head;
    278a:	4914      	ldr	r1, [pc, #80]	; (27dc <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    278c:	4810      	ldr	r0, [pc, #64]	; (27d0 <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    278e:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    2790:	7801      	ldrb	r1, [r0, #0]
    2792:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    2794:	428c      	cmp	r4, r1
    2796:	d00d      	beq.n	27b4 <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    2798:	1c4a      	adds	r2, r1, #1
    279a:	2a27      	cmp	r2, #39	; 0x27
    279c:	bf84      	itt	hi
    279e:	2100      	movhi	r1, #0
    27a0:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    27a2:	4d0f      	ldr	r5, [pc, #60]	; (27e0 <uart2_status_isr+0xd4>)
			UART2_D = n;
    27a4:	4c05      	ldr	r4, [pc, #20]	; (27bc <uart2_status_isr+0xb0>)
    27a6:	bf98      	it	ls
    27a8:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    27aa:	5caa      	ldrb	r2, [r5, r2]
    27ac:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    27ae:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    27b0:	7001      	strb	r1, [r0, #0]
    27b2:	e7d5      	b.n	2760 <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    27b4:	216c      	movs	r1, #108	; 0x6c
    27b6:	70d1      	strb	r1, [r2, #3]
    27b8:	e7d2      	b.n	2760 <uart2_status_isr+0x54>
    27ba:	bf00      	nop
    27bc:	4006c000 	.word	0x4006c000
    27c0:	1fff95c8 	.word	0x1fff95c8
    27c4:	1fff955d 	.word	0x1fff955d
    27c8:	1fff9588 	.word	0x1fff9588
    27cc:	1fff9558 	.word	0x1fff9558
    27d0:	1fff95c9 	.word	0x1fff95c9
    27d4:	1fff95cc 	.word	0x1fff95cc
    27d8:	1fff955c 	.word	0x1fff955c
    27dc:	1fff95d0 	.word	0x1fff95d0
    27e0:	1fff9560 	.word	0x1fff9560

000027e4 <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    27e4:	b570      	push	{r4, r5, r6, lr}
    27e6:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    27e8:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    27ea:	4b30      	ldr	r3, [pc, #192]	; (28ac <usb_init_serialnumber+0xc8>)
	FTFL_FCCOB0 = 0x41;
    27ec:	4d30      	ldr	r5, [pc, #192]	; (28b0 <usb_init_serialnumber+0xcc>)
	FTFL_FCCOB1 = 15;
    27ee:	4831      	ldr	r0, [pc, #196]	; (28b4 <usb_init_serialnumber+0xd0>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    27f0:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    27f2:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    27f4:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    27f6:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    27f8:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    27fa:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    27fc:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    27fe:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2800:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2802:	7813      	ldrb	r3, [r2, #0]
    2804:	061b      	lsls	r3, r3, #24
    2806:	d5fc      	bpl.n	2802 <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    2808:	4b2b      	ldr	r3, [pc, #172]	; (28b8 <usb_init_serialnumber+0xd4>)
    280a:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    280c:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    280e:	4b2b      	ldr	r3, [pc, #172]	; (28bc <usb_init_serialnumber+0xd8>)
    2810:	4298      	cmp	r0, r3
    2812:	bf98      	it	ls
    2814:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    2818:	f04f 020a 	mov.w	r2, #10
	if (num < 10000000) num = num * 10;
    281c:	bf98      	it	ls
    281e:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    2820:	a901      	add	r1, sp, #4
    2822:	f7fe f917 	bl	a54 <ultoa>
	for (i=0; i<10; i++) {
		char c = buf[i];
    2826:	f89d 2004 	ldrb.w	r2, [sp, #4]
    282a:	4b25      	ldr	r3, [pc, #148]	; (28c0 <usb_init_serialnumber+0xdc>)
		if (!c) break;
    282c:	b352      	cbz	r2, 2884 <usb_init_serialnumber+0xa0>
		char c = buf[i];
    282e:	f89d 1005 	ldrb.w	r1, [sp, #5]
		usb_string_serial_number_default.wString[i] = c;
    2832:	805a      	strh	r2, [r3, #2]
		if (!c) break;
    2834:	b361      	cbz	r1, 2890 <usb_init_serialnumber+0xac>
		char c = buf[i];
    2836:	f89d 2006 	ldrb.w	r2, [sp, #6]
		usb_string_serial_number_default.wString[i] = c;
    283a:	8099      	strh	r1, [r3, #4]
		if (!c) break;
    283c:	b352      	cbz	r2, 2894 <usb_init_serialnumber+0xb0>
		char c = buf[i];
    283e:	f89d 1007 	ldrb.w	r1, [sp, #7]
		usb_string_serial_number_default.wString[i] = c;
    2842:	80da      	strh	r2, [r3, #6]
		if (!c) break;
    2844:	b341      	cbz	r1, 2898 <usb_init_serialnumber+0xb4>
		char c = buf[i];
    2846:	f89d 2008 	ldrb.w	r2, [sp, #8]
		usb_string_serial_number_default.wString[i] = c;
    284a:	8119      	strh	r1, [r3, #8]
		if (!c) break;
    284c:	b332      	cbz	r2, 289c <usb_init_serialnumber+0xb8>
		char c = buf[i];
    284e:	f89d 1009 	ldrb.w	r1, [sp, #9]
		usb_string_serial_number_default.wString[i] = c;
    2852:	815a      	strh	r2, [r3, #10]
		if (!c) break;
    2854:	b321      	cbz	r1, 28a0 <usb_init_serialnumber+0xbc>
		char c = buf[i];
    2856:	f89d 200a 	ldrb.w	r2, [sp, #10]
		usb_string_serial_number_default.wString[i] = c;
    285a:	8199      	strh	r1, [r3, #12]
		if (!c) break;
    285c:	b312      	cbz	r2, 28a4 <usb_init_serialnumber+0xc0>
		char c = buf[i];
    285e:	f89d 100b 	ldrb.w	r1, [sp, #11]
		usb_string_serial_number_default.wString[i] = c;
    2862:	81da      	strh	r2, [r3, #14]
		if (!c) break;
    2864:	b301      	cbz	r1, 28a8 <usb_init_serialnumber+0xc4>
		char c = buf[i];
    2866:	f89d 200c 	ldrb.w	r2, [sp, #12]
		usb_string_serial_number_default.wString[i] = c;
    286a:	8219      	strh	r1, [r3, #16]
		if (!c) break;
    286c:	b14a      	cbz	r2, 2882 <usb_init_serialnumber+0x9e>
		char c = buf[i];
    286e:	f89d 100d 	ldrb.w	r1, [sp, #13]
		usb_string_serial_number_default.wString[i] = c;
    2872:	825a      	strh	r2, [r3, #18]
	for (i=0; i<10; i++) {
    2874:	2209      	movs	r2, #9
		if (!c) break;
    2876:	b129      	cbz	r1, 2884 <usb_init_serialnumber+0xa0>
    2878:	2216      	movs	r2, #22
		usb_string_serial_number_default.wString[i] = c;
    287a:	8299      	strh	r1, [r3, #20]
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    287c:	701a      	strb	r2, [r3, #0]
}
    287e:	b004      	add	sp, #16
    2880:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    2882:	2208      	movs	r2, #8
    2884:	3201      	adds	r2, #1
    2886:	0052      	lsls	r2, r2, #1
    2888:	b2d2      	uxtb	r2, r2
	usb_string_serial_number_default.bLength = i * 2 + 2;
    288a:	701a      	strb	r2, [r3, #0]
}
    288c:	b004      	add	sp, #16
    288e:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    2890:	2201      	movs	r2, #1
    2892:	e7f7      	b.n	2884 <usb_init_serialnumber+0xa0>
    2894:	2202      	movs	r2, #2
    2896:	e7f5      	b.n	2884 <usb_init_serialnumber+0xa0>
    2898:	2203      	movs	r2, #3
    289a:	e7f3      	b.n	2884 <usb_init_serialnumber+0xa0>
    289c:	2204      	movs	r2, #4
    289e:	e7f1      	b.n	2884 <usb_init_serialnumber+0xa0>
    28a0:	2205      	movs	r2, #5
    28a2:	e7ef      	b.n	2884 <usb_init_serialnumber+0xa0>
    28a4:	2206      	movs	r2, #6
    28a6:	e7ed      	b.n	2884 <usb_init_serialnumber+0xa0>
    28a8:	2207      	movs	r2, #7
    28aa:	e7eb      	b.n	2884 <usb_init_serialnumber+0xa0>
    28ac:	40020000 	.word	0x40020000
    28b0:	40020007 	.word	0x40020007
    28b4:	40020006 	.word	0x40020006
    28b8:	40020008 	.word	0x40020008
    28bc:	0098967f 	.word	0x0098967f
    28c0:	1fff899c 	.word	0x1fff899c

000028c4 <__aeabi_atexit>:
    28c4:	460b      	mov	r3, r1
    28c6:	4601      	mov	r1, r0
    28c8:	4618      	mov	r0, r3
    28ca:	f000 ba7f 	b.w	2dcc <__cxa_atexit>
    28ce:	bf00      	nop

000028d0 <__aeabi_frsub>:
    28d0:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
    28d4:	e002      	b.n	28dc <__addsf3>
    28d6:	bf00      	nop

000028d8 <__aeabi_fsub>:
    28d8:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

000028dc <__addsf3>:
    28dc:	0042      	lsls	r2, r0, #1
    28de:	bf1f      	itttt	ne
    28e0:	ea5f 0341 	movsne.w	r3, r1, lsl #1
    28e4:	ea92 0f03 	teqne	r2, r3
    28e8:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
    28ec:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    28f0:	d06a      	beq.n	29c8 <__addsf3+0xec>
    28f2:	ea4f 6212 	mov.w	r2, r2, lsr #24
    28f6:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
    28fa:	bfc1      	itttt	gt
    28fc:	18d2      	addgt	r2, r2, r3
    28fe:	4041      	eorgt	r1, r0
    2900:	4048      	eorgt	r0, r1
    2902:	4041      	eorgt	r1, r0
    2904:	bfb8      	it	lt
    2906:	425b      	neglt	r3, r3
    2908:	2b19      	cmp	r3, #25
    290a:	bf88      	it	hi
    290c:	4770      	bxhi	lr
    290e:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
    2912:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2916:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    291a:	bf18      	it	ne
    291c:	4240      	negne	r0, r0
    291e:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    2922:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
    2926:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
    292a:	bf18      	it	ne
    292c:	4249      	negne	r1, r1
    292e:	ea92 0f03 	teq	r2, r3
    2932:	d03f      	beq.n	29b4 <__addsf3+0xd8>
    2934:	f1a2 0201 	sub.w	r2, r2, #1
    2938:	fa41 fc03 	asr.w	ip, r1, r3
    293c:	eb10 000c 	adds.w	r0, r0, ip
    2940:	f1c3 0320 	rsb	r3, r3, #32
    2944:	fa01 f103 	lsl.w	r1, r1, r3
    2948:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    294c:	d502      	bpl.n	2954 <__addsf3+0x78>
    294e:	4249      	negs	r1, r1
    2950:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
    2954:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    2958:	d313      	bcc.n	2982 <__addsf3+0xa6>
    295a:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
    295e:	d306      	bcc.n	296e <__addsf3+0x92>
    2960:	0840      	lsrs	r0, r0, #1
    2962:	ea4f 0131 	mov.w	r1, r1, rrx
    2966:	f102 0201 	add.w	r2, r2, #1
    296a:	2afe      	cmp	r2, #254	; 0xfe
    296c:	d251      	bcs.n	2a12 <__addsf3+0x136>
    296e:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
    2972:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2976:	bf08      	it	eq
    2978:	f020 0001 	biceq.w	r0, r0, #1
    297c:	ea40 0003 	orr.w	r0, r0, r3
    2980:	4770      	bx	lr
    2982:	0049      	lsls	r1, r1, #1
    2984:	eb40 0000 	adc.w	r0, r0, r0
    2988:	f410 0f00 	tst.w	r0, #8388608	; 0x800000
    298c:	f1a2 0201 	sub.w	r2, r2, #1
    2990:	d1ed      	bne.n	296e <__addsf3+0x92>
    2992:	fab0 fc80 	clz	ip, r0
    2996:	f1ac 0c08 	sub.w	ip, ip, #8
    299a:	ebb2 020c 	subs.w	r2, r2, ip
    299e:	fa00 f00c 	lsl.w	r0, r0, ip
    29a2:	bfaa      	itet	ge
    29a4:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
    29a8:	4252      	neglt	r2, r2
    29aa:	4318      	orrge	r0, r3
    29ac:	bfbc      	itt	lt
    29ae:	40d0      	lsrlt	r0, r2
    29b0:	4318      	orrlt	r0, r3
    29b2:	4770      	bx	lr
    29b4:	f092 0f00 	teq	r2, #0
    29b8:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
    29bc:	bf06      	itte	eq
    29be:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
    29c2:	3201      	addeq	r2, #1
    29c4:	3b01      	subne	r3, #1
    29c6:	e7b5      	b.n	2934 <__addsf3+0x58>
    29c8:	ea4f 0341 	mov.w	r3, r1, lsl #1
    29cc:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    29d0:	bf18      	it	ne
    29d2:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    29d6:	d021      	beq.n	2a1c <__addsf3+0x140>
    29d8:	ea92 0f03 	teq	r2, r3
    29dc:	d004      	beq.n	29e8 <__addsf3+0x10c>
    29de:	f092 0f00 	teq	r2, #0
    29e2:	bf08      	it	eq
    29e4:	4608      	moveq	r0, r1
    29e6:	4770      	bx	lr
    29e8:	ea90 0f01 	teq	r0, r1
    29ec:	bf1c      	itt	ne
    29ee:	2000      	movne	r0, #0
    29f0:	4770      	bxne	lr
    29f2:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
    29f6:	d104      	bne.n	2a02 <__addsf3+0x126>
    29f8:	0040      	lsls	r0, r0, #1
    29fa:	bf28      	it	cs
    29fc:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
    2a00:	4770      	bx	lr
    2a02:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
    2a06:	bf3c      	itt	cc
    2a08:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
    2a0c:	4770      	bxcc	lr
    2a0e:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    2a12:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
    2a16:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2a1a:	4770      	bx	lr
    2a1c:	ea7f 6222 	mvns.w	r2, r2, asr #24
    2a20:	bf16      	itet	ne
    2a22:	4608      	movne	r0, r1
    2a24:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
    2a28:	4601      	movne	r1, r0
    2a2a:	0242      	lsls	r2, r0, #9
    2a2c:	bf06      	itte	eq
    2a2e:	ea5f 2341 	movseq.w	r3, r1, lsl #9
    2a32:	ea90 0f01 	teqeq	r0, r1
    2a36:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
    2a3a:	4770      	bx	lr

00002a3c <__aeabi_ui2f>:
    2a3c:	f04f 0300 	mov.w	r3, #0
    2a40:	e004      	b.n	2a4c <__aeabi_i2f+0x8>
    2a42:	bf00      	nop

00002a44 <__aeabi_i2f>:
    2a44:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
    2a48:	bf48      	it	mi
    2a4a:	4240      	negmi	r0, r0
    2a4c:	ea5f 0c00 	movs.w	ip, r0
    2a50:	bf08      	it	eq
    2a52:	4770      	bxeq	lr
    2a54:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
    2a58:	4601      	mov	r1, r0
    2a5a:	f04f 0000 	mov.w	r0, #0
    2a5e:	e01c      	b.n	2a9a <__aeabi_l2f+0x2a>

00002a60 <__aeabi_ul2f>:
    2a60:	ea50 0201 	orrs.w	r2, r0, r1
    2a64:	bf08      	it	eq
    2a66:	4770      	bxeq	lr
    2a68:	f04f 0300 	mov.w	r3, #0
    2a6c:	e00a      	b.n	2a84 <__aeabi_l2f+0x14>
    2a6e:	bf00      	nop

00002a70 <__aeabi_l2f>:
    2a70:	ea50 0201 	orrs.w	r2, r0, r1
    2a74:	bf08      	it	eq
    2a76:	4770      	bxeq	lr
    2a78:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
    2a7c:	d502      	bpl.n	2a84 <__aeabi_l2f+0x14>
    2a7e:	4240      	negs	r0, r0
    2a80:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    2a84:	ea5f 0c01 	movs.w	ip, r1
    2a88:	bf02      	ittt	eq
    2a8a:	4684      	moveq	ip, r0
    2a8c:	4601      	moveq	r1, r0
    2a8e:	2000      	moveq	r0, #0
    2a90:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
    2a94:	bf08      	it	eq
    2a96:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
    2a9a:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
    2a9e:	fabc f28c 	clz	r2, ip
    2aa2:	3a08      	subs	r2, #8
    2aa4:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
    2aa8:	db10      	blt.n	2acc <__aeabi_l2f+0x5c>
    2aaa:	fa01 fc02 	lsl.w	ip, r1, r2
    2aae:	4463      	add	r3, ip
    2ab0:	fa00 fc02 	lsl.w	ip, r0, r2
    2ab4:	f1c2 0220 	rsb	r2, r2, #32
    2ab8:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    2abc:	fa20 f202 	lsr.w	r2, r0, r2
    2ac0:	eb43 0002 	adc.w	r0, r3, r2
    2ac4:	bf08      	it	eq
    2ac6:	f020 0001 	biceq.w	r0, r0, #1
    2aca:	4770      	bx	lr
    2acc:	f102 0220 	add.w	r2, r2, #32
    2ad0:	fa01 fc02 	lsl.w	ip, r1, r2
    2ad4:	f1c2 0220 	rsb	r2, r2, #32
    2ad8:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
    2adc:	fa21 f202 	lsr.w	r2, r1, r2
    2ae0:	eb43 0002 	adc.w	r0, r3, r2
    2ae4:	bf08      	it	eq
    2ae6:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    2aea:	4770      	bx	lr

00002aec <__aeabi_fmul>:
    2aec:	f04f 0cff 	mov.w	ip, #255	; 0xff
    2af0:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    2af4:	bf1e      	ittt	ne
    2af6:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    2afa:	ea92 0f0c 	teqne	r2, ip
    2afe:	ea93 0f0c 	teqne	r3, ip
    2b02:	d06f      	beq.n	2be4 <__aeabi_fmul+0xf8>
    2b04:	441a      	add	r2, r3
    2b06:	ea80 0c01 	eor.w	ip, r0, r1
    2b0a:	0240      	lsls	r0, r0, #9
    2b0c:	bf18      	it	ne
    2b0e:	ea5f 2141 	movsne.w	r1, r1, lsl #9
    2b12:	d01e      	beq.n	2b52 <__aeabi_fmul+0x66>
    2b14:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
    2b18:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
    2b1c:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
    2b20:	fba0 3101 	umull	r3, r1, r0, r1
    2b24:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    2b28:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
    2b2c:	bf3e      	ittt	cc
    2b2e:	0049      	lslcc	r1, r1, #1
    2b30:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
    2b34:	005b      	lslcc	r3, r3, #1
    2b36:	ea40 0001 	orr.w	r0, r0, r1
    2b3a:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
    2b3e:	2afd      	cmp	r2, #253	; 0xfd
    2b40:	d81d      	bhi.n	2b7e <__aeabi_fmul+0x92>
    2b42:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    2b46:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2b4a:	bf08      	it	eq
    2b4c:	f020 0001 	biceq.w	r0, r0, #1
    2b50:	4770      	bx	lr
    2b52:	f090 0f00 	teq	r0, #0
    2b56:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    2b5a:	bf08      	it	eq
    2b5c:	0249      	lsleq	r1, r1, #9
    2b5e:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    2b62:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
    2b66:	3a7f      	subs	r2, #127	; 0x7f
    2b68:	bfc2      	ittt	gt
    2b6a:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    2b6e:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    2b72:	4770      	bxgt	lr
    2b74:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2b78:	f04f 0300 	mov.w	r3, #0
    2b7c:	3a01      	subs	r2, #1
    2b7e:	dc5d      	bgt.n	2c3c <__aeabi_fmul+0x150>
    2b80:	f112 0f19 	cmn.w	r2, #25
    2b84:	bfdc      	itt	le
    2b86:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
    2b8a:	4770      	bxle	lr
    2b8c:	f1c2 0200 	rsb	r2, r2, #0
    2b90:	0041      	lsls	r1, r0, #1
    2b92:	fa21 f102 	lsr.w	r1, r1, r2
    2b96:	f1c2 0220 	rsb	r2, r2, #32
    2b9a:	fa00 fc02 	lsl.w	ip, r0, r2
    2b9e:	ea5f 0031 	movs.w	r0, r1, rrx
    2ba2:	f140 0000 	adc.w	r0, r0, #0
    2ba6:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
    2baa:	bf08      	it	eq
    2bac:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    2bb0:	4770      	bx	lr
    2bb2:	f092 0f00 	teq	r2, #0
    2bb6:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    2bba:	bf02      	ittt	eq
    2bbc:	0040      	lsleq	r0, r0, #1
    2bbe:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    2bc2:	3a01      	subeq	r2, #1
    2bc4:	d0f9      	beq.n	2bba <__aeabi_fmul+0xce>
    2bc6:	ea40 000c 	orr.w	r0, r0, ip
    2bca:	f093 0f00 	teq	r3, #0
    2bce:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    2bd2:	bf02      	ittt	eq
    2bd4:	0049      	lsleq	r1, r1, #1
    2bd6:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    2bda:	3b01      	subeq	r3, #1
    2bdc:	d0f9      	beq.n	2bd2 <__aeabi_fmul+0xe6>
    2bde:	ea41 010c 	orr.w	r1, r1, ip
    2be2:	e78f      	b.n	2b04 <__aeabi_fmul+0x18>
    2be4:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    2be8:	ea92 0f0c 	teq	r2, ip
    2bec:	bf18      	it	ne
    2bee:	ea93 0f0c 	teqne	r3, ip
    2bf2:	d00a      	beq.n	2c0a <__aeabi_fmul+0x11e>
    2bf4:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    2bf8:	bf18      	it	ne
    2bfa:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    2bfe:	d1d8      	bne.n	2bb2 <__aeabi_fmul+0xc6>
    2c00:	ea80 0001 	eor.w	r0, r0, r1
    2c04:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    2c08:	4770      	bx	lr
    2c0a:	f090 0f00 	teq	r0, #0
    2c0e:	bf17      	itett	ne
    2c10:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
    2c14:	4608      	moveq	r0, r1
    2c16:	f091 0f00 	teqne	r1, #0
    2c1a:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
    2c1e:	d014      	beq.n	2c4a <__aeabi_fmul+0x15e>
    2c20:	ea92 0f0c 	teq	r2, ip
    2c24:	d101      	bne.n	2c2a <__aeabi_fmul+0x13e>
    2c26:	0242      	lsls	r2, r0, #9
    2c28:	d10f      	bne.n	2c4a <__aeabi_fmul+0x15e>
    2c2a:	ea93 0f0c 	teq	r3, ip
    2c2e:	d103      	bne.n	2c38 <__aeabi_fmul+0x14c>
    2c30:	024b      	lsls	r3, r1, #9
    2c32:	bf18      	it	ne
    2c34:	4608      	movne	r0, r1
    2c36:	d108      	bne.n	2c4a <__aeabi_fmul+0x15e>
    2c38:	ea80 0001 	eor.w	r0, r0, r1
    2c3c:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    2c40:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    2c44:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2c48:	4770      	bx	lr
    2c4a:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    2c4e:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
    2c52:	4770      	bx	lr

00002c54 <__aeabi_fdiv>:
    2c54:	f04f 0cff 	mov.w	ip, #255	; 0xff
    2c58:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    2c5c:	bf1e      	ittt	ne
    2c5e:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    2c62:	ea92 0f0c 	teqne	r2, ip
    2c66:	ea93 0f0c 	teqne	r3, ip
    2c6a:	d069      	beq.n	2d40 <__aeabi_fdiv+0xec>
    2c6c:	eba2 0203 	sub.w	r2, r2, r3
    2c70:	ea80 0c01 	eor.w	ip, r0, r1
    2c74:	0249      	lsls	r1, r1, #9
    2c76:	ea4f 2040 	mov.w	r0, r0, lsl #9
    2c7a:	d037      	beq.n	2cec <__aeabi_fdiv+0x98>
    2c7c:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    2c80:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
    2c84:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
    2c88:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    2c8c:	428b      	cmp	r3, r1
    2c8e:	bf38      	it	cc
    2c90:	005b      	lslcc	r3, r3, #1
    2c92:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
    2c96:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
    2c9a:	428b      	cmp	r3, r1
    2c9c:	bf24      	itt	cs
    2c9e:	1a5b      	subcs	r3, r3, r1
    2ca0:	ea40 000c 	orrcs.w	r0, r0, ip
    2ca4:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
    2ca8:	bf24      	itt	cs
    2caa:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
    2cae:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    2cb2:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
    2cb6:	bf24      	itt	cs
    2cb8:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
    2cbc:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    2cc0:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
    2cc4:	bf24      	itt	cs
    2cc6:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
    2cca:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    2cce:	011b      	lsls	r3, r3, #4
    2cd0:	bf18      	it	ne
    2cd2:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
    2cd6:	d1e0      	bne.n	2c9a <__aeabi_fdiv+0x46>
    2cd8:	2afd      	cmp	r2, #253	; 0xfd
    2cda:	f63f af50 	bhi.w	2b7e <__aeabi_fmul+0x92>
    2cde:	428b      	cmp	r3, r1
    2ce0:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2ce4:	bf08      	it	eq
    2ce6:	f020 0001 	biceq.w	r0, r0, #1
    2cea:	4770      	bx	lr
    2cec:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    2cf0:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    2cf4:	327f      	adds	r2, #127	; 0x7f
    2cf6:	bfc2      	ittt	gt
    2cf8:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    2cfc:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    2d00:	4770      	bxgt	lr
    2d02:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2d06:	f04f 0300 	mov.w	r3, #0
    2d0a:	3a01      	subs	r2, #1
    2d0c:	e737      	b.n	2b7e <__aeabi_fmul+0x92>
    2d0e:	f092 0f00 	teq	r2, #0
    2d12:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    2d16:	bf02      	ittt	eq
    2d18:	0040      	lsleq	r0, r0, #1
    2d1a:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    2d1e:	3a01      	subeq	r2, #1
    2d20:	d0f9      	beq.n	2d16 <__aeabi_fdiv+0xc2>
    2d22:	ea40 000c 	orr.w	r0, r0, ip
    2d26:	f093 0f00 	teq	r3, #0
    2d2a:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    2d2e:	bf02      	ittt	eq
    2d30:	0049      	lsleq	r1, r1, #1
    2d32:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    2d36:	3b01      	subeq	r3, #1
    2d38:	d0f9      	beq.n	2d2e <__aeabi_fdiv+0xda>
    2d3a:	ea41 010c 	orr.w	r1, r1, ip
    2d3e:	e795      	b.n	2c6c <__aeabi_fdiv+0x18>
    2d40:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    2d44:	ea92 0f0c 	teq	r2, ip
    2d48:	d108      	bne.n	2d5c <__aeabi_fdiv+0x108>
    2d4a:	0242      	lsls	r2, r0, #9
    2d4c:	f47f af7d 	bne.w	2c4a <__aeabi_fmul+0x15e>
    2d50:	ea93 0f0c 	teq	r3, ip
    2d54:	f47f af70 	bne.w	2c38 <__aeabi_fmul+0x14c>
    2d58:	4608      	mov	r0, r1
    2d5a:	e776      	b.n	2c4a <__aeabi_fmul+0x15e>
    2d5c:	ea93 0f0c 	teq	r3, ip
    2d60:	d104      	bne.n	2d6c <__aeabi_fdiv+0x118>
    2d62:	024b      	lsls	r3, r1, #9
    2d64:	f43f af4c 	beq.w	2c00 <__aeabi_fmul+0x114>
    2d68:	4608      	mov	r0, r1
    2d6a:	e76e      	b.n	2c4a <__aeabi_fmul+0x15e>
    2d6c:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    2d70:	bf18      	it	ne
    2d72:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    2d76:	d1ca      	bne.n	2d0e <__aeabi_fdiv+0xba>
    2d78:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
    2d7c:	f47f af5c 	bne.w	2c38 <__aeabi_fmul+0x14c>
    2d80:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
    2d84:	f47f af3c 	bne.w	2c00 <__aeabi_fmul+0x114>
    2d88:	e75f      	b.n	2c4a <__aeabi_fmul+0x15e>
    2d8a:	bf00      	nop

00002d8c <__aeabi_f2uiz>:
    2d8c:	0042      	lsls	r2, r0, #1
    2d8e:	d20e      	bcs.n	2dae <__aeabi_f2uiz+0x22>
    2d90:	f1b2 4ffe 	cmp.w	r2, #2130706432	; 0x7f000000
    2d94:	d30b      	bcc.n	2dae <__aeabi_f2uiz+0x22>
    2d96:	f04f 039e 	mov.w	r3, #158	; 0x9e
    2d9a:	ebb3 6212 	subs.w	r2, r3, r2, lsr #24
    2d9e:	d409      	bmi.n	2db4 <__aeabi_f2uiz+0x28>
    2da0:	ea4f 2300 	mov.w	r3, r0, lsl #8
    2da4:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
    2da8:	fa23 f002 	lsr.w	r0, r3, r2
    2dac:	4770      	bx	lr
    2dae:	f04f 0000 	mov.w	r0, #0
    2db2:	4770      	bx	lr
    2db4:	f112 0f61 	cmn.w	r2, #97	; 0x61
    2db8:	d101      	bne.n	2dbe <__aeabi_f2uiz+0x32>
    2dba:	0242      	lsls	r2, r0, #9
    2dbc:	d102      	bne.n	2dc4 <__aeabi_f2uiz+0x38>
    2dbe:	f04f 30ff 	mov.w	r0, #4294967295
    2dc2:	4770      	bx	lr
    2dc4:	f04f 0000 	mov.w	r0, #0
    2dc8:	4770      	bx	lr
    2dca:	bf00      	nop

00002dcc <__cxa_atexit>:
    2dcc:	4613      	mov	r3, r2
    2dce:	460a      	mov	r2, r1
    2dd0:	4601      	mov	r1, r0
    2dd2:	2002      	movs	r0, #2
    2dd4:	f000 bb04 	b.w	33e0 <__register_exitproc>

00002dd8 <__errno>:
    2dd8:	4b01      	ldr	r3, [pc, #4]	; (2de0 <__errno+0x8>)
    2dda:	6818      	ldr	r0, [r3, #0]
    2ddc:	4770      	bx	lr
    2dde:	bf00      	nop
    2de0:	1fff8de0 	.word	0x1fff8de0

00002de4 <__libc_init_array>:
    2de4:	b570      	push	{r4, r5, r6, lr}
    2de6:	4e0f      	ldr	r6, [pc, #60]	; (2e24 <__libc_init_array+0x40>)
    2de8:	4d0f      	ldr	r5, [pc, #60]	; (2e28 <__libc_init_array+0x44>)
    2dea:	1b76      	subs	r6, r6, r5
    2dec:	10b6      	asrs	r6, r6, #2
    2dee:	bf18      	it	ne
    2df0:	2400      	movne	r4, #0
    2df2:	d005      	beq.n	2e00 <__libc_init_array+0x1c>
    2df4:	3401      	adds	r4, #1
    2df6:	f855 3b04 	ldr.w	r3, [r5], #4
    2dfa:	4798      	blx	r3
    2dfc:	42a6      	cmp	r6, r4
    2dfe:	d1f9      	bne.n	2df4 <__libc_init_array+0x10>
    2e00:	4e0a      	ldr	r6, [pc, #40]	; (2e2c <__libc_init_array+0x48>)
    2e02:	4d0b      	ldr	r5, [pc, #44]	; (2e30 <__libc_init_array+0x4c>)
    2e04:	1b76      	subs	r6, r6, r5
    2e06:	f000 fd81 	bl	390c <_init>
    2e0a:	10b6      	asrs	r6, r6, #2
    2e0c:	bf18      	it	ne
    2e0e:	2400      	movne	r4, #0
    2e10:	d006      	beq.n	2e20 <__libc_init_array+0x3c>
    2e12:	3401      	adds	r4, #1
    2e14:	f855 3b04 	ldr.w	r3, [r5], #4
    2e18:	4798      	blx	r3
    2e1a:	42a6      	cmp	r6, r4
    2e1c:	d1f9      	bne.n	2e12 <__libc_init_array+0x2e>
    2e1e:	bd70      	pop	{r4, r5, r6, pc}
    2e20:	bd70      	pop	{r4, r5, r6, pc}
    2e22:	bf00      	nop
    2e24:	00003918 	.word	0x00003918
    2e28:	00003918 	.word	0x00003918
    2e2c:	00003924 	.word	0x00003924
    2e30:	00003918 	.word	0x00003918

00002e34 <malloc>:
    2e34:	4b02      	ldr	r3, [pc, #8]	; (2e40 <malloc+0xc>)
    2e36:	4601      	mov	r1, r0
    2e38:	6818      	ldr	r0, [r3, #0]
    2e3a:	f000 b803 	b.w	2e44 <_malloc_r>
    2e3e:	bf00      	nop
    2e40:	1fff8de0 	.word	0x1fff8de0

00002e44 <_malloc_r>:
    2e44:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2e48:	f101 050b 	add.w	r5, r1, #11
    2e4c:	2d16      	cmp	r5, #22
    2e4e:	b083      	sub	sp, #12
    2e50:	4606      	mov	r6, r0
    2e52:	f240 809f 	bls.w	2f94 <_malloc_r+0x150>
    2e56:	f035 0507 	bics.w	r5, r5, #7
    2e5a:	f100 80bf 	bmi.w	2fdc <_malloc_r+0x198>
    2e5e:	42a9      	cmp	r1, r5
    2e60:	f200 80bc 	bhi.w	2fdc <_malloc_r+0x198>
    2e64:	f000 faa6 	bl	33b4 <__malloc_lock>
    2e68:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    2e6c:	f0c0 829c 	bcc.w	33a8 <_malloc_r+0x564>
    2e70:	0a6b      	lsrs	r3, r5, #9
    2e72:	f000 80ba 	beq.w	2fea <_malloc_r+0x1a6>
    2e76:	2b04      	cmp	r3, #4
    2e78:	f200 8183 	bhi.w	3182 <_malloc_r+0x33e>
    2e7c:	09a8      	lsrs	r0, r5, #6
    2e7e:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    2e82:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2e86:	3038      	adds	r0, #56	; 0x38
    2e88:	4fc4      	ldr	r7, [pc, #784]	; (319c <_malloc_r+0x358>)
    2e8a:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    2e8e:	f1a3 0108 	sub.w	r1, r3, #8
    2e92:	685c      	ldr	r4, [r3, #4]
    2e94:	42a1      	cmp	r1, r4
    2e96:	d107      	bne.n	2ea8 <_malloc_r+0x64>
    2e98:	e0ac      	b.n	2ff4 <_malloc_r+0x1b0>
    2e9a:	2a00      	cmp	r2, #0
    2e9c:	f280 80ac 	bge.w	2ff8 <_malloc_r+0x1b4>
    2ea0:	68e4      	ldr	r4, [r4, #12]
    2ea2:	42a1      	cmp	r1, r4
    2ea4:	f000 80a6 	beq.w	2ff4 <_malloc_r+0x1b0>
    2ea8:	6863      	ldr	r3, [r4, #4]
    2eaa:	f023 0303 	bic.w	r3, r3, #3
    2eae:	1b5a      	subs	r2, r3, r5
    2eb0:	2a0f      	cmp	r2, #15
    2eb2:	ddf2      	ble.n	2e9a <_malloc_r+0x56>
    2eb4:	49b9      	ldr	r1, [pc, #740]	; (319c <_malloc_r+0x358>)
    2eb6:	693c      	ldr	r4, [r7, #16]
    2eb8:	f101 0e08 	add.w	lr, r1, #8
    2ebc:	4574      	cmp	r4, lr
    2ebe:	f000 81b3 	beq.w	3228 <_malloc_r+0x3e4>
    2ec2:	6863      	ldr	r3, [r4, #4]
    2ec4:	f023 0303 	bic.w	r3, r3, #3
    2ec8:	1b5a      	subs	r2, r3, r5
    2eca:	2a0f      	cmp	r2, #15
    2ecc:	f300 8199 	bgt.w	3202 <_malloc_r+0x3be>
    2ed0:	2a00      	cmp	r2, #0
    2ed2:	f8c1 e014 	str.w	lr, [r1, #20]
    2ed6:	f8c1 e010 	str.w	lr, [r1, #16]
    2eda:	f280 809e 	bge.w	301a <_malloc_r+0x1d6>
    2ede:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    2ee2:	f080 8167 	bcs.w	31b4 <_malloc_r+0x370>
    2ee6:	08db      	lsrs	r3, r3, #3
    2ee8:	f103 0c01 	add.w	ip, r3, #1
    2eec:	2201      	movs	r2, #1
    2eee:	109b      	asrs	r3, r3, #2
    2ef0:	fa02 f303 	lsl.w	r3, r2, r3
    2ef4:	684a      	ldr	r2, [r1, #4]
    2ef6:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    2efa:	f8c4 8008 	str.w	r8, [r4, #8]
    2efe:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    2f02:	431a      	orrs	r2, r3
    2f04:	f1a9 0308 	sub.w	r3, r9, #8
    2f08:	60e3      	str	r3, [r4, #12]
    2f0a:	604a      	str	r2, [r1, #4]
    2f0c:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    2f10:	f8c8 400c 	str.w	r4, [r8, #12]
    2f14:	1083      	asrs	r3, r0, #2
    2f16:	2401      	movs	r4, #1
    2f18:	409c      	lsls	r4, r3
    2f1a:	4294      	cmp	r4, r2
    2f1c:	f200 808a 	bhi.w	3034 <_malloc_r+0x1f0>
    2f20:	4214      	tst	r4, r2
    2f22:	d106      	bne.n	2f32 <_malloc_r+0xee>
    2f24:	f020 0003 	bic.w	r0, r0, #3
    2f28:	0064      	lsls	r4, r4, #1
    2f2a:	4214      	tst	r4, r2
    2f2c:	f100 0004 	add.w	r0, r0, #4
    2f30:	d0fa      	beq.n	2f28 <_malloc_r+0xe4>
    2f32:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    2f36:	46cc      	mov	ip, r9
    2f38:	4680      	mov	r8, r0
    2f3a:	f8dc 100c 	ldr.w	r1, [ip, #12]
    2f3e:	458c      	cmp	ip, r1
    2f40:	d107      	bne.n	2f52 <_malloc_r+0x10e>
    2f42:	e173      	b.n	322c <_malloc_r+0x3e8>
    2f44:	2a00      	cmp	r2, #0
    2f46:	f280 8181 	bge.w	324c <_malloc_r+0x408>
    2f4a:	68c9      	ldr	r1, [r1, #12]
    2f4c:	458c      	cmp	ip, r1
    2f4e:	f000 816d 	beq.w	322c <_malloc_r+0x3e8>
    2f52:	684b      	ldr	r3, [r1, #4]
    2f54:	f023 0303 	bic.w	r3, r3, #3
    2f58:	1b5a      	subs	r2, r3, r5
    2f5a:	2a0f      	cmp	r2, #15
    2f5c:	ddf2      	ble.n	2f44 <_malloc_r+0x100>
    2f5e:	460c      	mov	r4, r1
    2f60:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    2f64:	f854 8f08 	ldr.w	r8, [r4, #8]!
    2f68:	194b      	adds	r3, r1, r5
    2f6a:	f045 0501 	orr.w	r5, r5, #1
    2f6e:	604d      	str	r5, [r1, #4]
    2f70:	f042 0101 	orr.w	r1, r2, #1
    2f74:	f8c8 c00c 	str.w	ip, [r8, #12]
    2f78:	4630      	mov	r0, r6
    2f7a:	f8cc 8008 	str.w	r8, [ip, #8]
    2f7e:	617b      	str	r3, [r7, #20]
    2f80:	613b      	str	r3, [r7, #16]
    2f82:	f8c3 e00c 	str.w	lr, [r3, #12]
    2f86:	f8c3 e008 	str.w	lr, [r3, #8]
    2f8a:	6059      	str	r1, [r3, #4]
    2f8c:	509a      	str	r2, [r3, r2]
    2f8e:	f000 fa13 	bl	33b8 <__malloc_unlock>
    2f92:	e01f      	b.n	2fd4 <_malloc_r+0x190>
    2f94:	2910      	cmp	r1, #16
    2f96:	d821      	bhi.n	2fdc <_malloc_r+0x198>
    2f98:	f000 fa0c 	bl	33b4 <__malloc_lock>
    2f9c:	2510      	movs	r5, #16
    2f9e:	2306      	movs	r3, #6
    2fa0:	2002      	movs	r0, #2
    2fa2:	4f7e      	ldr	r7, [pc, #504]	; (319c <_malloc_r+0x358>)
    2fa4:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    2fa8:	f1a3 0208 	sub.w	r2, r3, #8
    2fac:	685c      	ldr	r4, [r3, #4]
    2fae:	4294      	cmp	r4, r2
    2fb0:	f000 8145 	beq.w	323e <_malloc_r+0x3fa>
    2fb4:	6863      	ldr	r3, [r4, #4]
    2fb6:	68e1      	ldr	r1, [r4, #12]
    2fb8:	68a5      	ldr	r5, [r4, #8]
    2fba:	f023 0303 	bic.w	r3, r3, #3
    2fbe:	4423      	add	r3, r4
    2fc0:	4630      	mov	r0, r6
    2fc2:	685a      	ldr	r2, [r3, #4]
    2fc4:	60e9      	str	r1, [r5, #12]
    2fc6:	f042 0201 	orr.w	r2, r2, #1
    2fca:	608d      	str	r5, [r1, #8]
    2fcc:	605a      	str	r2, [r3, #4]
    2fce:	f000 f9f3 	bl	33b8 <__malloc_unlock>
    2fd2:	3408      	adds	r4, #8
    2fd4:	4620      	mov	r0, r4
    2fd6:	b003      	add	sp, #12
    2fd8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2fdc:	2400      	movs	r4, #0
    2fde:	230c      	movs	r3, #12
    2fe0:	4620      	mov	r0, r4
    2fe2:	6033      	str	r3, [r6, #0]
    2fe4:	b003      	add	sp, #12
    2fe6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2fea:	2380      	movs	r3, #128	; 0x80
    2fec:	f04f 0e40 	mov.w	lr, #64	; 0x40
    2ff0:	203f      	movs	r0, #63	; 0x3f
    2ff2:	e749      	b.n	2e88 <_malloc_r+0x44>
    2ff4:	4670      	mov	r0, lr
    2ff6:	e75d      	b.n	2eb4 <_malloc_r+0x70>
    2ff8:	4423      	add	r3, r4
    2ffa:	68e1      	ldr	r1, [r4, #12]
    2ffc:	685a      	ldr	r2, [r3, #4]
    2ffe:	68a5      	ldr	r5, [r4, #8]
    3000:	f042 0201 	orr.w	r2, r2, #1
    3004:	60e9      	str	r1, [r5, #12]
    3006:	4630      	mov	r0, r6
    3008:	608d      	str	r5, [r1, #8]
    300a:	605a      	str	r2, [r3, #4]
    300c:	f000 f9d4 	bl	33b8 <__malloc_unlock>
    3010:	3408      	adds	r4, #8
    3012:	4620      	mov	r0, r4
    3014:	b003      	add	sp, #12
    3016:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    301a:	4423      	add	r3, r4
    301c:	4630      	mov	r0, r6
    301e:	685a      	ldr	r2, [r3, #4]
    3020:	f042 0201 	orr.w	r2, r2, #1
    3024:	605a      	str	r2, [r3, #4]
    3026:	f000 f9c7 	bl	33b8 <__malloc_unlock>
    302a:	3408      	adds	r4, #8
    302c:	4620      	mov	r0, r4
    302e:	b003      	add	sp, #12
    3030:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3034:	68bc      	ldr	r4, [r7, #8]
    3036:	6863      	ldr	r3, [r4, #4]
    3038:	f023 0803 	bic.w	r8, r3, #3
    303c:	45a8      	cmp	r8, r5
    303e:	d304      	bcc.n	304a <_malloc_r+0x206>
    3040:	ebc5 0308 	rsb	r3, r5, r8
    3044:	2b0f      	cmp	r3, #15
    3046:	f300 808c 	bgt.w	3162 <_malloc_r+0x31e>
    304a:	4b55      	ldr	r3, [pc, #340]	; (31a0 <_malloc_r+0x35c>)
    304c:	f8df 9160 	ldr.w	r9, [pc, #352]	; 31b0 <_malloc_r+0x36c>
    3050:	681a      	ldr	r2, [r3, #0]
    3052:	f8d9 3000 	ldr.w	r3, [r9]
    3056:	3301      	adds	r3, #1
    3058:	442a      	add	r2, r5
    305a:	eb04 0a08 	add.w	sl, r4, r8
    305e:	f000 8160 	beq.w	3322 <_malloc_r+0x4de>
    3062:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    3066:	320f      	adds	r2, #15
    3068:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    306c:	f022 020f 	bic.w	r2, r2, #15
    3070:	4611      	mov	r1, r2
    3072:	4630      	mov	r0, r6
    3074:	9201      	str	r2, [sp, #4]
    3076:	f000 f9a1 	bl	33bc <_sbrk_r>
    307a:	f1b0 3fff 	cmp.w	r0, #4294967295
    307e:	4683      	mov	fp, r0
    3080:	9a01      	ldr	r2, [sp, #4]
    3082:	f000 8158 	beq.w	3336 <_malloc_r+0x4f2>
    3086:	4582      	cmp	sl, r0
    3088:	f200 80fc 	bhi.w	3284 <_malloc_r+0x440>
    308c:	4b45      	ldr	r3, [pc, #276]	; (31a4 <_malloc_r+0x360>)
    308e:	6819      	ldr	r1, [r3, #0]
    3090:	45da      	cmp	sl, fp
    3092:	4411      	add	r1, r2
    3094:	6019      	str	r1, [r3, #0]
    3096:	f000 8153 	beq.w	3340 <_malloc_r+0x4fc>
    309a:	f8d9 0000 	ldr.w	r0, [r9]
    309e:	f8df e110 	ldr.w	lr, [pc, #272]	; 31b0 <_malloc_r+0x36c>
    30a2:	3001      	adds	r0, #1
    30a4:	bf1b      	ittet	ne
    30a6:	ebca 0a0b 	rsbne	sl, sl, fp
    30aa:	4451      	addne	r1, sl
    30ac:	f8ce b000 	streq.w	fp, [lr]
    30b0:	6019      	strne	r1, [r3, #0]
    30b2:	f01b 0107 	ands.w	r1, fp, #7
    30b6:	f000 8117 	beq.w	32e8 <_malloc_r+0x4a4>
    30ba:	f1c1 0008 	rsb	r0, r1, #8
    30be:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    30c2:	4483      	add	fp, r0
    30c4:	3108      	adds	r1, #8
    30c6:	445a      	add	r2, fp
    30c8:	f3c2 020b 	ubfx	r2, r2, #0, #12
    30cc:	ebc2 0901 	rsb	r9, r2, r1
    30d0:	4649      	mov	r1, r9
    30d2:	4630      	mov	r0, r6
    30d4:	9301      	str	r3, [sp, #4]
    30d6:	f000 f971 	bl	33bc <_sbrk_r>
    30da:	1c43      	adds	r3, r0, #1
    30dc:	9b01      	ldr	r3, [sp, #4]
    30de:	f000 813f 	beq.w	3360 <_malloc_r+0x51c>
    30e2:	ebcb 0200 	rsb	r2, fp, r0
    30e6:	444a      	add	r2, r9
    30e8:	f042 0201 	orr.w	r2, r2, #1
    30ec:	6819      	ldr	r1, [r3, #0]
    30ee:	f8c7 b008 	str.w	fp, [r7, #8]
    30f2:	4449      	add	r1, r9
    30f4:	42bc      	cmp	r4, r7
    30f6:	f8cb 2004 	str.w	r2, [fp, #4]
    30fa:	6019      	str	r1, [r3, #0]
    30fc:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 31a4 <_malloc_r+0x360>
    3100:	d016      	beq.n	3130 <_malloc_r+0x2ec>
    3102:	f1b8 0f0f 	cmp.w	r8, #15
    3106:	f240 80fd 	bls.w	3304 <_malloc_r+0x4c0>
    310a:	6862      	ldr	r2, [r4, #4]
    310c:	f1a8 030c 	sub.w	r3, r8, #12
    3110:	f023 0307 	bic.w	r3, r3, #7
    3114:	18e0      	adds	r0, r4, r3
    3116:	f002 0201 	and.w	r2, r2, #1
    311a:	f04f 0e05 	mov.w	lr, #5
    311e:	431a      	orrs	r2, r3
    3120:	2b0f      	cmp	r3, #15
    3122:	6062      	str	r2, [r4, #4]
    3124:	f8c0 e004 	str.w	lr, [r0, #4]
    3128:	f8c0 e008 	str.w	lr, [r0, #8]
    312c:	f200 811c 	bhi.w	3368 <_malloc_r+0x524>
    3130:	4b1d      	ldr	r3, [pc, #116]	; (31a8 <_malloc_r+0x364>)
    3132:	68bc      	ldr	r4, [r7, #8]
    3134:	681a      	ldr	r2, [r3, #0]
    3136:	4291      	cmp	r1, r2
    3138:	bf88      	it	hi
    313a:	6019      	strhi	r1, [r3, #0]
    313c:	4b1b      	ldr	r3, [pc, #108]	; (31ac <_malloc_r+0x368>)
    313e:	681a      	ldr	r2, [r3, #0]
    3140:	4291      	cmp	r1, r2
    3142:	6862      	ldr	r2, [r4, #4]
    3144:	bf88      	it	hi
    3146:	6019      	strhi	r1, [r3, #0]
    3148:	f022 0203 	bic.w	r2, r2, #3
    314c:	4295      	cmp	r5, r2
    314e:	eba2 0305 	sub.w	r3, r2, r5
    3152:	d801      	bhi.n	3158 <_malloc_r+0x314>
    3154:	2b0f      	cmp	r3, #15
    3156:	dc04      	bgt.n	3162 <_malloc_r+0x31e>
    3158:	4630      	mov	r0, r6
    315a:	f000 f92d 	bl	33b8 <__malloc_unlock>
    315e:	2400      	movs	r4, #0
    3160:	e738      	b.n	2fd4 <_malloc_r+0x190>
    3162:	1962      	adds	r2, r4, r5
    3164:	f043 0301 	orr.w	r3, r3, #1
    3168:	f045 0501 	orr.w	r5, r5, #1
    316c:	6065      	str	r5, [r4, #4]
    316e:	4630      	mov	r0, r6
    3170:	60ba      	str	r2, [r7, #8]
    3172:	6053      	str	r3, [r2, #4]
    3174:	f000 f920 	bl	33b8 <__malloc_unlock>
    3178:	3408      	adds	r4, #8
    317a:	4620      	mov	r0, r4
    317c:	b003      	add	sp, #12
    317e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3182:	2b14      	cmp	r3, #20
    3184:	d971      	bls.n	326a <_malloc_r+0x426>
    3186:	2b54      	cmp	r3, #84	; 0x54
    3188:	f200 80a4 	bhi.w	32d4 <_malloc_r+0x490>
    318c:	0b28      	lsrs	r0, r5, #12
    318e:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    3192:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3196:	306e      	adds	r0, #110	; 0x6e
    3198:	e676      	b.n	2e88 <_malloc_r+0x44>
    319a:	bf00      	nop
    319c:	1fff8de4 	.word	0x1fff8de4
    31a0:	1fff95dc 	.word	0x1fff95dc
    31a4:	1fff95e0 	.word	0x1fff95e0
    31a8:	1fff95d8 	.word	0x1fff95d8
    31ac:	1fff95d4 	.word	0x1fff95d4
    31b0:	1fff91f0 	.word	0x1fff91f0
    31b4:	0a5a      	lsrs	r2, r3, #9
    31b6:	2a04      	cmp	r2, #4
    31b8:	d95e      	bls.n	3278 <_malloc_r+0x434>
    31ba:	2a14      	cmp	r2, #20
    31bc:	f200 80b3 	bhi.w	3326 <_malloc_r+0x4e2>
    31c0:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    31c4:	0049      	lsls	r1, r1, #1
    31c6:	325b      	adds	r2, #91	; 0x5b
    31c8:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    31cc:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    31d0:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 33b0 <_malloc_r+0x56c>
    31d4:	f1ac 0c08 	sub.w	ip, ip, #8
    31d8:	458c      	cmp	ip, r1
    31da:	f000 8088 	beq.w	32ee <_malloc_r+0x4aa>
    31de:	684a      	ldr	r2, [r1, #4]
    31e0:	f022 0203 	bic.w	r2, r2, #3
    31e4:	4293      	cmp	r3, r2
    31e6:	d202      	bcs.n	31ee <_malloc_r+0x3aa>
    31e8:	6889      	ldr	r1, [r1, #8]
    31ea:	458c      	cmp	ip, r1
    31ec:	d1f7      	bne.n	31de <_malloc_r+0x39a>
    31ee:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    31f2:	687a      	ldr	r2, [r7, #4]
    31f4:	f8c4 c00c 	str.w	ip, [r4, #12]
    31f8:	60a1      	str	r1, [r4, #8]
    31fa:	f8cc 4008 	str.w	r4, [ip, #8]
    31fe:	60cc      	str	r4, [r1, #12]
    3200:	e688      	b.n	2f14 <_malloc_r+0xd0>
    3202:	1963      	adds	r3, r4, r5
    3204:	f042 0701 	orr.w	r7, r2, #1
    3208:	f045 0501 	orr.w	r5, r5, #1
    320c:	6065      	str	r5, [r4, #4]
    320e:	4630      	mov	r0, r6
    3210:	614b      	str	r3, [r1, #20]
    3212:	610b      	str	r3, [r1, #16]
    3214:	f8c3 e00c 	str.w	lr, [r3, #12]
    3218:	f8c3 e008 	str.w	lr, [r3, #8]
    321c:	605f      	str	r7, [r3, #4]
    321e:	509a      	str	r2, [r3, r2]
    3220:	3408      	adds	r4, #8
    3222:	f000 f8c9 	bl	33b8 <__malloc_unlock>
    3226:	e6d5      	b.n	2fd4 <_malloc_r+0x190>
    3228:	684a      	ldr	r2, [r1, #4]
    322a:	e673      	b.n	2f14 <_malloc_r+0xd0>
    322c:	f108 0801 	add.w	r8, r8, #1
    3230:	f018 0f03 	tst.w	r8, #3
    3234:	f10c 0c08 	add.w	ip, ip, #8
    3238:	f47f ae7f 	bne.w	2f3a <_malloc_r+0xf6>
    323c:	e030      	b.n	32a0 <_malloc_r+0x45c>
    323e:	68dc      	ldr	r4, [r3, #12]
    3240:	42a3      	cmp	r3, r4
    3242:	bf08      	it	eq
    3244:	3002      	addeq	r0, #2
    3246:	f43f ae35 	beq.w	2eb4 <_malloc_r+0x70>
    324a:	e6b3      	b.n	2fb4 <_malloc_r+0x170>
    324c:	440b      	add	r3, r1
    324e:	460c      	mov	r4, r1
    3250:	685a      	ldr	r2, [r3, #4]
    3252:	68c9      	ldr	r1, [r1, #12]
    3254:	f854 5f08 	ldr.w	r5, [r4, #8]!
    3258:	f042 0201 	orr.w	r2, r2, #1
    325c:	605a      	str	r2, [r3, #4]
    325e:	4630      	mov	r0, r6
    3260:	60e9      	str	r1, [r5, #12]
    3262:	608d      	str	r5, [r1, #8]
    3264:	f000 f8a8 	bl	33b8 <__malloc_unlock>
    3268:	e6b4      	b.n	2fd4 <_malloc_r+0x190>
    326a:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    326e:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    3272:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3276:	e607      	b.n	2e88 <_malloc_r+0x44>
    3278:	099a      	lsrs	r2, r3, #6
    327a:	f102 0139 	add.w	r1, r2, #57	; 0x39
    327e:	0049      	lsls	r1, r1, #1
    3280:	3238      	adds	r2, #56	; 0x38
    3282:	e7a1      	b.n	31c8 <_malloc_r+0x384>
    3284:	42bc      	cmp	r4, r7
    3286:	4b4a      	ldr	r3, [pc, #296]	; (33b0 <_malloc_r+0x56c>)
    3288:	f43f af00 	beq.w	308c <_malloc_r+0x248>
    328c:	689c      	ldr	r4, [r3, #8]
    328e:	6862      	ldr	r2, [r4, #4]
    3290:	f022 0203 	bic.w	r2, r2, #3
    3294:	e75a      	b.n	314c <_malloc_r+0x308>
    3296:	f859 3908 	ldr.w	r3, [r9], #-8
    329a:	4599      	cmp	r9, r3
    329c:	f040 8082 	bne.w	33a4 <_malloc_r+0x560>
    32a0:	f010 0f03 	tst.w	r0, #3
    32a4:	f100 30ff 	add.w	r0, r0, #4294967295
    32a8:	d1f5      	bne.n	3296 <_malloc_r+0x452>
    32aa:	687b      	ldr	r3, [r7, #4]
    32ac:	ea23 0304 	bic.w	r3, r3, r4
    32b0:	607b      	str	r3, [r7, #4]
    32b2:	0064      	lsls	r4, r4, #1
    32b4:	429c      	cmp	r4, r3
    32b6:	f63f aebd 	bhi.w	3034 <_malloc_r+0x1f0>
    32ba:	2c00      	cmp	r4, #0
    32bc:	f43f aeba 	beq.w	3034 <_malloc_r+0x1f0>
    32c0:	421c      	tst	r4, r3
    32c2:	4640      	mov	r0, r8
    32c4:	f47f ae35 	bne.w	2f32 <_malloc_r+0xee>
    32c8:	0064      	lsls	r4, r4, #1
    32ca:	421c      	tst	r4, r3
    32cc:	f100 0004 	add.w	r0, r0, #4
    32d0:	d0fa      	beq.n	32c8 <_malloc_r+0x484>
    32d2:	e62e      	b.n	2f32 <_malloc_r+0xee>
    32d4:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    32d8:	d818      	bhi.n	330c <_malloc_r+0x4c8>
    32da:	0be8      	lsrs	r0, r5, #15
    32dc:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    32e0:	ea4f 034e 	mov.w	r3, lr, lsl #1
    32e4:	3077      	adds	r0, #119	; 0x77
    32e6:	e5cf      	b.n	2e88 <_malloc_r+0x44>
    32e8:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    32ec:	e6eb      	b.n	30c6 <_malloc_r+0x282>
    32ee:	2101      	movs	r1, #1
    32f0:	f8d8 3004 	ldr.w	r3, [r8, #4]
    32f4:	1092      	asrs	r2, r2, #2
    32f6:	fa01 f202 	lsl.w	r2, r1, r2
    32fa:	431a      	orrs	r2, r3
    32fc:	f8c8 2004 	str.w	r2, [r8, #4]
    3300:	4661      	mov	r1, ip
    3302:	e777      	b.n	31f4 <_malloc_r+0x3b0>
    3304:	2301      	movs	r3, #1
    3306:	f8cb 3004 	str.w	r3, [fp, #4]
    330a:	e725      	b.n	3158 <_malloc_r+0x314>
    330c:	f240 5254 	movw	r2, #1364	; 0x554
    3310:	4293      	cmp	r3, r2
    3312:	d820      	bhi.n	3356 <_malloc_r+0x512>
    3314:	0ca8      	lsrs	r0, r5, #18
    3316:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    331a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    331e:	307c      	adds	r0, #124	; 0x7c
    3320:	e5b2      	b.n	2e88 <_malloc_r+0x44>
    3322:	3210      	adds	r2, #16
    3324:	e6a4      	b.n	3070 <_malloc_r+0x22c>
    3326:	2a54      	cmp	r2, #84	; 0x54
    3328:	d826      	bhi.n	3378 <_malloc_r+0x534>
    332a:	0b1a      	lsrs	r2, r3, #12
    332c:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    3330:	0049      	lsls	r1, r1, #1
    3332:	326e      	adds	r2, #110	; 0x6e
    3334:	e748      	b.n	31c8 <_malloc_r+0x384>
    3336:	68bc      	ldr	r4, [r7, #8]
    3338:	6862      	ldr	r2, [r4, #4]
    333a:	f022 0203 	bic.w	r2, r2, #3
    333e:	e705      	b.n	314c <_malloc_r+0x308>
    3340:	f3ca 000b 	ubfx	r0, sl, #0, #12
    3344:	2800      	cmp	r0, #0
    3346:	f47f aea8 	bne.w	309a <_malloc_r+0x256>
    334a:	4442      	add	r2, r8
    334c:	68bb      	ldr	r3, [r7, #8]
    334e:	f042 0201 	orr.w	r2, r2, #1
    3352:	605a      	str	r2, [r3, #4]
    3354:	e6ec      	b.n	3130 <_malloc_r+0x2ec>
    3356:	23fe      	movs	r3, #254	; 0xfe
    3358:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    335c:	207e      	movs	r0, #126	; 0x7e
    335e:	e593      	b.n	2e88 <_malloc_r+0x44>
    3360:	2201      	movs	r2, #1
    3362:	f04f 0900 	mov.w	r9, #0
    3366:	e6c1      	b.n	30ec <_malloc_r+0x2a8>
    3368:	f104 0108 	add.w	r1, r4, #8
    336c:	4630      	mov	r0, r6
    336e:	f000 f8fb 	bl	3568 <_free_r>
    3372:	f8d9 1000 	ldr.w	r1, [r9]
    3376:	e6db      	b.n	3130 <_malloc_r+0x2ec>
    3378:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    337c:	d805      	bhi.n	338a <_malloc_r+0x546>
    337e:	0bda      	lsrs	r2, r3, #15
    3380:	f102 0178 	add.w	r1, r2, #120	; 0x78
    3384:	0049      	lsls	r1, r1, #1
    3386:	3277      	adds	r2, #119	; 0x77
    3388:	e71e      	b.n	31c8 <_malloc_r+0x384>
    338a:	f240 5154 	movw	r1, #1364	; 0x554
    338e:	428a      	cmp	r2, r1
    3390:	d805      	bhi.n	339e <_malloc_r+0x55a>
    3392:	0c9a      	lsrs	r2, r3, #18
    3394:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    3398:	0049      	lsls	r1, r1, #1
    339a:	327c      	adds	r2, #124	; 0x7c
    339c:	e714      	b.n	31c8 <_malloc_r+0x384>
    339e:	21fe      	movs	r1, #254	; 0xfe
    33a0:	227e      	movs	r2, #126	; 0x7e
    33a2:	e711      	b.n	31c8 <_malloc_r+0x384>
    33a4:	687b      	ldr	r3, [r7, #4]
    33a6:	e784      	b.n	32b2 <_malloc_r+0x46e>
    33a8:	08e8      	lsrs	r0, r5, #3
    33aa:	1c43      	adds	r3, r0, #1
    33ac:	005b      	lsls	r3, r3, #1
    33ae:	e5f8      	b.n	2fa2 <_malloc_r+0x15e>
    33b0:	1fff8de4 	.word	0x1fff8de4

000033b4 <__malloc_lock>:
    33b4:	4770      	bx	lr
    33b6:	bf00      	nop

000033b8 <__malloc_unlock>:
    33b8:	4770      	bx	lr
    33ba:	bf00      	nop

000033bc <_sbrk_r>:
    33bc:	b538      	push	{r3, r4, r5, lr}
    33be:	4c07      	ldr	r4, [pc, #28]	; (33dc <_sbrk_r+0x20>)
    33c0:	2300      	movs	r3, #0
    33c2:	4605      	mov	r5, r0
    33c4:	4608      	mov	r0, r1
    33c6:	6023      	str	r3, [r4, #0]
    33c8:	f7fd fb2e 	bl	a28 <_sbrk>
    33cc:	1c43      	adds	r3, r0, #1
    33ce:	d000      	beq.n	33d2 <_sbrk_r+0x16>
    33d0:	bd38      	pop	{r3, r4, r5, pc}
    33d2:	6823      	ldr	r3, [r4, #0]
    33d4:	2b00      	cmp	r3, #0
    33d6:	d0fb      	beq.n	33d0 <_sbrk_r+0x14>
    33d8:	602b      	str	r3, [r5, #0]
    33da:	bd38      	pop	{r3, r4, r5, pc}
    33dc:	1fff961c 	.word	0x1fff961c

000033e0 <__register_exitproc>:
    33e0:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    33e4:	4c25      	ldr	r4, [pc, #148]	; (347c <__register_exitproc+0x9c>)
    33e6:	6825      	ldr	r5, [r4, #0]
    33e8:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    33ec:	4606      	mov	r6, r0
    33ee:	4688      	mov	r8, r1
    33f0:	4692      	mov	sl, r2
    33f2:	4699      	mov	r9, r3
    33f4:	b3c4      	cbz	r4, 3468 <__register_exitproc+0x88>
    33f6:	6860      	ldr	r0, [r4, #4]
    33f8:	281f      	cmp	r0, #31
    33fa:	dc17      	bgt.n	342c <__register_exitproc+0x4c>
    33fc:	1c43      	adds	r3, r0, #1
    33fe:	b176      	cbz	r6, 341e <__register_exitproc+0x3e>
    3400:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    3404:	2201      	movs	r2, #1
    3406:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    340a:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    340e:	4082      	lsls	r2, r0
    3410:	4311      	orrs	r1, r2
    3412:	2e02      	cmp	r6, #2
    3414:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    3418:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    341c:	d01e      	beq.n	345c <__register_exitproc+0x7c>
    341e:	3002      	adds	r0, #2
    3420:	6063      	str	r3, [r4, #4]
    3422:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    3426:	2000      	movs	r0, #0
    3428:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    342c:	4b14      	ldr	r3, [pc, #80]	; (3480 <__register_exitproc+0xa0>)
    342e:	b303      	cbz	r3, 3472 <__register_exitproc+0x92>
    3430:	f44f 70c8 	mov.w	r0, #400	; 0x190
    3434:	f7ff fcfe 	bl	2e34 <malloc>
    3438:	4604      	mov	r4, r0
    343a:	b1d0      	cbz	r0, 3472 <__register_exitproc+0x92>
    343c:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    3440:	2700      	movs	r7, #0
    3442:	e880 0088 	stmia.w	r0, {r3, r7}
    3446:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    344a:	4638      	mov	r0, r7
    344c:	2301      	movs	r3, #1
    344e:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    3452:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    3456:	2e00      	cmp	r6, #0
    3458:	d0e1      	beq.n	341e <__register_exitproc+0x3e>
    345a:	e7d1      	b.n	3400 <__register_exitproc+0x20>
    345c:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    3460:	430a      	orrs	r2, r1
    3462:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    3466:	e7da      	b.n	341e <__register_exitproc+0x3e>
    3468:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    346c:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    3470:	e7c1      	b.n	33f6 <__register_exitproc+0x16>
    3472:	f04f 30ff 	mov.w	r0, #4294967295
    3476:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    347a:	bf00      	nop
    347c:	00003908 	.word	0x00003908
    3480:	00002e35 	.word	0x00002e35

00003484 <register_fini>:
    3484:	4b02      	ldr	r3, [pc, #8]	; (3490 <register_fini+0xc>)
    3486:	b113      	cbz	r3, 348e <register_fini+0xa>
    3488:	4802      	ldr	r0, [pc, #8]	; (3494 <register_fini+0x10>)
    348a:	f000 b805 	b.w	3498 <atexit>
    348e:	4770      	bx	lr
    3490:	00000000 	.word	0x00000000
    3494:	000034a5 	.word	0x000034a5

00003498 <atexit>:
    3498:	2300      	movs	r3, #0
    349a:	4601      	mov	r1, r0
    349c:	461a      	mov	r2, r3
    349e:	4618      	mov	r0, r3
    34a0:	f7ff bf9e 	b.w	33e0 <__register_exitproc>

000034a4 <__libc_fini_array>:
    34a4:	b538      	push	{r3, r4, r5, lr}
    34a6:	4d07      	ldr	r5, [pc, #28]	; (34c4 <__libc_fini_array+0x20>)
    34a8:	4c07      	ldr	r4, [pc, #28]	; (34c8 <__libc_fini_array+0x24>)
    34aa:	1b2c      	subs	r4, r5, r4
    34ac:	10a4      	asrs	r4, r4, #2
    34ae:	d005      	beq.n	34bc <__libc_fini_array+0x18>
    34b0:	3c01      	subs	r4, #1
    34b2:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    34b6:	4798      	blx	r3
    34b8:	2c00      	cmp	r4, #0
    34ba:	d1f9      	bne.n	34b0 <__libc_fini_array+0xc>
    34bc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    34c0:	f000 ba30 	b.w	3924 <__init_array_end>
	...

000034cc <_malloc_trim_r>:
    34cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    34ce:	4f23      	ldr	r7, [pc, #140]	; (355c <_malloc_trim_r+0x90>)
    34d0:	460c      	mov	r4, r1
    34d2:	4606      	mov	r6, r0
    34d4:	f7ff ff6e 	bl	33b4 <__malloc_lock>
    34d8:	68bb      	ldr	r3, [r7, #8]
    34da:	685d      	ldr	r5, [r3, #4]
    34dc:	f025 0503 	bic.w	r5, r5, #3
    34e0:	1b29      	subs	r1, r5, r4
    34e2:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    34e6:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    34ea:	f021 010f 	bic.w	r1, r1, #15
    34ee:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    34f2:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    34f6:	db07      	blt.n	3508 <_malloc_trim_r+0x3c>
    34f8:	2100      	movs	r1, #0
    34fa:	4630      	mov	r0, r6
    34fc:	f7ff ff5e 	bl	33bc <_sbrk_r>
    3500:	68bb      	ldr	r3, [r7, #8]
    3502:	442b      	add	r3, r5
    3504:	4298      	cmp	r0, r3
    3506:	d004      	beq.n	3512 <_malloc_trim_r+0x46>
    3508:	4630      	mov	r0, r6
    350a:	f7ff ff55 	bl	33b8 <__malloc_unlock>
    350e:	2000      	movs	r0, #0
    3510:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    3512:	4261      	negs	r1, r4
    3514:	4630      	mov	r0, r6
    3516:	f7ff ff51 	bl	33bc <_sbrk_r>
    351a:	3001      	adds	r0, #1
    351c:	d00d      	beq.n	353a <_malloc_trim_r+0x6e>
    351e:	4b10      	ldr	r3, [pc, #64]	; (3560 <_malloc_trim_r+0x94>)
    3520:	68ba      	ldr	r2, [r7, #8]
    3522:	6819      	ldr	r1, [r3, #0]
    3524:	1b2d      	subs	r5, r5, r4
    3526:	f045 0501 	orr.w	r5, r5, #1
    352a:	4630      	mov	r0, r6
    352c:	1b09      	subs	r1, r1, r4
    352e:	6055      	str	r5, [r2, #4]
    3530:	6019      	str	r1, [r3, #0]
    3532:	f7ff ff41 	bl	33b8 <__malloc_unlock>
    3536:	2001      	movs	r0, #1
    3538:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    353a:	2100      	movs	r1, #0
    353c:	4630      	mov	r0, r6
    353e:	f7ff ff3d 	bl	33bc <_sbrk_r>
    3542:	68ba      	ldr	r2, [r7, #8]
    3544:	1a83      	subs	r3, r0, r2
    3546:	2b0f      	cmp	r3, #15
    3548:	ddde      	ble.n	3508 <_malloc_trim_r+0x3c>
    354a:	4c06      	ldr	r4, [pc, #24]	; (3564 <_malloc_trim_r+0x98>)
    354c:	4904      	ldr	r1, [pc, #16]	; (3560 <_malloc_trim_r+0x94>)
    354e:	6824      	ldr	r4, [r4, #0]
    3550:	f043 0301 	orr.w	r3, r3, #1
    3554:	1b00      	subs	r0, r0, r4
    3556:	6053      	str	r3, [r2, #4]
    3558:	6008      	str	r0, [r1, #0]
    355a:	e7d5      	b.n	3508 <_malloc_trim_r+0x3c>
    355c:	1fff8de4 	.word	0x1fff8de4
    3560:	1fff95e0 	.word	0x1fff95e0
    3564:	1fff91f0 	.word	0x1fff91f0

00003568 <_free_r>:
    3568:	2900      	cmp	r1, #0
    356a:	d045      	beq.n	35f8 <_free_r+0x90>
    356c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3570:	460d      	mov	r5, r1
    3572:	4680      	mov	r8, r0
    3574:	f7ff ff1e 	bl	33b4 <__malloc_lock>
    3578:	f855 7c04 	ldr.w	r7, [r5, #-4]
    357c:	496a      	ldr	r1, [pc, #424]	; (3728 <_free_r+0x1c0>)
    357e:	f027 0301 	bic.w	r3, r7, #1
    3582:	f1a5 0408 	sub.w	r4, r5, #8
    3586:	18e2      	adds	r2, r4, r3
    3588:	688e      	ldr	r6, [r1, #8]
    358a:	6850      	ldr	r0, [r2, #4]
    358c:	42b2      	cmp	r2, r6
    358e:	f020 0003 	bic.w	r0, r0, #3
    3592:	d062      	beq.n	365a <_free_r+0xf2>
    3594:	07fe      	lsls	r6, r7, #31
    3596:	6050      	str	r0, [r2, #4]
    3598:	d40b      	bmi.n	35b2 <_free_r+0x4a>
    359a:	f855 7c08 	ldr.w	r7, [r5, #-8]
    359e:	1be4      	subs	r4, r4, r7
    35a0:	f101 0e08 	add.w	lr, r1, #8
    35a4:	68a5      	ldr	r5, [r4, #8]
    35a6:	4575      	cmp	r5, lr
    35a8:	443b      	add	r3, r7
    35aa:	d06f      	beq.n	368c <_free_r+0x124>
    35ac:	68e7      	ldr	r7, [r4, #12]
    35ae:	60ef      	str	r7, [r5, #12]
    35b0:	60bd      	str	r5, [r7, #8]
    35b2:	1815      	adds	r5, r2, r0
    35b4:	686d      	ldr	r5, [r5, #4]
    35b6:	07ed      	lsls	r5, r5, #31
    35b8:	d542      	bpl.n	3640 <_free_r+0xd8>
    35ba:	f043 0201 	orr.w	r2, r3, #1
    35be:	6062      	str	r2, [r4, #4]
    35c0:	50e3      	str	r3, [r4, r3]
    35c2:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    35c6:	d218      	bcs.n	35fa <_free_r+0x92>
    35c8:	08db      	lsrs	r3, r3, #3
    35ca:	1c5a      	adds	r2, r3, #1
    35cc:	684d      	ldr	r5, [r1, #4]
    35ce:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    35d2:	60a7      	str	r7, [r4, #8]
    35d4:	2001      	movs	r0, #1
    35d6:	109b      	asrs	r3, r3, #2
    35d8:	fa00 f303 	lsl.w	r3, r0, r3
    35dc:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    35e0:	431d      	orrs	r5, r3
    35e2:	3808      	subs	r0, #8
    35e4:	60e0      	str	r0, [r4, #12]
    35e6:	604d      	str	r5, [r1, #4]
    35e8:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    35ec:	60fc      	str	r4, [r7, #12]
    35ee:	4640      	mov	r0, r8
    35f0:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    35f4:	f7ff bee0 	b.w	33b8 <__malloc_unlock>
    35f8:	4770      	bx	lr
    35fa:	0a5a      	lsrs	r2, r3, #9
    35fc:	2a04      	cmp	r2, #4
    35fe:	d853      	bhi.n	36a8 <_free_r+0x140>
    3600:	099a      	lsrs	r2, r3, #6
    3602:	f102 0739 	add.w	r7, r2, #57	; 0x39
    3606:	007f      	lsls	r7, r7, #1
    3608:	f102 0538 	add.w	r5, r2, #56	; 0x38
    360c:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    3610:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    3614:	4944      	ldr	r1, [pc, #272]	; (3728 <_free_r+0x1c0>)
    3616:	3808      	subs	r0, #8
    3618:	4290      	cmp	r0, r2
    361a:	d04d      	beq.n	36b8 <_free_r+0x150>
    361c:	6851      	ldr	r1, [r2, #4]
    361e:	f021 0103 	bic.w	r1, r1, #3
    3622:	428b      	cmp	r3, r1
    3624:	d202      	bcs.n	362c <_free_r+0xc4>
    3626:	6892      	ldr	r2, [r2, #8]
    3628:	4290      	cmp	r0, r2
    362a:	d1f7      	bne.n	361c <_free_r+0xb4>
    362c:	68d0      	ldr	r0, [r2, #12]
    362e:	60e0      	str	r0, [r4, #12]
    3630:	60a2      	str	r2, [r4, #8]
    3632:	6084      	str	r4, [r0, #8]
    3634:	60d4      	str	r4, [r2, #12]
    3636:	4640      	mov	r0, r8
    3638:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    363c:	f7ff bebc 	b.w	33b8 <__malloc_unlock>
    3640:	6895      	ldr	r5, [r2, #8]
    3642:	4f3a      	ldr	r7, [pc, #232]	; (372c <_free_r+0x1c4>)
    3644:	42bd      	cmp	r5, r7
    3646:	4403      	add	r3, r0
    3648:	d03f      	beq.n	36ca <_free_r+0x162>
    364a:	68d0      	ldr	r0, [r2, #12]
    364c:	60e8      	str	r0, [r5, #12]
    364e:	f043 0201 	orr.w	r2, r3, #1
    3652:	6085      	str	r5, [r0, #8]
    3654:	6062      	str	r2, [r4, #4]
    3656:	50e3      	str	r3, [r4, r3]
    3658:	e7b3      	b.n	35c2 <_free_r+0x5a>
    365a:	07ff      	lsls	r7, r7, #31
    365c:	4403      	add	r3, r0
    365e:	d407      	bmi.n	3670 <_free_r+0x108>
    3660:	f855 2c08 	ldr.w	r2, [r5, #-8]
    3664:	1aa4      	subs	r4, r4, r2
    3666:	4413      	add	r3, r2
    3668:	68a0      	ldr	r0, [r4, #8]
    366a:	68e2      	ldr	r2, [r4, #12]
    366c:	60c2      	str	r2, [r0, #12]
    366e:	6090      	str	r0, [r2, #8]
    3670:	4a2f      	ldr	r2, [pc, #188]	; (3730 <_free_r+0x1c8>)
    3672:	6812      	ldr	r2, [r2, #0]
    3674:	f043 0001 	orr.w	r0, r3, #1
    3678:	4293      	cmp	r3, r2
    367a:	6060      	str	r0, [r4, #4]
    367c:	608c      	str	r4, [r1, #8]
    367e:	d3b6      	bcc.n	35ee <_free_r+0x86>
    3680:	4b2c      	ldr	r3, [pc, #176]	; (3734 <_free_r+0x1cc>)
    3682:	4640      	mov	r0, r8
    3684:	6819      	ldr	r1, [r3, #0]
    3686:	f7ff ff21 	bl	34cc <_malloc_trim_r>
    368a:	e7b0      	b.n	35ee <_free_r+0x86>
    368c:	1811      	adds	r1, r2, r0
    368e:	6849      	ldr	r1, [r1, #4]
    3690:	07c9      	lsls	r1, r1, #31
    3692:	d444      	bmi.n	371e <_free_r+0x1b6>
    3694:	6891      	ldr	r1, [r2, #8]
    3696:	68d2      	ldr	r2, [r2, #12]
    3698:	60ca      	str	r2, [r1, #12]
    369a:	4403      	add	r3, r0
    369c:	f043 0001 	orr.w	r0, r3, #1
    36a0:	6091      	str	r1, [r2, #8]
    36a2:	6060      	str	r0, [r4, #4]
    36a4:	50e3      	str	r3, [r4, r3]
    36a6:	e7a2      	b.n	35ee <_free_r+0x86>
    36a8:	2a14      	cmp	r2, #20
    36aa:	d817      	bhi.n	36dc <_free_r+0x174>
    36ac:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    36b0:	007f      	lsls	r7, r7, #1
    36b2:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    36b6:	e7a9      	b.n	360c <_free_r+0xa4>
    36b8:	10aa      	asrs	r2, r5, #2
    36ba:	684b      	ldr	r3, [r1, #4]
    36bc:	2501      	movs	r5, #1
    36be:	fa05 f202 	lsl.w	r2, r5, r2
    36c2:	4313      	orrs	r3, r2
    36c4:	604b      	str	r3, [r1, #4]
    36c6:	4602      	mov	r2, r0
    36c8:	e7b1      	b.n	362e <_free_r+0xc6>
    36ca:	f043 0201 	orr.w	r2, r3, #1
    36ce:	614c      	str	r4, [r1, #20]
    36d0:	610c      	str	r4, [r1, #16]
    36d2:	60e5      	str	r5, [r4, #12]
    36d4:	60a5      	str	r5, [r4, #8]
    36d6:	6062      	str	r2, [r4, #4]
    36d8:	50e3      	str	r3, [r4, r3]
    36da:	e788      	b.n	35ee <_free_r+0x86>
    36dc:	2a54      	cmp	r2, #84	; 0x54
    36de:	d806      	bhi.n	36ee <_free_r+0x186>
    36e0:	0b1a      	lsrs	r2, r3, #12
    36e2:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    36e6:	007f      	lsls	r7, r7, #1
    36e8:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    36ec:	e78e      	b.n	360c <_free_r+0xa4>
    36ee:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    36f2:	d806      	bhi.n	3702 <_free_r+0x19a>
    36f4:	0bda      	lsrs	r2, r3, #15
    36f6:	f102 0778 	add.w	r7, r2, #120	; 0x78
    36fa:	007f      	lsls	r7, r7, #1
    36fc:	f102 0577 	add.w	r5, r2, #119	; 0x77
    3700:	e784      	b.n	360c <_free_r+0xa4>
    3702:	f240 5054 	movw	r0, #1364	; 0x554
    3706:	4282      	cmp	r2, r0
    3708:	d806      	bhi.n	3718 <_free_r+0x1b0>
    370a:	0c9a      	lsrs	r2, r3, #18
    370c:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    3710:	007f      	lsls	r7, r7, #1
    3712:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    3716:	e779      	b.n	360c <_free_r+0xa4>
    3718:	27fe      	movs	r7, #254	; 0xfe
    371a:	257e      	movs	r5, #126	; 0x7e
    371c:	e776      	b.n	360c <_free_r+0xa4>
    371e:	f043 0201 	orr.w	r2, r3, #1
    3722:	6062      	str	r2, [r4, #4]
    3724:	50e3      	str	r3, [r4, r3]
    3726:	e762      	b.n	35ee <_free_r+0x86>
    3728:	1fff8de4 	.word	0x1fff8de4
    372c:	1fff8dec 	.word	0x1fff8dec
    3730:	1fff91ec 	.word	0x1fff91ec
    3734:	1fff95dc 	.word	0x1fff95dc
    3738:	736e6553 	.word	0x736e6553
    373c:	4f20726f 	.word	0x4f20726f
    3740:	6950206e 	.word	0x6950206e
    3744:	0000206e 	.word	0x0000206e
    3748:	6d6f4320 	.word	0x6d6f4320
    374c:	74656c70 	.word	0x74656c70
    3750:	ffff0065 	.word	0xffff0065
    3754:	74696e49 	.word	0x74696e49
    3758:	746e4920 	.word	0x746e4920
    375c:	75727265 	.word	0x75727265
    3760:	20737470 	.word	0x20737470
    3764:	0000202d 	.word	0x0000202d
    3768:	706d6f43 	.word	0x706d6f43
    376c:	6574656c 	.word	0x6574656c
    3770:	00000000 	.word	0x00000000
    3774:	ffff0a0d 	.word	0xffff0a0d

00003778 <digital_pin_to_info_PGM>:
    3778:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    3788:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    3798:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    37a8:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    37b8:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    37c8:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    37d8:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    37e8:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    37f8:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    3808:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    3818:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    3828:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    3838:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    3848:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    3858:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    3868:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    3878:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

00003888 <vtable for usb_serial_class>:
	...
    3890:	00001c25 00001c1d 00001c19 00001c15     %...............
    38a0:	00001c11 00001c0d 00001c09 00001c05     ................

000038b0 <usb_endpoint_config_table>:
    38b0:	15191500                                ....

000038b4 <usb_descriptor_list>:
    38b4:	00000100 1fff8910 00000012 00000200     ................
    38c4:	1fff893c 00000043 00000300 1fff8998     <...C...........
    38d4:	00000000 04090301 1fff8924 00000000     ........$.......
    38e4:	04090302 1fff8980 00000000 04090303     ................
    38f4:	1fff899c 00000000 00000000 00000000     ................
    3904:	00000000                                ....

00003908 <_global_impure_ptr>:
    3908:	1fff89b8                                ....

0000390c <_init>:
    390c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    390e:	bf00      	nop
    3910:	bcf8      	pop	{r3, r4, r5, r6, r7}
    3912:	bc08      	pop	{r3}
    3914:	469e      	mov	lr, r3
    3916:	4770      	bx	lr

00003918 <__init_array_start>:
    3918:	00003485 	.word	0x00003485

0000391c <__frame_dummy_init_array_entry>:
    391c:	00000435 0000083d                       5...=...

Disassembly of section .fini:

00003924 <_fini>:
    3924:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3926:	bf00      	nop

Disassembly of section .data:

1fff8720 <port_E_isr>:
PORT_ISR_FUNCTION_CLZ(E)
1fff8720:	b538      	push	{r3, r4, r5, lr}
1fff8722:	4b08      	ldr	r3, [pc, #32]	; (1fff8744 <port_E_isr+0x24>)
1fff8724:	681c      	ldr	r4, [r3, #0]
1fff8726:	601c      	str	r4, [r3, #0]
1fff8728:	b154      	cbz	r4, 1fff8740 <port_E_isr+0x20>
1fff872a:	4d07      	ldr	r5, [pc, #28]	; (1fff8748 <port_E_isr+0x28>)
1fff872c:	fa94 f3a4 	rbit	r3, r4
1fff8730:	fab3 f383 	clz	r3, r3
1fff8734:	f855 3023 	ldr.w	r3, [r5, r3, lsl #2]
1fff8738:	4798      	blx	r3
1fff873a:	1e63      	subs	r3, r4, #1
1fff873c:	401c      	ands	r4, r3
1fff873e:	d1f5      	bne.n	1fff872c <port_E_isr+0xc>
1fff8740:	bd38      	pop	{r3, r4, r5, pc}
1fff8742:	bf00      	nop
1fff8744:	4004d0a0 	.word	0x4004d0a0
1fff8748:	1fff88f0 	.word	0x1fff88f0

1fff874c <port_D_isr>:
PORT_ISR_FUNCTION_CLZ(D)
1fff874c:	b538      	push	{r3, r4, r5, lr}
1fff874e:	4b08      	ldr	r3, [pc, #32]	; (1fff8770 <port_D_isr+0x24>)
1fff8750:	681c      	ldr	r4, [r3, #0]
1fff8752:	601c      	str	r4, [r3, #0]
1fff8754:	b154      	cbz	r4, 1fff876c <port_D_isr+0x20>
1fff8756:	4d07      	ldr	r5, [pc, #28]	; (1fff8774 <port_D_isr+0x28>)
1fff8758:	fa94 f3a4 	rbit	r3, r4
1fff875c:	fab3 f383 	clz	r3, r3
1fff8760:	f855 3023 	ldr.w	r3, [r5, r3, lsl #2]
1fff8764:	4798      	blx	r3
1fff8766:	1e63      	subs	r3, r4, #1
1fff8768:	401c      	ands	r4, r3
1fff876a:	d1f5      	bne.n	1fff8758 <port_D_isr+0xc>
1fff876c:	bd38      	pop	{r3, r4, r5, pc}
1fff876e:	bf00      	nop
1fff8770:	4004c0a0 	.word	0x4004c0a0
1fff8774:	1fff88d0 	.word	0x1fff88d0

1fff8778 <port_C_isr>:
PORT_ISR_FUNCTION_CLZ(C)
1fff8778:	b538      	push	{r3, r4, r5, lr}
1fff877a:	4b08      	ldr	r3, [pc, #32]	; (1fff879c <port_C_isr+0x24>)
1fff877c:	681c      	ldr	r4, [r3, #0]
1fff877e:	601c      	str	r4, [r3, #0]
1fff8780:	b154      	cbz	r4, 1fff8798 <port_C_isr+0x20>
1fff8782:	4d07      	ldr	r5, [pc, #28]	; (1fff87a0 <port_C_isr+0x28>)
1fff8784:	fa94 f3a4 	rbit	r3, r4
1fff8788:	fab3 f383 	clz	r3, r3
1fff878c:	f855 3023 	ldr.w	r3, [r5, r3, lsl #2]
1fff8790:	4798      	blx	r3
1fff8792:	1e63      	subs	r3, r4, #1
1fff8794:	401c      	ands	r4, r3
1fff8796:	d1f5      	bne.n	1fff8784 <port_C_isr+0xc>
1fff8798:	bd38      	pop	{r3, r4, r5, pc}
1fff879a:	bf00      	nop
1fff879c:	4004b0a0 	.word	0x4004b0a0
1fff87a0:	1fff88a0 	.word	0x1fff88a0

1fff87a4 <port_B_isr>:
PORT_ISR_FUNCTION_CLZ(B)
1fff87a4:	b538      	push	{r3, r4, r5, lr}
1fff87a6:	4b08      	ldr	r3, [pc, #32]	; (1fff87c8 <port_B_isr+0x24>)
1fff87a8:	681c      	ldr	r4, [r3, #0]
1fff87aa:	601c      	str	r4, [r3, #0]
1fff87ac:	b154      	cbz	r4, 1fff87c4 <port_B_isr+0x20>
1fff87ae:	4d07      	ldr	r5, [pc, #28]	; (1fff87cc <port_B_isr+0x28>)
1fff87b0:	fa94 f3a4 	rbit	r3, r4
1fff87b4:	fab3 f383 	clz	r3, r3
1fff87b8:	f855 3023 	ldr.w	r3, [r5, r3, lsl #2]
1fff87bc:	4798      	blx	r3
1fff87be:	1e63      	subs	r3, r4, #1
1fff87c0:	401c      	ands	r4, r3
1fff87c2:	d1f5      	bne.n	1fff87b0 <port_B_isr+0xc>
1fff87c4:	bd38      	pop	{r3, r4, r5, pc}
1fff87c6:	bf00      	nop
1fff87c8:	4004a0a0 	.word	0x4004a0a0
1fff87cc:	1fff8850 	.word	0x1fff8850

1fff87d0 <port_A_isr>:
PORT_ISR_FUNCTION_CLZ(A)
1fff87d0:	b538      	push	{r3, r4, r5, lr}
1fff87d2:	4b08      	ldr	r3, [pc, #32]	; (1fff87f4 <port_A_isr+0x24>)
1fff87d4:	681c      	ldr	r4, [r3, #0]
1fff87d6:	601c      	str	r4, [r3, #0]
1fff87d8:	b154      	cbz	r4, 1fff87f0 <port_A_isr+0x20>
1fff87da:	4d07      	ldr	r5, [pc, #28]	; (1fff87f8 <port_A_isr+0x28>)
1fff87dc:	fa94 f3a4 	rbit	r3, r4
1fff87e0:	fab3 f383 	clz	r3, r3
1fff87e4:	f855 3023 	ldr.w	r3, [r5, r3, lsl #2]
1fff87e8:	4798      	blx	r3
1fff87ea:	1e63      	subs	r3, r4, #1
1fff87ec:	401c      	ands	r4, r3
1fff87ee:	d1f5      	bne.n	1fff87dc <port_A_isr+0xc>
1fff87f0:	bd38      	pop	{r3, r4, r5, pc}
1fff87f2:	bf00      	nop
1fff87f4:	400490a0 	.word	0x400490a0
1fff87f8:	1fff8818 	.word	0x1fff8818

1fff87fc <__dso_handle>:
1fff87fc:	00000000                                ....

1fff8800 <InterPulseTime>:
1fff8800:	0007a10c                                ....

1fff8804 <InterSyncTime>:
1fff8804:	00005dc0                                .]..

1fff8808 <SENSOR_1_PINS>:
1fff8808:	00000015 00000016 00000017              ............

1fff8814 <__brkval>:
1fff8814:	1fff9620                                 ...

1fff8818 <isr_table_portA>:
1fff8818:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8828:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8838:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8848:	00000aa1 00000aa1                       ........

1fff8850 <isr_table_portB>:
1fff8850:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8860:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8870:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8880:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff8890:	00000aa1 00000aa1 00000aa1 00000aa1     ................

1fff88a0 <isr_table_portC>:
1fff88a0:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff88b0:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff88c0:	00000aa1 00000aa1 00000aa1 00000aa1     ................

1fff88d0 <isr_table_portD>:
1fff88d0:	00000aa1 00000aa1 00000aa1 00000aa1     ................
1fff88e0:	00000aa1 00000aa1 00000aa1 00000aa1     ................

1fff88f0 <isr_table_portE>:
1fff88f0:	00000aa1 00000aa1                       ........

1fff88f8 <Serial>:
1fff88f8:	00003890 00000000 000003e8 00000000     .8..............

1fff8908 <usb_buffer_available>:
1fff8908:	ffffffff                                ....

1fff890c <analog_config_bits>:
1fff890c:	                                         .

1fff890d <analog_num_average>:
1fff890d:	                                         ...

1fff8910 <device_descriptor>:
1fff8910:	01010112 40000002 048316c0 02010200     .......@........
1fff8920:	00000103                                ....

1fff8924 <usb_string_manufacturer_name_default>:
1fff8924:	00540318 00650065 0073006e 00640079     ..T.e.e.n.s.y.d.
1fff8934:	00690075 006f006e                       u.i.n.o.

1fff893c <config_descriptor>:
1fff893c:	00430209 c0000102 00040932 02020100     ..C.....2.......
1fff894c:	24050001 05011000 01010124 06022404     ...$....$....$..
1fff895c:	00062405 82050701 40001003 00010409     .$.........@....
1fff896c:	00000a02 03050700 00004002 02840507     .........@......
1fff897c:	00000040                                @...

1fff8980 <usb_string_product_name_default>:
1fff8980:	00550316 00420053 00530020 00720065     ..U.S.B. .S.e.r.
1fff8990:	00610069 0000006c                       i.a.l...

1fff8998 <string0>:
1fff8998:	04090304                                ....

1fff899c <usb_string_serial_number_default>:
1fff899c:	0000030c 00000000 00000000 00000000     ................
	...

1fff89b8 <impure_data>:
1fff89b8:	00000000 1fff8ca4 1fff8d0c 1fff8d74     ............t...
	...
1fff8a60:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
1fff8a70:	0005deec 0000000b 00000000 00000000     ................
	...

1fff8de0 <_impure_ptr>:
1fff8de0:	1fff89b8                                ....

1fff8de4 <__malloc_av_>:
	...
1fff8dec:	1fff8de4 1fff8de4 1fff8dec 1fff8dec     ................
1fff8dfc:	1fff8df4 1fff8df4 1fff8dfc 1fff8dfc     ................
1fff8e0c:	1fff8e04 1fff8e04 1fff8e0c 1fff8e0c     ................
1fff8e1c:	1fff8e14 1fff8e14 1fff8e1c 1fff8e1c     ................
1fff8e2c:	1fff8e24 1fff8e24 1fff8e2c 1fff8e2c     $...$...,...,...
1fff8e3c:	1fff8e34 1fff8e34 1fff8e3c 1fff8e3c     4...4...<...<...
1fff8e4c:	1fff8e44 1fff8e44 1fff8e4c 1fff8e4c     D...D...L...L...
1fff8e5c:	1fff8e54 1fff8e54 1fff8e5c 1fff8e5c     T...T...\...\...
1fff8e6c:	1fff8e64 1fff8e64 1fff8e6c 1fff8e6c     d...d...l...l...
1fff8e7c:	1fff8e74 1fff8e74 1fff8e7c 1fff8e7c     t...t...|...|...
1fff8e8c:	1fff8e84 1fff8e84 1fff8e8c 1fff8e8c     ................
1fff8e9c:	1fff8e94 1fff8e94 1fff8e9c 1fff8e9c     ................
1fff8eac:	1fff8ea4 1fff8ea4 1fff8eac 1fff8eac     ................
1fff8ebc:	1fff8eb4 1fff8eb4 1fff8ebc 1fff8ebc     ................
1fff8ecc:	1fff8ec4 1fff8ec4 1fff8ecc 1fff8ecc     ................
1fff8edc:	1fff8ed4 1fff8ed4 1fff8edc 1fff8edc     ................
1fff8eec:	1fff8ee4 1fff8ee4 1fff8eec 1fff8eec     ................
1fff8efc:	1fff8ef4 1fff8ef4 1fff8efc 1fff8efc     ................
1fff8f0c:	1fff8f04 1fff8f04 1fff8f0c 1fff8f0c     ................
1fff8f1c:	1fff8f14 1fff8f14 1fff8f1c 1fff8f1c     ................
1fff8f2c:	1fff8f24 1fff8f24 1fff8f2c 1fff8f2c     $...$...,...,...
1fff8f3c:	1fff8f34 1fff8f34 1fff8f3c 1fff8f3c     4...4...<...<...
1fff8f4c:	1fff8f44 1fff8f44 1fff8f4c 1fff8f4c     D...D...L...L...
1fff8f5c:	1fff8f54 1fff8f54 1fff8f5c 1fff8f5c     T...T...\...\...
1fff8f6c:	1fff8f64 1fff8f64 1fff8f6c 1fff8f6c     d...d...l...l...
1fff8f7c:	1fff8f74 1fff8f74 1fff8f7c 1fff8f7c     t...t...|...|...
1fff8f8c:	1fff8f84 1fff8f84 1fff8f8c 1fff8f8c     ................
1fff8f9c:	1fff8f94 1fff8f94 1fff8f9c 1fff8f9c     ................
1fff8fac:	1fff8fa4 1fff8fa4 1fff8fac 1fff8fac     ................
1fff8fbc:	1fff8fb4 1fff8fb4 1fff8fbc 1fff8fbc     ................
1fff8fcc:	1fff8fc4 1fff8fc4 1fff8fcc 1fff8fcc     ................
1fff8fdc:	1fff8fd4 1fff8fd4 1fff8fdc 1fff8fdc     ................
1fff8fec:	1fff8fe4 1fff8fe4 1fff8fec 1fff8fec     ................
1fff8ffc:	1fff8ff4 1fff8ff4 1fff8ffc 1fff8ffc     ................
1fff900c:	1fff9004 1fff9004 1fff900c 1fff900c     ................
1fff901c:	1fff9014 1fff9014 1fff901c 1fff901c     ................
1fff902c:	1fff9024 1fff9024 1fff902c 1fff902c     $...$...,...,...
1fff903c:	1fff9034 1fff9034 1fff903c 1fff903c     4...4...<...<...
1fff904c:	1fff9044 1fff9044 1fff904c 1fff904c     D...D...L...L...
1fff905c:	1fff9054 1fff9054 1fff905c 1fff905c     T...T...\...\...
1fff906c:	1fff9064 1fff9064 1fff906c 1fff906c     d...d...l...l...
1fff907c:	1fff9074 1fff9074 1fff907c 1fff907c     t...t...|...|...
1fff908c:	1fff9084 1fff9084 1fff908c 1fff908c     ................
1fff909c:	1fff9094 1fff9094 1fff909c 1fff909c     ................
1fff90ac:	1fff90a4 1fff90a4 1fff90ac 1fff90ac     ................
1fff90bc:	1fff90b4 1fff90b4 1fff90bc 1fff90bc     ................
1fff90cc:	1fff90c4 1fff90c4 1fff90cc 1fff90cc     ................
1fff90dc:	1fff90d4 1fff90d4 1fff90dc 1fff90dc     ................
1fff90ec:	1fff90e4 1fff90e4 1fff90ec 1fff90ec     ................
1fff90fc:	1fff90f4 1fff90f4 1fff90fc 1fff90fc     ................
1fff910c:	1fff9104 1fff9104 1fff910c 1fff910c     ................
1fff911c:	1fff9114 1fff9114 1fff911c 1fff911c     ................
1fff912c:	1fff9124 1fff9124 1fff912c 1fff912c     $...$...,...,...
1fff913c:	1fff9134 1fff9134 1fff913c 1fff913c     4...4...<...<...
1fff914c:	1fff9144 1fff9144 1fff914c 1fff914c     D...D...L...L...
1fff915c:	1fff9154 1fff9154 1fff915c 1fff915c     T...T...\...\...
1fff916c:	1fff9164 1fff9164 1fff916c 1fff916c     d...d...l...l...
1fff917c:	1fff9174 1fff9174 1fff917c 1fff917c     t...t...|...|...
1fff918c:	1fff9184 1fff9184 1fff918c 1fff918c     ................
1fff919c:	1fff9194 1fff9194 1fff919c 1fff919c     ................
1fff91ac:	1fff91a4 1fff91a4 1fff91ac 1fff91ac     ................
1fff91bc:	1fff91b4 1fff91b4 1fff91bc 1fff91bc     ................
1fff91cc:	1fff91c4 1fff91c4 1fff91cc 1fff91cc     ................
1fff91dc:	1fff91d4 1fff91d4 1fff91dc 1fff91dc     ................

1fff91ec <__malloc_trim_threshold>:
1fff91ec:	00020000                                ....

1fff91f0 <__malloc_sbrk_base>:
1fff91f0:	ffffffff                                ....
