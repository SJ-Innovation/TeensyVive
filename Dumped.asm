
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 61 11 00 00 19 11 00 00     ... ....a.......
      10:	19 11 00 00 19 11 00 00 19 11 00 00 19 11 00 00     ................
      20:	19 11 00 00 19 11 00 00 19 11 00 00 61 11 00 00     ............a...
      30:	61 11 00 00 19 11 00 00 ad 28 00 00 e9 2a 00 00     a........(...*..
      40:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      50:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      60:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      70:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      80:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      90:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      a0:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      b0:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      c0:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      d0:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      e0:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
      f0:	61 11 00 00 05 2c 00 00 61 11 00 00 31 2d 00 00     a....,..a...1-..
     100:	61 11 00 00 5d 2e 00 00 61 11 00 00 61 11 00 00     a...]...a...a...
     110:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     120:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     130:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     140:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     150:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     160:	61 11 00 00 c9 17 00 00 61 11 00 00 61 11 00 00     a.......a...a...
     170:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     180:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     190:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     1a0:	61 11 00 00 61 11 00 00 61 11 00 00 61 11 00 00     a...a...a...a...
     1b0:	61 11 00 00 61 11 00 00 61 11 00 00                 a...a...a...

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
     1d0:	f000 ffca 	bl	1168 <startup_early_hook>
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
     2d6:	f001 f81f 	bl	1318 <_init_Teensyduino_internal_>

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
     2e4:	f001 f806 	bl	12f4 <rtc_set>
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
     302:	f000 fff7 	bl	12f4 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f003 fddb 	bl	3ec4 <__libc_init_array>

	startup_late_hook();
     30e:	f000 ff31 	bl	1174 <startup_late_hook>
	main();
     312:	f000 fc6b 	bl	bec <main>
     316:	e7fe      	b.n	316 <ResetHandler+0x15a>
     318:	4005200e 	.word	0x4005200e
     31c:	40048030 	.word	0x40048030
     320:	00043f82 	.word	0x00043f82
     324:	2b000001 	.word	0x2b000001
     328:	4003d010 	.word	0x4003d010
     32c:	4003d014 	.word	0x4003d014
     330:	4007d002 	.word	0x4007d002
     334:	4007e000 	.word	0x4007e000
     338:	1fff91ec 	.word	0x1fff91ec
     33c:	00004a28 	.word	0x00004a28
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91ec 	.word	0x1fff91ec
     348:	1fff96b0 	.word	0x1fff96b0
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
     380:	5ab008e1 	.word	0x5ab008e1
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
     428:	1fff91ec 	.word	0x1fff91ec
     42c:	00000000 	.word	0x00000000
     430:	00004a24 	.word	0x00004a24

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
     45c:	1fff91f0 	.word	0x1fff91f0
     460:	00004a24 	.word	0x00004a24
     464:	1fff91ec 	.word	0x1fff91ec
     468:	00000000 	.word	0x00000000

0000046c <BaseOOTX::BaseOOTX(int)>:

#include "OOTX.h"
#include "config.h"

BaseOOTX::BaseOOTX(int ID) {
     46c:	b510      	push	{r4, lr}
    _ID = ID;
    InputPointer = 0;
     46e:	2300      	movs	r3, #0
BaseOOTX::BaseOOTX(int ID) {
     470:	4604      	mov	r4, r0
    _ID = ID;
     472:	6481      	str	r1, [r0, #72]	; 0x48
    memset(InputBuffer, 0, OOTX_BUFFER_SIZE);
     474:	2242      	movs	r2, #66	; 0x42
    InputPointer = 0;
     476:	f840 3b04 	str.w	r3, [r0], #4
    memset(InputBuffer, 0, OOTX_BUFFER_SIZE);
     47a:	4619      	mov	r1, r3
     47c:	f000 fe2a 	bl	10d4 <memset>

}
     480:	4620      	mov	r0, r4
     482:	bd10      	pop	{r4, pc}

00000484 <BaseOOTX::~BaseOOTX()>:

BaseOOTX::~BaseOOTX() {
}
     484:	4770      	bx	lr
     486:	bf00      	nop

00000488 <BaseOOTX::NewOOTXBit(bool)>:
        }
    }
}


bool BaseOOTX::NewOOTXBit(bool NewInBit) {
     488:	b570      	push	{r4, r5, r6, lr}
     48a:	4606      	mov	r6, r0
    static u_int8_t ConsecZeros = 0;
    if (NewInBit) { //1
     48c:	b189      	cbz	r1, 4b2 <BaseOOTX::NewOOTXBit(bool)+0x2a>
        if (ConsecZeros == OOTX_PREAMBLE_LENGTH) {
     48e:	4b25      	ldr	r3, [pc, #148]	; (524 <BaseOOTX::NewOOTXBit(bool)+0x9c>)
     490:	781a      	ldrb	r2, [r3, #0]
     492:	2a11      	cmp	r2, #17
     494:	d030      	beq.n	4f8 <BaseOOTX::NewOOTXBit(bool)+0x70>
     496:	1d05      	adds	r5, r0, #4

    }
    else {
        ConsecZeros++;
    }
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     498:	6833      	ldr	r3, [r6, #0]
     49a:	eb06 00d3 	add.w	r0, r6, r3, lsr #3
     49e:	43db      	mvns	r3, r3
     4a0:	7902      	ldrb	r2, [r0, #4]
     4a2:	f003 0307 	and.w	r3, r3, #7
     4a6:	2101      	movs	r1, #1
     4a8:	fa01 f303 	lsl.w	r3, r1, r3
     4ac:	4313      	orrs	r3, r2
     4ae:	7103      	strb	r3, [r0, #4]
     4b0:	e011      	b.n	4d6 <BaseOOTX::NewOOTXBit(bool)+0x4e>
     4b2:	6803      	ldr	r3, [r0, #0]
        ConsecZeros++;
     4b4:	4c1b      	ldr	r4, [pc, #108]	; (524 <BaseOOTX::NewOOTXBit(bool)+0x9c>)
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4b6:	eb00 05d3 	add.w	r5, r0, r3, lsr #3
     4ba:	43db      	mvns	r3, r3
     4bc:	7929      	ldrb	r1, [r5, #4]
        ConsecZeros++;
     4be:	7822      	ldrb	r2, [r4, #0]
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4c0:	2001      	movs	r0, #1
     4c2:	f003 0307 	and.w	r3, r3, #7
     4c6:	fa00 f303 	lsl.w	r3, r0, r3
     4ca:	ea21 0103 	bic.w	r1, r1, r3
        ConsecZeros++;
     4ce:	1813      	adds	r3, r2, r0
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4d0:	7129      	strb	r1, [r5, #4]
        ConsecZeros++;
     4d2:	7023      	strb	r3, [r4, #0]
     4d4:	1d35      	adds	r5, r6, #4
     4d6:	3646      	adds	r6, #70	; 0x46
bool BaseOOTX::NewOOTXBit(bool NewInBit) {
     4d8:	2407      	movs	r4, #7
	size_t print(char c)				{ return write((uint8_t)c); }
	size_t print(const char s[])			{ return write(s); }
	size_t print(const __FlashStringHelper *f)	{ return write((const char *)f); }

	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
	size_t print(int n)				{ return print((long)n); }
     4da:	7829      	ldrb	r1, [r5, #0]
     4dc:	4812      	ldr	r0, [pc, #72]	; (528 <BaseOOTX::NewOOTXBit(bool)+0xa0>)
     4de:	4121      	asrs	r1, r4
     4e0:	f001 0101 	and.w	r1, r1, #1
     4e4:	3c01      	subs	r4, #1
     4e6:	f000 fbc9 	bl	c7c <Print::print(long)>
        for (int j = 0; j < 8; j++) {
     4ea:	1c63      	adds	r3, r4, #1
     4ec:	d1f5      	bne.n	4da <BaseOOTX::NewOOTXBit(bool)+0x52>
     4ee:	3501      	adds	r5, #1
    for (int i = 0; i < OOTX_BUFFER_SIZE; i++) {
     4f0:	42ae      	cmp	r6, r5
     4f2:	d1f1      	bne.n	4d8 <BaseOOTX::NewOOTXBit(bool)+0x50>
    PrintBuffer();
    return false;
     4f4:	2000      	movs	r0, #0
     4f6:	bd70      	pop	{r4, r5, r6, pc}
            ConsecZeros = 0;
     4f8:	2400      	movs	r4, #0
            InputPointer = 0;
     4fa:	6004      	str	r4, [r0, #0]
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     4fc:	2109      	movs	r1, #9
     4fe:	480b      	ldr	r0, [pc, #44]	; (52c <BaseOOTX::NewOOTXBit(bool)+0xa4>)
            ConsecZeros = 0;
     500:	701c      	strb	r4, [r3, #0]
     502:	f001 ffe9 	bl	24d8 <usb_serial_write>
     506:	6cb1      	ldr	r1, [r6, #72]	; 0x48
     508:	4807      	ldr	r0, [pc, #28]	; (528 <BaseOOTX::NewOOTXBit(bool)+0xa0>)
     50a:	f000 fbb7 	bl	c7c <Print::print(long)>
            memset(InputBuffer, 0, OOTX_BUFFER_SIZE);
     50e:	1d35      	adds	r5, r6, #4
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
	size_t println(const __FlashStringHelper *f)	{ return print(f) + println(); }

	size_t println(uint8_t b)			{ return print(b) + println(); }
	size_t println(int n)				{ return print(n) + println(); }
     510:	4805      	ldr	r0, [pc, #20]	; (528 <BaseOOTX::NewOOTXBit(bool)+0xa0>)
     512:	f000 fc2d 	bl	d70 <Print::println()>
     516:	4621      	mov	r1, r4
     518:	4628      	mov	r0, r5
     51a:	2242      	movs	r2, #66	; 0x42
     51c:	f000 fdda 	bl	10d4 <memset>
     520:	e7ba      	b.n	498 <BaseOOTX::NewOOTXBit(bool)+0x10>
     522:	bf00      	nop
     524:	1fff9208 	.word	0x1fff9208
     528:	1fff88f0 	.word	0x1fff88f0
     52c:	00004818 	.word	0x00004818

00000530 <SensorNode::SensorNode(SensorPinData_t)>:
    }

}


SensorNode::SensorNode(SensorPinData_t PinData) {
     530:	b430      	push	{r4, r5}
     532:	b084      	sub	sp, #16
     534:	ac01      	add	r4, sp, #4
     536:	e884 000e 	stmia.w	r4, {r1, r2, r3}
     53a:	4605      	mov	r5, r0
    _PinData = PinData;
     53c:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
     540:	f105 02e8 	add.w	r2, r5, #232	; 0xe8
     544:	e882 000b 	stmia.w	r2, {r0, r1, r3}
}
     548:	4628      	mov	r0, r5
     54a:	b004      	add	sp, #16
     54c:	bc30      	pop	{r4, r5}
     54e:	4770      	bx	lr

00000550 <SensorNode::NeedsPulseHandling()>:

bool SensorNode::NeedsPulseHandling() {
    return !(ProcessPointer == LastWaveformPointer());
     550:	f990 3000 	ldrsb.w	r3, [r0]
     554:	4a08      	ldr	r2, [pc, #32]	; (578 <SensorNode::NeedsPulseHandling()+0x28>)
     556:	f990 0001 	ldrsb.w	r0, [r0, #1]
     55a:	3b01      	subs	r3, #1
     55c:	fb82 2103 	smull	r2, r1, r2, r3
     560:	17da      	asrs	r2, r3, #31
     562:	ebc2 02a1 	rsb	r2, r2, r1, asr #2
     566:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     56a:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     56e:	b25b      	sxtb	r3, r3
}
     570:	1ac0      	subs	r0, r0, r3
     572:	bf18      	it	ne
     574:	2001      	movne	r0, #1
     576:	4770      	bx	lr
     578:	66666667 	.word	0x66666667

0000057c <SensorNode::Init()>:

int8_t SensorNode::ProcessPointerOffset(int8_t Offset) {
    return (ProcessPointer + Offset) % WAVEFORM_SIZE;
}

void SensorNode::Init() {
     57c:	b538      	push	{r3, r4, r5, lr}
     57e:	4604      	mov	r4, r0
	size_t print(int n)				{ return print((long)n); }
     580:	4d2b      	ldr	r5, [pc, #172]	; (630 <SensorNode::Init()+0xb4>)
     582:	482c      	ldr	r0, [pc, #176]	; (634 <SensorNode::Init()+0xb8>)
     584:	210e      	movs	r1, #14
     586:	f001 ffa7 	bl	24d8 <usb_serial_write>
     58a:	f8d4 10e8 	ldr.w	r1, [r4, #232]	; 0xe8
     58e:	4628      	mov	r0, r5
     590:	f000 fb74 	bl	c7c <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
     594:	f894 00e8 	ldrb.w	r0, [r4, #232]	; 0xe8
     598:	2100      	movs	r1, #0
     59a:	f000 ffb1 	bl	1500 <pinMode>
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
     59e:	f894 00ec 	ldrb.w	r0, [r4, #236]	; 0xec
     5a2:	2100      	movs	r1, #0
     5a4:	f000 ffac 	bl	1500 <pinMode>
    pinMode(_PinData.LED2Pin, INPUT);
     5a8:	f894 00f0 	ldrb.w	r0, [r4, #240]	; 0xf0
     5ac:	2100      	movs	r1, #0
     5ae:	f000 ffa7 	bl	1500 <pinMode>
    WaveformPointer = 1;
    ProcessPointer = 0;
     5b2:	2300      	movs	r3, #0
    Angles[STATION_A][HORZ] = 0;
     5b4:	2200      	movs	r2, #0
    WaveformPointer = 1;
     5b6:	2101      	movs	r1, #1
     5b8:	7021      	strb	r1, [r4, #0]
    ProcessPointer = 0;
     5ba:	7063      	strb	r3, [r4, #1]
    Angles[STATION_A][VERT] = 0;
    Angles[STATION_B][HORZ] = 0;
    Angles[STATION_B][VERT] = 0;
    for (int i = 0; i < WAVEFORM_SIZE; i++) {
        Waveform[i].PulseDurationTicks = 0;
     5bc:	60e3      	str	r3, [r4, #12]
        Waveform[i].RisingEdgeTicks = 0;
     5be:	6063      	str	r3, [r4, #4]
        //Waveform[i].LastPulseToThisPulseTicks = 0;
        Waveform[i].FallingEdgeTicks = 0;
     5c0:	60a3      	str	r3, [r4, #8]
        Waveform[i].PulseDurationTicks = 0;
     5c2:	6223      	str	r3, [r4, #32]
        Waveform[i].RisingEdgeTicks = 0;
     5c4:	61a3      	str	r3, [r4, #24]
        Waveform[i].FallingEdgeTicks = 0;
     5c6:	61e3      	str	r3, [r4, #28]
        Waveform[i].PulseDurationTicks = 0;
     5c8:	6363      	str	r3, [r4, #52]	; 0x34
        Waveform[i].RisingEdgeTicks = 0;
     5ca:	62e3      	str	r3, [r4, #44]	; 0x2c
        Waveform[i].FallingEdgeTicks = 0;
     5cc:	6323      	str	r3, [r4, #48]	; 0x30
        Waveform[i].PulseDurationTicks = 0;
     5ce:	64a3      	str	r3, [r4, #72]	; 0x48
        Waveform[i].RisingEdgeTicks = 0;
     5d0:	6423      	str	r3, [r4, #64]	; 0x40
        Waveform[i].FallingEdgeTicks = 0;
     5d2:	6463      	str	r3, [r4, #68]	; 0x44
        Waveform[i].PulseDurationTicks = 0;
     5d4:	65e3      	str	r3, [r4, #92]	; 0x5c
        Waveform[i].RisingEdgeTicks = 0;
     5d6:	6563      	str	r3, [r4, #84]	; 0x54
        Waveform[i].FallingEdgeTicks = 0;
     5d8:	65a3      	str	r3, [r4, #88]	; 0x58
        Waveform[i].PulseDurationTicks = 0;
     5da:	6723      	str	r3, [r4, #112]	; 0x70
        Waveform[i].RisingEdgeTicks = 0;
     5dc:	66a3      	str	r3, [r4, #104]	; 0x68
        Waveform[i].FallingEdgeTicks = 0;
     5de:	66e3      	str	r3, [r4, #108]	; 0x6c
        Waveform[i].PulseDurationTicks = 0;
     5e0:	f8c4 3084 	str.w	r3, [r4, #132]	; 0x84
        Waveform[i].RisingEdgeTicks = 0;
     5e4:	67e3      	str	r3, [r4, #124]	; 0x7c
        Waveform[i].FallingEdgeTicks = 0;
     5e6:	f8c4 3080 	str.w	r3, [r4, #128]	; 0x80
        Waveform[i].PulseDurationTicks = 0;
     5ea:	f8c4 3098 	str.w	r3, [r4, #152]	; 0x98
        Waveform[i].RisingEdgeTicks = 0;
     5ee:	f8c4 3090 	str.w	r3, [r4, #144]	; 0x90
        Waveform[i].FallingEdgeTicks = 0;
     5f2:	f8c4 3094 	str.w	r3, [r4, #148]	; 0x94
        Waveform[i].PulseDurationTicks = 0;
     5f6:	f8c4 30ac 	str.w	r3, [r4, #172]	; 0xac
        Waveform[i].RisingEdgeTicks = 0;
     5fa:	f8c4 30a4 	str.w	r3, [r4, #164]	; 0xa4
    Angles[STATION_A][HORZ] = 0;
     5fe:	f8c4 20cc 	str.w	r2, [r4, #204]	; 0xcc
    Angles[STATION_A][VERT] = 0;
     602:	f8c4 20d0 	str.w	r2, [r4, #208]	; 0xd0
    Angles[STATION_B][HORZ] = 0;
     606:	f8c4 20d4 	str.w	r2, [r4, #212]	; 0xd4
    Angles[STATION_B][VERT] = 0;
     60a:	f8c4 20d8 	str.w	r2, [r4, #216]	; 0xd8
     60e:	2109      	movs	r1, #9
        Waveform[i].FallingEdgeTicks = 0;
     610:	f8c4 30a8 	str.w	r3, [r4, #168]	; 0xa8
     614:	4808      	ldr	r0, [pc, #32]	; (638 <SensorNode::Init()+0xbc>)
        Waveform[i].PulseDurationTicks = 0;
     616:	f8c4 30c0 	str.w	r3, [r4, #192]	; 0xc0
        Waveform[i].RisingEdgeTicks = 0;
     61a:	f8c4 30b8 	str.w	r3, [r4, #184]	; 0xb8
        Waveform[i].FallingEdgeTicks = 0;
     61e:	f8c4 30bc 	str.w	r3, [r4, #188]	; 0xbc
     622:	f001 ff59 	bl	24d8 <usb_serial_write>
	size_t println(const char s[])			{ return print(s) + println(); }
     626:	4628      	mov	r0, r5
    }
    Serial.println(" Complete");
}
     628:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     62c:	f000 bba0 	b.w	d70 <Print::println()>
     630:	1fff88f0 	.word	0x1fff88f0
     634:	00004828 	.word	0x00004828
     638:	00004838 	.word	0x00004838

0000063c <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     63c:	4770      	bx	lr
     63e:	bf00      	nop

00000640 <SensorNode::GetPulsePin()>:

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}
     640:	f890 00e8 	ldrb.w	r0, [r0, #232]	; 0xe8
     644:	4770      	bx	lr
     646:	bf00      	nop

00000648 <SensorNode::RisingEdge(unsigned long, unsigned int, unsigned int)>:
    (++WaveformPointer) %= WAVEFORM_SIZE;
     648:	7802      	ldrb	r2, [r0, #0]
     64a:	4b0c      	ldr	r3, [pc, #48]	; (67c <SensorNode::RisingEdge(unsigned long, unsigned int, unsigned int)+0x34>)
     64c:	3201      	adds	r2, #1
     64e:	b252      	sxtb	r2, r2

void SensorNode::RisingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall) {
     650:	b410      	push	{r4}
    (++WaveformPointer) %= WAVEFORM_SIZE;
     652:	fb83 4302 	smull	r4, r3, r3, r2
     656:	17d4      	asrs	r4, r2, #31
     658:	ebc4 03a3 	rsb	r3, r4, r3, asr #2
     65c:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     660:	eba2 0343 	sub.w	r3, r2, r3, lsl #1
     664:	b25b      	sxtb	r3, r3

    IncWaveformPointer();
    Waveform[WaveformPointer].Valid = false;
     666:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     66a:	eb00 0282 	add.w	r2, r0, r2, lsl #2
     66e:	2400      	movs	r4, #0
    (++WaveformPointer) %= WAVEFORM_SIZE;
     670:	7003      	strb	r3, [r0, #0]
    Waveform[WaveformPointer].Valid = false;
     672:	7414      	strb	r4, [r2, #16]
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
     674:	6051      	str	r1, [r2, #4]
}
     676:	bc10      	pop	{r4}
     678:	4770      	bx	lr
     67a:	bf00      	nop
     67c:	66666667 	.word	0x66666667

00000680 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)>:

void SensorNode::FallingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall) {
    if (ConseqFall > 1) {
     680:	2b01      	cmp	r3, #1
void SensorNode::FallingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall) {
     682:	b430      	push	{r4, r5}
    if (ConseqFall > 1) {
     684:	d91f      	bls.n	6c6 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)+0x46>
    (++WaveformPointer) %= WAVEFORM_SIZE;
     686:	7803      	ldrb	r3, [r0, #0]
     688:	4a10      	ldr	r2, [pc, #64]	; (6cc <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)+0x4c>)
     68a:	3301      	adds	r3, #1
     68c:	b25b      	sxtb	r3, r3
     68e:	fb82 2403 	smull	r2, r4, r2, r3
     692:	17da      	asrs	r2, r3, #31
     694:	ebc2 02a4 	rsb	r2, r2, r4, asr #2
     698:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     69c:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     6a0:	b25b      	sxtb	r3, r3
    Waveform[WaveformPointer].Valid = false;
     6a2:	eb03 0483 	add.w	r4, r3, r3, lsl #2
     6a6:	eb00 0484 	add.w	r4, r0, r4, lsl #2
     6aa:	2500      	movs	r5, #0
    (++WaveformPointer) %= WAVEFORM_SIZE;
     6ac:	7003      	strb	r3, [r0, #0]
    Waveform[WaveformPointer].Valid = false;
     6ae:	461a      	mov	r2, r3
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
     6b0:	6061      	str	r1, [r4, #4]
    Waveform[WaveformPointer].Valid = false;
     6b2:	7425      	strb	r5, [r4, #16]
        RisingEdge(TimeTicks, ConseqRise, --ConseqFall);
    }
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     6b4:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     6b8:	eb00 0082 	add.w	r0, r0, r2, lsl #2
    Waveform[WaveformPointer].Valid = false;
     6bc:	2300      	movs	r3, #0
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     6be:	6081      	str	r1, [r0, #8]
    Waveform[WaveformPointer].Valid = false;
     6c0:	7403      	strb	r3, [r0, #16]

}
     6c2:	bc30      	pop	{r4, r5}
     6c4:	4770      	bx	lr
     6c6:	f990 2000 	ldrsb.w	r2, [r0]
     6ca:	e7f3      	b.n	6b4 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)+0x34>
     6cc:	66666667 	.word	0x66666667

000006d0 <SensorNode::PulseHandler()>:

Pulse *SensorNode::PulseHandler() {
     6d0:	b4f0      	push	{r4, r5, r6, r7}
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     6d2:	f990 3001 	ldrsb.w	r3, [r0, #1]
     6d6:	eb03 0183 	add.w	r1, r3, r3, lsl #2
     6da:	eb00 0181 	add.w	r1, r0, r1, lsl #2
     6de:	009e      	lsls	r6, r3, #2
    if (LatestPulse->RisingEdgeTicks >=
     6e0:	684f      	ldr	r7, [r1, #4]
     6e2:	688d      	ldr	r5, [r1, #8]
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     6e4:	18f2      	adds	r2, r6, r3
     6e6:	eb00 0282 	add.w	r2, r0, r2, lsl #2
    if (LatestPulse->RisingEdgeTicks >=
     6ea:	42af      	cmp	r7, r5
Pulse *SensorNode::PulseHandler() {
     6ec:	4604      	mov	r4, r0
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     6ee:	f102 0004 	add.w	r0, r2, #4
    if (LatestPulse->RisingEdgeTicks >=
     6f2:	d22c      	bcs.n	74e <SensorNode::PulseHandler()+0x7e>
        LatestPulse->IsUncertainShortPulse = true;
        LatestPulse->IsCertainSweepPulse = false;
        LatestPulse->IsCertainSyncPulse = false;
    }
    else {
        LatestPulse->IsUncertainShortPulse = false;
     6f4:	2500      	movs	r5, #0
     6f6:	74d5      	strb	r5, [r2, #19]
        LatestPulse->PulseDurationTicks =
                LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     6f8:	688d      	ldr	r5, [r1, #8]
     6fa:	6849      	ldr	r1, [r1, #4]
     6fc:	1a69      	subs	r1, r5, r1
        LatestPulse->IsCertainSyncPulse = (bool) IN_RANGE(FLASH_PULSE_LENGTH_TICKS_MIN,
                                                          LatestPulse->PulseDurationTicks,
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
        LatestPulse->IsCertainSweepPulse = (bool) IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,
                                                           LatestPulse->PulseDurationTicks,
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
     6fe:	f1a1 073c 	sub.w	r7, r1, #60	; 0x3c
     702:	f5b7 7f52 	cmp.w	r7, #840	; 0x348
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     706:	f6a1 35b8 	subw	r5, r1, #3000	; 0xbb8
                LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     70a:	60d1      	str	r1, [r2, #12]
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     70c:	f241 7170 	movw	r1, #6000	; 0x1770
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
     710:	bf8c      	ite	hi
     712:	2700      	movhi	r7, #0
     714:	2701      	movls	r7, #1
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     716:	428d      	cmp	r5, r1
     718:	bf8c      	ite	hi
     71a:	2100      	movhi	r1, #0
     71c:	2101      	movls	r1, #1
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
     71e:	7497      	strb	r7, [r2, #18]
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     720:	7451      	strb	r1, [r2, #17]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     722:	1c5a      	adds	r2, r3, #1
     724:	490d      	ldr	r1, [pc, #52]	; (75c <SensorNode::PulseHandler()+0x8c>)
     726:	b252      	sxtb	r2, r2
     728:	fb81 1502 	smull	r1, r5, r1, r2
     72c:	17d1      	asrs	r1, r2, #31
    }
    LatestPulse->Valid = true;
     72e:	4433      	add	r3, r6
    (++ProcessPointer) %= WAVEFORM_SIZE;
     730:	ebc1 01a5 	rsb	r1, r1, r5, asr #2
    LatestPulse->Valid = true;
     734:	eb04 0383 	add.w	r3, r4, r3, lsl #2
    (++ProcessPointer) %= WAVEFORM_SIZE;
     738:	eb01 0181 	add.w	r1, r1, r1, lsl #2
    LatestPulse->Valid = true;
     73c:	2601      	movs	r6, #1
    LatestPulse->ReadOut = false;
     73e:	2500      	movs	r5, #0
    (++ProcessPointer) %= WAVEFORM_SIZE;
     740:	eba2 0241 	sub.w	r2, r2, r1, lsl #1
    LatestPulse->Valid = true;
     744:	741e      	strb	r6, [r3, #16]
    LatestPulse->ReadOut = false;
     746:	751d      	strb	r5, [r3, #20]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     748:	7062      	strb	r2, [r4, #1]
    IncProcessPointer();
    return LatestPulse;
}
     74a:	bcf0      	pop	{r4, r5, r6, r7}
     74c:	4770      	bx	lr
        LatestPulse->PulseDurationTicks = 0;
     74e:	2100      	movs	r1, #0
        LatestPulse->IsUncertainShortPulse = true;
     750:	2501      	movs	r5, #1
        LatestPulse->PulseDurationTicks = 0;
     752:	60d1      	str	r1, [r2, #12]
        LatestPulse->IsCertainSweepPulse = false;
     754:	7491      	strb	r1, [r2, #18]
        LatestPulse->IsCertainSyncPulse = false;
     756:	7451      	strb	r1, [r2, #17]
        LatestPulse->IsUncertainShortPulse = true;
     758:	74d5      	strb	r5, [r2, #19]
     75a:	e7e2      	b.n	722 <SensorNode::PulseHandler()+0x52>
     75c:	66666667 	.word	0x66666667

00000760 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)>:
u_int32_t PulseAge(Pulse &TestPulse) {
    return CURRENT_TIME - TestPulse.RisingEdgeTicks;
}

bool SensorNode::CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                                     u_int8_t CurrentStationLock) {
     760:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     764:	f990 5001 	ldrsb.w	r5, [r0, #1]
                                     u_int8_t CurrentStationLock) {
     768:	f89d e020 	ldrb.w	lr, [sp, #32]
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     76c:	2d00      	cmp	r5, #0
     76e:	d06f      	beq.n	850 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xf0>
     770:	4c3a      	ldr	r4, [pc, #232]	; (85c <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xfc>)
     772:	3d01      	subs	r5, #1
     774:	fb84 6405 	smull	r6, r4, r4, r5
     778:	17ee      	asrs	r6, r5, #31
     77a:	ebc6 04a4 	rsb	r4, r6, r4, asr #2
     77e:	eb04 0484 	add.w	r4, r4, r4, lsl #2
     782:	eba5 0444 	sub.w	r4, r5, r4, lsl #1
    Pulse *LastPulse = &Waveform[LastProcessPointer()];
    if (LastPulse->Valid and not LastPulse->ReadOut) { //Is this pulse new, and valid?
     786:	ea4f 0c84 	mov.w	ip, r4, lsl #2
     78a:	eb0c 0504 	add.w	r5, ip, r4
     78e:	eb00 0585 	add.w	r5, r0, r5, lsl #2
     792:	7c2e      	ldrb	r6, [r5, #16]
     794:	2e00      	cmp	r6, #0
     796:	d056      	beq.n	846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
     798:	f895 9014 	ldrb.w	r9, [r5, #20]
     79c:	f1b9 0f00 	cmp.w	r9, #0
     7a0:	d151      	bne.n	846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
        if (LastPulse->IsCertainSweepPulse and CurrentStationLock ==
     7a2:	f895 a012 	ldrb.w	sl, [r5, #18]
     7a6:	4617      	mov	r7, r2
     7a8:	4688      	mov	r8, r1
     7aa:	4606      	mov	r6, r0
     7ac:	f1ba 0f00 	cmp.w	sl, #0
     7b0:	d01e      	beq.n	7f0 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x90>
     7b2:	f1be 0f02 	cmp.w	lr, #2
     7b6:	d11b      	bne.n	7f0 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x90>
                                               DUAL_STATION_LOCK) { // Are we certain its a sweep pulse? And do we have a certain dual lock.
            LastPulse->ReadOut = true;
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     7b8:	6868      	ldr	r0, [r5, #4]
            LastPulse->ReadOut = true;
     7ba:	2201      	movs	r2, #1
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     7bc:	1ac0      	subs	r0, r0, r3
            LastPulse->ReadOut = true;
     7be:	752a      	strb	r2, [r5, #20]
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     7c0:	f003 f956 	bl	3a70 <__aeabi_ui2f>
     7c4:	4926      	ldr	r1, [pc, #152]	; (860 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x100>)
     7c6:	f003 f9ab 	bl	3b20 <__aeabi_fmul>
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     7ca:	2100      	movs	r1, #0
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     7cc:	4604      	mov	r4, r0
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     7ce:	f003 fb59 	bl	3e84 <__aeabi_fcmpge>
     7d2:	2800      	cmp	r0, #0
     7d4:	d037      	beq.n	846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
     7d6:	4923      	ldr	r1, [pc, #140]	; (864 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x104>)
     7d8:	4620      	mov	r0, r4
     7da:	f003 fb49 	bl	3e70 <__aeabi_fcmple>
     7de:	b390      	cbz	r0, 846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
                Angles[SweepSource][SweepAxis] = NewAngle;
     7e0:	eb07 0748 	add.w	r7, r7, r8, lsl #1
     7e4:	eb06 0087 	add.w	r0, r6, r7, lsl #2
                return true;
     7e8:	46d1      	mov	r9, sl
                Angles[SweepSource][SweepAxis] = NewAngle;
     7ea:	f8c0 40cc 	str.w	r4, [r0, #204]	; 0xcc
     7ee:	e02c      	b.n	84a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xea>
//            Serial.print("Certain Sweep-");
//            Serial.print(SweepSource);
//            Serial.print(" - ");
//            Serial.println(SweepAxis);
        }
        else if (LastPulse->IsUncertainShortPulse) { //We are not certain its a sweep, but its too short to accurately measure its width... Might be noise, might be a sweep.
     7f0:	4464      	add	r4, ip
     7f2:	eb06 0484 	add.w	r4, r6, r4, lsl #2
     7f6:	7ce2      	ldrb	r2, [r4, #19]
     7f8:	b32a      	cbz	r2, 846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
            LastPulse->ReadOut = true;
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     7fa:	6860      	ldr	r0, [r4, #4]
            LastPulse->ReadOut = true;
     7fc:	2201      	movs	r2, #1
     7fe:	7522      	strb	r2, [r4, #20]
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     800:	1ac0      	subs	r0, r0, r3
     802:	f003 f935 	bl	3a70 <__aeabi_ui2f>
     806:	4916      	ldr	r1, [pc, #88]	; (860 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x100>)
     808:	f003 f98a 	bl	3b20 <__aeabi_fmul>
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     80c:	2100      	movs	r1, #0
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     80e:	4604      	mov	r4, r0
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     810:	f003 fb38 	bl	3e84 <__aeabi_fcmpge>
     814:	b1b8      	cbz	r0, 846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
     816:	4913      	ldr	r1, [pc, #76]	; (864 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x104>)
     818:	4620      	mov	r0, r4
     81a:	f003 fb29 	bl	3e70 <__aeabi_fcmple>
     81e:	b190      	cbz	r0, 846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
     820:	eb07 0748 	add.w	r7, r7, r8, lsl #1
     824:	eb06 0687 	add.w	r6, r6, r7, lsl #2
                if (IN_RANGE(DEGREES_TO_RADIANS(-UNCERTAIN_ANGLE_THRESHOLD), NewAngle - Angles[SweepSource][SweepAxis],
     828:	4620      	mov	r0, r4
     82a:	f8d6 10cc 	ldr.w	r1, [r6, #204]	; 0xcc
     82e:	f003 f86d 	bl	390c <__aeabi_fsub>
     832:	490d      	ldr	r1, [pc, #52]	; (868 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x108>)
     834:	4605      	mov	r5, r0
     836:	f003 fb25 	bl	3e84 <__aeabi_fcmpge>
     83a:	b120      	cbz	r0, 846 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xe6>
                             DEGREES_TO_RADIANS(UNCERTAIN_ANGLE_THRESHOLD))) {
     83c:	4628      	mov	r0, r5
     83e:	490b      	ldr	r1, [pc, #44]	; (86c <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x10c>)
     840:	f003 fb16 	bl	3e70 <__aeabi_fcmple>
     844:	b930      	cbnz	r0, 854 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xf4>
                //
                //return true;
            }
        }
    }
    return false;
     846:	f04f 0900 	mov.w	r9, #0
     84a:	4648      	mov	r0, r9
     84c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     850:	2409      	movs	r4, #9
     852:	e798      	b.n	786 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x26>
                    Angles[SweepSource][SweepAxis] = NewAngle;
     854:	f8c6 40cc 	str.w	r4, [r6, #204]	; 0xcc
     858:	e7f7      	b.n	84a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xea>
     85a:	bf00      	nop
     85c:	66666667 	.word	0x66666667
     860:	371e232a 	.word	0x371e232a
     864:	40c90fdb 	.word	0x40c90fdb
     868:	be32b8c2 	.word	0xbe32b8c2
     86c:	3e32b8c2 	.word	0x3e32b8c2

00000870 <InitTimer()>:
#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {
     870:	b4f0      	push	{r4, r5, r6, r7}

    SIM_SCGC6 |= SIM_SCGC6_PIT;
     872:	4a08      	ldr	r2, [pc, #32]	; (894 <InitTimer()+0x24>)
    PIT_LDVAL0 = UINT32_MAX;
     874:	4e08      	ldr	r6, [pc, #32]	; (898 <InitTimer()+0x28>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     876:	6813      	ldr	r3, [r2, #0]
    PIT_MCR = 0;
     878:	4c08      	ldr	r4, [pc, #32]	; (89c <InitTimer()+0x2c>)
    PIT_TCTRL0 = 1;
     87a:	4909      	ldr	r1, [pc, #36]	; (8a0 <InitTimer()+0x30>)
    PIT_LDVAL0 = UINT32_MAX;
     87c:	f04f 37ff 	mov.w	r7, #4294967295
    PIT_MCR = 0;
     880:	2500      	movs	r5, #0
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     882:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
    PIT_TCTRL0 = 1;
     886:	2001      	movs	r0, #1
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     888:	6013      	str	r3, [r2, #0]
    PIT_LDVAL0 = UINT32_MAX;
     88a:	6037      	str	r7, [r6, #0]
    PIT_MCR = 0;
     88c:	6025      	str	r5, [r4, #0]
    PIT_TCTRL0 = 1;
     88e:	6008      	str	r0, [r1, #0]

}
     890:	bcf0      	pop	{r4, r5, r6, r7}
     892:	4770      	bx	lr
     894:	4004803c 	.word	0x4004803c
     898:	40037100 	.word	0x40037100
     89c:	40037000 	.word	0x40037000
     8a0:	40037108 	.word	0x40037108

000008a4 <Interrupt0Change()>:
ConsecRise = 0;\
}\
}


void Interrupt0Change() { INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PINS.PulsePin, 0);
     8a4:	4a13      	ldr	r2, [pc, #76]	; (8f4 <Interrupt0Change()+0x50>)
     8a6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
		  else {
			return 0;
		}
	} else {
		#if defined(KINETISK)
		return *portInputRegister(pin);
     8a8:	7811      	ldrb	r1, [r2, #0]
     8aa:	4b13      	ldr	r3, [pc, #76]	; (8f8 <Interrupt0Change()+0x54>)
     8ac:	4a13      	ldr	r2, [pc, #76]	; (8fc <Interrupt0Change()+0x58>)
     8ae:	f853 3031 	ldr.w	r3, [r3, r1, lsl #3]
     8b2:	6811      	ldr	r1, [r2, #0]
     8b4:	f893 3200 	ldrb.w	r3, [r3, #512]	; 0x200
     8b8:	43c9      	mvns	r1, r1
     8ba:	b96b      	cbnz	r3, 8d8 <Interrupt0Change()+0x34>
     8bc:	4e10      	ldr	r6, [pc, #64]	; (900 <Interrupt0Change()+0x5c>)
     8be:	4d11      	ldr	r5, [pc, #68]	; (904 <Interrupt0Change()+0x60>)
     8c0:	6834      	ldr	r4, [r6, #0]
     8c2:	682a      	ldr	r2, [r5, #0]
     8c4:	4810      	ldr	r0, [pc, #64]	; (908 <Interrupt0Change()+0x64>)
     8c6:	3401      	adds	r4, #1
     8c8:	f003 07ff 	and.w	r7, r3, #255	; 0xff
     8cc:	4623      	mov	r3, r4
     8ce:	6034      	str	r4, [r6, #0]
     8d0:	f7ff fed6 	bl	680 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)>
     8d4:	602f      	str	r7, [r5, #0]
     8d6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     8d8:	4e0a      	ldr	r6, [pc, #40]	; (904 <Interrupt0Change()+0x60>)
     8da:	4d09      	ldr	r5, [pc, #36]	; (900 <Interrupt0Change()+0x5c>)
     8dc:	6834      	ldr	r4, [r6, #0]
     8de:	682b      	ldr	r3, [r5, #0]
     8e0:	4809      	ldr	r0, [pc, #36]	; (908 <Interrupt0Change()+0x64>)
     8e2:	3401      	adds	r4, #1
     8e4:	4622      	mov	r2, r4
     8e6:	6034      	str	r4, [r6, #0]
     8e8:	f7ff feae 	bl	648 <SensorNode::RisingEdge(unsigned long, unsigned int, unsigned int)>
     8ec:	2300      	movs	r3, #0
     8ee:	602b      	str	r3, [r5, #0]
     8f0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     8f2:	bf00      	nop
     8f4:	1fff8800 	.word	0x1fff8800
     8f8:	00004874 	.word	0x00004874
     8fc:	40037104 	.word	0x40037104
     900:	1fff92a8 	.word	0x1fff92a8
     904:	1fff93b4 	.word	0x1fff93b4
     908:	1fff92bc 	.word	0x1fff92bc

0000090c <__tcf_1>:
SensorNode Nodes[] = {SENSOR_1_PINS};
     90c:	4801      	ldr	r0, [pc, #4]	; (914 <__tcf_1+0x8>)
     90e:	f7ff be95 	b.w	63c <SensorNode::~SensorNode()>
     912:	bf00      	nop
     914:	1fff92bc 	.word	0x1fff92bc

00000918 <__tcf_0>:
BaseOOTX OOTX[2] = {STATION_A,STATION_B};
     918:	b510      	push	{r4, lr}
     91a:	4c05      	ldr	r4, [pc, #20]	; (930 <__tcf_0+0x18>)
     91c:	f104 004c 	add.w	r0, r4, #76	; 0x4c
     920:	f7ff fdb0 	bl	484 <BaseOOTX::~BaseOOTX()>
     924:	4620      	mov	r0, r4
     926:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     92a:	f7ff bdab 	b.w	484 <BaseOOTX::~BaseOOTX()>
     92e:	bf00      	nop
     930:	1fff920c 	.word	0x1fff920c

00000934 <MainSetup()>:
}

//char (*__kaboom)[sizeof(float16_t)] = 1;


void MainSetup() {
     934:	b510      	push	{r4, lr}
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
     936:	2101      	movs	r1, #1
     938:	200d      	movs	r0, #13
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
     93a:	4c12      	ldr	r4, [pc, #72]	; (984 <MainSetup()+0x50>)
    pinMode(LED_BUILTIN, OUTPUT);
     93c:	f000 fde0 	bl	1500 <pinMode>
    delay(2000);
     940:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     944:	f000 fe18 	bl	1578 <delay>
        Nodes[i].Init();
     948:	4620      	mov	r0, r4
     94a:	f7ff fe17 	bl	57c <SensorNode::Init()>
    }
    delay(100);
     94e:	2064      	movs	r0, #100	; 0x64
     950:	f000 fe12 	bl	1578 <delay>

    InitTimer(); //Start up better timer (If using)
     954:	f7ff ff8c 	bl	870 <InitTimer()>
     958:	2112      	movs	r1, #18
     95a:	480b      	ldr	r0, [pc, #44]	; (988 <MainSetup()+0x54>)
     95c:	f001 fdbc 	bl	24d8 <usb_serial_write>
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
     960:	4620      	mov	r0, r4
     962:	f7ff fe6d 	bl	640 <SensorNode::GetPulsePin()>
     966:	2204      	movs	r2, #4
     968:	4908      	ldr	r1, [pc, #32]	; (98c <MainSetup()+0x58>)
     96a:	f000 fc43 	bl	11f4 <attachInterrupt>
     96e:	2108      	movs	r1, #8
     970:	4807      	ldr	r0, [pc, #28]	; (990 <MainSetup()+0x5c>)
     972:	f001 fdb1 	bl	24d8 <usb_serial_write>
     976:	4807      	ldr	r0, [pc, #28]	; (994 <MainSetup()+0x60>)
     978:	f000 f9fa 	bl	d70 <Print::println()>
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     97c:	4b06      	ldr	r3, [pc, #24]	; (998 <MainSetup()+0x64>)
     97e:	2220      	movs	r2, #32
     980:	601a      	str	r2, [r3, #0]
     982:	bd10      	pop	{r4, pc}
     984:	1fff92bc 	.word	0x1fff92bc
     988:	00004844 	.word	0x00004844
     98c:	000008a5 	.word	0x000008a5
     990:	00004858 	.word	0x00004858
     994:	1fff88f0 	.word	0x1fff88f0
     998:	400ff084 	.word	0x400ff084

0000099c <MainLoop()>:
    ConfigureInterrupts(); // Set up Channel Interrupts
    digitalWriteFast(LED_BUILTIN, HIGH);
}


void MainLoop() {
     99c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    static u_int8_t CurrentStationLock = NO_STATION_LOCK;
    static bool LastOOTXBit = 0;

    Pulse *EarliestSyncDetectedSource = NULL;
    u_int32_t EarlyTrack = 0;
    u_int32_t BaseTime = CURRENT_TIME;
     9a0:	4b7e      	ldr	r3, [pc, #504]	; (b9c <MainLoop()+0x200>)
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { //Look through all nodes
        if (Nodes[i].NeedsPulseHandling()) { //Perform pulse calc pump only if needed
     9a2:	487f      	ldr	r0, [pc, #508]	; (ba0 <MainLoop()+0x204>)
    u_int32_t BaseTime = CURRENT_TIME;
     9a4:	681b      	ldr	r3, [r3, #0]
void MainLoop() {
     9a6:	b087      	sub	sp, #28
    u_int32_t BaseTime = CURRENT_TIME;
     9a8:	43dc      	mvns	r4, r3
        if (Nodes[i].NeedsPulseHandling()) { //Perform pulse calc pump only if needed
     9aa:	f7ff fdd1 	bl	550 <SensorNode::NeedsPulseHandling()>
     9ae:	2800      	cmp	r0, #0
     9b0:	d174      	bne.n	a9c <MainLoop()+0x100>
        }
        //

    }
    else { //EarlyDetectionSource == NULL
        if (BaseTime - LastSyncPulseTime >
     9b2:	4b7c      	ldr	r3, [pc, #496]	; (ba4 <MainLoop()+0x208>)
     9b4:	4a7c      	ldr	r2, [pc, #496]	; (ba8 <MainLoop()+0x20c>)
     9b6:	681b      	ldr	r3, [r3, #0]
     9b8:	1ae3      	subs	r3, r4, r3
     9ba:	4293      	cmp	r3, r2
     9bc:	f200 80b8 	bhi.w	b30 <MainLoop()+0x194>
     9c0:	4d7a      	ldr	r5, [pc, #488]	; (bac <MainLoop()+0x210>)
     9c2:	497b      	ldr	r1, [pc, #492]	; (bb0 <MainLoop()+0x214>)
     9c4:	4a7b      	ldr	r2, [pc, #492]	; (bb4 <MainLoop()+0x218>)
     9c6:	4b7c      	ldr	r3, [pc, #496]	; (bb8 <MainLoop()+0x21c>)
     9c8:	7828      	ldrb	r0, [r5, #0]
     9ca:	7809      	ldrb	r1, [r1, #0]
     9cc:	7812      	ldrb	r2, [r2, #0]
     9ce:	681b      	ldr	r3, [r3, #0]
        }
    }


    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(NextSweepSource, NextSweepAxis, SweepSyncStartTime, CurrentStationLock);
     9d0:	4c73      	ldr	r4, [pc, #460]	; (ba0 <MainLoop()+0x204>)
     9d2:	9000      	str	r0, [sp, #0]
     9d4:	4620      	mov	r0, r4
     9d6:	f7ff fec3 	bl	760 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)>
	// do not remove this "redundant" code without
	// carefully verifying the case mentioned here:
	//
	// https://forum.pjrc.com/threads/17469-millis%28%29-on-teensy-3?p=104924&viewfull=1#post104924
	//
	volatile uint32_t ret = systick_millis_count; // single aligned 32 bit is atomic
     9da:	4978      	ldr	r1, [pc, #480]	; (bbc <MainLoop()+0x220>)
    }

    static unsigned long t = 0;
    if (millis() - t > 100) {
     9dc:	4a78      	ldr	r2, [pc, #480]	; (bc0 <MainLoop()+0x224>)
     9de:	680b      	ldr	r3, [r1, #0]
     9e0:	9304      	str	r3, [sp, #16]
	return ret;
     9e2:	9b04      	ldr	r3, [sp, #16]
     9e4:	6810      	ldr	r0, [r2, #0]
     9e6:	1a1b      	subs	r3, r3, r0
     9e8:	2b64      	cmp	r3, #100	; 0x64
     9ea:	d802      	bhi.n	9f2 <MainLoop()+0x56>
//                Serial.print(NextSweepAxis);




}
     9ec:	b007      	add	sp, #28
     9ee:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	volatile uint32_t ret = systick_millis_count; // single aligned 32 bit is atomic
     9f2:	680b      	ldr	r3, [r1, #0]
     9f4:	9305      	str	r3, [sp, #20]
	return ret;
     9f6:	9b05      	ldr	r3, [sp, #20]
	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
     9f8:	7829      	ldrb	r1, [r5, #0]
        t = millis();
     9fa:	6013      	str	r3, [r2, #0]
     9fc:	4871      	ldr	r0, [pc, #452]	; (bc4 <MainLoop()+0x228>)
     9fe:	2300      	movs	r3, #0
     a00:	220a      	movs	r2, #10
     a02:	f000 f9d7 	bl	db4 <Print::printNumber(unsigned long, unsigned char, unsigned char)>
     a06:	2105      	movs	r1, #5
     a08:	486f      	ldr	r0, [pc, #444]	; (bc8 <MainLoop()+0x22c>)
     a0a:	f001 fd65 	bl	24d8 <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
     a0e:	f8d4 00cc 	ldr.w	r0, [r4, #204]	; 0xcc
     a12:	496e      	ldr	r1, [pc, #440]	; (bcc <MainLoop()+0x230>)
     a14:	f003 f884 	bl	3b20 <__aeabi_fmul>
     a18:	f002 fc66 	bl	32e8 <__aeabi_f2d>
     a1c:	2502      	movs	r5, #2
     a1e:	4602      	mov	r2, r0
     a20:	460b      	mov	r3, r1
     a22:	9500      	str	r5, [sp, #0]
     a24:	4867      	ldr	r0, [pc, #412]	; (bc4 <MainLoop()+0x228>)
     a26:	f000 fa23 	bl	e70 <Print::printFloat(double, unsigned char)>
     a2a:	2101      	movs	r1, #1
     a2c:	4868      	ldr	r0, [pc, #416]	; (bd0 <MainLoop()+0x234>)
     a2e:	f001 fd53 	bl	24d8 <usb_serial_write>
     a32:	f8d4 00d0 	ldr.w	r0, [r4, #208]	; 0xd0
     a36:	4965      	ldr	r1, [pc, #404]	; (bcc <MainLoop()+0x230>)
     a38:	f003 f872 	bl	3b20 <__aeabi_fmul>
     a3c:	f002 fc54 	bl	32e8 <__aeabi_f2d>
     a40:	9500      	str	r5, [sp, #0]
     a42:	4602      	mov	r2, r0
     a44:	460b      	mov	r3, r1
     a46:	485f      	ldr	r0, [pc, #380]	; (bc4 <MainLoop()+0x228>)
     a48:	f000 fa12 	bl	e70 <Print::printFloat(double, unsigned char)>
     a4c:	2101      	movs	r1, #1
     a4e:	4860      	ldr	r0, [pc, #384]	; (bd0 <MainLoop()+0x234>)
     a50:	f001 fd42 	bl	24d8 <usb_serial_write>
     a54:	f8d4 00d4 	ldr.w	r0, [r4, #212]	; 0xd4
     a58:	495c      	ldr	r1, [pc, #368]	; (bcc <MainLoop()+0x230>)
     a5a:	f003 f861 	bl	3b20 <__aeabi_fmul>
     a5e:	f002 fc43 	bl	32e8 <__aeabi_f2d>
     a62:	9500      	str	r5, [sp, #0]
     a64:	4602      	mov	r2, r0
     a66:	460b      	mov	r3, r1
     a68:	4856      	ldr	r0, [pc, #344]	; (bc4 <MainLoop()+0x228>)
     a6a:	f000 fa01 	bl	e70 <Print::printFloat(double, unsigned char)>
     a6e:	2101      	movs	r1, #1
     a70:	4857      	ldr	r0, [pc, #348]	; (bd0 <MainLoop()+0x234>)
     a72:	f001 fd31 	bl	24d8 <usb_serial_write>
     a76:	f8d4 00d8 	ldr.w	r0, [r4, #216]	; 0xd8
     a7a:	4954      	ldr	r1, [pc, #336]	; (bcc <MainLoop()+0x230>)
     a7c:	f003 f850 	bl	3b20 <__aeabi_fmul>
     a80:	f002 fc32 	bl	32e8 <__aeabi_f2d>
     a84:	9500      	str	r5, [sp, #0]
     a86:	4602      	mov	r2, r0
     a88:	460b      	mov	r3, r1
     a8a:	484e      	ldr	r0, [pc, #312]	; (bc4 <MainLoop()+0x228>)
     a8c:	f000 f9f0 	bl	e70 <Print::printFloat(double, unsigned char)>
	size_t println(int n, int base)			{ return print(n, base) + println(); }
	size_t println(unsigned int n, int base)	{ return print(n, base) + println(); }
	size_t println(long n, int base)		{ return print(n, base) + println(); }
	size_t println(unsigned long n, int base)	{ return print(n, base) + println(); }

	size_t println(double n, int digits = 2)	{ return print(n, digits) + println(); }
     a90:	484c      	ldr	r0, [pc, #304]	; (bc4 <MainLoop()+0x228>)
     a92:	f000 f96d 	bl	d70 <Print::println()>
}
     a96:	b007      	add	sp, #28
     a98:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
            Pulse *NewPulse = Nodes[i].PulseHandler(); //Update the oldest, non updated pulse
     a9c:	4840      	ldr	r0, [pc, #256]	; (ba0 <MainLoop()+0x204>)
     a9e:	f7ff fe17 	bl	6d0 <SensorNode::PulseHandler()>
            if (NewPulse->IsCertainSyncPulse and not NewPulse->ReadOut) { //Is that pulse a new sync pulse?
     aa2:	7b43      	ldrb	r3, [r0, #13]
            Pulse *NewPulse = Nodes[i].PulseHandler(); //Update the oldest, non updated pulse
     aa4:	4682      	mov	sl, r0
            if (NewPulse->IsCertainSyncPulse and not NewPulse->ReadOut) { //Is that pulse a new sync pulse?
     aa6:	2b00      	cmp	r3, #0
     aa8:	d083      	beq.n	9b2 <MainLoop()+0x16>
     aaa:	7c00      	ldrb	r0, [r0, #16]
     aac:	2800      	cmp	r0, #0
     aae:	d180      	bne.n	9b2 <MainLoop()+0x16>
                if (BaseTime - NewPulse->RisingEdgeTicks >
     ab0:	f8da 3000 	ldr.w	r3, [sl]
     ab4:	429c      	cmp	r4, r3
     ab6:	d06c      	beq.n	b92 <MainLoop()+0x1f6>
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     ab8:	4e3a      	ldr	r6, [pc, #232]	; (ba4 <MainLoop()+0x208>)
     aba:	6831      	ldr	r1, [r6, #0]
     abc:	1a59      	subs	r1, r3, r1
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
     abe:	f04f 0b01 	mov.w	fp, #1
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     ac2:	f5b1 6f96 	cmp.w	r1, #1200	; 0x4b0
     ac6:	469e      	mov	lr, r3
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
     ac8:	f88a b010 	strb.w	fp, [sl, #16]
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     acc:	f67f af78 	bls.w	9c0 <MainLoop()+0x24>
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     ad0:	f8da 3008 	ldr.w	r3, [sl, #8]
     ad4:	4c3f      	ldr	r4, [pc, #252]	; (bd4 <MainLoop()+0x238>)
     ad6:	4a40      	ldr	r2, [pc, #256]	; (bd8 <MainLoop()+0x23c>)
     ad8:	eb03 0343 	add.w	r3, r3, r3, lsl #1
     adc:	011b      	lsls	r3, r3, #4
     ade:	fba4 4303 	umull	r4, r3, r4, r3
     ae2:	095b      	lsrs	r3, r3, #5
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     ae4:	f5a1 41b2 	sub.w	r1, r1, #22784	; 0x5900
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     ae8:	f6a3 13c5 	subw	r3, r3, #2501	; 0x9c5
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     aec:	3910      	subs	r1, #16
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     aee:	fba2 3203 	umull	r3, r2, r2, r3
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     af2:	f5b1 6f16 	cmp.w	r1, #2400	; 0x960
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     af6:	ea4f 1452 	mov.w	r4, r2, lsr #5
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     afa:	d923      	bls.n	b44 <MainLoop()+0x1a8>
     afc:	4f37      	ldr	r7, [pc, #220]	; (bdc <MainLoop()+0x240>)
     afe:	4683      	mov	fp, r0
                CurrentStationLock = SINGLE_STATION_LOCK; //Not sure which station though.
     b00:	4d2a      	ldr	r5, [pc, #168]	; (bac <MainLoop()+0x210>)
     b02:	f8df 80e4 	ldr.w	r8, [pc, #228]	; be8 <MainLoop()+0x24c>
     b06:	2201      	movs	r2, #1
     b08:	b2e3      	uxtb	r3, r4
     b0a:	702a      	strb	r2, [r5, #0]
     b0c:	f3c3 0940 	ubfx	r9, r3, #1, #1
            if (!SKIP(SyncPulseMeaning)) { //Is the station this sync concerns laser sweeping this time?
     b10:	075b      	lsls	r3, r3, #29
     b12:	d531      	bpl.n	b78 <MainLoop()+0x1dc>
     b14:	4926      	ldr	r1, [pc, #152]	; (bb0 <MainLoop()+0x214>)
     b16:	4a27      	ldr	r2, [pc, #156]	; (bb4 <MainLoop()+0x218>)
     b18:	4b27      	ldr	r3, [pc, #156]	; (bb8 <MainLoop()+0x21c>)
     b1a:	7809      	ldrb	r1, [r1, #0]
     b1c:	7812      	ldrb	r2, [r2, #0]
     b1e:	681b      	ldr	r3, [r3, #0]
     b20:	7828      	ldrb	r0, [r5, #0]
            LastSyncSource = SourceStation;
     b22:	f887 b000 	strb.w	fp, [r7]
            LastOOTXBit = DATA(SyncPulseMeaning);
     b26:	f888 9000 	strb.w	r9, [r8]
            LastSyncPulseTime = EarliestSyncDetectedSource->RisingEdgeTicks;
     b2a:	f8c6 e000 	str.w	lr, [r6]
     b2e:	e74f      	b.n	9d0 <MainLoop()+0x34>
            CurrentStationLock = NO_STATION_LOCK;
     b30:	4d1e      	ldr	r5, [pc, #120]	; (bac <MainLoop()+0x210>)
     b32:	491f      	ldr	r1, [pc, #124]	; (bb0 <MainLoop()+0x214>)
     b34:	4a1f      	ldr	r2, [pc, #124]	; (bb4 <MainLoop()+0x218>)
     b36:	4b20      	ldr	r3, [pc, #128]	; (bb8 <MainLoop()+0x21c>)
     b38:	7809      	ldrb	r1, [r1, #0]
     b3a:	7812      	ldrb	r2, [r2, #0]
     b3c:	681b      	ldr	r3, [r3, #0]
     b3e:	2000      	movs	r0, #0
     b40:	7028      	strb	r0, [r5, #0]
     b42:	e745      	b.n	9d0 <MainLoop()+0x34>
            if (LastSyncSource == STATION_A and SourceStation ==
     b44:	4f25      	ldr	r7, [pc, #148]	; (bdc <MainLoop()+0x240>)
     b46:	783b      	ldrb	r3, [r7, #0]
     b48:	2b00      	cmp	r3, #0
     b4a:	d1d9      	bne.n	b00 <MainLoop()+0x164>
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
     b4c:	f8df 8098 	ldr.w	r8, [pc, #152]	; be8 <MainLoop()+0x24c>
                CurrentStationLock = DUAL_STATION_LOCK;
     b50:	4d16      	ldr	r5, [pc, #88]	; (bac <MainLoop()+0x210>)
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
     b52:	f898 1000 	ldrb.w	r1, [r8]
     b56:	4822      	ldr	r0, [pc, #136]	; (be0 <MainLoop()+0x244>)
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b58:	b2e3      	uxtb	r3, r4
     b5a:	f3c3 0940 	ubfx	r9, r3, #1, #1
                CurrentStationLock = DUAL_STATION_LOCK;
     b5e:	2202      	movs	r2, #2
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b60:	9303      	str	r3, [sp, #12]
                CurrentStationLock = DUAL_STATION_LOCK;
     b62:	702a      	strb	r2, [r5, #0]
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
     b64:	f7ff fc90 	bl	488 <BaseOOTX::NewOOTXBit(bool)>
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b68:	4649      	mov	r1, r9
     b6a:	481e      	ldr	r0, [pc, #120]	; (be4 <MainLoop()+0x248>)
     b6c:	f7ff fc8c 	bl	488 <BaseOOTX::NewOOTXBit(bool)>
     b70:	f8da e000 	ldr.w	lr, [sl]
     b74:	9b03      	ldr	r3, [sp, #12]
     b76:	e7cb      	b.n	b10 <MainLoop()+0x174>
                NextSweepSource = SourceStation; // Expect the next sweep to be from this base
     b78:	4a0d      	ldr	r2, [pc, #52]	; (bb0 <MainLoop()+0x214>)
                NextSweepAxis = AXIS(SyncPulseMeaning); // Which axis will this station be broadcasting.
     b7a:	490e      	ldr	r1, [pc, #56]	; (bb4 <MainLoop()+0x218>)
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks; //Used for determining if first or second pulse
     b7c:	4b0e      	ldr	r3, [pc, #56]	; (bb8 <MainLoop()+0x21c>)
                NextSweepSource = SourceStation; // Expect the next sweep to be from this base
     b7e:	f882 b000 	strb.w	fp, [r2]
                NextSweepAxis = AXIS(SyncPulseMeaning); // Which axis will this station be broadcasting.
     b82:	f004 0201 	and.w	r2, r4, #1
     b86:	700a      	strb	r2, [r1, #0]
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks; //Used for determining if first or second pulse
     b88:	f8c3 e000 	str.w	lr, [r3]
     b8c:	4659      	mov	r1, fp
     b8e:	4673      	mov	r3, lr
     b90:	e7c6      	b.n	b20 <MainLoop()+0x184>
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
     b92:	2301      	movs	r3, #1
     b94:	f88a 3010 	strb.w	r3, [sl, #16]
     b98:	e70b      	b.n	9b2 <MainLoop()+0x16>
     b9a:	bf00      	nop
     b9c:	40037104 	.word	0x40037104
     ba0:	1fff92bc 	.word	0x1fff92bc
     ba4:	1fff92b0 	.word	0x1fff92b0
     ba8:	000f4218 	.word	0x000f4218
     bac:	1fff93b1 	.word	0x1fff93b1
     bb0:	1fff92b8 	.word	0x1fff92b8
     bb4:	1fff92ad 	.word	0x1fff92ad
     bb8:	1fff92a4 	.word	0x1fff92a4
     bbc:	1fff93b8 	.word	0x1fff93b8
     bc0:	1fff92b4 	.word	0x1fff92b4
     bc4:	1fff88f0 	.word	0x1fff88f0
     bc8:	00004864 	.word	0x00004864
     bcc:	42652ee1 	.word	0x42652ee1
     bd0:	00004868 	.word	0x00004868
     bd4:	88888889 	.word	0x88888889
     bd8:	10624dd3 	.word	0x10624dd3
     bdc:	1fff93b0 	.word	0x1fff93b0
     be0:	1fff920c 	.word	0x1fff920c
     be4:	1fff9258 	.word	0x1fff9258
     be8:	1fff92ac 	.word	0x1fff92ac

00000bec <main>:


int main() {
     bec:	b508      	push	{r3, lr}
    MainSetup();
     bee:	f7ff fea1 	bl	934 <MainSetup()>
    delay(200);
     bf2:	20c8      	movs	r0, #200	; 0xc8
     bf4:	f000 fcc0 	bl	1578 <delay>
//            delay(250);
//        }
//
//    }

        MainLoop();
     bf8:	f7ff fed0 	bl	99c <MainLoop()>
     bfc:	e7fc      	b.n	bf8 <main+0xc>
     bfe:	bf00      	nop

00000c00 <_GLOBAL__sub_I_SENSOR_1_PINS>:
    }
    return 0;
     c00:	b538      	push	{r3, r4, r5, lr}
BaseOOTX OOTX[2] = {STATION_A,STATION_B};
     c02:	4d0e      	ldr	r5, [pc, #56]	; (c3c <_GLOBAL__sub_I_SENSOR_1_PINS+0x3c>)
     c04:	4c0e      	ldr	r4, [pc, #56]	; (c40 <_GLOBAL__sub_I_SENSOR_1_PINS+0x40>)
     c06:	4628      	mov	r0, r5
     c08:	2100      	movs	r1, #0
     c0a:	f7ff fc2f 	bl	46c <BaseOOTX::BaseOOTX(int)>
     c0e:	f105 004c 	add.w	r0, r5, #76	; 0x4c
     c12:	2101      	movs	r1, #1
     c14:	f7ff fc2a 	bl	46c <BaseOOTX::BaseOOTX(int)>
     c18:	4622      	mov	r2, r4
     c1a:	490a      	ldr	r1, [pc, #40]	; (c44 <_GLOBAL__sub_I_SENSOR_1_PINS+0x44>)
     c1c:	2000      	movs	r0, #0
     c1e:	f002 f9f9 	bl	3014 <__aeabi_atexit>
SensorNode Nodes[] = {SENSOR_1_PINS};
     c22:	4b09      	ldr	r3, [pc, #36]	; (c48 <_GLOBAL__sub_I_SENSOR_1_PINS+0x48>)
     c24:	4809      	ldr	r0, [pc, #36]	; (c4c <_GLOBAL__sub_I_SENSOR_1_PINS+0x4c>)
     c26:	cb0e      	ldmia	r3, {r1, r2, r3}
     c28:	f7ff fc82 	bl	530 <SensorNode::SensorNode(SensorPinData_t)>
     c2c:	4622      	mov	r2, r4
     c2e:	4908      	ldr	r1, [pc, #32]	; (c50 <_GLOBAL__sub_I_SENSOR_1_PINS+0x50>)
     c30:	2000      	movs	r0, #0
     c32:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     c36:	f002 b9ed 	b.w	3014 <__aeabi_atexit>
     c3a:	bf00      	nop
     c3c:	1fff920c 	.word	0x1fff920c
     c40:	1fff87fc 	.word	0x1fff87fc
     c44:	00000919 	.word	0x00000919
     c48:	1fff8800 	.word	0x1fff8800
     c4c:	1fff92bc 	.word	0x1fff92bc
     c50:	0000090d 	.word	0x0000090d

00000c54 <Print::write(unsigned char const*, unsigned int)>:
#include "Print.h"



size_t Print::write(const uint8_t *buffer, size_t size)
{
     c54:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	size_t count = 0;
	while (size--) count += write(*buffer++);
     c56:	b172      	cbz	r2, c76 <Print::write(unsigned char const*, unsigned int)+0x22>
     c58:	4606      	mov	r6, r0
     c5a:	460f      	mov	r7, r1
     c5c:	4614      	mov	r4, r2
     c5e:	2500      	movs	r5, #0
     c60:	6833      	ldr	r3, [r6, #0]
     c62:	f817 1b01 	ldrb.w	r1, [r7], #1
     c66:	681b      	ldr	r3, [r3, #0]
     c68:	4630      	mov	r0, r6
     c6a:	4798      	blx	r3
     c6c:	3c01      	subs	r4, #1
     c6e:	4405      	add	r5, r0
     c70:	d1f6      	bne.n	c60 <Print::write(unsigned char const*, unsigned int)+0xc>
	return count;
}
     c72:	4628      	mov	r0, r5
     c74:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	size_t count = 0;
     c76:	4615      	mov	r5, r2
     c78:	e7fb      	b.n	c72 <Print::write(unsigned char const*, unsigned int)+0x1e>
     c7a:	bf00      	nop

00000c7c <Print::print(long)>:
	return count;
}


size_t Print::print(long n)
{
     c7c:	b5f0      	push	{r4, r5, r6, r7, lr}
	uint8_t sign=0;

	if (n < 0) {
     c7e:	2900      	cmp	r1, #0
{
     c80:	b08b      	sub	sp, #44	; 0x2c
     c82:	4604      	mov	r4, r0
	if (n < 0) {
     c84:	db1b      	blt.n	cbe <Print::print(long)+0x42>
	} else if (base == 1) {
		base = 10;
	}


	if (n == 0) {
     c86:	d15a      	bne.n	d3e <Print::print(long)+0xc2>
		buf[sizeof(buf) - 1] = '0';
     c88:	2330      	movs	r3, #48	; 0x30
     c8a:	f88d 3025 	strb.w	r3, [sp, #37]	; 0x25
	}
	if (sign) {
		i--;
		buf[i] = '-';
	}
	return write(buf + i, sizeof(buf) - i);
     c8e:	6823      	ldr	r3, [r4, #0]
     c90:	4a35      	ldr	r2, [pc, #212]	; (d68 <Print::print(long)+0xec>)
     c92:	685f      	ldr	r7, [r3, #4]
     c94:	4297      	cmp	r7, r2
     c96:	d14a      	bne.n	d2e <Print::print(long)+0xb2>
	while (size--) count += write(*buffer++);
     c98:	2500      	movs	r5, #0
	return write(buf + i, sizeof(buf) - i);
     c9a:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     c9e:	460e      	mov	r6, r1
     ca0:	440d      	add	r5, r1
     ca2:	2700      	movs	r7, #0
     ca4:	e001      	b.n	caa <Print::print(long)+0x2e>
     ca6:	6823      	ldr	r3, [r4, #0]
     ca8:	3601      	adds	r6, #1
	while (size--) count += write(*buffer++);
     caa:	681b      	ldr	r3, [r3, #0]
     cac:	7831      	ldrb	r1, [r6, #0]
     cae:	4620      	mov	r0, r4
     cb0:	4798      	blx	r3
     cb2:	42b5      	cmp	r5, r6
     cb4:	4407      	add	r7, r0
     cb6:	d1f6      	bne.n	ca6 <Print::print(long)+0x2a>
     cb8:	4638      	mov	r0, r7
}
     cba:	b00b      	add	sp, #44	; 0x2c
     cbc:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cbe:	4b2b      	ldr	r3, [pc, #172]	; (d6c <Print::print(long)+0xf0>)
	return printNumber(n, 10, sign);
     cc0:	4249      	negs	r1, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cc2:	fba3 2301 	umull	r2, r3, r3, r1
     cc6:	08db      	lsrs	r3, r3, #3
     cc8:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     ccc:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
     cd0:	3130      	adds	r1, #48	; 0x30
     cd2:	f88d 1025 	strb.w	r1, [sp, #37]	; 0x25
			if (n == 0) break;
     cd6:	2b00      	cmp	r3, #0
     cd8:	d044      	beq.n	d64 <Print::print(long)+0xe8>
		sign = '-';
     cda:	262d      	movs	r6, #45	; 0x2d
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cdc:	4d23      	ldr	r5, [pc, #140]	; (d6c <Print::print(long)+0xf0>)
		sign = '-';
     cde:	2221      	movs	r2, #33	; 0x21
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     ce0:	fba5 0103 	umull	r0, r1, r5, r3
     ce4:	08c9      	lsrs	r1, r1, #3
     ce6:	eb01 0081 	add.w	r0, r1, r1, lsl #2
			i--;
     cea:	3a01      	subs	r2, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cec:	eba3 0340 	sub.w	r3, r3, r0, lsl #1
			i--;
     cf0:	b2d2      	uxtb	r2, r2
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cf2:	a80a      	add	r0, sp, #40	; 0x28
     cf4:	4410      	add	r0, r2
     cf6:	3330      	adds	r3, #48	; 0x30
     cf8:	f800 3c24 	strb.w	r3, [r0, #-36]
			if (n == 0) break;
     cfc:	460b      	mov	r3, r1
     cfe:	2900      	cmp	r1, #0
     d00:	d1ee      	bne.n	ce0 <Print::print(long)+0x64>
	if (sign) {
     d02:	b35e      	cbz	r6, d5c <Print::print(long)+0xe0>
		i--;
     d04:	1e55      	subs	r5, r2, #1
     d06:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     d08:	ab0a      	add	r3, sp, #40	; 0x28
     d0a:	442b      	add	r3, r5
     d0c:	222d      	movs	r2, #45	; 0x2d
     d0e:	f803 2c24 	strb.w	r2, [r3, #-36]
     d12:	f1c5 0022 	rsb	r0, r5, #34	; 0x22
	return write(buf + i, sizeof(buf) - i);
     d16:	6823      	ldr	r3, [r4, #0]
     d18:	4a13      	ldr	r2, [pc, #76]	; (d68 <Print::print(long)+0xec>)
     d1a:	685f      	ldr	r7, [r3, #4]
     d1c:	a901      	add	r1, sp, #4
     d1e:	4297      	cmp	r7, r2
     d20:	4429      	add	r1, r5
     d22:	d107      	bne.n	d34 <Print::print(long)+0xb8>
	while (size--) count += write(*buffer++);
     d24:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     d28:	2800      	cmp	r0, #0
     d2a:	d1b8      	bne.n	c9e <Print::print(long)+0x22>
     d2c:	e7c5      	b.n	cba <Print::print(long)+0x3e>
	return write(buf + i, sizeof(buf) - i);
     d2e:	2001      	movs	r0, #1
     d30:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     d34:	4602      	mov	r2, r0
     d36:	4620      	mov	r0, r4
     d38:	47b8      	blx	r7
}
     d3a:	b00b      	add	sp, #44	; 0x2c
     d3c:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     d3e:	4b0b      	ldr	r3, [pc, #44]	; (d6c <Print::print(long)+0xf0>)
     d40:	fba3 2301 	umull	r2, r3, r3, r1
     d44:	08db      	lsrs	r3, r3, #3
     d46:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     d4a:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
     d4e:	3230      	adds	r2, #48	; 0x30
     d50:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
			if (n == 0) break;
     d54:	2b00      	cmp	r3, #0
     d56:	d09a      	beq.n	c8e <Print::print(long)+0x12>
	uint8_t sign=0;
     d58:	2600      	movs	r6, #0
     d5a:	e7bf      	b.n	cdc <Print::print(long)+0x60>
     d5c:	4615      	mov	r5, r2
     d5e:	f1c2 0022 	rsb	r0, r2, #34	; 0x22
     d62:	e7d8      	b.n	d16 <Print::print(long)+0x9a>
			if (n == 0) break;
     d64:	2221      	movs	r2, #33	; 0x21
     d66:	e7cd      	b.n	d04 <Print::print(long)+0x88>
     d68:	00000c55 	.word	0x00000c55
     d6c:	cccccccd 	.word	0xcccccccd

00000d70 <Print::println()>:
{
     d70:	b530      	push	{r4, r5, lr}
	return write(buf, 2);
     d72:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     d74:	490d      	ldr	r1, [pc, #52]	; (dac <Print::println()+0x3c>)
     d76:	4a0e      	ldr	r2, [pc, #56]	; (db0 <Print::println()+0x40>)
	return write(buf, 2);
     d78:	685c      	ldr	r4, [r3, #4]
	uint8_t buf[2]={'\r', '\n'};
     d7a:	8809      	ldrh	r1, [r1, #0]
{
     d7c:	b083      	sub	sp, #12
     d7e:	4294      	cmp	r4, r2
	uint8_t buf[2]={'\r', '\n'};
     d80:	f8ad 1004 	strh.w	r1, [sp, #4]
     d84:	d10d      	bne.n	da2 <Print::println()+0x32>
     d86:	4605      	mov	r5, r0
	while (size--) count += write(*buffer++);
     d88:	681b      	ldr	r3, [r3, #0]
     d8a:	210d      	movs	r1, #13
     d8c:	4798      	blx	r3
     d8e:	682b      	ldr	r3, [r5, #0]
     d90:	f89d 1005 	ldrb.w	r1, [sp, #5]
     d94:	681b      	ldr	r3, [r3, #0]
     d96:	4604      	mov	r4, r0
     d98:	4628      	mov	r0, r5
     d9a:	4798      	blx	r3
     d9c:	4420      	add	r0, r4
}
     d9e:	b003      	add	sp, #12
     da0:	bd30      	pop	{r4, r5, pc}
	return write(buf, 2);
     da2:	a901      	add	r1, sp, #4
     da4:	2202      	movs	r2, #2
     da6:	47a0      	blx	r4
}
     da8:	b003      	add	sp, #12
     daa:	bd30      	pop	{r4, r5, pc}
     dac:	0000486c 	.word	0x0000486c
     db0:	00000c55 	.word	0x00000c55

00000db4 <Print::printNumber(unsigned long, unsigned char, unsigned char)>:
{
     db4:	b5f0      	push	{r4, r5, r6, r7, lr}
     db6:	4606      	mov	r6, r0
     db8:	b08b      	sub	sp, #44	; 0x2c
	if (base == 0) {
     dba:	2a00      	cmp	r2, #0
     dbc:	d046      	beq.n	e4c <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x98>
		base = 10;
     dbe:	2a01      	cmp	r2, #1
     dc0:	bf08      	it	eq
     dc2:	220a      	moveq	r2, #10
	if (n == 0) {
     dc4:	2900      	cmp	r1, #0
     dc6:	d03c      	beq.n	e42 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x8e>
     dc8:	2521      	movs	r5, #33	; 0x21
     dca:	e000      	b.n	dce <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x1a>
			i--;
     dcc:	b2fd      	uxtb	r5, r7
			digit = n % base;
     dce:	fbb1 f4f2 	udiv	r4, r1, r2
     dd2:	fb02 1114 	mls	r1, r2, r4, r1
     dd6:	b2c8      	uxtb	r0, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     dd8:	2909      	cmp	r1, #9
     dda:	f100 0130 	add.w	r1, r0, #48	; 0x30
     dde:	bf98      	it	ls
     de0:	b2c8      	uxtbls	r0, r1
     de2:	a90a      	add	r1, sp, #40	; 0x28
     de4:	bf88      	it	hi
     de6:	3037      	addhi	r0, #55	; 0x37
     de8:	4429      	add	r1, r5
     dea:	bf88      	it	hi
     dec:	b2c0      	uxtbhi	r0, r0
     dee:	f801 0c24 	strb.w	r0, [r1, #-36]
			i--;
     df2:	1e6f      	subs	r7, r5, #1
			if (n == 0) break;
     df4:	4621      	mov	r1, r4
     df6:	2c00      	cmp	r4, #0
     df8:	d1e8      	bne.n	dcc <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x18>
	if (sign) {
     dfa:	b133      	cbz	r3, e0a <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x56>
		i--;
     dfc:	3d01      	subs	r5, #1
     dfe:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     e00:	ab0a      	add	r3, sp, #40	; 0x28
     e02:	442b      	add	r3, r5
     e04:	222d      	movs	r2, #45	; 0x2d
     e06:	f803 2c24 	strb.w	r2, [r3, #-36]
	return write(buf + i, sizeof(buf) - i);
     e0a:	6833      	ldr	r3, [r6, #0]
     e0c:	4916      	ldr	r1, [pc, #88]	; (e68 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0xb4>)
     e0e:	685f      	ldr	r7, [r3, #4]
     e10:	aa01      	add	r2, sp, #4
     e12:	428f      	cmp	r7, r1
     e14:	eb02 0405 	add.w	r4, r2, r5
     e18:	f1c5 0222 	rsb	r2, r5, #34	; 0x22
     e1c:	d11c      	bne.n	e58 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0xa4>
	while (size--) count += write(*buffer++);
     e1e:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     e22:	b1f2      	cbz	r2, e62 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0xae>
     e24:	4425      	add	r5, r4
     e26:	2700      	movs	r7, #0
     e28:	e001      	b.n	e2e <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x7a>
     e2a:	6833      	ldr	r3, [r6, #0]
     e2c:	3401      	adds	r4, #1
     e2e:	681b      	ldr	r3, [r3, #0]
     e30:	7821      	ldrb	r1, [r4, #0]
     e32:	4630      	mov	r0, r6
     e34:	4798      	blx	r3
     e36:	42a5      	cmp	r5, r4
     e38:	4407      	add	r7, r0
     e3a:	d1f6      	bne.n	e2a <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x76>
     e3c:	4638      	mov	r0, r7
}
     e3e:	b00b      	add	sp, #44	; 0x2c
     e40:	bdf0      	pop	{r4, r5, r6, r7, pc}
		buf[sizeof(buf) - 1] = '0';
     e42:	2230      	movs	r2, #48	; 0x30
     e44:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
		i = sizeof(buf) - 1;
     e48:	2521      	movs	r5, #33	; 0x21
     e4a:	e7d6      	b.n	dfa <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x46>
		return write((uint8_t)n);
     e4c:	6803      	ldr	r3, [r0, #0]
     e4e:	b2c9      	uxtb	r1, r1
     e50:	681b      	ldr	r3, [r3, #0]
     e52:	4798      	blx	r3
}
     e54:	b00b      	add	sp, #44	; 0x2c
     e56:	bdf0      	pop	{r4, r5, r6, r7, pc}
	return write(buf + i, sizeof(buf) - i);
     e58:	4621      	mov	r1, r4
     e5a:	4630      	mov	r0, r6
     e5c:	47b8      	blx	r7
}
     e5e:	b00b      	add	sp, #44	; 0x2c
     e60:	bdf0      	pop	{r4, r5, r6, r7, pc}
	while (size--) count += write(*buffer++);
     e62:	4610      	mov	r0, r2
     e64:	e7eb      	b.n	e3e <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x8a>
     e66:	bf00      	nop
     e68:	00000c55 	.word	0x00000c55
     e6c:	ffffffff 	.word	0xffffffff

00000e70 <Print::printFloat(double, unsigned char)>:

#endif

size_t Print::printFloat(double number, uint8_t digits) 
{
     e70:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     e74:	4691      	mov	r9, r2
     e76:	4698      	mov	r8, r3
     e78:	b08d      	sub	sp, #52	; 0x34
     e7a:	4605      	mov	r5, r0
	uint8_t sign=0;
	size_t count=0;

	if (isnan(number)) return print("nan");
    	if (isinf(number)) return print("inf");
    	if (number > 4294967040.0f) return print("ovf");  // constant determined empirically
     e7c:	f04f 4260 	mov.w	r2, #3758096384	; 0xe0000000
     e80:	4b8d      	ldr	r3, [pc, #564]	; (10b8 <Print::printFloat(double, unsigned char)+0x248>)
     e82:	4648      	mov	r0, r9
     e84:	4641      	mov	r1, r8
     e86:	f002 fd13 	bl	38b0 <__aeabi_dcmpgt>
{
     e8a:	f89d 4058 	ldrb.w	r4, [sp, #88]	; 0x58
    	if (number > 4294967040.0f) return print("ovf");  // constant determined empirically
     e8e:	2800      	cmp	r0, #0
     e90:	f040 80ca 	bne.w	1028 <Print::printFloat(double, unsigned char)+0x1b8>
     e94:	4606      	mov	r6, r0
    	if (number <-4294967040.0f) return print("ovf");  // constant determined empirically
     e96:	4641      	mov	r1, r8
     e98:	4648      	mov	r0, r9
     e9a:	f04f 4260 	mov.w	r2, #3758096384	; 0xe0000000
     e9e:	4b87      	ldr	r3, [pc, #540]	; (10bc <Print::printFloat(double, unsigned char)+0x24c>)
     ea0:	f002 fce8 	bl	3874 <__aeabi_dcmplt>
     ea4:	2800      	cmp	r0, #0
     ea6:	f040 80df 	bne.w	1068 <Print::printFloat(double, unsigned char)+0x1f8>
	
	// Handle negative numbers
	if (number < 0.0) {
     eaa:	4648      	mov	r0, r9
     eac:	4641      	mov	r1, r8
     eae:	2200      	movs	r2, #0
     eb0:	2300      	movs	r3, #0
     eb2:	f002 fcdf 	bl	3874 <__aeabi_dcmplt>
     eb6:	2800      	cmp	r0, #0
     eb8:	f040 80cc 	bne.w	1054 <Print::printFloat(double, unsigned char)+0x1e4>
	uint8_t sign=0;
     ebc:	4606      	mov	r6, r0
		number = -number;
	}

	// Round correctly so that print(1.999, 2) prints as "2.00"
	double rounding = 0.5;
	for (uint8_t i=0; i<digits; ++i) {
     ebe:	2c00      	cmp	r4, #0
     ec0:	f000 80f0 	beq.w	10a4 <Print::printFloat(double, unsigned char)+0x234>
     ec4:	4b7e      	ldr	r3, [pc, #504]	; (10c0 <Print::printFloat(double, unsigned char)+0x250>)
     ec6:	2700      	movs	r7, #0
     ec8:	2200      	movs	r2, #0
		rounding *= 0.1;
     eca:	4610      	mov	r0, r2
     ecc:	4619      	mov	r1, r3
     ece:	a378      	add	r3, pc, #480	; (adr r3, 10b0 <Print::printFloat(double, unsigned char)+0x240>)
     ed0:	e9d3 2300 	ldrd	r2, r3, [r3]
     ed4:	f002 fa5c 	bl	3390 <__aeabi_dmul>
     ed8:	3701      	adds	r7, #1
     eda:	460b      	mov	r3, r1
	for (uint8_t i=0; i<digits; ++i) {
     edc:	b2f9      	uxtb	r1, r7
     ede:	428c      	cmp	r4, r1
		rounding *= 0.1;
     ee0:	4602      	mov	r2, r0
	for (uint8_t i=0; i<digits; ++i) {
     ee2:	d8f2      	bhi.n	eca <Print::printFloat(double, unsigned char)+0x5a>
	}
	number += rounding;
     ee4:	4648      	mov	r0, r9
     ee6:	4641      	mov	r1, r8
     ee8:	f002 f8a0 	bl	302c <__adddf3>
     eec:	e9cd 0100 	strd	r0, r1, [sp]

	// Extract the integer part of the number and print it
	unsigned long int_part = (unsigned long)number;
     ef0:	f002 fce8 	bl	38c4 <__aeabi_d2uiz>
	if (n == 0) {
     ef4:	4682      	mov	sl, r0
     ef6:	2800      	cmp	r0, #0
     ef8:	f000 8091 	beq.w	101e <Print::printFloat(double, unsigned char)+0x1ae>
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     efc:	4f71      	ldr	r7, [pc, #452]	; (10c4 <Print::printFloat(double, unsigned char)+0x254>)
     efe:	fba7 2300 	umull	r2, r3, r7, r0
     f02:	08db      	lsrs	r3, r3, #3
     f04:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     f08:	eba0 0242 	sub.w	r2, r0, r2, lsl #1
     f0c:	3230      	adds	r2, #48	; 0x30
     f0e:	f88d 202d 	strb.w	r2, [sp, #45]	; 0x2d
			if (n == 0) break;
     f12:	2021      	movs	r0, #33	; 0x21
     f14:	b183      	cbz	r3, f38 <Print::printFloat(double, unsigned char)+0xc8>
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     f16:	fba7 1203 	umull	r1, r2, r7, r3
     f1a:	08d2      	lsrs	r2, r2, #3
     f1c:	eb02 0182 	add.w	r1, r2, r2, lsl #2
			i--;
     f20:	3801      	subs	r0, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     f22:	eba3 0341 	sub.w	r3, r3, r1, lsl #1
			i--;
     f26:	b2c0      	uxtb	r0, r0
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     f28:	a90c      	add	r1, sp, #48	; 0x30
     f2a:	4401      	add	r1, r0
     f2c:	3330      	adds	r3, #48	; 0x30
     f2e:	f801 3c24 	strb.w	r3, [r1, #-36]
			if (n == 0) break;
     f32:	4613      	mov	r3, r2
     f34:	2a00      	cmp	r2, #0
     f36:	d1ee      	bne.n	f16 <Print::printFloat(double, unsigned char)+0xa6>
	if (sign) {
     f38:	b136      	cbz	r6, f48 <Print::printFloat(double, unsigned char)+0xd8>
		i--;
     f3a:	3801      	subs	r0, #1
     f3c:	b2c0      	uxtb	r0, r0
		buf[i] = '-';
     f3e:	ab0c      	add	r3, sp, #48	; 0x30
     f40:	4403      	add	r3, r0
     f42:	222d      	movs	r2, #45	; 0x2d
     f44:	f803 2c24 	strb.w	r2, [r3, #-36]
	return write(buf + i, sizeof(buf) - i);
     f48:	f8d5 e000 	ldr.w	lr, [r5]
     f4c:	4f5e      	ldr	r7, [pc, #376]	; (10c8 <Print::printFloat(double, unsigned char)+0x258>)
     f4e:	f8de 3004 	ldr.w	r3, [lr, #4]
     f52:	aa03      	add	r2, sp, #12
     f54:	42bb      	cmp	r3, r7
     f56:	eb02 0100 	add.w	r1, r2, r0
     f5a:	f1c0 0222 	rsb	r2, r0, #34	; 0x22
     f5e:	f040 8098 	bne.w	1092 <Print::printFloat(double, unsigned char)+0x222>
	while (size--) count += write(*buffer++);
     f62:	f1c0 0021 	rsb	r0, r0, #33	; 0x21
     f66:	2a00      	cmp	r2, #0
     f68:	f000 809f 	beq.w	10aa <Print::printFloat(double, unsigned char)+0x23a>
     f6c:	468b      	mov	fp, r1
     f6e:	180e      	adds	r6, r1, r0
     f70:	f04f 0800 	mov.w	r8, #0
     f74:	e003      	b.n	f7e <Print::printFloat(double, unsigned char)+0x10e>
     f76:	f8d5 e000 	ldr.w	lr, [r5]
     f7a:	f10b 0b01 	add.w	fp, fp, #1
     f7e:	f8de 3000 	ldr.w	r3, [lr]
     f82:	f89b 1000 	ldrb.w	r1, [fp]
     f86:	4628      	mov	r0, r5
     f88:	4798      	blx	r3
     f8a:	455e      	cmp	r6, fp
     f8c:	4480      	add	r8, r0
     f8e:	d1f2      	bne.n	f76 <Print::printFloat(double, unsigned char)+0x106>
     f90:	4646      	mov	r6, r8
	double remainder = number - (double)int_part;
	count += printNumber(int_part, 10, sign);

	// Print the decimal point, but only if there are digits beyond
	if (digits > 0) {
     f92:	2c00      	cmp	r4, #0
     f94:	d03f      	beq.n	1016 <Print::printFloat(double, unsigned char)+0x1a6>
		uint8_t n, buf[16], count=1;
		buf[0] = '.';
     f96:	232e      	movs	r3, #46	; 0x2e
	double remainder = number - (double)int_part;
     f98:	4650      	mov	r0, sl
		buf[0] = '.';
     f9a:	f88d 300c 	strb.w	r3, [sp, #12]
	double remainder = number - (double)int_part;
     f9e:	f002 f981 	bl	32a4 <__aeabi_ui2d>
     fa2:	4602      	mov	r2, r0
     fa4:	460b      	mov	r3, r1
     fa6:	e9dd 0100 	ldrd	r0, r1, [sp]
     faa:	f002 f83d 	bl	3028 <__aeabi_dsub>
     fae:	2c0f      	cmp	r4, #15
     fb0:	bf28      	it	cs
     fb2:	240f      	movcs	r4, #15
     fb4:	f104 0a01 	add.w	sl, r4, #1
     fb8:	fa5f fa8a 	uxtb.w	sl, sl
     fbc:	2401      	movs	r4, #1

		// Extract digits from the remainder one at a time
		if (digits > sizeof(buf) - 1) digits = sizeof(buf) - 1;

		while (digits-- > 0) {
			remainder *= 10.0;
     fbe:	2200      	movs	r2, #0
     fc0:	4b42      	ldr	r3, [pc, #264]	; (10cc <Print::printFloat(double, unsigned char)+0x25c>)
     fc2:	f002 f9e5 	bl	3390 <__aeabi_dmul>
     fc6:	4689      	mov	r9, r1
     fc8:	4680      	mov	r8, r0
			n = (uint8_t)(remainder);
     fca:	f002 fc7b 	bl	38c4 <__aeabi_d2uiz>
			buf[count++] = '0' + n;
     fce:	ab0c      	add	r3, sp, #48	; 0x30
     fd0:	4423      	add	r3, r4
			n = (uint8_t)(remainder);
     fd2:	b2c0      	uxtb	r0, r0
			buf[count++] = '0' + n;
     fd4:	f100 0230 	add.w	r2, r0, #48	; 0x30
     fd8:	f803 2c24 	strb.w	r2, [r3, #-36]
			remainder -= n; 
     fdc:	f002 f972 	bl	32c4 <__aeabi_i2d>
			buf[count++] = '0' + n;
     fe0:	3401      	adds	r4, #1
			remainder -= n; 
     fe2:	4602      	mov	r2, r0
     fe4:	460b      	mov	r3, r1
			buf[count++] = '0' + n;
     fe6:	b2e4      	uxtb	r4, r4
			remainder -= n; 
     fe8:	4640      	mov	r0, r8
     fea:	4649      	mov	r1, r9
     fec:	f002 f81c 	bl	3028 <__aeabi_dsub>
		while (digits-- > 0) {
     ff0:	4554      	cmp	r4, sl
     ff2:	d1e4      	bne.n	fbe <Print::printFloat(double, unsigned char)+0x14e>
		}
		count += write(buf, count);
     ff4:	682b      	ldr	r3, [r5, #0]
     ff6:	f8d3 8004 	ldr.w	r8, [r3, #4]
     ffa:	45b8      	cmp	r8, r7
     ffc:	d14d      	bne.n	109a <Print::printFloat(double, unsigned char)+0x22a>
     ffe:	3c02      	subs	r4, #2
	while (size--) count += write(*buffer++);
    1000:	af03      	add	r7, sp, #12
    1002:	e001      	b.n	1008 <Print::printFloat(double, unsigned char)+0x198>
    1004:	682b      	ldr	r3, [r5, #0]
    1006:	3c01      	subs	r4, #1
    1008:	681b      	ldr	r3, [r3, #0]
    100a:	f817 1b01 	ldrb.w	r1, [r7], #1
    100e:	4628      	mov	r0, r5
    1010:	4798      	blx	r3
    1012:	1c63      	adds	r3, r4, #1
    1014:	d1f6      	bne.n	1004 <Print::printFloat(double, unsigned char)+0x194>
	}
	return count;
}
    1016:	4630      	mov	r0, r6
    1018:	b00d      	add	sp, #52	; 0x34
    101a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
		buf[sizeof(buf) - 1] = '0';
    101e:	2330      	movs	r3, #48	; 0x30
    1020:	f88d 302d 	strb.w	r3, [sp, #45]	; 0x2d
		i = sizeof(buf) - 1;
    1024:	2021      	movs	r0, #33	; 0x21
    1026:	e787      	b.n	f38 <Print::printFloat(double, unsigned char)+0xc8>
	size_t write(const char *str)			{ return write((const uint8_t *)str, strlen(str)); }
    1028:	682b      	ldr	r3, [r5, #0]
    102a:	4a27      	ldr	r2, [pc, #156]	; (10c8 <Print::printFloat(double, unsigned char)+0x258>)
    102c:	685c      	ldr	r4, [r3, #4]
    102e:	4294      	cmp	r4, r2
    1030:	d114      	bne.n	105c <Print::printFloat(double, unsigned char)+0x1ec>
    1032:	4c27      	ldr	r4, [pc, #156]	; (10d0 <Print::printFloat(double, unsigned char)+0x260>)
    1034:	2600      	movs	r6, #0
    1036:	1ce7      	adds	r7, r4, #3
    1038:	e000      	b.n	103c <Print::printFloat(double, unsigned char)+0x1cc>
    103a:	682b      	ldr	r3, [r5, #0]
	while (size--) count += write(*buffer++);
    103c:	f814 1b01 	ldrb.w	r1, [r4], #1
    1040:	681b      	ldr	r3, [r3, #0]
    1042:	4628      	mov	r0, r5
    1044:	4798      	blx	r3
    1046:	42bc      	cmp	r4, r7
    1048:	4406      	add	r6, r0
    104a:	d1f6      	bne.n	103a <Print::printFloat(double, unsigned char)+0x1ca>
}
    104c:	4630      	mov	r0, r6
    104e:	b00d      	add	sp, #52	; 0x34
    1050:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
		number = -number;
    1054:	f108 4800 	add.w	r8, r8, #2147483648	; 0x80000000
		sign = 1;
    1058:	2601      	movs	r6, #1
    105a:	e730      	b.n	ebe <Print::printFloat(double, unsigned char)+0x4e>
    105c:	4628      	mov	r0, r5
    105e:	2203      	movs	r2, #3
    1060:	491b      	ldr	r1, [pc, #108]	; (10d0 <Print::printFloat(double, unsigned char)+0x260>)
    1062:	47a0      	blx	r4
    1064:	4606      	mov	r6, r0
    1066:	e7d6      	b.n	1016 <Print::printFloat(double, unsigned char)+0x1a6>
    1068:	682b      	ldr	r3, [r5, #0]
    106a:	4a17      	ldr	r2, [pc, #92]	; (10c8 <Print::printFloat(double, unsigned char)+0x258>)
    106c:	685c      	ldr	r4, [r3, #4]
    106e:	4294      	cmp	r4, r2
    1070:	d1f4      	bne.n	105c <Print::printFloat(double, unsigned char)+0x1ec>
    1072:	4c17      	ldr	r4, [pc, #92]	; (10d0 <Print::printFloat(double, unsigned char)+0x260>)
    1074:	1ce7      	adds	r7, r4, #3
    1076:	e000      	b.n	107a <Print::printFloat(double, unsigned char)+0x20a>
    1078:	682b      	ldr	r3, [r5, #0]
	while (size--) count += write(*buffer++);
    107a:	f814 1b01 	ldrb.w	r1, [r4], #1
    107e:	681b      	ldr	r3, [r3, #0]
    1080:	4628      	mov	r0, r5
    1082:	4798      	blx	r3
    1084:	42bc      	cmp	r4, r7
    1086:	4406      	add	r6, r0
    1088:	d1f6      	bne.n	1078 <Print::printFloat(double, unsigned char)+0x208>
}
    108a:	4630      	mov	r0, r6
    108c:	b00d      	add	sp, #52	; 0x34
    108e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	return write(buf + i, sizeof(buf) - i);
    1092:	4628      	mov	r0, r5
    1094:	4798      	blx	r3
    1096:	4606      	mov	r6, r0
    1098:	e77b      	b.n	f92 <Print::printFloat(double, unsigned char)+0x122>
		count += write(buf, count);
    109a:	4622      	mov	r2, r4
    109c:	a903      	add	r1, sp, #12
    109e:	4628      	mov	r0, r5
    10a0:	47c0      	blx	r8
    10a2:	e7b8      	b.n	1016 <Print::printFloat(double, unsigned char)+0x1a6>
	double rounding = 0.5;
    10a4:	2200      	movs	r2, #0
    10a6:	4b06      	ldr	r3, [pc, #24]	; (10c0 <Print::printFloat(double, unsigned char)+0x250>)
    10a8:	e71c      	b.n	ee4 <Print::printFloat(double, unsigned char)+0x74>
	while (size--) count += write(*buffer++);
    10aa:	4616      	mov	r6, r2
    10ac:	e771      	b.n	f92 <Print::printFloat(double, unsigned char)+0x122>
    10ae:	bf00      	nop
    10b0:	a0000000 	.word	0xa0000000
    10b4:	3fb99999 	.word	0x3fb99999
    10b8:	41efffff 	.word	0x41efffff
    10bc:	c1efffff 	.word	0xc1efffff
    10c0:	3fe00000 	.word	0x3fe00000
    10c4:	cccccccd 	.word	0xcccccccd
    10c8:	00000c55 	.word	0x00000c55
    10cc:	40240000 	.word	0x40240000
    10d0:	00004870 	.word	0x00004870

000010d4 <memset>:
    10d4:	b501      	push	{r0, lr}
    10d6:	b1ea      	cbz	r2, 1114 <memset+0x40>
    10d8:	2a10      	cmp	r2, #16
    10da:	db17      	blt.n	110c <memset+0x38>
    10dc:	f000 0307 	and.w	r3, r0, #7
    10e0:	b133      	cbz	r3, 10f0 <memset+0x1c>
    10e2:	f1c3 0308 	rsb	r3, r3, #8
    10e6:	1ad2      	subs	r2, r2, r3
    10e8:	3b01      	subs	r3, #1
    10ea:	f800 1b01 	strb.w	r1, [r0], #1
    10ee:	dcfb      	bgt.n	10e8 <memset+0x14>
    10f0:	b2c9      	uxtb	r1, r1
    10f2:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
    10f6:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
    10fa:	468c      	mov	ip, r1
    10fc:	08d3      	lsrs	r3, r2, #3
    10fe:	3b01      	subs	r3, #1
    1100:	e8e0 1c02 	strd	r1, ip, [r0], #8
    1104:	dcfb      	bgt.n	10fe <memset+0x2a>
    1106:	f012 0207 	ands.w	r2, r2, #7
    110a:	d003      	beq.n	1114 <memset+0x40>
    110c:	3a01      	subs	r2, #1
    110e:	f800 1b01 	strb.w	r1, [r0], #1
    1112:	dcfb      	bgt.n	110c <memset+0x38>
    1114:	bd01      	pop	{r0, pc}
    1116:	bf00      	nop

00001118 <fault_isr>:
{
    1118:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
    111a:	4c10      	ldr	r4, [pc, #64]	; (115c <fault_isr+0x44>)
    111c:	e008      	b.n	1130 <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
    111e:	6823      	ldr	r3, [r4, #0]
    1120:	0559      	lsls	r1, r3, #21
    1122:	d40d      	bmi.n	1140 <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
    1124:	6823      	ldr	r3, [r4, #0]
    1126:	051a      	lsls	r2, r3, #20
    1128:	d40f      	bmi.n	114a <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
    112a:	6823      	ldr	r3, [r4, #0]
    112c:	04db      	lsls	r3, r3, #19
    112e:	d411      	bmi.n	1154 <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
    1130:	6823      	ldr	r3, [r4, #0]
    1132:	0358      	lsls	r0, r3, #13
    1134:	d5f3      	bpl.n	111e <fault_isr+0x6>
    1136:	f000 fb47 	bl	17c8 <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
    113a:	6823      	ldr	r3, [r4, #0]
    113c:	0559      	lsls	r1, r3, #21
    113e:	d5f1      	bpl.n	1124 <fault_isr+0xc>
    1140:	f001 fd60 	bl	2c04 <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
    1144:	6823      	ldr	r3, [r4, #0]
    1146:	051a      	lsls	r2, r3, #20
    1148:	d5ef      	bpl.n	112a <fault_isr+0x12>
    114a:	f001 fdf1 	bl	2d30 <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
    114e:	6823      	ldr	r3, [r4, #0]
    1150:	04db      	lsls	r3, r3, #19
    1152:	d5ed      	bpl.n	1130 <fault_isr+0x18>
    1154:	f001 fe82 	bl	2e5c <uart2_status_isr>
    1158:	e7ea      	b.n	1130 <fault_isr+0x18>
    115a:	bf00      	nop
    115c:	40048034 	.word	0x40048034

00001160 <unused_isr>:
{
    1160:	b508      	push	{r3, lr}
	fault_isr();
    1162:	f7ff ffd9 	bl	1118 <fault_isr>
    1166:	bf00      	nop

00001168 <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
    1168:	4b01      	ldr	r3, [pc, #4]	; (1170 <startup_early_hook+0x8>)
    116a:	2210      	movs	r2, #16
    116c:	801a      	strh	r2, [r3, #0]
    116e:	4770      	bx	lr
    1170:	40052000 	.word	0x40052000

00001174 <startup_late_hook>:
static void startup_default_late_hook(void) {}
    1174:	4770      	bx	lr
    1176:	bf00      	nop

00001178 <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
    1178:	4909      	ldr	r1, [pc, #36]	; (11a0 <_sbrk+0x28>)
{
    117a:	b508      	push	{r3, lr}
	prev = __brkval;
    117c:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
    117e:	b130      	cbz	r0, 118e <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
    1180:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
    1182:	4418      	add	r0, r3
    1184:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    1188:	4290      	cmp	r0, r2
    118a:	d202      	bcs.n	1192 <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
    118c:	6008      	str	r0, [r1, #0]
	}
	return prev;
    118e:	4618      	mov	r0, r3
}
    1190:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
    1192:	f002 fe91 	bl	3eb8 <__errno>
    1196:	230c      	movs	r3, #12
    1198:	6003      	str	r3, [r0, #0]
			return (void *)-1;
    119a:	f04f 30ff 	mov.w	r0, #4294967295
    119e:	bd08      	pop	{r3, pc}
    11a0:	1fff880c 	.word	0x1fff880c

000011a4 <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
    11a4:	b4f0      	push	{r4, r5, r6, r7}
    11a6:	1e4d      	subs	r5, r1, #1
    11a8:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
    11aa:	2400      	movs	r4, #0
    11ac:	e000      	b.n	11b0 <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
    11ae:	3401      	adds	r4, #1
		digit = val % radix;
    11b0:	fbb0 f3f2 	udiv	r3, r0, r2
    11b4:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
    11b8:	2809      	cmp	r0, #9
    11ba:	f100 0730 	add.w	r7, r0, #48	; 0x30
    11be:	bf8a      	itet	hi
    11c0:	3037      	addhi	r0, #55	; 0x37
    11c2:	b2f8      	uxtbls	r0, r7
    11c4:	b2c0      	uxtbhi	r0, r0
    11c6:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
    11ca:	4618      	mov	r0, r3
    11cc:	2b00      	cmp	r3, #0
    11ce:	d1ee      	bne.n	11ae <ultoa+0xa>
	}
	buf[i + 1] = 0;
    11d0:	190a      	adds	r2, r1, r4
    11d2:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
    11d4:	b14c      	cbz	r4, 11ea <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
    11d6:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
    11d8:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
    11dc:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
    11de:	3301      	adds	r3, #1
    11e0:	1ae0      	subs	r0, r4, r3
    11e2:	4283      	cmp	r3, r0
		buf[i] = t;
    11e4:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
    11e8:	dbf5      	blt.n	11d6 <ultoa+0x32>
	}
	return buf;
}
    11ea:	4608      	mov	r0, r1
    11ec:	bcf0      	pop	{r4, r5, r6, r7}
    11ee:	4770      	bx	lr

000011f0 <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
    11f0:	4770      	bx	lr
    11f2:	bf00      	nop

000011f4 <attachInterrupt>:
void attachInterrupt(uint8_t pin, void (*function)(void), int mode)
{
	volatile uint32_t *config;
	uint32_t cfg, mask;

	if (pin >= CORE_NUM_DIGITAL) return;
    11f4:	2821      	cmp	r0, #33	; 0x21
{
    11f6:	b4f0      	push	{r4, r5, r6, r7}
	if (pin >= CORE_NUM_DIGITAL) return;
    11f8:	d815      	bhi.n	1226 <attachInterrupt+0x32>
	switch (mode) {
    11fa:	2a04      	cmp	r2, #4
    11fc:	d813      	bhi.n	1226 <attachInterrupt+0x32>
    11fe:	e8df f002 	tbb	[pc, r2]
    1202:	4c49      	.short	0x4c49
    1204:	144f      	.short	0x144f
    1206:	46          	.byte	0x46
    1207:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
    1208:	4e2e      	ldr	r6, [pc, #184]	; (12c4 <attachInterrupt+0xd0>)
	attachInterruptVector(IRQ_PORTD, port_D_isr);
	attachInterruptVector(IRQ_PORTE, port_E_isr);
	voidFuncPtr* isr_table = getIsrTable(config);
	if(!isr_table) return;
	uint32_t pin_index = getPinIndex(config);
	__disable_irq();
    120a:	b672      	cpsid	i
	cfg = *config;
    120c:	681a      	ldr	r2, [r3, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
    120e:	f422 2270 	bic.w	r2, r2, #983040	; 0xf0000
    1212:	f042 7080 	orr.w	r0, r2, #16777216	; 0x1000000
	*config = cfg;
	isr_table[pin_index] = function;	// set the function pointer
    1216:	f3c3 0484 	ubfx	r4, r3, #2, #5
	cfg |= mask;
    121a:	4328      	orrs	r0, r5
	*config = cfg;
    121c:	601a      	str	r2, [r3, #0]
	isr_table[pin_index] = function;	// set the function pointer
    121e:	f846 1024 	str.w	r1, [r6, r4, lsl #2]
	*config = cfg;			// enable the new interrupt
    1222:	6018      	str	r0, [r3, #0]
	__enable_irq();
    1224:	b662      	cpsie	i
	intFunc[pin] = function;	// set the function pointer
	cfg |= mask;
	*config = cfg;			// enable the new interrupt
	__enable_irq();
#endif
}
    1226:	bcf0      	pop	{r4, r5, r6, r7}
    1228:	4770      	bx	lr
	switch (mode) {
    122a:	f44f 2510 	mov.w	r5, #589824	; 0x90000
	config = portConfigRegister(pin);
    122e:	4c26      	ldr	r4, [pc, #152]	; (12c8 <attachInterrupt+0xd4>)
    1230:	eb04 03c0 	add.w	r3, r4, r0, lsl #3
    1234:	685b      	ldr	r3, [r3, #4]
	if ((*config & 0x00000700) == 0) {
    1236:	681a      	ldr	r2, [r3, #0]
    1238:	f412 62e0 	ands.w	r2, r2, #1792	; 0x700
    123c:	d035      	beq.n	12aa <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
    123e:	4a23      	ldr	r2, [pc, #140]	; (12cc <attachInterrupt+0xd8>)
    1240:	4c23      	ldr	r4, [pc, #140]	; (12d0 <attachInterrupt+0xdc>)
    1242:	4824      	ldr	r0, [pc, #144]	; (12d4 <attachInterrupt+0xe0>)
    1244:	f8c2 419c 	str.w	r4, [r2, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
    1248:	f103 4440 	add.w	r4, r3, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
    124c:	4e22      	ldr	r6, [pc, #136]	; (12d8 <attachInterrupt+0xe4>)
    124e:	f8c2 01a4 	str.w	r0, [r2, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
    1252:	f5a4 2092 	sub.w	r0, r4, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
    1256:	4f21      	ldr	r7, [pc, #132]	; (12dc <attachInterrupt+0xe8>)
    1258:	f8c2 61a0 	str.w	r6, [r2, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
    125c:	287c      	cmp	r0, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
    125e:	4e20      	ldr	r6, [pc, #128]	; (12e0 <attachInterrupt+0xec>)
    1260:	f8c2 71a8 	str.w	r7, [r2, #424]	; 0x1a8
    1264:	f8c2 61ac 	str.w	r6, [r2, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
    1268:	d9ce      	bls.n	1208 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
    126a:	f5a4 2294 	sub.w	r2, r4, #303104	; 0x4a000
    126e:	2a7c      	cmp	r2, #124	; 0x7c
    1270:	d919      	bls.n	12a6 <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
    1272:	f5a4 2296 	sub.w	r2, r4, #307200	; 0x4b000
    1276:	2a7c      	cmp	r2, #124	; 0x7c
    1278:	d91f      	bls.n	12ba <attachInterrupt+0xc6>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
    127a:	f5a4 2298 	sub.w	r2, r4, #311296	; 0x4c000
    127e:	2a7c      	cmp	r2, #124	; 0x7c
    1280:	d91d      	bls.n	12be <attachInterrupt+0xca>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
    1282:	f5a4 249a 	sub.w	r4, r4, #315392	; 0x4d000
    1286:	2c7c      	cmp	r4, #124	; 0x7c
    1288:	d8cd      	bhi.n	1226 <attachInterrupt+0x32>
    128a:	4e16      	ldr	r6, [pc, #88]	; (12e4 <attachInterrupt+0xf0>)
    128c:	e7bd      	b.n	120a <attachInterrupt+0x16>
	switch (mode) {
    128e:	f44f 2530 	mov.w	r5, #720896	; 0xb0000
    1292:	e7cc      	b.n	122e <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
    1294:	f44f 2500 	mov.w	r5, #524288	; 0x80000
    1298:	e7c9      	b.n	122e <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
    129a:	f44f 2540 	mov.w	r5, #786432	; 0xc0000
    129e:	e7c6      	b.n	122e <attachInterrupt+0x3a>
	switch (mode) {
    12a0:	f44f 2520 	mov.w	r5, #655360	; 0xa0000
    12a4:	e7c3      	b.n	122e <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
    12a6:	4e10      	ldr	r6, [pc, #64]	; (12e8 <attachInterrupt+0xf4>)
    12a8:	e7af      	b.n	120a <attachInterrupt+0x16>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
    12aa:	f854 4030 	ldr.w	r4, [r4, r0, lsl #3]
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
			*config = PORT_PCR_MUX(1);
    12ae:	f44f 7080 	mov.w	r0, #256	; 0x100
		*portModeRegister(pin) = 0;
    12b2:	f884 2280 	strb.w	r2, [r4, #640]	; 0x280
			*config = PORT_PCR_MUX(1);
    12b6:	6018      	str	r0, [r3, #0]
    12b8:	e7c1      	b.n	123e <attachInterrupt+0x4a>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
    12ba:	4e0c      	ldr	r6, [pc, #48]	; (12ec <attachInterrupt+0xf8>)
    12bc:	e7a5      	b.n	120a <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
    12be:	4e0c      	ldr	r6, [pc, #48]	; (12f0 <attachInterrupt+0xfc>)
    12c0:	e7a3      	b.n	120a <attachInterrupt+0x16>
    12c2:	bf00      	nop
    12c4:	1fff8810 	.word	0x1fff8810
    12c8:	00004874 	.word	0x00004874
    12cc:	1fff8200 	.word	0x1fff8200
    12d0:	1fff87d1 	.word	0x1fff87d1
    12d4:	1fff8779 	.word	0x1fff8779
    12d8:	1fff87a5 	.word	0x1fff87a5
    12dc:	1fff874d 	.word	0x1fff874d
    12e0:	1fff8721 	.word	0x1fff8721
    12e4:	1fff88e8 	.word	0x1fff88e8
    12e8:	1fff8848 	.word	0x1fff8848
    12ec:	1fff8898 	.word	0x1fff8898
    12f0:	1fff88c8 	.word	0x1fff88c8

000012f4 <rtc_set>:
{
    12f4:	b430      	push	{r4, r5}
	RTC_SR = 0;
    12f6:	4b05      	ldr	r3, [pc, #20]	; (130c <rtc_set+0x18>)
	RTC_TPR = 0;
    12f8:	4d05      	ldr	r5, [pc, #20]	; (1310 <rtc_set+0x1c>)
	RTC_TSR = t;
    12fa:	4c06      	ldr	r4, [pc, #24]	; (1314 <rtc_set+0x20>)
	RTC_SR = 0;
    12fc:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
    12fe:	2110      	movs	r1, #16
	RTC_SR = 0;
    1300:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
    1302:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
    1304:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
    1306:	6019      	str	r1, [r3, #0]
}
    1308:	bc30      	pop	{r4, r5}
    130a:	4770      	bx	lr
    130c:	4003d014 	.word	0x4003d014
    1310:	4003d004 	.word	0x4003d004
    1314:	4003d000 	.word	0x4003d000

00001318 <_init_Teensyduino_internal_>:
{
    1318:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
    131c:	4b6a      	ldr	r3, [pc, #424]	; (14c8 <_init_Teensyduino_internal_+0x1b0>)
	FTM0_CNT = 0;
    131e:	496b      	ldr	r1, [pc, #428]	; (14cc <_init_Teensyduino_internal_+0x1b4>)
	FTM0_C1SC = 0x28;
    1320:	4e6b      	ldr	r6, [pc, #428]	; (14d0 <_init_Teensyduino_internal_+0x1b8>)
	FTM0_C3SC = 0x28;
    1322:	4d6c      	ldr	r5, [pc, #432]	; (14d4 <_init_Teensyduino_internal_+0x1bc>)
	FTM0_C4SC = 0x28;
    1324:	4c6c      	ldr	r4, [pc, #432]	; (14d8 <_init_Teensyduino_internal_+0x1c0>)
	FTM0_MOD = DEFAULT_FTM_MOD;
    1326:	f8df c1d0 	ldr.w	ip, [pc, #464]	; 14f8 <_init_Teensyduino_internal_+0x1e0>
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
    132a:	f8df e1d0 	ldr.w	lr, [pc, #464]	; 14fc <_init_Teensyduino_internal_+0x1e4>
	FTM0_C2SC = 0x28;
    132e:	4a6b      	ldr	r2, [pc, #428]	; (14dc <_init_Teensyduino_internal_+0x1c4>)
	FTM0_C5SC = 0x28;
    1330:	4f6b      	ldr	r7, [pc, #428]	; (14e0 <_init_Teensyduino_internal_+0x1c8>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
    1332:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
    1336:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
    1338:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
    133c:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
    133e:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
    1342:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
    1344:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
    1348:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
    134a:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
    134e:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
    1350:	2000      	movs	r0, #0
    1352:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
    1354:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
    1356:	f64e 71ff 	movw	r1, #61439	; 0xefff
    135a:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
    135e:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
    1362:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
    1364:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
    1366:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
    1368:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
    136a:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
    136c:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
    136e:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1370:	2209      	movs	r2, #9
    1372:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
    1376:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
    137a:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
    137e:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
    1382:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
    1386:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
    138a:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
    138e:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
    1390:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1394:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
    1398:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
    139c:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
    13a0:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
    13a2:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    13a6:	484f      	ldr	r0, [pc, #316]	; (14e4 <_init_Teensyduino_internal_+0x1cc>)
	FTM2_MOD = DEFAULT_FTM_MOD;
    13a8:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
    13aa:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
    13ae:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
    13b2:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
    13b4:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    13b6:	6002      	str	r2, [r0, #0]
	analog_init();
    13b8:	f001 fba4 	bl	2b04 <analog_init>

uint32_t micros(void)
{
	uint32_t count, current, istatus;

	__disable_irq();
    13bc:	b672      	cpsid	i
	current = SYST_CVR;
	count = systick_millis_count;
    13be:	4d4a      	ldr	r5, [pc, #296]	; (14e8 <_init_Teensyduino_internal_+0x1d0>)
	current = SYST_CVR;
    13c0:	4b4a      	ldr	r3, [pc, #296]	; (14ec <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    13c2:	4a4b      	ldr	r2, [pc, #300]	; (14f0 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
    13c4:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
    13c6:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    13c8:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
    13ca:	b662      	cpsie	i
	 //systick_current = current;
	 //systick_count = count;
	 //systick_istatus = istatus & SCB_ICSR_PENDSTSET ? 1 : 0;
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    13cc:	0151      	lsls	r1, r2, #5
    13ce:	d502      	bpl.n	13d6 <_init_Teensyduino_internal_+0xbe>
    13d0:	2b32      	cmp	r3, #50	; 0x32
    13d2:	bf88      	it	hi
    13d4:	3401      	addhi	r4, #1
#if defined(KINETISL) && F_CPU == 48000000
	return count * 1000 + ((current * (uint32_t)87381) >> 22);
#elif defined(KINETISL) && F_CPU == 24000000
	return count * 1000 + ((current * (uint32_t)174763) >> 22);
#endif
	return count * 1000 + current / (F_CPU / 1000000);
    13d6:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
    13da:	4f46      	ldr	r7, [pc, #280]	; (14f4 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
    13dc:	f8df 910c 	ldr.w	r9, [pc, #268]	; 14ec <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    13e0:	f8df 810c 	ldr.w	r8, [pc, #268]	; 14f0 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
    13e4:	33bf      	adds	r3, #191	; 0xbf
    13e6:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    13ea:	fba7 1303 	umull	r1, r3, r7, r3
    13ee:	fb02 f404 	mul.w	r4, r2, r4
    13f2:	eb04 1493 	add.w	r4, r4, r3, lsr #6
    13f6:	2632      	movs	r6, #50	; 0x32
	__disable_irq();
    13f8:	b672      	cpsid	i
	current = SYST_CVR;
    13fa:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
    13fe:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1400:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
    1404:	b662      	cpsie	i
{
	uint32_t start = micros();

	if (ms > 0) {
		while (1) {
			while ((micros() - start) >= 1000) {
    1406:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
    140a:	33bf      	adds	r3, #191	; 0xbf
    140c:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    1410:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
    1414:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
    1418:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    141c:	d002      	beq.n	1424 <_init_Teensyduino_internal_+0x10c>
    141e:	2932      	cmp	r1, #50	; 0x32
    1420:	bf88      	it	hi
    1422:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
    1424:	fb00 3302 	mla	r3, r0, r2, r3
    1428:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    142c:	d304      	bcc.n	1438 <_init_Teensyduino_internal_+0x120>
				ms--;
				if (ms == 0) return;
    142e:	3e01      	subs	r6, #1
    1430:	d005      	beq.n	143e <_init_Teensyduino_internal_+0x126>
				start += 1000;
    1432:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
    1436:	e7df      	b.n	13f8 <_init_Teensyduino_internal_+0xe0>
			}
			yield();
    1438:	f001 f9a2 	bl	2780 <yield>
    143c:	e7dc      	b.n	13f8 <_init_Teensyduino_internal_+0xe0>
	usb_init();
    143e:	f000 ff1d 	bl	227c <usb_init>
	__disable_irq();
    1442:	b672      	cpsid	i
	current = SYST_CVR;
    1444:	4b29      	ldr	r3, [pc, #164]	; (14ec <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1446:	4a2a      	ldr	r2, [pc, #168]	; (14f0 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
    1448:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
    144a:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    144c:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
    144e:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    1450:	0152      	lsls	r2, r2, #5
    1452:	d502      	bpl.n	145a <_init_Teensyduino_internal_+0x142>
    1454:	2b32      	cmp	r3, #50	; 0x32
    1456:	bf88      	it	hi
    1458:	3401      	addhi	r4, #1
	return count * 1000 + current / (F_CPU / 1000000);
    145a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
    145e:	4f25      	ldr	r7, [pc, #148]	; (14f4 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
    1460:	f8df 9088 	ldr.w	r9, [pc, #136]	; 14ec <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1464:	f8df 8088 	ldr.w	r8, [pc, #136]	; 14f0 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
    1468:	33bf      	adds	r3, #191	; 0xbf
    146a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    146e:	fba7 1303 	umull	r1, r3, r7, r3
    1472:	fb02 f404 	mul.w	r4, r2, r4
    1476:	eb04 1493 	add.w	r4, r4, r3, lsr #6
    147a:	f44f 76af 	mov.w	r6, #350	; 0x15e
	__disable_irq();
    147e:	b672      	cpsid	i
	current = SYST_CVR;
    1480:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
    1484:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1486:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
    148a:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
    148c:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
    1490:	33bf      	adds	r3, #191	; 0xbf
    1492:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    1496:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
    149a:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
    149e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    14a2:	d002      	beq.n	14aa <_init_Teensyduino_internal_+0x192>
    14a4:	2932      	cmp	r1, #50	; 0x32
    14a6:	bf88      	it	hi
    14a8:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
    14aa:	fb00 3302 	mla	r3, r0, r2, r3
    14ae:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    14b2:	d304      	bcc.n	14be <_init_Teensyduino_internal_+0x1a6>
				if (ms == 0) return;
    14b4:	3e01      	subs	r6, #1
    14b6:	d005      	beq.n	14c4 <_init_Teensyduino_internal_+0x1ac>
				start += 1000;
    14b8:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
    14bc:	e7df      	b.n	147e <_init_Teensyduino_internal_+0x166>
			yield();
    14be:	f001 f95f 	bl	2780 <yield>
    14c2:	e7dc      	b.n	147e <_init_Teensyduino_internal_+0x166>
    14c4:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    14c8:	e000e108 	.word	0xe000e108
    14cc:	40038004 	.word	0x40038004
    14d0:	40038014 	.word	0x40038014
    14d4:	40038024 	.word	0x40038024
    14d8:	4003802c 	.word	0x4003802c
    14dc:	4003801c 	.word	0x4003801c
    14e0:	40038034 	.word	0x40038034
    14e4:	400b8000 	.word	0x400b8000
    14e8:	1fff93b8 	.word	0x1fff93b8
    14ec:	e000e018 	.word	0xe000e018
    14f0:	e000ed04 	.word	0xe000ed04
    14f4:	88888889 	.word	0x88888889
    14f8:	40038008 	.word	0x40038008
    14fc:	4003800c 	.word	0x4003800c

00001500 <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
    1500:	2821      	cmp	r0, #33	; 0x21
    1502:	d820      	bhi.n	1546 <pinMode+0x46>
	config = portConfigRegister(pin);
    1504:	4a1b      	ldr	r2, [pc, #108]	; (1574 <pinMode+0x74>)
    1506:	eb02 03c0 	add.w	r3, r2, r0, lsl #3
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
    150a:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
    150c:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
    150e:	d00f      	beq.n	1530 <pinMode+0x30>
    1510:	2904      	cmp	r1, #4
    1512:	d01d      	beq.n	1550 <pinMode+0x50>
		*portModeRegister(pin) = 0;
    1514:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
    1518:	2200      	movs	r2, #0
    151a:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
		if (mode == INPUT) {
    151e:	b199      	cbz	r1, 1548 <pinMode+0x48>
		} else if (mode == INPUT_PULLUP) {
    1520:	2902      	cmp	r1, #2
    1522:	d022      	beq.n	156a <pinMode+0x6a>
		} else if (mode == INPUT_PULLDOWN) {
    1524:	2903      	cmp	r1, #3
    1526:	d10d      	bne.n	1544 <pinMode+0x44>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
    1528:	f44f 7281 	mov.w	r2, #258	; 0x102
    152c:	601a      	str	r2, [r3, #0]
    152e:	4770      	bx	lr
		*portModeRegister(pin) = 1;
    1530:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    1534:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
    1538:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    153c:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
    153e:	681a      	ldr	r2, [r3, #0]
    1540:	f022 0220 	bic.w	r2, r2, #32
    1544:	601a      	str	r2, [r3, #0]
    1546:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
    1548:	f44f 7280 	mov.w	r2, #256	; 0x100
    154c:	601a      	str	r2, [r3, #0]
    154e:	4770      	bx	lr
		*portModeRegister(pin) = 1;
    1550:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    1554:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
    1558:	2001      	movs	r0, #1
    155a:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    155e:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
    1560:	681a      	ldr	r2, [r3, #0]
    1562:	f042 0220 	orr.w	r2, r2, #32
    1566:	601a      	str	r2, [r3, #0]
    1568:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
    156a:	f240 1203 	movw	r2, #259	; 0x103
    156e:	601a      	str	r2, [r3, #0]
    1570:	4770      	bx	lr
    1572:	bf00      	nop
    1574:	00004874 	.word	0x00004874

00001578 <delay>:
{
    1578:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    157c:	4605      	mov	r5, r0
	__disable_irq();
    157e:	b672      	cpsid	i
	count = systick_millis_count;
    1580:	4f20      	ldr	r7, [pc, #128]	; (1604 <delay+0x8c>)
	current = SYST_CVR;
    1582:	4b21      	ldr	r3, [pc, #132]	; (1608 <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1584:	4a21      	ldr	r2, [pc, #132]	; (160c <delay+0x94>)
	current = SYST_CVR;
    1586:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
    1588:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    158a:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
    158c:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    158e:	0152      	lsls	r2, r2, #5
    1590:	d502      	bpl.n	1598 <delay+0x20>
    1592:	2b32      	cmp	r3, #50	; 0x32
    1594:	bf88      	it	hi
    1596:	3401      	addhi	r4, #1
	if (ms > 0) {
    1598:	b395      	cbz	r5, 1600 <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
    159a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
    159e:	4e1c      	ldr	r6, [pc, #112]	; (1610 <delay+0x98>)
	current = SYST_CVR;
    15a0:	f8df 9064 	ldr.w	r9, [pc, #100]	; 1608 <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    15a4:	f8df 8064 	ldr.w	r8, [pc, #100]	; 160c <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
    15a8:	33bf      	adds	r3, #191	; 0xbf
    15aa:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    15ae:	fba6 1303 	umull	r1, r3, r6, r3
    15b2:	fb02 f404 	mul.w	r4, r2, r4
    15b6:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
    15ba:	b672      	cpsid	i
	current = SYST_CVR;
    15bc:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
    15c0:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    15c2:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
    15c6:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
    15c8:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
    15cc:	33bf      	adds	r3, #191	; 0xbf
    15ce:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    15d2:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
    15d6:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
    15da:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    15de:	d002      	beq.n	15e6 <delay+0x6e>
    15e0:	2932      	cmp	r1, #50	; 0x32
    15e2:	bf88      	it	hi
    15e4:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
    15e6:	fb00 3302 	mla	r3, r0, r2, r3
    15ea:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    15ee:	d304      	bcc.n	15fa <delay+0x82>
				if (ms == 0) return;
    15f0:	3d01      	subs	r5, #1
    15f2:	d005      	beq.n	1600 <delay+0x88>
				start += 1000;
    15f4:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
    15f8:	e7df      	b.n	15ba <delay+0x42>
			yield();
    15fa:	f001 f8c1 	bl	2780 <yield>
		}
    15fe:	e7dc      	b.n	15ba <delay+0x42>
    1600:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    1604:	1fff93b8 	.word	0x1fff93b8
    1608:	e000e018 	.word	0xe000e018
    160c:	e000ed04 	.word	0xe000ed04
    1610:	88888889 	.word	0x88888889

00001614 <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
    1614:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    1616:	2b03      	cmp	r3, #3
    1618:	d814      	bhi.n	1644 <usb_rx+0x30>
	__disable_irq();
    161a:	b672      	cpsid	i
	ret = rx_first[endpoint];
    161c:	490a      	ldr	r1, [pc, #40]	; (1648 <usb_rx+0x34>)
    161e:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
    1622:	b168      	cbz	r0, 1640 <usb_rx+0x2c>
{
    1624:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
    1626:	4c09      	ldr	r4, [pc, #36]	; (164c <usb_rx+0x38>)
    1628:	8805      	ldrh	r5, [r0, #0]
    162a:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
    162e:	6846      	ldr	r6, [r0, #4]
    1630:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
    1634:	1b52      	subs	r2, r2, r5
    1636:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
    163a:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
    163c:	bc70      	pop	{r4, r5, r6}
    163e:	4770      	bx	lr
	__enable_irq();
    1640:	b662      	cpsie	i
}
    1642:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    1644:	2000      	movs	r0, #0
    1646:	4770      	bx	lr
    1648:	1fff9414 	.word	0x1fff9414
    164c:	1fff9698 	.word	0x1fff9698

00001650 <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
    1650:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
    1652:	2803      	cmp	r0, #3
    1654:	d80b      	bhi.n	166e <usb_tx_packet_count+0x1e>
	__disable_irq();
    1656:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
    1658:	4b07      	ldr	r3, [pc, #28]	; (1678 <usb_tx_packet_count+0x28>)
    165a:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
    165e:	b143      	cbz	r3, 1672 <usb_tx_packet_count+0x22>
    1660:	2000      	movs	r0, #0
    1662:	685b      	ldr	r3, [r3, #4]
    1664:	3001      	adds	r0, #1
    1666:	2b00      	cmp	r3, #0
    1668:	d1fb      	bne.n	1662 <usb_tx_packet_count+0x12>
	__enable_irq();
    166a:	b662      	cpsie	i
	return count;
    166c:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
    166e:	2000      	movs	r0, #0
}
    1670:	4770      	bx	lr
	uint32_t count=0;
    1672:	4618      	mov	r0, r3
    1674:	e7f9      	b.n	166a <usb_tx_packet_count+0x1a>
    1676:	bf00      	nop
    1678:	1fff9468 	.word	0x1fff9468

0000167c <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
    167c:	b430      	push	{r4, r5}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
    167e:	b672      	cpsid	i
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1680:	4a2b      	ldr	r2, [pc, #172]	; (1730 <usb_rx_memory+0xb4>)
    1682:	7813      	ldrb	r3, [r2, #0]
    1684:	071d      	lsls	r5, r3, #28
    1686:	d506      	bpl.n	1696 <usb_rx_memory+0x1a>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1688:	4b2a      	ldr	r3, [pc, #168]	; (1734 <usb_rx_memory+0xb8>)
    168a:	6a19      	ldr	r1, [r3, #32]
    168c:	2900      	cmp	r1, #0
    168e:	d036      	beq.n	16fe <usb_rx_memory+0x82>
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
    1690:	6a99      	ldr	r1, [r3, #40]	; 0x28
    1692:	2900      	cmp	r1, #0
    1694:	d041      	beq.n	171a <usb_rx_memory+0x9e>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1696:	7853      	ldrb	r3, [r2, #1]
    1698:	071c      	lsls	r4, r3, #28
    169a:	d506      	bpl.n	16aa <usb_rx_memory+0x2e>
			if (table[index(i, RX, EVEN)].desc == 0) {
    169c:	4b25      	ldr	r3, [pc, #148]	; (1734 <usb_rx_memory+0xb8>)
    169e:	6c19      	ldr	r1, [r3, #64]	; 0x40
    16a0:	2900      	cmp	r1, #0
    16a2:	d03e      	beq.n	1722 <usb_rx_memory+0xa6>
			if (table[index(i, RX, ODD)].desc == 0) {
    16a4:	6c99      	ldr	r1, [r3, #72]	; 0x48
    16a6:	2900      	cmp	r1, #0
    16a8:	d039      	beq.n	171e <usb_rx_memory+0xa2>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    16aa:	7893      	ldrb	r3, [r2, #2]
    16ac:	0719      	lsls	r1, r3, #28
    16ae:	d505      	bpl.n	16bc <usb_rx_memory+0x40>
			if (table[index(i, RX, EVEN)].desc == 0) {
    16b0:	4b20      	ldr	r3, [pc, #128]	; (1734 <usb_rx_memory+0xb8>)
    16b2:	6e19      	ldr	r1, [r3, #96]	; 0x60
    16b4:	2900      	cmp	r1, #0
    16b6:	d036      	beq.n	1726 <usb_rx_memory+0xaa>
			if (table[index(i, RX, ODD)].desc == 0) {
    16b8:	6e99      	ldr	r1, [r3, #104]	; 0x68
    16ba:	b189      	cbz	r1, 16e0 <usb_rx_memory+0x64>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    16bc:	78d3      	ldrb	r3, [r2, #3]
    16be:	071b      	lsls	r3, r3, #28
    16c0:	d507      	bpl.n	16d2 <usb_rx_memory+0x56>
			if (table[index(i, RX, EVEN)].desc == 0) {
    16c2:	4b1c      	ldr	r3, [pc, #112]	; (1734 <usb_rx_memory+0xb8>)
    16c4:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
    16c8:	b37a      	cbz	r2, 172a <usb_rx_memory+0xae>
			if (table[index(i, RX, ODD)].desc == 0) {
    16ca:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
    16ce:	2111      	movs	r1, #17
    16d0:	b13a      	cbz	r2, 16e2 <usb_rx_memory+0x66>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
    16d2:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
    16d4:	4b18      	ldr	r3, [pc, #96]	; (1738 <usb_rx_memory+0xbc>)
    16d6:	2200      	movs	r2, #0
    16d8:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
    16da:	bc30      	pop	{r4, r5}
	usb_free(packet);
    16dc:	f000 be70 	b.w	23c0 <usb_free>
			if (table[index(i, RX, ODD)].desc == 0) {
    16e0:	210d      	movs	r1, #13
				usb_rx_memory_needed--;
    16e2:	4c15      	ldr	r4, [pc, #84]	; (1738 <usb_rx_memory+0xbc>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    16e4:	4d15      	ldr	r5, [pc, #84]	; (173c <usb_rx_memory+0xc0>)
				usb_rx_memory_needed--;
    16e6:	7822      	ldrb	r2, [r4, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    16e8:	f843 5031 	str.w	r5, [r3, r1, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
    16ec:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
    16f0:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    16f2:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
    16f4:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    16f6:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    16f8:	b662      	cpsie	i
}
    16fa:	bc30      	pop	{r4, r5}
    16fc:	4770      	bx	lr
			if (table[index(i, RX, EVEN)].desc == 0) {
    16fe:	2204      	movs	r2, #4
				usb_rx_memory_needed--;
    1700:	4c0d      	ldr	r4, [pc, #52]	; (1738 <usb_rx_memory+0xbc>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1702:	4d0f      	ldr	r5, [pc, #60]	; (1740 <usb_rx_memory+0xc4>)
				usb_rx_memory_needed--;
    1704:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1706:	f843 5032 	str.w	r5, [r3, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
    170a:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    170e:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    1710:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
    1712:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    1714:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    1716:	b662      	cpsie	i
				return;
    1718:	e7ef      	b.n	16fa <usb_rx_memory+0x7e>
			if (table[index(i, RX, ODD)].desc == 0) {
    171a:	2105      	movs	r1, #5
    171c:	e7e1      	b.n	16e2 <usb_rx_memory+0x66>
    171e:	2109      	movs	r1, #9
    1720:	e7df      	b.n	16e2 <usb_rx_memory+0x66>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1722:	2208      	movs	r2, #8
    1724:	e7ec      	b.n	1700 <usb_rx_memory+0x84>
    1726:	220c      	movs	r2, #12
    1728:	e7ea      	b.n	1700 <usb_rx_memory+0x84>
    172a:	2210      	movs	r2, #16
    172c:	e7e8      	b.n	1700 <usb_rx_memory+0x84>
    172e:	bf00      	nop
    1730:	000049ac 	.word	0x000049ac
    1734:	1fff8000 	.word	0x1fff8000
    1738:	1fff9491 	.word	0x1fff9491
    173c:	004000c8 	.word	0x004000c8
    1740:	00400088 	.word	0x00400088

00001744 <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
    1744:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
    1746:	2b03      	cmp	r3, #3
    1748:	d81d      	bhi.n	1786 <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    174a:	4a1b      	ldr	r2, [pc, #108]	; (17b8 <usb_tx+0x74>)
    174c:	0140      	lsls	r0, r0, #5
    174e:	f040 0010 	orr.w	r0, r0, #16
{
    1752:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    1754:	4410      	add	r0, r2
	__disable_irq();
    1756:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
    1758:	4c18      	ldr	r4, [pc, #96]	; (17bc <usb_tx+0x78>)
    175a:	5ce2      	ldrb	r2, [r4, r3]
    175c:	2a03      	cmp	r2, #3
    175e:	d81b      	bhi.n	1798 <usb_tx+0x54>
    1760:	e8df f002 	tbb	[pc, r2]
    1764:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
    1768:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    176a:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
    176c:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    176e:	f010 0f08 	tst.w	r0, #8
    1772:	bf14      	ite	ne
    1774:	23c8      	movne	r3, #200	; 0xc8
    1776:	2388      	moveq	r3, #136	; 0x88
    1778:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
    177c:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    177e:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
    1780:	6041      	str	r1, [r0, #4]
	__enable_irq();
    1782:	b662      	cpsie	i
}
    1784:	bc30      	pop	{r4, r5}
    1786:	4770      	bx	lr
		b++;
    1788:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
    178a:	2202      	movs	r2, #2
		break;
    178c:	e7ed      	b.n	176a <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
    178e:	2205      	movs	r2, #5
    1790:	e7eb      	b.n	176a <usb_tx+0x26>
		b++;
    1792:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
    1794:	2204      	movs	r2, #4
		break;
    1796:	e7e8      	b.n	176a <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
    1798:	4a09      	ldr	r2, [pc, #36]	; (17c0 <usb_tx+0x7c>)
    179a:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    179e:	b138      	cbz	r0, 17b0 <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
    17a0:	4a08      	ldr	r2, [pc, #32]	; (17c4 <usb_tx+0x80>)
    17a2:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    17a6:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
    17a8:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
    17ac:	b662      	cpsie	i
		return;
    17ae:	e7e9      	b.n	1784 <usb_tx+0x40>
			tx_first[endpoint] = packet;
    17b0:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    17b4:	4a03      	ldr	r2, [pc, #12]	; (17c4 <usb_tx+0x80>)
    17b6:	e7f7      	b.n	17a8 <usb_tx+0x64>
    17b8:	1fff8000 	.word	0x1fff8000
    17bc:	1fff94a0 	.word	0x1fff94a0
    17c0:	1fff9468 	.word	0x1fff9468
    17c4:	1fff9478 	.word	0x1fff9478

000017c8 <usb_isr>:
}



void usb_isr(void)
{
    17c8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
    17cc:	f8df b30c 	ldr.w	fp, [pc, #780]	; 1adc <usb_isr+0x314>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
    17d0:	f8df a30c 	ldr.w	sl, [pc, #780]	; 1ae0 <usb_isr+0x318>
{
    17d4:	b087      	sub	sp, #28
    17d6:	e044      	b.n	1862 <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
    17d8:	4fab      	ldr	r7, [pc, #684]	; (1a88 <usb_isr+0x2c0>)
    17da:	ea4f 0893 	mov.w	r8, r3, lsr #2
    17de:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
    17e2:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    17e4:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
    17e8:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
    17ec:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    17ee:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
    17f2:	f003 04ff 	and.w	r4, r3, #255	; 0xff
    17f6:	2b00      	cmp	r3, #0
    17f8:	f040 8102 	bne.w	1a00 <usb_isr+0x238>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
    17fc:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
    1800:	0c1b      	lsrs	r3, r3, #16
    1802:	b299      	uxth	r1, r3
    1804:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
    1808:	2b00      	cmp	r3, #0
    180a:	f000 80f0 	beq.w	19ee <usb_isr+0x226>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
    180e:	4b9f      	ldr	r3, [pc, #636]	; (1a8c <usb_isr+0x2c4>)
					packet->index = 0;
    1810:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    1814:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    1818:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    181c:	2a00      	cmp	r2, #0
    181e:	f000 82c5 	beq.w	1dac <usb_isr+0x5e4>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    1822:	4d9b      	ldr	r5, [pc, #620]	; (1a90 <usb_isr+0x2c8>)
    1824:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    1828:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    182a:	4c9a      	ldr	r4, [pc, #616]	; (1a94 <usb_isr+0x2cc>)
					rx_last[endpoint] = packet;
    182c:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    1830:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    1834:	4419      	add	r1, r3
    1836:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    183a:	f000 fda1 	bl	2380 <usb_malloc>
					if (packet) {
    183e:	2800      	cmp	r0, #0
    1840:	f000 82ad 	beq.w	1d9e <usb_isr+0x5d6>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    1844:	4a94      	ldr	r2, [pc, #592]	; (1a98 <usb_isr+0x2d0>)
    1846:	4b95      	ldr	r3, [pc, #596]	; (1a9c <usb_isr+0x2d4>)
    1848:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    184c:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    1850:	bf18      	it	ne
    1852:	4613      	movne	r3, r2
						b->addr = packet->buf;
    1854:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    1858:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    185c:	2308      	movs	r3, #8
    185e:	f88b 3000 	strb.w	r3, [fp]
	status = USB0_ISTAT;
    1862:	f89b 4000 	ldrb.w	r4, [fp]
    1866:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    1868:	0761      	lsls	r1, r4, #29
    186a:	d51a      	bpl.n	18a2 <usb_isr+0xda>
		if (usb_configuration) {
    186c:	4b8c      	ldr	r3, [pc, #560]	; (1aa0 <usb_isr+0x2d8>)
    186e:	781b      	ldrb	r3, [r3, #0]
    1870:	b1a3      	cbz	r3, 189c <usb_isr+0xd4>
			t = usb_reboot_timer;
    1872:	498c      	ldr	r1, [pc, #560]	; (1aa4 <usb_isr+0x2dc>)
    1874:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    1876:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    187a:	b122      	cbz	r2, 1886 <usb_isr+0xbe>
				usb_reboot_timer = --t;
    187c:	3b01      	subs	r3, #1
    187e:	b2db      	uxtb	r3, r3
    1880:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    1882:	b903      	cbnz	r3, 1886 <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    1884:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    1886:	4988      	ldr	r1, [pc, #544]	; (1aa8 <usb_isr+0x2e0>)
    1888:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    188a:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    188e:	b12a      	cbz	r2, 189c <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    1890:	3b01      	subs	r3, #1
    1892:	b2db      	uxtb	r3, r3
    1894:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    1896:	2b00      	cmp	r3, #0
    1898:	f000 8257 	beq.w	1d4a <usb_isr+0x582>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    189c:	2304      	movs	r3, #4
    189e:	f88b 3000 	strb.w	r3, [fp]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    18a2:	f004 0308 	and.w	r3, r4, #8
    18a6:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    18aa:	2b00      	cmp	r3, #0
    18ac:	f000 80cc 	beq.w	1a48 <usb_isr+0x280>
		stat = USB0_STAT;
    18b0:	f89a 3000 	ldrb.w	r3, [sl]
    18b4:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    18b6:	091e      	lsrs	r6, r3, #4
    18b8:	d18e      	bne.n	17d8 <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    18ba:	089c      	lsrs	r4, r3, #2
    18bc:	f8df 91c8 	ldr.w	r9, [pc, #456]	; 1a88 <usb_isr+0x2c0>
	switch (pid) {
    18c0:	f859 2034 	ldr.w	r2, [r9, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    18c4:	eb09 01c4 	add.w	r1, r9, r4, lsl #3
	switch (pid) {
    18c8:	f3c2 0283 	ubfx	r2, r2, #2, #4
    18cc:	3a01      	subs	r2, #1
	buf = b->addr;
    18ce:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    18d0:	2a0c      	cmp	r2, #12
    18d2:	f200 8088 	bhi.w	19e6 <usb_isr+0x21e>
    18d6:	e8df f002 	tbb	[pc, r2]
    18da:	7c7c      	.short	0x7c7c
    18dc:	86868686 	.word	0x86868686
    18e0:	86478686 	.word	0x86478686
    18e4:	8686      	.short	0x8686
    18e6:	07          	.byte	0x07
    18e7:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    18e8:	6808      	ldr	r0, [r1, #0]
    18ea:	4d70      	ldr	r5, [pc, #448]	; (1aac <usb_isr+0x2e4>)
		setup.word2 = *(uint32_t *)(buf + 4);
    18ec:	684a      	ldr	r2, [r1, #4]
		ep0_tx_ptr = NULL;
    18ee:	4f70      	ldr	r7, [pc, #448]	; (1ab0 <usb_isr+0x2e8>)
		ep0_tx_data_toggle = 1;
    18f0:	4e70      	ldr	r6, [pc, #448]	; (1ab4 <usb_isr+0x2ec>)
		setup.word1 = *(uint32_t *)(buf);
    18f2:	6028      	str	r0, [r5, #0]
	switch (setup.wRequestAndType) {
    18f4:	b281      	uxth	r1, r0
    18f6:	f240 6081 	movw	r0, #1665	; 0x681
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    18fa:	4b67      	ldr	r3, [pc, #412]	; (1a98 <usb_isr+0x2d0>)
		setup.word2 = *(uint32_t *)(buf + 4);
    18fc:	606a      	str	r2, [r5, #4]
		ep0_tx_data_toggle = 1;
    18fe:	f04f 0e01 	mov.w	lr, #1
		ep0_tx_ptr = NULL;
    1902:	2200      	movs	r2, #0
	switch (setup.wRequestAndType) {
    1904:	4281      	cmp	r1, r0
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    1906:	f849 3034 	str.w	r3, [r9, r4, lsl #3]
		ep0_tx_ptr = NULL;
    190a:	603a      	str	r2, [r7, #0]
		table[index(0, TX, EVEN)].desc = 0;
    190c:	f8c9 2010 	str.w	r2, [r9, #16]
		table[index(0, TX, ODD)].desc = 0;
    1910:	f8c9 2018 	str.w	r2, [r9, #24]
		ep0_tx_data_toggle = 1;
    1914:	f886 e000 	strb.w	lr, [r6]
		table[index(0, TX, EVEN)].desc = 0;
    1918:	4c5b      	ldr	r4, [pc, #364]	; (1a88 <usb_isr+0x2c0>)
	switch (setup.wRequestAndType) {
    191a:	f200 80e3 	bhi.w	1ae4 <usb_isr+0x31c>
    191e:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    1922:	f080 8346 	bcs.w	1fb2 <usb_isr+0x7ea>
    1926:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    192a:	f000 82fc 	beq.w	1f26 <usb_isr+0x75e>
    192e:	f200 828d 	bhi.w	1e4c <usb_isr+0x684>
    1932:	2980      	cmp	r1, #128	; 0x80
    1934:	f000 8377 	beq.w	2026 <usb_isr+0x85e>
    1938:	2982      	cmp	r1, #130	; 0x82
    193a:	f040 82fa 	bne.w	1f32 <usb_isr+0x76a>
    193e:	88a9      	ldrh	r1, [r5, #4]
    1940:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    1944:	2904      	cmp	r1, #4
    1946:	f200 82f4 	bhi.w	1f32 <usb_isr+0x76a>
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    194a:	485b      	ldr	r0, [pc, #364]	; (1ab8 <usb_isr+0x2f0>)
		reply_buffer[0] = 0;
    194c:	4c5b      	ldr	r4, [pc, #364]	; (1abc <usb_isr+0x2f4>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    194e:	0089      	lsls	r1, r1, #2
    1950:	4408      	add	r0, r1
		reply_buffer[0] = 0;
    1952:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1954:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1956:	7802      	ldrb	r2, [r0, #0]
    1958:	0793      	lsls	r3, r2, #30
    195a:	f140 8455 	bpl.w	2208 <usb_isr+0xa40>
    195e:	f884 e000 	strb.w	lr, [r4]
		datalen = 2;
    1962:	f04f 0e02 	mov.w	lr, #2
    1966:	e342      	b.n	1fee <usb_isr+0x826>
		data = ep0_tx_ptr;
    1968:	4f51      	ldr	r7, [pc, #324]	; (1ab0 <usb_isr+0x2e8>)
    196a:	683a      	ldr	r2, [r7, #0]
		if (data) {
    196c:	b332      	cbz	r2, 19bc <usb_isr+0x1f4>
			size = ep0_tx_len;
    196e:	4b54      	ldr	r3, [pc, #336]	; (1ac0 <usb_isr+0x2f8>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1970:	4e50      	ldr	r6, [pc, #320]	; (1ab4 <usb_isr+0x2ec>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1972:	4954      	ldr	r1, [pc, #336]	; (1ac4 <usb_isr+0x2fc>)
			size = ep0_tx_len;
    1974:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1976:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1978:	780d      	ldrb	r5, [r1, #0]
    197a:	2840      	cmp	r0, #64	; 0x40
    197c:	4686      	mov	lr, r0
    197e:	f045 0802 	orr.w	r8, r5, #2
    1982:	bf28      	it	cs
    1984:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1988:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    198a:	f084 0401 	eor.w	r4, r4, #1
    198e:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    1990:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1994:	bf0c      	ite	eq
    1996:	2488      	moveq	r4, #136	; 0x88
    1998:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    199a:	eb09 06c8 	add.w	r6, r9, r8, lsl #3
			ep0_tx_len -= size;
    199e:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    19a0:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19a4:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    19a8:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    19aa:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19ac:	f849 4038 	str.w	r4, [r9, r8, lsl #3]
			data += size;
    19b0:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    19b2:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    19b4:	2800      	cmp	r0, #0
    19b6:	f000 8145 	beq.w	1c44 <usb_isr+0x47c>
    19ba:	603a      	str	r2, [r7, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    19bc:	4b3b      	ldr	r3, [pc, #236]	; (1aac <usb_isr+0x2e4>)
    19be:	881a      	ldrh	r2, [r3, #0]
    19c0:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    19c4:	d10f      	bne.n	19e6 <usb_isr+0x21e>
			setup.bRequest = 0;
    19c6:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    19c8:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    19ca:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    19cc:	4b3e      	ldr	r3, [pc, #248]	; (1ac8 <usb_isr+0x300>)
    19ce:	701a      	strb	r2, [r3, #0]
    19d0:	e009      	b.n	19e6 <usb_isr+0x21e>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    19d2:	4a36      	ldr	r2, [pc, #216]	; (1aac <usb_isr+0x2e4>)
    19d4:	8810      	ldrh	r0, [r2, #0]
    19d6:	f242 0221 	movw	r2, #8225	; 0x2021
    19da:	4290      	cmp	r0, r2
    19dc:	f000 8137 	beq.w	1c4e <usb_isr+0x486>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    19e0:	4a2d      	ldr	r2, [pc, #180]	; (1a98 <usb_isr+0x2d0>)
    19e2:	f849 2034 	str.w	r2, [r9, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    19e6:	4a39      	ldr	r2, [pc, #228]	; (1acc <usb_isr+0x304>)
    19e8:	2301      	movs	r3, #1
    19ea:	7013      	strb	r3, [r2, #0]
    19ec:	e736      	b.n	185c <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    19ee:	4a2a      	ldr	r2, [pc, #168]	; (1a98 <usb_isr+0x2d0>)
    19f0:	4b2a      	ldr	r3, [pc, #168]	; (1a9c <usb_isr+0x2d4>)
    19f2:	f019 0f08 	tst.w	r9, #8
    19f6:	bf18      	it	ne
    19f8:	4613      	movne	r3, r2
    19fa:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    19fe:	e72d      	b.n	185c <usb_isr+0x94>
				usb_free(packet);
    1a00:	f000 fcde 	bl	23c0 <usb_free>
				packet = tx_first[endpoint];
    1a04:	4a32      	ldr	r2, [pc, #200]	; (1ad0 <usb_isr+0x308>)
					switch (tx_state[endpoint]) {
    1a06:	4933      	ldr	r1, [pc, #204]	; (1ad4 <usb_isr+0x30c>)
				packet = tx_first[endpoint];
    1a08:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    1a0c:	2b00      	cmp	r3, #0
    1a0e:	f000 81d1 	beq.w	1db4 <usb_isr+0x5ec>
					tx_first[endpoint] = packet->next;
    1a12:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    1a14:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    1a16:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    1a1a:	f103 0208 	add.w	r2, r3, #8
    1a1e:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    1a22:	2c03      	cmp	r4, #3
    1a24:	d805      	bhi.n	1a32 <usb_isr+0x26a>
    1a26:	e8df f004 	tbb	[pc, r4]
    1a2a:	022c      	.short	0x022c
    1a2c:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    1a2e:	2202      	movs	r2, #2
    1a30:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    1a32:	881a      	ldrh	r2, [r3, #0]
    1a34:	f019 0f08 	tst.w	r9, #8
    1a38:	bf0c      	ite	eq
    1a3a:	2388      	moveq	r3, #136	; 0x88
    1a3c:	23c8      	movne	r3, #200	; 0xc8
    1a3e:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    1a42:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    1a46:	e709      	b.n	185c <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    1a48:	07e0      	lsls	r0, r4, #31
    1a4a:	f100 8181 	bmi.w	1d50 <usb_isr+0x588>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    1a4e:	0621      	lsls	r1, r4, #24
    1a50:	f100 81f2 	bmi.w	1e38 <usb_isr+0x670>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1a54:	07a2      	lsls	r2, r4, #30
    1a56:	d506      	bpl.n	1a66 <usb_isr+0x29e>
		uint8_t err = USB0_ERRSTAT;
    1a58:	4a1f      	ldr	r2, [pc, #124]	; (1ad8 <usb_isr+0x310>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    1a5a:	4920      	ldr	r1, [pc, #128]	; (1adc <usb_isr+0x314>)
		uint8_t err = USB0_ERRSTAT;
    1a5c:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1a5e:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    1a60:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    1a62:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1a64:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    1a66:	06e3      	lsls	r3, r4, #27
    1a68:	d502      	bpl.n	1a70 <usb_isr+0x2a8>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    1a6a:	4b1c      	ldr	r3, [pc, #112]	; (1adc <usb_isr+0x314>)
    1a6c:	2210      	movs	r2, #16
    1a6e:	701a      	strb	r2, [r3, #0]
	}

}
    1a70:	b007      	add	sp, #28
    1a72:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    1a76:	2204      	movs	r2, #4
    1a78:	558a      	strb	r2, [r1, r6]
						break;
    1a7a:	e7da      	b.n	1a32 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    1a7c:	2205      	movs	r2, #5
    1a7e:	558a      	strb	r2, [r1, r6]
						break;
    1a80:	e7d7      	b.n	1a32 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    1a82:	2203      	movs	r2, #3
    1a84:	558a      	strb	r2, [r1, r6]
						break;
    1a86:	e7d4      	b.n	1a32 <usb_isr+0x26a>
    1a88:	1fff8000 	.word	0x1fff8000
    1a8c:	1fff9414 	.word	0x1fff9414
    1a90:	1fff93c0 	.word	0x1fff93c0
    1a94:	1fff9698 	.word	0x1fff9698
    1a98:	004000c8 	.word	0x004000c8
    1a9c:	00400088 	.word	0x00400088
    1aa0:	1fff949c 	.word	0x1fff949c
    1aa4:	1fff9425 	.word	0x1fff9425
    1aa8:	1fff94a4 	.word	0x1fff94a4
    1aac:	1fff9488 	.word	0x1fff9488
    1ab0:	1fff93bc 	.word	0x1fff93bc
    1ab4:	1fff9424 	.word	0x1fff9424
    1ab8:	400720c0 	.word	0x400720c0
    1abc:	1fff9494 	.word	0x1fff9494
    1ac0:	1fff93d0 	.word	0x1fff93d0
    1ac4:	1fff9490 	.word	0x1fff9490
    1ac8:	40072098 	.word	0x40072098
    1acc:	40072094 	.word	0x40072094
    1ad0:	1fff9468 	.word	0x1fff9468
    1ad4:	1fff94a0 	.word	0x1fff94a0
    1ad8:	40072088 	.word	0x40072088
    1adc:	40072080 	.word	0x40072080
    1ae0:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    1ae4:	f242 0021 	movw	r0, #8225	; 0x2021
    1ae8:	4281      	cmp	r1, r0
    1aea:	f000 812a 	beq.w	1d42 <usb_isr+0x57a>
    1aee:	f200 80d8 	bhi.w	1ca2 <usb_isr+0x4da>
    1af2:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    1af6:	f000 8276 	beq.w	1fe6 <usb_isr+0x81e>
    1afa:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    1afe:	f040 8218 	bne.w	1f32 <usb_isr+0x76a>
			if (table[i].desc & BDT_OWN) {
    1b02:	6a22      	ldr	r2, [r4, #32]
		usb_configuration = setup.wValue;
    1b04:	49b3      	ldr	r1, [pc, #716]	; (1dd4 <usb_isr+0x60c>)
    1b06:	78a8      	ldrb	r0, [r5, #2]
    1b08:	7008      	strb	r0, [r1, #0]
			if (table[i].desc & BDT_OWN) {
    1b0a:	0612      	lsls	r2, r2, #24
    1b0c:	f100 8337 	bmi.w	217e <usb_isr+0x9b6>
    1b10:	f8d9 2028 	ldr.w	r2, [r9, #40]	; 0x28
    1b14:	49b0      	ldr	r1, [pc, #704]	; (1dd8 <usb_isr+0x610>)
    1b16:	0613      	lsls	r3, r2, #24
    1b18:	f100 832c 	bmi.w	2174 <usb_isr+0x9ac>
    1b1c:	f8d9 2030 	ldr.w	r2, [r9, #48]	; 0x30
    1b20:	49ad      	ldr	r1, [pc, #692]	; (1dd8 <usb_isr+0x610>)
    1b22:	0615      	lsls	r5, r2, #24
    1b24:	f100 82ff 	bmi.w	2126 <usb_isr+0x95e>
    1b28:	f8d9 2038 	ldr.w	r2, [r9, #56]	; 0x38
    1b2c:	49aa      	ldr	r1, [pc, #680]	; (1dd8 <usb_isr+0x610>)
    1b2e:	0614      	lsls	r4, r2, #24
    1b30:	f100 82f4 	bmi.w	211c <usb_isr+0x954>
    1b34:	f8d9 2040 	ldr.w	r2, [r9, #64]	; 0x40
    1b38:	49a7      	ldr	r1, [pc, #668]	; (1dd8 <usb_isr+0x610>)
    1b3a:	0610      	lsls	r0, r2, #24
    1b3c:	f100 8347 	bmi.w	21ce <usb_isr+0xa06>
    1b40:	f8d9 2048 	ldr.w	r2, [r9, #72]	; 0x48
    1b44:	49a4      	ldr	r1, [pc, #656]	; (1dd8 <usb_isr+0x610>)
    1b46:	0612      	lsls	r2, r2, #24
    1b48:	f100 833c 	bmi.w	21c4 <usb_isr+0x9fc>
    1b4c:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
    1b50:	49a1      	ldr	r1, [pc, #644]	; (1dd8 <usb_isr+0x610>)
    1b52:	0613      	lsls	r3, r2, #24
    1b54:	f100 8331 	bmi.w	21ba <usb_isr+0x9f2>
    1b58:	f8d9 2058 	ldr.w	r2, [r9, #88]	; 0x58
    1b5c:	499e      	ldr	r1, [pc, #632]	; (1dd8 <usb_isr+0x610>)
    1b5e:	0615      	lsls	r5, r2, #24
    1b60:	f100 8326 	bmi.w	21b0 <usb_isr+0x9e8>
    1b64:	f8d9 2060 	ldr.w	r2, [r9, #96]	; 0x60
    1b68:	499b      	ldr	r1, [pc, #620]	; (1dd8 <usb_isr+0x610>)
    1b6a:	0614      	lsls	r4, r2, #24
    1b6c:	f100 831b 	bmi.w	21a6 <usb_isr+0x9de>
    1b70:	f8d9 2068 	ldr.w	r2, [r9, #104]	; 0x68
    1b74:	4998      	ldr	r1, [pc, #608]	; (1dd8 <usb_isr+0x610>)
    1b76:	0610      	lsls	r0, r2, #24
    1b78:	f100 8310 	bmi.w	219c <usb_isr+0x9d4>
    1b7c:	f8d9 2070 	ldr.w	r2, [r9, #112]	; 0x70
    1b80:	4995      	ldr	r1, [pc, #596]	; (1dd8 <usb_isr+0x610>)
    1b82:	0612      	lsls	r2, r2, #24
    1b84:	f100 8305 	bmi.w	2192 <usb_isr+0x9ca>
    1b88:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    1b8c:	4992      	ldr	r1, [pc, #584]	; (1dd8 <usb_isr+0x610>)
    1b8e:	0613      	lsls	r3, r2, #24
    1b90:	f100 82fa 	bmi.w	2188 <usb_isr+0x9c0>
    1b94:	f8d9 2080 	ldr.w	r2, [r9, #128]	; 0x80
    1b98:	498f      	ldr	r1, [pc, #572]	; (1dd8 <usb_isr+0x610>)
    1b9a:	0615      	lsls	r5, r2, #24
    1b9c:	f100 832e 	bmi.w	21fc <usb_isr+0xa34>
    1ba0:	f8d9 2088 	ldr.w	r2, [r9, #136]	; 0x88
    1ba4:	498c      	ldr	r1, [pc, #560]	; (1dd8 <usb_isr+0x610>)
    1ba6:	0614      	lsls	r4, r2, #24
    1ba8:	f100 8322 	bmi.w	21f0 <usb_isr+0xa28>
    1bac:	f8d9 2090 	ldr.w	r2, [r9, #144]	; 0x90
    1bb0:	4989      	ldr	r1, [pc, #548]	; (1dd8 <usb_isr+0x610>)
    1bb2:	0610      	lsls	r0, r2, #24
    1bb4:	f100 8316 	bmi.w	21e4 <usb_isr+0xa1c>
    1bb8:	f8d9 2098 	ldr.w	r2, [r9, #152]	; 0x98
    1bbc:	4986      	ldr	r1, [pc, #536]	; (1dd8 <usb_isr+0x610>)
    1bbe:	0612      	lsls	r2, r2, #24
    1bc0:	f100 830a 	bmi.w	21d8 <usb_isr+0xa10>
    1bc4:	4885      	ldr	r0, [pc, #532]	; (1ddc <usb_isr+0x614>)
    1bc6:	4a86      	ldr	r2, [pc, #536]	; (1de0 <usb_isr+0x618>)
    1bc8:	4986      	ldr	r1, [pc, #536]	; (1de4 <usb_isr+0x61c>)
    1bca:	9001      	str	r0, [sp, #4]
    1bcc:	4886      	ldr	r0, [pc, #536]	; (1de8 <usb_isr+0x620>)
    1bce:	4c87      	ldr	r4, [pc, #540]	; (1dec <usb_isr+0x624>)
    1bd0:	4d87      	ldr	r5, [pc, #540]	; (1df0 <usb_isr+0x628>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1bd2:	9402      	str	r4, [sp, #8]
{
    1bd4:	2300      	movs	r3, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1bd6:	9704      	str	r7, [sp, #16]
    1bd8:	9605      	str	r6, [sp, #20]
    1bda:	4680      	mov	r8, r0
    1bdc:	461c      	mov	r4, r3
    1bde:	460f      	mov	r7, r1
    1be0:	4616      	mov	r6, r2
    1be2:	9503      	str	r5, [sp, #12]
			p = rx_first[i];
    1be4:	6830      	ldr	r0, [r6, #0]
			while (p) {
    1be6:	b128      	cbz	r0, 1bf4 <usb_isr+0x42c>
				n = p->next;
    1be8:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    1bea:	f000 fbe9 	bl	23c0 <usb_free>
			while (p) {
    1bee:	4628      	mov	r0, r5
    1bf0:	2d00      	cmp	r5, #0
    1bf2:	d1f9      	bne.n	1be8 <usb_isr+0x420>
			rx_first[i] = NULL;
    1bf4:	2300      	movs	r3, #0
    1bf6:	6033      	str	r3, [r6, #0]
			rx_last[i] = NULL;
    1bf8:	9b03      	ldr	r3, [sp, #12]
			p = tx_first[i];
    1bfa:	6838      	ldr	r0, [r7, #0]
			rx_last[i] = NULL;
    1bfc:	461a      	mov	r2, r3
    1bfe:	2300      	movs	r3, #0
    1c00:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
			while (p) {
    1c04:	b128      	cbz	r0, 1c12 <usb_isr+0x44a>
				n = p->next;
    1c06:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    1c08:	f000 fbda 	bl	23c0 <usb_free>
			while (p) {
    1c0c:	4628      	mov	r0, r5
    1c0e:	2d00      	cmp	r5, #0
    1c10:	d1f9      	bne.n	1c06 <usb_isr+0x43e>
			tx_first[i] = NULL;
    1c12:	2200      	movs	r2, #0
    1c14:	603a      	str	r2, [r7, #0]
			tx_last[i] = NULL;
    1c16:	9a01      	ldr	r2, [sp, #4]
			switch (tx_state[i]) {
    1c18:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    1c1c:	4611      	mov	r1, r2
    1c1e:	2200      	movs	r2, #0
    1c20:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    1c24:	9a02      	ldr	r2, [sp, #8]
			tx_last[i] = NULL;
    1c26:	9101      	str	r1, [sp, #4]
			switch (tx_state[i]) {
    1c28:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    1c2a:	f04f 0100 	mov.w	r1, #0
    1c2e:	f822 1014 	strh.w	r1, [r2, r4, lsl #1]
			switch (tx_state[i]) {
    1c32:	2b03      	cmp	r3, #3
    1c34:	f200 812b 	bhi.w	1e8e <usb_isr+0x6c6>
    1c38:	e8df f013 	tbh	[pc, r3, lsl #1]
    1c3c:	01250170 	.word	0x01250170
    1c40:	01250170 	.word	0x01250170
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    1c44:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1c48:	bf18      	it	ne
    1c4a:	2200      	movne	r2, #0
    1c4c:	e6b5      	b.n	19ba <usb_isr+0x1f2>
				*dst++ = *buf++;
    1c4e:	4a69      	ldr	r2, [pc, #420]	; (1df4 <usb_isr+0x62c>)
    1c50:	780d      	ldrb	r5, [r1, #0]
    1c52:	7848      	ldrb	r0, [r1, #1]
    1c54:	7015      	strb	r5, [r2, #0]
    1c56:	7050      	strb	r0, [r2, #1]
    1c58:	788d      	ldrb	r5, [r1, #2]
    1c5a:	78c8      	ldrb	r0, [r1, #3]
    1c5c:	7095      	strb	r5, [r2, #2]
    1c5e:	70d0      	strb	r0, [r2, #3]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1c60:	6810      	ldr	r0, [r2, #0]
				*dst++ = *buf++;
    1c62:	790d      	ldrb	r5, [r1, #4]
    1c64:	7115      	strb	r5, [r2, #4]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1c66:	2886      	cmp	r0, #134	; 0x86
				*dst++ = *buf++;
    1c68:	794d      	ldrb	r5, [r1, #5]
    1c6a:	7989      	ldrb	r1, [r1, #6]
    1c6c:	7155      	strb	r5, [r2, #5]
    1c6e:	7191      	strb	r1, [r2, #6]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1c70:	f000 819b 	beq.w	1faa <usb_isr+0x7e2>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c74:	4960      	ldr	r1, [pc, #384]	; (1df8 <usb_isr+0x630>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c76:	4e61      	ldr	r6, [pc, #388]	; (1dfc <usb_isr+0x634>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c78:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c7a:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1c7c:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c80:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c82:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    1c86:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c88:	bf0c      	ite	eq
    1c8a:	2188      	moveq	r1, #136	; 0x88
    1c8c:	21c8      	movne	r1, #200	; 0xc8
    1c8e:	f849 1032 	str.w	r1, [r9, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c92:	eb09 02c2 	add.w	r2, r9, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    1c96:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c9a:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    1c9c:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c9e:	6051      	str	r1, [r2, #4]
    1ca0:	e69e      	b.n	19e0 <usb_isr+0x218>
	switch (setup.wRequestAndType) {
    1ca2:	f242 2021 	movw	r0, #8737	; 0x2221
    1ca6:	4281      	cmp	r1, r0
    1ca8:	f040 81cb 	bne.w	2042 <usb_isr+0x87a>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    1cac:	4b54      	ldr	r3, [pc, #336]	; (1e00 <usb_isr+0x638>)
    1cae:	4c55      	ldr	r4, [pc, #340]	; (1e04 <usb_isr+0x63c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    1cb0:	4955      	ldr	r1, [pc, #340]	; (1e08 <usb_isr+0x640>)
    1cb2:	78a8      	ldrb	r0, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    1cb4:	681d      	ldr	r5, [r3, #0]
    1cb6:	6025      	str	r5, [r4, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    1cb8:	f8cd e004 	str.w	lr, [sp, #4]
    1cbc:	7008      	strb	r0, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1cbe:	2000      	movs	r0, #0
    1cc0:	9002      	str	r0, [sp, #8]
    1cc2:	4680      	mov	r8, r0
    1cc4:	4684      	mov	ip, r0
    1cc6:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1cc8:	494b      	ldr	r1, [pc, #300]	; (1df8 <usb_isr+0x630>)
    1cca:	780d      	ldrb	r5, [r1, #0]
    1ccc:	f045 0e02 	orr.w	lr, r5, #2
    1cd0:	eb09 03ce 	add.w	r3, r9, lr, lsl #3
    1cd4:	9303      	str	r3, [sp, #12]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1cd6:	9b01      	ldr	r3, [sp, #4]
    1cd8:	2b00      	cmp	r3, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1cda:	9b03      	ldr	r3, [sp, #12]
    1cdc:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1cde:	bf0c      	ite	eq
    1ce0:	2488      	moveq	r4, #136	; 0x88
    1ce2:	24c8      	movne	r4, #200	; 0xc8
    1ce4:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    1ce8:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1cec:	f849 303e 	str.w	r3, [r9, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    1cf0:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1cf2:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1cf4:	f8df e0e0 	ldr.w	lr, [pc, #224]	; 1dd8 <usb_isr+0x610>
	ep0_tx_data_toggle ^= 1;
    1cf8:	4b40      	ldr	r3, [pc, #256]	; (1dfc <usb_isr+0x634>)
	ep0_tx_bdt_bank ^= 1;
    1cfa:	f8df 80fc 	ldr.w	r8, [pc, #252]	; 1df8 <usb_isr+0x630>
	if (datalen == 0 && size < EP0_SIZE) return;
    1cfe:	2800      	cmp	r0, #0
    1d00:	f040 811e 	bne.w	1f40 <usb_isr+0x778>
    1d04:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    1d08:	d11b      	bne.n	1d42 <usb_isr+0x57a>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1d0a:	f044 0c02 	orr.w	ip, r4, #2
    1d0e:	eb09 03cc 	add.w	r3, r9, ip, lsl #3
    1d12:	9c02      	ldr	r4, [sp, #8]
    1d14:	f8df e0c0 	ldr.w	lr, [pc, #192]	; 1dd8 <usb_isr+0x610>
    1d18:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1d1a:	2a00      	cmp	r2, #0
    1d1c:	f040 8126 	bne.w	1f6c <usb_isr+0x7a4>
    1d20:	0402      	lsls	r2, r0, #16
    1d22:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	ep0_tx_data_toggle ^= 1;
    1d26:	f89d 3004 	ldrb.w	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1d2a:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
	data += size;
    1d2e:	4404      	add	r4, r0
	ep0_tx_data_toggle ^= 1;
    1d30:	7033      	strb	r3, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1d32:	700d      	strb	r5, [r1, #0]
	data += size;
    1d34:	4623      	mov	r3, r4
	if (datalen == 0 && size < EP0_SIZE) return;
    1d36:	2840      	cmp	r0, #64	; 0x40
    1d38:	d103      	bne.n	1d42 <usb_isr+0x57a>
    1d3a:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    1d3c:	4a33      	ldr	r2, [pc, #204]	; (1e0c <usb_isr+0x644>)
	ep0_tx_ptr = data;
    1d3e:	603b      	str	r3, [r7, #0]
	ep0_tx_len = datalen;
    1d40:	8010      	strh	r0, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1d42:	4a33      	ldr	r2, [pc, #204]	; (1e10 <usb_isr+0x648>)
    1d44:	2301      	movs	r3, #1
    1d46:	7013      	strb	r3, [r2, #0]
    1d48:	e64d      	b.n	19e6 <usb_isr+0x21e>
				if (t == 0) usb_serial_flush_callback();
    1d4a:	f000 fcf5 	bl	2738 <usb_serial_flush_callback>
    1d4e:	e5a5      	b.n	189c <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1d50:	4b21      	ldr	r3, [pc, #132]	; (1dd8 <usb_isr+0x610>)
		USB0_CTL = USB_CTL_ODDRST;
    1d52:	482f      	ldr	r0, [pc, #188]	; (1e10 <usb_isr+0x648>)
		ep0_tx_bdt_bank = 0;
    1d54:	4928      	ldr	r1, [pc, #160]	; (1df8 <usb_isr+0x630>)
		table[index(0, TX, EVEN)].desc = 0;
    1d56:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    1d58:	f04f 0e02 	mov.w	lr, #2
    1d5c:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1d60:	4f2c      	ldr	r7, [pc, #176]	; (1e14 <usb_isr+0x64c>)
		ep0_tx_bdt_bank = 0;
    1d62:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1d64:	492c      	ldr	r1, [pc, #176]	; (1e18 <usb_isr+0x650>)
    1d66:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    1d68:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    1d6a:	4e2c      	ldr	r6, [pc, #176]	; (1e1c <usb_isr+0x654>)
		USB0_ISTAT = 0xFF;
    1d6c:	4d2c      	ldr	r5, [pc, #176]	; (1e20 <usb_isr+0x658>)
		USB0_ADDR = 0;
    1d6e:	4c2d      	ldr	r4, [pc, #180]	; (1e24 <usb_isr+0x65c>)
		table[index(0, TX, ODD)].desc = 0;
    1d70:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1d72:	210d      	movs	r1, #13
    1d74:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    1d76:	21ff      	movs	r1, #255	; 0xff
    1d78:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    1d7a:	f8df e0b8 	ldr.w	lr, [pc, #184]	; 1e34 <usb_isr+0x66c>
		USB0_ISTAT = 0xFF;
    1d7e:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    1d80:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1d82:	4d29      	ldr	r5, [pc, #164]	; (1e28 <usb_isr+0x660>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1d84:	4a29      	ldr	r2, [pc, #164]	; (1e2c <usb_isr+0x664>)
		USB0_ERREN = 0xFF;
    1d86:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1d8a:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    1d8c:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1d8e:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1d92:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    1d94:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1d96:	60da      	str	r2, [r3, #12]
}
    1d98:	b007      	add	sp, #28
    1d9a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    1d9e:	4a24      	ldr	r2, [pc, #144]	; (1e30 <usb_isr+0x668>)
						b->desc = 0;
    1da0:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    1da4:	7813      	ldrb	r3, [r2, #0]
    1da6:	3301      	adds	r3, #1
    1da8:	7013      	strb	r3, [r2, #0]
    1daa:	e557      	b.n	185c <usb_isr+0x94>
						rx_first[endpoint] = packet;
    1dac:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    1db0:	4d0f      	ldr	r5, [pc, #60]	; (1df0 <usb_isr+0x628>)
    1db2:	e53a      	b.n	182a <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    1db4:	5d8b      	ldrb	r3, [r1, r6]
    1db6:	2b03      	cmp	r3, #3
    1db8:	f200 80f0 	bhi.w	1f9c <usb_isr+0x7d4>
    1dbc:	a201      	add	r2, pc, #4	; (adr r2, 1dc4 <usb_isr+0x5fc>)
    1dbe:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1dc2:	bf00      	nop
    1dc4:	0000185d 	.word	0x0000185d
    1dc8:	0000185d 	.word	0x0000185d
    1dcc:	00001e81 	.word	0x00001e81
    1dd0:	00001e7b 	.word	0x00001e7b
    1dd4:	1fff949c 	.word	0x1fff949c
    1dd8:	1fff8000 	.word	0x1fff8000
    1ddc:	1fff9478 	.word	0x1fff9478
    1de0:	1fff9414 	.word	0x1fff9414
    1de4:	1fff9468 	.word	0x1fff9468
    1de8:	1fff94a0 	.word	0x1fff94a0
    1dec:	1fff9698 	.word	0x1fff9698
    1df0:	1fff93c0 	.word	0x1fff93c0
    1df4:	1fff96a0 	.word	0x1fff96a0
    1df8:	1fff9490 	.word	0x1fff9490
    1dfc:	1fff9424 	.word	0x1fff9424
    1e00:	1fff93b8 	.word	0x1fff93b8
    1e04:	1fff96a8 	.word	0x1fff96a8
    1e08:	1fff94b4 	.word	0x1fff94b4
    1e0c:	1fff93d0 	.word	0x1fff93d0
    1e10:	40072094 	.word	0x40072094
    1e14:	400720c0 	.word	0x400720c0
    1e18:	00400088 	.word	0x00400088
    1e1c:	40072088 	.word	0x40072088
    1e20:	40072080 	.word	0x40072080
    1e24:	40072098 	.word	0x40072098
    1e28:	1fff93d4 	.word	0x1fff93d4
    1e2c:	1fff9428 	.word	0x1fff9428
    1e30:	1fff9491 	.word	0x1fff9491
    1e34:	4007208c 	.word	0x4007208c
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1e38:	49bd      	ldr	r1, [pc, #756]	; (2130 <usb_isr+0x968>)
		USB0_ISTAT = USB_ISTAT_STALL;
    1e3a:	4bbe      	ldr	r3, [pc, #760]	; (2134 <usb_isr+0x96c>)
    1e3c:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1e3e:	200d      	movs	r0, #13
    1e40:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    1e42:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1e44:	07a2      	lsls	r2, r4, #30
    1e46:	f57f ae0e 	bpl.w	1a66 <usb_isr+0x29e>
    1e4a:	e605      	b.n	1a58 <usb_isr+0x290>
	switch (setup.wRequestAndType) {
    1e4c:	f240 3202 	movw	r2, #770	; 0x302
    1e50:	4291      	cmp	r1, r2
    1e52:	f040 80ee 	bne.w	2032 <usb_isr+0x86a>
    1e56:	88a9      	ldrh	r1, [r5, #4]
    1e58:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1e5c:	2904      	cmp	r1, #4
    1e5e:	d868      	bhi.n	1f32 <usb_isr+0x76a>
    1e60:	886a      	ldrh	r2, [r5, #2]
    1e62:	2a00      	cmp	r2, #0
    1e64:	d165      	bne.n	1f32 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    1e66:	48b2      	ldr	r0, [pc, #712]	; (2130 <usb_isr+0x968>)
    1e68:	f8cd e004 	str.w	lr, [sp, #4]
    1e6c:	0089      	lsls	r1, r1, #2
    1e6e:	4408      	add	r0, r1
    1e70:	7801      	ldrb	r1, [r0, #0]
    1e72:	f041 0102 	orr.w	r1, r1, #2
    1e76:	7001      	strb	r1, [r0, #0]
    1e78:	e721      	b.n	1cbe <usb_isr+0x4f6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1e7a:	2301      	movs	r3, #1
    1e7c:	558b      	strb	r3, [r1, r6]
						break;
    1e7e:	e4ed      	b.n	185c <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1e80:	2300      	movs	r3, #0
    1e82:	558b      	strb	r3, [r1, r6]
						break;
    1e84:	e4ea      	b.n	185c <usb_isr+0x94>
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1e86:	f04f 0301 	mov.w	r3, #1
    1e8a:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    1e8e:	3401      	adds	r4, #1
    1e90:	2c04      	cmp	r4, #4
    1e92:	f106 0604 	add.w	r6, r6, #4
    1e96:	f107 0704 	add.w	r7, r7, #4
    1e9a:	f108 0801 	add.w	r8, r8, #1
    1e9e:	f47f aea1 	bne.w	1be4 <usb_isr+0x41c>
			epconf = *cfg++;
    1ea2:	4ca5      	ldr	r4, [pc, #660]	; (2138 <usb_isr+0x970>)
			*reg = epconf;
    1ea4:	4ba5      	ldr	r3, [pc, #660]	; (213c <usb_isr+0x974>)
			epconf = *cfg++;
    1ea6:	7822      	ldrb	r2, [r4, #0]
		usb_rx_memory_needed = 0;
    1ea8:	4da5      	ldr	r5, [pc, #660]	; (2140 <usb_isr+0x978>)
    1eaa:	9f04      	ldr	r7, [sp, #16]
    1eac:	9e05      	ldr	r6, [sp, #20]
    1eae:	2100      	movs	r1, #0
    1eb0:	7029      	strb	r1, [r5, #0]
			*reg = epconf;
    1eb2:	701a      	strb	r2, [r3, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    1eb4:	0713      	lsls	r3, r2, #28
    1eb6:	f100 8105 	bmi.w	20c4 <usb_isr+0x8fc>
			epconf = *cfg++;
    1eba:	7862      	ldrb	r2, [r4, #1]
			*reg = epconf;
    1ebc:	49a1      	ldr	r1, [pc, #644]	; (2144 <usb_isr+0x97c>)
			table[index(i, TX, EVEN)].desc = 0;
    1ebe:	f8df 8290 	ldr.w	r8, [pc, #656]	; 2150 <usb_isr+0x988>
			*reg = epconf;
    1ec2:	700a      	strb	r2, [r1, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    1ec4:	0710      	lsls	r0, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1ec6:	f04f 0100 	mov.w	r1, #0
    1eca:	f8c9 1030 	str.w	r1, [r9, #48]	; 0x30
			table[index(i, TX, ODD)].desc = 0;
    1ece:	f8c9 1038 	str.w	r1, [r9, #56]	; 0x38
			if (epconf & USB_ENDPT_EPRXEN) {
    1ed2:	f100 80e1 	bmi.w	2098 <usb_isr+0x8d0>
			*reg = epconf;
    1ed6:	499c      	ldr	r1, [pc, #624]	; (2148 <usb_isr+0x980>)
			epconf = *cfg++;
    1ed8:	78a2      	ldrb	r2, [r4, #2]
			*reg = epconf;
    1eda:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    1edc:	2100      	movs	r1, #0
    1ede:	f8c9 1050 	str.w	r1, [r9, #80]	; 0x50
			table[index(i, TX, ODD)].desc = 0;
    1ee2:	f8c9 1058 	str.w	r1, [r9, #88]	; 0x58
			if (epconf & USB_ENDPT_EPRXEN) {
    1ee6:	0711      	lsls	r1, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1ee8:	f8df 8264 	ldr.w	r8, [pc, #612]	; 2150 <usb_isr+0x988>
			if (epconf & USB_ENDPT_EPRXEN) {
    1eec:	f100 8100 	bmi.w	20f0 <usb_isr+0x928>
			epconf = *cfg++;
    1ef0:	78e2      	ldrb	r2, [r4, #3]
			*reg = epconf;
    1ef2:	4996      	ldr	r1, [pc, #600]	; (214c <usb_isr+0x984>)
			table[index(i, TX, EVEN)].desc = 0;
    1ef4:	4c96      	ldr	r4, [pc, #600]	; (2150 <usb_isr+0x988>)
			*reg = epconf;
    1ef6:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    1ef8:	2100      	movs	r1, #0
			if (epconf & USB_ENDPT_EPRXEN) {
    1efa:	0712      	lsls	r2, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1efc:	f8c9 1070 	str.w	r1, [r9, #112]	; 0x70
			table[index(i, TX, ODD)].desc = 0;
    1f00:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
			if (epconf & USB_ENDPT_EPRXEN) {
    1f04:	f100 80b0 	bmi.w	2068 <usb_isr+0x8a0>
    1f08:	7833      	ldrb	r3, [r6, #0]
    1f0a:	9301      	str	r3, [sp, #4]
			table[index(i, TX, EVEN)].desc = 0;
    1f0c:	2100      	movs	r1, #0
    1f0e:	f083 0201 	eor.w	r2, r3, #1
    1f12:	f8c9 1090 	str.w	r1, [r9, #144]	; 0x90
			table[index(i, TX, ODD)].desc = 0;
    1f16:	f8c9 1098 	str.w	r1, [r9, #152]	; 0x98
    1f1a:	e6d0      	b.n	1cbe <usb_isr+0x4f6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1f1c:	f04f 0300 	mov.w	r3, #0
    1f20:	f888 3000 	strb.w	r3, [r8]
    1f24:	e7b3      	b.n	1e8e <usb_isr+0x6c6>
    1f26:	88a9      	ldrh	r1, [r5, #4]
    1f28:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1f2c:	2904      	cmp	r1, #4
    1f2e:	f240 808d 	bls.w	204c <usb_isr+0x884>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1f32:	4a7f      	ldr	r2, [pc, #508]	; (2130 <usb_isr+0x968>)
    1f34:	230f      	movs	r3, #15
    1f36:	7013      	strb	r3, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1f38:	4a86      	ldr	r2, [pc, #536]	; (2154 <usb_isr+0x98c>)
    1f3a:	2301      	movs	r3, #1
    1f3c:	7013      	strb	r3, [r2, #0]
    1f3e:	e552      	b.n	19e6 <usb_isr+0x21e>
	if (size > EP0_SIZE) size = EP0_SIZE;
    1f40:	2840      	cmp	r0, #64	; 0x40
    1f42:	f67f aee2 	bls.w	1d0a <usb_isr+0x542>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1f46:	f044 0402 	orr.w	r4, r4, #2
    1f4a:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    1f4e:	9e02      	ldr	r6, [sp, #8]
    1f50:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f52:	b1ba      	cbz	r2, 1f84 <usb_isr+0x7bc>
	ep0_tx_data_toggle ^= 1;
    1f54:	f89d 1004 	ldrb.w	r1, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f58:	4a7f      	ldr	r2, [pc, #508]	; (2158 <usb_isr+0x990>)
	ep0_tx_data_toggle ^= 1;
    1f5a:	7019      	strb	r1, [r3, #0]
	data += size;
    1f5c:	4633      	mov	r3, r6
    1f5e:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    1f60:	f888 5000 	strb.w	r5, [r8]
	data += size;
    1f64:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f66:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1f6a:	e6e7      	b.n	1d3c <usb_isr+0x574>
	ep0_tx_data_toggle ^= 1;
    1f6c:	f89d 3004 	ldrb.w	r3, [sp, #4]
    1f70:	7033      	strb	r3, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f72:	0402      	lsls	r2, r0, #16
	data += size;
    1f74:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_bdt_bank ^= 1;
    1f76:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f78:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	data += size;
    1f7c:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f7e:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
    1f82:	e6d8      	b.n	1d36 <usb_isr+0x56e>
	ep0_tx_data_toggle ^= 1;
    1f84:	f89d 1004 	ldrb.w	r1, [sp, #4]
    1f88:	7019      	strb	r1, [r3, #0]
	data += size;
    1f8a:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f8c:	4a73      	ldr	r2, [pc, #460]	; (215c <usb_isr+0x994>)
	ep0_tx_bdt_bank ^= 1;
    1f8e:	f888 5000 	strb.w	r5, [r8]
    1f92:	3840      	subs	r0, #64	; 0x40
	data += size;
    1f94:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1f96:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1f9a:	e6cf      	b.n	1d3c <usb_isr+0x574>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    1f9c:	f019 0f08 	tst.w	r9, #8
    1fa0:	bf0c      	ite	eq
    1fa2:	2302      	moveq	r3, #2
    1fa4:	2303      	movne	r3, #3
    1fa6:	558b      	strb	r3, [r1, r6]
						break;
    1fa8:	e458      	b.n	185c <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1faa:	4a6d      	ldr	r2, [pc, #436]	; (2160 <usb_isr+0x998>)
    1fac:	210f      	movs	r1, #15
    1fae:	7011      	strb	r1, [r2, #0]
    1fb0:	e660      	b.n	1c74 <usb_isr+0x4ac>
			if (list->addr == NULL) break;
    1fb2:	4a6c      	ldr	r2, [pc, #432]	; (2164 <usb_isr+0x99c>)
    1fb4:	6854      	ldr	r4, [r2, #4]
    1fb6:	2c00      	cmp	r4, #0
    1fb8:	d0bb      	beq.n	1f32 <usb_isr+0x76a>
    1fba:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    1fbc:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    1fc0:	e003      	b.n	1fca <usb_isr+0x802>
		for (list = usb_descriptor_list; 1; list++) {
    1fc2:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    1fc4:	6854      	ldr	r4, [r2, #4]
    1fc6:	2c00      	cmp	r4, #0
    1fc8:	d0b3      	beq.n	1f32 <usb_isr+0x76a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    1fca:	8813      	ldrh	r3, [r2, #0]
    1fcc:	4283      	cmp	r3, r0
    1fce:	d1f8      	bne.n	1fc2 <usb_isr+0x7fa>
    1fd0:	8853      	ldrh	r3, [r2, #2]
    1fd2:	4573      	cmp	r3, lr
    1fd4:	d1f5      	bne.n	1fc2 <usb_isr+0x7fa>
				if ((setup.wValue >> 8) == 3) {
    1fd6:	0a00      	lsrs	r0, r0, #8
    1fd8:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    1fda:	bf0c      	ite	eq
    1fdc:	f894 e000 	ldrbeq.w	lr, [r4]
					datalen = list->length;
    1fe0:	f8b2 e008 	ldrhne.w	lr, [r2, #8]
    1fe4:	e003      	b.n	1fee <usb_isr+0x826>
		reply_buffer[0] = usb_configuration;
    1fe6:	4a60      	ldr	r2, [pc, #384]	; (2168 <usb_isr+0x9a0>)
    1fe8:	4c60      	ldr	r4, [pc, #384]	; (216c <usb_isr+0x9a4>)
    1fea:	7812      	ldrb	r2, [r2, #0]
    1fec:	7022      	strb	r2, [r4, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1fee:	88e8      	ldrh	r0, [r5, #6]
    1ff0:	4570      	cmp	r0, lr
    1ff2:	f080 8131 	bcs.w	2258 <usb_isr+0xa90>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1ff6:	495e      	ldr	r1, [pc, #376]	; (2170 <usb_isr+0x9a8>)
    1ff8:	780d      	ldrb	r5, [r1, #0]
    1ffa:	2840      	cmp	r0, #64	; 0x40
    1ffc:	4684      	mov	ip, r0
    1ffe:	f045 0e02 	orr.w	lr, r5, #2
    2002:	bf28      	it	cs
    2004:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    2008:	eb04 030c 	add.w	r3, r4, ip
    200c:	eb09 02ce 	add.w	r2, r9, lr, lsl #3
    2010:	9302      	str	r3, [sp, #8]
    2012:	2301      	movs	r3, #1
    2014:	6054      	str	r4, [r2, #4]
    2016:	ebcc 0000 	rsb	r0, ip, r0
    201a:	ea4f 480c 	mov.w	r8, ip, lsl #16
    201e:	2200      	movs	r2, #0
    2020:	9301      	str	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    2022:	24c8      	movs	r4, #200	; 0xc8
    2024:	e65e      	b.n	1ce4 <usb_isr+0x51c>
		reply_buffer[0] = 0;
    2026:	4c51      	ldr	r4, [pc, #324]	; (216c <usb_isr+0x9a4>)
		datalen = 2;
    2028:	f04f 0e02 	mov.w	lr, #2
		reply_buffer[0] = 0;
    202c:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    202e:	7062      	strb	r2, [r4, #1]
    2030:	e7dd      	b.n	1fee <usb_isr+0x826>
	switch (setup.wRequestAndType) {
    2032:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    2036:	f47f af7c 	bne.w	1f32 <usb_isr+0x76a>
    203a:	2301      	movs	r3, #1
    203c:	2200      	movs	r2, #0
    203e:	9301      	str	r3, [sp, #4]
    2040:	e63d      	b.n	1cbe <usb_isr+0x4f6>
    2042:	f242 3221 	movw	r2, #8993	; 0x2321
    2046:	4291      	cmp	r1, r2
    2048:	d0f7      	beq.n	203a <usb_isr+0x872>
    204a:	e772      	b.n	1f32 <usb_isr+0x76a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    204c:	886a      	ldrh	r2, [r5, #2]
    204e:	2a00      	cmp	r2, #0
    2050:	f47f af6f 	bne.w	1f32 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    2054:	4836      	ldr	r0, [pc, #216]	; (2130 <usb_isr+0x968>)
    2056:	f8cd e004 	str.w	lr, [sp, #4]
    205a:	0089      	lsls	r1, r1, #2
    205c:	4408      	add	r0, r1
    205e:	7801      	ldrb	r1, [r0, #0]
    2060:	f021 0102 	bic.w	r1, r1, #2
    2064:	7001      	strb	r1, [r0, #0]
    2066:	e62a      	b.n	1cbe <usb_isr+0x4f6>
				p = usb_malloc();
    2068:	f000 f98a 	bl	2380 <usb_malloc>
				if (p) {
    206c:	2800      	cmp	r0, #0
    206e:	f000 80e6 	beq.w	223e <usb_isr+0xa76>
					table[index(i, RX, EVEN)].addr = p->buf;
    2072:	3008      	adds	r0, #8
    2074:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    2078:	4838      	ldr	r0, [pc, #224]	; (215c <usb_isr+0x994>)
    207a:	f8c9 0080 	str.w	r0, [r9, #128]	; 0x80
				p = usb_malloc();
    207e:	f000 f97f 	bl	2380 <usb_malloc>
    2082:	4a33      	ldr	r2, [pc, #204]	; (2150 <usb_isr+0x988>)
				if (p) {
    2084:	2800      	cmp	r0, #0
    2086:	f000 80d4 	beq.w	2232 <usb_isr+0xa6a>
					table[index(i, RX, ODD)].addr = p->buf;
    208a:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    208c:	4932      	ldr	r1, [pc, #200]	; (2158 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    208e:	f8c2 008c 	str.w	r0, [r2, #140]	; 0x8c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    2092:	f8c2 1088 	str.w	r1, [r2, #136]	; 0x88
    2096:	e737      	b.n	1f08 <usb_isr+0x740>
				p = usb_malloc();
    2098:	f000 f972 	bl	2380 <usb_malloc>
				if (p) {
    209c:	2800      	cmp	r0, #0
    209e:	f000 80bb 	beq.w	2218 <usb_isr+0xa50>
					table[index(i, RX, EVEN)].addr = p->buf;
    20a2:	3008      	adds	r0, #8
    20a4:	f8c8 0044 	str.w	r0, [r8, #68]	; 0x44
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    20a8:	482c      	ldr	r0, [pc, #176]	; (215c <usb_isr+0x994>)
    20aa:	f8c9 0040 	str.w	r0, [r9, #64]	; 0x40
				p = usb_malloc();
    20ae:	f000 f967 	bl	2380 <usb_malloc>
    20b2:	4a27      	ldr	r2, [pc, #156]	; (2150 <usb_isr+0x988>)
				if (p) {
    20b4:	2800      	cmp	r0, #0
    20b6:	f000 80aa 	beq.w	220e <usb_isr+0xa46>
					table[index(i, RX, ODD)].addr = p->buf;
    20ba:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    20bc:	4926      	ldr	r1, [pc, #152]	; (2158 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    20be:	64d0      	str	r0, [r2, #76]	; 0x4c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    20c0:	6491      	str	r1, [r2, #72]	; 0x48
    20c2:	e708      	b.n	1ed6 <usb_isr+0x70e>
				p = usb_malloc();
    20c4:	f000 f95c 	bl	2380 <usb_malloc>
				if (p) {
    20c8:	2800      	cmp	r0, #0
    20ca:	f000 80c1 	beq.w	2250 <usb_isr+0xa88>
					table[index(i, RX, EVEN)].addr = p->buf;
    20ce:	3008      	adds	r0, #8
    20d0:	f8c9 0024 	str.w	r0, [r9, #36]	; 0x24
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    20d4:	4821      	ldr	r0, [pc, #132]	; (215c <usb_isr+0x994>)
    20d6:	f8c9 0020 	str.w	r0, [r9, #32]
				p = usb_malloc();
    20da:	f000 f951 	bl	2380 <usb_malloc>
    20de:	4a1c      	ldr	r2, [pc, #112]	; (2150 <usb_isr+0x988>)
				if (p) {
    20e0:	2800      	cmp	r0, #0
    20e2:	f000 80b0 	beq.w	2246 <usb_isr+0xa7e>
					table[index(i, RX, ODD)].addr = p->buf;
    20e6:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    20e8:	491b      	ldr	r1, [pc, #108]	; (2158 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    20ea:	62d0      	str	r0, [r2, #44]	; 0x2c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    20ec:	6291      	str	r1, [r2, #40]	; 0x28
    20ee:	e6e4      	b.n	1eba <usb_isr+0x6f2>
				p = usb_malloc();
    20f0:	f000 f946 	bl	2380 <usb_malloc>
				if (p) {
    20f4:	2800      	cmp	r0, #0
    20f6:	f000 8098 	beq.w	222a <usb_isr+0xa62>
					table[index(i, RX, EVEN)].addr = p->buf;
    20fa:	3008      	adds	r0, #8
    20fc:	f8c8 0064 	str.w	r0, [r8, #100]	; 0x64
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    2100:	4816      	ldr	r0, [pc, #88]	; (215c <usb_isr+0x994>)
    2102:	f8c9 0060 	str.w	r0, [r9, #96]	; 0x60
				p = usb_malloc();
    2106:	f000 f93b 	bl	2380 <usb_malloc>
    210a:	4a11      	ldr	r2, [pc, #68]	; (2150 <usb_isr+0x988>)
				if (p) {
    210c:	2800      	cmp	r0, #0
    210e:	f000 8087 	beq.w	2220 <usb_isr+0xa58>
					table[index(i, RX, ODD)].addr = p->buf;
    2112:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    2114:	4910      	ldr	r1, [pc, #64]	; (2158 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    2116:	66d0      	str	r0, [r2, #108]	; 0x6c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    2118:	6691      	str	r1, [r2, #104]	; 0x68
    211a:	e6e9      	b.n	1ef0 <usb_isr+0x728>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    211c:	6bc8      	ldr	r0, [r1, #60]	; 0x3c
    211e:	3808      	subs	r0, #8
    2120:	f000 f94e 	bl	23c0 <usb_free>
    2124:	e506      	b.n	1b34 <usb_isr+0x36c>
    2126:	6b48      	ldr	r0, [r1, #52]	; 0x34
    2128:	3808      	subs	r0, #8
    212a:	f000 f949 	bl	23c0 <usb_free>
    212e:	e4fb      	b.n	1b28 <usb_isr+0x360>
    2130:	400720c0 	.word	0x400720c0
    2134:	40072080 	.word	0x40072080
    2138:	000049ac 	.word	0x000049ac
    213c:	400720c4 	.word	0x400720c4
    2140:	1fff9491 	.word	0x1fff9491
    2144:	400720c8 	.word	0x400720c8
    2148:	400720cc 	.word	0x400720cc
    214c:	400720d0 	.word	0x400720d0
    2150:	1fff8000 	.word	0x1fff8000
    2154:	40072094 	.word	0x40072094
    2158:	004000c8 	.word	0x004000c8
    215c:	00400088 	.word	0x00400088
    2160:	1fff9425 	.word	0x1fff9425
    2164:	000049b0 	.word	0x000049b0
    2168:	1fff949c 	.word	0x1fff949c
    216c:	1fff9494 	.word	0x1fff9494
    2170:	1fff9490 	.word	0x1fff9490
    2174:	6ac8      	ldr	r0, [r1, #44]	; 0x2c
    2176:	3808      	subs	r0, #8
    2178:	f000 f922 	bl	23c0 <usb_free>
    217c:	e4ce      	b.n	1b1c <usb_isr+0x354>
    217e:	6a60      	ldr	r0, [r4, #36]	; 0x24
    2180:	3808      	subs	r0, #8
    2182:	f000 f91d 	bl	23c0 <usb_free>
    2186:	e4c3      	b.n	1b10 <usb_isr+0x348>
    2188:	6fc8      	ldr	r0, [r1, #124]	; 0x7c
    218a:	3808      	subs	r0, #8
    218c:	f000 f918 	bl	23c0 <usb_free>
    2190:	e500      	b.n	1b94 <usb_isr+0x3cc>
    2192:	6f48      	ldr	r0, [r1, #116]	; 0x74
    2194:	3808      	subs	r0, #8
    2196:	f000 f913 	bl	23c0 <usb_free>
    219a:	e4f5      	b.n	1b88 <usb_isr+0x3c0>
    219c:	6ec8      	ldr	r0, [r1, #108]	; 0x6c
    219e:	3808      	subs	r0, #8
    21a0:	f000 f90e 	bl	23c0 <usb_free>
    21a4:	e4ea      	b.n	1b7c <usb_isr+0x3b4>
    21a6:	6e48      	ldr	r0, [r1, #100]	; 0x64
    21a8:	3808      	subs	r0, #8
    21aa:	f000 f909 	bl	23c0 <usb_free>
    21ae:	e4df      	b.n	1b70 <usb_isr+0x3a8>
    21b0:	6dc8      	ldr	r0, [r1, #92]	; 0x5c
    21b2:	3808      	subs	r0, #8
    21b4:	f000 f904 	bl	23c0 <usb_free>
    21b8:	e4d4      	b.n	1b64 <usb_isr+0x39c>
    21ba:	6d48      	ldr	r0, [r1, #84]	; 0x54
    21bc:	3808      	subs	r0, #8
    21be:	f000 f8ff 	bl	23c0 <usb_free>
    21c2:	e4c9      	b.n	1b58 <usb_isr+0x390>
    21c4:	6cc8      	ldr	r0, [r1, #76]	; 0x4c
    21c6:	3808      	subs	r0, #8
    21c8:	f000 f8fa 	bl	23c0 <usb_free>
    21cc:	e4be      	b.n	1b4c <usb_isr+0x384>
    21ce:	6c48      	ldr	r0, [r1, #68]	; 0x44
    21d0:	3808      	subs	r0, #8
    21d2:	f000 f8f5 	bl	23c0 <usb_free>
    21d6:	e4b3      	b.n	1b40 <usb_isr+0x378>
    21d8:	f8d1 009c 	ldr.w	r0, [r1, #156]	; 0x9c
    21dc:	3808      	subs	r0, #8
    21de:	f000 f8ef 	bl	23c0 <usb_free>
    21e2:	e4ef      	b.n	1bc4 <usb_isr+0x3fc>
    21e4:	f8d1 0094 	ldr.w	r0, [r1, #148]	; 0x94
    21e8:	3808      	subs	r0, #8
    21ea:	f000 f8e9 	bl	23c0 <usb_free>
    21ee:	e4e3      	b.n	1bb8 <usb_isr+0x3f0>
    21f0:	f8d1 008c 	ldr.w	r0, [r1, #140]	; 0x8c
    21f4:	3808      	subs	r0, #8
    21f6:	f000 f8e3 	bl	23c0 <usb_free>
    21fa:	e4d7      	b.n	1bac <usb_isr+0x3e4>
    21fc:	f8d1 0084 	ldr.w	r0, [r1, #132]	; 0x84
    2200:	3808      	subs	r0, #8
    2202:	f000 f8dd 	bl	23c0 <usb_free>
    2206:	e4cb      	b.n	1ba0 <usb_isr+0x3d8>
		datalen = 2;
    2208:	f04f 0e02 	mov.w	lr, #2
    220c:	e6ef      	b.n	1fee <usb_isr+0x826>
					usb_rx_memory_needed++;
    220e:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    2210:	6490      	str	r0, [r2, #72]	; 0x48
					usb_rx_memory_needed++;
    2212:	1c4a      	adds	r2, r1, #1
    2214:	702a      	strb	r2, [r5, #0]
    2216:	e65e      	b.n	1ed6 <usb_isr+0x70e>
					usb_rx_memory_needed++;
    2218:	782a      	ldrb	r2, [r5, #0]
    221a:	3201      	adds	r2, #1
    221c:	702a      	strb	r2, [r5, #0]
    221e:	e744      	b.n	20aa <usb_isr+0x8e2>
					usb_rx_memory_needed++;
    2220:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    2222:	6690      	str	r0, [r2, #104]	; 0x68
					usb_rx_memory_needed++;
    2224:	1c4a      	adds	r2, r1, #1
    2226:	702a      	strb	r2, [r5, #0]
    2228:	e662      	b.n	1ef0 <usb_isr+0x728>
					usb_rx_memory_needed++;
    222a:	782a      	ldrb	r2, [r5, #0]
    222c:	3201      	adds	r2, #1
    222e:	702a      	strb	r2, [r5, #0]
    2230:	e767      	b.n	2102 <usb_isr+0x93a>
					usb_rx_memory_needed++;
    2232:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    2234:	f8c2 0088 	str.w	r0, [r2, #136]	; 0x88
					usb_rx_memory_needed++;
    2238:	1c4a      	adds	r2, r1, #1
    223a:	702a      	strb	r2, [r5, #0]
    223c:	e664      	b.n	1f08 <usb_isr+0x740>
					usb_rx_memory_needed++;
    223e:	782a      	ldrb	r2, [r5, #0]
    2240:	3201      	adds	r2, #1
    2242:	702a      	strb	r2, [r5, #0]
    2244:	e719      	b.n	207a <usb_isr+0x8b2>
					usb_rx_memory_needed++;
    2246:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    2248:	6290      	str	r0, [r2, #40]	; 0x28
					usb_rx_memory_needed++;
    224a:	1c4a      	adds	r2, r1, #1
    224c:	702a      	strb	r2, [r5, #0]
    224e:	e634      	b.n	1eba <usb_isr+0x6f2>
					usb_rx_memory_needed++;
    2250:	782a      	ldrb	r2, [r5, #0]
    2252:	3201      	adds	r2, #1
    2254:	702a      	strb	r2, [r5, #0]
    2256:	e73e      	b.n	20d6 <usb_isr+0x90e>
    2258:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    225c:	46f4      	mov	ip, lr
    225e:	bf28      	it	cs
    2260:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    2264:	eb04 030c 	add.w	r3, r4, ip
    2268:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    226a:	2301      	movs	r3, #1
    226c:	ebcc 000e 	rsb	r0, ip, lr
    2270:	ea4f 480c 	mov.w	r8, ip, lsl #16
    2274:	2200      	movs	r2, #0
    2276:	9301      	str	r3, [sp, #4]
    2278:	e526      	b.n	1cc8 <usb_isr+0x500>
    227a:	bf00      	nop

0000227c <usb_init>:



void usb_init(void)
{
    227c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    227e:	f000 fe59 	bl	2f34 <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    2282:	4b29      	ldr	r3, [pc, #164]	; (2328 <usb_init+0xac>)
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    2284:	4829      	ldr	r0, [pc, #164]	; (232c <usb_init+0xb0>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    2286:	4c2a      	ldr	r4, [pc, #168]	; (2330 <usb_init+0xb4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    2288:	4f2a      	ldr	r7, [pc, #168]	; (2334 <usb_init+0xb8>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    228a:	4d2b      	ldr	r5, [pc, #172]	; (2338 <usb_init+0xbc>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
    228c:	f8df c0bc 	ldr.w	ip, [pc, #188]	; 234c <usb_init+0xd0>
	USB0_ERRSTAT = 0xFF;
    2290:	f8df e0bc 	ldr.w	lr, [pc, #188]	; 2350 <usb_init+0xd4>
	USB0_OTGISTAT = 0xFF;

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    2294:	4e29      	ldr	r6, [pc, #164]	; (233c <usb_init+0xc0>)
		table[i].desc = 0;
    2296:	2200      	movs	r2, #0
    2298:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    229a:	605a      	str	r2, [r3, #4]
		table[i].desc = 0;
    229c:	609a      	str	r2, [r3, #8]
		table[i].addr = 0;
    229e:	60da      	str	r2, [r3, #12]
		table[i].desc = 0;
    22a0:	611a      	str	r2, [r3, #16]
		table[i].addr = 0;
    22a2:	615a      	str	r2, [r3, #20]
		table[i].desc = 0;
    22a4:	619a      	str	r2, [r3, #24]
		table[i].addr = 0;
    22a6:	61da      	str	r2, [r3, #28]
		table[i].desc = 0;
    22a8:	621a      	str	r2, [r3, #32]
		table[i].addr = 0;
    22aa:	625a      	str	r2, [r3, #36]	; 0x24
		table[i].desc = 0;
    22ac:	629a      	str	r2, [r3, #40]	; 0x28
		table[i].addr = 0;
    22ae:	62da      	str	r2, [r3, #44]	; 0x2c
		table[i].desc = 0;
    22b0:	631a      	str	r2, [r3, #48]	; 0x30
		table[i].addr = 0;
    22b2:	635a      	str	r2, [r3, #52]	; 0x34
		table[i].desc = 0;
    22b4:	639a      	str	r2, [r3, #56]	; 0x38
		table[i].addr = 0;
    22b6:	63da      	str	r2, [r3, #60]	; 0x3c
		table[i].desc = 0;
    22b8:	641a      	str	r2, [r3, #64]	; 0x40
		table[i].addr = 0;
    22ba:	645a      	str	r2, [r3, #68]	; 0x44
		table[i].desc = 0;
    22bc:	649a      	str	r2, [r3, #72]	; 0x48
		table[i].addr = 0;
    22be:	64da      	str	r2, [r3, #76]	; 0x4c
		table[i].desc = 0;
    22c0:	651a      	str	r2, [r3, #80]	; 0x50
		table[i].addr = 0;
    22c2:	655a      	str	r2, [r3, #84]	; 0x54
		table[i].desc = 0;
    22c4:	659a      	str	r2, [r3, #88]	; 0x58
		table[i].addr = 0;
    22c6:	65da      	str	r2, [r3, #92]	; 0x5c
		table[i].desc = 0;
    22c8:	661a      	str	r2, [r3, #96]	; 0x60
		table[i].addr = 0;
    22ca:	665a      	str	r2, [r3, #100]	; 0x64
		table[i].desc = 0;
    22cc:	669a      	str	r2, [r3, #104]	; 0x68
		table[i].addr = 0;
    22ce:	66da      	str	r2, [r3, #108]	; 0x6c
		table[i].desc = 0;
    22d0:	671a      	str	r2, [r3, #112]	; 0x70
		table[i].addr = 0;
    22d2:	675a      	str	r2, [r3, #116]	; 0x74
		table[i].desc = 0;
    22d4:	679a      	str	r2, [r3, #120]	; 0x78
		table[i].addr = 0;
    22d6:	67da      	str	r2, [r3, #124]	; 0x7c
		table[i].desc = 0;
    22d8:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    22dc:	6801      	ldr	r1, [r0, #0]
		table[i].addr = 0;
    22de:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    22e2:	f441 2180 	orr.w	r1, r1, #262144	; 0x40000
    22e6:	6001      	str	r1, [r0, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    22e8:	f3c3 2107 	ubfx	r1, r3, #8, #8
    22ec:	7021      	strb	r1, [r4, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    22ee:	f3c3 4007 	ubfx	r0, r3, #16, #8
	USB0_OTGISTAT = 0xFF;
    22f2:	4913      	ldr	r1, [pc, #76]	; (2340 <usb_init+0xc4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    22f4:	7038      	strb	r0, [r7, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    22f6:	0e1b      	lsrs	r3, r3, #24
    22f8:	702b      	strb	r3, [r5, #0]
	USB0_ISTAT = 0xFF;
    22fa:	23ff      	movs	r3, #255	; 0xff
    22fc:	f88c 3000 	strb.w	r3, [ip]

	// enable reset interrupt
	USB0_INTEN = USB_INTEN_USBRSTEN;

	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    2300:	4d10      	ldr	r5, [pc, #64]	; (2344 <usb_init+0xc8>)
	USB0_ERRSTAT = 0xFF;
    2302:	f88e 3000 	strb.w	r3, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    2306:	4810      	ldr	r0, [pc, #64]	; (2348 <usb_init+0xcc>)
	USB0_OTGISTAT = 0xFF;
    2308:	700b      	strb	r3, [r1, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    230a:	2301      	movs	r3, #1
    230c:	7033      	strb	r3, [r6, #0]
	USB0_USBCTRL = 0;
    230e:	f884 2064 	strb.w	r2, [r4, #100]	; 0x64
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    2312:	2670      	movs	r6, #112	; 0x70
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    2314:	f44f 7400 	mov.w	r4, #512	; 0x200

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    2318:	2210      	movs	r2, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    231a:	f807 3c2c 	strb.w	r3, [r7, #-44]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    231e:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    2320:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    2322:	f881 20f8 	strb.w	r2, [r1, #248]	; 0xf8
    2326:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2328:	1fff8000 	.word	0x1fff8000
    232c:	40048034 	.word	0x40048034
    2330:	4007209c 	.word	0x4007209c
    2334:	400720b0 	.word	0x400720b0
    2338:	400720b4 	.word	0x400720b4
    233c:	40072094 	.word	0x40072094
    2340:	40072010 	.word	0x40072010
    2344:	e000e449 	.word	0xe000e449
    2348:	e000e108 	.word	0xe000e108
    234c:	40072080 	.word	0x40072080
    2350:	40072088 	.word	0x40072088

00002354 <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    2354:	f000 b8a4 	b.w	24a0 <usb_serial_flush_input>

00002358 <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    2358:	f000 b87c 	b.w	2454 <usb_serial_peekchar>

0000235c <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    235c:	f000 b856 	b.w	240c <usb_serial_getchar>

00002360 <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    2360:	f000 b890 	b.w	2484 <usb_serial_available>

00002364 <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    2364:	f000 b9bc 	b.w	26e0 <usb_serial_flush_output>

00002368 <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    2368:	f000 b996 	b.w	2698 <usb_serial_write_buffer_free>

0000236c <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    236c:	4608      	mov	r0, r1
    236e:	4611      	mov	r1, r2
    2370:	f000 b8b2 	b.w	24d8 <usb_serial_write>

00002374 <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    2374:	4608      	mov	r0, r1
    2376:	f000 b983 	b.w	2680 <usb_serial_putchar>
    237a:	bf00      	nop

0000237c <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    237c:	4770      	bx	lr
    237e:	bf00      	nop

00002380 <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    2380:	b672      	cpsid	i
	avail = usb_buffer_available;
    2382:	480d      	ldr	r0, [pc, #52]	; (23b8 <usb_malloc+0x38>)
    2384:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    2386:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    238a:	2b0b      	cmp	r3, #11
    238c:	dc10      	bgt.n	23b0 <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    238e:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    2392:	40d9      	lsrs	r1, r3
    2394:	ea22 0201 	bic.w	r2, r2, r1
    2398:	6002      	str	r2, [r0, #0]
	__enable_irq();
    239a:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    239c:	4807      	ldr	r0, [pc, #28]	; (23bc <usb_malloc+0x3c>)
    239e:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    23a2:	00db      	lsls	r3, r3, #3
    23a4:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    23a6:	2100      	movs	r1, #0
    23a8:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    23aa:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    23ac:	6051      	str	r1, [r2, #4]
}
    23ae:	4770      	bx	lr
		__enable_irq();
    23b0:	b662      	cpsie	i
		return NULL;
    23b2:	2000      	movs	r0, #0
    23b4:	4770      	bx	lr
    23b6:	bf00      	nop
    23b8:	1fff8900 	.word	0x1fff8900
    23bc:	1fff83bc 	.word	0x1fff83bc

000023c0 <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    23c0:	4b0d      	ldr	r3, [pc, #52]	; (23f8 <usb_free+0x38>)
    23c2:	4a0e      	ldr	r2, [pc, #56]	; (23fc <usb_free+0x3c>)
    23c4:	1ac3      	subs	r3, r0, r3
    23c6:	fba2 2303 	umull	r2, r3, r2, r3
    23ca:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    23cc:	2b0b      	cmp	r3, #11
    23ce:	d80c      	bhi.n	23ea <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    23d0:	4a0b      	ldr	r2, [pc, #44]	; (2400 <usb_free+0x40>)
    23d2:	7812      	ldrb	r2, [r2, #0]
    23d4:	b952      	cbnz	r2, 23ec <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    23d6:	b672      	cpsid	i
	usb_buffer_available |= mask;
    23d8:	480a      	ldr	r0, [pc, #40]	; (2404 <usb_free+0x44>)
    23da:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    23de:	6802      	ldr	r2, [r0, #0]
    23e0:	fa21 f303 	lsr.w	r3, r1, r3
    23e4:	431a      	orrs	r2, r3
    23e6:	6002      	str	r2, [r0, #0]
	__enable_irq();
    23e8:	b662      	cpsie	i
    23ea:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    23ec:	4a06      	ldr	r2, [pc, #24]	; (2408 <usb_free+0x48>)
    23ee:	7812      	ldrb	r2, [r2, #0]
    23f0:	2a00      	cmp	r2, #0
    23f2:	d0f0      	beq.n	23d6 <usb_free+0x16>
		usb_rx_memory(p);
    23f4:	f7ff b942 	b.w	167c <usb_rx_memory>
    23f8:	1fff83bc 	.word	0x1fff83bc
    23fc:	38e38e39 	.word	0x38e38e39
    2400:	1fff9491 	.word	0x1fff9491
    2404:	1fff8900 	.word	0x1fff8900
    2408:	1fff949c 	.word	0x1fff949c

0000240c <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    240c:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    240e:	4d0f      	ldr	r5, [pc, #60]	; (244c <usb_serial_getchar+0x40>)
    2410:	6828      	ldr	r0, [r5, #0]
    2412:	b178      	cbz	r0, 2434 <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    2414:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    2416:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    2418:	18c1      	adds	r1, r0, r3
    241a:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    241c:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    241e:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    2420:	d202      	bcs.n	2428 <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    2422:	8043      	strh	r3, [r0, #2]
	}
	return c;
    2424:	4620      	mov	r0, r4
}
    2426:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    2428:	f7ff ffca 	bl	23c0 <usb_free>
		rx_packet = NULL;
    242c:	2300      	movs	r3, #0
	return c;
    242e:	4620      	mov	r0, r4
		rx_packet = NULL;
    2430:	602b      	str	r3, [r5, #0]
    2432:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    2434:	4b06      	ldr	r3, [pc, #24]	; (2450 <usb_serial_getchar+0x44>)
    2436:	781b      	ldrb	r3, [r3, #0]
    2438:	b12b      	cbz	r3, 2446 <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    243a:	2003      	movs	r0, #3
    243c:	f7ff f8ea 	bl	1614 <usb_rx>
    2440:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    2442:	2800      	cmp	r0, #0
    2444:	d1e6      	bne.n	2414 <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    2446:	f04f 30ff 	mov.w	r0, #4294967295
    244a:	bd38      	pop	{r3, r4, r5, pc}
    244c:	1fff94b0 	.word	0x1fff94b0
    2450:	1fff949c 	.word	0x1fff949c

00002454 <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    2454:	b510      	push	{r4, lr}
	if (!rx_packet) {
    2456:	4c09      	ldr	r4, [pc, #36]	; (247c <usb_serial_peekchar+0x28>)
    2458:	6820      	ldr	r0, [r4, #0]
    245a:	b118      	cbz	r0, 2464 <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    245c:	8843      	ldrh	r3, [r0, #2]
    245e:	4418      	add	r0, r3
    2460:	7a00      	ldrb	r0, [r0, #8]
}
    2462:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    2464:	4b06      	ldr	r3, [pc, #24]	; (2480 <usb_serial_peekchar+0x2c>)
    2466:	781b      	ldrb	r3, [r3, #0]
    2468:	b12b      	cbz	r3, 2476 <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    246a:	2003      	movs	r0, #3
    246c:	f7ff f8d2 	bl	1614 <usb_rx>
    2470:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    2472:	2800      	cmp	r0, #0
    2474:	d1f2      	bne.n	245c <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    2476:	f04f 30ff 	mov.w	r0, #4294967295
    247a:	bd10      	pop	{r4, pc}
    247c:	1fff94b0 	.word	0x1fff94b0
    2480:	1fff949c 	.word	0x1fff949c

00002484 <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    2484:	4b04      	ldr	r3, [pc, #16]	; (2498 <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    2486:	4a05      	ldr	r2, [pc, #20]	; (249c <usb_serial_available+0x18>)
    2488:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    248a:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    248c:	b11b      	cbz	r3, 2496 <usb_serial_available+0x12>
    248e:	881a      	ldrh	r2, [r3, #0]
    2490:	885b      	ldrh	r3, [r3, #2]
    2492:	1ad3      	subs	r3, r2, r3
    2494:	4418      	add	r0, r3
	return count;
}
    2496:	4770      	bx	lr
    2498:	1fff94b0 	.word	0x1fff94b0
    249c:	1fff9698 	.word	0x1fff9698

000024a0 <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    24a0:	4b0b      	ldr	r3, [pc, #44]	; (24d0 <usb_serial_flush_input+0x30>)
    24a2:	781b      	ldrb	r3, [r3, #0]
    24a4:	b19b      	cbz	r3, 24ce <usb_serial_flush_input+0x2e>
{
    24a6:	b510      	push	{r4, lr}
	if (rx_packet) {
    24a8:	4c0a      	ldr	r4, [pc, #40]	; (24d4 <usb_serial_flush_input+0x34>)
    24aa:	6820      	ldr	r0, [r4, #0]
    24ac:	b148      	cbz	r0, 24c2 <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    24ae:	f7ff ff87 	bl	23c0 <usb_free>
		rx_packet = NULL;
    24b2:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    24b4:	2003      	movs	r0, #3
		rx_packet = NULL;
    24b6:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    24b8:	f7ff f8ac 	bl	1614 <usb_rx>
		if (!rx) break;
    24bc:	b130      	cbz	r0, 24cc <usb_serial_flush_input+0x2c>
		usb_free(rx);
    24be:	f7ff ff7f 	bl	23c0 <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    24c2:	2003      	movs	r0, #3
    24c4:	f7ff f8a6 	bl	1614 <usb_rx>
		if (!rx) break;
    24c8:	2800      	cmp	r0, #0
    24ca:	d1f8      	bne.n	24be <usb_serial_flush_input+0x1e>
    24cc:	bd10      	pop	{r4, pc}
    24ce:	4770      	bx	lr
    24d0:	1fff949c 	.word	0x1fff949c
    24d4:	1fff94b0 	.word	0x1fff94b0

000024d8 <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    24d8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    24dc:	4a63      	ldr	r2, [pc, #396]	; (266c <usb_serial_write+0x194>)
{
    24de:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    24e0:	2301      	movs	r3, #1
    24e2:	7013      	strb	r3, [r2, #0]
	while (size > 0) {
    24e4:	9101      	str	r1, [sp, #4]
    24e6:	2900      	cmp	r1, #0
    24e8:	d06c      	beq.n	25c4 <usb_serial_write+0xec>
    24ea:	f8df 8190 	ldr.w	r8, [pc, #400]	; 267c <usb_serial_write+0x1a4>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    24ee:	4f60      	ldr	r7, [pc, #384]	; (2670 <usb_serial_write+0x198>)
    24f0:	4604      	mov	r4, r0
    24f2:	f8d8 0000 	ldr.w	r0, [r8]
    24f6:	460e      	mov	r6, r1
		if (!tx_packet) {
    24f8:	2800      	cmp	r0, #0
    24fa:	f000 8081 	beq.w	2600 <usb_serial_write+0x128>
    24fe:	4d5d      	ldr	r5, [pc, #372]	; (2674 <usb_serial_write+0x19c>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    2500:	8843      	ldrh	r3, [r0, #2]
    2502:	f1c3 0140 	rsb	r1, r3, #64	; 0x40
    2506:	42b1      	cmp	r1, r6
    2508:	bf28      	it	cs
    250a:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    250c:	eb03 0901 	add.w	r9, r3, r1
    2510:	fa1f f989 	uxth.w	r9, r9
		dest = tx_packet->buf + tx_packet->index;
    2514:	f100 0208 	add.w	r2, r0, #8
		transmit_previous_timeout = 0;
    2518:	f04f 0e00 	mov.w	lr, #0
		size -= len;
    251c:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    251e:	f8a0 9002 	strh.w	r9, [r0, #2]
		while (len-- > 0) *dest++ = *src++;
    2522:	f101 3cff 	add.w	ip, r1, #4294967295
		dest = tx_packet->buf + tx_packet->index;
    2526:	441a      	add	r2, r3
		transmit_previous_timeout = 0;
    2528:	f885 e000 	strb.w	lr, [r5]
		while (len-- > 0) *dest++ = *src++;
    252c:	2900      	cmp	r1, #0
    252e:	d041      	beq.n	25b4 <usb_serial_write+0xdc>
    2530:	f103 0508 	add.w	r5, r3, #8
    2534:	330c      	adds	r3, #12
    2536:	4403      	add	r3, r0
    2538:	4405      	add	r5, r0
    253a:	f104 0904 	add.w	r9, r4, #4
    253e:	454d      	cmp	r5, r9
    2540:	bf38      	it	cc
    2542:	429c      	cmpcc	r4, r3
    2544:	bf2c      	ite	cs
    2546:	2301      	movcs	r3, #1
    2548:	2300      	movcc	r3, #0
    254a:	2909      	cmp	r1, #9
    254c:	bf94      	ite	ls
    254e:	2300      	movls	r3, #0
    2550:	f003 0301 	andhi.w	r3, r3, #1
    2554:	2b00      	cmp	r3, #0
    2556:	d04a      	beq.n	25ee <usb_serial_write+0x116>
    2558:	ea44 0305 	orr.w	r3, r4, r5
    255c:	079b      	lsls	r3, r3, #30
    255e:	d146      	bne.n	25ee <usb_serial_write+0x116>
    2560:	1f0b      	subs	r3, r1, #4
    2562:	089b      	lsrs	r3, r3, #2
    2564:	3301      	adds	r3, #1
    2566:	f1bc 0f02 	cmp.w	ip, #2
    256a:	ea4f 0983 	mov.w	r9, r3, lsl #2
    256e:	d93c      	bls.n	25ea <usb_serial_write+0x112>
    2570:	f1a4 0a04 	sub.w	sl, r4, #4
    2574:	469b      	mov	fp, r3
    2576:	f10e 0e01 	add.w	lr, lr, #1
    257a:	f85a 3f04 	ldr.w	r3, [sl, #4]!
    257e:	f845 3b04 	str.w	r3, [r5], #4
    2582:	45f3      	cmp	fp, lr
    2584:	d8f7      	bhi.n	2576 <usb_serial_write+0x9e>
    2586:	4549      	cmp	r1, r9
    2588:	444a      	add	r2, r9
    258a:	ebc9 0c0c 	rsb	ip, r9, ip
    258e:	eb04 0309 	add.w	r3, r4, r9
    2592:	d061      	beq.n	2658 <usb_serial_write+0x180>
    2594:	781d      	ldrb	r5, [r3, #0]
    2596:	7015      	strb	r5, [r2, #0]
    2598:	f1bc 0f00 	cmp.w	ip, #0
    259c:	d023      	beq.n	25e6 <usb_serial_write+0x10e>
    259e:	785d      	ldrb	r5, [r3, #1]
    25a0:	7055      	strb	r5, [r2, #1]
    25a2:	f1bc 0f01 	cmp.w	ip, #1
    25a6:	d01e      	beq.n	25e6 <usb_serial_write+0x10e>
    25a8:	789b      	ldrb	r3, [r3, #2]
    25aa:	7093      	strb	r3, [r2, #2]
    25ac:	4421      	add	r1, r4
    25ae:	f8b0 9002 	ldrh.w	r9, [r0, #2]
    25b2:	460c      	mov	r4, r1
		if (tx_packet->index >= CDC_TX_SIZE) {
    25b4:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
    25b8:	d80b      	bhi.n	25d2 <usb_serial_write+0xfa>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    25ba:	4b2f      	ldr	r3, [pc, #188]	; (2678 <usb_serial_write+0x1a0>)
    25bc:	2205      	movs	r2, #5
    25be:	701a      	strb	r2, [r3, #0]
	while (size > 0) {
    25c0:	2e00      	cmp	r6, #0
    25c2:	d199      	bne.n	24f8 <usb_serial_write+0x20>
	}
	tx_noautoflush = 0;
	return ret;
    25c4:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    25c6:	4a29      	ldr	r2, [pc, #164]	; (266c <usb_serial_write+0x194>)
    25c8:	2300      	movs	r3, #0
    25ca:	7013      	strb	r3, [r2, #0]
}
    25cc:	b003      	add	sp, #12
    25ce:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    25d2:	2340      	movs	r3, #64	; 0x40
    25d4:	8003      	strh	r3, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    25d6:	4601      	mov	r1, r0
    25d8:	2004      	movs	r0, #4
    25da:	f7ff f8b3 	bl	1744 <usb_tx>
			tx_packet = NULL;
    25de:	2000      	movs	r0, #0
    25e0:	f8c8 0000 	str.w	r0, [r8]
    25e4:	e7e9      	b.n	25ba <usb_serial_write+0xe2>
    25e6:	4421      	add	r1, r4
    25e8:	e7e1      	b.n	25ae <usb_serial_write+0xd6>
		while (len-- > 0) *dest++ = *src++;
    25ea:	4623      	mov	r3, r4
    25ec:	e7d2      	b.n	2594 <usb_serial_write+0xbc>
    25ee:	3a01      	subs	r2, #1
    25f0:	4421      	add	r1, r4
    25f2:	f814 3b01 	ldrb.w	r3, [r4], #1
    25f6:	f802 3f01 	strb.w	r3, [r2, #1]!
    25fa:	428c      	cmp	r4, r1
    25fc:	d1f9      	bne.n	25f2 <usb_serial_write+0x11a>
    25fe:	e7d6      	b.n	25ae <usb_serial_write+0xd6>
				if (!usb_configuration) {
    2600:	783b      	ldrb	r3, [r7, #0]
    2602:	b35b      	cbz	r3, 265c <usb_serial_write+0x184>
    2604:	4d1b      	ldr	r5, [pc, #108]	; (2674 <usb_serial_write+0x19c>)
    2606:	f24d 09e9 	movw	r9, #53481	; 0xd0e9
					tx_noautoflush = 1;
    260a:	f04f 0a01 	mov.w	sl, #1
    260e:	e008      	b.n	2622 <usb_serial_write+0x14a>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    2610:	f1b9 0901 	subs.w	r9, r9, #1
    2614:	d019      	beq.n	264a <usb_serial_write+0x172>
    2616:	782b      	ldrb	r3, [r5, #0]
    2618:	b9bb      	cbnz	r3, 264a <usb_serial_write+0x172>
				yield();
    261a:	f000 f8b1 	bl	2780 <yield>
				if (!usb_configuration) {
    261e:	783b      	ldrb	r3, [r7, #0]
    2620:	b1e3      	cbz	r3, 265c <usb_serial_write+0x184>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    2622:	2004      	movs	r0, #4
    2624:	f7ff f814 	bl	1650 <usb_tx_packet_count>
    2628:	2807      	cmp	r0, #7
    262a:	d8f1      	bhi.n	2610 <usb_serial_write+0x138>
					tx_noautoflush = 1;
    262c:	4b0f      	ldr	r3, [pc, #60]	; (266c <usb_serial_write+0x194>)
    262e:	f883 a000 	strb.w	sl, [r3]
					tx_packet = usb_malloc();
    2632:	f7ff fea5 	bl	2380 <usb_malloc>
    2636:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    263a:	2800      	cmp	r0, #0
    263c:	f47f af60 	bne.w	2500 <usb_serial_write+0x28>
					tx_noautoflush = 0;
    2640:	4b0a      	ldr	r3, [pc, #40]	; (266c <usb_serial_write+0x194>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    2642:	f1b9 0901 	subs.w	r9, r9, #1
					tx_noautoflush = 0;
    2646:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    2648:	d1e5      	bne.n	2616 <usb_serial_write+0x13e>
					transmit_previous_timeout = 1;
    264a:	2301      	movs	r3, #1
					return -1;
    264c:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    2650:	702b      	strb	r3, [r5, #0]
}
    2652:	b003      	add	sp, #12
    2654:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2658:	4619      	mov	r1, r3
    265a:	e7a8      	b.n	25ae <usb_serial_write+0xd6>
					tx_noautoflush = 0;
    265c:	4a03      	ldr	r2, [pc, #12]	; (266c <usb_serial_write+0x194>)
    265e:	2300      	movs	r3, #0
					return -1;
    2660:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    2664:	7013      	strb	r3, [r2, #0]
}
    2666:	b003      	add	sp, #12
    2668:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    266c:	1fff94a5 	.word	0x1fff94a5
    2670:	1fff949c 	.word	0x1fff949c
    2674:	1fff94ac 	.word	0x1fff94ac
    2678:	1fff94a4 	.word	0x1fff94a4
    267c:	1fff94a8 	.word	0x1fff94a8

00002680 <usb_serial_putchar>:
{
    2680:	b500      	push	{lr}
    2682:	b083      	sub	sp, #12
    2684:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    2686:	2101      	movs	r1, #1
{
    2688:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    268c:	4618      	mov	r0, r3
    268e:	f7ff ff23 	bl	24d8 <usb_serial_write>
}
    2692:	b003      	add	sp, #12
    2694:	f85d fb04 	ldr.w	pc, [sp], #4

00002698 <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    2698:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    269a:	4d0e      	ldr	r5, [pc, #56]	; (26d4 <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    269c:	4c0e      	ldr	r4, [pc, #56]	; (26d8 <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    269e:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    26a0:	2301      	movs	r3, #1
    26a2:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    26a4:	b128      	cbz	r0, 26b2 <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    26a6:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    26a8:	2300      	movs	r3, #0
    26aa:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    26ac:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    26b0:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    26b2:	4b0a      	ldr	r3, [pc, #40]	; (26dc <usb_serial_write_buffer_free+0x44>)
    26b4:	781b      	ldrb	r3, [r3, #0]
    26b6:	b913      	cbnz	r3, 26be <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    26b8:	2000      	movs	r0, #0
    26ba:	7020      	strb	r0, [r4, #0]
			return 0;
    26bc:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    26be:	2004      	movs	r0, #4
    26c0:	f7fe ffc6 	bl	1650 <usb_tx_packet_count>
		if (!usb_configuration ||
    26c4:	2807      	cmp	r0, #7
    26c6:	d8f7      	bhi.n	26b8 <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    26c8:	f7ff fe5a 	bl	2380 <usb_malloc>
    26cc:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    26ce:	2800      	cmp	r0, #0
    26d0:	d1e9      	bne.n	26a6 <usb_serial_write_buffer_free+0xe>
    26d2:	e7f1      	b.n	26b8 <usb_serial_write_buffer_free+0x20>
    26d4:	1fff94a8 	.word	0x1fff94a8
    26d8:	1fff94a5 	.word	0x1fff94a5
    26dc:	1fff949c 	.word	0x1fff949c

000026e0 <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    26e0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    26e2:	4b11      	ldr	r3, [pc, #68]	; (2728 <usb_serial_flush_output+0x48>)
    26e4:	781b      	ldrb	r3, [r3, #0]
    26e6:	b18b      	cbz	r3, 270c <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    26e8:	4e10      	ldr	r6, [pc, #64]	; (272c <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    26ea:	4d11      	ldr	r5, [pc, #68]	; (2730 <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    26ec:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    26ee:	2701      	movs	r7, #1
    26f0:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    26f2:	b164      	cbz	r4, 270e <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    26f4:	4a0f      	ldr	r2, [pc, #60]	; (2734 <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    26f6:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    26f8:	2700      	movs	r7, #0
    26fa:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    26fc:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    26fe:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    2700:	2004      	movs	r0, #4
    2702:	f7ff f81f 	bl	1744 <usb_tx>
		tx_packet = NULL;
    2706:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    2708:	2300      	movs	r3, #0
    270a:	702b      	strb	r3, [r5, #0]
    270c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    270e:	f7ff fe37 	bl	2380 <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    2712:	4b08      	ldr	r3, [pc, #32]	; (2734 <usb_serial_flush_output+0x54>)
		if (tx) {
    2714:	b128      	cbz	r0, 2722 <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    2716:	4601      	mov	r1, r0
    2718:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    271a:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    271c:	f7ff f812 	bl	1744 <usb_tx>
    2720:	e7f2      	b.n	2708 <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    2722:	701f      	strb	r7, [r3, #0]
    2724:	e7f0      	b.n	2708 <usb_serial_flush_output+0x28>
    2726:	bf00      	nop
    2728:	1fff949c 	.word	0x1fff949c
    272c:	1fff94a8 	.word	0x1fff94a8
    2730:	1fff94a5 	.word	0x1fff94a5
    2734:	1fff94a4 	.word	0x1fff94a4

00002738 <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    2738:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    273a:	4b0e      	ldr	r3, [pc, #56]	; (2774 <usb_serial_flush_callback+0x3c>)
    273c:	781b      	ldrb	r3, [r3, #0]
    273e:	b973      	cbnz	r3, 275e <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    2740:	4c0d      	ldr	r4, [pc, #52]	; (2778 <usb_serial_flush_callback+0x40>)
    2742:	6821      	ldr	r1, [r4, #0]
    2744:	b161      	cbz	r1, 2760 <usb_serial_flush_callback+0x28>
    2746:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    274a:	884b      	ldrh	r3, [r1, #2]
    274c:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    274e:	2004      	movs	r0, #4
    2750:	f7fe fff8 	bl	1744 <usb_tx>
		tx_packet = NULL;
    2754:	6025      	str	r5, [r4, #0]
    2756:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    2758:	4b08      	ldr	r3, [pc, #32]	; (277c <usb_serial_flush_callback+0x44>)
    275a:	2201      	movs	r2, #1
    275c:	701a      	strb	r2, [r3, #0]
    275e:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    2760:	f7ff fe0e 	bl	2380 <usb_malloc>
		if (tx) {
    2764:	2800      	cmp	r0, #0
    2766:	d0f7      	beq.n	2758 <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    2768:	4601      	mov	r1, r0
		}
	}
}
    276a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    276e:	2004      	movs	r0, #4
    2770:	f7fe bfe8 	b.w	1744 <usb_tx>
    2774:	1fff94a5 	.word	0x1fff94a5
    2778:	1fff94a8 	.word	0x1fff94a8
    277c:	1fff94a4 	.word	0x1fff94a4

00002780 <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    2780:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    2782:	4c22      	ldr	r4, [pc, #136]	; (280c <yield+0x8c>)
    2784:	7823      	ldrb	r3, [r4, #0]
    2786:	b103      	cbz	r3, 278a <yield+0xa>
    2788:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    278a:	2301      	movs	r3, #1
    278c:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    278e:	f7ff fe79 	bl	2484 <usb_serial_available>
	if (Serial.available()) serialEvent();
    2792:	bb70      	cbnz	r0, 27f2 <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    2794:	f000 fa26 	bl	2be4 <serial_available>
	if (Serial1.available()) serialEvent1();
    2798:	bb40      	cbnz	r0, 27ec <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    279a:	f000 fab9 	bl	2d10 <serial2_available>
	if (Serial2.available()) serialEvent2();
    279e:	bb10      	cbnz	r0, 27e6 <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    27a0:	f000 fb4c 	bl	2e3c <serial3_available>
	if (Serial3.available()) serialEvent3();
    27a4:	b9e0      	cbnz	r0, 27e0 <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    27a6:	2300      	movs	r3, #0
    27a8:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    27aa:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    27ae:	2b00      	cmp	r3, #0
    27b0:	d1ea      	bne.n	2788 <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    27b2:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    27b6:	b672      	cpsid	i
		EventResponder *first = firstYield;
    27b8:	4b15      	ldr	r3, [pc, #84]	; (2810 <yield+0x90>)
    27ba:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    27bc:	b1e0      	cbz	r0, 27f8 <yield+0x78>
		if (runningFromYield) {
    27be:	4c15      	ldr	r4, [pc, #84]	; (2814 <yield+0x94>)
    27c0:	7822      	ldrb	r2, [r4, #0]
    27c2:	b9ca      	cbnz	r2, 27f8 <yield+0x78>
		firstYield = first->_next;
    27c4:	6945      	ldr	r5, [r0, #20]
    27c6:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    27c8:	2301      	movs	r3, #1
    27ca:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    27cc:	b1c5      	cbz	r5, 2800 <yield+0x80>
			firstYield->_prev = nullptr;
    27ce:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    27d0:	b901      	cbnz	r1, 27d4 <yield+0x54>
    27d2:	b662      	cpsie	i
		first->_triggered = false;
    27d4:	2500      	movs	r5, #0
    27d6:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    27d8:	6883      	ldr	r3, [r0, #8]
    27da:	4798      	blx	r3
		runningFromYield = false;
    27dc:	7025      	strb	r5, [r4, #0]
    27de:	e7d3      	b.n	2788 <yield+0x8>
	if (Serial3.available()) serialEvent3();
    27e0:	f000 f98e 	bl	2b00 <serialEvent3()>
    27e4:	e7df      	b.n	27a6 <yield+0x26>
	if (Serial2.available()) serialEvent2();
    27e6:	f000 f989 	bl	2afc <serialEvent2()>
    27ea:	e7d9      	b.n	27a0 <yield+0x20>
	if (Serial1.available()) serialEvent1();
    27ec:	f000 f984 	bl	2af8 <serialEvent1()>
    27f0:	e7d3      	b.n	279a <yield+0x1a>
	if (Serial.available()) serialEvent();
    27f2:	f7ff fdc3 	bl	237c <serialEvent()>
    27f6:	e7cd      	b.n	2794 <yield+0x14>
		if (doit) __enable_irq();
    27f8:	2900      	cmp	r1, #0
    27fa:	d1c5      	bne.n	2788 <yield+0x8>
    27fc:	b662      	cpsie	i
    27fe:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    2800:	4b05      	ldr	r3, [pc, #20]	; (2818 <yield+0x98>)
    2802:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    2804:	2900      	cmp	r1, #0
    2806:	d1e5      	bne.n	27d4 <yield+0x54>
    2808:	e7e3      	b.n	27d2 <yield+0x52>
    280a:	bf00      	nop
    280c:	1fff94b5 	.word	0x1fff94b5
    2810:	1fff94c8 	.word	0x1fff94c8
    2814:	1fff94cc 	.word	0x1fff94cc
    2818:	1fff94c4 	.word	0x1fff94c4

0000281c <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    281c:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    281e:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    2820:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    2822:	2c02      	cmp	r4, #2
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    2824:	4603      	mov	r3, r0
		_data = data;
    2826:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    2828:	d00f      	beq.n	284a <EventResponder::triggerEvent(int, void*)+0x2e>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    282a:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    282e:	b672      	cpsid	i
// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
	bool irq = disableInterrupts();
	if (_triggered == false) {
    2830:	7f42      	ldrb	r2, [r0, #29]
    2832:	b932      	cbnz	r2, 2842 <EventResponder::triggerEvent(int, void*)+0x26>
		// not already triggered
		if (_type == EventTypeYield) {
    2834:	7f00      	ldrb	r0, [r0, #28]
    2836:	2801      	cmp	r0, #1
    2838:	d00a      	beq.n	2850 <EventResponder::triggerEvent(int, void*)+0x34>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    283a:	2803      	cmp	r0, #3
    283c:	d012      	beq.n	2864 <EventResponder::triggerEvent(int, void*)+0x48>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    283e:	2201      	movs	r2, #1
    2840:	775a      	strb	r2, [r3, #29]
		if (doit) __enable_irq();
    2842:	b901      	cbnz	r1, 2846 <EventResponder::triggerEvent(int, void*)+0x2a>
    2844:	b662      	cpsie	i
	}
    2846:	bc10      	pop	{r4}
    2848:	4770      	bx	lr
			(*_function)(*this);
    284a:	6883      	ldr	r3, [r0, #8]
	}
    284c:	bc10      	pop	{r4}
			(*_function)(*this);
    284e:	4718      	bx	r3
			if (firstYield == nullptr) {
    2850:	4c11      	ldr	r4, [pc, #68]	; (2898 <EventResponder::triggerEvent(int, void*)+0x7c>)
    2852:	6820      	ldr	r0, [r4, #0]
    2854:	b1a0      	cbz	r0, 2880 <EventResponder::triggerEvent(int, void*)+0x64>
				_prev = lastYield;
    2856:	4811      	ldr	r0, [pc, #68]	; (289c <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2858:	615a      	str	r2, [r3, #20]
				_prev = lastYield;
    285a:	6802      	ldr	r2, [r0, #0]
    285c:	619a      	str	r2, [r3, #24]
				lastYield = this;
    285e:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2860:	6153      	str	r3, [r2, #20]
    2862:	e7ec      	b.n	283e <EventResponder::triggerEvent(int, void*)+0x22>
			if (firstInterrupt == nullptr) {
    2864:	4c0e      	ldr	r4, [pc, #56]	; (28a0 <EventResponder::triggerEvent(int, void*)+0x84>)
    2866:	6820      	ldr	r0, [r4, #0]
    2868:	b180      	cbz	r0, 288c <EventResponder::triggerEvent(int, void*)+0x70>
				_prev = lastInterrupt;
    286a:	480e      	ldr	r0, [pc, #56]	; (28a4 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    286c:	615a      	str	r2, [r3, #20]
				_prev = lastInterrupt;
    286e:	6802      	ldr	r2, [r0, #0]
    2870:	619a      	str	r2, [r3, #24]
				lastInterrupt = this;
    2872:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2874:	6153      	str	r3, [r2, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2876:	4a0c      	ldr	r2, [pc, #48]	; (28a8 <EventResponder::triggerEvent(int, void*)+0x8c>)
    2878:	f04f 5080 	mov.w	r0, #268435456	; 0x10000000
    287c:	6010      	str	r0, [r2, #0]
    287e:	e7de      	b.n	283e <EventResponder::triggerEvent(int, void*)+0x22>
				lastYield = this;
    2880:	4a06      	ldr	r2, [pc, #24]	; (289c <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2882:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2884:	6198      	str	r0, [r3, #24]
				firstYield = this;
    2886:	6023      	str	r3, [r4, #0]
				lastYield = this;
    2888:	6013      	str	r3, [r2, #0]
    288a:	e7d8      	b.n	283e <EventResponder::triggerEvent(int, void*)+0x22>
				lastInterrupt = this;
    288c:	4a05      	ldr	r2, [pc, #20]	; (28a4 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    288e:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2890:	6198      	str	r0, [r3, #24]
				firstInterrupt = this;
    2892:	6023      	str	r3, [r4, #0]
				lastInterrupt = this;
    2894:	6013      	str	r3, [r2, #0]
    2896:	e7ee      	b.n	2876 <EventResponder::triggerEvent(int, void*)+0x5a>
    2898:	1fff94c8 	.word	0x1fff94c8
    289c:	1fff94c4 	.word	0x1fff94c4
    28a0:	1fff94b8 	.word	0x1fff94b8
    28a4:	1fff94bc 	.word	0x1fff94bc
    28a8:	e000ed04 	.word	0xe000ed04

000028ac <pendablesrvreq_isr>:
	}
	enableInterrupts(irq);
}

void pendablesrvreq_isr(void)
{
    28ac:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    28ae:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    28b2:	b672      	cpsid	i

void EventResponder::runFromInterrupt()
{
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    28b4:	4c0c      	ldr	r4, [pc, #48]	; (28e8 <pendablesrvreq_isr+0x3c>)
    28b6:	6820      	ldr	r0, [r4, #0]
		if (first) {
    28b8:	b180      	cbz	r0, 28dc <pendablesrvreq_isr+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    28ba:	4e0c      	ldr	r6, [pc, #48]	; (28ec <pendablesrvreq_isr+0x40>)
				firstInterrupt->_prev = nullptr;
    28bc:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    28be:	6943      	ldr	r3, [r0, #20]
    28c0:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    28c2:	b173      	cbz	r3, 28e2 <pendablesrvreq_isr+0x36>
				firstInterrupt->_prev = nullptr;
    28c4:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    28c6:	b902      	cbnz	r2, 28ca <pendablesrvreq_isr+0x1e>
    28c8:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    28ca:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    28cc:	6883      	ldr	r3, [r0, #8]
    28ce:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    28d0:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    28d4:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    28d6:	6820      	ldr	r0, [r4, #0]
		if (first) {
    28d8:	2800      	cmp	r0, #0
    28da:	d1f0      	bne.n	28be <pendablesrvreq_isr+0x12>
		if (doit) __enable_irq();
    28dc:	b902      	cbnz	r2, 28e0 <pendablesrvreq_isr+0x34>
    28de:	b662      	cpsie	i
    28e0:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    28e2:	6033      	str	r3, [r6, #0]
    28e4:	e7ef      	b.n	28c6 <pendablesrvreq_isr+0x1a>
    28e6:	bf00      	nop
    28e8:	1fff94b8 	.word	0x1fff94b8
    28ec:	1fff94bc 	.word	0x1fff94bc

000028f0 <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    28f0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	MillisTimer *timer = listActive;
    28f4:	4d74      	ldr	r5, [pc, #464]	; (2ac8 <MillisTimer::runFromTimer()+0x1d8>)
    28f6:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    28f8:	2c00      	cmp	r4, #0
    28fa:	d031      	beq.n	2960 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    28fc:	6823      	ldr	r3, [r4, #0]
    28fe:	2b00      	cmp	r3, #0
    2900:	d12c      	bne.n	295c <MillisTimer::runFromTimer()+0x6c>
    2902:	f8df 91d8 	ldr.w	r9, [pc, #472]	; 2adc <MillisTimer::runFromTimer()+0x1ec>
			if (firstInterrupt == nullptr) {
    2906:	4f71      	ldr	r7, [pc, #452]	; (2acc <MillisTimer::runFromTimer()+0x1dc>)
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2908:	f8df 81d4 	ldr.w	r8, [pc, #468]	; 2ae0 <MillisTimer::runFromTimer()+0x1f0>
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    290c:	461e      	mov	r6, r3
			MillisTimer *next = timer->_next;
    290e:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    2910:	b103      	cbz	r3, 2914 <MillisTimer::runFromTimer()+0x24>
    2912:	60de      	str	r6, [r3, #12]
			listActive = next;
			timer->_state = TimerOff;
			EventResponderRef event = *(timer->_event);
    2914:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    2916:	602b      	str	r3, [r5, #0]
			event.triggerEvent(0, timer);
    2918:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    291a:	7526      	strb	r6, [r4, #20]
			event.triggerEvent(0, timer);
    291c:	681b      	ldr	r3, [r3, #0]
    291e:	454b      	cmp	r3, r9
    2920:	d157      	bne.n	29d2 <MillisTimer::runFromTimer()+0xe2>
		if (_type == EventTypeImmediate) {
    2922:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    2924:	6046      	str	r6, [r0, #4]
		if (_type == EventTypeImmediate) {
    2926:	2b02      	cmp	r3, #2
		_data = data;
    2928:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    292a:	d056      	beq.n	29da <MillisTimer::runFromTimer()+0xea>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    292c:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    2930:	b672      	cpsid	i
	if (_triggered == false) {
    2932:	7f43      	ldrb	r3, [r0, #29]
    2934:	b943      	cbnz	r3, 2948 <MillisTimer::runFromTimer()+0x58>
		if (_type == EventTypeYield) {
    2936:	7f01      	ldrb	r1, [r0, #28]
    2938:	2901      	cmp	r1, #1
    293a:	f000 8088 	beq.w	2a4e <MillisTimer::runFromTimer()+0x15e>
		} else if (_type == EventTypeInterrupt) {
    293e:	2903      	cmp	r1, #3
    2940:	f000 8091 	beq.w	2a66 <MillisTimer::runFromTimer()+0x176>
		_triggered = true;
    2944:	2301      	movs	r3, #1
    2946:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    2948:	b902      	cbnz	r2, 294c <MillisTimer::runFromTimer()+0x5c>
    294a:	b662      	cpsie	i
			if (timer->_reload) {
    294c:	6863      	ldr	r3, [r4, #4]
    294e:	2b00      	cmp	r3, #0
    2950:	d12c      	bne.n	29ac <MillisTimer::runFromTimer()+0xbc>
    2952:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    2954:	b124      	cbz	r4, 2960 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    2956:	6823      	ldr	r3, [r4, #0]
    2958:	2b00      	cmp	r3, #0
    295a:	d0d8      	beq.n	290e <MillisTimer::runFromTimer()+0x1e>
			timer->_ms--;
    295c:	3b01      	subs	r3, #1
    295e:	6023      	str	r3, [r4, #0]
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2960:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    2964:	b672      	cpsid	i
			}
			timer = listActive;
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    2966:	4a5a      	ldr	r2, [pc, #360]	; (2ad0 <MillisTimer::runFromTimer()+0x1e0>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2968:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    296a:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    296c:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    296e:	b903      	cbnz	r3, 2972 <MillisTimer::runFromTimer()+0x82>
    2970:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    2972:	2800      	cmp	r0, #0
    2974:	f000 80a5 	beq.w	2ac2 <MillisTimer::runFromTimer()+0x1d2>
    2978:	682c      	ldr	r4, [r5, #0]
	_state = TimerActive;
    297a:	2702      	movs	r7, #2
		_prev = nullptr;
    297c:	f04f 0e00 	mov.w	lr, #0
		MillisTimer *next = waiting->_next;
    2980:	6886      	ldr	r6, [r0, #8]
	if (listActive == nullptr) {
    2982:	2c00      	cmp	r4, #0
    2984:	d05f      	beq.n	2a46 <MillisTimer::runFromTimer()+0x156>
	} else if (_ms < listActive->_ms) {
    2986:	6803      	ldr	r3, [r0, #0]
    2988:	6821      	ldr	r1, [r4, #0]
    298a:	428b      	cmp	r3, r1
    298c:	d23a      	bcs.n	2a04 <MillisTimer::runFromTimer()+0x114>
		listActive->_ms -= _ms;	
    298e:	1acb      	subs	r3, r1, r3
		_next = listActive;
    2990:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2992:	f8c0 e00c 	str.w	lr, [r0, #12]
		listActive->_ms -= _ms;	
    2996:	4601      	mov	r1, r0
    2998:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    299a:	60e0      	str	r0, [r4, #12]
	_state = TimerActive;
    299c:	7507      	strb	r7, [r0, #20]
    299e:	4630      	mov	r0, r6
    29a0:	460c      	mov	r4, r1
	while (waiting) {
    29a2:	2e00      	cmp	r6, #0
    29a4:	d1ec      	bne.n	2980 <MillisTimer::runFromTimer()+0x90>
    29a6:	6029      	str	r1, [r5, #0]
    29a8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	if (listActive == nullptr) {
    29ac:	6828      	ldr	r0, [r5, #0]
    29ae:	4a46      	ldr	r2, [pc, #280]	; (2ac8 <MillisTimer::runFromTimer()+0x1d8>)
				timer->_ms = timer->_reload;
    29b0:	6023      	str	r3, [r4, #0]
	if (listActive == nullptr) {
    29b2:	2800      	cmp	r0, #0
    29b4:	d073      	beq.n	2a9e <MillisTimer::runFromTimer()+0x1ae>
	} else if (_ms < listActive->_ms) {
    29b6:	6801      	ldr	r1, [r0, #0]
    29b8:	428b      	cmp	r3, r1
    29ba:	d211      	bcs.n	29e0 <MillisTimer::runFromTimer()+0xf0>
		listActive->_ms -= _ms;	
    29bc:	1acb      	subs	r3, r1, r3
		_next = listActive;
    29be:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    29c0:	60e6      	str	r6, [r4, #12]
		listActive->_ms -= _ms;	
    29c2:	6003      	str	r3, [r0, #0]
		listActive->_prev = this;
    29c4:	60c4      	str	r4, [r0, #12]
		listActive = this;
    29c6:	6014      	str	r4, [r2, #0]
    29c8:	4620      	mov	r0, r4
	_state = TimerActive;
    29ca:	2302      	movs	r3, #2
    29cc:	7523      	strb	r3, [r4, #20]
    29ce:	4604      	mov	r4, r0
    29d0:	e7c1      	b.n	2956 <MillisTimer::runFromTimer()+0x66>
			event.triggerEvent(0, timer);
    29d2:	4622      	mov	r2, r4
    29d4:	2100      	movs	r1, #0
    29d6:	4798      	blx	r3
    29d8:	e7b8      	b.n	294c <MillisTimer::runFromTimer()+0x5c>
			(*_function)(*this);
    29da:	6883      	ldr	r3, [r0, #8]
    29dc:	4798      	blx	r3
    29de:	e7b5      	b.n	294c <MillisTimer::runFromTimer()+0x5c>
	} else if (_ms < listActive->_ms) {
    29e0:	4686      	mov	lr, r0
    29e2:	e003      	b.n	29ec <MillisTimer::runFromTimer()+0xfc>
			if (_ms < timer->_ms) {
    29e4:	6811      	ldr	r1, [r2, #0]
    29e6:	428b      	cmp	r3, r1
    29e8:	4696      	mov	lr, r2
    29ea:	d349      	bcc.n	2a80 <MillisTimer::runFromTimer()+0x190>
		while (timer->_next) {
    29ec:	f8de 2008 	ldr.w	r2, [lr, #8]
		_ms -= timer->_ms;
    29f0:	1a5b      	subs	r3, r3, r1
    29f2:	6023      	str	r3, [r4, #0]
		while (timer->_next) {
    29f4:	2a00      	cmp	r2, #0
    29f6:	d1f5      	bne.n	29e4 <MillisTimer::runFromTimer()+0xf4>
		_next = nullptr;
    29f8:	60a2      	str	r2, [r4, #8]
		_prev = timer;
    29fa:	f8c4 e00c 	str.w	lr, [r4, #12]
		timer->_next = this;
    29fe:	f8ce 4008 	str.w	r4, [lr, #8]
    2a02:	e7e2      	b.n	29ca <MillisTimer::runFromTimer()+0xda>
	} else if (_ms < listActive->_ms) {
    2a04:	46a4      	mov	ip, r4
    2a06:	e003      	b.n	2a10 <MillisTimer::runFromTimer()+0x120>
			if (_ms < timer->_ms) {
    2a08:	6811      	ldr	r1, [r2, #0]
    2a0a:	428b      	cmp	r3, r1
    2a0c:	4694      	mov	ip, r2
    2a0e:	d30c      	bcc.n	2a2a <MillisTimer::runFromTimer()+0x13a>
		while (timer->_next) {
    2a10:	f8dc 2008 	ldr.w	r2, [ip, #8]
		_ms -= timer->_ms;
    2a14:	1a5b      	subs	r3, r3, r1
    2a16:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    2a18:	2a00      	cmp	r2, #0
    2a1a:	d1f5      	bne.n	2a08 <MillisTimer::runFromTimer()+0x118>
		_next = nullptr;
    2a1c:	6082      	str	r2, [r0, #8]
		_prev = timer;
    2a1e:	f8c0 c00c 	str.w	ip, [r0, #12]
		timer->_next = this;
    2a22:	4621      	mov	r1, r4
    2a24:	f8cc 0008 	str.w	r0, [ip, #8]
    2a28:	e7b8      	b.n	299c <MillisTimer::runFromTimer()+0xac>
				_prev = timer->_prev;
    2a2a:	68d2      	ldr	r2, [r2, #12]
    2a2c:	60c2      	str	r2, [r0, #12]
				_next = timer;
    2a2e:	f8c0 c008 	str.w	ip, [r0, #8]
				timer->_prev = this;
    2a32:	f8cc 000c 	str.w	r0, [ip, #12]
				_prev->_next = this;
    2a36:	68c2      	ldr	r2, [r0, #12]
				timer->_ms -= _ms;
    2a38:	1acb      	subs	r3, r1, r3
				_prev->_next = this;
    2a3a:	6090      	str	r0, [r2, #8]
				_state = TimerActive;
    2a3c:	4621      	mov	r1, r4
				timer->_ms -= _ms;
    2a3e:	f8cc 3000 	str.w	r3, [ip]
				_state = TimerActive;
    2a42:	7507      	strb	r7, [r0, #20]
    2a44:	e7ab      	b.n	299e <MillisTimer::runFromTimer()+0xae>
		_next = nullptr;
    2a46:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2a48:	60c4      	str	r4, [r0, #12]
    2a4a:	4601      	mov	r1, r0
    2a4c:	e7a6      	b.n	299c <MillisTimer::runFromTimer()+0xac>
			if (firstYield == nullptr) {
    2a4e:	f8df e094 	ldr.w	lr, [pc, #148]	; 2ae4 <MillisTimer::runFromTimer()+0x1f4>
    2a52:	f8de 1000 	ldr.w	r1, [lr]
    2a56:	b339      	cbz	r1, 2aa8 <MillisTimer::runFromTimer()+0x1b8>
				_prev = lastYield;
    2a58:	491e      	ldr	r1, [pc, #120]	; (2ad4 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    2a5a:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    2a5c:	680b      	ldr	r3, [r1, #0]
    2a5e:	6183      	str	r3, [r0, #24]
				lastYield = this;
    2a60:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2a62:	6158      	str	r0, [r3, #20]
    2a64:	e76e      	b.n	2944 <MillisTimer::runFromTimer()+0x54>
			if (firstInterrupt == nullptr) {
    2a66:	6839      	ldr	r1, [r7, #0]
    2a68:	b329      	cbz	r1, 2ab6 <MillisTimer::runFromTimer()+0x1c6>
				_prev = lastInterrupt;
    2a6a:	491b      	ldr	r1, [pc, #108]	; (2ad8 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2a6c:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    2a6e:	680b      	ldr	r3, [r1, #0]
    2a70:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    2a72:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2a74:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2a76:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    2a7a:	f8c8 3000 	str.w	r3, [r8]
    2a7e:	e761      	b.n	2944 <MillisTimer::runFromTimer()+0x54>
				_prev = timer->_prev;
    2a80:	68d2      	ldr	r2, [r2, #12]
    2a82:	60e2      	str	r2, [r4, #12]
				_next = timer;
    2a84:	f8c4 e008 	str.w	lr, [r4, #8]
				timer->_prev = this;
    2a88:	f8ce 400c 	str.w	r4, [lr, #12]
				_prev->_next = this;
    2a8c:	68e2      	ldr	r2, [r4, #12]
				timer->_ms -= _ms;
    2a8e:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    2a90:	2102      	movs	r1, #2
				_prev->_next = this;
    2a92:	6094      	str	r4, [r2, #8]
				timer->_ms -= _ms;
    2a94:	f8ce 3000 	str.w	r3, [lr]
				_state = TimerActive;
    2a98:	7521      	strb	r1, [r4, #20]
    2a9a:	4604      	mov	r4, r0
    2a9c:	e75b      	b.n	2956 <MillisTimer::runFromTimer()+0x66>
		_next = nullptr;
    2a9e:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2aa0:	60e0      	str	r0, [r4, #12]
		listActive = this;
    2aa2:	6014      	str	r4, [r2, #0]
    2aa4:	4620      	mov	r0, r4
    2aa6:	e790      	b.n	29ca <MillisTimer::runFromTimer()+0xda>
				lastYield = this;
    2aa8:	4b0a      	ldr	r3, [pc, #40]	; (2ad4 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    2aaa:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    2aac:	6181      	str	r1, [r0, #24]
				firstYield = this;
    2aae:	f8ce 0000 	str.w	r0, [lr]
				lastYield = this;
    2ab2:	6018      	str	r0, [r3, #0]
    2ab4:	e746      	b.n	2944 <MillisTimer::runFromTimer()+0x54>
				lastInterrupt = this;
    2ab6:	4b08      	ldr	r3, [pc, #32]	; (2ad8 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2ab8:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    2aba:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    2abc:	6038      	str	r0, [r7, #0]
				lastInterrupt = this;
    2abe:	6018      	str	r0, [r3, #0]
    2ac0:	e7d9      	b.n	2a76 <MillisTimer::runFromTimer()+0x186>
    2ac2:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    2ac6:	bf00      	nop
    2ac8:	1fff94c0 	.word	0x1fff94c0
    2acc:	1fff94b8 	.word	0x1fff94b8
    2ad0:	1fff94d0 	.word	0x1fff94d0
    2ad4:	1fff94c4 	.word	0x1fff94c4
    2ad8:	1fff94bc 	.word	0x1fff94bc
    2adc:	0000281d 	.word	0x0000281d
    2ae0:	e000ed04 	.word	0xe000ed04
    2ae4:	1fff94c8 	.word	0x1fff94c8

00002ae8 <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    2ae8:	4a02      	ldr	r2, [pc, #8]	; (2af4 <systick_isr+0xc>)
    2aea:	6813      	ldr	r3, [r2, #0]
    2aec:	3301      	adds	r3, #1
    2aee:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    2af0:	f7ff befe 	b.w	28f0 <MillisTimer::runFromTimer()>
    2af4:	1fff93b8 	.word	0x1fff93b8

00002af8 <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    2af8:	4770      	bx	lr
    2afa:	bf00      	nop

00002afc <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    2afc:	4770      	bx	lr
    2afe:	bf00      	nop

00002b00 <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    2b00:	4770      	bx	lr
    2b02:	bf00      	nop

00002b04 <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    2b04:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    2b06:	4829      	ldr	r0, [pc, #164]	; (2bac <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2b08:	4a29      	ldr	r2, [pc, #164]	; (2bb0 <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    2b0a:	4b2a      	ldr	r3, [pc, #168]	; (2bb4 <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2b0c:	4d2a      	ldr	r5, [pc, #168]	; (2bb8 <analog_init+0xb4>)
	VREF_TRM = 0x60;
    2b0e:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2b10:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    2b12:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2b14:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    2b16:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2b18:	4c28      	ldr	r4, [pc, #160]	; (2bbc <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    2b1a:	2b08      	cmp	r3, #8
    2b1c:	d030      	beq.n	2b80 <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    2b1e:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2b20:	4827      	ldr	r0, [pc, #156]	; (2bc0 <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2b22:	4928      	ldr	r1, [pc, #160]	; (2bc4 <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    2b24:	d037      	beq.n	2b96 <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    2b26:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    2b28:	bf0c      	ite	eq
    2b2a:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2b2c:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2b2e:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2b30:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2b32:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2b34:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2b36:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    2b38:	4b23      	ldr	r3, [pc, #140]	; (2bc8 <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2b3a:	4924      	ldr	r1, [pc, #144]	; (2bcc <analog_init+0xc8>)
	if (analog_reference_internal) {
    2b3c:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2b3e:	4a24      	ldr	r2, [pc, #144]	; (2bd0 <analog_init+0xcc>)
	if (analog_reference_internal) {
    2b40:	b1bb      	cbz	r3, 2b72 <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2b42:	2301      	movs	r3, #1
    2b44:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2b46:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    2b48:	4b22      	ldr	r3, [pc, #136]	; (2bd4 <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    2b4a:	4923      	ldr	r1, [pc, #140]	; (2bd8 <analog_init+0xd4>)
	num = analog_num_average;
    2b4c:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2b4e:	4a23      	ldr	r2, [pc, #140]	; (2bdc <analog_init+0xd8>)
	if (num <= 1) {
    2b50:	2b01      	cmp	r3, #1
    2b52:	d926      	bls.n	2ba2 <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    2b54:	2b04      	cmp	r3, #4
    2b56:	d90f      	bls.n	2b78 <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    2b58:	2b08      	cmp	r3, #8
    2b5a:	d91e      	bls.n	2b9a <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    2b5c:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    2b5e:	bf94      	ite	ls
    2b60:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2b62:	2387      	movhi	r3, #135	; 0x87
    2b64:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2b66:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    2b68:	4b1d      	ldr	r3, [pc, #116]	; (2be0 <analog_init+0xdc>)
    2b6a:	2201      	movs	r2, #1
    2b6c:	701a      	strb	r2, [r3, #0]
}
    2b6e:	bc30      	pop	{r4, r5}
    2b70:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2b72:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2b74:	6013      	str	r3, [r2, #0]
    2b76:	e7e7      	b.n	2b48 <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2b78:	2384      	movs	r3, #132	; 0x84
    2b7a:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2b7c:	6013      	str	r3, [r2, #0]
    2b7e:	e7f3      	b.n	2b68 <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2b80:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2b84:	490f      	ldr	r1, [pc, #60]	; (2bc4 <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2b86:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2b88:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2b8a:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2b8c:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2b8e:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2b90:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2b92:	600b      	str	r3, [r1, #0]
    2b94:	e7d0      	b.n	2b38 <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2b96:	2239      	movs	r2, #57	; 0x39
    2b98:	e7f7      	b.n	2b8a <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    2b9a:	2385      	movs	r3, #133	; 0x85
    2b9c:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    2b9e:	6013      	str	r3, [r2, #0]
    2ba0:	e7e2      	b.n	2b68 <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    2ba2:	2380      	movs	r3, #128	; 0x80
    2ba4:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2ba6:	6013      	str	r3, [r2, #0]
    2ba8:	e7de      	b.n	2b68 <analog_init+0x64>
    2baa:	bf00      	nop
    2bac:	40074000 	.word	0x40074000
    2bb0:	40074001 	.word	0x40074001
    2bb4:	1fff8904 	.word	0x1fff8904
    2bb8:	4003b008 	.word	0x4003b008
    2bbc:	4003b00c 	.word	0x4003b00c
    2bc0:	400bb008 	.word	0x400bb008
    2bc4:	400bb00c 	.word	0x400bb00c
    2bc8:	1fff94d5 	.word	0x1fff94d5
    2bcc:	4003b020 	.word	0x4003b020
    2bd0:	400bb020 	.word	0x400bb020
    2bd4:	1fff8905 	.word	0x1fff8905
    2bd8:	4003b024 	.word	0x4003b024
    2bdc:	400bb024 	.word	0x400bb024
    2be0:	1fff94d4 	.word	0x1fff94d4

00002be4 <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2be4:	4a05      	ldr	r2, [pc, #20]	; (2bfc <serial_available+0x18>)
	tail = rx_buffer_tail;
    2be6:	4b06      	ldr	r3, [pc, #24]	; (2c00 <serial_available+0x1c>)
	head = rx_buffer_head;
    2be8:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2bea:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2bec:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2bee:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2bf0:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    2bf2:	bf38      	it	cc
    2bf4:	3040      	addcc	r0, #64	; 0x40
    2bf6:	1ac0      	subs	r0, r0, r3
}
    2bf8:	4770      	bx	lr
    2bfa:	bf00      	nop
    2bfc:	1fff9560 	.word	0x1fff9560
    2c00:	1fff94dd 	.word	0x1fff94dd

00002c04 <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    2c04:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    2c06:	4b38      	ldr	r3, [pc, #224]	; (2ce8 <uart0_status_isr+0xe4>)
    2c08:	791a      	ldrb	r2, [r3, #4]
    2c0a:	f012 0f30 	tst.w	r2, #48	; 0x30
    2c0e:	d02c      	beq.n	2c6a <uart0_status_isr+0x66>
		__disable_irq();
    2c10:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    2c12:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2c14:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2c18:	2900      	cmp	r1, #0
    2c1a:	d03d      	beq.n	2c98 <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2c1c:	b662      	cpsie	i
			head = rx_buffer_head;
    2c1e:	4f33      	ldr	r7, [pc, #204]	; (2cec <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2c20:	4933      	ldr	r1, [pc, #204]	; (2cf0 <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    2c22:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2c24:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2c26:	4e33      	ldr	r6, [pc, #204]	; (2cf4 <uart0_status_isr+0xf0>)
					n = UART0_D;
    2c28:	461c      	mov	r4, r3
			head = rx_buffer_head;
    2c2a:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2c2c:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2c2e:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2c30:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    2c32:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2c34:	bf28      	it	cs
    2c36:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2c38:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2c3a:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    2c3e:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2c40:	bf1c      	itt	ne
    2c42:	54f1      	strbne	r1, [r6, r3]
    2c44:	4618      	movne	r0, r3
			} while (--avail > 0);
    2c46:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2c4a:	d1f0      	bne.n	2c2e <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2c4c:	4b2a      	ldr	r3, [pc, #168]	; (2cf8 <uart0_status_isr+0xf4>)
    2c4e:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2c50:	b2c2      	uxtb	r2, r0
    2c52:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2c54:	b14b      	cbz	r3, 2c6a <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2c56:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2c58:	bf36      	itet	cc
    2c5a:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2c5e:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2c60:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2c62:	2827      	cmp	r0, #39	; 0x27
    2c64:	bfc4      	itt	gt
    2c66:	2201      	movgt	r2, #1
    2c68:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    2c6a:	491f      	ldr	r1, [pc, #124]	; (2ce8 <uart0_status_isr+0xe4>)
    2c6c:	78ca      	ldrb	r2, [r1, #3]
    2c6e:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2c70:	0615      	lsls	r5, r2, #24
    2c72:	d416      	bmi.n	2ca2 <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    2c74:	0652      	lsls	r2, r2, #25
    2c76:	d50d      	bpl.n	2c94 <uart0_status_isr+0x90>
    2c78:	4b1b      	ldr	r3, [pc, #108]	; (2ce8 <uart0_status_isr+0xe4>)
    2c7a:	791b      	ldrb	r3, [r3, #4]
    2c7c:	065b      	lsls	r3, r3, #25
    2c7e:	d509      	bpl.n	2c94 <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2c80:	4b1e      	ldr	r3, [pc, #120]	; (2cfc <uart0_status_isr+0xf8>)
		transmitting = 0;
    2c82:	491f      	ldr	r1, [pc, #124]	; (2d00 <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2c84:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2c86:	2200      	movs	r2, #0
    2c88:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2c8a:	b103      	cbz	r3, 2c8e <uart0_status_isr+0x8a>
    2c8c:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    2c8e:	4b16      	ldr	r3, [pc, #88]	; (2ce8 <uart0_status_isr+0xe4>)
    2c90:	223c      	movs	r2, #60	; 0x3c
    2c92:	70da      	strb	r2, [r3, #3]
	}
}
    2c94:	bcf0      	pop	{r4, r5, r6, r7}
    2c96:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2c98:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    2c9a:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2c9c:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    2c9e:	b662      	cpsie	i
    2ca0:	e7e3      	b.n	2c6a <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2ca2:	790b      	ldrb	r3, [r1, #4]
    2ca4:	061c      	lsls	r4, r3, #24
    2ca6:	d5e5      	bpl.n	2c74 <uart0_status_isr+0x70>
		head = tx_buffer_head;
    2ca8:	4b16      	ldr	r3, [pc, #88]	; (2d04 <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    2caa:	4e17      	ldr	r6, [pc, #92]	; (2d08 <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    2cac:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    2cae:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2cb0:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    2cb2:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2cb4:	429c      	cmp	r4, r3
    2cb6:	d00e      	beq.n	2cd6 <uart0_status_isr+0xd2>
    2cb8:	4d14      	ldr	r5, [pc, #80]	; (2d0c <uart0_status_isr+0x108>)
    2cba:	e001      	b.n	2cc0 <uart0_status_isr+0xbc>
    2cbc:	42a3      	cmp	r3, r4
    2cbe:	d00a      	beq.n	2cd6 <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    2cc0:	3301      	adds	r3, #1
    2cc2:	2b40      	cmp	r3, #64	; 0x40
    2cc4:	bf28      	it	cs
    2cc6:	2300      	movcs	r3, #0
			avail = UART0_S1;
    2cc8:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    2cca:	5ce8      	ldrb	r0, [r5, r3]
    2ccc:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    2cce:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    2cd0:	7d08      	ldrb	r0, [r1, #20]
    2cd2:	2807      	cmp	r0, #7
    2cd4:	d9f2      	bls.n	2cbc <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    2cd6:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    2cd8:	4903      	ldr	r1, [pc, #12]	; (2ce8 <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    2cda:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    2cdc:	790b      	ldrb	r3, [r1, #4]
    2cde:	0618      	lsls	r0, r3, #24
    2ce0:	bf44      	itt	mi
    2ce2:	237c      	movmi	r3, #124	; 0x7c
    2ce4:	70cb      	strbmi	r3, [r1, #3]
    2ce6:	e7c5      	b.n	2c74 <uart0_status_isr+0x70>
    2ce8:	4006a000 	.word	0x4006a000
    2cec:	1fff9560 	.word	0x1fff9560
    2cf0:	1fff94dd 	.word	0x1fff94dd
    2cf4:	1fff9520 	.word	0x1fff9520
    2cf8:	1fff94d8 	.word	0x1fff94d8
    2cfc:	1fff9564 	.word	0x1fff9564
    2d00:	1fff94dc 	.word	0x1fff94dc
    2d04:	1fff9568 	.word	0x1fff9568
    2d08:	1fff9561 	.word	0x1fff9561
    2d0c:	1fff94e0 	.word	0x1fff94e0

00002d10 <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2d10:	4a05      	ldr	r2, [pc, #20]	; (2d28 <serial2_available+0x18>)
	tail = rx_buffer_tail;
    2d12:	4b06      	ldr	r3, [pc, #24]	; (2d2c <serial2_available+0x1c>)
	head = rx_buffer_head;
    2d14:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2d16:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2d18:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2d1a:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2d1c:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    2d1e:	bf38      	it	cc
    2d20:	3040      	addcc	r0, #64	; 0x40
    2d22:	1ac0      	subs	r0, r0, r3
}
    2d24:	4770      	bx	lr
    2d26:	bf00      	nop
    2d28:	1fff95dc 	.word	0x1fff95dc
    2d2c:	1fff9571 	.word	0x1fff9571

00002d30 <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    2d30:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    2d32:	4b38      	ldr	r3, [pc, #224]	; (2e14 <uart1_status_isr+0xe4>)
    2d34:	791a      	ldrb	r2, [r3, #4]
    2d36:	f012 0f30 	tst.w	r2, #48	; 0x30
    2d3a:	d02c      	beq.n	2d96 <uart1_status_isr+0x66>
		__disable_irq();
    2d3c:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    2d3e:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2d40:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2d44:	2900      	cmp	r1, #0
    2d46:	d03d      	beq.n	2dc4 <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2d48:	b662      	cpsie	i
			head = rx_buffer_head;
    2d4a:	4f33      	ldr	r7, [pc, #204]	; (2e18 <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2d4c:	4933      	ldr	r1, [pc, #204]	; (2e1c <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    2d4e:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2d50:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2d52:	4e33      	ldr	r6, [pc, #204]	; (2e20 <uart1_status_isr+0xf0>)
					n = UART1_D;
    2d54:	461c      	mov	r4, r3
			head = rx_buffer_head;
    2d56:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2d58:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2d5a:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2d5c:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    2d5e:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2d60:	bf28      	it	cs
    2d62:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2d64:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2d66:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    2d6a:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2d6c:	bf1c      	itt	ne
    2d6e:	54f1      	strbne	r1, [r6, r3]
    2d70:	4618      	movne	r0, r3
			} while (--avail > 0);
    2d72:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2d76:	d1f0      	bne.n	2d5a <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2d78:	4b2a      	ldr	r3, [pc, #168]	; (2e24 <uart1_status_isr+0xf4>)
    2d7a:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2d7c:	b2c2      	uxtb	r2, r0
    2d7e:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2d80:	b14b      	cbz	r3, 2d96 <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2d82:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2d84:	bf36      	itet	cc
    2d86:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2d8a:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2d8c:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2d8e:	2827      	cmp	r0, #39	; 0x27
    2d90:	bfc4      	itt	gt
    2d92:	2201      	movgt	r2, #1
    2d94:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    2d96:	491f      	ldr	r1, [pc, #124]	; (2e14 <uart1_status_isr+0xe4>)
    2d98:	78ca      	ldrb	r2, [r1, #3]
    2d9a:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2d9c:	0615      	lsls	r5, r2, #24
    2d9e:	d416      	bmi.n	2dce <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    2da0:	0652      	lsls	r2, r2, #25
    2da2:	d50d      	bpl.n	2dc0 <uart1_status_isr+0x90>
    2da4:	4b1b      	ldr	r3, [pc, #108]	; (2e14 <uart1_status_isr+0xe4>)
    2da6:	791b      	ldrb	r3, [r3, #4]
    2da8:	065b      	lsls	r3, r3, #25
    2daa:	d509      	bpl.n	2dc0 <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2dac:	4b1e      	ldr	r3, [pc, #120]	; (2e28 <uart1_status_isr+0xf8>)
		transmitting = 0;
    2dae:	491f      	ldr	r1, [pc, #124]	; (2e2c <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2db0:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2db2:	2200      	movs	r2, #0
    2db4:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2db6:	b103      	cbz	r3, 2dba <uart1_status_isr+0x8a>
    2db8:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    2dba:	4b16      	ldr	r3, [pc, #88]	; (2e14 <uart1_status_isr+0xe4>)
    2dbc:	223c      	movs	r2, #60	; 0x3c
    2dbe:	70da      	strb	r2, [r3, #3]
	}
}
    2dc0:	bcf0      	pop	{r4, r5, r6, r7}
    2dc2:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2dc4:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    2dc6:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2dc8:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    2dca:	b662      	cpsie	i
    2dcc:	e7e3      	b.n	2d96 <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2dce:	790b      	ldrb	r3, [r1, #4]
    2dd0:	061c      	lsls	r4, r3, #24
    2dd2:	d5e5      	bpl.n	2da0 <uart1_status_isr+0x70>
		head = tx_buffer_head;
    2dd4:	4b16      	ldr	r3, [pc, #88]	; (2e30 <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    2dd6:	4e17      	ldr	r6, [pc, #92]	; (2e34 <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    2dd8:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    2dda:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2ddc:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    2dde:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2de0:	429c      	cmp	r4, r3
    2de2:	d00e      	beq.n	2e02 <uart1_status_isr+0xd2>
    2de4:	4d14      	ldr	r5, [pc, #80]	; (2e38 <uart1_status_isr+0x108>)
    2de6:	e001      	b.n	2dec <uart1_status_isr+0xbc>
    2de8:	42a3      	cmp	r3, r4
    2dea:	d00a      	beq.n	2e02 <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    2dec:	3301      	adds	r3, #1
    2dee:	2b28      	cmp	r3, #40	; 0x28
    2df0:	bf28      	it	cs
    2df2:	2300      	movcs	r3, #0
			avail = UART1_S1;
    2df4:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    2df6:	5ce8      	ldrb	r0, [r5, r3]
    2df8:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    2dfa:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    2dfc:	7d08      	ldrb	r0, [r1, #20]
    2dfe:	2807      	cmp	r0, #7
    2e00:	d9f2      	bls.n	2de8 <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    2e02:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    2e04:	4903      	ldr	r1, [pc, #12]	; (2e14 <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    2e06:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    2e08:	790b      	ldrb	r3, [r1, #4]
    2e0a:	0618      	lsls	r0, r3, #24
    2e0c:	bf44      	itt	mi
    2e0e:	237c      	movmi	r3, #124	; 0x7c
    2e10:	70cb      	strbmi	r3, [r1, #3]
    2e12:	e7c5      	b.n	2da0 <uart1_status_isr+0x70>
    2e14:	4006b000 	.word	0x4006b000
    2e18:	1fff95dc 	.word	0x1fff95dc
    2e1c:	1fff9571 	.word	0x1fff9571
    2e20:	1fff959c 	.word	0x1fff959c
    2e24:	1fff956c 	.word	0x1fff956c
    2e28:	1fff95e0 	.word	0x1fff95e0
    2e2c:	1fff9570 	.word	0x1fff9570
    2e30:	1fff95e4 	.word	0x1fff95e4
    2e34:	1fff95dd 	.word	0x1fff95dd
    2e38:	1fff9574 	.word	0x1fff9574

00002e3c <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2e3c:	4a05      	ldr	r2, [pc, #20]	; (2e54 <serial3_available+0x18>)
	tail = rx_buffer_tail;
    2e3e:	4b06      	ldr	r3, [pc, #24]	; (2e58 <serial3_available+0x1c>)
	head = rx_buffer_head;
    2e40:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2e42:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2e44:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2e46:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2e48:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    2e4a:	bf38      	it	cc
    2e4c:	3040      	addcc	r0, #64	; 0x40
    2e4e:	1ac0      	subs	r0, r0, r3
}
    2e50:	4770      	bx	lr
    2e52:	bf00      	nop
    2e54:	1fff9658 	.word	0x1fff9658
    2e58:	1fff95ed 	.word	0x1fff95ed

00002e5c <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    2e5c:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    2e5e:	4b2b      	ldr	r3, [pc, #172]	; (2f0c <uart2_status_isr+0xb0>)
    2e60:	791a      	ldrb	r2, [r3, #4]
    2e62:	0694      	lsls	r4, r2, #26
    2e64:	d51f      	bpl.n	2ea6 <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    2e66:	482a      	ldr	r0, [pc, #168]	; (2f10 <uart2_status_isr+0xb4>)
			n = UART2_D;
    2e68:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    2e6a:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    2e6c:	4929      	ldr	r1, [pc, #164]	; (2f14 <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    2e6e:	3301      	adds	r3, #1
    2e70:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    2e72:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    2e74:	bfc8      	it	gt
    2e76:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    2e78:	428b      	cmp	r3, r1
			n = UART2_D;
    2e7a:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    2e7c:	d003      	beq.n	2e86 <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    2e7e:	4c26      	ldr	r4, [pc, #152]	; (2f18 <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    2e80:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    2e82:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    2e84:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    2e86:	4a25      	ldr	r2, [pc, #148]	; (2f1c <uart2_status_isr+0xc0>)
    2e88:	6811      	ldr	r1, [r2, #0]
    2e8a:	b161      	cbz	r1, 2ea6 <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    2e8c:	4a24      	ldr	r2, [pc, #144]	; (2f20 <uart2_status_isr+0xc4>)
    2e8e:	7812      	ldrb	r2, [r2, #0]
    2e90:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    2e92:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2e94:	bf36      	itet	cc
    2e96:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    2e9a:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2e9c:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2e9e:	2b27      	cmp	r3, #39	; 0x27
    2ea0:	bfc4      	itt	gt
    2ea2:	2301      	movgt	r3, #1
    2ea4:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    2ea6:	4a19      	ldr	r2, [pc, #100]	; (2f0c <uart2_status_isr+0xb0>)
    2ea8:	78d3      	ldrb	r3, [r2, #3]
    2eaa:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2eac:	0618      	lsls	r0, r3, #24
    2eae:	d411      	bmi.n	2ed4 <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    2eb0:	065a      	lsls	r2, r3, #25
    2eb2:	d50d      	bpl.n	2ed0 <uart2_status_isr+0x74>
    2eb4:	4b15      	ldr	r3, [pc, #84]	; (2f0c <uart2_status_isr+0xb0>)
    2eb6:	791b      	ldrb	r3, [r3, #4]
    2eb8:	065b      	lsls	r3, r3, #25
    2eba:	d509      	bpl.n	2ed0 <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2ebc:	4b19      	ldr	r3, [pc, #100]	; (2f24 <uart2_status_isr+0xc8>)
		transmitting = 0;
    2ebe:	491a      	ldr	r1, [pc, #104]	; (2f28 <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    2ec0:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2ec2:	2200      	movs	r2, #0
    2ec4:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2ec6:	b103      	cbz	r3, 2eca <uart2_status_isr+0x6e>
    2ec8:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    2eca:	4b10      	ldr	r3, [pc, #64]	; (2f0c <uart2_status_isr+0xb0>)
    2ecc:	222c      	movs	r2, #44	; 0x2c
    2ece:	70da      	strb	r2, [r3, #3]
	}
}
    2ed0:	bc30      	pop	{r4, r5}
    2ed2:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2ed4:	7911      	ldrb	r1, [r2, #4]
    2ed6:	0609      	lsls	r1, r1, #24
    2ed8:	d5ea      	bpl.n	2eb0 <uart2_status_isr+0x54>
		head = tx_buffer_head;
    2eda:	4914      	ldr	r1, [pc, #80]	; (2f2c <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    2edc:	4810      	ldr	r0, [pc, #64]	; (2f20 <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    2ede:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    2ee0:	7801      	ldrb	r1, [r0, #0]
    2ee2:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    2ee4:	428c      	cmp	r4, r1
    2ee6:	d00d      	beq.n	2f04 <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    2ee8:	1c4a      	adds	r2, r1, #1
    2eea:	2a27      	cmp	r2, #39	; 0x27
    2eec:	bf84      	itt	hi
    2eee:	2100      	movhi	r1, #0
    2ef0:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    2ef2:	4d0f      	ldr	r5, [pc, #60]	; (2f30 <uart2_status_isr+0xd4>)
			UART2_D = n;
    2ef4:	4c05      	ldr	r4, [pc, #20]	; (2f0c <uart2_status_isr+0xb0>)
    2ef6:	bf98      	it	ls
    2ef8:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    2efa:	5caa      	ldrb	r2, [r5, r2]
    2efc:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    2efe:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    2f00:	7001      	strb	r1, [r0, #0]
    2f02:	e7d5      	b.n	2eb0 <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    2f04:	216c      	movs	r1, #108	; 0x6c
    2f06:	70d1      	strb	r1, [r2, #3]
    2f08:	e7d2      	b.n	2eb0 <uart2_status_isr+0x54>
    2f0a:	bf00      	nop
    2f0c:	4006c000 	.word	0x4006c000
    2f10:	1fff9658 	.word	0x1fff9658
    2f14:	1fff95ed 	.word	0x1fff95ed
    2f18:	1fff9618 	.word	0x1fff9618
    2f1c:	1fff95e8 	.word	0x1fff95e8
    2f20:	1fff9659 	.word	0x1fff9659
    2f24:	1fff965c 	.word	0x1fff965c
    2f28:	1fff95ec 	.word	0x1fff95ec
    2f2c:	1fff9660 	.word	0x1fff9660
    2f30:	1fff95f0 	.word	0x1fff95f0

00002f34 <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    2f34:	b570      	push	{r4, r5, r6, lr}
    2f36:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    2f38:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2f3a:	4b30      	ldr	r3, [pc, #192]	; (2ffc <usb_init_serialnumber+0xc8>)
	FTFL_FCCOB0 = 0x41;
    2f3c:	4d30      	ldr	r5, [pc, #192]	; (3000 <usb_init_serialnumber+0xcc>)
	FTFL_FCCOB1 = 15;
    2f3e:	4831      	ldr	r0, [pc, #196]	; (3004 <usb_init_serialnumber+0xd0>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2f40:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    2f42:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    2f44:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2f46:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2f48:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    2f4a:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2f4c:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    2f4e:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2f50:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2f52:	7813      	ldrb	r3, [r2, #0]
    2f54:	061b      	lsls	r3, r3, #24
    2f56:	d5fc      	bpl.n	2f52 <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    2f58:	4b2b      	ldr	r3, [pc, #172]	; (3008 <usb_init_serialnumber+0xd4>)
    2f5a:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    2f5c:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    2f5e:	4b2b      	ldr	r3, [pc, #172]	; (300c <usb_init_serialnumber+0xd8>)
    2f60:	4298      	cmp	r0, r3
    2f62:	bf98      	it	ls
    2f64:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    2f68:	f04f 020a 	mov.w	r2, #10
	if (num < 10000000) num = num * 10;
    2f6c:	bf98      	it	ls
    2f6e:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    2f70:	a901      	add	r1, sp, #4
    2f72:	f7fe f917 	bl	11a4 <ultoa>
	for (i=0; i<10; i++) {
		char c = buf[i];
    2f76:	f89d 2004 	ldrb.w	r2, [sp, #4]
    2f7a:	4b25      	ldr	r3, [pc, #148]	; (3010 <usb_init_serialnumber+0xdc>)
		if (!c) break;
    2f7c:	b352      	cbz	r2, 2fd4 <usb_init_serialnumber+0xa0>
		char c = buf[i];
    2f7e:	f89d 1005 	ldrb.w	r1, [sp, #5]
		usb_string_serial_number_default.wString[i] = c;
    2f82:	805a      	strh	r2, [r3, #2]
		if (!c) break;
    2f84:	b361      	cbz	r1, 2fe0 <usb_init_serialnumber+0xac>
		char c = buf[i];
    2f86:	f89d 2006 	ldrb.w	r2, [sp, #6]
		usb_string_serial_number_default.wString[i] = c;
    2f8a:	8099      	strh	r1, [r3, #4]
		if (!c) break;
    2f8c:	b352      	cbz	r2, 2fe4 <usb_init_serialnumber+0xb0>
		char c = buf[i];
    2f8e:	f89d 1007 	ldrb.w	r1, [sp, #7]
		usb_string_serial_number_default.wString[i] = c;
    2f92:	80da      	strh	r2, [r3, #6]
		if (!c) break;
    2f94:	b341      	cbz	r1, 2fe8 <usb_init_serialnumber+0xb4>
		char c = buf[i];
    2f96:	f89d 2008 	ldrb.w	r2, [sp, #8]
		usb_string_serial_number_default.wString[i] = c;
    2f9a:	8119      	strh	r1, [r3, #8]
		if (!c) break;
    2f9c:	b332      	cbz	r2, 2fec <usb_init_serialnumber+0xb8>
		char c = buf[i];
    2f9e:	f89d 1009 	ldrb.w	r1, [sp, #9]
		usb_string_serial_number_default.wString[i] = c;
    2fa2:	815a      	strh	r2, [r3, #10]
		if (!c) break;
    2fa4:	b321      	cbz	r1, 2ff0 <usb_init_serialnumber+0xbc>
		char c = buf[i];
    2fa6:	f89d 200a 	ldrb.w	r2, [sp, #10]
		usb_string_serial_number_default.wString[i] = c;
    2faa:	8199      	strh	r1, [r3, #12]
		if (!c) break;
    2fac:	b312      	cbz	r2, 2ff4 <usb_init_serialnumber+0xc0>
		char c = buf[i];
    2fae:	f89d 100b 	ldrb.w	r1, [sp, #11]
		usb_string_serial_number_default.wString[i] = c;
    2fb2:	81da      	strh	r2, [r3, #14]
		if (!c) break;
    2fb4:	b301      	cbz	r1, 2ff8 <usb_init_serialnumber+0xc4>
		char c = buf[i];
    2fb6:	f89d 200c 	ldrb.w	r2, [sp, #12]
		usb_string_serial_number_default.wString[i] = c;
    2fba:	8219      	strh	r1, [r3, #16]
		if (!c) break;
    2fbc:	b14a      	cbz	r2, 2fd2 <usb_init_serialnumber+0x9e>
		char c = buf[i];
    2fbe:	f89d 100d 	ldrb.w	r1, [sp, #13]
		usb_string_serial_number_default.wString[i] = c;
    2fc2:	825a      	strh	r2, [r3, #18]
	for (i=0; i<10; i++) {
    2fc4:	2209      	movs	r2, #9
		if (!c) break;
    2fc6:	b129      	cbz	r1, 2fd4 <usb_init_serialnumber+0xa0>
    2fc8:	2216      	movs	r2, #22
		usb_string_serial_number_default.wString[i] = c;
    2fca:	8299      	strh	r1, [r3, #20]
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    2fcc:	701a      	strb	r2, [r3, #0]
}
    2fce:	b004      	add	sp, #16
    2fd0:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    2fd2:	2208      	movs	r2, #8
    2fd4:	3201      	adds	r2, #1
    2fd6:	0052      	lsls	r2, r2, #1
    2fd8:	b2d2      	uxtb	r2, r2
	usb_string_serial_number_default.bLength = i * 2 + 2;
    2fda:	701a      	strb	r2, [r3, #0]
}
    2fdc:	b004      	add	sp, #16
    2fde:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    2fe0:	2201      	movs	r2, #1
    2fe2:	e7f7      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2fe4:	2202      	movs	r2, #2
    2fe6:	e7f5      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2fe8:	2203      	movs	r2, #3
    2fea:	e7f3      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2fec:	2204      	movs	r2, #4
    2fee:	e7f1      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2ff0:	2205      	movs	r2, #5
    2ff2:	e7ef      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2ff4:	2206      	movs	r2, #6
    2ff6:	e7ed      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2ff8:	2207      	movs	r2, #7
    2ffa:	e7eb      	b.n	2fd4 <usb_init_serialnumber+0xa0>
    2ffc:	40020000 	.word	0x40020000
    3000:	40020007 	.word	0x40020007
    3004:	40020006 	.word	0x40020006
    3008:	40020008 	.word	0x40020008
    300c:	0098967f 	.word	0x0098967f
    3010:	1fff8994 	.word	0x1fff8994

00003014 <__aeabi_atexit>:
    3014:	460b      	mov	r3, r1
    3016:	4601      	mov	r1, r0
    3018:	4618      	mov	r0, r3
    301a:	f000 bf47 	b.w	3eac <__cxa_atexit>
    301e:	bf00      	nop

00003020 <__aeabi_drsub>:
    3020:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000
    3024:	e002      	b.n	302c <__adddf3>
    3026:	bf00      	nop

00003028 <__aeabi_dsub>:
    3028:	f083 4300 	eor.w	r3, r3, #2147483648	; 0x80000000

0000302c <__adddf3>:
    302c:	b530      	push	{r4, r5, lr}
    302e:	ea4f 0441 	mov.w	r4, r1, lsl #1
    3032:	ea4f 0543 	mov.w	r5, r3, lsl #1
    3036:	ea94 0f05 	teq	r4, r5
    303a:	bf08      	it	eq
    303c:	ea90 0f02 	teqeq	r0, r2
    3040:	bf1f      	itttt	ne
    3042:	ea54 0c00 	orrsne.w	ip, r4, r0
    3046:	ea55 0c02 	orrsne.w	ip, r5, r2
    304a:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
    304e:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    3052:	f000 80e2 	beq.w	321a <__adddf3+0x1ee>
    3056:	ea4f 5454 	mov.w	r4, r4, lsr #21
    305a:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
    305e:	bfb8      	it	lt
    3060:	426d      	neglt	r5, r5
    3062:	dd0c      	ble.n	307e <__adddf3+0x52>
    3064:	442c      	add	r4, r5
    3066:	ea80 0202 	eor.w	r2, r0, r2
    306a:	ea81 0303 	eor.w	r3, r1, r3
    306e:	ea82 0000 	eor.w	r0, r2, r0
    3072:	ea83 0101 	eor.w	r1, r3, r1
    3076:	ea80 0202 	eor.w	r2, r0, r2
    307a:	ea81 0303 	eor.w	r3, r1, r3
    307e:	2d36      	cmp	r5, #54	; 0x36
    3080:	bf88      	it	hi
    3082:	bd30      	pophi	{r4, r5, pc}
    3084:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    3088:	ea4f 3101 	mov.w	r1, r1, lsl #12
    308c:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
    3090:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
    3094:	d002      	beq.n	309c <__adddf3+0x70>
    3096:	4240      	negs	r0, r0
    3098:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    309c:	f013 4f00 	tst.w	r3, #2147483648	; 0x80000000
    30a0:	ea4f 3303 	mov.w	r3, r3, lsl #12
    30a4:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
    30a8:	d002      	beq.n	30b0 <__adddf3+0x84>
    30aa:	4252      	negs	r2, r2
    30ac:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
    30b0:	ea94 0f05 	teq	r4, r5
    30b4:	f000 80a7 	beq.w	3206 <__adddf3+0x1da>
    30b8:	f1a4 0401 	sub.w	r4, r4, #1
    30bc:	f1d5 0e20 	rsbs	lr, r5, #32
    30c0:	db0d      	blt.n	30de <__adddf3+0xb2>
    30c2:	fa02 fc0e 	lsl.w	ip, r2, lr
    30c6:	fa22 f205 	lsr.w	r2, r2, r5
    30ca:	1880      	adds	r0, r0, r2
    30cc:	f141 0100 	adc.w	r1, r1, #0
    30d0:	fa03 f20e 	lsl.w	r2, r3, lr
    30d4:	1880      	adds	r0, r0, r2
    30d6:	fa43 f305 	asr.w	r3, r3, r5
    30da:	4159      	adcs	r1, r3
    30dc:	e00e      	b.n	30fc <__adddf3+0xd0>
    30de:	f1a5 0520 	sub.w	r5, r5, #32
    30e2:	f10e 0e20 	add.w	lr, lr, #32
    30e6:	2a01      	cmp	r2, #1
    30e8:	fa03 fc0e 	lsl.w	ip, r3, lr
    30ec:	bf28      	it	cs
    30ee:	f04c 0c02 	orrcs.w	ip, ip, #2
    30f2:	fa43 f305 	asr.w	r3, r3, r5
    30f6:	18c0      	adds	r0, r0, r3
    30f8:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
    30fc:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    3100:	d507      	bpl.n	3112 <__adddf3+0xe6>
    3102:	f04f 0e00 	mov.w	lr, #0
    3106:	f1dc 0c00 	rsbs	ip, ip, #0
    310a:	eb7e 0000 	sbcs.w	r0, lr, r0
    310e:	eb6e 0101 	sbc.w	r1, lr, r1
    3112:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
    3116:	d31b      	bcc.n	3150 <__adddf3+0x124>
    3118:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
    311c:	d30c      	bcc.n	3138 <__adddf3+0x10c>
    311e:	0849      	lsrs	r1, r1, #1
    3120:	ea5f 0030 	movs.w	r0, r0, rrx
    3124:	ea4f 0c3c 	mov.w	ip, ip, rrx
    3128:	f104 0401 	add.w	r4, r4, #1
    312c:	ea4f 5244 	mov.w	r2, r4, lsl #21
    3130:	f512 0f80 	cmn.w	r2, #4194304	; 0x400000
    3134:	f080 809a 	bcs.w	326c <__adddf3+0x240>
    3138:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    313c:	bf08      	it	eq
    313e:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    3142:	f150 0000 	adcs.w	r0, r0, #0
    3146:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    314a:	ea41 0105 	orr.w	r1, r1, r5
    314e:	bd30      	pop	{r4, r5, pc}
    3150:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
    3154:	4140      	adcs	r0, r0
    3156:	eb41 0101 	adc.w	r1, r1, r1
    315a:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    315e:	f1a4 0401 	sub.w	r4, r4, #1
    3162:	d1e9      	bne.n	3138 <__adddf3+0x10c>
    3164:	f091 0f00 	teq	r1, #0
    3168:	bf04      	itt	eq
    316a:	4601      	moveq	r1, r0
    316c:	2000      	moveq	r0, #0
    316e:	fab1 f381 	clz	r3, r1
    3172:	bf08      	it	eq
    3174:	3320      	addeq	r3, #32
    3176:	f1a3 030b 	sub.w	r3, r3, #11
    317a:	f1b3 0220 	subs.w	r2, r3, #32
    317e:	da0c      	bge.n	319a <__adddf3+0x16e>
    3180:	320c      	adds	r2, #12
    3182:	dd08      	ble.n	3196 <__adddf3+0x16a>
    3184:	f102 0c14 	add.w	ip, r2, #20
    3188:	f1c2 020c 	rsb	r2, r2, #12
    318c:	fa01 f00c 	lsl.w	r0, r1, ip
    3190:	fa21 f102 	lsr.w	r1, r1, r2
    3194:	e00c      	b.n	31b0 <__adddf3+0x184>
    3196:	f102 0214 	add.w	r2, r2, #20
    319a:	bfd8      	it	le
    319c:	f1c2 0c20 	rsble	ip, r2, #32
    31a0:	fa01 f102 	lsl.w	r1, r1, r2
    31a4:	fa20 fc0c 	lsr.w	ip, r0, ip
    31a8:	bfdc      	itt	le
    31aa:	ea41 010c 	orrle.w	r1, r1, ip
    31ae:	4090      	lslle	r0, r2
    31b0:	1ae4      	subs	r4, r4, r3
    31b2:	bfa2      	ittt	ge
    31b4:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
    31b8:	4329      	orrge	r1, r5
    31ba:	bd30      	popge	{r4, r5, pc}
    31bc:	ea6f 0404 	mvn.w	r4, r4
    31c0:	3c1f      	subs	r4, #31
    31c2:	da1c      	bge.n	31fe <__adddf3+0x1d2>
    31c4:	340c      	adds	r4, #12
    31c6:	dc0e      	bgt.n	31e6 <__adddf3+0x1ba>
    31c8:	f104 0414 	add.w	r4, r4, #20
    31cc:	f1c4 0220 	rsb	r2, r4, #32
    31d0:	fa20 f004 	lsr.w	r0, r0, r4
    31d4:	fa01 f302 	lsl.w	r3, r1, r2
    31d8:	ea40 0003 	orr.w	r0, r0, r3
    31dc:	fa21 f304 	lsr.w	r3, r1, r4
    31e0:	ea45 0103 	orr.w	r1, r5, r3
    31e4:	bd30      	pop	{r4, r5, pc}
    31e6:	f1c4 040c 	rsb	r4, r4, #12
    31ea:	f1c4 0220 	rsb	r2, r4, #32
    31ee:	fa20 f002 	lsr.w	r0, r0, r2
    31f2:	fa01 f304 	lsl.w	r3, r1, r4
    31f6:	ea40 0003 	orr.w	r0, r0, r3
    31fa:	4629      	mov	r1, r5
    31fc:	bd30      	pop	{r4, r5, pc}
    31fe:	fa21 f004 	lsr.w	r0, r1, r4
    3202:	4629      	mov	r1, r5
    3204:	bd30      	pop	{r4, r5, pc}
    3206:	f094 0f00 	teq	r4, #0
    320a:	f483 1380 	eor.w	r3, r3, #1048576	; 0x100000
    320e:	bf06      	itte	eq
    3210:	f481 1180 	eoreq.w	r1, r1, #1048576	; 0x100000
    3214:	3401      	addeq	r4, #1
    3216:	3d01      	subne	r5, #1
    3218:	e74e      	b.n	30b8 <__adddf3+0x8c>
    321a:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    321e:	bf18      	it	ne
    3220:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    3224:	d029      	beq.n	327a <__adddf3+0x24e>
    3226:	ea94 0f05 	teq	r4, r5
    322a:	bf08      	it	eq
    322c:	ea90 0f02 	teqeq	r0, r2
    3230:	d005      	beq.n	323e <__adddf3+0x212>
    3232:	ea54 0c00 	orrs.w	ip, r4, r0
    3236:	bf04      	itt	eq
    3238:	4619      	moveq	r1, r3
    323a:	4610      	moveq	r0, r2
    323c:	bd30      	pop	{r4, r5, pc}
    323e:	ea91 0f03 	teq	r1, r3
    3242:	bf1e      	ittt	ne
    3244:	2100      	movne	r1, #0
    3246:	2000      	movne	r0, #0
    3248:	bd30      	popne	{r4, r5, pc}
    324a:	ea5f 5c54 	movs.w	ip, r4, lsr #21
    324e:	d105      	bne.n	325c <__adddf3+0x230>
    3250:	0040      	lsls	r0, r0, #1
    3252:	4149      	adcs	r1, r1
    3254:	bf28      	it	cs
    3256:	f041 4100 	orrcs.w	r1, r1, #2147483648	; 0x80000000
    325a:	bd30      	pop	{r4, r5, pc}
    325c:	f514 0480 	adds.w	r4, r4, #4194304	; 0x400000
    3260:	bf3c      	itt	cc
    3262:	f501 1180 	addcc.w	r1, r1, #1048576	; 0x100000
    3266:	bd30      	popcc	{r4, r5, pc}
    3268:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    326c:	f045 41fe 	orr.w	r1, r5, #2130706432	; 0x7f000000
    3270:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
    3274:	f04f 0000 	mov.w	r0, #0
    3278:	bd30      	pop	{r4, r5, pc}
    327a:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    327e:	bf1a      	itte	ne
    3280:	4619      	movne	r1, r3
    3282:	4610      	movne	r0, r2
    3284:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
    3288:	bf1c      	itt	ne
    328a:	460b      	movne	r3, r1
    328c:	4602      	movne	r2, r0
    328e:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    3292:	bf06      	itte	eq
    3294:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
    3298:	ea91 0f03 	teqeq	r1, r3
    329c:	f441 2100 	orrne.w	r1, r1, #524288	; 0x80000
    32a0:	bd30      	pop	{r4, r5, pc}
    32a2:	bf00      	nop

000032a4 <__aeabi_ui2d>:
    32a4:	f090 0f00 	teq	r0, #0
    32a8:	bf04      	itt	eq
    32aa:	2100      	moveq	r1, #0
    32ac:	4770      	bxeq	lr
    32ae:	b530      	push	{r4, r5, lr}
    32b0:	f44f 6480 	mov.w	r4, #1024	; 0x400
    32b4:	f104 0432 	add.w	r4, r4, #50	; 0x32
    32b8:	f04f 0500 	mov.w	r5, #0
    32bc:	f04f 0100 	mov.w	r1, #0
    32c0:	e750      	b.n	3164 <__adddf3+0x138>
    32c2:	bf00      	nop

000032c4 <__aeabi_i2d>:
    32c4:	f090 0f00 	teq	r0, #0
    32c8:	bf04      	itt	eq
    32ca:	2100      	moveq	r1, #0
    32cc:	4770      	bxeq	lr
    32ce:	b530      	push	{r4, r5, lr}
    32d0:	f44f 6480 	mov.w	r4, #1024	; 0x400
    32d4:	f104 0432 	add.w	r4, r4, #50	; 0x32
    32d8:	f010 4500 	ands.w	r5, r0, #2147483648	; 0x80000000
    32dc:	bf48      	it	mi
    32de:	4240      	negmi	r0, r0
    32e0:	f04f 0100 	mov.w	r1, #0
    32e4:	e73e      	b.n	3164 <__adddf3+0x138>
    32e6:	bf00      	nop

000032e8 <__aeabi_f2d>:
    32e8:	0042      	lsls	r2, r0, #1
    32ea:	ea4f 01e2 	mov.w	r1, r2, asr #3
    32ee:	ea4f 0131 	mov.w	r1, r1, rrx
    32f2:	ea4f 7002 	mov.w	r0, r2, lsl #28
    32f6:	bf1f      	itttt	ne
    32f8:	f012 437f 	andsne.w	r3, r2, #4278190080	; 0xff000000
    32fc:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
    3300:	f081 5160 	eorne.w	r1, r1, #939524096	; 0x38000000
    3304:	4770      	bxne	lr
    3306:	f092 0f00 	teq	r2, #0
    330a:	bf14      	ite	ne
    330c:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
    3310:	4770      	bxeq	lr
    3312:	b530      	push	{r4, r5, lr}
    3314:	f44f 7460 	mov.w	r4, #896	; 0x380
    3318:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    331c:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
    3320:	e720      	b.n	3164 <__adddf3+0x138>
    3322:	bf00      	nop

00003324 <__aeabi_ul2d>:
    3324:	ea50 0201 	orrs.w	r2, r0, r1
    3328:	bf08      	it	eq
    332a:	4770      	bxeq	lr
    332c:	b530      	push	{r4, r5, lr}
    332e:	f04f 0500 	mov.w	r5, #0
    3332:	e00a      	b.n	334a <__aeabi_l2d+0x16>

00003334 <__aeabi_l2d>:
    3334:	ea50 0201 	orrs.w	r2, r0, r1
    3338:	bf08      	it	eq
    333a:	4770      	bxeq	lr
    333c:	b530      	push	{r4, r5, lr}
    333e:	f011 4500 	ands.w	r5, r1, #2147483648	; 0x80000000
    3342:	d502      	bpl.n	334a <__aeabi_l2d+0x16>
    3344:	4240      	negs	r0, r0
    3346:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    334a:	f44f 6480 	mov.w	r4, #1024	; 0x400
    334e:	f104 0432 	add.w	r4, r4, #50	; 0x32
    3352:	ea5f 5c91 	movs.w	ip, r1, lsr #22
    3356:	f43f aedc 	beq.w	3112 <__adddf3+0xe6>
    335a:	f04f 0203 	mov.w	r2, #3
    335e:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    3362:	bf18      	it	ne
    3364:	3203      	addne	r2, #3
    3366:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    336a:	bf18      	it	ne
    336c:	3203      	addne	r2, #3
    336e:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
    3372:	f1c2 0320 	rsb	r3, r2, #32
    3376:	fa00 fc03 	lsl.w	ip, r0, r3
    337a:	fa20 f002 	lsr.w	r0, r0, r2
    337e:	fa01 fe03 	lsl.w	lr, r1, r3
    3382:	ea40 000e 	orr.w	r0, r0, lr
    3386:	fa21 f102 	lsr.w	r1, r1, r2
    338a:	4414      	add	r4, r2
    338c:	e6c1      	b.n	3112 <__adddf3+0xe6>
    338e:	bf00      	nop

00003390 <__aeabi_dmul>:
    3390:	b570      	push	{r4, r5, r6, lr}
    3392:	f04f 0cff 	mov.w	ip, #255	; 0xff
    3396:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
    339a:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    339e:	bf1d      	ittte	ne
    33a0:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    33a4:	ea94 0f0c 	teqne	r4, ip
    33a8:	ea95 0f0c 	teqne	r5, ip
    33ac:	f000 f8de 	bleq	356c <__aeabi_dmul+0x1dc>
    33b0:	442c      	add	r4, r5
    33b2:	ea81 0603 	eor.w	r6, r1, r3
    33b6:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
    33ba:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
    33be:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
    33c2:	bf18      	it	ne
    33c4:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
    33c8:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    33cc:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
    33d0:	d038      	beq.n	3444 <__aeabi_dmul+0xb4>
    33d2:	fba0 ce02 	umull	ip, lr, r0, r2
    33d6:	f04f 0500 	mov.w	r5, #0
    33da:	fbe1 e502 	umlal	lr, r5, r1, r2
    33de:	f006 4200 	and.w	r2, r6, #2147483648	; 0x80000000
    33e2:	fbe0 e503 	umlal	lr, r5, r0, r3
    33e6:	f04f 0600 	mov.w	r6, #0
    33ea:	fbe1 5603 	umlal	r5, r6, r1, r3
    33ee:	f09c 0f00 	teq	ip, #0
    33f2:	bf18      	it	ne
    33f4:	f04e 0e01 	orrne.w	lr, lr, #1
    33f8:	f1a4 04ff 	sub.w	r4, r4, #255	; 0xff
    33fc:	f5b6 7f00 	cmp.w	r6, #512	; 0x200
    3400:	f564 7440 	sbc.w	r4, r4, #768	; 0x300
    3404:	d204      	bcs.n	3410 <__aeabi_dmul+0x80>
    3406:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
    340a:	416d      	adcs	r5, r5
    340c:	eb46 0606 	adc.w	r6, r6, r6
    3410:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
    3414:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
    3418:	ea4f 20c5 	mov.w	r0, r5, lsl #11
    341c:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
    3420:	ea4f 2ece 	mov.w	lr, lr, lsl #11
    3424:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
    3428:	bf88      	it	hi
    342a:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
    342e:	d81e      	bhi.n	346e <__aeabi_dmul+0xde>
    3430:	f1be 4f00 	cmp.w	lr, #2147483648	; 0x80000000
    3434:	bf08      	it	eq
    3436:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
    343a:	f150 0000 	adcs.w	r0, r0, #0
    343e:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    3442:	bd70      	pop	{r4, r5, r6, pc}
    3444:	f006 4600 	and.w	r6, r6, #2147483648	; 0x80000000
    3448:	ea46 0101 	orr.w	r1, r6, r1
    344c:	ea40 0002 	orr.w	r0, r0, r2
    3450:	ea81 0103 	eor.w	r1, r1, r3
    3454:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
    3458:	bfc2      	ittt	gt
    345a:	ebd4 050c 	rsbsgt	r5, r4, ip
    345e:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    3462:	bd70      	popgt	{r4, r5, r6, pc}
    3464:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    3468:	f04f 0e00 	mov.w	lr, #0
    346c:	3c01      	subs	r4, #1
    346e:	f300 80ab 	bgt.w	35c8 <__aeabi_dmul+0x238>
    3472:	f114 0f36 	cmn.w	r4, #54	; 0x36
    3476:	bfde      	ittt	le
    3478:	2000      	movle	r0, #0
    347a:	f001 4100 	andle.w	r1, r1, #2147483648	; 0x80000000
    347e:	bd70      	pople	{r4, r5, r6, pc}
    3480:	f1c4 0400 	rsb	r4, r4, #0
    3484:	3c20      	subs	r4, #32
    3486:	da35      	bge.n	34f4 <__aeabi_dmul+0x164>
    3488:	340c      	adds	r4, #12
    348a:	dc1b      	bgt.n	34c4 <__aeabi_dmul+0x134>
    348c:	f104 0414 	add.w	r4, r4, #20
    3490:	f1c4 0520 	rsb	r5, r4, #32
    3494:	fa00 f305 	lsl.w	r3, r0, r5
    3498:	fa20 f004 	lsr.w	r0, r0, r4
    349c:	fa01 f205 	lsl.w	r2, r1, r5
    34a0:	ea40 0002 	orr.w	r0, r0, r2
    34a4:	f001 4200 	and.w	r2, r1, #2147483648	; 0x80000000
    34a8:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
    34ac:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    34b0:	fa21 f604 	lsr.w	r6, r1, r4
    34b4:	eb42 0106 	adc.w	r1, r2, r6
    34b8:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    34bc:	bf08      	it	eq
    34be:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    34c2:	bd70      	pop	{r4, r5, r6, pc}
    34c4:	f1c4 040c 	rsb	r4, r4, #12
    34c8:	f1c4 0520 	rsb	r5, r4, #32
    34cc:	fa00 f304 	lsl.w	r3, r0, r4
    34d0:	fa20 f005 	lsr.w	r0, r0, r5
    34d4:	fa01 f204 	lsl.w	r2, r1, r4
    34d8:	ea40 0002 	orr.w	r0, r0, r2
    34dc:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    34e0:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    34e4:	f141 0100 	adc.w	r1, r1, #0
    34e8:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    34ec:	bf08      	it	eq
    34ee:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    34f2:	bd70      	pop	{r4, r5, r6, pc}
    34f4:	f1c4 0520 	rsb	r5, r4, #32
    34f8:	fa00 f205 	lsl.w	r2, r0, r5
    34fc:	ea4e 0e02 	orr.w	lr, lr, r2
    3500:	fa20 f304 	lsr.w	r3, r0, r4
    3504:	fa01 f205 	lsl.w	r2, r1, r5
    3508:	ea43 0302 	orr.w	r3, r3, r2
    350c:	fa21 f004 	lsr.w	r0, r1, r4
    3510:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    3514:	fa21 f204 	lsr.w	r2, r1, r4
    3518:	ea20 0002 	bic.w	r0, r0, r2
    351c:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
    3520:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    3524:	bf08      	it	eq
    3526:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    352a:	bd70      	pop	{r4, r5, r6, pc}
    352c:	f094 0f00 	teq	r4, #0
    3530:	d10f      	bne.n	3552 <__aeabi_dmul+0x1c2>
    3532:	f001 4600 	and.w	r6, r1, #2147483648	; 0x80000000
    3536:	0040      	lsls	r0, r0, #1
    3538:	eb41 0101 	adc.w	r1, r1, r1
    353c:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    3540:	bf08      	it	eq
    3542:	3c01      	subeq	r4, #1
    3544:	d0f7      	beq.n	3536 <__aeabi_dmul+0x1a6>
    3546:	ea41 0106 	orr.w	r1, r1, r6
    354a:	f095 0f00 	teq	r5, #0
    354e:	bf18      	it	ne
    3550:	4770      	bxne	lr
    3552:	f003 4600 	and.w	r6, r3, #2147483648	; 0x80000000
    3556:	0052      	lsls	r2, r2, #1
    3558:	eb43 0303 	adc.w	r3, r3, r3
    355c:	f413 1f80 	tst.w	r3, #1048576	; 0x100000
    3560:	bf08      	it	eq
    3562:	3d01      	subeq	r5, #1
    3564:	d0f7      	beq.n	3556 <__aeabi_dmul+0x1c6>
    3566:	ea43 0306 	orr.w	r3, r3, r6
    356a:	4770      	bx	lr
    356c:	ea94 0f0c 	teq	r4, ip
    3570:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    3574:	bf18      	it	ne
    3576:	ea95 0f0c 	teqne	r5, ip
    357a:	d00c      	beq.n	3596 <__aeabi_dmul+0x206>
    357c:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    3580:	bf18      	it	ne
    3582:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    3586:	d1d1      	bne.n	352c <__aeabi_dmul+0x19c>
    3588:	ea81 0103 	eor.w	r1, r1, r3
    358c:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    3590:	f04f 0000 	mov.w	r0, #0
    3594:	bd70      	pop	{r4, r5, r6, pc}
    3596:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    359a:	bf06      	itte	eq
    359c:	4610      	moveq	r0, r2
    359e:	4619      	moveq	r1, r3
    35a0:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    35a4:	d019      	beq.n	35da <__aeabi_dmul+0x24a>
    35a6:	ea94 0f0c 	teq	r4, ip
    35aa:	d102      	bne.n	35b2 <__aeabi_dmul+0x222>
    35ac:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
    35b0:	d113      	bne.n	35da <__aeabi_dmul+0x24a>
    35b2:	ea95 0f0c 	teq	r5, ip
    35b6:	d105      	bne.n	35c4 <__aeabi_dmul+0x234>
    35b8:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
    35bc:	bf1c      	itt	ne
    35be:	4610      	movne	r0, r2
    35c0:	4619      	movne	r1, r3
    35c2:	d10a      	bne.n	35da <__aeabi_dmul+0x24a>
    35c4:	ea81 0103 	eor.w	r1, r1, r3
    35c8:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    35cc:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
    35d0:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
    35d4:	f04f 0000 	mov.w	r0, #0
    35d8:	bd70      	pop	{r4, r5, r6, pc}
    35da:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
    35de:	f441 0178 	orr.w	r1, r1, #16252928	; 0xf80000
    35e2:	bd70      	pop	{r4, r5, r6, pc}

000035e4 <__aeabi_ddiv>:
    35e4:	b570      	push	{r4, r5, r6, lr}
    35e6:	f04f 0cff 	mov.w	ip, #255	; 0xff
    35ea:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
    35ee:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    35f2:	bf1d      	ittte	ne
    35f4:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    35f8:	ea94 0f0c 	teqne	r4, ip
    35fc:	ea95 0f0c 	teqne	r5, ip
    3600:	f000 f8a7 	bleq	3752 <__aeabi_ddiv+0x16e>
    3604:	eba4 0405 	sub.w	r4, r4, r5
    3608:	ea81 0e03 	eor.w	lr, r1, r3
    360c:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    3610:	ea4f 3101 	mov.w	r1, r1, lsl #12
    3614:	f000 8088 	beq.w	3728 <__aeabi_ddiv+0x144>
    3618:	ea4f 3303 	mov.w	r3, r3, lsl #12
    361c:	f04f 5580 	mov.w	r5, #268435456	; 0x10000000
    3620:	ea45 1313 	orr.w	r3, r5, r3, lsr #4
    3624:	ea43 6312 	orr.w	r3, r3, r2, lsr #24
    3628:	ea4f 2202 	mov.w	r2, r2, lsl #8
    362c:	ea45 1511 	orr.w	r5, r5, r1, lsr #4
    3630:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
    3634:	ea4f 2600 	mov.w	r6, r0, lsl #8
    3638:	f00e 4100 	and.w	r1, lr, #2147483648	; 0x80000000
    363c:	429d      	cmp	r5, r3
    363e:	bf08      	it	eq
    3640:	4296      	cmpeq	r6, r2
    3642:	f144 04fd 	adc.w	r4, r4, #253	; 0xfd
    3646:	f504 7440 	add.w	r4, r4, #768	; 0x300
    364a:	d202      	bcs.n	3652 <__aeabi_ddiv+0x6e>
    364c:	085b      	lsrs	r3, r3, #1
    364e:	ea4f 0232 	mov.w	r2, r2, rrx
    3652:	1ab6      	subs	r6, r6, r2
    3654:	eb65 0503 	sbc.w	r5, r5, r3
    3658:	085b      	lsrs	r3, r3, #1
    365a:	ea4f 0232 	mov.w	r2, r2, rrx
    365e:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
    3662:	f44f 2c00 	mov.w	ip, #524288	; 0x80000
    3666:	ebb6 0e02 	subs.w	lr, r6, r2
    366a:	eb75 0e03 	sbcs.w	lr, r5, r3
    366e:	bf22      	ittt	cs
    3670:	1ab6      	subcs	r6, r6, r2
    3672:	4675      	movcs	r5, lr
    3674:	ea40 000c 	orrcs.w	r0, r0, ip
    3678:	085b      	lsrs	r3, r3, #1
    367a:	ea4f 0232 	mov.w	r2, r2, rrx
    367e:	ebb6 0e02 	subs.w	lr, r6, r2
    3682:	eb75 0e03 	sbcs.w	lr, r5, r3
    3686:	bf22      	ittt	cs
    3688:	1ab6      	subcs	r6, r6, r2
    368a:	4675      	movcs	r5, lr
    368c:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    3690:	085b      	lsrs	r3, r3, #1
    3692:	ea4f 0232 	mov.w	r2, r2, rrx
    3696:	ebb6 0e02 	subs.w	lr, r6, r2
    369a:	eb75 0e03 	sbcs.w	lr, r5, r3
    369e:	bf22      	ittt	cs
    36a0:	1ab6      	subcs	r6, r6, r2
    36a2:	4675      	movcs	r5, lr
    36a4:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    36a8:	085b      	lsrs	r3, r3, #1
    36aa:	ea4f 0232 	mov.w	r2, r2, rrx
    36ae:	ebb6 0e02 	subs.w	lr, r6, r2
    36b2:	eb75 0e03 	sbcs.w	lr, r5, r3
    36b6:	bf22      	ittt	cs
    36b8:	1ab6      	subcs	r6, r6, r2
    36ba:	4675      	movcs	r5, lr
    36bc:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    36c0:	ea55 0e06 	orrs.w	lr, r5, r6
    36c4:	d018      	beq.n	36f8 <__aeabi_ddiv+0x114>
    36c6:	ea4f 1505 	mov.w	r5, r5, lsl #4
    36ca:	ea45 7516 	orr.w	r5, r5, r6, lsr #28
    36ce:	ea4f 1606 	mov.w	r6, r6, lsl #4
    36d2:	ea4f 03c3 	mov.w	r3, r3, lsl #3
    36d6:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
    36da:	ea4f 02c2 	mov.w	r2, r2, lsl #3
    36de:	ea5f 1c1c 	movs.w	ip, ip, lsr #4
    36e2:	d1c0      	bne.n	3666 <__aeabi_ddiv+0x82>
    36e4:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    36e8:	d10b      	bne.n	3702 <__aeabi_ddiv+0x11e>
    36ea:	ea41 0100 	orr.w	r1, r1, r0
    36ee:	f04f 0000 	mov.w	r0, #0
    36f2:	f04f 4c00 	mov.w	ip, #2147483648	; 0x80000000
    36f6:	e7b6      	b.n	3666 <__aeabi_ddiv+0x82>
    36f8:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    36fc:	bf04      	itt	eq
    36fe:	4301      	orreq	r1, r0
    3700:	2000      	moveq	r0, #0
    3702:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
    3706:	bf88      	it	hi
    3708:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
    370c:	f63f aeaf 	bhi.w	346e <__aeabi_dmul+0xde>
    3710:	ebb5 0c03 	subs.w	ip, r5, r3
    3714:	bf04      	itt	eq
    3716:	ebb6 0c02 	subseq.w	ip, r6, r2
    371a:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    371e:	f150 0000 	adcs.w	r0, r0, #0
    3722:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    3726:	bd70      	pop	{r4, r5, r6, pc}
    3728:	f00e 4e00 	and.w	lr, lr, #2147483648	; 0x80000000
    372c:	ea4e 3111 	orr.w	r1, lr, r1, lsr #12
    3730:	eb14 045c 	adds.w	r4, r4, ip, lsr #1
    3734:	bfc2      	ittt	gt
    3736:	ebd4 050c 	rsbsgt	r5, r4, ip
    373a:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    373e:	bd70      	popgt	{r4, r5, r6, pc}
    3740:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    3744:	f04f 0e00 	mov.w	lr, #0
    3748:	3c01      	subs	r4, #1
    374a:	e690      	b.n	346e <__aeabi_dmul+0xde>
    374c:	ea45 0e06 	orr.w	lr, r5, r6
    3750:	e68d      	b.n	346e <__aeabi_dmul+0xde>
    3752:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    3756:	ea94 0f0c 	teq	r4, ip
    375a:	bf08      	it	eq
    375c:	ea95 0f0c 	teqeq	r5, ip
    3760:	f43f af3b 	beq.w	35da <__aeabi_dmul+0x24a>
    3764:	ea94 0f0c 	teq	r4, ip
    3768:	d10a      	bne.n	3780 <__aeabi_ddiv+0x19c>
    376a:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    376e:	f47f af34 	bne.w	35da <__aeabi_dmul+0x24a>
    3772:	ea95 0f0c 	teq	r5, ip
    3776:	f47f af25 	bne.w	35c4 <__aeabi_dmul+0x234>
    377a:	4610      	mov	r0, r2
    377c:	4619      	mov	r1, r3
    377e:	e72c      	b.n	35da <__aeabi_dmul+0x24a>
    3780:	ea95 0f0c 	teq	r5, ip
    3784:	d106      	bne.n	3794 <__aeabi_ddiv+0x1b0>
    3786:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    378a:	f43f aefd 	beq.w	3588 <__aeabi_dmul+0x1f8>
    378e:	4610      	mov	r0, r2
    3790:	4619      	mov	r1, r3
    3792:	e722      	b.n	35da <__aeabi_dmul+0x24a>
    3794:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    3798:	bf18      	it	ne
    379a:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    379e:	f47f aec5 	bne.w	352c <__aeabi_dmul+0x19c>
    37a2:	ea50 0441 	orrs.w	r4, r0, r1, lsl #1
    37a6:	f47f af0d 	bne.w	35c4 <__aeabi_dmul+0x234>
    37aa:	ea52 0543 	orrs.w	r5, r2, r3, lsl #1
    37ae:	f47f aeeb 	bne.w	3588 <__aeabi_dmul+0x1f8>
    37b2:	e712      	b.n	35da <__aeabi_dmul+0x24a>

000037b4 <__gedf2>:
    37b4:	f04f 3cff 	mov.w	ip, #4294967295
    37b8:	e006      	b.n	37c8 <__cmpdf2+0x4>
    37ba:	bf00      	nop

000037bc <__ledf2>:
    37bc:	f04f 0c01 	mov.w	ip, #1
    37c0:	e002      	b.n	37c8 <__cmpdf2+0x4>
    37c2:	bf00      	nop

000037c4 <__cmpdf2>:
    37c4:	f04f 0c01 	mov.w	ip, #1
    37c8:	f84d cd04 	str.w	ip, [sp, #-4]!
    37cc:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    37d0:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    37d4:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    37d8:	bf18      	it	ne
    37da:	ea7f 5c6c 	mvnsne.w	ip, ip, asr #21
    37de:	d01b      	beq.n	3818 <__cmpdf2+0x54>
    37e0:	b001      	add	sp, #4
    37e2:	ea50 0c41 	orrs.w	ip, r0, r1, lsl #1
    37e6:	bf0c      	ite	eq
    37e8:	ea52 0c43 	orrseq.w	ip, r2, r3, lsl #1
    37ec:	ea91 0f03 	teqne	r1, r3
    37f0:	bf02      	ittt	eq
    37f2:	ea90 0f02 	teqeq	r0, r2
    37f6:	2000      	moveq	r0, #0
    37f8:	4770      	bxeq	lr
    37fa:	f110 0f00 	cmn.w	r0, #0
    37fe:	ea91 0f03 	teq	r1, r3
    3802:	bf58      	it	pl
    3804:	4299      	cmppl	r1, r3
    3806:	bf08      	it	eq
    3808:	4290      	cmpeq	r0, r2
    380a:	bf2c      	ite	cs
    380c:	17d8      	asrcs	r0, r3, #31
    380e:	ea6f 70e3 	mvncc.w	r0, r3, asr #31
    3812:	f040 0001 	orr.w	r0, r0, #1
    3816:	4770      	bx	lr
    3818:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    381c:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    3820:	d102      	bne.n	3828 <__cmpdf2+0x64>
    3822:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
    3826:	d107      	bne.n	3838 <__cmpdf2+0x74>
    3828:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    382c:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    3830:	d1d6      	bne.n	37e0 <__cmpdf2+0x1c>
    3832:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
    3836:	d0d3      	beq.n	37e0 <__cmpdf2+0x1c>
    3838:	f85d 0b04 	ldr.w	r0, [sp], #4
    383c:	4770      	bx	lr
    383e:	bf00      	nop

00003840 <__aeabi_cdrcmple>:
    3840:	4684      	mov	ip, r0
    3842:	4610      	mov	r0, r2
    3844:	4662      	mov	r2, ip
    3846:	468c      	mov	ip, r1
    3848:	4619      	mov	r1, r3
    384a:	4663      	mov	r3, ip
    384c:	e000      	b.n	3850 <__aeabi_cdcmpeq>
    384e:	bf00      	nop

00003850 <__aeabi_cdcmpeq>:
    3850:	b501      	push	{r0, lr}
    3852:	f7ff ffb7 	bl	37c4 <__cmpdf2>
    3856:	2800      	cmp	r0, #0
    3858:	bf48      	it	mi
    385a:	f110 0f00 	cmnmi.w	r0, #0
    385e:	bd01      	pop	{r0, pc}

00003860 <__aeabi_dcmpeq>:
    3860:	f84d ed08 	str.w	lr, [sp, #-8]!
    3864:	f7ff fff4 	bl	3850 <__aeabi_cdcmpeq>
    3868:	bf0c      	ite	eq
    386a:	2001      	moveq	r0, #1
    386c:	2000      	movne	r0, #0
    386e:	f85d fb08 	ldr.w	pc, [sp], #8
    3872:	bf00      	nop

00003874 <__aeabi_dcmplt>:
    3874:	f84d ed08 	str.w	lr, [sp, #-8]!
    3878:	f7ff ffea 	bl	3850 <__aeabi_cdcmpeq>
    387c:	bf34      	ite	cc
    387e:	2001      	movcc	r0, #1
    3880:	2000      	movcs	r0, #0
    3882:	f85d fb08 	ldr.w	pc, [sp], #8
    3886:	bf00      	nop

00003888 <__aeabi_dcmple>:
    3888:	f84d ed08 	str.w	lr, [sp, #-8]!
    388c:	f7ff ffe0 	bl	3850 <__aeabi_cdcmpeq>
    3890:	bf94      	ite	ls
    3892:	2001      	movls	r0, #1
    3894:	2000      	movhi	r0, #0
    3896:	f85d fb08 	ldr.w	pc, [sp], #8
    389a:	bf00      	nop

0000389c <__aeabi_dcmpge>:
    389c:	f84d ed08 	str.w	lr, [sp, #-8]!
    38a0:	f7ff ffce 	bl	3840 <__aeabi_cdrcmple>
    38a4:	bf94      	ite	ls
    38a6:	2001      	movls	r0, #1
    38a8:	2000      	movhi	r0, #0
    38aa:	f85d fb08 	ldr.w	pc, [sp], #8
    38ae:	bf00      	nop

000038b0 <__aeabi_dcmpgt>:
    38b0:	f84d ed08 	str.w	lr, [sp, #-8]!
    38b4:	f7ff ffc4 	bl	3840 <__aeabi_cdrcmple>
    38b8:	bf34      	ite	cc
    38ba:	2001      	movcc	r0, #1
    38bc:	2000      	movcs	r0, #0
    38be:	f85d fb08 	ldr.w	pc, [sp], #8
    38c2:	bf00      	nop

000038c4 <__aeabi_d2uiz>:
    38c4:	004a      	lsls	r2, r1, #1
    38c6:	d211      	bcs.n	38ec <__aeabi_d2uiz+0x28>
    38c8:	f512 1200 	adds.w	r2, r2, #2097152	; 0x200000
    38cc:	d211      	bcs.n	38f2 <__aeabi_d2uiz+0x2e>
    38ce:	d50d      	bpl.n	38ec <__aeabi_d2uiz+0x28>
    38d0:	f46f 7378 	mvn.w	r3, #992	; 0x3e0
    38d4:	ebb3 5262 	subs.w	r2, r3, r2, asr #21
    38d8:	d40e      	bmi.n	38f8 <__aeabi_d2uiz+0x34>
    38da:	ea4f 23c1 	mov.w	r3, r1, lsl #11
    38de:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
    38e2:	ea43 5350 	orr.w	r3, r3, r0, lsr #21
    38e6:	fa23 f002 	lsr.w	r0, r3, r2
    38ea:	4770      	bx	lr
    38ec:	f04f 0000 	mov.w	r0, #0
    38f0:	4770      	bx	lr
    38f2:	ea50 3001 	orrs.w	r0, r0, r1, lsl #12
    38f6:	d102      	bne.n	38fe <__aeabi_d2uiz+0x3a>
    38f8:	f04f 30ff 	mov.w	r0, #4294967295
    38fc:	4770      	bx	lr
    38fe:	f04f 0000 	mov.w	r0, #0
    3902:	4770      	bx	lr

00003904 <__aeabi_frsub>:
    3904:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
    3908:	e002      	b.n	3910 <__addsf3>
    390a:	bf00      	nop

0000390c <__aeabi_fsub>:
    390c:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

00003910 <__addsf3>:
    3910:	0042      	lsls	r2, r0, #1
    3912:	bf1f      	itttt	ne
    3914:	ea5f 0341 	movsne.w	r3, r1, lsl #1
    3918:	ea92 0f03 	teqne	r2, r3
    391c:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
    3920:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    3924:	d06a      	beq.n	39fc <__addsf3+0xec>
    3926:	ea4f 6212 	mov.w	r2, r2, lsr #24
    392a:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
    392e:	bfc1      	itttt	gt
    3930:	18d2      	addgt	r2, r2, r3
    3932:	4041      	eorgt	r1, r0
    3934:	4048      	eorgt	r0, r1
    3936:	4041      	eorgt	r1, r0
    3938:	bfb8      	it	lt
    393a:	425b      	neglt	r3, r3
    393c:	2b19      	cmp	r3, #25
    393e:	bf88      	it	hi
    3940:	4770      	bxhi	lr
    3942:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
    3946:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    394a:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    394e:	bf18      	it	ne
    3950:	4240      	negne	r0, r0
    3952:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    3956:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
    395a:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
    395e:	bf18      	it	ne
    3960:	4249      	negne	r1, r1
    3962:	ea92 0f03 	teq	r2, r3
    3966:	d03f      	beq.n	39e8 <__addsf3+0xd8>
    3968:	f1a2 0201 	sub.w	r2, r2, #1
    396c:	fa41 fc03 	asr.w	ip, r1, r3
    3970:	eb10 000c 	adds.w	r0, r0, ip
    3974:	f1c3 0320 	rsb	r3, r3, #32
    3978:	fa01 f103 	lsl.w	r1, r1, r3
    397c:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    3980:	d502      	bpl.n	3988 <__addsf3+0x78>
    3982:	4249      	negs	r1, r1
    3984:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
    3988:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    398c:	d313      	bcc.n	39b6 <__addsf3+0xa6>
    398e:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
    3992:	d306      	bcc.n	39a2 <__addsf3+0x92>
    3994:	0840      	lsrs	r0, r0, #1
    3996:	ea4f 0131 	mov.w	r1, r1, rrx
    399a:	f102 0201 	add.w	r2, r2, #1
    399e:	2afe      	cmp	r2, #254	; 0xfe
    39a0:	d251      	bcs.n	3a46 <__addsf3+0x136>
    39a2:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
    39a6:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    39aa:	bf08      	it	eq
    39ac:	f020 0001 	biceq.w	r0, r0, #1
    39b0:	ea40 0003 	orr.w	r0, r0, r3
    39b4:	4770      	bx	lr
    39b6:	0049      	lsls	r1, r1, #1
    39b8:	eb40 0000 	adc.w	r0, r0, r0
    39bc:	f410 0f00 	tst.w	r0, #8388608	; 0x800000
    39c0:	f1a2 0201 	sub.w	r2, r2, #1
    39c4:	d1ed      	bne.n	39a2 <__addsf3+0x92>
    39c6:	fab0 fc80 	clz	ip, r0
    39ca:	f1ac 0c08 	sub.w	ip, ip, #8
    39ce:	ebb2 020c 	subs.w	r2, r2, ip
    39d2:	fa00 f00c 	lsl.w	r0, r0, ip
    39d6:	bfaa      	itet	ge
    39d8:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
    39dc:	4252      	neglt	r2, r2
    39de:	4318      	orrge	r0, r3
    39e0:	bfbc      	itt	lt
    39e2:	40d0      	lsrlt	r0, r2
    39e4:	4318      	orrlt	r0, r3
    39e6:	4770      	bx	lr
    39e8:	f092 0f00 	teq	r2, #0
    39ec:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
    39f0:	bf06      	itte	eq
    39f2:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
    39f6:	3201      	addeq	r2, #1
    39f8:	3b01      	subne	r3, #1
    39fa:	e7b5      	b.n	3968 <__addsf3+0x58>
    39fc:	ea4f 0341 	mov.w	r3, r1, lsl #1
    3a00:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    3a04:	bf18      	it	ne
    3a06:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    3a0a:	d021      	beq.n	3a50 <__addsf3+0x140>
    3a0c:	ea92 0f03 	teq	r2, r3
    3a10:	d004      	beq.n	3a1c <__addsf3+0x10c>
    3a12:	f092 0f00 	teq	r2, #0
    3a16:	bf08      	it	eq
    3a18:	4608      	moveq	r0, r1
    3a1a:	4770      	bx	lr
    3a1c:	ea90 0f01 	teq	r0, r1
    3a20:	bf1c      	itt	ne
    3a22:	2000      	movne	r0, #0
    3a24:	4770      	bxne	lr
    3a26:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
    3a2a:	d104      	bne.n	3a36 <__addsf3+0x126>
    3a2c:	0040      	lsls	r0, r0, #1
    3a2e:	bf28      	it	cs
    3a30:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
    3a34:	4770      	bx	lr
    3a36:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
    3a3a:	bf3c      	itt	cc
    3a3c:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
    3a40:	4770      	bxcc	lr
    3a42:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    3a46:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
    3a4a:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3a4e:	4770      	bx	lr
    3a50:	ea7f 6222 	mvns.w	r2, r2, asr #24
    3a54:	bf16      	itet	ne
    3a56:	4608      	movne	r0, r1
    3a58:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
    3a5c:	4601      	movne	r1, r0
    3a5e:	0242      	lsls	r2, r0, #9
    3a60:	bf06      	itte	eq
    3a62:	ea5f 2341 	movseq.w	r3, r1, lsl #9
    3a66:	ea90 0f01 	teqeq	r0, r1
    3a6a:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
    3a6e:	4770      	bx	lr

00003a70 <__aeabi_ui2f>:
    3a70:	f04f 0300 	mov.w	r3, #0
    3a74:	e004      	b.n	3a80 <__aeabi_i2f+0x8>
    3a76:	bf00      	nop

00003a78 <__aeabi_i2f>:
    3a78:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
    3a7c:	bf48      	it	mi
    3a7e:	4240      	negmi	r0, r0
    3a80:	ea5f 0c00 	movs.w	ip, r0
    3a84:	bf08      	it	eq
    3a86:	4770      	bxeq	lr
    3a88:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
    3a8c:	4601      	mov	r1, r0
    3a8e:	f04f 0000 	mov.w	r0, #0
    3a92:	e01c      	b.n	3ace <__aeabi_l2f+0x2a>

00003a94 <__aeabi_ul2f>:
    3a94:	ea50 0201 	orrs.w	r2, r0, r1
    3a98:	bf08      	it	eq
    3a9a:	4770      	bxeq	lr
    3a9c:	f04f 0300 	mov.w	r3, #0
    3aa0:	e00a      	b.n	3ab8 <__aeabi_l2f+0x14>
    3aa2:	bf00      	nop

00003aa4 <__aeabi_l2f>:
    3aa4:	ea50 0201 	orrs.w	r2, r0, r1
    3aa8:	bf08      	it	eq
    3aaa:	4770      	bxeq	lr
    3aac:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
    3ab0:	d502      	bpl.n	3ab8 <__aeabi_l2f+0x14>
    3ab2:	4240      	negs	r0, r0
    3ab4:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    3ab8:	ea5f 0c01 	movs.w	ip, r1
    3abc:	bf02      	ittt	eq
    3abe:	4684      	moveq	ip, r0
    3ac0:	4601      	moveq	r1, r0
    3ac2:	2000      	moveq	r0, #0
    3ac4:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
    3ac8:	bf08      	it	eq
    3aca:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
    3ace:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
    3ad2:	fabc f28c 	clz	r2, ip
    3ad6:	3a08      	subs	r2, #8
    3ad8:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
    3adc:	db10      	blt.n	3b00 <__aeabi_l2f+0x5c>
    3ade:	fa01 fc02 	lsl.w	ip, r1, r2
    3ae2:	4463      	add	r3, ip
    3ae4:	fa00 fc02 	lsl.w	ip, r0, r2
    3ae8:	f1c2 0220 	rsb	r2, r2, #32
    3aec:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    3af0:	fa20 f202 	lsr.w	r2, r0, r2
    3af4:	eb43 0002 	adc.w	r0, r3, r2
    3af8:	bf08      	it	eq
    3afa:	f020 0001 	biceq.w	r0, r0, #1
    3afe:	4770      	bx	lr
    3b00:	f102 0220 	add.w	r2, r2, #32
    3b04:	fa01 fc02 	lsl.w	ip, r1, r2
    3b08:	f1c2 0220 	rsb	r2, r2, #32
    3b0c:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
    3b10:	fa21 f202 	lsr.w	r2, r1, r2
    3b14:	eb43 0002 	adc.w	r0, r3, r2
    3b18:	bf08      	it	eq
    3b1a:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    3b1e:	4770      	bx	lr

00003b20 <__aeabi_fmul>:
    3b20:	f04f 0cff 	mov.w	ip, #255	; 0xff
    3b24:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    3b28:	bf1e      	ittt	ne
    3b2a:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    3b2e:	ea92 0f0c 	teqne	r2, ip
    3b32:	ea93 0f0c 	teqne	r3, ip
    3b36:	d06f      	beq.n	3c18 <__aeabi_fmul+0xf8>
    3b38:	441a      	add	r2, r3
    3b3a:	ea80 0c01 	eor.w	ip, r0, r1
    3b3e:	0240      	lsls	r0, r0, #9
    3b40:	bf18      	it	ne
    3b42:	ea5f 2141 	movsne.w	r1, r1, lsl #9
    3b46:	d01e      	beq.n	3b86 <__aeabi_fmul+0x66>
    3b48:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
    3b4c:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
    3b50:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
    3b54:	fba0 3101 	umull	r3, r1, r0, r1
    3b58:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    3b5c:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
    3b60:	bf3e      	ittt	cc
    3b62:	0049      	lslcc	r1, r1, #1
    3b64:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
    3b68:	005b      	lslcc	r3, r3, #1
    3b6a:	ea40 0001 	orr.w	r0, r0, r1
    3b6e:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
    3b72:	2afd      	cmp	r2, #253	; 0xfd
    3b74:	d81d      	bhi.n	3bb2 <__aeabi_fmul+0x92>
    3b76:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    3b7a:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    3b7e:	bf08      	it	eq
    3b80:	f020 0001 	biceq.w	r0, r0, #1
    3b84:	4770      	bx	lr
    3b86:	f090 0f00 	teq	r0, #0
    3b8a:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    3b8e:	bf08      	it	eq
    3b90:	0249      	lsleq	r1, r1, #9
    3b92:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    3b96:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
    3b9a:	3a7f      	subs	r2, #127	; 0x7f
    3b9c:	bfc2      	ittt	gt
    3b9e:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    3ba2:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    3ba6:	4770      	bxgt	lr
    3ba8:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3bac:	f04f 0300 	mov.w	r3, #0
    3bb0:	3a01      	subs	r2, #1
    3bb2:	dc5d      	bgt.n	3c70 <__aeabi_fmul+0x150>
    3bb4:	f112 0f19 	cmn.w	r2, #25
    3bb8:	bfdc      	itt	le
    3bba:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
    3bbe:	4770      	bxle	lr
    3bc0:	f1c2 0200 	rsb	r2, r2, #0
    3bc4:	0041      	lsls	r1, r0, #1
    3bc6:	fa21 f102 	lsr.w	r1, r1, r2
    3bca:	f1c2 0220 	rsb	r2, r2, #32
    3bce:	fa00 fc02 	lsl.w	ip, r0, r2
    3bd2:	ea5f 0031 	movs.w	r0, r1, rrx
    3bd6:	f140 0000 	adc.w	r0, r0, #0
    3bda:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
    3bde:	bf08      	it	eq
    3be0:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    3be4:	4770      	bx	lr
    3be6:	f092 0f00 	teq	r2, #0
    3bea:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    3bee:	bf02      	ittt	eq
    3bf0:	0040      	lsleq	r0, r0, #1
    3bf2:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    3bf6:	3a01      	subeq	r2, #1
    3bf8:	d0f9      	beq.n	3bee <__aeabi_fmul+0xce>
    3bfa:	ea40 000c 	orr.w	r0, r0, ip
    3bfe:	f093 0f00 	teq	r3, #0
    3c02:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    3c06:	bf02      	ittt	eq
    3c08:	0049      	lsleq	r1, r1, #1
    3c0a:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    3c0e:	3b01      	subeq	r3, #1
    3c10:	d0f9      	beq.n	3c06 <__aeabi_fmul+0xe6>
    3c12:	ea41 010c 	orr.w	r1, r1, ip
    3c16:	e78f      	b.n	3b38 <__aeabi_fmul+0x18>
    3c18:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    3c1c:	ea92 0f0c 	teq	r2, ip
    3c20:	bf18      	it	ne
    3c22:	ea93 0f0c 	teqne	r3, ip
    3c26:	d00a      	beq.n	3c3e <__aeabi_fmul+0x11e>
    3c28:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    3c2c:	bf18      	it	ne
    3c2e:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    3c32:	d1d8      	bne.n	3be6 <__aeabi_fmul+0xc6>
    3c34:	ea80 0001 	eor.w	r0, r0, r1
    3c38:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    3c3c:	4770      	bx	lr
    3c3e:	f090 0f00 	teq	r0, #0
    3c42:	bf17      	itett	ne
    3c44:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
    3c48:	4608      	moveq	r0, r1
    3c4a:	f091 0f00 	teqne	r1, #0
    3c4e:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
    3c52:	d014      	beq.n	3c7e <__aeabi_fmul+0x15e>
    3c54:	ea92 0f0c 	teq	r2, ip
    3c58:	d101      	bne.n	3c5e <__aeabi_fmul+0x13e>
    3c5a:	0242      	lsls	r2, r0, #9
    3c5c:	d10f      	bne.n	3c7e <__aeabi_fmul+0x15e>
    3c5e:	ea93 0f0c 	teq	r3, ip
    3c62:	d103      	bne.n	3c6c <__aeabi_fmul+0x14c>
    3c64:	024b      	lsls	r3, r1, #9
    3c66:	bf18      	it	ne
    3c68:	4608      	movne	r0, r1
    3c6a:	d108      	bne.n	3c7e <__aeabi_fmul+0x15e>
    3c6c:	ea80 0001 	eor.w	r0, r0, r1
    3c70:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    3c74:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    3c78:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3c7c:	4770      	bx	lr
    3c7e:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    3c82:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
    3c86:	4770      	bx	lr

00003c88 <__aeabi_fdiv>:
    3c88:	f04f 0cff 	mov.w	ip, #255	; 0xff
    3c8c:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    3c90:	bf1e      	ittt	ne
    3c92:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    3c96:	ea92 0f0c 	teqne	r2, ip
    3c9a:	ea93 0f0c 	teqne	r3, ip
    3c9e:	d069      	beq.n	3d74 <__aeabi_fdiv+0xec>
    3ca0:	eba2 0203 	sub.w	r2, r2, r3
    3ca4:	ea80 0c01 	eor.w	ip, r0, r1
    3ca8:	0249      	lsls	r1, r1, #9
    3caa:	ea4f 2040 	mov.w	r0, r0, lsl #9
    3cae:	d037      	beq.n	3d20 <__aeabi_fdiv+0x98>
    3cb0:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    3cb4:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
    3cb8:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
    3cbc:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    3cc0:	428b      	cmp	r3, r1
    3cc2:	bf38      	it	cc
    3cc4:	005b      	lslcc	r3, r3, #1
    3cc6:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
    3cca:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
    3cce:	428b      	cmp	r3, r1
    3cd0:	bf24      	itt	cs
    3cd2:	1a5b      	subcs	r3, r3, r1
    3cd4:	ea40 000c 	orrcs.w	r0, r0, ip
    3cd8:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
    3cdc:	bf24      	itt	cs
    3cde:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
    3ce2:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    3ce6:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
    3cea:	bf24      	itt	cs
    3cec:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
    3cf0:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    3cf4:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
    3cf8:	bf24      	itt	cs
    3cfa:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
    3cfe:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    3d02:	011b      	lsls	r3, r3, #4
    3d04:	bf18      	it	ne
    3d06:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
    3d0a:	d1e0      	bne.n	3cce <__aeabi_fdiv+0x46>
    3d0c:	2afd      	cmp	r2, #253	; 0xfd
    3d0e:	f63f af50 	bhi.w	3bb2 <__aeabi_fmul+0x92>
    3d12:	428b      	cmp	r3, r1
    3d14:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    3d18:	bf08      	it	eq
    3d1a:	f020 0001 	biceq.w	r0, r0, #1
    3d1e:	4770      	bx	lr
    3d20:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    3d24:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    3d28:	327f      	adds	r2, #127	; 0x7f
    3d2a:	bfc2      	ittt	gt
    3d2c:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    3d30:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    3d34:	4770      	bxgt	lr
    3d36:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3d3a:	f04f 0300 	mov.w	r3, #0
    3d3e:	3a01      	subs	r2, #1
    3d40:	e737      	b.n	3bb2 <__aeabi_fmul+0x92>
    3d42:	f092 0f00 	teq	r2, #0
    3d46:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    3d4a:	bf02      	ittt	eq
    3d4c:	0040      	lsleq	r0, r0, #1
    3d4e:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    3d52:	3a01      	subeq	r2, #1
    3d54:	d0f9      	beq.n	3d4a <__aeabi_fdiv+0xc2>
    3d56:	ea40 000c 	orr.w	r0, r0, ip
    3d5a:	f093 0f00 	teq	r3, #0
    3d5e:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    3d62:	bf02      	ittt	eq
    3d64:	0049      	lsleq	r1, r1, #1
    3d66:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    3d6a:	3b01      	subeq	r3, #1
    3d6c:	d0f9      	beq.n	3d62 <__aeabi_fdiv+0xda>
    3d6e:	ea41 010c 	orr.w	r1, r1, ip
    3d72:	e795      	b.n	3ca0 <__aeabi_fdiv+0x18>
    3d74:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    3d78:	ea92 0f0c 	teq	r2, ip
    3d7c:	d108      	bne.n	3d90 <__aeabi_fdiv+0x108>
    3d7e:	0242      	lsls	r2, r0, #9
    3d80:	f47f af7d 	bne.w	3c7e <__aeabi_fmul+0x15e>
    3d84:	ea93 0f0c 	teq	r3, ip
    3d88:	f47f af70 	bne.w	3c6c <__aeabi_fmul+0x14c>
    3d8c:	4608      	mov	r0, r1
    3d8e:	e776      	b.n	3c7e <__aeabi_fmul+0x15e>
    3d90:	ea93 0f0c 	teq	r3, ip
    3d94:	d104      	bne.n	3da0 <__aeabi_fdiv+0x118>
    3d96:	024b      	lsls	r3, r1, #9
    3d98:	f43f af4c 	beq.w	3c34 <__aeabi_fmul+0x114>
    3d9c:	4608      	mov	r0, r1
    3d9e:	e76e      	b.n	3c7e <__aeabi_fmul+0x15e>
    3da0:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    3da4:	bf18      	it	ne
    3da6:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    3daa:	d1ca      	bne.n	3d42 <__aeabi_fdiv+0xba>
    3dac:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
    3db0:	f47f af5c 	bne.w	3c6c <__aeabi_fmul+0x14c>
    3db4:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
    3db8:	f47f af3c 	bne.w	3c34 <__aeabi_fmul+0x114>
    3dbc:	e75f      	b.n	3c7e <__aeabi_fmul+0x15e>
    3dbe:	bf00      	nop

00003dc0 <__gesf2>:
    3dc0:	f04f 3cff 	mov.w	ip, #4294967295
    3dc4:	e006      	b.n	3dd4 <__cmpsf2+0x4>
    3dc6:	bf00      	nop

00003dc8 <__lesf2>:
    3dc8:	f04f 0c01 	mov.w	ip, #1
    3dcc:	e002      	b.n	3dd4 <__cmpsf2+0x4>
    3dce:	bf00      	nop

00003dd0 <__cmpsf2>:
    3dd0:	f04f 0c01 	mov.w	ip, #1
    3dd4:	f84d cd04 	str.w	ip, [sp, #-4]!
    3dd8:	ea4f 0240 	mov.w	r2, r0, lsl #1
    3ddc:	ea4f 0341 	mov.w	r3, r1, lsl #1
    3de0:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    3de4:	bf18      	it	ne
    3de6:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    3dea:	d011      	beq.n	3e10 <__cmpsf2+0x40>
    3dec:	b001      	add	sp, #4
    3dee:	ea52 0c53 	orrs.w	ip, r2, r3, lsr #1
    3df2:	bf18      	it	ne
    3df4:	ea90 0f01 	teqne	r0, r1
    3df8:	bf58      	it	pl
    3dfa:	ebb2 0003 	subspl.w	r0, r2, r3
    3dfe:	bf88      	it	hi
    3e00:	17c8      	asrhi	r0, r1, #31
    3e02:	bf38      	it	cc
    3e04:	ea6f 70e1 	mvncc.w	r0, r1, asr #31
    3e08:	bf18      	it	ne
    3e0a:	f040 0001 	orrne.w	r0, r0, #1
    3e0e:	4770      	bx	lr
    3e10:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    3e14:	d102      	bne.n	3e1c <__cmpsf2+0x4c>
    3e16:	ea5f 2c40 	movs.w	ip, r0, lsl #9
    3e1a:	d105      	bne.n	3e28 <__cmpsf2+0x58>
    3e1c:	ea7f 6c23 	mvns.w	ip, r3, asr #24
    3e20:	d1e4      	bne.n	3dec <__cmpsf2+0x1c>
    3e22:	ea5f 2c41 	movs.w	ip, r1, lsl #9
    3e26:	d0e1      	beq.n	3dec <__cmpsf2+0x1c>
    3e28:	f85d 0b04 	ldr.w	r0, [sp], #4
    3e2c:	4770      	bx	lr
    3e2e:	bf00      	nop

00003e30 <__aeabi_cfrcmple>:
    3e30:	4684      	mov	ip, r0
    3e32:	4608      	mov	r0, r1
    3e34:	4661      	mov	r1, ip
    3e36:	e7ff      	b.n	3e38 <__aeabi_cfcmpeq>

00003e38 <__aeabi_cfcmpeq>:
    3e38:	b50f      	push	{r0, r1, r2, r3, lr}
    3e3a:	f7ff ffc9 	bl	3dd0 <__cmpsf2>
    3e3e:	2800      	cmp	r0, #0
    3e40:	bf48      	it	mi
    3e42:	f110 0f00 	cmnmi.w	r0, #0
    3e46:	bd0f      	pop	{r0, r1, r2, r3, pc}

00003e48 <__aeabi_fcmpeq>:
    3e48:	f84d ed08 	str.w	lr, [sp, #-8]!
    3e4c:	f7ff fff4 	bl	3e38 <__aeabi_cfcmpeq>
    3e50:	bf0c      	ite	eq
    3e52:	2001      	moveq	r0, #1
    3e54:	2000      	movne	r0, #0
    3e56:	f85d fb08 	ldr.w	pc, [sp], #8
    3e5a:	bf00      	nop

00003e5c <__aeabi_fcmplt>:
    3e5c:	f84d ed08 	str.w	lr, [sp, #-8]!
    3e60:	f7ff ffea 	bl	3e38 <__aeabi_cfcmpeq>
    3e64:	bf34      	ite	cc
    3e66:	2001      	movcc	r0, #1
    3e68:	2000      	movcs	r0, #0
    3e6a:	f85d fb08 	ldr.w	pc, [sp], #8
    3e6e:	bf00      	nop

00003e70 <__aeabi_fcmple>:
    3e70:	f84d ed08 	str.w	lr, [sp, #-8]!
    3e74:	f7ff ffe0 	bl	3e38 <__aeabi_cfcmpeq>
    3e78:	bf94      	ite	ls
    3e7a:	2001      	movls	r0, #1
    3e7c:	2000      	movhi	r0, #0
    3e7e:	f85d fb08 	ldr.w	pc, [sp], #8
    3e82:	bf00      	nop

00003e84 <__aeabi_fcmpge>:
    3e84:	f84d ed08 	str.w	lr, [sp, #-8]!
    3e88:	f7ff ffd2 	bl	3e30 <__aeabi_cfrcmple>
    3e8c:	bf94      	ite	ls
    3e8e:	2001      	movls	r0, #1
    3e90:	2000      	movhi	r0, #0
    3e92:	f85d fb08 	ldr.w	pc, [sp], #8
    3e96:	bf00      	nop

00003e98 <__aeabi_fcmpgt>:
    3e98:	f84d ed08 	str.w	lr, [sp, #-8]!
    3e9c:	f7ff ffc8 	bl	3e30 <__aeabi_cfrcmple>
    3ea0:	bf34      	ite	cc
    3ea2:	2001      	movcc	r0, #1
    3ea4:	2000      	movcs	r0, #0
    3ea6:	f85d fb08 	ldr.w	pc, [sp], #8
    3eaa:	bf00      	nop

00003eac <__cxa_atexit>:
    3eac:	4613      	mov	r3, r2
    3eae:	460a      	mov	r2, r1
    3eb0:	4601      	mov	r1, r0
    3eb2:	2002      	movs	r0, #2
    3eb4:	f000 bb04 	b.w	44c0 <__register_exitproc>

00003eb8 <__errno>:
    3eb8:	4b01      	ldr	r3, [pc, #4]	; (3ec0 <__errno+0x8>)
    3eba:	6818      	ldr	r0, [r3, #0]
    3ebc:	4770      	bx	lr
    3ebe:	bf00      	nop
    3ec0:	1fff8dd8 	.word	0x1fff8dd8

00003ec4 <__libc_init_array>:
    3ec4:	b570      	push	{r4, r5, r6, lr}
    3ec6:	4e0f      	ldr	r6, [pc, #60]	; (3f04 <__libc_init_array+0x40>)
    3ec8:	4d0f      	ldr	r5, [pc, #60]	; (3f08 <__libc_init_array+0x44>)
    3eca:	1b76      	subs	r6, r6, r5
    3ecc:	10b6      	asrs	r6, r6, #2
    3ece:	bf18      	it	ne
    3ed0:	2400      	movne	r4, #0
    3ed2:	d005      	beq.n	3ee0 <__libc_init_array+0x1c>
    3ed4:	3401      	adds	r4, #1
    3ed6:	f855 3b04 	ldr.w	r3, [r5], #4
    3eda:	4798      	blx	r3
    3edc:	42a6      	cmp	r6, r4
    3ede:	d1f9      	bne.n	3ed4 <__libc_init_array+0x10>
    3ee0:	4e0a      	ldr	r6, [pc, #40]	; (3f0c <__libc_init_array+0x48>)
    3ee2:	4d0b      	ldr	r5, [pc, #44]	; (3f10 <__libc_init_array+0x4c>)
    3ee4:	1b76      	subs	r6, r6, r5
    3ee6:	f000 fd8f 	bl	4a08 <_init>
    3eea:	10b6      	asrs	r6, r6, #2
    3eec:	bf18      	it	ne
    3eee:	2400      	movne	r4, #0
    3ef0:	d006      	beq.n	3f00 <__libc_init_array+0x3c>
    3ef2:	3401      	adds	r4, #1
    3ef4:	f855 3b04 	ldr.w	r3, [r5], #4
    3ef8:	4798      	blx	r3
    3efa:	42a6      	cmp	r6, r4
    3efc:	d1f9      	bne.n	3ef2 <__libc_init_array+0x2e>
    3efe:	bd70      	pop	{r4, r5, r6, pc}
    3f00:	bd70      	pop	{r4, r5, r6, pc}
    3f02:	bf00      	nop
    3f04:	00004a14 	.word	0x00004a14
    3f08:	00004a14 	.word	0x00004a14
    3f0c:	00004a20 	.word	0x00004a20
    3f10:	00004a14 	.word	0x00004a14

00003f14 <malloc>:
    3f14:	4b02      	ldr	r3, [pc, #8]	; (3f20 <malloc+0xc>)
    3f16:	4601      	mov	r1, r0
    3f18:	6818      	ldr	r0, [r3, #0]
    3f1a:	f000 b803 	b.w	3f24 <_malloc_r>
    3f1e:	bf00      	nop
    3f20:	1fff8dd8 	.word	0x1fff8dd8

00003f24 <_malloc_r>:
    3f24:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3f28:	f101 050b 	add.w	r5, r1, #11
    3f2c:	2d16      	cmp	r5, #22
    3f2e:	b083      	sub	sp, #12
    3f30:	4606      	mov	r6, r0
    3f32:	f240 809f 	bls.w	4074 <_malloc_r+0x150>
    3f36:	f035 0507 	bics.w	r5, r5, #7
    3f3a:	f100 80bf 	bmi.w	40bc <_malloc_r+0x198>
    3f3e:	42a9      	cmp	r1, r5
    3f40:	f200 80bc 	bhi.w	40bc <_malloc_r+0x198>
    3f44:	f000 faa6 	bl	4494 <__malloc_lock>
    3f48:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    3f4c:	f0c0 829c 	bcc.w	4488 <_malloc_r+0x564>
    3f50:	0a6b      	lsrs	r3, r5, #9
    3f52:	f000 80ba 	beq.w	40ca <_malloc_r+0x1a6>
    3f56:	2b04      	cmp	r3, #4
    3f58:	f200 8183 	bhi.w	4262 <_malloc_r+0x33e>
    3f5c:	09a8      	lsrs	r0, r5, #6
    3f5e:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    3f62:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3f66:	3038      	adds	r0, #56	; 0x38
    3f68:	4fc4      	ldr	r7, [pc, #784]	; (427c <_malloc_r+0x358>)
    3f6a:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    3f6e:	f1a3 0108 	sub.w	r1, r3, #8
    3f72:	685c      	ldr	r4, [r3, #4]
    3f74:	42a1      	cmp	r1, r4
    3f76:	d107      	bne.n	3f88 <_malloc_r+0x64>
    3f78:	e0ac      	b.n	40d4 <_malloc_r+0x1b0>
    3f7a:	2a00      	cmp	r2, #0
    3f7c:	f280 80ac 	bge.w	40d8 <_malloc_r+0x1b4>
    3f80:	68e4      	ldr	r4, [r4, #12]
    3f82:	42a1      	cmp	r1, r4
    3f84:	f000 80a6 	beq.w	40d4 <_malloc_r+0x1b0>
    3f88:	6863      	ldr	r3, [r4, #4]
    3f8a:	f023 0303 	bic.w	r3, r3, #3
    3f8e:	1b5a      	subs	r2, r3, r5
    3f90:	2a0f      	cmp	r2, #15
    3f92:	ddf2      	ble.n	3f7a <_malloc_r+0x56>
    3f94:	49b9      	ldr	r1, [pc, #740]	; (427c <_malloc_r+0x358>)
    3f96:	693c      	ldr	r4, [r7, #16]
    3f98:	f101 0e08 	add.w	lr, r1, #8
    3f9c:	4574      	cmp	r4, lr
    3f9e:	f000 81b3 	beq.w	4308 <_malloc_r+0x3e4>
    3fa2:	6863      	ldr	r3, [r4, #4]
    3fa4:	f023 0303 	bic.w	r3, r3, #3
    3fa8:	1b5a      	subs	r2, r3, r5
    3faa:	2a0f      	cmp	r2, #15
    3fac:	f300 8199 	bgt.w	42e2 <_malloc_r+0x3be>
    3fb0:	2a00      	cmp	r2, #0
    3fb2:	f8c1 e014 	str.w	lr, [r1, #20]
    3fb6:	f8c1 e010 	str.w	lr, [r1, #16]
    3fba:	f280 809e 	bge.w	40fa <_malloc_r+0x1d6>
    3fbe:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    3fc2:	f080 8167 	bcs.w	4294 <_malloc_r+0x370>
    3fc6:	08db      	lsrs	r3, r3, #3
    3fc8:	f103 0c01 	add.w	ip, r3, #1
    3fcc:	2201      	movs	r2, #1
    3fce:	109b      	asrs	r3, r3, #2
    3fd0:	fa02 f303 	lsl.w	r3, r2, r3
    3fd4:	684a      	ldr	r2, [r1, #4]
    3fd6:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    3fda:	f8c4 8008 	str.w	r8, [r4, #8]
    3fde:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    3fe2:	431a      	orrs	r2, r3
    3fe4:	f1a9 0308 	sub.w	r3, r9, #8
    3fe8:	60e3      	str	r3, [r4, #12]
    3fea:	604a      	str	r2, [r1, #4]
    3fec:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    3ff0:	f8c8 400c 	str.w	r4, [r8, #12]
    3ff4:	1083      	asrs	r3, r0, #2
    3ff6:	2401      	movs	r4, #1
    3ff8:	409c      	lsls	r4, r3
    3ffa:	4294      	cmp	r4, r2
    3ffc:	f200 808a 	bhi.w	4114 <_malloc_r+0x1f0>
    4000:	4214      	tst	r4, r2
    4002:	d106      	bne.n	4012 <_malloc_r+0xee>
    4004:	f020 0003 	bic.w	r0, r0, #3
    4008:	0064      	lsls	r4, r4, #1
    400a:	4214      	tst	r4, r2
    400c:	f100 0004 	add.w	r0, r0, #4
    4010:	d0fa      	beq.n	4008 <_malloc_r+0xe4>
    4012:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    4016:	46cc      	mov	ip, r9
    4018:	4680      	mov	r8, r0
    401a:	f8dc 100c 	ldr.w	r1, [ip, #12]
    401e:	458c      	cmp	ip, r1
    4020:	d107      	bne.n	4032 <_malloc_r+0x10e>
    4022:	e173      	b.n	430c <_malloc_r+0x3e8>
    4024:	2a00      	cmp	r2, #0
    4026:	f280 8181 	bge.w	432c <_malloc_r+0x408>
    402a:	68c9      	ldr	r1, [r1, #12]
    402c:	458c      	cmp	ip, r1
    402e:	f000 816d 	beq.w	430c <_malloc_r+0x3e8>
    4032:	684b      	ldr	r3, [r1, #4]
    4034:	f023 0303 	bic.w	r3, r3, #3
    4038:	1b5a      	subs	r2, r3, r5
    403a:	2a0f      	cmp	r2, #15
    403c:	ddf2      	ble.n	4024 <_malloc_r+0x100>
    403e:	460c      	mov	r4, r1
    4040:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    4044:	f854 8f08 	ldr.w	r8, [r4, #8]!
    4048:	194b      	adds	r3, r1, r5
    404a:	f045 0501 	orr.w	r5, r5, #1
    404e:	604d      	str	r5, [r1, #4]
    4050:	f042 0101 	orr.w	r1, r2, #1
    4054:	f8c8 c00c 	str.w	ip, [r8, #12]
    4058:	4630      	mov	r0, r6
    405a:	f8cc 8008 	str.w	r8, [ip, #8]
    405e:	617b      	str	r3, [r7, #20]
    4060:	613b      	str	r3, [r7, #16]
    4062:	f8c3 e00c 	str.w	lr, [r3, #12]
    4066:	f8c3 e008 	str.w	lr, [r3, #8]
    406a:	6059      	str	r1, [r3, #4]
    406c:	509a      	str	r2, [r3, r2]
    406e:	f000 fa13 	bl	4498 <__malloc_unlock>
    4072:	e01f      	b.n	40b4 <_malloc_r+0x190>
    4074:	2910      	cmp	r1, #16
    4076:	d821      	bhi.n	40bc <_malloc_r+0x198>
    4078:	f000 fa0c 	bl	4494 <__malloc_lock>
    407c:	2510      	movs	r5, #16
    407e:	2306      	movs	r3, #6
    4080:	2002      	movs	r0, #2
    4082:	4f7e      	ldr	r7, [pc, #504]	; (427c <_malloc_r+0x358>)
    4084:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    4088:	f1a3 0208 	sub.w	r2, r3, #8
    408c:	685c      	ldr	r4, [r3, #4]
    408e:	4294      	cmp	r4, r2
    4090:	f000 8145 	beq.w	431e <_malloc_r+0x3fa>
    4094:	6863      	ldr	r3, [r4, #4]
    4096:	68e1      	ldr	r1, [r4, #12]
    4098:	68a5      	ldr	r5, [r4, #8]
    409a:	f023 0303 	bic.w	r3, r3, #3
    409e:	4423      	add	r3, r4
    40a0:	4630      	mov	r0, r6
    40a2:	685a      	ldr	r2, [r3, #4]
    40a4:	60e9      	str	r1, [r5, #12]
    40a6:	f042 0201 	orr.w	r2, r2, #1
    40aa:	608d      	str	r5, [r1, #8]
    40ac:	605a      	str	r2, [r3, #4]
    40ae:	f000 f9f3 	bl	4498 <__malloc_unlock>
    40b2:	3408      	adds	r4, #8
    40b4:	4620      	mov	r0, r4
    40b6:	b003      	add	sp, #12
    40b8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    40bc:	2400      	movs	r4, #0
    40be:	230c      	movs	r3, #12
    40c0:	4620      	mov	r0, r4
    40c2:	6033      	str	r3, [r6, #0]
    40c4:	b003      	add	sp, #12
    40c6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    40ca:	2380      	movs	r3, #128	; 0x80
    40cc:	f04f 0e40 	mov.w	lr, #64	; 0x40
    40d0:	203f      	movs	r0, #63	; 0x3f
    40d2:	e749      	b.n	3f68 <_malloc_r+0x44>
    40d4:	4670      	mov	r0, lr
    40d6:	e75d      	b.n	3f94 <_malloc_r+0x70>
    40d8:	4423      	add	r3, r4
    40da:	68e1      	ldr	r1, [r4, #12]
    40dc:	685a      	ldr	r2, [r3, #4]
    40de:	68a5      	ldr	r5, [r4, #8]
    40e0:	f042 0201 	orr.w	r2, r2, #1
    40e4:	60e9      	str	r1, [r5, #12]
    40e6:	4630      	mov	r0, r6
    40e8:	608d      	str	r5, [r1, #8]
    40ea:	605a      	str	r2, [r3, #4]
    40ec:	f000 f9d4 	bl	4498 <__malloc_unlock>
    40f0:	3408      	adds	r4, #8
    40f2:	4620      	mov	r0, r4
    40f4:	b003      	add	sp, #12
    40f6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    40fa:	4423      	add	r3, r4
    40fc:	4630      	mov	r0, r6
    40fe:	685a      	ldr	r2, [r3, #4]
    4100:	f042 0201 	orr.w	r2, r2, #1
    4104:	605a      	str	r2, [r3, #4]
    4106:	f000 f9c7 	bl	4498 <__malloc_unlock>
    410a:	3408      	adds	r4, #8
    410c:	4620      	mov	r0, r4
    410e:	b003      	add	sp, #12
    4110:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4114:	68bc      	ldr	r4, [r7, #8]
    4116:	6863      	ldr	r3, [r4, #4]
    4118:	f023 0803 	bic.w	r8, r3, #3
    411c:	45a8      	cmp	r8, r5
    411e:	d304      	bcc.n	412a <_malloc_r+0x206>
    4120:	ebc5 0308 	rsb	r3, r5, r8
    4124:	2b0f      	cmp	r3, #15
    4126:	f300 808c 	bgt.w	4242 <_malloc_r+0x31e>
    412a:	4b55      	ldr	r3, [pc, #340]	; (4280 <_malloc_r+0x35c>)
    412c:	f8df 9160 	ldr.w	r9, [pc, #352]	; 4290 <_malloc_r+0x36c>
    4130:	681a      	ldr	r2, [r3, #0]
    4132:	f8d9 3000 	ldr.w	r3, [r9]
    4136:	3301      	adds	r3, #1
    4138:	442a      	add	r2, r5
    413a:	eb04 0a08 	add.w	sl, r4, r8
    413e:	f000 8160 	beq.w	4402 <_malloc_r+0x4de>
    4142:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    4146:	320f      	adds	r2, #15
    4148:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    414c:	f022 020f 	bic.w	r2, r2, #15
    4150:	4611      	mov	r1, r2
    4152:	4630      	mov	r0, r6
    4154:	9201      	str	r2, [sp, #4]
    4156:	f000 f9a1 	bl	449c <_sbrk_r>
    415a:	f1b0 3fff 	cmp.w	r0, #4294967295
    415e:	4683      	mov	fp, r0
    4160:	9a01      	ldr	r2, [sp, #4]
    4162:	f000 8158 	beq.w	4416 <_malloc_r+0x4f2>
    4166:	4582      	cmp	sl, r0
    4168:	f200 80fc 	bhi.w	4364 <_malloc_r+0x440>
    416c:	4b45      	ldr	r3, [pc, #276]	; (4284 <_malloc_r+0x360>)
    416e:	6819      	ldr	r1, [r3, #0]
    4170:	45da      	cmp	sl, fp
    4172:	4411      	add	r1, r2
    4174:	6019      	str	r1, [r3, #0]
    4176:	f000 8153 	beq.w	4420 <_malloc_r+0x4fc>
    417a:	f8d9 0000 	ldr.w	r0, [r9]
    417e:	f8df e110 	ldr.w	lr, [pc, #272]	; 4290 <_malloc_r+0x36c>
    4182:	3001      	adds	r0, #1
    4184:	bf1b      	ittet	ne
    4186:	ebca 0a0b 	rsbne	sl, sl, fp
    418a:	4451      	addne	r1, sl
    418c:	f8ce b000 	streq.w	fp, [lr]
    4190:	6019      	strne	r1, [r3, #0]
    4192:	f01b 0107 	ands.w	r1, fp, #7
    4196:	f000 8117 	beq.w	43c8 <_malloc_r+0x4a4>
    419a:	f1c1 0008 	rsb	r0, r1, #8
    419e:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    41a2:	4483      	add	fp, r0
    41a4:	3108      	adds	r1, #8
    41a6:	445a      	add	r2, fp
    41a8:	f3c2 020b 	ubfx	r2, r2, #0, #12
    41ac:	ebc2 0901 	rsb	r9, r2, r1
    41b0:	4649      	mov	r1, r9
    41b2:	4630      	mov	r0, r6
    41b4:	9301      	str	r3, [sp, #4]
    41b6:	f000 f971 	bl	449c <_sbrk_r>
    41ba:	1c43      	adds	r3, r0, #1
    41bc:	9b01      	ldr	r3, [sp, #4]
    41be:	f000 813f 	beq.w	4440 <_malloc_r+0x51c>
    41c2:	ebcb 0200 	rsb	r2, fp, r0
    41c6:	444a      	add	r2, r9
    41c8:	f042 0201 	orr.w	r2, r2, #1
    41cc:	6819      	ldr	r1, [r3, #0]
    41ce:	f8c7 b008 	str.w	fp, [r7, #8]
    41d2:	4449      	add	r1, r9
    41d4:	42bc      	cmp	r4, r7
    41d6:	f8cb 2004 	str.w	r2, [fp, #4]
    41da:	6019      	str	r1, [r3, #0]
    41dc:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 4284 <_malloc_r+0x360>
    41e0:	d016      	beq.n	4210 <_malloc_r+0x2ec>
    41e2:	f1b8 0f0f 	cmp.w	r8, #15
    41e6:	f240 80fd 	bls.w	43e4 <_malloc_r+0x4c0>
    41ea:	6862      	ldr	r2, [r4, #4]
    41ec:	f1a8 030c 	sub.w	r3, r8, #12
    41f0:	f023 0307 	bic.w	r3, r3, #7
    41f4:	18e0      	adds	r0, r4, r3
    41f6:	f002 0201 	and.w	r2, r2, #1
    41fa:	f04f 0e05 	mov.w	lr, #5
    41fe:	431a      	orrs	r2, r3
    4200:	2b0f      	cmp	r3, #15
    4202:	6062      	str	r2, [r4, #4]
    4204:	f8c0 e004 	str.w	lr, [r0, #4]
    4208:	f8c0 e008 	str.w	lr, [r0, #8]
    420c:	f200 811c 	bhi.w	4448 <_malloc_r+0x524>
    4210:	4b1d      	ldr	r3, [pc, #116]	; (4288 <_malloc_r+0x364>)
    4212:	68bc      	ldr	r4, [r7, #8]
    4214:	681a      	ldr	r2, [r3, #0]
    4216:	4291      	cmp	r1, r2
    4218:	bf88      	it	hi
    421a:	6019      	strhi	r1, [r3, #0]
    421c:	4b1b      	ldr	r3, [pc, #108]	; (428c <_malloc_r+0x368>)
    421e:	681a      	ldr	r2, [r3, #0]
    4220:	4291      	cmp	r1, r2
    4222:	6862      	ldr	r2, [r4, #4]
    4224:	bf88      	it	hi
    4226:	6019      	strhi	r1, [r3, #0]
    4228:	f022 0203 	bic.w	r2, r2, #3
    422c:	4295      	cmp	r5, r2
    422e:	eba2 0305 	sub.w	r3, r2, r5
    4232:	d801      	bhi.n	4238 <_malloc_r+0x314>
    4234:	2b0f      	cmp	r3, #15
    4236:	dc04      	bgt.n	4242 <_malloc_r+0x31e>
    4238:	4630      	mov	r0, r6
    423a:	f000 f92d 	bl	4498 <__malloc_unlock>
    423e:	2400      	movs	r4, #0
    4240:	e738      	b.n	40b4 <_malloc_r+0x190>
    4242:	1962      	adds	r2, r4, r5
    4244:	f043 0301 	orr.w	r3, r3, #1
    4248:	f045 0501 	orr.w	r5, r5, #1
    424c:	6065      	str	r5, [r4, #4]
    424e:	4630      	mov	r0, r6
    4250:	60ba      	str	r2, [r7, #8]
    4252:	6053      	str	r3, [r2, #4]
    4254:	f000 f920 	bl	4498 <__malloc_unlock>
    4258:	3408      	adds	r4, #8
    425a:	4620      	mov	r0, r4
    425c:	b003      	add	sp, #12
    425e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4262:	2b14      	cmp	r3, #20
    4264:	d971      	bls.n	434a <_malloc_r+0x426>
    4266:	2b54      	cmp	r3, #84	; 0x54
    4268:	f200 80a4 	bhi.w	43b4 <_malloc_r+0x490>
    426c:	0b28      	lsrs	r0, r5, #12
    426e:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    4272:	ea4f 034e 	mov.w	r3, lr, lsl #1
    4276:	306e      	adds	r0, #110	; 0x6e
    4278:	e676      	b.n	3f68 <_malloc_r+0x44>
    427a:	bf00      	nop
    427c:	1fff8ddc 	.word	0x1fff8ddc
    4280:	1fff966c 	.word	0x1fff966c
    4284:	1fff9670 	.word	0x1fff9670
    4288:	1fff9668 	.word	0x1fff9668
    428c:	1fff9664 	.word	0x1fff9664
    4290:	1fff91e8 	.word	0x1fff91e8
    4294:	0a5a      	lsrs	r2, r3, #9
    4296:	2a04      	cmp	r2, #4
    4298:	d95e      	bls.n	4358 <_malloc_r+0x434>
    429a:	2a14      	cmp	r2, #20
    429c:	f200 80b3 	bhi.w	4406 <_malloc_r+0x4e2>
    42a0:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    42a4:	0049      	lsls	r1, r1, #1
    42a6:	325b      	adds	r2, #91	; 0x5b
    42a8:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    42ac:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    42b0:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 4490 <_malloc_r+0x56c>
    42b4:	f1ac 0c08 	sub.w	ip, ip, #8
    42b8:	458c      	cmp	ip, r1
    42ba:	f000 8088 	beq.w	43ce <_malloc_r+0x4aa>
    42be:	684a      	ldr	r2, [r1, #4]
    42c0:	f022 0203 	bic.w	r2, r2, #3
    42c4:	4293      	cmp	r3, r2
    42c6:	d202      	bcs.n	42ce <_malloc_r+0x3aa>
    42c8:	6889      	ldr	r1, [r1, #8]
    42ca:	458c      	cmp	ip, r1
    42cc:	d1f7      	bne.n	42be <_malloc_r+0x39a>
    42ce:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    42d2:	687a      	ldr	r2, [r7, #4]
    42d4:	f8c4 c00c 	str.w	ip, [r4, #12]
    42d8:	60a1      	str	r1, [r4, #8]
    42da:	f8cc 4008 	str.w	r4, [ip, #8]
    42de:	60cc      	str	r4, [r1, #12]
    42e0:	e688      	b.n	3ff4 <_malloc_r+0xd0>
    42e2:	1963      	adds	r3, r4, r5
    42e4:	f042 0701 	orr.w	r7, r2, #1
    42e8:	f045 0501 	orr.w	r5, r5, #1
    42ec:	6065      	str	r5, [r4, #4]
    42ee:	4630      	mov	r0, r6
    42f0:	614b      	str	r3, [r1, #20]
    42f2:	610b      	str	r3, [r1, #16]
    42f4:	f8c3 e00c 	str.w	lr, [r3, #12]
    42f8:	f8c3 e008 	str.w	lr, [r3, #8]
    42fc:	605f      	str	r7, [r3, #4]
    42fe:	509a      	str	r2, [r3, r2]
    4300:	3408      	adds	r4, #8
    4302:	f000 f8c9 	bl	4498 <__malloc_unlock>
    4306:	e6d5      	b.n	40b4 <_malloc_r+0x190>
    4308:	684a      	ldr	r2, [r1, #4]
    430a:	e673      	b.n	3ff4 <_malloc_r+0xd0>
    430c:	f108 0801 	add.w	r8, r8, #1
    4310:	f018 0f03 	tst.w	r8, #3
    4314:	f10c 0c08 	add.w	ip, ip, #8
    4318:	f47f ae7f 	bne.w	401a <_malloc_r+0xf6>
    431c:	e030      	b.n	4380 <_malloc_r+0x45c>
    431e:	68dc      	ldr	r4, [r3, #12]
    4320:	42a3      	cmp	r3, r4
    4322:	bf08      	it	eq
    4324:	3002      	addeq	r0, #2
    4326:	f43f ae35 	beq.w	3f94 <_malloc_r+0x70>
    432a:	e6b3      	b.n	4094 <_malloc_r+0x170>
    432c:	440b      	add	r3, r1
    432e:	460c      	mov	r4, r1
    4330:	685a      	ldr	r2, [r3, #4]
    4332:	68c9      	ldr	r1, [r1, #12]
    4334:	f854 5f08 	ldr.w	r5, [r4, #8]!
    4338:	f042 0201 	orr.w	r2, r2, #1
    433c:	605a      	str	r2, [r3, #4]
    433e:	4630      	mov	r0, r6
    4340:	60e9      	str	r1, [r5, #12]
    4342:	608d      	str	r5, [r1, #8]
    4344:	f000 f8a8 	bl	4498 <__malloc_unlock>
    4348:	e6b4      	b.n	40b4 <_malloc_r+0x190>
    434a:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    434e:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    4352:	ea4f 034e 	mov.w	r3, lr, lsl #1
    4356:	e607      	b.n	3f68 <_malloc_r+0x44>
    4358:	099a      	lsrs	r2, r3, #6
    435a:	f102 0139 	add.w	r1, r2, #57	; 0x39
    435e:	0049      	lsls	r1, r1, #1
    4360:	3238      	adds	r2, #56	; 0x38
    4362:	e7a1      	b.n	42a8 <_malloc_r+0x384>
    4364:	42bc      	cmp	r4, r7
    4366:	4b4a      	ldr	r3, [pc, #296]	; (4490 <_malloc_r+0x56c>)
    4368:	f43f af00 	beq.w	416c <_malloc_r+0x248>
    436c:	689c      	ldr	r4, [r3, #8]
    436e:	6862      	ldr	r2, [r4, #4]
    4370:	f022 0203 	bic.w	r2, r2, #3
    4374:	e75a      	b.n	422c <_malloc_r+0x308>
    4376:	f859 3908 	ldr.w	r3, [r9], #-8
    437a:	4599      	cmp	r9, r3
    437c:	f040 8082 	bne.w	4484 <_malloc_r+0x560>
    4380:	f010 0f03 	tst.w	r0, #3
    4384:	f100 30ff 	add.w	r0, r0, #4294967295
    4388:	d1f5      	bne.n	4376 <_malloc_r+0x452>
    438a:	687b      	ldr	r3, [r7, #4]
    438c:	ea23 0304 	bic.w	r3, r3, r4
    4390:	607b      	str	r3, [r7, #4]
    4392:	0064      	lsls	r4, r4, #1
    4394:	429c      	cmp	r4, r3
    4396:	f63f aebd 	bhi.w	4114 <_malloc_r+0x1f0>
    439a:	2c00      	cmp	r4, #0
    439c:	f43f aeba 	beq.w	4114 <_malloc_r+0x1f0>
    43a0:	421c      	tst	r4, r3
    43a2:	4640      	mov	r0, r8
    43a4:	f47f ae35 	bne.w	4012 <_malloc_r+0xee>
    43a8:	0064      	lsls	r4, r4, #1
    43aa:	421c      	tst	r4, r3
    43ac:	f100 0004 	add.w	r0, r0, #4
    43b0:	d0fa      	beq.n	43a8 <_malloc_r+0x484>
    43b2:	e62e      	b.n	4012 <_malloc_r+0xee>
    43b4:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    43b8:	d818      	bhi.n	43ec <_malloc_r+0x4c8>
    43ba:	0be8      	lsrs	r0, r5, #15
    43bc:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    43c0:	ea4f 034e 	mov.w	r3, lr, lsl #1
    43c4:	3077      	adds	r0, #119	; 0x77
    43c6:	e5cf      	b.n	3f68 <_malloc_r+0x44>
    43c8:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    43cc:	e6eb      	b.n	41a6 <_malloc_r+0x282>
    43ce:	2101      	movs	r1, #1
    43d0:	f8d8 3004 	ldr.w	r3, [r8, #4]
    43d4:	1092      	asrs	r2, r2, #2
    43d6:	fa01 f202 	lsl.w	r2, r1, r2
    43da:	431a      	orrs	r2, r3
    43dc:	f8c8 2004 	str.w	r2, [r8, #4]
    43e0:	4661      	mov	r1, ip
    43e2:	e777      	b.n	42d4 <_malloc_r+0x3b0>
    43e4:	2301      	movs	r3, #1
    43e6:	f8cb 3004 	str.w	r3, [fp, #4]
    43ea:	e725      	b.n	4238 <_malloc_r+0x314>
    43ec:	f240 5254 	movw	r2, #1364	; 0x554
    43f0:	4293      	cmp	r3, r2
    43f2:	d820      	bhi.n	4436 <_malloc_r+0x512>
    43f4:	0ca8      	lsrs	r0, r5, #18
    43f6:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    43fa:	ea4f 034e 	mov.w	r3, lr, lsl #1
    43fe:	307c      	adds	r0, #124	; 0x7c
    4400:	e5b2      	b.n	3f68 <_malloc_r+0x44>
    4402:	3210      	adds	r2, #16
    4404:	e6a4      	b.n	4150 <_malloc_r+0x22c>
    4406:	2a54      	cmp	r2, #84	; 0x54
    4408:	d826      	bhi.n	4458 <_malloc_r+0x534>
    440a:	0b1a      	lsrs	r2, r3, #12
    440c:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    4410:	0049      	lsls	r1, r1, #1
    4412:	326e      	adds	r2, #110	; 0x6e
    4414:	e748      	b.n	42a8 <_malloc_r+0x384>
    4416:	68bc      	ldr	r4, [r7, #8]
    4418:	6862      	ldr	r2, [r4, #4]
    441a:	f022 0203 	bic.w	r2, r2, #3
    441e:	e705      	b.n	422c <_malloc_r+0x308>
    4420:	f3ca 000b 	ubfx	r0, sl, #0, #12
    4424:	2800      	cmp	r0, #0
    4426:	f47f aea8 	bne.w	417a <_malloc_r+0x256>
    442a:	4442      	add	r2, r8
    442c:	68bb      	ldr	r3, [r7, #8]
    442e:	f042 0201 	orr.w	r2, r2, #1
    4432:	605a      	str	r2, [r3, #4]
    4434:	e6ec      	b.n	4210 <_malloc_r+0x2ec>
    4436:	23fe      	movs	r3, #254	; 0xfe
    4438:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    443c:	207e      	movs	r0, #126	; 0x7e
    443e:	e593      	b.n	3f68 <_malloc_r+0x44>
    4440:	2201      	movs	r2, #1
    4442:	f04f 0900 	mov.w	r9, #0
    4446:	e6c1      	b.n	41cc <_malloc_r+0x2a8>
    4448:	f104 0108 	add.w	r1, r4, #8
    444c:	4630      	mov	r0, r6
    444e:	f000 f8fb 	bl	4648 <_free_r>
    4452:	f8d9 1000 	ldr.w	r1, [r9]
    4456:	e6db      	b.n	4210 <_malloc_r+0x2ec>
    4458:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    445c:	d805      	bhi.n	446a <_malloc_r+0x546>
    445e:	0bda      	lsrs	r2, r3, #15
    4460:	f102 0178 	add.w	r1, r2, #120	; 0x78
    4464:	0049      	lsls	r1, r1, #1
    4466:	3277      	adds	r2, #119	; 0x77
    4468:	e71e      	b.n	42a8 <_malloc_r+0x384>
    446a:	f240 5154 	movw	r1, #1364	; 0x554
    446e:	428a      	cmp	r2, r1
    4470:	d805      	bhi.n	447e <_malloc_r+0x55a>
    4472:	0c9a      	lsrs	r2, r3, #18
    4474:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    4478:	0049      	lsls	r1, r1, #1
    447a:	327c      	adds	r2, #124	; 0x7c
    447c:	e714      	b.n	42a8 <_malloc_r+0x384>
    447e:	21fe      	movs	r1, #254	; 0xfe
    4480:	227e      	movs	r2, #126	; 0x7e
    4482:	e711      	b.n	42a8 <_malloc_r+0x384>
    4484:	687b      	ldr	r3, [r7, #4]
    4486:	e784      	b.n	4392 <_malloc_r+0x46e>
    4488:	08e8      	lsrs	r0, r5, #3
    448a:	1c43      	adds	r3, r0, #1
    448c:	005b      	lsls	r3, r3, #1
    448e:	e5f8      	b.n	4082 <_malloc_r+0x15e>
    4490:	1fff8ddc 	.word	0x1fff8ddc

00004494 <__malloc_lock>:
    4494:	4770      	bx	lr
    4496:	bf00      	nop

00004498 <__malloc_unlock>:
    4498:	4770      	bx	lr
    449a:	bf00      	nop

0000449c <_sbrk_r>:
    449c:	b538      	push	{r3, r4, r5, lr}
    449e:	4c07      	ldr	r4, [pc, #28]	; (44bc <_sbrk_r+0x20>)
    44a0:	2300      	movs	r3, #0
    44a2:	4605      	mov	r5, r0
    44a4:	4608      	mov	r0, r1
    44a6:	6023      	str	r3, [r4, #0]
    44a8:	f7fc fe66 	bl	1178 <_sbrk>
    44ac:	1c43      	adds	r3, r0, #1
    44ae:	d000      	beq.n	44b2 <_sbrk_r+0x16>
    44b0:	bd38      	pop	{r3, r4, r5, pc}
    44b2:	6823      	ldr	r3, [r4, #0]
    44b4:	2b00      	cmp	r3, #0
    44b6:	d0fb      	beq.n	44b0 <_sbrk_r+0x14>
    44b8:	602b      	str	r3, [r5, #0]
    44ba:	bd38      	pop	{r3, r4, r5, pc}
    44bc:	1fff96ac 	.word	0x1fff96ac

000044c0 <__register_exitproc>:
    44c0:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    44c4:	4c25      	ldr	r4, [pc, #148]	; (455c <__register_exitproc+0x9c>)
    44c6:	6825      	ldr	r5, [r4, #0]
    44c8:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    44cc:	4606      	mov	r6, r0
    44ce:	4688      	mov	r8, r1
    44d0:	4692      	mov	sl, r2
    44d2:	4699      	mov	r9, r3
    44d4:	b3c4      	cbz	r4, 4548 <__register_exitproc+0x88>
    44d6:	6860      	ldr	r0, [r4, #4]
    44d8:	281f      	cmp	r0, #31
    44da:	dc17      	bgt.n	450c <__register_exitproc+0x4c>
    44dc:	1c43      	adds	r3, r0, #1
    44de:	b176      	cbz	r6, 44fe <__register_exitproc+0x3e>
    44e0:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    44e4:	2201      	movs	r2, #1
    44e6:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    44ea:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    44ee:	4082      	lsls	r2, r0
    44f0:	4311      	orrs	r1, r2
    44f2:	2e02      	cmp	r6, #2
    44f4:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    44f8:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    44fc:	d01e      	beq.n	453c <__register_exitproc+0x7c>
    44fe:	3002      	adds	r0, #2
    4500:	6063      	str	r3, [r4, #4]
    4502:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    4506:	2000      	movs	r0, #0
    4508:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    450c:	4b14      	ldr	r3, [pc, #80]	; (4560 <__register_exitproc+0xa0>)
    450e:	b303      	cbz	r3, 4552 <__register_exitproc+0x92>
    4510:	f44f 70c8 	mov.w	r0, #400	; 0x190
    4514:	f7ff fcfe 	bl	3f14 <malloc>
    4518:	4604      	mov	r4, r0
    451a:	b1d0      	cbz	r0, 4552 <__register_exitproc+0x92>
    451c:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    4520:	2700      	movs	r7, #0
    4522:	e880 0088 	stmia.w	r0, {r3, r7}
    4526:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    452a:	4638      	mov	r0, r7
    452c:	2301      	movs	r3, #1
    452e:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    4532:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    4536:	2e00      	cmp	r6, #0
    4538:	d0e1      	beq.n	44fe <__register_exitproc+0x3e>
    453a:	e7d1      	b.n	44e0 <__register_exitproc+0x20>
    453c:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    4540:	430a      	orrs	r2, r1
    4542:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    4546:	e7da      	b.n	44fe <__register_exitproc+0x3e>
    4548:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    454c:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    4550:	e7c1      	b.n	44d6 <__register_exitproc+0x16>
    4552:	f04f 30ff 	mov.w	r0, #4294967295
    4556:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    455a:	bf00      	nop
    455c:	00004a04 	.word	0x00004a04
    4560:	00003f15 	.word	0x00003f15

00004564 <register_fini>:
    4564:	4b02      	ldr	r3, [pc, #8]	; (4570 <register_fini+0xc>)
    4566:	b113      	cbz	r3, 456e <register_fini+0xa>
    4568:	4802      	ldr	r0, [pc, #8]	; (4574 <register_fini+0x10>)
    456a:	f000 b805 	b.w	4578 <atexit>
    456e:	4770      	bx	lr
    4570:	00000000 	.word	0x00000000
    4574:	00004585 	.word	0x00004585

00004578 <atexit>:
    4578:	2300      	movs	r3, #0
    457a:	4601      	mov	r1, r0
    457c:	461a      	mov	r2, r3
    457e:	4618      	mov	r0, r3
    4580:	f7ff bf9e 	b.w	44c0 <__register_exitproc>

00004584 <__libc_fini_array>:
    4584:	b538      	push	{r3, r4, r5, lr}
    4586:	4d07      	ldr	r5, [pc, #28]	; (45a4 <__libc_fini_array+0x20>)
    4588:	4c07      	ldr	r4, [pc, #28]	; (45a8 <__libc_fini_array+0x24>)
    458a:	1b2c      	subs	r4, r5, r4
    458c:	10a4      	asrs	r4, r4, #2
    458e:	d005      	beq.n	459c <__libc_fini_array+0x18>
    4590:	3c01      	subs	r4, #1
    4592:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    4596:	4798      	blx	r3
    4598:	2c00      	cmp	r4, #0
    459a:	d1f9      	bne.n	4590 <__libc_fini_array+0xc>
    459c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    45a0:	f000 ba3e 	b.w	4a20 <__init_array_end>
	...

000045ac <_malloc_trim_r>:
    45ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    45ae:	4f23      	ldr	r7, [pc, #140]	; (463c <_malloc_trim_r+0x90>)
    45b0:	460c      	mov	r4, r1
    45b2:	4606      	mov	r6, r0
    45b4:	f7ff ff6e 	bl	4494 <__malloc_lock>
    45b8:	68bb      	ldr	r3, [r7, #8]
    45ba:	685d      	ldr	r5, [r3, #4]
    45bc:	f025 0503 	bic.w	r5, r5, #3
    45c0:	1b29      	subs	r1, r5, r4
    45c2:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    45c6:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    45ca:	f021 010f 	bic.w	r1, r1, #15
    45ce:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    45d2:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    45d6:	db07      	blt.n	45e8 <_malloc_trim_r+0x3c>
    45d8:	2100      	movs	r1, #0
    45da:	4630      	mov	r0, r6
    45dc:	f7ff ff5e 	bl	449c <_sbrk_r>
    45e0:	68bb      	ldr	r3, [r7, #8]
    45e2:	442b      	add	r3, r5
    45e4:	4298      	cmp	r0, r3
    45e6:	d004      	beq.n	45f2 <_malloc_trim_r+0x46>
    45e8:	4630      	mov	r0, r6
    45ea:	f7ff ff55 	bl	4498 <__malloc_unlock>
    45ee:	2000      	movs	r0, #0
    45f0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    45f2:	4261      	negs	r1, r4
    45f4:	4630      	mov	r0, r6
    45f6:	f7ff ff51 	bl	449c <_sbrk_r>
    45fa:	3001      	adds	r0, #1
    45fc:	d00d      	beq.n	461a <_malloc_trim_r+0x6e>
    45fe:	4b10      	ldr	r3, [pc, #64]	; (4640 <_malloc_trim_r+0x94>)
    4600:	68ba      	ldr	r2, [r7, #8]
    4602:	6819      	ldr	r1, [r3, #0]
    4604:	1b2d      	subs	r5, r5, r4
    4606:	f045 0501 	orr.w	r5, r5, #1
    460a:	4630      	mov	r0, r6
    460c:	1b09      	subs	r1, r1, r4
    460e:	6055      	str	r5, [r2, #4]
    4610:	6019      	str	r1, [r3, #0]
    4612:	f7ff ff41 	bl	4498 <__malloc_unlock>
    4616:	2001      	movs	r0, #1
    4618:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    461a:	2100      	movs	r1, #0
    461c:	4630      	mov	r0, r6
    461e:	f7ff ff3d 	bl	449c <_sbrk_r>
    4622:	68ba      	ldr	r2, [r7, #8]
    4624:	1a83      	subs	r3, r0, r2
    4626:	2b0f      	cmp	r3, #15
    4628:	ddde      	ble.n	45e8 <_malloc_trim_r+0x3c>
    462a:	4c06      	ldr	r4, [pc, #24]	; (4644 <_malloc_trim_r+0x98>)
    462c:	4904      	ldr	r1, [pc, #16]	; (4640 <_malloc_trim_r+0x94>)
    462e:	6824      	ldr	r4, [r4, #0]
    4630:	f043 0301 	orr.w	r3, r3, #1
    4634:	1b00      	subs	r0, r0, r4
    4636:	6053      	str	r3, [r2, #4]
    4638:	6008      	str	r0, [r1, #0]
    463a:	e7d5      	b.n	45e8 <_malloc_trim_r+0x3c>
    463c:	1fff8ddc 	.word	0x1fff8ddc
    4640:	1fff9670 	.word	0x1fff9670
    4644:	1fff91e8 	.word	0x1fff91e8

00004648 <_free_r>:
    4648:	2900      	cmp	r1, #0
    464a:	d045      	beq.n	46d8 <_free_r+0x90>
    464c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4650:	460d      	mov	r5, r1
    4652:	4680      	mov	r8, r0
    4654:	f7ff ff1e 	bl	4494 <__malloc_lock>
    4658:	f855 7c04 	ldr.w	r7, [r5, #-4]
    465c:	496a      	ldr	r1, [pc, #424]	; (4808 <_free_r+0x1c0>)
    465e:	f027 0301 	bic.w	r3, r7, #1
    4662:	f1a5 0408 	sub.w	r4, r5, #8
    4666:	18e2      	adds	r2, r4, r3
    4668:	688e      	ldr	r6, [r1, #8]
    466a:	6850      	ldr	r0, [r2, #4]
    466c:	42b2      	cmp	r2, r6
    466e:	f020 0003 	bic.w	r0, r0, #3
    4672:	d062      	beq.n	473a <_free_r+0xf2>
    4674:	07fe      	lsls	r6, r7, #31
    4676:	6050      	str	r0, [r2, #4]
    4678:	d40b      	bmi.n	4692 <_free_r+0x4a>
    467a:	f855 7c08 	ldr.w	r7, [r5, #-8]
    467e:	1be4      	subs	r4, r4, r7
    4680:	f101 0e08 	add.w	lr, r1, #8
    4684:	68a5      	ldr	r5, [r4, #8]
    4686:	4575      	cmp	r5, lr
    4688:	443b      	add	r3, r7
    468a:	d06f      	beq.n	476c <_free_r+0x124>
    468c:	68e7      	ldr	r7, [r4, #12]
    468e:	60ef      	str	r7, [r5, #12]
    4690:	60bd      	str	r5, [r7, #8]
    4692:	1815      	adds	r5, r2, r0
    4694:	686d      	ldr	r5, [r5, #4]
    4696:	07ed      	lsls	r5, r5, #31
    4698:	d542      	bpl.n	4720 <_free_r+0xd8>
    469a:	f043 0201 	orr.w	r2, r3, #1
    469e:	6062      	str	r2, [r4, #4]
    46a0:	50e3      	str	r3, [r4, r3]
    46a2:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    46a6:	d218      	bcs.n	46da <_free_r+0x92>
    46a8:	08db      	lsrs	r3, r3, #3
    46aa:	1c5a      	adds	r2, r3, #1
    46ac:	684d      	ldr	r5, [r1, #4]
    46ae:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    46b2:	60a7      	str	r7, [r4, #8]
    46b4:	2001      	movs	r0, #1
    46b6:	109b      	asrs	r3, r3, #2
    46b8:	fa00 f303 	lsl.w	r3, r0, r3
    46bc:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    46c0:	431d      	orrs	r5, r3
    46c2:	3808      	subs	r0, #8
    46c4:	60e0      	str	r0, [r4, #12]
    46c6:	604d      	str	r5, [r1, #4]
    46c8:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    46cc:	60fc      	str	r4, [r7, #12]
    46ce:	4640      	mov	r0, r8
    46d0:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    46d4:	f7ff bee0 	b.w	4498 <__malloc_unlock>
    46d8:	4770      	bx	lr
    46da:	0a5a      	lsrs	r2, r3, #9
    46dc:	2a04      	cmp	r2, #4
    46de:	d853      	bhi.n	4788 <_free_r+0x140>
    46e0:	099a      	lsrs	r2, r3, #6
    46e2:	f102 0739 	add.w	r7, r2, #57	; 0x39
    46e6:	007f      	lsls	r7, r7, #1
    46e8:	f102 0538 	add.w	r5, r2, #56	; 0x38
    46ec:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    46f0:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    46f4:	4944      	ldr	r1, [pc, #272]	; (4808 <_free_r+0x1c0>)
    46f6:	3808      	subs	r0, #8
    46f8:	4290      	cmp	r0, r2
    46fa:	d04d      	beq.n	4798 <_free_r+0x150>
    46fc:	6851      	ldr	r1, [r2, #4]
    46fe:	f021 0103 	bic.w	r1, r1, #3
    4702:	428b      	cmp	r3, r1
    4704:	d202      	bcs.n	470c <_free_r+0xc4>
    4706:	6892      	ldr	r2, [r2, #8]
    4708:	4290      	cmp	r0, r2
    470a:	d1f7      	bne.n	46fc <_free_r+0xb4>
    470c:	68d0      	ldr	r0, [r2, #12]
    470e:	60e0      	str	r0, [r4, #12]
    4710:	60a2      	str	r2, [r4, #8]
    4712:	6084      	str	r4, [r0, #8]
    4714:	60d4      	str	r4, [r2, #12]
    4716:	4640      	mov	r0, r8
    4718:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    471c:	f7ff bebc 	b.w	4498 <__malloc_unlock>
    4720:	6895      	ldr	r5, [r2, #8]
    4722:	4f3a      	ldr	r7, [pc, #232]	; (480c <_free_r+0x1c4>)
    4724:	42bd      	cmp	r5, r7
    4726:	4403      	add	r3, r0
    4728:	d03f      	beq.n	47aa <_free_r+0x162>
    472a:	68d0      	ldr	r0, [r2, #12]
    472c:	60e8      	str	r0, [r5, #12]
    472e:	f043 0201 	orr.w	r2, r3, #1
    4732:	6085      	str	r5, [r0, #8]
    4734:	6062      	str	r2, [r4, #4]
    4736:	50e3      	str	r3, [r4, r3]
    4738:	e7b3      	b.n	46a2 <_free_r+0x5a>
    473a:	07ff      	lsls	r7, r7, #31
    473c:	4403      	add	r3, r0
    473e:	d407      	bmi.n	4750 <_free_r+0x108>
    4740:	f855 2c08 	ldr.w	r2, [r5, #-8]
    4744:	1aa4      	subs	r4, r4, r2
    4746:	4413      	add	r3, r2
    4748:	68a0      	ldr	r0, [r4, #8]
    474a:	68e2      	ldr	r2, [r4, #12]
    474c:	60c2      	str	r2, [r0, #12]
    474e:	6090      	str	r0, [r2, #8]
    4750:	4a2f      	ldr	r2, [pc, #188]	; (4810 <_free_r+0x1c8>)
    4752:	6812      	ldr	r2, [r2, #0]
    4754:	f043 0001 	orr.w	r0, r3, #1
    4758:	4293      	cmp	r3, r2
    475a:	6060      	str	r0, [r4, #4]
    475c:	608c      	str	r4, [r1, #8]
    475e:	d3b6      	bcc.n	46ce <_free_r+0x86>
    4760:	4b2c      	ldr	r3, [pc, #176]	; (4814 <_free_r+0x1cc>)
    4762:	4640      	mov	r0, r8
    4764:	6819      	ldr	r1, [r3, #0]
    4766:	f7ff ff21 	bl	45ac <_malloc_trim_r>
    476a:	e7b0      	b.n	46ce <_free_r+0x86>
    476c:	1811      	adds	r1, r2, r0
    476e:	6849      	ldr	r1, [r1, #4]
    4770:	07c9      	lsls	r1, r1, #31
    4772:	d444      	bmi.n	47fe <_free_r+0x1b6>
    4774:	6891      	ldr	r1, [r2, #8]
    4776:	68d2      	ldr	r2, [r2, #12]
    4778:	60ca      	str	r2, [r1, #12]
    477a:	4403      	add	r3, r0
    477c:	f043 0001 	orr.w	r0, r3, #1
    4780:	6091      	str	r1, [r2, #8]
    4782:	6060      	str	r0, [r4, #4]
    4784:	50e3      	str	r3, [r4, r3]
    4786:	e7a2      	b.n	46ce <_free_r+0x86>
    4788:	2a14      	cmp	r2, #20
    478a:	d817      	bhi.n	47bc <_free_r+0x174>
    478c:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    4790:	007f      	lsls	r7, r7, #1
    4792:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    4796:	e7a9      	b.n	46ec <_free_r+0xa4>
    4798:	10aa      	asrs	r2, r5, #2
    479a:	684b      	ldr	r3, [r1, #4]
    479c:	2501      	movs	r5, #1
    479e:	fa05 f202 	lsl.w	r2, r5, r2
    47a2:	4313      	orrs	r3, r2
    47a4:	604b      	str	r3, [r1, #4]
    47a6:	4602      	mov	r2, r0
    47a8:	e7b1      	b.n	470e <_free_r+0xc6>
    47aa:	f043 0201 	orr.w	r2, r3, #1
    47ae:	614c      	str	r4, [r1, #20]
    47b0:	610c      	str	r4, [r1, #16]
    47b2:	60e5      	str	r5, [r4, #12]
    47b4:	60a5      	str	r5, [r4, #8]
    47b6:	6062      	str	r2, [r4, #4]
    47b8:	50e3      	str	r3, [r4, r3]
    47ba:	e788      	b.n	46ce <_free_r+0x86>
    47bc:	2a54      	cmp	r2, #84	; 0x54
    47be:	d806      	bhi.n	47ce <_free_r+0x186>
    47c0:	0b1a      	lsrs	r2, r3, #12
    47c2:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    47c6:	007f      	lsls	r7, r7, #1
    47c8:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    47cc:	e78e      	b.n	46ec <_free_r+0xa4>
    47ce:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    47d2:	d806      	bhi.n	47e2 <_free_r+0x19a>
    47d4:	0bda      	lsrs	r2, r3, #15
    47d6:	f102 0778 	add.w	r7, r2, #120	; 0x78
    47da:	007f      	lsls	r7, r7, #1
    47dc:	f102 0577 	add.w	r5, r2, #119	; 0x77
    47e0:	e784      	b.n	46ec <_free_r+0xa4>
    47e2:	f240 5054 	movw	r0, #1364	; 0x554
    47e6:	4282      	cmp	r2, r0
    47e8:	d806      	bhi.n	47f8 <_free_r+0x1b0>
    47ea:	0c9a      	lsrs	r2, r3, #18
    47ec:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    47f0:	007f      	lsls	r7, r7, #1
    47f2:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    47f6:	e779      	b.n	46ec <_free_r+0xa4>
    47f8:	27fe      	movs	r7, #254	; 0xfe
    47fa:	257e      	movs	r5, #126	; 0x7e
    47fc:	e776      	b.n	46ec <_free_r+0xa4>
    47fe:	f043 0201 	orr.w	r2, r3, #1
    4802:	6062      	str	r2, [r4, #4]
    4804:	50e3      	str	r3, [r4, r3]
    4806:	e762      	b.n	46ce <_free_r+0x86>
    4808:	1fff8ddc 	.word	0x1fff8ddc
    480c:	1fff8de4 	.word	0x1fff8de4
    4810:	1fff91e4 	.word	0x1fff91e4
    4814:	1fff966c 	.word	0x1fff966c
    4818:	41455250 	.word	0x41455250
    481c:	454c424d 	.word	0x454c424d
    4820:	ffff0020 	.word	0xffff0020
    4824:	00746553 	.word	0x00746553
    4828:	736e6553 	.word	0x736e6553
    482c:	4f20726f 	.word	0x4f20726f
    4830:	6950206e 	.word	0x6950206e
    4834:	0000206e 	.word	0x0000206e
    4838:	6d6f4320 	.word	0x6d6f4320
    483c:	74656c70 	.word	0x74656c70
    4840:	ffff0065 	.word	0xffff0065
    4844:	74696e49 	.word	0x74696e49
    4848:	746e4920 	.word	0x746e4920
    484c:	75727265 	.word	0x75727265
    4850:	20737470 	.word	0x20737470
    4854:	0000202d 	.word	0x0000202d
    4858:	706d6f43 	.word	0x706d6f43
    485c:	6574656c 	.word	0x6574656c
    4860:	00000000 	.word	0x00000000
    4864:	3a412020 	.word	0x3a412020
    4868:	ffff0020 	.word	0xffff0020
    486c:	ffff0a0d 	.word	0xffff0a0d
    4870:	0066766f 	.word	0x0066766f

00004874 <digital_pin_to_info_PGM>:
    4874:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    4884:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    4894:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    48a4:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    48b4:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    48c4:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    48d4:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    48e4:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    48f4:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    4904:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    4914:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    4924:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    4934:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    4944:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    4954:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    4964:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    4974:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

00004984 <vtable for usb_serial_class>:
	...
    498c:	00002375 0000236d 00002369 00002365     u#..m#..i#..e#..
    499c:	00002361 0000235d 00002359 00002355     a#..]#..Y#..U#..

000049ac <usb_endpoint_config_table>:
    49ac:	15191500                                ....

000049b0 <usb_descriptor_list>:
    49b0:	00000100 1fff8908 00000012 00000200     ................
    49c0:	1fff8934 00000043 00000300 1fff8990     4...C...........
    49d0:	00000000 04090301 1fff891c 00000000     ................
    49e0:	04090302 1fff8978 00000000 04090303     ....x...........
    49f0:	1fff8994 00000000 00000000 00000000     ................
    4a00:	00000000                                ....

00004a04 <_global_impure_ptr>:
    4a04:	1fff89b0                                ....

00004a08 <_init>:
    4a08:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4a0a:	bf00      	nop
    4a0c:	bcf8      	pop	{r3, r4, r5, r6, r7}
    4a0e:	bc08      	pop	{r3}
    4a10:	469e      	mov	lr, r3
    4a12:	4770      	bx	lr

00004a14 <__init_array_start>:
    4a14:	00004565 	.word	0x00004565

00004a18 <__frame_dummy_init_array_entry>:
    4a18:	00000435 00000c01                       5.......

Disassembly of section .fini:

00004a20 <_fini>:
    4a20:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4a22:	bf00      	nop

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
1fff8748:	1fff88e8 	.word	0x1fff88e8

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
1fff8774:	1fff88c8 	.word	0x1fff88c8

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
1fff87a0:	1fff8898 	.word	0x1fff8898

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
1fff87cc:	1fff8848 	.word	0x1fff8848

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
1fff87f8:	1fff8810 	.word	0x1fff8810

1fff87fc <__dso_handle>:
1fff87fc:	00000000                                ....

1fff8800 <SENSOR_1_PINS>:
1fff8800:	00000015 00000016 00000017              ............

1fff880c <__brkval>:
1fff880c:	1fff96b0                                ....

1fff8810 <isr_table_portA>:
1fff8810:	000011f1 000011f1 000011f1 000011f1     ................
1fff8820:	000011f1 000011f1 000011f1 000011f1     ................
1fff8830:	000011f1 000011f1 000011f1 000011f1     ................
1fff8840:	000011f1 000011f1                       ........

1fff8848 <isr_table_portB>:
1fff8848:	000011f1 000011f1 000011f1 000011f1     ................
1fff8858:	000011f1 000011f1 000011f1 000011f1     ................
1fff8868:	000011f1 000011f1 000011f1 000011f1     ................
1fff8878:	000011f1 000011f1 000011f1 000011f1     ................
1fff8888:	000011f1 000011f1 000011f1 000011f1     ................

1fff8898 <isr_table_portC>:
1fff8898:	000011f1 000011f1 000011f1 000011f1     ................
1fff88a8:	000011f1 000011f1 000011f1 000011f1     ................
1fff88b8:	000011f1 000011f1 000011f1 000011f1     ................

1fff88c8 <isr_table_portD>:
1fff88c8:	000011f1 000011f1 000011f1 000011f1     ................
1fff88d8:	000011f1 000011f1 000011f1 000011f1     ................

1fff88e8 <isr_table_portE>:
1fff88e8:	000011f1 000011f1                       ........

1fff88f0 <Serial>:
1fff88f0:	0000498c 00000000 000003e8 00000000     .I..............

1fff8900 <usb_buffer_available>:
1fff8900:	ffffffff                                ....

1fff8904 <analog_config_bits>:
1fff8904:	                                         .

1fff8905 <analog_num_average>:
1fff8905:	                                         ...

1fff8908 <device_descriptor>:
1fff8908:	01010112 40000002 048316c0 02010200     .......@........
1fff8918:	00000103                                ....

1fff891c <usb_string_manufacturer_name_default>:
1fff891c:	00540318 00650065 0073006e 00640079     ..T.e.e.n.s.y.d.
1fff892c:	00690075 006f006e                       u.i.n.o.

1fff8934 <config_descriptor>:
1fff8934:	00430209 c0000102 00040932 02020100     ..C.....2.......
1fff8944:	24050001 05011000 01010124 06022404     ...$....$....$..
1fff8954:	00062405 82050701 40001003 00010409     .$.........@....
1fff8964:	00000a02 03050700 00004002 02840507     .........@......
1fff8974:	00000040                                @...

1fff8978 <usb_string_product_name_default>:
1fff8978:	00550316 00420053 00530020 00720065     ..U.S.B. .S.e.r.
1fff8988:	00610069 0000006c                       i.a.l...

1fff8990 <string0>:
1fff8990:	04090304                                ....

1fff8994 <usb_string_serial_number_default>:
1fff8994:	0000030c 00000000 00000000 00000000     ................
	...

1fff89b0 <impure_data>:
1fff89b0:	00000000 1fff8c9c 1fff8d04 1fff8d6c     ............l...
	...
1fff8a58:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
1fff8a68:	0005deec 0000000b 00000000 00000000     ................
	...

1fff8dd8 <_impure_ptr>:
1fff8dd8:	1fff89b0                                ....

1fff8ddc <__malloc_av_>:
	...
1fff8de4:	1fff8ddc 1fff8ddc 1fff8de4 1fff8de4     ................
1fff8df4:	1fff8dec 1fff8dec 1fff8df4 1fff8df4     ................
1fff8e04:	1fff8dfc 1fff8dfc 1fff8e04 1fff8e04     ................
1fff8e14:	1fff8e0c 1fff8e0c 1fff8e14 1fff8e14     ................
1fff8e24:	1fff8e1c 1fff8e1c 1fff8e24 1fff8e24     ........$...$...
1fff8e34:	1fff8e2c 1fff8e2c 1fff8e34 1fff8e34     ,...,...4...4...
1fff8e44:	1fff8e3c 1fff8e3c 1fff8e44 1fff8e44     <...<...D...D...
1fff8e54:	1fff8e4c 1fff8e4c 1fff8e54 1fff8e54     L...L...T...T...
1fff8e64:	1fff8e5c 1fff8e5c 1fff8e64 1fff8e64     \...\...d...d...
1fff8e74:	1fff8e6c 1fff8e6c 1fff8e74 1fff8e74     l...l...t...t...
1fff8e84:	1fff8e7c 1fff8e7c 1fff8e84 1fff8e84     |...|...........
1fff8e94:	1fff8e8c 1fff8e8c 1fff8e94 1fff8e94     ................
1fff8ea4:	1fff8e9c 1fff8e9c 1fff8ea4 1fff8ea4     ................
1fff8eb4:	1fff8eac 1fff8eac 1fff8eb4 1fff8eb4     ................
1fff8ec4:	1fff8ebc 1fff8ebc 1fff8ec4 1fff8ec4     ................
1fff8ed4:	1fff8ecc 1fff8ecc 1fff8ed4 1fff8ed4     ................
1fff8ee4:	1fff8edc 1fff8edc 1fff8ee4 1fff8ee4     ................
1fff8ef4:	1fff8eec 1fff8eec 1fff8ef4 1fff8ef4     ................
1fff8f04:	1fff8efc 1fff8efc 1fff8f04 1fff8f04     ................
1fff8f14:	1fff8f0c 1fff8f0c 1fff8f14 1fff8f14     ................
1fff8f24:	1fff8f1c 1fff8f1c 1fff8f24 1fff8f24     ........$...$...
1fff8f34:	1fff8f2c 1fff8f2c 1fff8f34 1fff8f34     ,...,...4...4...
1fff8f44:	1fff8f3c 1fff8f3c 1fff8f44 1fff8f44     <...<...D...D...
1fff8f54:	1fff8f4c 1fff8f4c 1fff8f54 1fff8f54     L...L...T...T...
1fff8f64:	1fff8f5c 1fff8f5c 1fff8f64 1fff8f64     \...\...d...d...
1fff8f74:	1fff8f6c 1fff8f6c 1fff8f74 1fff8f74     l...l...t...t...
1fff8f84:	1fff8f7c 1fff8f7c 1fff8f84 1fff8f84     |...|...........
1fff8f94:	1fff8f8c 1fff8f8c 1fff8f94 1fff8f94     ................
1fff8fa4:	1fff8f9c 1fff8f9c 1fff8fa4 1fff8fa4     ................
1fff8fb4:	1fff8fac 1fff8fac 1fff8fb4 1fff8fb4     ................
1fff8fc4:	1fff8fbc 1fff8fbc 1fff8fc4 1fff8fc4     ................
1fff8fd4:	1fff8fcc 1fff8fcc 1fff8fd4 1fff8fd4     ................
1fff8fe4:	1fff8fdc 1fff8fdc 1fff8fe4 1fff8fe4     ................
1fff8ff4:	1fff8fec 1fff8fec 1fff8ff4 1fff8ff4     ................
1fff9004:	1fff8ffc 1fff8ffc 1fff9004 1fff9004     ................
1fff9014:	1fff900c 1fff900c 1fff9014 1fff9014     ................
1fff9024:	1fff901c 1fff901c 1fff9024 1fff9024     ........$...$...
1fff9034:	1fff902c 1fff902c 1fff9034 1fff9034     ,...,...4...4...
1fff9044:	1fff903c 1fff903c 1fff9044 1fff9044     <...<...D...D...
1fff9054:	1fff904c 1fff904c 1fff9054 1fff9054     L...L...T...T...
1fff9064:	1fff905c 1fff905c 1fff9064 1fff9064     \...\...d...d...
1fff9074:	1fff906c 1fff906c 1fff9074 1fff9074     l...l...t...t...
1fff9084:	1fff907c 1fff907c 1fff9084 1fff9084     |...|...........
1fff9094:	1fff908c 1fff908c 1fff9094 1fff9094     ................
1fff90a4:	1fff909c 1fff909c 1fff90a4 1fff90a4     ................
1fff90b4:	1fff90ac 1fff90ac 1fff90b4 1fff90b4     ................
1fff90c4:	1fff90bc 1fff90bc 1fff90c4 1fff90c4     ................
1fff90d4:	1fff90cc 1fff90cc 1fff90d4 1fff90d4     ................
1fff90e4:	1fff90dc 1fff90dc 1fff90e4 1fff90e4     ................
1fff90f4:	1fff90ec 1fff90ec 1fff90f4 1fff90f4     ................
1fff9104:	1fff90fc 1fff90fc 1fff9104 1fff9104     ................
1fff9114:	1fff910c 1fff910c 1fff9114 1fff9114     ................
1fff9124:	1fff911c 1fff911c 1fff9124 1fff9124     ........$...$...
1fff9134:	1fff912c 1fff912c 1fff9134 1fff9134     ,...,...4...4...
1fff9144:	1fff913c 1fff913c 1fff9144 1fff9144     <...<...D...D...
1fff9154:	1fff914c 1fff914c 1fff9154 1fff9154     L...L...T...T...
1fff9164:	1fff915c 1fff915c 1fff9164 1fff9164     \...\...d...d...
1fff9174:	1fff916c 1fff916c 1fff9174 1fff9174     l...l...t...t...
1fff9184:	1fff917c 1fff917c 1fff9184 1fff9184     |...|...........
1fff9194:	1fff918c 1fff918c 1fff9194 1fff9194     ................
1fff91a4:	1fff919c 1fff919c 1fff91a4 1fff91a4     ................
1fff91b4:	1fff91ac 1fff91ac 1fff91b4 1fff91b4     ................
1fff91c4:	1fff91bc 1fff91bc 1fff91c4 1fff91c4     ................
1fff91d4:	1fff91cc 1fff91cc 1fff91d4 1fff91d4     ................

1fff91e4 <__malloc_trim_threshold>:
1fff91e4:	00020000                                ....

1fff91e8 <__malloc_sbrk_base>:
1fff91e8:	ffffffff                                ....
