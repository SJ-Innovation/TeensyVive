
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 31 0e 00 00 e9 0d 00 00     ... ....1.......
      10:	e9 0d 00 00 e9 0d 00 00 e9 0d 00 00 e9 0d 00 00     ................
      20:	e9 0d 00 00 e9 0d 00 00 e9 0d 00 00 31 0e 00 00     ............1...
      30:	31 0e 00 00 e9 0d 00 00 7d 25 00 00 b9 27 00 00     1.......}%...'..
      40:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      50:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      60:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      70:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      80:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      90:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      a0:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      b0:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      c0:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      d0:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      e0:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
      f0:	31 0e 00 00 d5 28 00 00 31 0e 00 00 01 2a 00 00     1....(..1....*..
     100:	31 0e 00 00 2d 2b 00 00 31 0e 00 00 31 0e 00 00     1...-+..1...1...
     110:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     120:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     130:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     140:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     150:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     160:	31 0e 00 00 99 14 00 00 31 0e 00 00 31 0e 00 00     1.......1...1...
     170:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     180:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     190:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     1a0:	31 0e 00 00 31 0e 00 00 31 0e 00 00 31 0e 00 00     1...1...1...1...
     1b0:	31 0e 00 00 31 0e 00 00 31 0e 00 00                 1...1...1...

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
     1d0:	f000 fe32 	bl	e38 <startup_early_hook>
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
     2d6:	f000 fe87 	bl	fe8 <_init_Teensyduino_internal_>

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
     2e4:	f000 fe6e 	bl	fc4 <rtc_set>
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
     302:	f000 fe5f 	bl	fc4 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f002 ffd1 	bl	32b0 <__libc_init_array>

	startup_late_hook();
     30e:	f000 fd99 	bl	e44 <startup_late_hook>
	main();
     312:	f000 fc63 	bl	bdc <main>
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
     33c:	00003dfc 	.word	0x00003dfc
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91ec 	.word	0x1fff91ec
     348:	1fff9688 	.word	0x1fff9688
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
     380:	5ab03b28 	.word	0x5ab03b28
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
     430:	00003df8 	.word	0x00003df8

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
     460:	00003df8 	.word	0x00003df8
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
     47c:	f000 fc92 	bl	da4 <memset>

}
     480:	4620      	mov	r0, r4
     482:	bd10      	pop	{r4, pc}

00000484 <BaseOOTX::~BaseOOTX()>:

BaseOOTX::~BaseOOTX() {
}
     484:	4770      	bx	lr
     486:	bf00      	nop

00000488 <BaseOOTX::NewOOTXBit(bool)>:
        Serial.println(" ");
    }

}

bool BaseOOTX::NewOOTXBit(bool NewInBit) {
     488:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
     48c:	4607      	mov	r7, r0
    static u_int8_t ConsecZeros = 0;
    if (NewInBit) { //1
     48e:	b1f1      	cbz	r1, 4ce <BaseOOTX::NewOOTXBit(bool)+0x46>
        if (ConsecZeros == OOTX_PREAMBLE_LENGTH) { //Have we got the preamble?
     490:	f8df 8114 	ldr.w	r8, [pc, #276]	; 5a8 <BaseOOTX::NewOOTXBit(bool)+0x120>
     494:	f898 3000 	ldrb.w	r3, [r8]
     498:	2b11      	cmp	r3, #17
     49a:	d037      	beq.n	50c <BaseOOTX::NewOOTXBit(bool)+0x84>
     49c:	6802      	ldr	r2, [r0, #0]
     49e:	4b41      	ldr	r3, [pc, #260]	; (5a4 <BaseOOTX::NewOOTXBit(bool)+0x11c>)
     4a0:	1c54      	adds	r4, r2, #1
     4a2:	fba3 1304 	umull	r1, r3, r3, r4
     4a6:	43d1      	mvns	r1, r2
     4a8:	f001 0007 	and.w	r0, r1, #7
     4ac:	09db      	lsrs	r3, r3, #7
     4ae:	2101      	movs	r1, #1
     4b0:	eb03 1303 	add.w	r3, r3, r3, lsl #4
     4b4:	4081      	lsls	r1, r0
     4b6:	eba4 03c3 	sub.w	r3, r4, r3, lsl #3
     4ba:	08d2      	lsrs	r2, r2, #3
     4bc:	b2c9      	uxtb	r1, r1

    }
    else {
        ConsecZeros++;
    }
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4be:	443a      	add	r2, r7
     4c0:	7910      	ldrb	r0, [r2, #4]
     4c2:	4301      	orrs	r1, r0
     4c4:	7111      	strb	r1, [r2, #4]
    ++InputPointer %= (OOTX_PREAMBLE_LENGTH * 8);

    return false;
     4c6:	2000      	movs	r0, #0
    ++InputPointer %= (OOTX_PREAMBLE_LENGTH * 8);
     4c8:	603b      	str	r3, [r7, #0]
     4ca:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4ce:	6804      	ldr	r4, [r0, #0]
        ConsecZeros++;
     4d0:	4e35      	ldr	r6, [pc, #212]	; (5a8 <BaseOOTX::NewOOTXBit(bool)+0x120>)
     4d2:	4b34      	ldr	r3, [pc, #208]	; (5a4 <BaseOOTX::NewOOTXBit(bool)+0x11c>)
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4d4:	eb00 0ed4 	add.w	lr, r0, r4, lsr #3
     4d8:	43e0      	mvns	r0, r4
     4da:	3401      	adds	r4, #1
     4dc:	f89e 1004 	ldrb.w	r1, [lr, #4]
     4e0:	f000 0507 	and.w	r5, r0, #7
     4e4:	fba3 2304 	umull	r2, r3, r3, r4
     4e8:	2001      	movs	r0, #1
        ConsecZeros++;
     4ea:	7832      	ldrb	r2, [r6, #0]
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4ec:	40a8      	lsls	r0, r5
     4ee:	09db      	lsrs	r3, r3, #7
     4f0:	ea21 0100 	bic.w	r1, r1, r0
        ConsecZeros++;
     4f4:	3201      	adds	r2, #1
     4f6:	eb03 1303 	add.w	r3, r3, r3, lsl #4
    bitWrite(InputBuffer[InputPointer / 8], 7 - (InputPointer % 8), NewInBit);
     4fa:	f88e 1004 	strb.w	r1, [lr, #4]
     4fe:	eba4 03c3 	sub.w	r3, r4, r3, lsl #3
        ConsecZeros++;
     502:	7032      	strb	r2, [r6, #0]
    ++InputPointer %= (OOTX_PREAMBLE_LENGTH * 8);
     504:	603b      	str	r3, [r7, #0]
     506:	2000      	movs	r0, #0
     508:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    if (READ_BIT(0, InputBuffer)) { // Is the first bit 1, should be; end of preamble.
     50c:	7901      	ldrb	r1, [r0, #4]
     50e:	060a      	lsls	r2, r1, #24
     510:	d42c      	bmi.n	56c <BaseOOTX::NewOOTXBit(bool)+0xe4>
     512:	f107 0904 	add.w	r9, r7, #4
     516:	464d      	mov	r5, r9
     518:	f107 0645 	add.w	r6, r7, #69	; 0x45
     51c:	2407      	movs	r4, #7
     51e:	e000      	b.n	522 <BaseOOTX::NewOOTXBit(bool)+0x9a>
     520:	7829      	ldrb	r1, [r5, #0]
	size_t print(char c)				{ return write((uint8_t)c); }
	size_t print(const char s[])			{ return write(s); }
	size_t print(const __FlashStringHelper *f)	{ return write((const char *)f); }

	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
	size_t print(int n)				{ return print((long)n); }
     522:	4822      	ldr	r0, [pc, #136]	; (5ac <BaseOOTX::NewOOTXBit(bool)+0x124>)
     524:	4121      	asrs	r1, r4
     526:	f001 0101 	and.w	r1, r1, #1
     52a:	3c01      	subs	r4, #1
     52c:	f000 fb9e 	bl	c6c <Print::print(long)>
        for (int j = 0; j < 8; j++) {
     530:	1c63      	adds	r3, r4, #1
     532:	d1f5      	bne.n	520 <BaseOOTX::NewOOTXBit(bool)+0x98>
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     534:	2101      	movs	r1, #1
     536:	481e      	ldr	r0, [pc, #120]	; (5b0 <BaseOOTX::NewOOTXBit(bool)+0x128>)
     538:	f001 fe36 	bl	21a8 <usb_serial_write>
    for (int i = 0; i < OOTX_BUFFER_SIZE; i++) {
     53c:	42ae      	cmp	r6, r5
     53e:	d002      	beq.n	546 <BaseOOTX::NewOOTXBit(bool)+0xbe>
     540:	f815 1f01 	ldrb.w	r1, [r5, #1]!
     544:	e7ea      	b.n	51c <BaseOOTX::NewOOTXBit(bool)+0x94>
     546:	2101      	movs	r1, #1
     548:	4819      	ldr	r0, [pc, #100]	; (5b0 <BaseOOTX::NewOOTXBit(bool)+0x128>)
     54a:	f001 fe2d 	bl	21a8 <usb_serial_write>
            ConsecZeros = 0;
     54e:	2400      	movs	r4, #0
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
	size_t print(const Printable &obj)		{ return obj.printTo(*this); }
	size_t println(void);
	size_t println(const String &s)			{ return print(s) + println(); }
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
     550:	4816      	ldr	r0, [pc, #88]	; (5ac <BaseOOTX::NewOOTXBit(bool)+0x124>)
     552:	f000 fc05 	bl	d60 <Print::println()>
            memset(InputBuffer, 0, OOTX_BUFFER_SIZE);
     556:	4621      	mov	r1, r4
     558:	2242      	movs	r2, #66	; 0x42
     55a:	4648      	mov	r0, r9
            ConsecZeros = 0;
     55c:	f888 4000 	strb.w	r4, [r8]
            memset(InputBuffer, 0, OOTX_BUFFER_SIZE);
     560:	f000 fc20 	bl	da4 <memset>
     564:	4622      	mov	r2, r4
     566:	2301      	movs	r3, #1
     568:	2180      	movs	r1, #128	; 0x80
     56a:	e7a8      	b.n	4be <BaseOOTX::NewOOTXBit(bool)+0x36>
    if (READ_BIT(0, InputBuffer)) { // Is the first bit 1, should be; end of preamble.
     56c:	2400      	movs	r4, #0
     56e:	e000      	b.n	572 <BaseOOTX::NewOOTXBit(bool)+0xea>
     570:	7919      	ldrb	r1, [r3, #4]
	size_t print(int n)				{ return print((long)n); }
     572:	480e      	ldr	r0, [pc, #56]	; (5ac <BaseOOTX::NewOOTXBit(bool)+0x124>)
     574:	43e3      	mvns	r3, r4
     576:	f003 0307 	and.w	r3, r3, #7
     57a:	4119      	asrs	r1, r3
        for (u_int32_t i = 0; i < OOTX_BUFFER_SIZE_BITS; i += 17) { //Check each 16th bit, should be a 1. stuffed.
     57c:	3411      	adds	r4, #17
     57e:	f001 0101 	and.w	r1, r1, #1
     582:	f000 fb73 	bl	c6c <Print::print(long)>
     586:	f5b4 7f08 	cmp.w	r4, #544	; 0x220
     58a:	eb07 03d4 	add.w	r3, r7, r4, lsr #3
     58e:	d1ef      	bne.n	570 <BaseOOTX::NewOOTXBit(bool)+0xe8>
     590:	2101      	movs	r1, #1
     592:	4807      	ldr	r0, [pc, #28]	; (5b0 <BaseOOTX::NewOOTXBit(bool)+0x128>)
     594:	f001 fe08 	bl	21a8 <usb_serial_write>
	size_t println(const char s[])			{ return print(s) + println(); }
     598:	4804      	ldr	r0, [pc, #16]	; (5ac <BaseOOTX::NewOOTXBit(bool)+0x124>)
     59a:	f000 fbe1 	bl	d60 <Print::println()>
     59e:	7939      	ldrb	r1, [r7, #4]
     5a0:	e7b7      	b.n	512 <BaseOOTX::NewOOTXBit(bool)+0x8a>
     5a2:	bf00      	nop
     5a4:	f0f0f0f1 	.word	0xf0f0f0f1
     5a8:	1fff9208 	.word	0x1fff9208
     5ac:	1fff88f0 	.word	0x1fff88f0
     5b0:	00003c04 	.word	0x00003c04

000005b4 <SensorNode::SensorNode(SensorPinData_t)>:
        }
        CurrentLEDState = LEDState;
    }
}

SensorNode::SensorNode(SensorPinData_t PinData) {
     5b4:	b430      	push	{r4, r5}
     5b6:	b084      	sub	sp, #16
     5b8:	ac01      	add	r4, sp, #4
     5ba:	e884 000e 	stmia.w	r4, {r1, r2, r3}
     5be:	4605      	mov	r5, r0
    _PinData = PinData;
     5c0:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
     5c4:	f105 02c0 	add.w	r2, r5, #192	; 0xc0
     5c8:	e882 000b 	stmia.w	r2, {r0, r1, r3}
}
     5cc:	4628      	mov	r0, r5
     5ce:	b004      	add	sp, #16
     5d0:	bc30      	pop	{r4, r5}
     5d2:	4770      	bx	lr

000005d4 <SensorNode::NeedsPulseHandling()>:

bool SensorNode::NeedsPulseHandling() {
    return !(ProcessPointer == LastWaveformPointer());
     5d4:	f990 3000 	ldrsb.w	r3, [r0]
     5d8:	4a08      	ldr	r2, [pc, #32]	; (5fc <SensorNode::NeedsPulseHandling()+0x28>)
     5da:	f990 0001 	ldrsb.w	r0, [r0, #1]
     5de:	3b01      	subs	r3, #1
     5e0:	fb82 2103 	smull	r2, r1, r2, r3
     5e4:	17da      	asrs	r2, r3, #31
     5e6:	ebc2 02a1 	rsb	r2, r2, r1, asr #2
     5ea:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     5ee:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     5f2:	b25b      	sxtb	r3, r3
}
     5f4:	1ac0      	subs	r0, r0, r3
     5f6:	bf18      	it	ne
     5f8:	2001      	movne	r0, #1
     5fa:	4770      	bx	lr
     5fc:	66666667 	.word	0x66666667

00000600 <SensorNode::Init()>:

int8_t SensorNode::ProcessPointerOffset(int8_t Offset) {
    return (ProcessPointer + Offset) % WAVEFORM_SIZE;
}

void SensorNode::Init() {
     600:	b538      	push	{r3, r4, r5, lr}
     602:	4604      	mov	r4, r0
	size_t print(int n)				{ return print((long)n); }
     604:	4d29      	ldr	r5, [pc, #164]	; (6ac <SensorNode::Init()+0xac>)
     606:	482a      	ldr	r0, [pc, #168]	; (6b0 <SensorNode::Init()+0xb0>)
     608:	210e      	movs	r1, #14
     60a:	f001 fdcd 	bl	21a8 <usb_serial_write>
     60e:	f8d4 10c0 	ldr.w	r1, [r4, #192]	; 0xc0
     612:	4628      	mov	r0, r5
     614:	f000 fb2a 	bl	c6c <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
     618:	f894 00c0 	ldrb.w	r0, [r4, #192]	; 0xc0
     61c:	2100      	movs	r1, #0
     61e:	f000 fdd7 	bl	11d0 <pinMode>
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
     622:	f894 00c4 	ldrb.w	r0, [r4, #196]	; 0xc4
     626:	2100      	movs	r1, #0
     628:	f000 fdd2 	bl	11d0 <pinMode>
    pinMode(_PinData.LED2Pin, INPUT);
     62c:	f894 00c8 	ldrb.w	r0, [r4, #200]	; 0xc8
     630:	2100      	movs	r1, #0
     632:	f000 fdcd 	bl	11d0 <pinMode>
    WaveformPointer = 1;
    ProcessPointer = 0;
     636:	2300      	movs	r3, #0
    Angles[STATION_A][HORZ] = 0;
     638:	2200      	movs	r2, #0
    WaveformPointer = 1;
     63a:	2101      	movs	r1, #1
     63c:	7021      	strb	r1, [r4, #0]
    ProcessPointer = 0;
     63e:	7063      	strb	r3, [r4, #1]
    Angles[STATION_A][VERT] = 0;
    Angles[STATION_B][HORZ] = 0;
    Angles[STATION_B][VERT] = 0;
    for (int i = 0; i < WAVEFORM_SIZE; i++) {
        Waveform[i].PulseDurationTicks = 0;
     640:	60e3      	str	r3, [r4, #12]
        Waveform[i].RisingEdgeTicks = 0;
     642:	6063      	str	r3, [r4, #4]
        Waveform[i].FallingEdgeTicks = 0;
     644:	60a3      	str	r3, [r4, #8]
        Waveform[i].PulseDurationTicks = 0;
     646:	61e3      	str	r3, [r4, #28]
        Waveform[i].RisingEdgeTicks = 0;
     648:	6163      	str	r3, [r4, #20]
        Waveform[i].FallingEdgeTicks = 0;
     64a:	61a3      	str	r3, [r4, #24]
        Waveform[i].PulseDurationTicks = 0;
     64c:	62e3      	str	r3, [r4, #44]	; 0x2c
        Waveform[i].RisingEdgeTicks = 0;
     64e:	6263      	str	r3, [r4, #36]	; 0x24
        Waveform[i].FallingEdgeTicks = 0;
     650:	62a3      	str	r3, [r4, #40]	; 0x28
        Waveform[i].PulseDurationTicks = 0;
     652:	63e3      	str	r3, [r4, #60]	; 0x3c
        Waveform[i].RisingEdgeTicks = 0;
     654:	6363      	str	r3, [r4, #52]	; 0x34
        Waveform[i].FallingEdgeTicks = 0;
     656:	63a3      	str	r3, [r4, #56]	; 0x38
        Waveform[i].PulseDurationTicks = 0;
     658:	64e3      	str	r3, [r4, #76]	; 0x4c
        Waveform[i].RisingEdgeTicks = 0;
     65a:	6463      	str	r3, [r4, #68]	; 0x44
        Waveform[i].FallingEdgeTicks = 0;
     65c:	64a3      	str	r3, [r4, #72]	; 0x48
        Waveform[i].PulseDurationTicks = 0;
     65e:	65e3      	str	r3, [r4, #92]	; 0x5c
        Waveform[i].RisingEdgeTicks = 0;
     660:	6563      	str	r3, [r4, #84]	; 0x54
        Waveform[i].FallingEdgeTicks = 0;
     662:	65a3      	str	r3, [r4, #88]	; 0x58
        Waveform[i].PulseDurationTicks = 0;
     664:	66e3      	str	r3, [r4, #108]	; 0x6c
        Waveform[i].RisingEdgeTicks = 0;
     666:	6663      	str	r3, [r4, #100]	; 0x64
        Waveform[i].FallingEdgeTicks = 0;
     668:	66a3      	str	r3, [r4, #104]	; 0x68
        Waveform[i].PulseDurationTicks = 0;
     66a:	67e3      	str	r3, [r4, #124]	; 0x7c
        Waveform[i].RisingEdgeTicks = 0;
     66c:	6763      	str	r3, [r4, #116]	; 0x74
        Waveform[i].FallingEdgeTicks = 0;
     66e:	67a3      	str	r3, [r4, #120]	; 0x78
        Waveform[i].PulseDurationTicks = 0;
     670:	f8c4 308c 	str.w	r3, [r4, #140]	; 0x8c
        Waveform[i].RisingEdgeTicks = 0;
     674:	f8c4 3084 	str.w	r3, [r4, #132]	; 0x84
    Angles[STATION_A][HORZ] = 0;
     678:	f8c4 20a4 	str.w	r2, [r4, #164]	; 0xa4
    Angles[STATION_A][VERT] = 0;
     67c:	f8c4 20a8 	str.w	r2, [r4, #168]	; 0xa8
    Angles[STATION_B][HORZ] = 0;
     680:	f8c4 20ac 	str.w	r2, [r4, #172]	; 0xac
    Angles[STATION_B][VERT] = 0;
     684:	f8c4 20b0 	str.w	r2, [r4, #176]	; 0xb0
     688:	2109      	movs	r1, #9
        Waveform[i].FallingEdgeTicks = 0;
     68a:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
     68e:	4809      	ldr	r0, [pc, #36]	; (6b4 <SensorNode::Init()+0xb4>)
        Waveform[i].PulseDurationTicks = 0;
     690:	f8c4 309c 	str.w	r3, [r4, #156]	; 0x9c
        Waveform[i].RisingEdgeTicks = 0;
     694:	f8c4 3094 	str.w	r3, [r4, #148]	; 0x94
        Waveform[i].FallingEdgeTicks = 0;
     698:	f8c4 3098 	str.w	r3, [r4, #152]	; 0x98
     69c:	f001 fd84 	bl	21a8 <usb_serial_write>
	size_t println(const char s[])			{ return print(s) + println(); }
     6a0:	4628      	mov	r0, r5
    }
    Serial.println(" Complete");
}
     6a2:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     6a6:	f000 bb5b 	b.w	d60 <Print::println()>
     6aa:	bf00      	nop
     6ac:	1fff88f0 	.word	0x1fff88f0
     6b0:	00003c08 	.word	0x00003c08
     6b4:	00003c18 	.word	0x00003c18

000006b8 <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     6b8:	4770      	bx	lr
     6ba:	bf00      	nop

000006bc <SensorNode::GetPulsePin()>:

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}
     6bc:	f890 00c0 	ldrb.w	r0, [r0, #192]	; 0xc0
     6c0:	4770      	bx	lr
     6c2:	bf00      	nop

000006c4 <SensorNode::RisingEdge(unsigned long, unsigned int, unsigned int)>:
    (++WaveformPointer) %= WAVEFORM_SIZE;
     6c4:	7803      	ldrb	r3, [r0, #0]
     6c6:	4a0c      	ldr	r2, [pc, #48]	; (6f8 <SensorNode::RisingEdge(unsigned long, unsigned int, unsigned int)+0x34>)
     6c8:	3301      	adds	r3, #1
     6ca:	b25b      	sxtb	r3, r3

void SensorNode::RisingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall) {
     6cc:	b410      	push	{r4}
    (++WaveformPointer) %= WAVEFORM_SIZE;
     6ce:	fb82 2403 	smull	r2, r4, r2, r3
     6d2:	17da      	asrs	r2, r3, #31
     6d4:	ebc2 02a4 	rsb	r2, r2, r4, asr #2
     6d8:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     6dc:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     6e0:	b25b      	sxtb	r3, r3

    IncWaveformPointer();
    Waveform[WaveformPointer].Valid = false;
     6e2:	eb00 1203 	add.w	r2, r0, r3, lsl #4
    (++WaveformPointer) %= WAVEFORM_SIZE;
     6e6:	7003      	strb	r3, [r0, #0]
    Waveform[WaveformPointer].Valid = false;
     6e8:	7c13      	ldrb	r3, [r2, #16]
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
     6ea:	6051      	str	r1, [r2, #4]
    Waveform[WaveformPointer].Valid = false;
     6ec:	f36f 0300 	bfc	r3, #0, #1
     6f0:	7413      	strb	r3, [r2, #16]
}
     6f2:	bc10      	pop	{r4}
     6f4:	4770      	bx	lr
     6f6:	bf00      	nop
     6f8:	66666667 	.word	0x66666667

000006fc <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)>:

void SensorNode::FallingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall) {
    if (ConseqFall > 1) {
     6fc:	2b01      	cmp	r3, #1
void SensorNode::FallingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall) {
     6fe:	b430      	push	{r4, r5}
    if (ConseqFall > 1) {
     700:	d91f      	bls.n	742 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)+0x46>
    (++WaveformPointer) %= WAVEFORM_SIZE;
     702:	7803      	ldrb	r3, [r0, #0]
     704:	4a10      	ldr	r2, [pc, #64]	; (748 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)+0x4c>)
     706:	3301      	adds	r3, #1
     708:	b25b      	sxtb	r3, r3
     70a:	fb82 2403 	smull	r2, r4, r2, r3
     70e:	17da      	asrs	r2, r3, #31
     710:	ebc2 02a4 	rsb	r2, r2, r4, asr #2
     714:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     718:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     71c:	b25b      	sxtb	r3, r3
    Waveform[WaveformPointer].Valid = false;
     71e:	eb00 1403 	add.w	r4, r0, r3, lsl #4
    (++WaveformPointer) %= WAVEFORM_SIZE;
     722:	7003      	strb	r3, [r0, #0]
    Waveform[WaveformPointer].Valid = false;
     724:	461a      	mov	r2, r3
     726:	7c23      	ldrb	r3, [r4, #16]
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
     728:	6061      	str	r1, [r4, #4]
    Waveform[WaveformPointer].Valid = false;
     72a:	f36f 0300 	bfc	r3, #0, #1
     72e:	7423      	strb	r3, [r4, #16]
        RisingEdge(TimeTicks, ConseqRise, --ConseqFall);
    }
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     730:	eb00 1002 	add.w	r0, r0, r2, lsl #4
    Waveform[WaveformPointer].Valid = false;

}
     734:	bc30      	pop	{r4, r5}
    Waveform[WaveformPointer].Valid = false;
     736:	7c02      	ldrb	r2, [r0, #16]
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     738:	6081      	str	r1, [r0, #8]
    Waveform[WaveformPointer].Valid = false;
     73a:	f36f 0200 	bfc	r2, #0, #1
     73e:	7402      	strb	r2, [r0, #16]
}
     740:	4770      	bx	lr
     742:	f990 2000 	ldrsb.w	r2, [r0]
     746:	e7f3      	b.n	730 <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)+0x34>
     748:	66666667 	.word	0x66666667

0000074c <SensorNode::PulseHandler()>:

Pulse *SensorNode::PulseHandler() {
     74c:	b5f0      	push	{r4, r5, r6, r7, lr}
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     74e:	f990 3001 	ldrsb.w	r3, [r0, #1]
     752:	eb00 1503 	add.w	r5, r0, r3, lsl #4
     756:	011a      	lsls	r2, r3, #4
    if (LatestPulse->RisingEdgeTicks >=
     758:	686f      	ldr	r7, [r5, #4]
     75a:	68a9      	ldr	r1, [r5, #8]
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     75c:	1886      	adds	r6, r0, r2
    if (LatestPulse->RisingEdgeTicks >=
     75e:	428f      	cmp	r7, r1
Pulse *SensorNode::PulseHandler() {
     760:	4604      	mov	r4, r0
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     762:	f106 0004 	add.w	r0, r6, #4
    if (LatestPulse->RisingEdgeTicks >=
     766:	d233      	bcs.n	7d0 <SensorNode::PulseHandler()+0x84>
        LatestPulse->IsUncertainShortPulse = true;
        LatestPulse->IsCertainSweepPulse = false;
        LatestPulse->IsCertainSyncPulse = false;
    }
    else {
        LatestPulse->IsUncertainShortPulse = false;
     768:	7c31      	ldrb	r1, [r6, #16]
     76a:	f36f 01c3 	bfc	r1, #3, #1
     76e:	7431      	strb	r1, [r6, #16]
        LatestPulse->PulseDurationTicks =
                LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     770:	68a9      	ldr	r1, [r5, #8]
     772:	686d      	ldr	r5, [r5, #4]
     774:	1b49      	subs	r1, r1, r5
     776:	60f1      	str	r1, [r6, #12]
        LatestPulse->IsCertainSyncPulse = (bool) IN_RANGE(FLASH_PULSE_LENGTH_TICKS_MIN,
                                                          LatestPulse->PulseDurationTicks,
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     778:	7c35      	ldrb	r5, [r6, #16]
        LatestPulse->IsUncertainShortPulse = false;
     77a:	f106 0708 	add.w	r7, r6, #8
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     77e:	f241 7e70 	movw	lr, #6000	; 0x1770
     782:	f6a1 36b8 	subw	r6, r1, #3000	; 0xbb8
     786:	4576      	cmp	r6, lr
        LatestPulse->IsCertainSweepPulse = (bool) IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,
                                                           LatestPulse->PulseDurationTicks,
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
     788:	f1a1 013c 	sub.w	r1, r1, #60	; 0x3c
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     78c:	bf8c      	ite	hi
     78e:	2600      	movhi	r6, #0
     790:	2601      	movls	r6, #1
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
     792:	f5b1 7f52 	cmp.w	r1, #840	; 0x348
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
     796:	f366 0541 	bfi	r5, r6, #1, #1
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
     79a:	bf8c      	ite	hi
     79c:	2100      	movhi	r1, #0
     79e:	2101      	movls	r1, #1
     7a0:	f361 0582 	bfi	r5, r1, #2, #1
     7a4:	723d      	strb	r5, [r7, #8]
    }
    LatestPulse->Valid = true;
     7a6:	4422      	add	r2, r4
    (++ProcessPointer) %= WAVEFORM_SIZE;
     7a8:	490f      	ldr	r1, [pc, #60]	; (7e8 <SensorNode::PulseHandler()+0x9c>)
    LatestPulse->Valid = true;
     7aa:	7c15      	ldrb	r5, [r2, #16]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     7ac:	3301      	adds	r3, #1
     7ae:	b25b      	sxtb	r3, r3
     7b0:	fb81 1603 	smull	r1, r6, r1, r3
     7b4:	17d9      	asrs	r1, r3, #31
     7b6:	ebc1 01a6 	rsb	r1, r1, r6, asr #2
     7ba:	eb01 0181 	add.w	r1, r1, r1, lsl #2
    LatestPulse->ReadOut = false;
     7be:	f045 0501 	orr.w	r5, r5, #1
     7c2:	f36f 1504 	bfc	r5, #4, #1
    (++ProcessPointer) %= WAVEFORM_SIZE;
     7c6:	eba3 0341 	sub.w	r3, r3, r1, lsl #1
    LatestPulse->ReadOut = false;
     7ca:	7415      	strb	r5, [r2, #16]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     7cc:	7063      	strb	r3, [r4, #1]
    IncProcessPointer();
    return LatestPulse;
}
     7ce:	bdf0      	pop	{r4, r5, r6, r7, pc}
        LatestPulse->IsUncertainShortPulse = true;
     7d0:	7c31      	ldrb	r1, [r6, #16]
        LatestPulse->IsCertainSweepPulse = false;
     7d2:	f041 0108 	orr.w	r1, r1, #8
        LatestPulse->PulseDurationTicks = 0;
     7d6:	2700      	movs	r7, #0
        LatestPulse->IsCertainSyncPulse = false;
     7d8:	f001 01fb 	and.w	r1, r1, #251	; 0xfb
     7dc:	f367 0141 	bfi	r1, r7, #1, #1
        LatestPulse->PulseDurationTicks = 0;
     7e0:	60f7      	str	r7, [r6, #12]
        LatestPulse->IsCertainSyncPulse = false;
     7e2:	7431      	strb	r1, [r6, #16]
     7e4:	e7df      	b.n	7a6 <SensorNode::PulseHandler()+0x5a>
     7e6:	bf00      	nop
     7e8:	66666667 	.word	0x66666667

000007ec <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)>:
u_int32_t PulseAge(Pulse &TestPulse) {
    return CURRENT_TIME - TestPulse.RisingEdgeTicks;
}

bool SensorNode::CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                                     u_int8_t CurrentStationLock) {
     7ec:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     7f0:	f990 5001 	ldrsb.w	r5, [r0, #1]
                                     u_int8_t CurrentStationLock) {
     7f4:	f89d e020 	ldrb.w	lr, [sp, #32]
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     7f8:	2d00      	cmp	r5, #0
     7fa:	d046      	beq.n	88a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x9e>
     7fc:	4c3b      	ldr	r4, [pc, #236]	; (8ec <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x100>)
     7fe:	3d01      	subs	r5, #1
     800:	fb84 4605 	smull	r4, r6, r4, r5
     804:	17ec      	asrs	r4, r5, #31
     806:	ebc4 04a6 	rsb	r4, r4, r6, asr #2
     80a:	eb04 0484 	add.w	r4, r4, r4, lsl #2
     80e:	eba5 0444 	sub.w	r4, r5, r4, lsl #1
    Pulse *LastPulse = &Waveform[LastProcessPointer()];
    if (LastPulse->Valid and not LastPulse->ReadOut) { //Is this pulse new, and valid?
     812:	0124      	lsls	r4, r4, #4
     814:	eb00 0904 	add.w	r9, r0, r4
     818:	f109 0a08 	add.w	sl, r9, #8
     81c:	f89a c008 	ldrb.w	ip, [sl, #8]
     820:	f01c 0f01 	tst.w	ip, #1
     824:	d02d      	beq.n	882 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x96>
     826:	f01c 0f10 	tst.w	ip, #16
     82a:	d12a      	bne.n	882 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x96>
        if (LastPulse->IsCertainSweepPulse and CurrentStationLock ==
     82c:	f3cc 0680 	ubfx	r6, ip, #2, #1
     830:	4617      	mov	r7, r2
     832:	4688      	mov	r8, r1
     834:	4605      	mov	r5, r0
     836:	b1fe      	cbz	r6, 878 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x8c>
     838:	f1be 0f02 	cmp.w	lr, #2
     83c:	d11c      	bne.n	878 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x8c>
                                               DUAL_STATION_LOCK) { // Are we certain its a sweep pulse? And do we have a certain dual lock.
            LastPulse->ReadOut = true;
     83e:	f04c 0c10 	orr.w	ip, ip, #16
     842:	f88a c008 	strb.w	ip, [sl, #8]
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     846:	f8d9 0004 	ldr.w	r0, [r9, #4]
     84a:	1ac0      	subs	r0, r0, r3
     84c:	f002 fb06 	bl	2e5c <__aeabi_ui2f>
     850:	4927      	ldr	r1, [pc, #156]	; (8f0 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x104>)
     852:	f002 fb5b 	bl	2f0c <__aeabi_fmul>
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     856:	2100      	movs	r1, #0
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     858:	4604      	mov	r4, r0
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     85a:	f002 fd09 	bl	3270 <__aeabi_fcmpge>
     85e:	b180      	cbz	r0, 882 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x96>
     860:	4924      	ldr	r1, [pc, #144]	; (8f4 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x108>)
     862:	4620      	mov	r0, r4
     864:	f002 fcfa 	bl	325c <__aeabi_fcmple>
     868:	b158      	cbz	r0, 882 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x96>
                Angles[SweepSource][SweepAxis] = NewAngle;
     86a:	eb07 0748 	add.w	r7, r7, r8, lsl #1
     86e:	eb05 0087 	add.w	r0, r5, r7, lsl #2
     872:	f8c0 40a4 	str.w	r4, [r0, #164]	; 0xa4
     876:	e005      	b.n	884 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x98>
//            Serial.print("Certain Sweep-");
//            Serial.print(SweepSource);
//            Serial.print(" - ");
//            Serial.println(SweepAxis);
        }
        else if (LastPulse->IsUncertainShortPulse) { //We are not certain its a sweep, but its too short to accurately measure its width... Might be noise, might be a sweep. Might also be from another base.
     878:	442c      	add	r4, r5
     87a:	7c22      	ldrb	r2, [r4, #16]
     87c:	f3c2 06c0 	ubfx	r6, r2, #3, #1
     880:	b92e      	cbnz	r6, 88e <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0xa2>
                }
                return true;
            }
        }
    }
    return false;
     882:	2600      	movs	r6, #0
     884:	4630      	mov	r0, r6
     886:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     88a:	2409      	movs	r4, #9
     88c:	e7c1      	b.n	812 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x26>
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     88e:	6860      	ldr	r0, [r4, #4]
            LastPulse->ReadOut = true;
     890:	f042 0210 	orr.w	r2, r2, #16
     894:	7422      	strb	r2, [r4, #16]
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     896:	1ac0      	subs	r0, r0, r3
     898:	f002 fae0 	bl	2e5c <__aeabi_ui2f>
     89c:	4914      	ldr	r1, [pc, #80]	; (8f0 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x104>)
     89e:	f002 fb35 	bl	2f0c <__aeabi_fmul>
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     8a2:	2100      	movs	r1, #0
            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
     8a4:	4604      	mov	r4, r0
            if (IN_RANGE(0, NewAngle, TWO_PI)) {
     8a6:	f002 fce3 	bl	3270 <__aeabi_fcmpge>
     8aa:	2800      	cmp	r0, #0
     8ac:	d0e9      	beq.n	882 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x96>
     8ae:	4911      	ldr	r1, [pc, #68]	; (8f4 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x108>)
     8b0:	4620      	mov	r0, r4
     8b2:	f002 fcd3 	bl	325c <__aeabi_fcmple>
     8b6:	2800      	cmp	r0, #0
     8b8:	d0e3      	beq.n	882 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x96>
     8ba:	eb07 0748 	add.w	r7, r7, r8, lsl #1
     8be:	eb05 0587 	add.w	r5, r5, r7, lsl #2
                if (IN_RANGE(DEGREES_TO_RADIANS(-UNCERTAIN_ANGLE_THRESHOLD), NewAngle - Angles[SweepSource][SweepAxis],
     8c2:	4620      	mov	r0, r4
     8c4:	f8d5 10a4 	ldr.w	r1, [r5, #164]	; 0xa4
     8c8:	f002 fa16 	bl	2cf8 <__aeabi_fsub>
     8cc:	490a      	ldr	r1, [pc, #40]	; (8f8 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x10c>)
     8ce:	4607      	mov	r7, r0
     8d0:	f002 fcce 	bl	3270 <__aeabi_fcmpge>
     8d4:	2800      	cmp	r0, #0
     8d6:	d0d5      	beq.n	884 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x98>
                             DEGREES_TO_RADIANS(UNCERTAIN_ANGLE_THRESHOLD))) {
     8d8:	4638      	mov	r0, r7
     8da:	4908      	ldr	r1, [pc, #32]	; (8fc <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x110>)
     8dc:	f002 fcbe 	bl	325c <__aeabi_fcmple>
     8e0:	2800      	cmp	r0, #0
     8e2:	d0cf      	beq.n	884 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x98>
                    Angles[SweepSource][SweepAxis] = NewAngle;
     8e4:	f8c5 40a4 	str.w	r4, [r5, #164]	; 0xa4
     8e8:	e7cc      	b.n	884 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)+0x98>
     8ea:	bf00      	nop
     8ec:	66666667 	.word	0x66666667
     8f0:	371e232a 	.word	0x371e232a
     8f4:	40c90fdb 	.word	0x40c90fdb
     8f8:	be32b8c2 	.word	0xbe32b8c2
     8fc:	3e32b8c2 	.word	0x3e32b8c2

00000900 <InitTimer()>:
#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {
     900:	b4f0      	push	{r4, r5, r6, r7}

    SIM_SCGC6 |= SIM_SCGC6_PIT;
     902:	4a08      	ldr	r2, [pc, #32]	; (924 <InitTimer()+0x24>)
    PIT_LDVAL0 = UINT32_MAX;
     904:	4e08      	ldr	r6, [pc, #32]	; (928 <InitTimer()+0x28>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     906:	6813      	ldr	r3, [r2, #0]
    PIT_MCR = 0;
     908:	4c08      	ldr	r4, [pc, #32]	; (92c <InitTimer()+0x2c>)
    PIT_TCTRL0 = 1;
     90a:	4909      	ldr	r1, [pc, #36]	; (930 <InitTimer()+0x30>)
    PIT_LDVAL0 = UINT32_MAX;
     90c:	f04f 37ff 	mov.w	r7, #4294967295
    PIT_MCR = 0;
     910:	2500      	movs	r5, #0
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     912:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
    PIT_TCTRL0 = 1;
     916:	2001      	movs	r0, #1
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     918:	6013      	str	r3, [r2, #0]
    PIT_LDVAL0 = UINT32_MAX;
     91a:	6037      	str	r7, [r6, #0]
    PIT_MCR = 0;
     91c:	6025      	str	r5, [r4, #0]
    PIT_TCTRL0 = 1;
     91e:	6008      	str	r0, [r1, #0]

}
     920:	bcf0      	pop	{r4, r5, r6, r7}
     922:	4770      	bx	lr
     924:	4004803c 	.word	0x4004803c
     928:	40037100 	.word	0x40037100
     92c:	40037000 	.word	0x40037000
     930:	40037108 	.word	0x40037108

00000934 <Interrupt0Change()>:
}\
}


void Interrupt0Change() {
INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PINS.PulsePin, 0);
     934:	4a13      	ldr	r2, [pc, #76]	; (984 <Interrupt0Change()+0x50>)
void Interrupt0Change() {
     936:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
		  else {
			return 0;
		}
	} else {
		#if defined(KINETISK)
		return *portInputRegister(pin);
     938:	7811      	ldrb	r1, [r2, #0]
     93a:	4b13      	ldr	r3, [pc, #76]	; (988 <Interrupt0Change()+0x54>)
INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PINS.PulsePin, 0);
     93c:	4a13      	ldr	r2, [pc, #76]	; (98c <Interrupt0Change()+0x58>)
     93e:	f853 3031 	ldr.w	r3, [r3, r1, lsl #3]
     942:	6811      	ldr	r1, [r2, #0]
     944:	f893 3200 	ldrb.w	r3, [r3, #512]	; 0x200
     948:	43c9      	mvns	r1, r1
     94a:	b96b      	cbnz	r3, 968 <Interrupt0Change()+0x34>
     94c:	4e10      	ldr	r6, [pc, #64]	; (990 <Interrupt0Change()+0x5c>)
     94e:	4d11      	ldr	r5, [pc, #68]	; (994 <Interrupt0Change()+0x60>)
     950:	6834      	ldr	r4, [r6, #0]
     952:	682a      	ldr	r2, [r5, #0]
     954:	4810      	ldr	r0, [pc, #64]	; (998 <Interrupt0Change()+0x64>)
     956:	3401      	adds	r4, #1
     958:	f003 07ff 	and.w	r7, r3, #255	; 0xff
     95c:	4623      	mov	r3, r4
     95e:	6034      	str	r4, [r6, #0]
     960:	f7ff fecc 	bl	6fc <SensorNode::FallingEdge(unsigned long, unsigned int, unsigned int)>
     964:	602f      	str	r7, [r5, #0]
     966:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     968:	4e0a      	ldr	r6, [pc, #40]	; (994 <Interrupt0Change()+0x60>)
     96a:	4d09      	ldr	r5, [pc, #36]	; (990 <Interrupt0Change()+0x5c>)
     96c:	6834      	ldr	r4, [r6, #0]
     96e:	682b      	ldr	r3, [r5, #0]
     970:	4809      	ldr	r0, [pc, #36]	; (998 <Interrupt0Change()+0x64>)
     972:	3401      	adds	r4, #1
     974:	4622      	mov	r2, r4
     976:	6034      	str	r4, [r6, #0]
     978:	f7ff fea4 	bl	6c4 <SensorNode::RisingEdge(unsigned long, unsigned int, unsigned int)>
     97c:	2300      	movs	r3, #0
     97e:	602b      	str	r3, [r5, #0]
     980:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     982:	bf00      	nop
     984:	1fff8800 	.word	0x1fff8800
     988:	00003c48 	.word	0x00003c48
     98c:	40037104 	.word	0x40037104
     990:	1fff92a8 	.word	0x1fff92a8
     994:	1fff938c 	.word	0x1fff938c
     998:	1fff92bc 	.word	0x1fff92bc

0000099c <__tcf_1>:
SensorNode Nodes[] = {SENSOR_1_PINS};
     99c:	4801      	ldr	r0, [pc, #4]	; (9a4 <__tcf_1+0x8>)
     99e:	f7ff be8b 	b.w	6b8 <SensorNode::~SensorNode()>
     9a2:	bf00      	nop
     9a4:	1fff92bc 	.word	0x1fff92bc

000009a8 <__tcf_0>:
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     9a8:	b510      	push	{r4, lr}
     9aa:	4c05      	ldr	r4, [pc, #20]	; (9c0 <__tcf_0+0x18>)
     9ac:	f104 004c 	add.w	r0, r4, #76	; 0x4c
     9b0:	f7ff fd68 	bl	484 <BaseOOTX::~BaseOOTX()>
     9b4:	4620      	mov	r0, r4
     9b6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     9ba:	f7ff bd63 	b.w	484 <BaseOOTX::~BaseOOTX()>
     9be:	bf00      	nop
     9c0:	1fff920c 	.word	0x1fff920c

000009c4 <MainSetup()>:
}

//char (*__kaboom)[VERT] = 1;


void MainSetup() {
     9c4:	b510      	push	{r4, lr}
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
     9c6:	2101      	movs	r1, #1
     9c8:	200d      	movs	r0, #13
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
     9ca:	4c12      	ldr	r4, [pc, #72]	; (a14 <MainSetup()+0x50>)
    pinMode(LED_BUILTIN, OUTPUT);
     9cc:	f000 fc00 	bl	11d0 <pinMode>
    delay(2000);
     9d0:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     9d4:	f000 fc38 	bl	1248 <delay>
        Nodes[i].Init();
     9d8:	4620      	mov	r0, r4
     9da:	f7ff fe11 	bl	600 <SensorNode::Init()>
    }
    delay(100);
     9de:	2064      	movs	r0, #100	; 0x64
     9e0:	f000 fc32 	bl	1248 <delay>

    InitTimer(); //Start up better timer (If using)
     9e4:	f7ff ff8c 	bl	900 <InitTimer()>
     9e8:	2112      	movs	r1, #18
     9ea:	480b      	ldr	r0, [pc, #44]	; (a18 <MainSetup()+0x54>)
     9ec:	f001 fbdc 	bl	21a8 <usb_serial_write>
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
     9f0:	4620      	mov	r0, r4
     9f2:	f7ff fe63 	bl	6bc <SensorNode::GetPulsePin()>
     9f6:	2204      	movs	r2, #4
     9f8:	4908      	ldr	r1, [pc, #32]	; (a1c <MainSetup()+0x58>)
     9fa:	f000 fa63 	bl	ec4 <attachInterrupt>
     9fe:	2108      	movs	r1, #8
     a00:	4807      	ldr	r0, [pc, #28]	; (a20 <MainSetup()+0x5c>)
     a02:	f001 fbd1 	bl	21a8 <usb_serial_write>
     a06:	4807      	ldr	r0, [pc, #28]	; (a24 <MainSetup()+0x60>)
     a08:	f000 f9aa 	bl	d60 <Print::println()>
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     a0c:	4b06      	ldr	r3, [pc, #24]	; (a28 <MainSetup()+0x64>)
     a0e:	2220      	movs	r2, #32
     a10:	601a      	str	r2, [r3, #0]
     a12:	bd10      	pop	{r4, pc}
     a14:	1fff92bc 	.word	0x1fff92bc
     a18:	00003c24 	.word	0x00003c24
     a1c:	00000935 	.word	0x00000935
     a20:	00003c38 	.word	0x00003c38
     a24:	1fff88f0 	.word	0x1fff88f0
     a28:	400ff084 	.word	0x400ff084

00000a2c <MainLoop()>:
    ConfigureInterrupts(); // Set up Channel Interrupts
    digitalWriteFast(LED_BUILTIN, HIGH);
}


void MainLoop() {
     a2c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    static u_int8_t CurrentStationLock = NO_STATION_LOCK;
    static bool LastOOTXBit = 0;

    Pulse *EarliestSyncDetectedSource = NULL;
    u_int32_t EarlyTrack = 0;
    u_int32_t BaseTime = CURRENT_TIME;
     a30:	4b5a      	ldr	r3, [pc, #360]	; (b9c <MainLoop()+0x170>)
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { //Look through all nodes
        if (Nodes[i].NeedsPulseHandling()) { //Perform pulse calc pump only if needed
     a32:	485b      	ldr	r0, [pc, #364]	; (ba0 <MainLoop()+0x174>)
    u_int32_t BaseTime = CURRENT_TIME;
     a34:	681b      	ldr	r3, [r3, #0]
void MainLoop() {
     a36:	b087      	sub	sp, #28
    u_int32_t BaseTime = CURRENT_TIME;
     a38:	43dc      	mvns	r4, r3
        if (Nodes[i].NeedsPulseHandling()) { //Perform pulse calc pump only if needed
     a3a:	f7ff fdcb 	bl	5d4 <SensorNode::NeedsPulseHandling()>
     a3e:	bb10      	cbnz	r0, a86 <MainLoop()+0x5a>
        }
        //

    }
    else { //EarlyDetectionSource == NULL
        if (BaseTime - LastSyncPulseTime >
     a40:	4b58      	ldr	r3, [pc, #352]	; (ba4 <MainLoop()+0x178>)
     a42:	4a59      	ldr	r2, [pc, #356]	; (ba8 <MainLoop()+0x17c>)
     a44:	681b      	ldr	r3, [r3, #0]
     a46:	1ae3      	subs	r3, r4, r3
     a48:	4293      	cmp	r3, r2
     a4a:	d876      	bhi.n	b3a <MainLoop()+0x10e>
     a4c:	4857      	ldr	r0, [pc, #348]	; (bac <MainLoop()+0x180>)
     a4e:	4958      	ldr	r1, [pc, #352]	; (bb0 <MainLoop()+0x184>)
     a50:	4a58      	ldr	r2, [pc, #352]	; (bb4 <MainLoop()+0x188>)
     a52:	4b59      	ldr	r3, [pc, #356]	; (bb8 <MainLoop()+0x18c>)
     a54:	7800      	ldrb	r0, [r0, #0]
     a56:	7809      	ldrb	r1, [r1, #0]
     a58:	7812      	ldrb	r2, [r2, #0]
     a5a:	681b      	ldr	r3, [r3, #0]
        }
    }


    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(NextSweepSource, NextSweepAxis, SweepSyncStartTime, CurrentStationLock);
     a5c:	9000      	str	r0, [sp, #0]
     a5e:	4850      	ldr	r0, [pc, #320]	; (ba0 <MainLoop()+0x174>)
     a60:	f7ff fec4 	bl	7ec <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long, unsigned char)>
	// do not remove this "redundant" code without
	// carefully verifying the case mentioned here:
	//
	// https://forum.pjrc.com/threads/17469-millis%28%29-on-teensy-3?p=104924&viewfull=1#post104924
	//
	volatile uint32_t ret = systick_millis_count; // single aligned 32 bit is atomic
     a64:	4955      	ldr	r1, [pc, #340]	; (bbc <MainLoop()+0x190>)
    }

    static unsigned long t = 0;
    if (millis() - t > 1000) {
     a66:	4a56      	ldr	r2, [pc, #344]	; (bc0 <MainLoop()+0x194>)
     a68:	680b      	ldr	r3, [r1, #0]
     a6a:	9304      	str	r3, [sp, #16]
	return ret;
     a6c:	9b04      	ldr	r3, [sp, #16]
     a6e:	6810      	ldr	r0, [r2, #0]
     a70:	1a1b      	subs	r3, r3, r0
     a72:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     a76:	d903      	bls.n	a80 <MainLoop()+0x54>
	volatile uint32_t ret = systick_millis_count; // single aligned 32 bit is atomic
     a78:	680b      	ldr	r3, [r1, #0]
     a7a:	9305      	str	r3, [sp, #20]
	return ret;
     a7c:	9b05      	ldr	r3, [sp, #20]
        t = millis();
     a7e:	6013      	str	r3, [r2, #0]
//                Serial.print(NextSweepAxis);




}
     a80:	b007      	add	sp, #28
     a82:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
            Pulse *NewPulse = Nodes[i].PulseHandler(); //Update the oldest, non updated pulse
     a86:	4846      	ldr	r0, [pc, #280]	; (ba0 <MainLoop()+0x174>)
     a88:	f7ff fe60 	bl	74c <SensorNode::PulseHandler()>
            if (NewPulse->IsCertainSyncPulse and not NewPulse->ReadOut) { //Is that pulse a new sync pulse?
     a8c:	7b02      	ldrb	r2, [r0, #12]
     a8e:	0793      	lsls	r3, r2, #30
            Pulse *NewPulse = Nodes[i].PulseHandler(); //Update the oldest, non updated pulse
     a90:	4683      	mov	fp, r0
            if (NewPulse->IsCertainSyncPulse and not NewPulse->ReadOut) { //Is that pulse a new sync pulse?
     a92:	d5d5      	bpl.n	a40 <MainLoop()+0x14>
     a94:	f3c2 1600 	ubfx	r6, r2, #4, #1
     a98:	2e00      	cmp	r6, #0
     a9a:	d1d1      	bne.n	a40 <MainLoop()+0x14>
                if (BaseTime - NewPulse->RisingEdgeTicks >
     a9c:	6803      	ldr	r3, [r0, #0]
     a9e:	429c      	cmp	r4, r3
     aa0:	d063      	beq.n	b6a <MainLoop()+0x13e>
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     aa2:	4d40      	ldr	r5, [pc, #256]	; (ba4 <MainLoop()+0x178>)
     aa4:	6829      	ldr	r1, [r5, #0]
     aa6:	1a59      	subs	r1, r3, r1
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
     aa8:	f042 0210 	orr.w	r2, r2, #16
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     aac:	f5b1 6f96 	cmp.w	r1, #1200	; 0x4b0
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
     ab0:	7302      	strb	r2, [r0, #12]
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     ab2:	d9cb      	bls.n	a4c <MainLoop()+0x20>
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     ab4:	6883      	ldr	r3, [r0, #8]
     ab6:	4843      	ldr	r0, [pc, #268]	; (bc4 <MainLoop()+0x198>)
     ab8:	4a43      	ldr	r2, [pc, #268]	; (bc8 <MainLoop()+0x19c>)
            if (LastSyncSource == STATION_A and SourceStation ==
     aba:	f8df 811c 	ldr.w	r8, [pc, #284]	; bd8 <MainLoop()+0x1ac>
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     abe:	eb03 0343 	add.w	r3, r3, r3, lsl #1
     ac2:	011b      	lsls	r3, r3, #4
     ac4:	fba0 0303 	umull	r0, r3, r0, r3
     ac8:	095b      	lsrs	r3, r3, #5
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     aca:	f5a1 41b2 	sub.w	r1, r1, #22784	; 0x5900
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     ace:	f6a3 13c5 	subw	r3, r3, #2501	; 0x9c5
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     ad2:	3910      	subs	r1, #16
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     ad4:	fba2 3203 	umull	r3, r2, r2, r3
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     ad8:	f5b1 6f16 	cmp.w	r1, #2400	; 0x960
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     adc:	ea4f 1452 	mov.w	r4, r2, lsr #5
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     ae0:	d804      	bhi.n	aec <MainLoop()+0xc0>
            if (LastSyncSource == STATION_A and SourceStation ==
     ae2:	f898 3000 	ldrb.w	r3, [r8]
     ae6:	2b00      	cmp	r3, #0
     ae8:	d043      	beq.n	b72 <MainLoop()+0x146>
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     aea:	2601      	movs	r6, #1
                OOTX[STATION_A].NewOOTXBit(DATA(SyncPulseMeaning)); //Worth a shot, its an invalid frame anyway if it misses one. This way it might get lucky.
     aec:	fa5f f984 	uxtb.w	r9, r4
     af0:	f3c9 0740 	ubfx	r7, r9, #1, #1
                CurrentStationLock = SINGLE_STATION_LOCK; //Not sure which station though.
     af4:	f8df a0b4 	ldr.w	sl, [pc, #180]	; bac <MainLoop()+0x180>
                OOTX[STATION_A].NewOOTXBit(DATA(SyncPulseMeaning)); //Worth a shot, its an invalid frame anyway if it misses one. This way it might get lucky.
     af8:	4834      	ldr	r0, [pc, #208]	; (bcc <MainLoop()+0x1a0>)
     afa:	4639      	mov	r1, r7
                CurrentStationLock = SINGLE_STATION_LOCK; //Not sure which station though.
     afc:	2201      	movs	r2, #1
     afe:	f88a 2000 	strb.w	r2, [sl]
                OOTX[STATION_A].NewOOTXBit(DATA(SyncPulseMeaning)); //Worth a shot, its an invalid frame anyway if it misses one. This way it might get lucky.
     b02:	f7ff fcc1 	bl	488 <BaseOOTX::NewOOTXBit(bool)>
     b06:	4b32      	ldr	r3, [pc, #200]	; (bd0 <MainLoop()+0x1a4>)
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b08:	4832      	ldr	r0, [pc, #200]	; (bd4 <MainLoop()+0x1a8>)
     b0a:	9303      	str	r3, [sp, #12]
     b0c:	4639      	mov	r1, r7
     b0e:	f7ff fcbb 	bl	488 <BaseOOTX::NewOOTXBit(bool)>
            if (!SKIP(SyncPulseMeaning)) { //Is the station this sync concerns laser sweeping this time?
     b12:	f019 0f04 	tst.w	r9, #4
     b16:	d01a      	beq.n	b4e <MainLoop()+0x122>
     b18:	4925      	ldr	r1, [pc, #148]	; (bb0 <MainLoop()+0x184>)
     b1a:	4a26      	ldr	r2, [pc, #152]	; (bb4 <MainLoop()+0x188>)
     b1c:	4b26      	ldr	r3, [pc, #152]	; (bb8 <MainLoop()+0x18c>)
     b1e:	f8db e000 	ldr.w	lr, [fp]
     b22:	7809      	ldrb	r1, [r1, #0]
     b24:	7812      	ldrb	r2, [r2, #0]
     b26:	681b      	ldr	r3, [r3, #0]
            LastOOTXBit = DATA(SyncPulseMeaning);
     b28:	9c03      	ldr	r4, [sp, #12]
     b2a:	f89a 0000 	ldrb.w	r0, [sl]
            LastSyncSource = SourceStation;
     b2e:	f888 6000 	strb.w	r6, [r8]
            LastOOTXBit = DATA(SyncPulseMeaning);
     b32:	7027      	strb	r7, [r4, #0]
            LastSyncPulseTime = EarliestSyncDetectedSource->RisingEdgeTicks;
     b34:	f8c5 e000 	str.w	lr, [r5]
     b38:	e790      	b.n	a5c <MainLoop()+0x30>
            CurrentStationLock = NO_STATION_LOCK;
     b3a:	4c1c      	ldr	r4, [pc, #112]	; (bac <MainLoop()+0x180>)
     b3c:	491c      	ldr	r1, [pc, #112]	; (bb0 <MainLoop()+0x184>)
     b3e:	4a1d      	ldr	r2, [pc, #116]	; (bb4 <MainLoop()+0x188>)
     b40:	4b1d      	ldr	r3, [pc, #116]	; (bb8 <MainLoop()+0x18c>)
     b42:	7809      	ldrb	r1, [r1, #0]
     b44:	7812      	ldrb	r2, [r2, #0]
     b46:	681b      	ldr	r3, [r3, #0]
     b48:	2000      	movs	r0, #0
     b4a:	7020      	strb	r0, [r4, #0]
     b4c:	e786      	b.n	a5c <MainLoop()+0x30>
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks; //Used for determining if first or second pulse
     b4e:	4a1a      	ldr	r2, [pc, #104]	; (bb8 <MainLoop()+0x18c>)
     b50:	f8db e000 	ldr.w	lr, [fp]
                NextSweepAxis = AXIS(SyncPulseMeaning); // Which axis will this station be broadcasting.
     b54:	4b17      	ldr	r3, [pc, #92]	; (bb4 <MainLoop()+0x188>)
                NextSweepSource = SourceStation; // Expect the next sweep to be from this base
     b56:	4916      	ldr	r1, [pc, #88]	; (bb0 <MainLoop()+0x184>)
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks; //Used for determining if first or second pulse
     b58:	f8c2 e000 	str.w	lr, [r2]
                NextSweepAxis = AXIS(SyncPulseMeaning); // Which axis will this station be broadcasting.
     b5c:	f004 0201 	and.w	r2, r4, #1
     b60:	701a      	strb	r2, [r3, #0]
                NextSweepSource = SourceStation; // Expect the next sweep to be from this base
     b62:	700e      	strb	r6, [r1, #0]
     b64:	4673      	mov	r3, lr
     b66:	4631      	mov	r1, r6
     b68:	e7de      	b.n	b28 <MainLoop()+0xfc>
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
     b6a:	f042 0210 	orr.w	r2, r2, #16
     b6e:	7302      	strb	r2, [r0, #12]
     b70:	e766      	b.n	a40 <MainLoop()+0x14>
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
     b72:	4b17      	ldr	r3, [pc, #92]	; (bd0 <MainLoop()+0x1a4>)
                CurrentStationLock = DUAL_STATION_LOCK;
     b74:	f8df a034 	ldr.w	sl, [pc, #52]	; bac <MainLoop()+0x180>
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
     b78:	7819      	ldrb	r1, [r3, #0]
     b7a:	4814      	ldr	r0, [pc, #80]	; (bcc <MainLoop()+0x1a0>)
     b7c:	9303      	str	r3, [sp, #12]
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b7e:	fa5f f984 	uxtb.w	r9, r4
                CurrentStationLock = DUAL_STATION_LOCK;
     b82:	2202      	movs	r2, #2
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b84:	f3c9 0740 	ubfx	r7, r9, #1, #1
                CurrentStationLock = DUAL_STATION_LOCK;
     b88:	f88a 2000 	strb.w	r2, [sl]
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
     b8c:	f7ff fc7c 	bl	488 <BaseOOTX::NewOOTXBit(bool)>
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b90:	4639      	mov	r1, r7
     b92:	4810      	ldr	r0, [pc, #64]	; (bd4 <MainLoop()+0x1a8>)
     b94:	f7ff fc78 	bl	488 <BaseOOTX::NewOOTXBit(bool)>
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     b98:	2601      	movs	r6, #1
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
     b9a:	e7ba      	b.n	b12 <MainLoop()+0xe6>
     b9c:	40037104 	.word	0x40037104
     ba0:	1fff92bc 	.word	0x1fff92bc
     ba4:	1fff92b0 	.word	0x1fff92b0
     ba8:	000f4218 	.word	0x000f4218
     bac:	1fff9389 	.word	0x1fff9389
     bb0:	1fff92b8 	.word	0x1fff92b8
     bb4:	1fff92ad 	.word	0x1fff92ad
     bb8:	1fff92a4 	.word	0x1fff92a4
     bbc:	1fff9390 	.word	0x1fff9390
     bc0:	1fff92b4 	.word	0x1fff92b4
     bc4:	88888889 	.word	0x88888889
     bc8:	10624dd3 	.word	0x10624dd3
     bcc:	1fff920c 	.word	0x1fff920c
     bd0:	1fff92ac 	.word	0x1fff92ac
     bd4:	1fff9258 	.word	0x1fff9258
     bd8:	1fff9388 	.word	0x1fff9388

00000bdc <main>:


int main() {
     bdc:	b508      	push	{r3, lr}
    MainSetup();
     bde:	f7ff fef1 	bl	9c4 <MainSetup()>
    delay(200);
     be2:	20c8      	movs	r0, #200	; 0xc8
     be4:	f000 fb30 	bl	1248 <delay>
//            delay(250);
//        }
//
//    }

        MainLoop();
     be8:	f7ff ff20 	bl	a2c <MainLoop()>
     bec:	e7fc      	b.n	be8 <main+0xc>
     bee:	bf00      	nop

00000bf0 <_GLOBAL__sub_I_SENSOR_1_PINS>:
    }
    return 0;
     bf0:	b538      	push	{r3, r4, r5, lr}
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     bf2:	4d0e      	ldr	r5, [pc, #56]	; (c2c <_GLOBAL__sub_I_SENSOR_1_PINS+0x3c>)
     bf4:	4c0e      	ldr	r4, [pc, #56]	; (c30 <_GLOBAL__sub_I_SENSOR_1_PINS+0x40>)
     bf6:	4628      	mov	r0, r5
     bf8:	2100      	movs	r1, #0
     bfa:	f7ff fc37 	bl	46c <BaseOOTX::BaseOOTX(int)>
     bfe:	f105 004c 	add.w	r0, r5, #76	; 0x4c
     c02:	2101      	movs	r1, #1
     c04:	f7ff fc32 	bl	46c <BaseOOTX::BaseOOTX(int)>
     c08:	4622      	mov	r2, r4
     c0a:	490a      	ldr	r1, [pc, #40]	; (c34 <_GLOBAL__sub_I_SENSOR_1_PINS+0x44>)
     c0c:	2000      	movs	r0, #0
     c0e:	f002 f869 	bl	2ce4 <__aeabi_atexit>
SensorNode Nodes[] = {SENSOR_1_PINS};
     c12:	4b09      	ldr	r3, [pc, #36]	; (c38 <_GLOBAL__sub_I_SENSOR_1_PINS+0x48>)
     c14:	4809      	ldr	r0, [pc, #36]	; (c3c <_GLOBAL__sub_I_SENSOR_1_PINS+0x4c>)
     c16:	cb0e      	ldmia	r3, {r1, r2, r3}
     c18:	f7ff fccc 	bl	5b4 <SensorNode::SensorNode(SensorPinData_t)>
     c1c:	4622      	mov	r2, r4
     c1e:	4908      	ldr	r1, [pc, #32]	; (c40 <_GLOBAL__sub_I_SENSOR_1_PINS+0x50>)
     c20:	2000      	movs	r0, #0
     c22:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     c26:	f002 b85d 	b.w	2ce4 <__aeabi_atexit>
     c2a:	bf00      	nop
     c2c:	1fff920c 	.word	0x1fff920c
     c30:	1fff87fc 	.word	0x1fff87fc
     c34:	000009a9 	.word	0x000009a9
     c38:	1fff8800 	.word	0x1fff8800
     c3c:	1fff92bc 	.word	0x1fff92bc
     c40:	0000099d 	.word	0x0000099d

00000c44 <Print::write(unsigned char const*, unsigned int)>:
#include "Print.h"



size_t Print::write(const uint8_t *buffer, size_t size)
{
     c44:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	size_t count = 0;
	while (size--) count += write(*buffer++);
     c46:	b172      	cbz	r2, c66 <Print::write(unsigned char const*, unsigned int)+0x22>
     c48:	4606      	mov	r6, r0
     c4a:	460f      	mov	r7, r1
     c4c:	4614      	mov	r4, r2
     c4e:	2500      	movs	r5, #0
     c50:	6833      	ldr	r3, [r6, #0]
     c52:	f817 1b01 	ldrb.w	r1, [r7], #1
     c56:	681b      	ldr	r3, [r3, #0]
     c58:	4630      	mov	r0, r6
     c5a:	4798      	blx	r3
     c5c:	3c01      	subs	r4, #1
     c5e:	4405      	add	r5, r0
     c60:	d1f6      	bne.n	c50 <Print::write(unsigned char const*, unsigned int)+0xc>
	return count;
}
     c62:	4628      	mov	r0, r5
     c64:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	size_t count = 0;
     c66:	4615      	mov	r5, r2
     c68:	e7fb      	b.n	c62 <Print::write(unsigned char const*, unsigned int)+0x1e>
     c6a:	bf00      	nop

00000c6c <Print::print(long)>:
	return count;
}


size_t Print::print(long n)
{
     c6c:	b5f0      	push	{r4, r5, r6, r7, lr}
	uint8_t sign=0;

	if (n < 0) {
     c6e:	2900      	cmp	r1, #0
{
     c70:	b08b      	sub	sp, #44	; 0x2c
     c72:	4604      	mov	r4, r0
	if (n < 0) {
     c74:	db1b      	blt.n	cae <Print::print(long)+0x42>
	} else if (base == 1) {
		base = 10;
	}


	if (n == 0) {
     c76:	d15a      	bne.n	d2e <Print::print(long)+0xc2>
		buf[sizeof(buf) - 1] = '0';
     c78:	2330      	movs	r3, #48	; 0x30
     c7a:	f88d 3025 	strb.w	r3, [sp, #37]	; 0x25
	}
	if (sign) {
		i--;
		buf[i] = '-';
	}
	return write(buf + i, sizeof(buf) - i);
     c7e:	6823      	ldr	r3, [r4, #0]
     c80:	4a35      	ldr	r2, [pc, #212]	; (d58 <Print::print(long)+0xec>)
     c82:	685f      	ldr	r7, [r3, #4]
     c84:	4297      	cmp	r7, r2
     c86:	d14a      	bne.n	d1e <Print::print(long)+0xb2>
	while (size--) count += write(*buffer++);
     c88:	2500      	movs	r5, #0
	return write(buf + i, sizeof(buf) - i);
     c8a:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     c8e:	460e      	mov	r6, r1
     c90:	440d      	add	r5, r1
     c92:	2700      	movs	r7, #0
     c94:	e001      	b.n	c9a <Print::print(long)+0x2e>
     c96:	6823      	ldr	r3, [r4, #0]
     c98:	3601      	adds	r6, #1
	while (size--) count += write(*buffer++);
     c9a:	681b      	ldr	r3, [r3, #0]
     c9c:	7831      	ldrb	r1, [r6, #0]
     c9e:	4620      	mov	r0, r4
     ca0:	4798      	blx	r3
     ca2:	42b5      	cmp	r5, r6
     ca4:	4407      	add	r7, r0
     ca6:	d1f6      	bne.n	c96 <Print::print(long)+0x2a>
     ca8:	4638      	mov	r0, r7
}
     caa:	b00b      	add	sp, #44	; 0x2c
     cac:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cae:	4b2b      	ldr	r3, [pc, #172]	; (d5c <Print::print(long)+0xf0>)
	return printNumber(n, 10, sign);
     cb0:	4249      	negs	r1, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cb2:	fba3 2301 	umull	r2, r3, r3, r1
     cb6:	08db      	lsrs	r3, r3, #3
     cb8:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     cbc:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
     cc0:	3130      	adds	r1, #48	; 0x30
     cc2:	f88d 1025 	strb.w	r1, [sp, #37]	; 0x25
			if (n == 0) break;
     cc6:	2b00      	cmp	r3, #0
     cc8:	d044      	beq.n	d54 <Print::print(long)+0xe8>
		sign = '-';
     cca:	262d      	movs	r6, #45	; 0x2d
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     ccc:	4d23      	ldr	r5, [pc, #140]	; (d5c <Print::print(long)+0xf0>)
		sign = '-';
     cce:	2221      	movs	r2, #33	; 0x21
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cd0:	fba5 0103 	umull	r0, r1, r5, r3
     cd4:	08c9      	lsrs	r1, r1, #3
     cd6:	eb01 0081 	add.w	r0, r1, r1, lsl #2
			i--;
     cda:	3a01      	subs	r2, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     cdc:	eba3 0340 	sub.w	r3, r3, r0, lsl #1
			i--;
     ce0:	b2d2      	uxtb	r2, r2
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     ce2:	a80a      	add	r0, sp, #40	; 0x28
     ce4:	4410      	add	r0, r2
     ce6:	3330      	adds	r3, #48	; 0x30
     ce8:	f800 3c24 	strb.w	r3, [r0, #-36]
			if (n == 0) break;
     cec:	460b      	mov	r3, r1
     cee:	2900      	cmp	r1, #0
     cf0:	d1ee      	bne.n	cd0 <Print::print(long)+0x64>
	if (sign) {
     cf2:	b35e      	cbz	r6, d4c <Print::print(long)+0xe0>
		i--;
     cf4:	1e55      	subs	r5, r2, #1
     cf6:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     cf8:	ab0a      	add	r3, sp, #40	; 0x28
     cfa:	442b      	add	r3, r5
     cfc:	222d      	movs	r2, #45	; 0x2d
     cfe:	f803 2c24 	strb.w	r2, [r3, #-36]
     d02:	f1c5 0022 	rsb	r0, r5, #34	; 0x22
	return write(buf + i, sizeof(buf) - i);
     d06:	6823      	ldr	r3, [r4, #0]
     d08:	4a13      	ldr	r2, [pc, #76]	; (d58 <Print::print(long)+0xec>)
     d0a:	685f      	ldr	r7, [r3, #4]
     d0c:	a901      	add	r1, sp, #4
     d0e:	4297      	cmp	r7, r2
     d10:	4429      	add	r1, r5
     d12:	d107      	bne.n	d24 <Print::print(long)+0xb8>
	while (size--) count += write(*buffer++);
     d14:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     d18:	2800      	cmp	r0, #0
     d1a:	d1b8      	bne.n	c8e <Print::print(long)+0x22>
     d1c:	e7c5      	b.n	caa <Print::print(long)+0x3e>
	return write(buf + i, sizeof(buf) - i);
     d1e:	2001      	movs	r0, #1
     d20:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     d24:	4602      	mov	r2, r0
     d26:	4620      	mov	r0, r4
     d28:	47b8      	blx	r7
}
     d2a:	b00b      	add	sp, #44	; 0x2c
     d2c:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     d2e:	4b0b      	ldr	r3, [pc, #44]	; (d5c <Print::print(long)+0xf0>)
     d30:	fba3 2301 	umull	r2, r3, r3, r1
     d34:	08db      	lsrs	r3, r3, #3
     d36:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     d3a:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
     d3e:	3230      	adds	r2, #48	; 0x30
     d40:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
			if (n == 0) break;
     d44:	2b00      	cmp	r3, #0
     d46:	d09a      	beq.n	c7e <Print::print(long)+0x12>
	uint8_t sign=0;
     d48:	2600      	movs	r6, #0
     d4a:	e7bf      	b.n	ccc <Print::print(long)+0x60>
     d4c:	4615      	mov	r5, r2
     d4e:	f1c2 0022 	rsb	r0, r2, #34	; 0x22
     d52:	e7d8      	b.n	d06 <Print::print(long)+0x9a>
			if (n == 0) break;
     d54:	2221      	movs	r2, #33	; 0x21
     d56:	e7cd      	b.n	cf4 <Print::print(long)+0x88>
     d58:	00000c45 	.word	0x00000c45
     d5c:	cccccccd 	.word	0xcccccccd

00000d60 <Print::println()>:
{
     d60:	b530      	push	{r4, r5, lr}
	return write(buf, 2);
     d62:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     d64:	490d      	ldr	r1, [pc, #52]	; (d9c <Print::println()+0x3c>)
     d66:	4a0e      	ldr	r2, [pc, #56]	; (da0 <Print::println()+0x40>)
	return write(buf, 2);
     d68:	685c      	ldr	r4, [r3, #4]
	uint8_t buf[2]={'\r', '\n'};
     d6a:	8809      	ldrh	r1, [r1, #0]
{
     d6c:	b083      	sub	sp, #12
     d6e:	4294      	cmp	r4, r2
	uint8_t buf[2]={'\r', '\n'};
     d70:	f8ad 1004 	strh.w	r1, [sp, #4]
     d74:	d10d      	bne.n	d92 <Print::println()+0x32>
     d76:	4605      	mov	r5, r0
	while (size--) count += write(*buffer++);
     d78:	681b      	ldr	r3, [r3, #0]
     d7a:	210d      	movs	r1, #13
     d7c:	4798      	blx	r3
     d7e:	682b      	ldr	r3, [r5, #0]
     d80:	f89d 1005 	ldrb.w	r1, [sp, #5]
     d84:	681b      	ldr	r3, [r3, #0]
     d86:	4604      	mov	r4, r0
     d88:	4628      	mov	r0, r5
     d8a:	4798      	blx	r3
     d8c:	4420      	add	r0, r4
}
     d8e:	b003      	add	sp, #12
     d90:	bd30      	pop	{r4, r5, pc}
	return write(buf, 2);
     d92:	a901      	add	r1, sp, #4
     d94:	2202      	movs	r2, #2
     d96:	47a0      	blx	r4
}
     d98:	b003      	add	sp, #12
     d9a:	bd30      	pop	{r4, r5, pc}
     d9c:	00003c44 	.word	0x00003c44
     da0:	00000c45 	.word	0x00000c45

00000da4 <memset>:
     da4:	b501      	push	{r0, lr}
     da6:	b1ea      	cbz	r2, de4 <memset+0x40>
     da8:	2a10      	cmp	r2, #16
     daa:	db17      	blt.n	ddc <memset+0x38>
     dac:	f000 0307 	and.w	r3, r0, #7
     db0:	b133      	cbz	r3, dc0 <memset+0x1c>
     db2:	f1c3 0308 	rsb	r3, r3, #8
     db6:	1ad2      	subs	r2, r2, r3
     db8:	3b01      	subs	r3, #1
     dba:	f800 1b01 	strb.w	r1, [r0], #1
     dbe:	dcfb      	bgt.n	db8 <memset+0x14>
     dc0:	b2c9      	uxtb	r1, r1
     dc2:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
     dc6:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
     dca:	468c      	mov	ip, r1
     dcc:	08d3      	lsrs	r3, r2, #3
     dce:	3b01      	subs	r3, #1
     dd0:	e8e0 1c02 	strd	r1, ip, [r0], #8
     dd4:	dcfb      	bgt.n	dce <memset+0x2a>
     dd6:	f012 0207 	ands.w	r2, r2, #7
     dda:	d003      	beq.n	de4 <memset+0x40>
     ddc:	3a01      	subs	r2, #1
     dde:	f800 1b01 	strb.w	r1, [r0], #1
     de2:	dcfb      	bgt.n	ddc <memset+0x38>
     de4:	bd01      	pop	{r0, pc}
     de6:	bf00      	nop

00000de8 <fault_isr>:
{
     de8:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     dea:	4c10      	ldr	r4, [pc, #64]	; (e2c <fault_isr+0x44>)
     dec:	e008      	b.n	e00 <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     dee:	6823      	ldr	r3, [r4, #0]
     df0:	0559      	lsls	r1, r3, #21
     df2:	d40d      	bmi.n	e10 <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     df4:	6823      	ldr	r3, [r4, #0]
     df6:	051a      	lsls	r2, r3, #20
     df8:	d40f      	bmi.n	e1a <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     dfa:	6823      	ldr	r3, [r4, #0]
     dfc:	04db      	lsls	r3, r3, #19
     dfe:	d411      	bmi.n	e24 <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     e00:	6823      	ldr	r3, [r4, #0]
     e02:	0358      	lsls	r0, r3, #13
     e04:	d5f3      	bpl.n	dee <fault_isr+0x6>
     e06:	f000 fb47 	bl	1498 <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     e0a:	6823      	ldr	r3, [r4, #0]
     e0c:	0559      	lsls	r1, r3, #21
     e0e:	d5f1      	bpl.n	df4 <fault_isr+0xc>
     e10:	f001 fd60 	bl	28d4 <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     e14:	6823      	ldr	r3, [r4, #0]
     e16:	051a      	lsls	r2, r3, #20
     e18:	d5ef      	bpl.n	dfa <fault_isr+0x12>
     e1a:	f001 fdf1 	bl	2a00 <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     e1e:	6823      	ldr	r3, [r4, #0]
     e20:	04db      	lsls	r3, r3, #19
     e22:	d5ed      	bpl.n	e00 <fault_isr+0x18>
     e24:	f001 fe82 	bl	2b2c <uart2_status_isr>
     e28:	e7ea      	b.n	e00 <fault_isr+0x18>
     e2a:	bf00      	nop
     e2c:	40048034 	.word	0x40048034

00000e30 <unused_isr>:
{
     e30:	b508      	push	{r3, lr}
	fault_isr();
     e32:	f7ff ffd9 	bl	de8 <fault_isr>
     e36:	bf00      	nop

00000e38 <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
     e38:	4b01      	ldr	r3, [pc, #4]	; (e40 <startup_early_hook+0x8>)
     e3a:	2210      	movs	r2, #16
     e3c:	801a      	strh	r2, [r3, #0]
     e3e:	4770      	bx	lr
     e40:	40052000 	.word	0x40052000

00000e44 <startup_late_hook>:
static void startup_default_late_hook(void) {}
     e44:	4770      	bx	lr
     e46:	bf00      	nop

00000e48 <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
     e48:	4909      	ldr	r1, [pc, #36]	; (e70 <_sbrk+0x28>)
{
     e4a:	b508      	push	{r3, lr}
	prev = __brkval;
     e4c:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
     e4e:	b130      	cbz	r0, e5e <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
     e50:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
     e52:	4418      	add	r0, r3
     e54:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
     e58:	4290      	cmp	r0, r2
     e5a:	d202      	bcs.n	e62 <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
     e5c:	6008      	str	r0, [r1, #0]
	}
	return prev;
     e5e:	4618      	mov	r0, r3
}
     e60:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
     e62:	f002 fa1f 	bl	32a4 <__errno>
     e66:	230c      	movs	r3, #12
     e68:	6003      	str	r3, [r0, #0]
			return (void *)-1;
     e6a:	f04f 30ff 	mov.w	r0, #4294967295
     e6e:	bd08      	pop	{r3, pc}
     e70:	1fff880c 	.word	0x1fff880c

00000e74 <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
     e74:	b4f0      	push	{r4, r5, r6, r7}
     e76:	1e4d      	subs	r5, r1, #1
     e78:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
     e7a:	2400      	movs	r4, #0
     e7c:	e000      	b.n	e80 <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
     e7e:	3401      	adds	r4, #1
		digit = val % radix;
     e80:	fbb0 f3f2 	udiv	r3, r0, r2
     e84:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     e88:	2809      	cmp	r0, #9
     e8a:	f100 0730 	add.w	r7, r0, #48	; 0x30
     e8e:	bf8a      	itet	hi
     e90:	3037      	addhi	r0, #55	; 0x37
     e92:	b2f8      	uxtbls	r0, r7
     e94:	b2c0      	uxtbhi	r0, r0
     e96:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
     e9a:	4618      	mov	r0, r3
     e9c:	2b00      	cmp	r3, #0
     e9e:	d1ee      	bne.n	e7e <ultoa+0xa>
	}
	buf[i + 1] = 0;
     ea0:	190a      	adds	r2, r1, r4
     ea2:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
     ea4:	b14c      	cbz	r4, eba <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
     ea6:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
     ea8:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
     eac:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
     eae:	3301      	adds	r3, #1
     eb0:	1ae0      	subs	r0, r4, r3
     eb2:	4283      	cmp	r3, r0
		buf[i] = t;
     eb4:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
     eb8:	dbf5      	blt.n	ea6 <ultoa+0x32>
	}
	return buf;
}
     eba:	4608      	mov	r0, r1
     ebc:	bcf0      	pop	{r4, r5, r6, r7}
     ebe:	4770      	bx	lr

00000ec0 <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
     ec0:	4770      	bx	lr
     ec2:	bf00      	nop

00000ec4 <attachInterrupt>:
void attachInterrupt(uint8_t pin, void (*function)(void), int mode)
{
	volatile uint32_t *config;
	uint32_t cfg, mask;

	if (pin >= CORE_NUM_DIGITAL) return;
     ec4:	2821      	cmp	r0, #33	; 0x21
{
     ec6:	b4f0      	push	{r4, r5, r6, r7}
	if (pin >= CORE_NUM_DIGITAL) return;
     ec8:	d815      	bhi.n	ef6 <attachInterrupt+0x32>
	switch (mode) {
     eca:	2a04      	cmp	r2, #4
     ecc:	d813      	bhi.n	ef6 <attachInterrupt+0x32>
     ece:	e8df f002 	tbb	[pc, r2]
     ed2:	4c49      	.short	0x4c49
     ed4:	144f      	.short	0x144f
     ed6:	46          	.byte	0x46
     ed7:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     ed8:	4e2e      	ldr	r6, [pc, #184]	; (f94 <attachInterrupt+0xd0>)
	attachInterruptVector(IRQ_PORTD, port_D_isr);
	attachInterruptVector(IRQ_PORTE, port_E_isr);
	voidFuncPtr* isr_table = getIsrTable(config);
	if(!isr_table) return;
	uint32_t pin_index = getPinIndex(config);
	__disable_irq();
     eda:	b672      	cpsid	i
	cfg = *config;
     edc:	681a      	ldr	r2, [r3, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
     ede:	f422 2270 	bic.w	r2, r2, #983040	; 0xf0000
     ee2:	f042 7080 	orr.w	r0, r2, #16777216	; 0x1000000
	*config = cfg;
	isr_table[pin_index] = function;	// set the function pointer
     ee6:	f3c3 0484 	ubfx	r4, r3, #2, #5
	cfg |= mask;
     eea:	4328      	orrs	r0, r5
	*config = cfg;
     eec:	601a      	str	r2, [r3, #0]
	isr_table[pin_index] = function;	// set the function pointer
     eee:	f846 1024 	str.w	r1, [r6, r4, lsl #2]
	*config = cfg;			// enable the new interrupt
     ef2:	6018      	str	r0, [r3, #0]
	__enable_irq();
     ef4:	b662      	cpsie	i
	intFunc[pin] = function;	// set the function pointer
	cfg |= mask;
	*config = cfg;			// enable the new interrupt
	__enable_irq();
#endif
}
     ef6:	bcf0      	pop	{r4, r5, r6, r7}
     ef8:	4770      	bx	lr
	switch (mode) {
     efa:	f44f 2510 	mov.w	r5, #589824	; 0x90000
	config = portConfigRegister(pin);
     efe:	4c26      	ldr	r4, [pc, #152]	; (f98 <attachInterrupt+0xd4>)
     f00:	eb04 03c0 	add.w	r3, r4, r0, lsl #3
     f04:	685b      	ldr	r3, [r3, #4]
	if ((*config & 0x00000700) == 0) {
     f06:	681a      	ldr	r2, [r3, #0]
     f08:	f412 62e0 	ands.w	r2, r2, #1792	; 0x700
     f0c:	d035      	beq.n	f7a <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
     f0e:	4a23      	ldr	r2, [pc, #140]	; (f9c <attachInterrupt+0xd8>)
     f10:	4c23      	ldr	r4, [pc, #140]	; (fa0 <attachInterrupt+0xdc>)
     f12:	4824      	ldr	r0, [pc, #144]	; (fa4 <attachInterrupt+0xe0>)
     f14:	f8c2 419c 	str.w	r4, [r2, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     f18:	f103 4440 	add.w	r4, r3, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
     f1c:	4e22      	ldr	r6, [pc, #136]	; (fa8 <attachInterrupt+0xe4>)
     f1e:	f8c2 01a4 	str.w	r0, [r2, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     f22:	f5a4 2092 	sub.w	r0, r4, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
     f26:	4f21      	ldr	r7, [pc, #132]	; (fac <attachInterrupt+0xe8>)
     f28:	f8c2 61a0 	str.w	r6, [r2, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     f2c:	287c      	cmp	r0, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
     f2e:	4e20      	ldr	r6, [pc, #128]	; (fb0 <attachInterrupt+0xec>)
     f30:	f8c2 71a8 	str.w	r7, [r2, #424]	; 0x1a8
     f34:	f8c2 61ac 	str.w	r6, [r2, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     f38:	d9ce      	bls.n	ed8 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     f3a:	f5a4 2294 	sub.w	r2, r4, #303104	; 0x4a000
     f3e:	2a7c      	cmp	r2, #124	; 0x7c
     f40:	d919      	bls.n	f76 <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     f42:	f5a4 2296 	sub.w	r2, r4, #307200	; 0x4b000
     f46:	2a7c      	cmp	r2, #124	; 0x7c
     f48:	d91f      	bls.n	f8a <attachInterrupt+0xc6>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     f4a:	f5a4 2298 	sub.w	r2, r4, #311296	; 0x4c000
     f4e:	2a7c      	cmp	r2, #124	; 0x7c
     f50:	d91d      	bls.n	f8e <attachInterrupt+0xca>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     f52:	f5a4 249a 	sub.w	r4, r4, #315392	; 0x4d000
     f56:	2c7c      	cmp	r4, #124	; 0x7c
     f58:	d8cd      	bhi.n	ef6 <attachInterrupt+0x32>
     f5a:	4e16      	ldr	r6, [pc, #88]	; (fb4 <attachInterrupt+0xf0>)
     f5c:	e7bd      	b.n	eda <attachInterrupt+0x16>
	switch (mode) {
     f5e:	f44f 2530 	mov.w	r5, #720896	; 0xb0000
     f62:	e7cc      	b.n	efe <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
     f64:	f44f 2500 	mov.w	r5, #524288	; 0x80000
     f68:	e7c9      	b.n	efe <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
     f6a:	f44f 2540 	mov.w	r5, #786432	; 0xc0000
     f6e:	e7c6      	b.n	efe <attachInterrupt+0x3a>
	switch (mode) {
     f70:	f44f 2520 	mov.w	r5, #655360	; 0xa0000
     f74:	e7c3      	b.n	efe <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     f76:	4e10      	ldr	r6, [pc, #64]	; (fb8 <attachInterrupt+0xf4>)
     f78:	e7af      	b.n	eda <attachInterrupt+0x16>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
     f7a:	f854 4030 	ldr.w	r4, [r4, r0, lsl #3]
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
			*config = PORT_PCR_MUX(1);
     f7e:	f44f 7080 	mov.w	r0, #256	; 0x100
		*portModeRegister(pin) = 0;
     f82:	f884 2280 	strb.w	r2, [r4, #640]	; 0x280
			*config = PORT_PCR_MUX(1);
     f86:	6018      	str	r0, [r3, #0]
     f88:	e7c1      	b.n	f0e <attachInterrupt+0x4a>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     f8a:	4e0c      	ldr	r6, [pc, #48]	; (fbc <attachInterrupt+0xf8>)
     f8c:	e7a5      	b.n	eda <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     f8e:	4e0c      	ldr	r6, [pc, #48]	; (fc0 <attachInterrupt+0xfc>)
     f90:	e7a3      	b.n	eda <attachInterrupt+0x16>
     f92:	bf00      	nop
     f94:	1fff8810 	.word	0x1fff8810
     f98:	00003c48 	.word	0x00003c48
     f9c:	1fff8200 	.word	0x1fff8200
     fa0:	1fff87d1 	.word	0x1fff87d1
     fa4:	1fff8779 	.word	0x1fff8779
     fa8:	1fff87a5 	.word	0x1fff87a5
     fac:	1fff874d 	.word	0x1fff874d
     fb0:	1fff8721 	.word	0x1fff8721
     fb4:	1fff88e8 	.word	0x1fff88e8
     fb8:	1fff8848 	.word	0x1fff8848
     fbc:	1fff8898 	.word	0x1fff8898
     fc0:	1fff88c8 	.word	0x1fff88c8

00000fc4 <rtc_set>:
{
     fc4:	b430      	push	{r4, r5}
	RTC_SR = 0;
     fc6:	4b05      	ldr	r3, [pc, #20]	; (fdc <rtc_set+0x18>)
	RTC_TPR = 0;
     fc8:	4d05      	ldr	r5, [pc, #20]	; (fe0 <rtc_set+0x1c>)
	RTC_TSR = t;
     fca:	4c06      	ldr	r4, [pc, #24]	; (fe4 <rtc_set+0x20>)
	RTC_SR = 0;
     fcc:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
     fce:	2110      	movs	r1, #16
	RTC_SR = 0;
     fd0:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
     fd2:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
     fd4:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
     fd6:	6019      	str	r1, [r3, #0]
}
     fd8:	bc30      	pop	{r4, r5}
     fda:	4770      	bx	lr
     fdc:	4003d014 	.word	0x4003d014
     fe0:	4003d004 	.word	0x4003d004
     fe4:	4003d000 	.word	0x4003d000

00000fe8 <_init_Teensyduino_internal_>:
{
     fe8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     fec:	4b6a      	ldr	r3, [pc, #424]	; (1198 <_init_Teensyduino_internal_+0x1b0>)
	FTM0_CNT = 0;
     fee:	496b      	ldr	r1, [pc, #428]	; (119c <_init_Teensyduino_internal_+0x1b4>)
	FTM0_C1SC = 0x28;
     ff0:	4e6b      	ldr	r6, [pc, #428]	; (11a0 <_init_Teensyduino_internal_+0x1b8>)
	FTM0_C3SC = 0x28;
     ff2:	4d6c      	ldr	r5, [pc, #432]	; (11a4 <_init_Teensyduino_internal_+0x1bc>)
	FTM0_C4SC = 0x28;
     ff4:	4c6c      	ldr	r4, [pc, #432]	; (11a8 <_init_Teensyduino_internal_+0x1c0>)
	FTM0_MOD = DEFAULT_FTM_MOD;
     ff6:	f8df c1d0 	ldr.w	ip, [pc, #464]	; 11c8 <_init_Teensyduino_internal_+0x1e0>
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     ffa:	f8df e1d0 	ldr.w	lr, [pc, #464]	; 11cc <_init_Teensyduino_internal_+0x1e4>
	FTM0_C2SC = 0x28;
     ffe:	4a6b      	ldr	r2, [pc, #428]	; (11ac <_init_Teensyduino_internal_+0x1c4>)
	FTM0_C5SC = 0x28;
    1000:	4f6b      	ldr	r7, [pc, #428]	; (11b0 <_init_Teensyduino_internal_+0x1c8>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
    1002:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
    1006:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
    1008:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
    100c:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
    100e:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
    1012:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
    1014:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
    1018:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
    101a:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
    101e:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
    1020:	2000      	movs	r0, #0
    1022:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
    1024:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
    1026:	f64e 71ff 	movw	r1, #61439	; 0xefff
    102a:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
    102e:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
    1032:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
    1034:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
    1036:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
    1038:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
    103a:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
    103c:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
    103e:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1040:	2209      	movs	r2, #9
    1042:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
    1046:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
    104a:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
    104e:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
    1052:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
    1056:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
    105a:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
    105e:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
    1060:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1064:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
    1068:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
    106c:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
    1070:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
    1072:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1076:	484f      	ldr	r0, [pc, #316]	; (11b4 <_init_Teensyduino_internal_+0x1cc>)
	FTM2_MOD = DEFAULT_FTM_MOD;
    1078:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
    107a:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
    107e:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
    1082:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
    1084:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1086:	6002      	str	r2, [r0, #0]
	analog_init();
    1088:	f001 fba4 	bl	27d4 <analog_init>

uint32_t micros(void)
{
	uint32_t count, current, istatus;

	__disable_irq();
    108c:	b672      	cpsid	i
	current = SYST_CVR;
	count = systick_millis_count;
    108e:	4d4a      	ldr	r5, [pc, #296]	; (11b8 <_init_Teensyduino_internal_+0x1d0>)
	current = SYST_CVR;
    1090:	4b4a      	ldr	r3, [pc, #296]	; (11bc <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1092:	4a4b      	ldr	r2, [pc, #300]	; (11c0 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
    1094:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
    1096:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1098:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
    109a:	b662      	cpsie	i
	 //systick_current = current;
	 //systick_count = count;
	 //systick_istatus = istatus & SCB_ICSR_PENDSTSET ? 1 : 0;
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    109c:	0151      	lsls	r1, r2, #5
    109e:	d502      	bpl.n	10a6 <_init_Teensyduino_internal_+0xbe>
    10a0:	2b32      	cmp	r3, #50	; 0x32
    10a2:	bf88      	it	hi
    10a4:	3401      	addhi	r4, #1
#if defined(KINETISL) && F_CPU == 48000000
	return count * 1000 + ((current * (uint32_t)87381) >> 22);
#elif defined(KINETISL) && F_CPU == 24000000
	return count * 1000 + ((current * (uint32_t)174763) >> 22);
#endif
	return count * 1000 + current / (F_CPU / 1000000);
    10a6:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
    10aa:	4f46      	ldr	r7, [pc, #280]	; (11c4 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
    10ac:	f8df 910c 	ldr.w	r9, [pc, #268]	; 11bc <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    10b0:	f8df 810c 	ldr.w	r8, [pc, #268]	; 11c0 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
    10b4:	33bf      	adds	r3, #191	; 0xbf
    10b6:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    10ba:	fba7 1303 	umull	r1, r3, r7, r3
    10be:	fb02 f404 	mul.w	r4, r2, r4
    10c2:	eb04 1493 	add.w	r4, r4, r3, lsr #6
    10c6:	2632      	movs	r6, #50	; 0x32
	__disable_irq();
    10c8:	b672      	cpsid	i
	current = SYST_CVR;
    10ca:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
    10ce:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    10d0:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
    10d4:	b662      	cpsie	i
{
	uint32_t start = micros();

	if (ms > 0) {
		while (1) {
			while ((micros() - start) >= 1000) {
    10d6:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
    10da:	33bf      	adds	r3, #191	; 0xbf
    10dc:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    10e0:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
    10e4:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
    10e8:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    10ec:	d002      	beq.n	10f4 <_init_Teensyduino_internal_+0x10c>
    10ee:	2932      	cmp	r1, #50	; 0x32
    10f0:	bf88      	it	hi
    10f2:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
    10f4:	fb00 3302 	mla	r3, r0, r2, r3
    10f8:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    10fc:	d304      	bcc.n	1108 <_init_Teensyduino_internal_+0x120>
				ms--;
				if (ms == 0) return;
    10fe:	3e01      	subs	r6, #1
    1100:	d005      	beq.n	110e <_init_Teensyduino_internal_+0x126>
				start += 1000;
    1102:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
    1106:	e7df      	b.n	10c8 <_init_Teensyduino_internal_+0xe0>
			}
			yield();
    1108:	f001 f9a2 	bl	2450 <yield>
    110c:	e7dc      	b.n	10c8 <_init_Teensyduino_internal_+0xe0>
	usb_init();
    110e:	f000 ff1d 	bl	1f4c <usb_init>
	__disable_irq();
    1112:	b672      	cpsid	i
	current = SYST_CVR;
    1114:	4b29      	ldr	r3, [pc, #164]	; (11bc <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1116:	4a2a      	ldr	r2, [pc, #168]	; (11c0 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
    1118:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
    111a:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    111c:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
    111e:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    1120:	0152      	lsls	r2, r2, #5
    1122:	d502      	bpl.n	112a <_init_Teensyduino_internal_+0x142>
    1124:	2b32      	cmp	r3, #50	; 0x32
    1126:	bf88      	it	hi
    1128:	3401      	addhi	r4, #1
	return count * 1000 + current / (F_CPU / 1000000);
    112a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
    112e:	4f25      	ldr	r7, [pc, #148]	; (11c4 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
    1130:	f8df 9088 	ldr.w	r9, [pc, #136]	; 11bc <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1134:	f8df 8088 	ldr.w	r8, [pc, #136]	; 11c0 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
    1138:	33bf      	adds	r3, #191	; 0xbf
    113a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    113e:	fba7 1303 	umull	r1, r3, r7, r3
    1142:	fb02 f404 	mul.w	r4, r2, r4
    1146:	eb04 1493 	add.w	r4, r4, r3, lsr #6
    114a:	f44f 76af 	mov.w	r6, #350	; 0x15e
	__disable_irq();
    114e:	b672      	cpsid	i
	current = SYST_CVR;
    1150:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
    1154:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1156:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
    115a:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
    115c:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
    1160:	33bf      	adds	r3, #191	; 0xbf
    1162:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    1166:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
    116a:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
    116e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    1172:	d002      	beq.n	117a <_init_Teensyduino_internal_+0x192>
    1174:	2932      	cmp	r1, #50	; 0x32
    1176:	bf88      	it	hi
    1178:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
    117a:	fb00 3302 	mla	r3, r0, r2, r3
    117e:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    1182:	d304      	bcc.n	118e <_init_Teensyduino_internal_+0x1a6>
				if (ms == 0) return;
    1184:	3e01      	subs	r6, #1
    1186:	d005      	beq.n	1194 <_init_Teensyduino_internal_+0x1ac>
				start += 1000;
    1188:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
    118c:	e7df      	b.n	114e <_init_Teensyduino_internal_+0x166>
			yield();
    118e:	f001 f95f 	bl	2450 <yield>
    1192:	e7dc      	b.n	114e <_init_Teensyduino_internal_+0x166>
    1194:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    1198:	e000e108 	.word	0xe000e108
    119c:	40038004 	.word	0x40038004
    11a0:	40038014 	.word	0x40038014
    11a4:	40038024 	.word	0x40038024
    11a8:	4003802c 	.word	0x4003802c
    11ac:	4003801c 	.word	0x4003801c
    11b0:	40038034 	.word	0x40038034
    11b4:	400b8000 	.word	0x400b8000
    11b8:	1fff9390 	.word	0x1fff9390
    11bc:	e000e018 	.word	0xe000e018
    11c0:	e000ed04 	.word	0xe000ed04
    11c4:	88888889 	.word	0x88888889
    11c8:	40038008 	.word	0x40038008
    11cc:	4003800c 	.word	0x4003800c

000011d0 <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
    11d0:	2821      	cmp	r0, #33	; 0x21
    11d2:	d820      	bhi.n	1216 <pinMode+0x46>
	config = portConfigRegister(pin);
    11d4:	4a1b      	ldr	r2, [pc, #108]	; (1244 <pinMode+0x74>)
    11d6:	eb02 03c0 	add.w	r3, r2, r0, lsl #3
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
    11da:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
    11dc:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
    11de:	d00f      	beq.n	1200 <pinMode+0x30>
    11e0:	2904      	cmp	r1, #4
    11e2:	d01d      	beq.n	1220 <pinMode+0x50>
		*portModeRegister(pin) = 0;
    11e4:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
    11e8:	2200      	movs	r2, #0
    11ea:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
		if (mode == INPUT) {
    11ee:	b199      	cbz	r1, 1218 <pinMode+0x48>
		} else if (mode == INPUT_PULLUP) {
    11f0:	2902      	cmp	r1, #2
    11f2:	d022      	beq.n	123a <pinMode+0x6a>
		} else if (mode == INPUT_PULLDOWN) {
    11f4:	2903      	cmp	r1, #3
    11f6:	d10d      	bne.n	1214 <pinMode+0x44>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
    11f8:	f44f 7281 	mov.w	r2, #258	; 0x102
    11fc:	601a      	str	r2, [r3, #0]
    11fe:	4770      	bx	lr
		*portModeRegister(pin) = 1;
    1200:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    1204:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
    1208:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    120c:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
    120e:	681a      	ldr	r2, [r3, #0]
    1210:	f022 0220 	bic.w	r2, r2, #32
    1214:	601a      	str	r2, [r3, #0]
    1216:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
    1218:	f44f 7280 	mov.w	r2, #256	; 0x100
    121c:	601a      	str	r2, [r3, #0]
    121e:	4770      	bx	lr
		*portModeRegister(pin) = 1;
    1220:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    1224:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
    1228:	2001      	movs	r0, #1
    122a:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
    122e:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
    1230:	681a      	ldr	r2, [r3, #0]
    1232:	f042 0220 	orr.w	r2, r2, #32
    1236:	601a      	str	r2, [r3, #0]
    1238:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
    123a:	f240 1203 	movw	r2, #259	; 0x103
    123e:	601a      	str	r2, [r3, #0]
    1240:	4770      	bx	lr
    1242:	bf00      	nop
    1244:	00003c48 	.word	0x00003c48

00001248 <delay>:
{
    1248:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    124c:	4605      	mov	r5, r0
	__disable_irq();
    124e:	b672      	cpsid	i
	count = systick_millis_count;
    1250:	4f20      	ldr	r7, [pc, #128]	; (12d4 <delay+0x8c>)
	current = SYST_CVR;
    1252:	4b21      	ldr	r3, [pc, #132]	; (12d8 <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1254:	4a21      	ldr	r2, [pc, #132]	; (12dc <delay+0x94>)
	current = SYST_CVR;
    1256:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
    1258:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    125a:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
    125c:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    125e:	0152      	lsls	r2, r2, #5
    1260:	d502      	bpl.n	1268 <delay+0x20>
    1262:	2b32      	cmp	r3, #50	; 0x32
    1264:	bf88      	it	hi
    1266:	3401      	addhi	r4, #1
	if (ms > 0) {
    1268:	b395      	cbz	r5, 12d0 <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
    126a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
    126e:	4e1c      	ldr	r6, [pc, #112]	; (12e0 <delay+0x98>)
	current = SYST_CVR;
    1270:	f8df 9064 	ldr.w	r9, [pc, #100]	; 12d8 <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1274:	f8df 8064 	ldr.w	r8, [pc, #100]	; 12dc <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
    1278:	33bf      	adds	r3, #191	; 0xbf
    127a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    127e:	fba6 1303 	umull	r1, r3, r6, r3
    1282:	fb02 f404 	mul.w	r4, r2, r4
    1286:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
    128a:	b672      	cpsid	i
	current = SYST_CVR;
    128c:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
    1290:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
    1292:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
    1296:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
    1298:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
    129c:	33bf      	adds	r3, #191	; 0xbf
    129e:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    12a2:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
    12a6:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
    12aa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
    12ae:	d002      	beq.n	12b6 <delay+0x6e>
    12b0:	2932      	cmp	r1, #50	; 0x32
    12b2:	bf88      	it	hi
    12b4:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
    12b6:	fb00 3302 	mla	r3, r0, r2, r3
    12ba:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    12be:	d304      	bcc.n	12ca <delay+0x82>
				if (ms == 0) return;
    12c0:	3d01      	subs	r5, #1
    12c2:	d005      	beq.n	12d0 <delay+0x88>
				start += 1000;
    12c4:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
    12c8:	e7df      	b.n	128a <delay+0x42>
			yield();
    12ca:	f001 f8c1 	bl	2450 <yield>
		}
    12ce:	e7dc      	b.n	128a <delay+0x42>
    12d0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    12d4:	1fff9390 	.word	0x1fff9390
    12d8:	e000e018 	.word	0xe000e018
    12dc:	e000ed04 	.word	0xe000ed04
    12e0:	88888889 	.word	0x88888889

000012e4 <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
    12e4:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    12e6:	2b03      	cmp	r3, #3
    12e8:	d814      	bhi.n	1314 <usb_rx+0x30>
	__disable_irq();
    12ea:	b672      	cpsid	i
	ret = rx_first[endpoint];
    12ec:	490a      	ldr	r1, [pc, #40]	; (1318 <usb_rx+0x34>)
    12ee:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
    12f2:	b168      	cbz	r0, 1310 <usb_rx+0x2c>
{
    12f4:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
    12f6:	4c09      	ldr	r4, [pc, #36]	; (131c <usb_rx+0x38>)
    12f8:	8805      	ldrh	r5, [r0, #0]
    12fa:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
    12fe:	6846      	ldr	r6, [r0, #4]
    1300:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
    1304:	1b52      	subs	r2, r2, r5
    1306:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
    130a:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
    130c:	bc70      	pop	{r4, r5, r6}
    130e:	4770      	bx	lr
	__enable_irq();
    1310:	b662      	cpsie	i
}
    1312:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    1314:	2000      	movs	r0, #0
    1316:	4770      	bx	lr
    1318:	1fff93ec 	.word	0x1fff93ec
    131c:	1fff9670 	.word	0x1fff9670

00001320 <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
    1320:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
    1322:	2803      	cmp	r0, #3
    1324:	d80b      	bhi.n	133e <usb_tx_packet_count+0x1e>
	__disable_irq();
    1326:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
    1328:	4b07      	ldr	r3, [pc, #28]	; (1348 <usb_tx_packet_count+0x28>)
    132a:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
    132e:	b143      	cbz	r3, 1342 <usb_tx_packet_count+0x22>
    1330:	2000      	movs	r0, #0
    1332:	685b      	ldr	r3, [r3, #4]
    1334:	3001      	adds	r0, #1
    1336:	2b00      	cmp	r3, #0
    1338:	d1fb      	bne.n	1332 <usb_tx_packet_count+0x12>
	__enable_irq();
    133a:	b662      	cpsie	i
	return count;
    133c:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
    133e:	2000      	movs	r0, #0
}
    1340:	4770      	bx	lr
	uint32_t count=0;
    1342:	4618      	mov	r0, r3
    1344:	e7f9      	b.n	133a <usb_tx_packet_count+0x1a>
    1346:	bf00      	nop
    1348:	1fff9440 	.word	0x1fff9440

0000134c <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
    134c:	b430      	push	{r4, r5}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
    134e:	b672      	cpsid	i
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1350:	4a2b      	ldr	r2, [pc, #172]	; (1400 <usb_rx_memory+0xb4>)
    1352:	7813      	ldrb	r3, [r2, #0]
    1354:	071d      	lsls	r5, r3, #28
    1356:	d506      	bpl.n	1366 <usb_rx_memory+0x1a>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1358:	4b2a      	ldr	r3, [pc, #168]	; (1404 <usb_rx_memory+0xb8>)
    135a:	6a19      	ldr	r1, [r3, #32]
    135c:	2900      	cmp	r1, #0
    135e:	d036      	beq.n	13ce <usb_rx_memory+0x82>
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
    1360:	6a99      	ldr	r1, [r3, #40]	; 0x28
    1362:	2900      	cmp	r1, #0
    1364:	d041      	beq.n	13ea <usb_rx_memory+0x9e>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1366:	7853      	ldrb	r3, [r2, #1]
    1368:	071c      	lsls	r4, r3, #28
    136a:	d506      	bpl.n	137a <usb_rx_memory+0x2e>
			if (table[index(i, RX, EVEN)].desc == 0) {
    136c:	4b25      	ldr	r3, [pc, #148]	; (1404 <usb_rx_memory+0xb8>)
    136e:	6c19      	ldr	r1, [r3, #64]	; 0x40
    1370:	2900      	cmp	r1, #0
    1372:	d03e      	beq.n	13f2 <usb_rx_memory+0xa6>
			if (table[index(i, RX, ODD)].desc == 0) {
    1374:	6c99      	ldr	r1, [r3, #72]	; 0x48
    1376:	2900      	cmp	r1, #0
    1378:	d039      	beq.n	13ee <usb_rx_memory+0xa2>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    137a:	7893      	ldrb	r3, [r2, #2]
    137c:	0719      	lsls	r1, r3, #28
    137e:	d505      	bpl.n	138c <usb_rx_memory+0x40>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1380:	4b20      	ldr	r3, [pc, #128]	; (1404 <usb_rx_memory+0xb8>)
    1382:	6e19      	ldr	r1, [r3, #96]	; 0x60
    1384:	2900      	cmp	r1, #0
    1386:	d036      	beq.n	13f6 <usb_rx_memory+0xaa>
			if (table[index(i, RX, ODD)].desc == 0) {
    1388:	6e99      	ldr	r1, [r3, #104]	; 0x68
    138a:	b189      	cbz	r1, 13b0 <usb_rx_memory+0x64>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    138c:	78d3      	ldrb	r3, [r2, #3]
    138e:	071b      	lsls	r3, r3, #28
    1390:	d507      	bpl.n	13a2 <usb_rx_memory+0x56>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1392:	4b1c      	ldr	r3, [pc, #112]	; (1404 <usb_rx_memory+0xb8>)
    1394:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
    1398:	b37a      	cbz	r2, 13fa <usb_rx_memory+0xae>
			if (table[index(i, RX, ODD)].desc == 0) {
    139a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
    139e:	2111      	movs	r1, #17
    13a0:	b13a      	cbz	r2, 13b2 <usb_rx_memory+0x66>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
    13a2:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
    13a4:	4b18      	ldr	r3, [pc, #96]	; (1408 <usb_rx_memory+0xbc>)
    13a6:	2200      	movs	r2, #0
    13a8:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
    13aa:	bc30      	pop	{r4, r5}
	usb_free(packet);
    13ac:	f000 be70 	b.w	2090 <usb_free>
			if (table[index(i, RX, ODD)].desc == 0) {
    13b0:	210d      	movs	r1, #13
				usb_rx_memory_needed--;
    13b2:	4c15      	ldr	r4, [pc, #84]	; (1408 <usb_rx_memory+0xbc>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    13b4:	4d15      	ldr	r5, [pc, #84]	; (140c <usb_rx_memory+0xc0>)
				usb_rx_memory_needed--;
    13b6:	7822      	ldrb	r2, [r4, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    13b8:	f843 5031 	str.w	r5, [r3, r1, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
    13bc:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
    13c0:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    13c2:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
    13c4:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    13c6:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    13c8:	b662      	cpsie	i
}
    13ca:	bc30      	pop	{r4, r5}
    13cc:	4770      	bx	lr
			if (table[index(i, RX, EVEN)].desc == 0) {
    13ce:	2204      	movs	r2, #4
				usb_rx_memory_needed--;
    13d0:	4c0d      	ldr	r4, [pc, #52]	; (1408 <usb_rx_memory+0xbc>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    13d2:	4d0f      	ldr	r5, [pc, #60]	; (1410 <usb_rx_memory+0xc4>)
				usb_rx_memory_needed--;
    13d4:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    13d6:	f843 5032 	str.w	r5, [r3, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
    13da:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    13de:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    13e0:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
    13e2:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    13e4:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    13e6:	b662      	cpsie	i
				return;
    13e8:	e7ef      	b.n	13ca <usb_rx_memory+0x7e>
			if (table[index(i, RX, ODD)].desc == 0) {
    13ea:	2105      	movs	r1, #5
    13ec:	e7e1      	b.n	13b2 <usb_rx_memory+0x66>
    13ee:	2109      	movs	r1, #9
    13f0:	e7df      	b.n	13b2 <usb_rx_memory+0x66>
			if (table[index(i, RX, EVEN)].desc == 0) {
    13f2:	2208      	movs	r2, #8
    13f4:	e7ec      	b.n	13d0 <usb_rx_memory+0x84>
    13f6:	220c      	movs	r2, #12
    13f8:	e7ea      	b.n	13d0 <usb_rx_memory+0x84>
    13fa:	2210      	movs	r2, #16
    13fc:	e7e8      	b.n	13d0 <usb_rx_memory+0x84>
    13fe:	bf00      	nop
    1400:	00003d80 	.word	0x00003d80
    1404:	1fff8000 	.word	0x1fff8000
    1408:	1fff9469 	.word	0x1fff9469
    140c:	004000c8 	.word	0x004000c8
    1410:	00400088 	.word	0x00400088

00001414 <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
    1414:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
    1416:	2b03      	cmp	r3, #3
    1418:	d81d      	bhi.n	1456 <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    141a:	4a1b      	ldr	r2, [pc, #108]	; (1488 <usb_tx+0x74>)
    141c:	0140      	lsls	r0, r0, #5
    141e:	f040 0010 	orr.w	r0, r0, #16
{
    1422:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    1424:	4410      	add	r0, r2
	__disable_irq();
    1426:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
    1428:	4c18      	ldr	r4, [pc, #96]	; (148c <usb_tx+0x78>)
    142a:	5ce2      	ldrb	r2, [r4, r3]
    142c:	2a03      	cmp	r2, #3
    142e:	d81b      	bhi.n	1468 <usb_tx+0x54>
    1430:	e8df f002 	tbb	[pc, r2]
    1434:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
    1438:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    143a:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
    143c:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    143e:	f010 0f08 	tst.w	r0, #8
    1442:	bf14      	ite	ne
    1444:	23c8      	movne	r3, #200	; 0xc8
    1446:	2388      	moveq	r3, #136	; 0x88
    1448:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
    144c:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    144e:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
    1450:	6041      	str	r1, [r0, #4]
	__enable_irq();
    1452:	b662      	cpsie	i
}
    1454:	bc30      	pop	{r4, r5}
    1456:	4770      	bx	lr
		b++;
    1458:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
    145a:	2202      	movs	r2, #2
		break;
    145c:	e7ed      	b.n	143a <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
    145e:	2205      	movs	r2, #5
    1460:	e7eb      	b.n	143a <usb_tx+0x26>
		b++;
    1462:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
    1464:	2204      	movs	r2, #4
		break;
    1466:	e7e8      	b.n	143a <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
    1468:	4a09      	ldr	r2, [pc, #36]	; (1490 <usb_tx+0x7c>)
    146a:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    146e:	b138      	cbz	r0, 1480 <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
    1470:	4a08      	ldr	r2, [pc, #32]	; (1494 <usb_tx+0x80>)
    1472:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    1476:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
    1478:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
    147c:	b662      	cpsie	i
		return;
    147e:	e7e9      	b.n	1454 <usb_tx+0x40>
			tx_first[endpoint] = packet;
    1480:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    1484:	4a03      	ldr	r2, [pc, #12]	; (1494 <usb_tx+0x80>)
    1486:	e7f7      	b.n	1478 <usb_tx+0x64>
    1488:	1fff8000 	.word	0x1fff8000
    148c:	1fff9478 	.word	0x1fff9478
    1490:	1fff9440 	.word	0x1fff9440
    1494:	1fff9450 	.word	0x1fff9450

00001498 <usb_isr>:
}



void usb_isr(void)
{
    1498:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
    149c:	f8df b30c 	ldr.w	fp, [pc, #780]	; 17ac <usb_isr+0x314>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
    14a0:	f8df a30c 	ldr.w	sl, [pc, #780]	; 17b0 <usb_isr+0x318>
{
    14a4:	b087      	sub	sp, #28
    14a6:	e044      	b.n	1532 <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
    14a8:	4fab      	ldr	r7, [pc, #684]	; (1758 <usb_isr+0x2c0>)
    14aa:	ea4f 0893 	mov.w	r8, r3, lsr #2
    14ae:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
    14b2:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    14b4:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
    14b8:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
    14bc:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    14be:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
    14c2:	f003 04ff 	and.w	r4, r3, #255	; 0xff
    14c6:	2b00      	cmp	r3, #0
    14c8:	f040 8102 	bne.w	16d0 <usb_isr+0x238>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
    14cc:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
    14d0:	0c1b      	lsrs	r3, r3, #16
    14d2:	b299      	uxth	r1, r3
    14d4:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
    14d8:	2b00      	cmp	r3, #0
    14da:	f000 80f0 	beq.w	16be <usb_isr+0x226>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
    14de:	4b9f      	ldr	r3, [pc, #636]	; (175c <usb_isr+0x2c4>)
					packet->index = 0;
    14e0:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    14e4:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    14e8:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    14ec:	2a00      	cmp	r2, #0
    14ee:	f000 82c5 	beq.w	1a7c <usb_isr+0x5e4>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    14f2:	4d9b      	ldr	r5, [pc, #620]	; (1760 <usb_isr+0x2c8>)
    14f4:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    14f8:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    14fa:	4c9a      	ldr	r4, [pc, #616]	; (1764 <usb_isr+0x2cc>)
					rx_last[endpoint] = packet;
    14fc:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    1500:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    1504:	4419      	add	r1, r3
    1506:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    150a:	f000 fda1 	bl	2050 <usb_malloc>
					if (packet) {
    150e:	2800      	cmp	r0, #0
    1510:	f000 82ad 	beq.w	1a6e <usb_isr+0x5d6>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    1514:	4a94      	ldr	r2, [pc, #592]	; (1768 <usb_isr+0x2d0>)
    1516:	4b95      	ldr	r3, [pc, #596]	; (176c <usb_isr+0x2d4>)
    1518:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    151c:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    1520:	bf18      	it	ne
    1522:	4613      	movne	r3, r2
						b->addr = packet->buf;
    1524:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    1528:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    152c:	2308      	movs	r3, #8
    152e:	f88b 3000 	strb.w	r3, [fp]
	status = USB0_ISTAT;
    1532:	f89b 4000 	ldrb.w	r4, [fp]
    1536:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    1538:	0761      	lsls	r1, r4, #29
    153a:	d51a      	bpl.n	1572 <usb_isr+0xda>
		if (usb_configuration) {
    153c:	4b8c      	ldr	r3, [pc, #560]	; (1770 <usb_isr+0x2d8>)
    153e:	781b      	ldrb	r3, [r3, #0]
    1540:	b1a3      	cbz	r3, 156c <usb_isr+0xd4>
			t = usb_reboot_timer;
    1542:	498c      	ldr	r1, [pc, #560]	; (1774 <usb_isr+0x2dc>)
    1544:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    1546:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    154a:	b122      	cbz	r2, 1556 <usb_isr+0xbe>
				usb_reboot_timer = --t;
    154c:	3b01      	subs	r3, #1
    154e:	b2db      	uxtb	r3, r3
    1550:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    1552:	b903      	cbnz	r3, 1556 <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    1554:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    1556:	4988      	ldr	r1, [pc, #544]	; (1778 <usb_isr+0x2e0>)
    1558:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    155a:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    155e:	b12a      	cbz	r2, 156c <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    1560:	3b01      	subs	r3, #1
    1562:	b2db      	uxtb	r3, r3
    1564:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    1566:	2b00      	cmp	r3, #0
    1568:	f000 8257 	beq.w	1a1a <usb_isr+0x582>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    156c:	2304      	movs	r3, #4
    156e:	f88b 3000 	strb.w	r3, [fp]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    1572:	f004 0308 	and.w	r3, r4, #8
    1576:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    157a:	2b00      	cmp	r3, #0
    157c:	f000 80cc 	beq.w	1718 <usb_isr+0x280>
		stat = USB0_STAT;
    1580:	f89a 3000 	ldrb.w	r3, [sl]
    1584:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    1586:	091e      	lsrs	r6, r3, #4
    1588:	d18e      	bne.n	14a8 <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    158a:	089c      	lsrs	r4, r3, #2
    158c:	f8df 91c8 	ldr.w	r9, [pc, #456]	; 1758 <usb_isr+0x2c0>
	switch (pid) {
    1590:	f859 2034 	ldr.w	r2, [r9, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    1594:	eb09 01c4 	add.w	r1, r9, r4, lsl #3
	switch (pid) {
    1598:	f3c2 0283 	ubfx	r2, r2, #2, #4
    159c:	3a01      	subs	r2, #1
	buf = b->addr;
    159e:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    15a0:	2a0c      	cmp	r2, #12
    15a2:	f200 8088 	bhi.w	16b6 <usb_isr+0x21e>
    15a6:	e8df f002 	tbb	[pc, r2]
    15aa:	7c7c      	.short	0x7c7c
    15ac:	86868686 	.word	0x86868686
    15b0:	86478686 	.word	0x86478686
    15b4:	8686      	.short	0x8686
    15b6:	07          	.byte	0x07
    15b7:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    15b8:	6808      	ldr	r0, [r1, #0]
    15ba:	4d70      	ldr	r5, [pc, #448]	; (177c <usb_isr+0x2e4>)
		setup.word2 = *(uint32_t *)(buf + 4);
    15bc:	684a      	ldr	r2, [r1, #4]
		ep0_tx_ptr = NULL;
    15be:	4f70      	ldr	r7, [pc, #448]	; (1780 <usb_isr+0x2e8>)
		ep0_tx_data_toggle = 1;
    15c0:	4e70      	ldr	r6, [pc, #448]	; (1784 <usb_isr+0x2ec>)
		setup.word1 = *(uint32_t *)(buf);
    15c2:	6028      	str	r0, [r5, #0]
	switch (setup.wRequestAndType) {
    15c4:	b281      	uxth	r1, r0
    15c6:	f240 6081 	movw	r0, #1665	; 0x681
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    15ca:	4b67      	ldr	r3, [pc, #412]	; (1768 <usb_isr+0x2d0>)
		setup.word2 = *(uint32_t *)(buf + 4);
    15cc:	606a      	str	r2, [r5, #4]
		ep0_tx_data_toggle = 1;
    15ce:	f04f 0e01 	mov.w	lr, #1
		ep0_tx_ptr = NULL;
    15d2:	2200      	movs	r2, #0
	switch (setup.wRequestAndType) {
    15d4:	4281      	cmp	r1, r0
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    15d6:	f849 3034 	str.w	r3, [r9, r4, lsl #3]
		ep0_tx_ptr = NULL;
    15da:	603a      	str	r2, [r7, #0]
		table[index(0, TX, EVEN)].desc = 0;
    15dc:	f8c9 2010 	str.w	r2, [r9, #16]
		table[index(0, TX, ODD)].desc = 0;
    15e0:	f8c9 2018 	str.w	r2, [r9, #24]
		ep0_tx_data_toggle = 1;
    15e4:	f886 e000 	strb.w	lr, [r6]
		table[index(0, TX, EVEN)].desc = 0;
    15e8:	4c5b      	ldr	r4, [pc, #364]	; (1758 <usb_isr+0x2c0>)
	switch (setup.wRequestAndType) {
    15ea:	f200 80e3 	bhi.w	17b4 <usb_isr+0x31c>
    15ee:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    15f2:	f080 8346 	bcs.w	1c82 <usb_isr+0x7ea>
    15f6:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    15fa:	f000 82fc 	beq.w	1bf6 <usb_isr+0x75e>
    15fe:	f200 828d 	bhi.w	1b1c <usb_isr+0x684>
    1602:	2980      	cmp	r1, #128	; 0x80
    1604:	f000 8377 	beq.w	1cf6 <usb_isr+0x85e>
    1608:	2982      	cmp	r1, #130	; 0x82
    160a:	f040 82fa 	bne.w	1c02 <usb_isr+0x76a>
    160e:	88a9      	ldrh	r1, [r5, #4]
    1610:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    1614:	2904      	cmp	r1, #4
    1616:	f200 82f4 	bhi.w	1c02 <usb_isr+0x76a>
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    161a:	485b      	ldr	r0, [pc, #364]	; (1788 <usb_isr+0x2f0>)
		reply_buffer[0] = 0;
    161c:	4c5b      	ldr	r4, [pc, #364]	; (178c <usb_isr+0x2f4>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    161e:	0089      	lsls	r1, r1, #2
    1620:	4408      	add	r0, r1
		reply_buffer[0] = 0;
    1622:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1624:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1626:	7802      	ldrb	r2, [r0, #0]
    1628:	0793      	lsls	r3, r2, #30
    162a:	f140 8455 	bpl.w	1ed8 <usb_isr+0xa40>
    162e:	f884 e000 	strb.w	lr, [r4]
		datalen = 2;
    1632:	f04f 0e02 	mov.w	lr, #2
    1636:	e342      	b.n	1cbe <usb_isr+0x826>
		data = ep0_tx_ptr;
    1638:	4f51      	ldr	r7, [pc, #324]	; (1780 <usb_isr+0x2e8>)
    163a:	683a      	ldr	r2, [r7, #0]
		if (data) {
    163c:	b332      	cbz	r2, 168c <usb_isr+0x1f4>
			size = ep0_tx_len;
    163e:	4b54      	ldr	r3, [pc, #336]	; (1790 <usb_isr+0x2f8>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1640:	4e50      	ldr	r6, [pc, #320]	; (1784 <usb_isr+0x2ec>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1642:	4954      	ldr	r1, [pc, #336]	; (1794 <usb_isr+0x2fc>)
			size = ep0_tx_len;
    1644:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1646:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1648:	780d      	ldrb	r5, [r1, #0]
    164a:	2840      	cmp	r0, #64	; 0x40
    164c:	4686      	mov	lr, r0
    164e:	f045 0802 	orr.w	r8, r5, #2
    1652:	bf28      	it	cs
    1654:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1658:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    165a:	f084 0401 	eor.w	r4, r4, #1
    165e:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    1660:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1664:	bf0c      	ite	eq
    1666:	2488      	moveq	r4, #136	; 0x88
    1668:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    166a:	eb09 06c8 	add.w	r6, r9, r8, lsl #3
			ep0_tx_len -= size;
    166e:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    1670:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1674:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1678:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    167a:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    167c:	f849 4038 	str.w	r4, [r9, r8, lsl #3]
			data += size;
    1680:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    1682:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    1684:	2800      	cmp	r0, #0
    1686:	f000 8145 	beq.w	1914 <usb_isr+0x47c>
    168a:	603a      	str	r2, [r7, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    168c:	4b3b      	ldr	r3, [pc, #236]	; (177c <usb_isr+0x2e4>)
    168e:	881a      	ldrh	r2, [r3, #0]
    1690:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    1694:	d10f      	bne.n	16b6 <usb_isr+0x21e>
			setup.bRequest = 0;
    1696:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    1698:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    169a:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    169c:	4b3e      	ldr	r3, [pc, #248]	; (1798 <usb_isr+0x300>)
    169e:	701a      	strb	r2, [r3, #0]
    16a0:	e009      	b.n	16b6 <usb_isr+0x21e>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    16a2:	4a36      	ldr	r2, [pc, #216]	; (177c <usb_isr+0x2e4>)
    16a4:	8810      	ldrh	r0, [r2, #0]
    16a6:	f242 0221 	movw	r2, #8225	; 0x2021
    16aa:	4290      	cmp	r0, r2
    16ac:	f000 8137 	beq.w	191e <usb_isr+0x486>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    16b0:	4a2d      	ldr	r2, [pc, #180]	; (1768 <usb_isr+0x2d0>)
    16b2:	f849 2034 	str.w	r2, [r9, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    16b6:	4a39      	ldr	r2, [pc, #228]	; (179c <usb_isr+0x304>)
    16b8:	2301      	movs	r3, #1
    16ba:	7013      	strb	r3, [r2, #0]
    16bc:	e736      	b.n	152c <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    16be:	4a2a      	ldr	r2, [pc, #168]	; (1768 <usb_isr+0x2d0>)
    16c0:	4b2a      	ldr	r3, [pc, #168]	; (176c <usb_isr+0x2d4>)
    16c2:	f019 0f08 	tst.w	r9, #8
    16c6:	bf18      	it	ne
    16c8:	4613      	movne	r3, r2
    16ca:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    16ce:	e72d      	b.n	152c <usb_isr+0x94>
				usb_free(packet);
    16d0:	f000 fcde 	bl	2090 <usb_free>
				packet = tx_first[endpoint];
    16d4:	4a32      	ldr	r2, [pc, #200]	; (17a0 <usb_isr+0x308>)
					switch (tx_state[endpoint]) {
    16d6:	4933      	ldr	r1, [pc, #204]	; (17a4 <usb_isr+0x30c>)
				packet = tx_first[endpoint];
    16d8:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    16dc:	2b00      	cmp	r3, #0
    16de:	f000 81d1 	beq.w	1a84 <usb_isr+0x5ec>
					tx_first[endpoint] = packet->next;
    16e2:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    16e4:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    16e6:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    16ea:	f103 0208 	add.w	r2, r3, #8
    16ee:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    16f2:	2c03      	cmp	r4, #3
    16f4:	d805      	bhi.n	1702 <usb_isr+0x26a>
    16f6:	e8df f004 	tbb	[pc, r4]
    16fa:	022c      	.short	0x022c
    16fc:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    16fe:	2202      	movs	r2, #2
    1700:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    1702:	881a      	ldrh	r2, [r3, #0]
    1704:	f019 0f08 	tst.w	r9, #8
    1708:	bf0c      	ite	eq
    170a:	2388      	moveq	r3, #136	; 0x88
    170c:	23c8      	movne	r3, #200	; 0xc8
    170e:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    1712:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    1716:	e709      	b.n	152c <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    1718:	07e0      	lsls	r0, r4, #31
    171a:	f100 8181 	bmi.w	1a20 <usb_isr+0x588>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    171e:	0621      	lsls	r1, r4, #24
    1720:	f100 81f2 	bmi.w	1b08 <usb_isr+0x670>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1724:	07a2      	lsls	r2, r4, #30
    1726:	d506      	bpl.n	1736 <usb_isr+0x29e>
		uint8_t err = USB0_ERRSTAT;
    1728:	4a1f      	ldr	r2, [pc, #124]	; (17a8 <usb_isr+0x310>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    172a:	4920      	ldr	r1, [pc, #128]	; (17ac <usb_isr+0x314>)
		uint8_t err = USB0_ERRSTAT;
    172c:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    172e:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    1730:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    1732:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1734:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    1736:	06e3      	lsls	r3, r4, #27
    1738:	d502      	bpl.n	1740 <usb_isr+0x2a8>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    173a:	4b1c      	ldr	r3, [pc, #112]	; (17ac <usb_isr+0x314>)
    173c:	2210      	movs	r2, #16
    173e:	701a      	strb	r2, [r3, #0]
	}

}
    1740:	b007      	add	sp, #28
    1742:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    1746:	2204      	movs	r2, #4
    1748:	558a      	strb	r2, [r1, r6]
						break;
    174a:	e7da      	b.n	1702 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    174c:	2205      	movs	r2, #5
    174e:	558a      	strb	r2, [r1, r6]
						break;
    1750:	e7d7      	b.n	1702 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    1752:	2203      	movs	r2, #3
    1754:	558a      	strb	r2, [r1, r6]
						break;
    1756:	e7d4      	b.n	1702 <usb_isr+0x26a>
    1758:	1fff8000 	.word	0x1fff8000
    175c:	1fff93ec 	.word	0x1fff93ec
    1760:	1fff9398 	.word	0x1fff9398
    1764:	1fff9670 	.word	0x1fff9670
    1768:	004000c8 	.word	0x004000c8
    176c:	00400088 	.word	0x00400088
    1770:	1fff9474 	.word	0x1fff9474
    1774:	1fff93fd 	.word	0x1fff93fd
    1778:	1fff947c 	.word	0x1fff947c
    177c:	1fff9460 	.word	0x1fff9460
    1780:	1fff9394 	.word	0x1fff9394
    1784:	1fff93fc 	.word	0x1fff93fc
    1788:	400720c0 	.word	0x400720c0
    178c:	1fff946c 	.word	0x1fff946c
    1790:	1fff93a8 	.word	0x1fff93a8
    1794:	1fff9468 	.word	0x1fff9468
    1798:	40072098 	.word	0x40072098
    179c:	40072094 	.word	0x40072094
    17a0:	1fff9440 	.word	0x1fff9440
    17a4:	1fff9478 	.word	0x1fff9478
    17a8:	40072088 	.word	0x40072088
    17ac:	40072080 	.word	0x40072080
    17b0:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    17b4:	f242 0021 	movw	r0, #8225	; 0x2021
    17b8:	4281      	cmp	r1, r0
    17ba:	f000 812a 	beq.w	1a12 <usb_isr+0x57a>
    17be:	f200 80d8 	bhi.w	1972 <usb_isr+0x4da>
    17c2:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    17c6:	f000 8276 	beq.w	1cb6 <usb_isr+0x81e>
    17ca:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    17ce:	f040 8218 	bne.w	1c02 <usb_isr+0x76a>
			if (table[i].desc & BDT_OWN) {
    17d2:	6a22      	ldr	r2, [r4, #32]
		usb_configuration = setup.wValue;
    17d4:	49b3      	ldr	r1, [pc, #716]	; (1aa4 <usb_isr+0x60c>)
    17d6:	78a8      	ldrb	r0, [r5, #2]
    17d8:	7008      	strb	r0, [r1, #0]
			if (table[i].desc & BDT_OWN) {
    17da:	0612      	lsls	r2, r2, #24
    17dc:	f100 8337 	bmi.w	1e4e <usb_isr+0x9b6>
    17e0:	f8d9 2028 	ldr.w	r2, [r9, #40]	; 0x28
    17e4:	49b0      	ldr	r1, [pc, #704]	; (1aa8 <usb_isr+0x610>)
    17e6:	0613      	lsls	r3, r2, #24
    17e8:	f100 832c 	bmi.w	1e44 <usb_isr+0x9ac>
    17ec:	f8d9 2030 	ldr.w	r2, [r9, #48]	; 0x30
    17f0:	49ad      	ldr	r1, [pc, #692]	; (1aa8 <usb_isr+0x610>)
    17f2:	0615      	lsls	r5, r2, #24
    17f4:	f100 82ff 	bmi.w	1df6 <usb_isr+0x95e>
    17f8:	f8d9 2038 	ldr.w	r2, [r9, #56]	; 0x38
    17fc:	49aa      	ldr	r1, [pc, #680]	; (1aa8 <usb_isr+0x610>)
    17fe:	0614      	lsls	r4, r2, #24
    1800:	f100 82f4 	bmi.w	1dec <usb_isr+0x954>
    1804:	f8d9 2040 	ldr.w	r2, [r9, #64]	; 0x40
    1808:	49a7      	ldr	r1, [pc, #668]	; (1aa8 <usb_isr+0x610>)
    180a:	0610      	lsls	r0, r2, #24
    180c:	f100 8347 	bmi.w	1e9e <usb_isr+0xa06>
    1810:	f8d9 2048 	ldr.w	r2, [r9, #72]	; 0x48
    1814:	49a4      	ldr	r1, [pc, #656]	; (1aa8 <usb_isr+0x610>)
    1816:	0612      	lsls	r2, r2, #24
    1818:	f100 833c 	bmi.w	1e94 <usb_isr+0x9fc>
    181c:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
    1820:	49a1      	ldr	r1, [pc, #644]	; (1aa8 <usb_isr+0x610>)
    1822:	0613      	lsls	r3, r2, #24
    1824:	f100 8331 	bmi.w	1e8a <usb_isr+0x9f2>
    1828:	f8d9 2058 	ldr.w	r2, [r9, #88]	; 0x58
    182c:	499e      	ldr	r1, [pc, #632]	; (1aa8 <usb_isr+0x610>)
    182e:	0615      	lsls	r5, r2, #24
    1830:	f100 8326 	bmi.w	1e80 <usb_isr+0x9e8>
    1834:	f8d9 2060 	ldr.w	r2, [r9, #96]	; 0x60
    1838:	499b      	ldr	r1, [pc, #620]	; (1aa8 <usb_isr+0x610>)
    183a:	0614      	lsls	r4, r2, #24
    183c:	f100 831b 	bmi.w	1e76 <usb_isr+0x9de>
    1840:	f8d9 2068 	ldr.w	r2, [r9, #104]	; 0x68
    1844:	4998      	ldr	r1, [pc, #608]	; (1aa8 <usb_isr+0x610>)
    1846:	0610      	lsls	r0, r2, #24
    1848:	f100 8310 	bmi.w	1e6c <usb_isr+0x9d4>
    184c:	f8d9 2070 	ldr.w	r2, [r9, #112]	; 0x70
    1850:	4995      	ldr	r1, [pc, #596]	; (1aa8 <usb_isr+0x610>)
    1852:	0612      	lsls	r2, r2, #24
    1854:	f100 8305 	bmi.w	1e62 <usb_isr+0x9ca>
    1858:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    185c:	4992      	ldr	r1, [pc, #584]	; (1aa8 <usb_isr+0x610>)
    185e:	0613      	lsls	r3, r2, #24
    1860:	f100 82fa 	bmi.w	1e58 <usb_isr+0x9c0>
    1864:	f8d9 2080 	ldr.w	r2, [r9, #128]	; 0x80
    1868:	498f      	ldr	r1, [pc, #572]	; (1aa8 <usb_isr+0x610>)
    186a:	0615      	lsls	r5, r2, #24
    186c:	f100 832e 	bmi.w	1ecc <usb_isr+0xa34>
    1870:	f8d9 2088 	ldr.w	r2, [r9, #136]	; 0x88
    1874:	498c      	ldr	r1, [pc, #560]	; (1aa8 <usb_isr+0x610>)
    1876:	0614      	lsls	r4, r2, #24
    1878:	f100 8322 	bmi.w	1ec0 <usb_isr+0xa28>
    187c:	f8d9 2090 	ldr.w	r2, [r9, #144]	; 0x90
    1880:	4989      	ldr	r1, [pc, #548]	; (1aa8 <usb_isr+0x610>)
    1882:	0610      	lsls	r0, r2, #24
    1884:	f100 8316 	bmi.w	1eb4 <usb_isr+0xa1c>
    1888:	f8d9 2098 	ldr.w	r2, [r9, #152]	; 0x98
    188c:	4986      	ldr	r1, [pc, #536]	; (1aa8 <usb_isr+0x610>)
    188e:	0612      	lsls	r2, r2, #24
    1890:	f100 830a 	bmi.w	1ea8 <usb_isr+0xa10>
    1894:	4885      	ldr	r0, [pc, #532]	; (1aac <usb_isr+0x614>)
    1896:	4a86      	ldr	r2, [pc, #536]	; (1ab0 <usb_isr+0x618>)
    1898:	4986      	ldr	r1, [pc, #536]	; (1ab4 <usb_isr+0x61c>)
    189a:	9001      	str	r0, [sp, #4]
    189c:	4886      	ldr	r0, [pc, #536]	; (1ab8 <usb_isr+0x620>)
    189e:	4c87      	ldr	r4, [pc, #540]	; (1abc <usb_isr+0x624>)
    18a0:	4d87      	ldr	r5, [pc, #540]	; (1ac0 <usb_isr+0x628>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    18a2:	9402      	str	r4, [sp, #8]
{
    18a4:	2300      	movs	r3, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    18a6:	9704      	str	r7, [sp, #16]
    18a8:	9605      	str	r6, [sp, #20]
    18aa:	4680      	mov	r8, r0
    18ac:	461c      	mov	r4, r3
    18ae:	460f      	mov	r7, r1
    18b0:	4616      	mov	r6, r2
    18b2:	9503      	str	r5, [sp, #12]
			p = rx_first[i];
    18b4:	6830      	ldr	r0, [r6, #0]
			while (p) {
    18b6:	b128      	cbz	r0, 18c4 <usb_isr+0x42c>
				n = p->next;
    18b8:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    18ba:	f000 fbe9 	bl	2090 <usb_free>
			while (p) {
    18be:	4628      	mov	r0, r5
    18c0:	2d00      	cmp	r5, #0
    18c2:	d1f9      	bne.n	18b8 <usb_isr+0x420>
			rx_first[i] = NULL;
    18c4:	2300      	movs	r3, #0
    18c6:	6033      	str	r3, [r6, #0]
			rx_last[i] = NULL;
    18c8:	9b03      	ldr	r3, [sp, #12]
			p = tx_first[i];
    18ca:	6838      	ldr	r0, [r7, #0]
			rx_last[i] = NULL;
    18cc:	461a      	mov	r2, r3
    18ce:	2300      	movs	r3, #0
    18d0:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
			while (p) {
    18d4:	b128      	cbz	r0, 18e2 <usb_isr+0x44a>
				n = p->next;
    18d6:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    18d8:	f000 fbda 	bl	2090 <usb_free>
			while (p) {
    18dc:	4628      	mov	r0, r5
    18de:	2d00      	cmp	r5, #0
    18e0:	d1f9      	bne.n	18d6 <usb_isr+0x43e>
			tx_first[i] = NULL;
    18e2:	2200      	movs	r2, #0
    18e4:	603a      	str	r2, [r7, #0]
			tx_last[i] = NULL;
    18e6:	9a01      	ldr	r2, [sp, #4]
			switch (tx_state[i]) {
    18e8:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    18ec:	4611      	mov	r1, r2
    18ee:	2200      	movs	r2, #0
    18f0:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    18f4:	9a02      	ldr	r2, [sp, #8]
			tx_last[i] = NULL;
    18f6:	9101      	str	r1, [sp, #4]
			switch (tx_state[i]) {
    18f8:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    18fa:	f04f 0100 	mov.w	r1, #0
    18fe:	f822 1014 	strh.w	r1, [r2, r4, lsl #1]
			switch (tx_state[i]) {
    1902:	2b03      	cmp	r3, #3
    1904:	f200 812b 	bhi.w	1b5e <usb_isr+0x6c6>
    1908:	e8df f013 	tbh	[pc, r3, lsl #1]
    190c:	01250170 	.word	0x01250170
    1910:	01250170 	.word	0x01250170
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    1914:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1918:	bf18      	it	ne
    191a:	2200      	movne	r2, #0
    191c:	e6b5      	b.n	168a <usb_isr+0x1f2>
				*dst++ = *buf++;
    191e:	4a69      	ldr	r2, [pc, #420]	; (1ac4 <usb_isr+0x62c>)
    1920:	780d      	ldrb	r5, [r1, #0]
    1922:	7848      	ldrb	r0, [r1, #1]
    1924:	7015      	strb	r5, [r2, #0]
    1926:	7050      	strb	r0, [r2, #1]
    1928:	788d      	ldrb	r5, [r1, #2]
    192a:	78c8      	ldrb	r0, [r1, #3]
    192c:	7095      	strb	r5, [r2, #2]
    192e:	70d0      	strb	r0, [r2, #3]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1930:	6810      	ldr	r0, [r2, #0]
				*dst++ = *buf++;
    1932:	790d      	ldrb	r5, [r1, #4]
    1934:	7115      	strb	r5, [r2, #4]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1936:	2886      	cmp	r0, #134	; 0x86
				*dst++ = *buf++;
    1938:	794d      	ldrb	r5, [r1, #5]
    193a:	7989      	ldrb	r1, [r1, #6]
    193c:	7155      	strb	r5, [r2, #5]
    193e:	7191      	strb	r1, [r2, #6]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1940:	f000 819b 	beq.w	1c7a <usb_isr+0x7e2>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1944:	4960      	ldr	r1, [pc, #384]	; (1ac8 <usb_isr+0x630>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1946:	4e61      	ldr	r6, [pc, #388]	; (1acc <usb_isr+0x634>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1948:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    194a:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    194c:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1950:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1952:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    1956:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1958:	bf0c      	ite	eq
    195a:	2188      	moveq	r1, #136	; 0x88
    195c:	21c8      	movne	r1, #200	; 0xc8
    195e:	f849 1032 	str.w	r1, [r9, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1962:	eb09 02c2 	add.w	r2, r9, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    1966:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    196a:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    196c:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    196e:	6051      	str	r1, [r2, #4]
    1970:	e69e      	b.n	16b0 <usb_isr+0x218>
	switch (setup.wRequestAndType) {
    1972:	f242 2021 	movw	r0, #8737	; 0x2221
    1976:	4281      	cmp	r1, r0
    1978:	f040 81cb 	bne.w	1d12 <usb_isr+0x87a>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    197c:	4b54      	ldr	r3, [pc, #336]	; (1ad0 <usb_isr+0x638>)
    197e:	4c55      	ldr	r4, [pc, #340]	; (1ad4 <usb_isr+0x63c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    1980:	4955      	ldr	r1, [pc, #340]	; (1ad8 <usb_isr+0x640>)
    1982:	78a8      	ldrb	r0, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    1984:	681d      	ldr	r5, [r3, #0]
    1986:	6025      	str	r5, [r4, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    1988:	f8cd e004 	str.w	lr, [sp, #4]
    198c:	7008      	strb	r0, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    198e:	2000      	movs	r0, #0
    1990:	9002      	str	r0, [sp, #8]
    1992:	4680      	mov	r8, r0
    1994:	4684      	mov	ip, r0
    1996:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1998:	494b      	ldr	r1, [pc, #300]	; (1ac8 <usb_isr+0x630>)
    199a:	780d      	ldrb	r5, [r1, #0]
    199c:	f045 0e02 	orr.w	lr, r5, #2
    19a0:	eb09 03ce 	add.w	r3, r9, lr, lsl #3
    19a4:	9303      	str	r3, [sp, #12]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19a6:	9b01      	ldr	r3, [sp, #4]
    19a8:	2b00      	cmp	r3, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    19aa:	9b03      	ldr	r3, [sp, #12]
    19ac:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19ae:	bf0c      	ite	eq
    19b0:	2488      	moveq	r4, #136	; 0x88
    19b2:	24c8      	movne	r4, #200	; 0xc8
    19b4:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    19b8:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19bc:	f849 303e 	str.w	r3, [r9, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    19c0:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    19c2:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19c4:	f8df e0e0 	ldr.w	lr, [pc, #224]	; 1aa8 <usb_isr+0x610>
	ep0_tx_data_toggle ^= 1;
    19c8:	4b40      	ldr	r3, [pc, #256]	; (1acc <usb_isr+0x634>)
	ep0_tx_bdt_bank ^= 1;
    19ca:	f8df 80fc 	ldr.w	r8, [pc, #252]	; 1ac8 <usb_isr+0x630>
	if (datalen == 0 && size < EP0_SIZE) return;
    19ce:	2800      	cmp	r0, #0
    19d0:	f040 811e 	bne.w	1c10 <usb_isr+0x778>
    19d4:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    19d8:	d11b      	bne.n	1a12 <usb_isr+0x57a>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    19da:	f044 0c02 	orr.w	ip, r4, #2
    19de:	eb09 03cc 	add.w	r3, r9, ip, lsl #3
    19e2:	9c02      	ldr	r4, [sp, #8]
    19e4:	f8df e0c0 	ldr.w	lr, [pc, #192]	; 1aa8 <usb_isr+0x610>
    19e8:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19ea:	2a00      	cmp	r2, #0
    19ec:	f040 8126 	bne.w	1c3c <usb_isr+0x7a4>
    19f0:	0402      	lsls	r2, r0, #16
    19f2:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	ep0_tx_data_toggle ^= 1;
    19f6:	f89d 3004 	ldrb.w	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19fa:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
	data += size;
    19fe:	4404      	add	r4, r0
	ep0_tx_data_toggle ^= 1;
    1a00:	7033      	strb	r3, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1a02:	700d      	strb	r5, [r1, #0]
	data += size;
    1a04:	4623      	mov	r3, r4
	if (datalen == 0 && size < EP0_SIZE) return;
    1a06:	2840      	cmp	r0, #64	; 0x40
    1a08:	d103      	bne.n	1a12 <usb_isr+0x57a>
    1a0a:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    1a0c:	4a33      	ldr	r2, [pc, #204]	; (1adc <usb_isr+0x644>)
	ep0_tx_ptr = data;
    1a0e:	603b      	str	r3, [r7, #0]
	ep0_tx_len = datalen;
    1a10:	8010      	strh	r0, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1a12:	4a33      	ldr	r2, [pc, #204]	; (1ae0 <usb_isr+0x648>)
    1a14:	2301      	movs	r3, #1
    1a16:	7013      	strb	r3, [r2, #0]
    1a18:	e64d      	b.n	16b6 <usb_isr+0x21e>
				if (t == 0) usb_serial_flush_callback();
    1a1a:	f000 fcf5 	bl	2408 <usb_serial_flush_callback>
    1a1e:	e5a5      	b.n	156c <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1a20:	4b21      	ldr	r3, [pc, #132]	; (1aa8 <usb_isr+0x610>)
		USB0_CTL = USB_CTL_ODDRST;
    1a22:	482f      	ldr	r0, [pc, #188]	; (1ae0 <usb_isr+0x648>)
		ep0_tx_bdt_bank = 0;
    1a24:	4928      	ldr	r1, [pc, #160]	; (1ac8 <usb_isr+0x630>)
		table[index(0, TX, EVEN)].desc = 0;
    1a26:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    1a28:	f04f 0e02 	mov.w	lr, #2
    1a2c:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1a30:	4f2c      	ldr	r7, [pc, #176]	; (1ae4 <usb_isr+0x64c>)
		ep0_tx_bdt_bank = 0;
    1a32:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1a34:	492c      	ldr	r1, [pc, #176]	; (1ae8 <usb_isr+0x650>)
    1a36:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    1a38:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    1a3a:	4e2c      	ldr	r6, [pc, #176]	; (1aec <usb_isr+0x654>)
		USB0_ISTAT = 0xFF;
    1a3c:	4d2c      	ldr	r5, [pc, #176]	; (1af0 <usb_isr+0x658>)
		USB0_ADDR = 0;
    1a3e:	4c2d      	ldr	r4, [pc, #180]	; (1af4 <usb_isr+0x65c>)
		table[index(0, TX, ODD)].desc = 0;
    1a40:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1a42:	210d      	movs	r1, #13
    1a44:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    1a46:	21ff      	movs	r1, #255	; 0xff
    1a48:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    1a4a:	f8df e0b8 	ldr.w	lr, [pc, #184]	; 1b04 <usb_isr+0x66c>
		USB0_ISTAT = 0xFF;
    1a4e:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    1a50:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1a52:	4d29      	ldr	r5, [pc, #164]	; (1af8 <usb_isr+0x660>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1a54:	4a29      	ldr	r2, [pc, #164]	; (1afc <usb_isr+0x664>)
		USB0_ERREN = 0xFF;
    1a56:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1a5a:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    1a5c:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1a5e:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1a62:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    1a64:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1a66:	60da      	str	r2, [r3, #12]
}
    1a68:	b007      	add	sp, #28
    1a6a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    1a6e:	4a24      	ldr	r2, [pc, #144]	; (1b00 <usb_isr+0x668>)
						b->desc = 0;
    1a70:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    1a74:	7813      	ldrb	r3, [r2, #0]
    1a76:	3301      	adds	r3, #1
    1a78:	7013      	strb	r3, [r2, #0]
    1a7a:	e557      	b.n	152c <usb_isr+0x94>
						rx_first[endpoint] = packet;
    1a7c:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    1a80:	4d0f      	ldr	r5, [pc, #60]	; (1ac0 <usb_isr+0x628>)
    1a82:	e53a      	b.n	14fa <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    1a84:	5d8b      	ldrb	r3, [r1, r6]
    1a86:	2b03      	cmp	r3, #3
    1a88:	f200 80f0 	bhi.w	1c6c <usb_isr+0x7d4>
    1a8c:	a201      	add	r2, pc, #4	; (adr r2, 1a94 <usb_isr+0x5fc>)
    1a8e:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1a92:	bf00      	nop
    1a94:	0000152d 	.word	0x0000152d
    1a98:	0000152d 	.word	0x0000152d
    1a9c:	00001b51 	.word	0x00001b51
    1aa0:	00001b4b 	.word	0x00001b4b
    1aa4:	1fff9474 	.word	0x1fff9474
    1aa8:	1fff8000 	.word	0x1fff8000
    1aac:	1fff9450 	.word	0x1fff9450
    1ab0:	1fff93ec 	.word	0x1fff93ec
    1ab4:	1fff9440 	.word	0x1fff9440
    1ab8:	1fff9478 	.word	0x1fff9478
    1abc:	1fff9670 	.word	0x1fff9670
    1ac0:	1fff9398 	.word	0x1fff9398
    1ac4:	1fff9678 	.word	0x1fff9678
    1ac8:	1fff9468 	.word	0x1fff9468
    1acc:	1fff93fc 	.word	0x1fff93fc
    1ad0:	1fff9390 	.word	0x1fff9390
    1ad4:	1fff9680 	.word	0x1fff9680
    1ad8:	1fff948c 	.word	0x1fff948c
    1adc:	1fff93a8 	.word	0x1fff93a8
    1ae0:	40072094 	.word	0x40072094
    1ae4:	400720c0 	.word	0x400720c0
    1ae8:	00400088 	.word	0x00400088
    1aec:	40072088 	.word	0x40072088
    1af0:	40072080 	.word	0x40072080
    1af4:	40072098 	.word	0x40072098
    1af8:	1fff93ac 	.word	0x1fff93ac
    1afc:	1fff9400 	.word	0x1fff9400
    1b00:	1fff9469 	.word	0x1fff9469
    1b04:	4007208c 	.word	0x4007208c
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1b08:	49bd      	ldr	r1, [pc, #756]	; (1e00 <usb_isr+0x968>)
		USB0_ISTAT = USB_ISTAT_STALL;
    1b0a:	4bbe      	ldr	r3, [pc, #760]	; (1e04 <usb_isr+0x96c>)
    1b0c:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1b0e:	200d      	movs	r0, #13
    1b10:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    1b12:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1b14:	07a2      	lsls	r2, r4, #30
    1b16:	f57f ae0e 	bpl.w	1736 <usb_isr+0x29e>
    1b1a:	e605      	b.n	1728 <usb_isr+0x290>
	switch (setup.wRequestAndType) {
    1b1c:	f240 3202 	movw	r2, #770	; 0x302
    1b20:	4291      	cmp	r1, r2
    1b22:	f040 80ee 	bne.w	1d02 <usb_isr+0x86a>
    1b26:	88a9      	ldrh	r1, [r5, #4]
    1b28:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1b2c:	2904      	cmp	r1, #4
    1b2e:	d868      	bhi.n	1c02 <usb_isr+0x76a>
    1b30:	886a      	ldrh	r2, [r5, #2]
    1b32:	2a00      	cmp	r2, #0
    1b34:	d165      	bne.n	1c02 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    1b36:	48b2      	ldr	r0, [pc, #712]	; (1e00 <usb_isr+0x968>)
    1b38:	f8cd e004 	str.w	lr, [sp, #4]
    1b3c:	0089      	lsls	r1, r1, #2
    1b3e:	4408      	add	r0, r1
    1b40:	7801      	ldrb	r1, [r0, #0]
    1b42:	f041 0102 	orr.w	r1, r1, #2
    1b46:	7001      	strb	r1, [r0, #0]
    1b48:	e721      	b.n	198e <usb_isr+0x4f6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1b4a:	2301      	movs	r3, #1
    1b4c:	558b      	strb	r3, [r1, r6]
						break;
    1b4e:	e4ed      	b.n	152c <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1b50:	2300      	movs	r3, #0
    1b52:	558b      	strb	r3, [r1, r6]
						break;
    1b54:	e4ea      	b.n	152c <usb_isr+0x94>
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1b56:	f04f 0301 	mov.w	r3, #1
    1b5a:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    1b5e:	3401      	adds	r4, #1
    1b60:	2c04      	cmp	r4, #4
    1b62:	f106 0604 	add.w	r6, r6, #4
    1b66:	f107 0704 	add.w	r7, r7, #4
    1b6a:	f108 0801 	add.w	r8, r8, #1
    1b6e:	f47f aea1 	bne.w	18b4 <usb_isr+0x41c>
			epconf = *cfg++;
    1b72:	4ca5      	ldr	r4, [pc, #660]	; (1e08 <usb_isr+0x970>)
			*reg = epconf;
    1b74:	4ba5      	ldr	r3, [pc, #660]	; (1e0c <usb_isr+0x974>)
			epconf = *cfg++;
    1b76:	7822      	ldrb	r2, [r4, #0]
		usb_rx_memory_needed = 0;
    1b78:	4da5      	ldr	r5, [pc, #660]	; (1e10 <usb_isr+0x978>)
    1b7a:	9f04      	ldr	r7, [sp, #16]
    1b7c:	9e05      	ldr	r6, [sp, #20]
    1b7e:	2100      	movs	r1, #0
    1b80:	7029      	strb	r1, [r5, #0]
			*reg = epconf;
    1b82:	701a      	strb	r2, [r3, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    1b84:	0713      	lsls	r3, r2, #28
    1b86:	f100 8105 	bmi.w	1d94 <usb_isr+0x8fc>
			epconf = *cfg++;
    1b8a:	7862      	ldrb	r2, [r4, #1]
			*reg = epconf;
    1b8c:	49a1      	ldr	r1, [pc, #644]	; (1e14 <usb_isr+0x97c>)
			table[index(i, TX, EVEN)].desc = 0;
    1b8e:	f8df 8290 	ldr.w	r8, [pc, #656]	; 1e20 <usb_isr+0x988>
			*reg = epconf;
    1b92:	700a      	strb	r2, [r1, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    1b94:	0710      	lsls	r0, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1b96:	f04f 0100 	mov.w	r1, #0
    1b9a:	f8c9 1030 	str.w	r1, [r9, #48]	; 0x30
			table[index(i, TX, ODD)].desc = 0;
    1b9e:	f8c9 1038 	str.w	r1, [r9, #56]	; 0x38
			if (epconf & USB_ENDPT_EPRXEN) {
    1ba2:	f100 80e1 	bmi.w	1d68 <usb_isr+0x8d0>
			*reg = epconf;
    1ba6:	499c      	ldr	r1, [pc, #624]	; (1e18 <usb_isr+0x980>)
			epconf = *cfg++;
    1ba8:	78a2      	ldrb	r2, [r4, #2]
			*reg = epconf;
    1baa:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    1bac:	2100      	movs	r1, #0
    1bae:	f8c9 1050 	str.w	r1, [r9, #80]	; 0x50
			table[index(i, TX, ODD)].desc = 0;
    1bb2:	f8c9 1058 	str.w	r1, [r9, #88]	; 0x58
			if (epconf & USB_ENDPT_EPRXEN) {
    1bb6:	0711      	lsls	r1, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1bb8:	f8df 8264 	ldr.w	r8, [pc, #612]	; 1e20 <usb_isr+0x988>
			if (epconf & USB_ENDPT_EPRXEN) {
    1bbc:	f100 8100 	bmi.w	1dc0 <usb_isr+0x928>
			epconf = *cfg++;
    1bc0:	78e2      	ldrb	r2, [r4, #3]
			*reg = epconf;
    1bc2:	4996      	ldr	r1, [pc, #600]	; (1e1c <usb_isr+0x984>)
			table[index(i, TX, EVEN)].desc = 0;
    1bc4:	4c96      	ldr	r4, [pc, #600]	; (1e20 <usb_isr+0x988>)
			*reg = epconf;
    1bc6:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    1bc8:	2100      	movs	r1, #0
			if (epconf & USB_ENDPT_EPRXEN) {
    1bca:	0712      	lsls	r2, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1bcc:	f8c9 1070 	str.w	r1, [r9, #112]	; 0x70
			table[index(i, TX, ODD)].desc = 0;
    1bd0:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
			if (epconf & USB_ENDPT_EPRXEN) {
    1bd4:	f100 80b0 	bmi.w	1d38 <usb_isr+0x8a0>
    1bd8:	7833      	ldrb	r3, [r6, #0]
    1bda:	9301      	str	r3, [sp, #4]
			table[index(i, TX, EVEN)].desc = 0;
    1bdc:	2100      	movs	r1, #0
    1bde:	f083 0201 	eor.w	r2, r3, #1
    1be2:	f8c9 1090 	str.w	r1, [r9, #144]	; 0x90
			table[index(i, TX, ODD)].desc = 0;
    1be6:	f8c9 1098 	str.w	r1, [r9, #152]	; 0x98
    1bea:	e6d0      	b.n	198e <usb_isr+0x4f6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1bec:	f04f 0300 	mov.w	r3, #0
    1bf0:	f888 3000 	strb.w	r3, [r8]
    1bf4:	e7b3      	b.n	1b5e <usb_isr+0x6c6>
    1bf6:	88a9      	ldrh	r1, [r5, #4]
    1bf8:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1bfc:	2904      	cmp	r1, #4
    1bfe:	f240 808d 	bls.w	1d1c <usb_isr+0x884>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1c02:	4a7f      	ldr	r2, [pc, #508]	; (1e00 <usb_isr+0x968>)
    1c04:	230f      	movs	r3, #15
    1c06:	7013      	strb	r3, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1c08:	4a86      	ldr	r2, [pc, #536]	; (1e24 <usb_isr+0x98c>)
    1c0a:	2301      	movs	r3, #1
    1c0c:	7013      	strb	r3, [r2, #0]
    1c0e:	e552      	b.n	16b6 <usb_isr+0x21e>
	if (size > EP0_SIZE) size = EP0_SIZE;
    1c10:	2840      	cmp	r0, #64	; 0x40
    1c12:	f67f aee2 	bls.w	19da <usb_isr+0x542>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1c16:	f044 0402 	orr.w	r4, r4, #2
    1c1a:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    1c1e:	9e02      	ldr	r6, [sp, #8]
    1c20:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c22:	b1ba      	cbz	r2, 1c54 <usb_isr+0x7bc>
	ep0_tx_data_toggle ^= 1;
    1c24:	f89d 1004 	ldrb.w	r1, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c28:	4a7f      	ldr	r2, [pc, #508]	; (1e28 <usb_isr+0x990>)
	ep0_tx_data_toggle ^= 1;
    1c2a:	7019      	strb	r1, [r3, #0]
	data += size;
    1c2c:	4633      	mov	r3, r6
    1c2e:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    1c30:	f888 5000 	strb.w	r5, [r8]
	data += size;
    1c34:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c36:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1c3a:	e6e7      	b.n	1a0c <usb_isr+0x574>
	ep0_tx_data_toggle ^= 1;
    1c3c:	f89d 3004 	ldrb.w	r3, [sp, #4]
    1c40:	7033      	strb	r3, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c42:	0402      	lsls	r2, r0, #16
	data += size;
    1c44:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_bdt_bank ^= 1;
    1c46:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c48:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	data += size;
    1c4c:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c4e:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
    1c52:	e6d8      	b.n	1a06 <usb_isr+0x56e>
	ep0_tx_data_toggle ^= 1;
    1c54:	f89d 1004 	ldrb.w	r1, [sp, #4]
    1c58:	7019      	strb	r1, [r3, #0]
	data += size;
    1c5a:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c5c:	4a73      	ldr	r2, [pc, #460]	; (1e2c <usb_isr+0x994>)
	ep0_tx_bdt_bank ^= 1;
    1c5e:	f888 5000 	strb.w	r5, [r8]
    1c62:	3840      	subs	r0, #64	; 0x40
	data += size;
    1c64:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1c66:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1c6a:	e6cf      	b.n	1a0c <usb_isr+0x574>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    1c6c:	f019 0f08 	tst.w	r9, #8
    1c70:	bf0c      	ite	eq
    1c72:	2302      	moveq	r3, #2
    1c74:	2303      	movne	r3, #3
    1c76:	558b      	strb	r3, [r1, r6]
						break;
    1c78:	e458      	b.n	152c <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1c7a:	4a6d      	ldr	r2, [pc, #436]	; (1e30 <usb_isr+0x998>)
    1c7c:	210f      	movs	r1, #15
    1c7e:	7011      	strb	r1, [r2, #0]
    1c80:	e660      	b.n	1944 <usb_isr+0x4ac>
			if (list->addr == NULL) break;
    1c82:	4a6c      	ldr	r2, [pc, #432]	; (1e34 <usb_isr+0x99c>)
    1c84:	6854      	ldr	r4, [r2, #4]
    1c86:	2c00      	cmp	r4, #0
    1c88:	d0bb      	beq.n	1c02 <usb_isr+0x76a>
    1c8a:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    1c8c:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    1c90:	e003      	b.n	1c9a <usb_isr+0x802>
		for (list = usb_descriptor_list; 1; list++) {
    1c92:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    1c94:	6854      	ldr	r4, [r2, #4]
    1c96:	2c00      	cmp	r4, #0
    1c98:	d0b3      	beq.n	1c02 <usb_isr+0x76a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    1c9a:	8813      	ldrh	r3, [r2, #0]
    1c9c:	4283      	cmp	r3, r0
    1c9e:	d1f8      	bne.n	1c92 <usb_isr+0x7fa>
    1ca0:	8853      	ldrh	r3, [r2, #2]
    1ca2:	4573      	cmp	r3, lr
    1ca4:	d1f5      	bne.n	1c92 <usb_isr+0x7fa>
				if ((setup.wValue >> 8) == 3) {
    1ca6:	0a00      	lsrs	r0, r0, #8
    1ca8:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    1caa:	bf0c      	ite	eq
    1cac:	f894 e000 	ldrbeq.w	lr, [r4]
					datalen = list->length;
    1cb0:	f8b2 e008 	ldrhne.w	lr, [r2, #8]
    1cb4:	e003      	b.n	1cbe <usb_isr+0x826>
		reply_buffer[0] = usb_configuration;
    1cb6:	4a60      	ldr	r2, [pc, #384]	; (1e38 <usb_isr+0x9a0>)
    1cb8:	4c60      	ldr	r4, [pc, #384]	; (1e3c <usb_isr+0x9a4>)
    1cba:	7812      	ldrb	r2, [r2, #0]
    1cbc:	7022      	strb	r2, [r4, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1cbe:	88e8      	ldrh	r0, [r5, #6]
    1cc0:	4570      	cmp	r0, lr
    1cc2:	f080 8131 	bcs.w	1f28 <usb_isr+0xa90>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1cc6:	495e      	ldr	r1, [pc, #376]	; (1e40 <usb_isr+0x9a8>)
    1cc8:	780d      	ldrb	r5, [r1, #0]
    1cca:	2840      	cmp	r0, #64	; 0x40
    1ccc:	4684      	mov	ip, r0
    1cce:	f045 0e02 	orr.w	lr, r5, #2
    1cd2:	bf28      	it	cs
    1cd4:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    1cd8:	eb04 030c 	add.w	r3, r4, ip
    1cdc:	eb09 02ce 	add.w	r2, r9, lr, lsl #3
    1ce0:	9302      	str	r3, [sp, #8]
    1ce2:	2301      	movs	r3, #1
    1ce4:	6054      	str	r4, [r2, #4]
    1ce6:	ebcc 0000 	rsb	r0, ip, r0
    1cea:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1cee:	2200      	movs	r2, #0
    1cf0:	9301      	str	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1cf2:	24c8      	movs	r4, #200	; 0xc8
    1cf4:	e65e      	b.n	19b4 <usb_isr+0x51c>
		reply_buffer[0] = 0;
    1cf6:	4c51      	ldr	r4, [pc, #324]	; (1e3c <usb_isr+0x9a4>)
		datalen = 2;
    1cf8:	f04f 0e02 	mov.w	lr, #2
		reply_buffer[0] = 0;
    1cfc:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1cfe:	7062      	strb	r2, [r4, #1]
    1d00:	e7dd      	b.n	1cbe <usb_isr+0x826>
	switch (setup.wRequestAndType) {
    1d02:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    1d06:	f47f af7c 	bne.w	1c02 <usb_isr+0x76a>
    1d0a:	2301      	movs	r3, #1
    1d0c:	2200      	movs	r2, #0
    1d0e:	9301      	str	r3, [sp, #4]
    1d10:	e63d      	b.n	198e <usb_isr+0x4f6>
    1d12:	f242 3221 	movw	r2, #8993	; 0x2321
    1d16:	4291      	cmp	r1, r2
    1d18:	d0f7      	beq.n	1d0a <usb_isr+0x872>
    1d1a:	e772      	b.n	1c02 <usb_isr+0x76a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1d1c:	886a      	ldrh	r2, [r5, #2]
    1d1e:	2a00      	cmp	r2, #0
    1d20:	f47f af6f 	bne.w	1c02 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    1d24:	4836      	ldr	r0, [pc, #216]	; (1e00 <usb_isr+0x968>)
    1d26:	f8cd e004 	str.w	lr, [sp, #4]
    1d2a:	0089      	lsls	r1, r1, #2
    1d2c:	4408      	add	r0, r1
    1d2e:	7801      	ldrb	r1, [r0, #0]
    1d30:	f021 0102 	bic.w	r1, r1, #2
    1d34:	7001      	strb	r1, [r0, #0]
    1d36:	e62a      	b.n	198e <usb_isr+0x4f6>
				p = usb_malloc();
    1d38:	f000 f98a 	bl	2050 <usb_malloc>
				if (p) {
    1d3c:	2800      	cmp	r0, #0
    1d3e:	f000 80e6 	beq.w	1f0e <usb_isr+0xa76>
					table[index(i, RX, EVEN)].addr = p->buf;
    1d42:	3008      	adds	r0, #8
    1d44:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1d48:	4838      	ldr	r0, [pc, #224]	; (1e2c <usb_isr+0x994>)
    1d4a:	f8c9 0080 	str.w	r0, [r9, #128]	; 0x80
				p = usb_malloc();
    1d4e:	f000 f97f 	bl	2050 <usb_malloc>
    1d52:	4a33      	ldr	r2, [pc, #204]	; (1e20 <usb_isr+0x988>)
				if (p) {
    1d54:	2800      	cmp	r0, #0
    1d56:	f000 80d4 	beq.w	1f02 <usb_isr+0xa6a>
					table[index(i, RX, ODD)].addr = p->buf;
    1d5a:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1d5c:	4932      	ldr	r1, [pc, #200]	; (1e28 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1d5e:	f8c2 008c 	str.w	r0, [r2, #140]	; 0x8c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1d62:	f8c2 1088 	str.w	r1, [r2, #136]	; 0x88
    1d66:	e737      	b.n	1bd8 <usb_isr+0x740>
				p = usb_malloc();
    1d68:	f000 f972 	bl	2050 <usb_malloc>
				if (p) {
    1d6c:	2800      	cmp	r0, #0
    1d6e:	f000 80bb 	beq.w	1ee8 <usb_isr+0xa50>
					table[index(i, RX, EVEN)].addr = p->buf;
    1d72:	3008      	adds	r0, #8
    1d74:	f8c8 0044 	str.w	r0, [r8, #68]	; 0x44
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1d78:	482c      	ldr	r0, [pc, #176]	; (1e2c <usb_isr+0x994>)
    1d7a:	f8c9 0040 	str.w	r0, [r9, #64]	; 0x40
				p = usb_malloc();
    1d7e:	f000 f967 	bl	2050 <usb_malloc>
    1d82:	4a27      	ldr	r2, [pc, #156]	; (1e20 <usb_isr+0x988>)
				if (p) {
    1d84:	2800      	cmp	r0, #0
    1d86:	f000 80aa 	beq.w	1ede <usb_isr+0xa46>
					table[index(i, RX, ODD)].addr = p->buf;
    1d8a:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1d8c:	4926      	ldr	r1, [pc, #152]	; (1e28 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1d8e:	64d0      	str	r0, [r2, #76]	; 0x4c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1d90:	6491      	str	r1, [r2, #72]	; 0x48
    1d92:	e708      	b.n	1ba6 <usb_isr+0x70e>
				p = usb_malloc();
    1d94:	f000 f95c 	bl	2050 <usb_malloc>
				if (p) {
    1d98:	2800      	cmp	r0, #0
    1d9a:	f000 80c1 	beq.w	1f20 <usb_isr+0xa88>
					table[index(i, RX, EVEN)].addr = p->buf;
    1d9e:	3008      	adds	r0, #8
    1da0:	f8c9 0024 	str.w	r0, [r9, #36]	; 0x24
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1da4:	4821      	ldr	r0, [pc, #132]	; (1e2c <usb_isr+0x994>)
    1da6:	f8c9 0020 	str.w	r0, [r9, #32]
				p = usb_malloc();
    1daa:	f000 f951 	bl	2050 <usb_malloc>
    1dae:	4a1c      	ldr	r2, [pc, #112]	; (1e20 <usb_isr+0x988>)
				if (p) {
    1db0:	2800      	cmp	r0, #0
    1db2:	f000 80b0 	beq.w	1f16 <usb_isr+0xa7e>
					table[index(i, RX, ODD)].addr = p->buf;
    1db6:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1db8:	491b      	ldr	r1, [pc, #108]	; (1e28 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1dba:	62d0      	str	r0, [r2, #44]	; 0x2c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1dbc:	6291      	str	r1, [r2, #40]	; 0x28
    1dbe:	e6e4      	b.n	1b8a <usb_isr+0x6f2>
				p = usb_malloc();
    1dc0:	f000 f946 	bl	2050 <usb_malloc>
				if (p) {
    1dc4:	2800      	cmp	r0, #0
    1dc6:	f000 8098 	beq.w	1efa <usb_isr+0xa62>
					table[index(i, RX, EVEN)].addr = p->buf;
    1dca:	3008      	adds	r0, #8
    1dcc:	f8c8 0064 	str.w	r0, [r8, #100]	; 0x64
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1dd0:	4816      	ldr	r0, [pc, #88]	; (1e2c <usb_isr+0x994>)
    1dd2:	f8c9 0060 	str.w	r0, [r9, #96]	; 0x60
				p = usb_malloc();
    1dd6:	f000 f93b 	bl	2050 <usb_malloc>
    1dda:	4a11      	ldr	r2, [pc, #68]	; (1e20 <usb_isr+0x988>)
				if (p) {
    1ddc:	2800      	cmp	r0, #0
    1dde:	f000 8087 	beq.w	1ef0 <usb_isr+0xa58>
					table[index(i, RX, ODD)].addr = p->buf;
    1de2:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1de4:	4910      	ldr	r1, [pc, #64]	; (1e28 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1de6:	66d0      	str	r0, [r2, #108]	; 0x6c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1de8:	6691      	str	r1, [r2, #104]	; 0x68
    1dea:	e6e9      	b.n	1bc0 <usb_isr+0x728>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    1dec:	6bc8      	ldr	r0, [r1, #60]	; 0x3c
    1dee:	3808      	subs	r0, #8
    1df0:	f000 f94e 	bl	2090 <usb_free>
    1df4:	e506      	b.n	1804 <usb_isr+0x36c>
    1df6:	6b48      	ldr	r0, [r1, #52]	; 0x34
    1df8:	3808      	subs	r0, #8
    1dfa:	f000 f949 	bl	2090 <usb_free>
    1dfe:	e4fb      	b.n	17f8 <usb_isr+0x360>
    1e00:	400720c0 	.word	0x400720c0
    1e04:	40072080 	.word	0x40072080
    1e08:	00003d80 	.word	0x00003d80
    1e0c:	400720c4 	.word	0x400720c4
    1e10:	1fff9469 	.word	0x1fff9469
    1e14:	400720c8 	.word	0x400720c8
    1e18:	400720cc 	.word	0x400720cc
    1e1c:	400720d0 	.word	0x400720d0
    1e20:	1fff8000 	.word	0x1fff8000
    1e24:	40072094 	.word	0x40072094
    1e28:	004000c8 	.word	0x004000c8
    1e2c:	00400088 	.word	0x00400088
    1e30:	1fff93fd 	.word	0x1fff93fd
    1e34:	00003d84 	.word	0x00003d84
    1e38:	1fff9474 	.word	0x1fff9474
    1e3c:	1fff946c 	.word	0x1fff946c
    1e40:	1fff9468 	.word	0x1fff9468
    1e44:	6ac8      	ldr	r0, [r1, #44]	; 0x2c
    1e46:	3808      	subs	r0, #8
    1e48:	f000 f922 	bl	2090 <usb_free>
    1e4c:	e4ce      	b.n	17ec <usb_isr+0x354>
    1e4e:	6a60      	ldr	r0, [r4, #36]	; 0x24
    1e50:	3808      	subs	r0, #8
    1e52:	f000 f91d 	bl	2090 <usb_free>
    1e56:	e4c3      	b.n	17e0 <usb_isr+0x348>
    1e58:	6fc8      	ldr	r0, [r1, #124]	; 0x7c
    1e5a:	3808      	subs	r0, #8
    1e5c:	f000 f918 	bl	2090 <usb_free>
    1e60:	e500      	b.n	1864 <usb_isr+0x3cc>
    1e62:	6f48      	ldr	r0, [r1, #116]	; 0x74
    1e64:	3808      	subs	r0, #8
    1e66:	f000 f913 	bl	2090 <usb_free>
    1e6a:	e4f5      	b.n	1858 <usb_isr+0x3c0>
    1e6c:	6ec8      	ldr	r0, [r1, #108]	; 0x6c
    1e6e:	3808      	subs	r0, #8
    1e70:	f000 f90e 	bl	2090 <usb_free>
    1e74:	e4ea      	b.n	184c <usb_isr+0x3b4>
    1e76:	6e48      	ldr	r0, [r1, #100]	; 0x64
    1e78:	3808      	subs	r0, #8
    1e7a:	f000 f909 	bl	2090 <usb_free>
    1e7e:	e4df      	b.n	1840 <usb_isr+0x3a8>
    1e80:	6dc8      	ldr	r0, [r1, #92]	; 0x5c
    1e82:	3808      	subs	r0, #8
    1e84:	f000 f904 	bl	2090 <usb_free>
    1e88:	e4d4      	b.n	1834 <usb_isr+0x39c>
    1e8a:	6d48      	ldr	r0, [r1, #84]	; 0x54
    1e8c:	3808      	subs	r0, #8
    1e8e:	f000 f8ff 	bl	2090 <usb_free>
    1e92:	e4c9      	b.n	1828 <usb_isr+0x390>
    1e94:	6cc8      	ldr	r0, [r1, #76]	; 0x4c
    1e96:	3808      	subs	r0, #8
    1e98:	f000 f8fa 	bl	2090 <usb_free>
    1e9c:	e4be      	b.n	181c <usb_isr+0x384>
    1e9e:	6c48      	ldr	r0, [r1, #68]	; 0x44
    1ea0:	3808      	subs	r0, #8
    1ea2:	f000 f8f5 	bl	2090 <usb_free>
    1ea6:	e4b3      	b.n	1810 <usb_isr+0x378>
    1ea8:	f8d1 009c 	ldr.w	r0, [r1, #156]	; 0x9c
    1eac:	3808      	subs	r0, #8
    1eae:	f000 f8ef 	bl	2090 <usb_free>
    1eb2:	e4ef      	b.n	1894 <usb_isr+0x3fc>
    1eb4:	f8d1 0094 	ldr.w	r0, [r1, #148]	; 0x94
    1eb8:	3808      	subs	r0, #8
    1eba:	f000 f8e9 	bl	2090 <usb_free>
    1ebe:	e4e3      	b.n	1888 <usb_isr+0x3f0>
    1ec0:	f8d1 008c 	ldr.w	r0, [r1, #140]	; 0x8c
    1ec4:	3808      	subs	r0, #8
    1ec6:	f000 f8e3 	bl	2090 <usb_free>
    1eca:	e4d7      	b.n	187c <usb_isr+0x3e4>
    1ecc:	f8d1 0084 	ldr.w	r0, [r1, #132]	; 0x84
    1ed0:	3808      	subs	r0, #8
    1ed2:	f000 f8dd 	bl	2090 <usb_free>
    1ed6:	e4cb      	b.n	1870 <usb_isr+0x3d8>
		datalen = 2;
    1ed8:	f04f 0e02 	mov.w	lr, #2
    1edc:	e6ef      	b.n	1cbe <usb_isr+0x826>
					usb_rx_memory_needed++;
    1ede:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1ee0:	6490      	str	r0, [r2, #72]	; 0x48
					usb_rx_memory_needed++;
    1ee2:	1c4a      	adds	r2, r1, #1
    1ee4:	702a      	strb	r2, [r5, #0]
    1ee6:	e65e      	b.n	1ba6 <usb_isr+0x70e>
					usb_rx_memory_needed++;
    1ee8:	782a      	ldrb	r2, [r5, #0]
    1eea:	3201      	adds	r2, #1
    1eec:	702a      	strb	r2, [r5, #0]
    1eee:	e744      	b.n	1d7a <usb_isr+0x8e2>
					usb_rx_memory_needed++;
    1ef0:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1ef2:	6690      	str	r0, [r2, #104]	; 0x68
					usb_rx_memory_needed++;
    1ef4:	1c4a      	adds	r2, r1, #1
    1ef6:	702a      	strb	r2, [r5, #0]
    1ef8:	e662      	b.n	1bc0 <usb_isr+0x728>
					usb_rx_memory_needed++;
    1efa:	782a      	ldrb	r2, [r5, #0]
    1efc:	3201      	adds	r2, #1
    1efe:	702a      	strb	r2, [r5, #0]
    1f00:	e767      	b.n	1dd2 <usb_isr+0x93a>
					usb_rx_memory_needed++;
    1f02:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1f04:	f8c2 0088 	str.w	r0, [r2, #136]	; 0x88
					usb_rx_memory_needed++;
    1f08:	1c4a      	adds	r2, r1, #1
    1f0a:	702a      	strb	r2, [r5, #0]
    1f0c:	e664      	b.n	1bd8 <usb_isr+0x740>
					usb_rx_memory_needed++;
    1f0e:	782a      	ldrb	r2, [r5, #0]
    1f10:	3201      	adds	r2, #1
    1f12:	702a      	strb	r2, [r5, #0]
    1f14:	e719      	b.n	1d4a <usb_isr+0x8b2>
					usb_rx_memory_needed++;
    1f16:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1f18:	6290      	str	r0, [r2, #40]	; 0x28
					usb_rx_memory_needed++;
    1f1a:	1c4a      	adds	r2, r1, #1
    1f1c:	702a      	strb	r2, [r5, #0]
    1f1e:	e634      	b.n	1b8a <usb_isr+0x6f2>
					usb_rx_memory_needed++;
    1f20:	782a      	ldrb	r2, [r5, #0]
    1f22:	3201      	adds	r2, #1
    1f24:	702a      	strb	r2, [r5, #0]
    1f26:	e73e      	b.n	1da6 <usb_isr+0x90e>
    1f28:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1f2c:	46f4      	mov	ip, lr
    1f2e:	bf28      	it	cs
    1f30:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    1f34:	eb04 030c 	add.w	r3, r4, ip
    1f38:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1f3a:	2301      	movs	r3, #1
    1f3c:	ebcc 000e 	rsb	r0, ip, lr
    1f40:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1f44:	2200      	movs	r2, #0
    1f46:	9301      	str	r3, [sp, #4]
    1f48:	e526      	b.n	1998 <usb_isr+0x500>
    1f4a:	bf00      	nop

00001f4c <usb_init>:



void usb_init(void)
{
    1f4c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    1f4e:	f000 fe59 	bl	2c04 <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    1f52:	4b29      	ldr	r3, [pc, #164]	; (1ff8 <usb_init+0xac>)
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1f54:	4829      	ldr	r0, [pc, #164]	; (1ffc <usb_init+0xb0>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1f56:	4c2a      	ldr	r4, [pc, #168]	; (2000 <usb_init+0xb4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1f58:	4f2a      	ldr	r7, [pc, #168]	; (2004 <usb_init+0xb8>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1f5a:	4d2b      	ldr	r5, [pc, #172]	; (2008 <usb_init+0xbc>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
    1f5c:	f8df c0bc 	ldr.w	ip, [pc, #188]	; 201c <usb_init+0xd0>
	USB0_ERRSTAT = 0xFF;
    1f60:	f8df e0bc 	ldr.w	lr, [pc, #188]	; 2020 <usb_init+0xd4>
	USB0_OTGISTAT = 0xFF;

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    1f64:	4e29      	ldr	r6, [pc, #164]	; (200c <usb_init+0xc0>)
		table[i].desc = 0;
    1f66:	2200      	movs	r2, #0
    1f68:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    1f6a:	605a      	str	r2, [r3, #4]
		table[i].desc = 0;
    1f6c:	609a      	str	r2, [r3, #8]
		table[i].addr = 0;
    1f6e:	60da      	str	r2, [r3, #12]
		table[i].desc = 0;
    1f70:	611a      	str	r2, [r3, #16]
		table[i].addr = 0;
    1f72:	615a      	str	r2, [r3, #20]
		table[i].desc = 0;
    1f74:	619a      	str	r2, [r3, #24]
		table[i].addr = 0;
    1f76:	61da      	str	r2, [r3, #28]
		table[i].desc = 0;
    1f78:	621a      	str	r2, [r3, #32]
		table[i].addr = 0;
    1f7a:	625a      	str	r2, [r3, #36]	; 0x24
		table[i].desc = 0;
    1f7c:	629a      	str	r2, [r3, #40]	; 0x28
		table[i].addr = 0;
    1f7e:	62da      	str	r2, [r3, #44]	; 0x2c
		table[i].desc = 0;
    1f80:	631a      	str	r2, [r3, #48]	; 0x30
		table[i].addr = 0;
    1f82:	635a      	str	r2, [r3, #52]	; 0x34
		table[i].desc = 0;
    1f84:	639a      	str	r2, [r3, #56]	; 0x38
		table[i].addr = 0;
    1f86:	63da      	str	r2, [r3, #60]	; 0x3c
		table[i].desc = 0;
    1f88:	641a      	str	r2, [r3, #64]	; 0x40
		table[i].addr = 0;
    1f8a:	645a      	str	r2, [r3, #68]	; 0x44
		table[i].desc = 0;
    1f8c:	649a      	str	r2, [r3, #72]	; 0x48
		table[i].addr = 0;
    1f8e:	64da      	str	r2, [r3, #76]	; 0x4c
		table[i].desc = 0;
    1f90:	651a      	str	r2, [r3, #80]	; 0x50
		table[i].addr = 0;
    1f92:	655a      	str	r2, [r3, #84]	; 0x54
		table[i].desc = 0;
    1f94:	659a      	str	r2, [r3, #88]	; 0x58
		table[i].addr = 0;
    1f96:	65da      	str	r2, [r3, #92]	; 0x5c
		table[i].desc = 0;
    1f98:	661a      	str	r2, [r3, #96]	; 0x60
		table[i].addr = 0;
    1f9a:	665a      	str	r2, [r3, #100]	; 0x64
		table[i].desc = 0;
    1f9c:	669a      	str	r2, [r3, #104]	; 0x68
		table[i].addr = 0;
    1f9e:	66da      	str	r2, [r3, #108]	; 0x6c
		table[i].desc = 0;
    1fa0:	671a      	str	r2, [r3, #112]	; 0x70
		table[i].addr = 0;
    1fa2:	675a      	str	r2, [r3, #116]	; 0x74
		table[i].desc = 0;
    1fa4:	679a      	str	r2, [r3, #120]	; 0x78
		table[i].addr = 0;
    1fa6:	67da      	str	r2, [r3, #124]	; 0x7c
		table[i].desc = 0;
    1fa8:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1fac:	6801      	ldr	r1, [r0, #0]
		table[i].addr = 0;
    1fae:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1fb2:	f441 2180 	orr.w	r1, r1, #262144	; 0x40000
    1fb6:	6001      	str	r1, [r0, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1fb8:	f3c3 2107 	ubfx	r1, r3, #8, #8
    1fbc:	7021      	strb	r1, [r4, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1fbe:	f3c3 4007 	ubfx	r0, r3, #16, #8
	USB0_OTGISTAT = 0xFF;
    1fc2:	4913      	ldr	r1, [pc, #76]	; (2010 <usb_init+0xc4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1fc4:	7038      	strb	r0, [r7, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1fc6:	0e1b      	lsrs	r3, r3, #24
    1fc8:	702b      	strb	r3, [r5, #0]
	USB0_ISTAT = 0xFF;
    1fca:	23ff      	movs	r3, #255	; 0xff
    1fcc:	f88c 3000 	strb.w	r3, [ip]

	// enable reset interrupt
	USB0_INTEN = USB_INTEN_USBRSTEN;

	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1fd0:	4d10      	ldr	r5, [pc, #64]	; (2014 <usb_init+0xc8>)
	USB0_ERRSTAT = 0xFF;
    1fd2:	f88e 3000 	strb.w	r3, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1fd6:	4810      	ldr	r0, [pc, #64]	; (2018 <usb_init+0xcc>)
	USB0_OTGISTAT = 0xFF;
    1fd8:	700b      	strb	r3, [r1, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    1fda:	2301      	movs	r3, #1
    1fdc:	7033      	strb	r3, [r6, #0]
	USB0_USBCTRL = 0;
    1fde:	f884 2064 	strb.w	r2, [r4, #100]	; 0x64
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1fe2:	2670      	movs	r6, #112	; 0x70
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1fe4:	f44f 7400 	mov.w	r4, #512	; 0x200

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1fe8:	2210      	movs	r2, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    1fea:	f807 3c2c 	strb.w	r3, [r7, #-44]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1fee:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1ff0:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1ff2:	f881 20f8 	strb.w	r2, [r1, #248]	; 0xf8
    1ff6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1ff8:	1fff8000 	.word	0x1fff8000
    1ffc:	40048034 	.word	0x40048034
    2000:	4007209c 	.word	0x4007209c
    2004:	400720b0 	.word	0x400720b0
    2008:	400720b4 	.word	0x400720b4
    200c:	40072094 	.word	0x40072094
    2010:	40072010 	.word	0x40072010
    2014:	e000e449 	.word	0xe000e449
    2018:	e000e108 	.word	0xe000e108
    201c:	40072080 	.word	0x40072080
    2020:	40072088 	.word	0x40072088

00002024 <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    2024:	f000 b8a4 	b.w	2170 <usb_serial_flush_input>

00002028 <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    2028:	f000 b87c 	b.w	2124 <usb_serial_peekchar>

0000202c <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    202c:	f000 b856 	b.w	20dc <usb_serial_getchar>

00002030 <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    2030:	f000 b890 	b.w	2154 <usb_serial_available>

00002034 <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    2034:	f000 b9bc 	b.w	23b0 <usb_serial_flush_output>

00002038 <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    2038:	f000 b996 	b.w	2368 <usb_serial_write_buffer_free>

0000203c <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    203c:	4608      	mov	r0, r1
    203e:	4611      	mov	r1, r2
    2040:	f000 b8b2 	b.w	21a8 <usb_serial_write>

00002044 <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    2044:	4608      	mov	r0, r1
    2046:	f000 b983 	b.w	2350 <usb_serial_putchar>
    204a:	bf00      	nop

0000204c <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    204c:	4770      	bx	lr
    204e:	bf00      	nop

00002050 <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    2050:	b672      	cpsid	i
	avail = usb_buffer_available;
    2052:	480d      	ldr	r0, [pc, #52]	; (2088 <usb_malloc+0x38>)
    2054:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    2056:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    205a:	2b0b      	cmp	r3, #11
    205c:	dc10      	bgt.n	2080 <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    205e:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    2062:	40d9      	lsrs	r1, r3
    2064:	ea22 0201 	bic.w	r2, r2, r1
    2068:	6002      	str	r2, [r0, #0]
	__enable_irq();
    206a:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    206c:	4807      	ldr	r0, [pc, #28]	; (208c <usb_malloc+0x3c>)
    206e:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    2072:	00db      	lsls	r3, r3, #3
    2074:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    2076:	2100      	movs	r1, #0
    2078:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    207a:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    207c:	6051      	str	r1, [r2, #4]
}
    207e:	4770      	bx	lr
		__enable_irq();
    2080:	b662      	cpsie	i
		return NULL;
    2082:	2000      	movs	r0, #0
    2084:	4770      	bx	lr
    2086:	bf00      	nop
    2088:	1fff8900 	.word	0x1fff8900
    208c:	1fff83bc 	.word	0x1fff83bc

00002090 <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    2090:	4b0d      	ldr	r3, [pc, #52]	; (20c8 <usb_free+0x38>)
    2092:	4a0e      	ldr	r2, [pc, #56]	; (20cc <usb_free+0x3c>)
    2094:	1ac3      	subs	r3, r0, r3
    2096:	fba2 2303 	umull	r2, r3, r2, r3
    209a:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    209c:	2b0b      	cmp	r3, #11
    209e:	d80c      	bhi.n	20ba <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    20a0:	4a0b      	ldr	r2, [pc, #44]	; (20d0 <usb_free+0x40>)
    20a2:	7812      	ldrb	r2, [r2, #0]
    20a4:	b952      	cbnz	r2, 20bc <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    20a6:	b672      	cpsid	i
	usb_buffer_available |= mask;
    20a8:	480a      	ldr	r0, [pc, #40]	; (20d4 <usb_free+0x44>)
    20aa:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    20ae:	6802      	ldr	r2, [r0, #0]
    20b0:	fa21 f303 	lsr.w	r3, r1, r3
    20b4:	431a      	orrs	r2, r3
    20b6:	6002      	str	r2, [r0, #0]
	__enable_irq();
    20b8:	b662      	cpsie	i
    20ba:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    20bc:	4a06      	ldr	r2, [pc, #24]	; (20d8 <usb_free+0x48>)
    20be:	7812      	ldrb	r2, [r2, #0]
    20c0:	2a00      	cmp	r2, #0
    20c2:	d0f0      	beq.n	20a6 <usb_free+0x16>
		usb_rx_memory(p);
    20c4:	f7ff b942 	b.w	134c <usb_rx_memory>
    20c8:	1fff83bc 	.word	0x1fff83bc
    20cc:	38e38e39 	.word	0x38e38e39
    20d0:	1fff9469 	.word	0x1fff9469
    20d4:	1fff8900 	.word	0x1fff8900
    20d8:	1fff9474 	.word	0x1fff9474

000020dc <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    20dc:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    20de:	4d0f      	ldr	r5, [pc, #60]	; (211c <usb_serial_getchar+0x40>)
    20e0:	6828      	ldr	r0, [r5, #0]
    20e2:	b178      	cbz	r0, 2104 <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    20e4:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    20e6:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    20e8:	18c1      	adds	r1, r0, r3
    20ea:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    20ec:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    20ee:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    20f0:	d202      	bcs.n	20f8 <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    20f2:	8043      	strh	r3, [r0, #2]
	}
	return c;
    20f4:	4620      	mov	r0, r4
}
    20f6:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    20f8:	f7ff ffca 	bl	2090 <usb_free>
		rx_packet = NULL;
    20fc:	2300      	movs	r3, #0
	return c;
    20fe:	4620      	mov	r0, r4
		rx_packet = NULL;
    2100:	602b      	str	r3, [r5, #0]
    2102:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    2104:	4b06      	ldr	r3, [pc, #24]	; (2120 <usb_serial_getchar+0x44>)
    2106:	781b      	ldrb	r3, [r3, #0]
    2108:	b12b      	cbz	r3, 2116 <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    210a:	2003      	movs	r0, #3
    210c:	f7ff f8ea 	bl	12e4 <usb_rx>
    2110:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    2112:	2800      	cmp	r0, #0
    2114:	d1e6      	bne.n	20e4 <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    2116:	f04f 30ff 	mov.w	r0, #4294967295
    211a:	bd38      	pop	{r3, r4, r5, pc}
    211c:	1fff9488 	.word	0x1fff9488
    2120:	1fff9474 	.word	0x1fff9474

00002124 <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    2124:	b510      	push	{r4, lr}
	if (!rx_packet) {
    2126:	4c09      	ldr	r4, [pc, #36]	; (214c <usb_serial_peekchar+0x28>)
    2128:	6820      	ldr	r0, [r4, #0]
    212a:	b118      	cbz	r0, 2134 <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    212c:	8843      	ldrh	r3, [r0, #2]
    212e:	4418      	add	r0, r3
    2130:	7a00      	ldrb	r0, [r0, #8]
}
    2132:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    2134:	4b06      	ldr	r3, [pc, #24]	; (2150 <usb_serial_peekchar+0x2c>)
    2136:	781b      	ldrb	r3, [r3, #0]
    2138:	b12b      	cbz	r3, 2146 <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    213a:	2003      	movs	r0, #3
    213c:	f7ff f8d2 	bl	12e4 <usb_rx>
    2140:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    2142:	2800      	cmp	r0, #0
    2144:	d1f2      	bne.n	212c <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    2146:	f04f 30ff 	mov.w	r0, #4294967295
    214a:	bd10      	pop	{r4, pc}
    214c:	1fff9488 	.word	0x1fff9488
    2150:	1fff9474 	.word	0x1fff9474

00002154 <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    2154:	4b04      	ldr	r3, [pc, #16]	; (2168 <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    2156:	4a05      	ldr	r2, [pc, #20]	; (216c <usb_serial_available+0x18>)
    2158:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    215a:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    215c:	b11b      	cbz	r3, 2166 <usb_serial_available+0x12>
    215e:	881a      	ldrh	r2, [r3, #0]
    2160:	885b      	ldrh	r3, [r3, #2]
    2162:	1ad3      	subs	r3, r2, r3
    2164:	4418      	add	r0, r3
	return count;
}
    2166:	4770      	bx	lr
    2168:	1fff9488 	.word	0x1fff9488
    216c:	1fff9670 	.word	0x1fff9670

00002170 <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    2170:	4b0b      	ldr	r3, [pc, #44]	; (21a0 <usb_serial_flush_input+0x30>)
    2172:	781b      	ldrb	r3, [r3, #0]
    2174:	b19b      	cbz	r3, 219e <usb_serial_flush_input+0x2e>
{
    2176:	b510      	push	{r4, lr}
	if (rx_packet) {
    2178:	4c0a      	ldr	r4, [pc, #40]	; (21a4 <usb_serial_flush_input+0x34>)
    217a:	6820      	ldr	r0, [r4, #0]
    217c:	b148      	cbz	r0, 2192 <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    217e:	f7ff ff87 	bl	2090 <usb_free>
		rx_packet = NULL;
    2182:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    2184:	2003      	movs	r0, #3
		rx_packet = NULL;
    2186:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    2188:	f7ff f8ac 	bl	12e4 <usb_rx>
		if (!rx) break;
    218c:	b130      	cbz	r0, 219c <usb_serial_flush_input+0x2c>
		usb_free(rx);
    218e:	f7ff ff7f 	bl	2090 <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    2192:	2003      	movs	r0, #3
    2194:	f7ff f8a6 	bl	12e4 <usb_rx>
		if (!rx) break;
    2198:	2800      	cmp	r0, #0
    219a:	d1f8      	bne.n	218e <usb_serial_flush_input+0x1e>
    219c:	bd10      	pop	{r4, pc}
    219e:	4770      	bx	lr
    21a0:	1fff9474 	.word	0x1fff9474
    21a4:	1fff9488 	.word	0x1fff9488

000021a8 <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    21a8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    21ac:	4a63      	ldr	r2, [pc, #396]	; (233c <usb_serial_write+0x194>)
{
    21ae:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    21b0:	2301      	movs	r3, #1
    21b2:	7013      	strb	r3, [r2, #0]
	while (size > 0) {
    21b4:	9101      	str	r1, [sp, #4]
    21b6:	2900      	cmp	r1, #0
    21b8:	d06c      	beq.n	2294 <usb_serial_write+0xec>
    21ba:	f8df 8190 	ldr.w	r8, [pc, #400]	; 234c <usb_serial_write+0x1a4>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    21be:	4f60      	ldr	r7, [pc, #384]	; (2340 <usb_serial_write+0x198>)
    21c0:	4604      	mov	r4, r0
    21c2:	f8d8 0000 	ldr.w	r0, [r8]
    21c6:	460e      	mov	r6, r1
		if (!tx_packet) {
    21c8:	2800      	cmp	r0, #0
    21ca:	f000 8081 	beq.w	22d0 <usb_serial_write+0x128>
    21ce:	4d5d      	ldr	r5, [pc, #372]	; (2344 <usb_serial_write+0x19c>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    21d0:	8843      	ldrh	r3, [r0, #2]
    21d2:	f1c3 0140 	rsb	r1, r3, #64	; 0x40
    21d6:	42b1      	cmp	r1, r6
    21d8:	bf28      	it	cs
    21da:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    21dc:	eb03 0901 	add.w	r9, r3, r1
    21e0:	fa1f f989 	uxth.w	r9, r9
		dest = tx_packet->buf + tx_packet->index;
    21e4:	f100 0208 	add.w	r2, r0, #8
		transmit_previous_timeout = 0;
    21e8:	f04f 0e00 	mov.w	lr, #0
		size -= len;
    21ec:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    21ee:	f8a0 9002 	strh.w	r9, [r0, #2]
		while (len-- > 0) *dest++ = *src++;
    21f2:	f101 3cff 	add.w	ip, r1, #4294967295
		dest = tx_packet->buf + tx_packet->index;
    21f6:	441a      	add	r2, r3
		transmit_previous_timeout = 0;
    21f8:	f885 e000 	strb.w	lr, [r5]
		while (len-- > 0) *dest++ = *src++;
    21fc:	2900      	cmp	r1, #0
    21fe:	d041      	beq.n	2284 <usb_serial_write+0xdc>
    2200:	f103 0508 	add.w	r5, r3, #8
    2204:	330c      	adds	r3, #12
    2206:	4403      	add	r3, r0
    2208:	4405      	add	r5, r0
    220a:	f104 0904 	add.w	r9, r4, #4
    220e:	454d      	cmp	r5, r9
    2210:	bf38      	it	cc
    2212:	429c      	cmpcc	r4, r3
    2214:	bf2c      	ite	cs
    2216:	2301      	movcs	r3, #1
    2218:	2300      	movcc	r3, #0
    221a:	2909      	cmp	r1, #9
    221c:	bf94      	ite	ls
    221e:	2300      	movls	r3, #0
    2220:	f003 0301 	andhi.w	r3, r3, #1
    2224:	2b00      	cmp	r3, #0
    2226:	d04a      	beq.n	22be <usb_serial_write+0x116>
    2228:	ea44 0305 	orr.w	r3, r4, r5
    222c:	079b      	lsls	r3, r3, #30
    222e:	d146      	bne.n	22be <usb_serial_write+0x116>
    2230:	1f0b      	subs	r3, r1, #4
    2232:	089b      	lsrs	r3, r3, #2
    2234:	3301      	adds	r3, #1
    2236:	f1bc 0f02 	cmp.w	ip, #2
    223a:	ea4f 0983 	mov.w	r9, r3, lsl #2
    223e:	d93c      	bls.n	22ba <usb_serial_write+0x112>
    2240:	f1a4 0a04 	sub.w	sl, r4, #4
    2244:	469b      	mov	fp, r3
    2246:	f10e 0e01 	add.w	lr, lr, #1
    224a:	f85a 3f04 	ldr.w	r3, [sl, #4]!
    224e:	f845 3b04 	str.w	r3, [r5], #4
    2252:	45f3      	cmp	fp, lr
    2254:	d8f7      	bhi.n	2246 <usb_serial_write+0x9e>
    2256:	4549      	cmp	r1, r9
    2258:	444a      	add	r2, r9
    225a:	ebc9 0c0c 	rsb	ip, r9, ip
    225e:	eb04 0309 	add.w	r3, r4, r9
    2262:	d061      	beq.n	2328 <usb_serial_write+0x180>
    2264:	781d      	ldrb	r5, [r3, #0]
    2266:	7015      	strb	r5, [r2, #0]
    2268:	f1bc 0f00 	cmp.w	ip, #0
    226c:	d023      	beq.n	22b6 <usb_serial_write+0x10e>
    226e:	785d      	ldrb	r5, [r3, #1]
    2270:	7055      	strb	r5, [r2, #1]
    2272:	f1bc 0f01 	cmp.w	ip, #1
    2276:	d01e      	beq.n	22b6 <usb_serial_write+0x10e>
    2278:	789b      	ldrb	r3, [r3, #2]
    227a:	7093      	strb	r3, [r2, #2]
    227c:	4421      	add	r1, r4
    227e:	f8b0 9002 	ldrh.w	r9, [r0, #2]
    2282:	460c      	mov	r4, r1
		if (tx_packet->index >= CDC_TX_SIZE) {
    2284:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
    2288:	d80b      	bhi.n	22a2 <usb_serial_write+0xfa>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    228a:	4b2f      	ldr	r3, [pc, #188]	; (2348 <usb_serial_write+0x1a0>)
    228c:	2205      	movs	r2, #5
    228e:	701a      	strb	r2, [r3, #0]
	while (size > 0) {
    2290:	2e00      	cmp	r6, #0
    2292:	d199      	bne.n	21c8 <usb_serial_write+0x20>
	}
	tx_noautoflush = 0;
	return ret;
    2294:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    2296:	4a29      	ldr	r2, [pc, #164]	; (233c <usb_serial_write+0x194>)
    2298:	2300      	movs	r3, #0
    229a:	7013      	strb	r3, [r2, #0]
}
    229c:	b003      	add	sp, #12
    229e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    22a2:	2340      	movs	r3, #64	; 0x40
    22a4:	8003      	strh	r3, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    22a6:	4601      	mov	r1, r0
    22a8:	2004      	movs	r0, #4
    22aa:	f7ff f8b3 	bl	1414 <usb_tx>
			tx_packet = NULL;
    22ae:	2000      	movs	r0, #0
    22b0:	f8c8 0000 	str.w	r0, [r8]
    22b4:	e7e9      	b.n	228a <usb_serial_write+0xe2>
    22b6:	4421      	add	r1, r4
    22b8:	e7e1      	b.n	227e <usb_serial_write+0xd6>
		while (len-- > 0) *dest++ = *src++;
    22ba:	4623      	mov	r3, r4
    22bc:	e7d2      	b.n	2264 <usb_serial_write+0xbc>
    22be:	3a01      	subs	r2, #1
    22c0:	4421      	add	r1, r4
    22c2:	f814 3b01 	ldrb.w	r3, [r4], #1
    22c6:	f802 3f01 	strb.w	r3, [r2, #1]!
    22ca:	428c      	cmp	r4, r1
    22cc:	d1f9      	bne.n	22c2 <usb_serial_write+0x11a>
    22ce:	e7d6      	b.n	227e <usb_serial_write+0xd6>
				if (!usb_configuration) {
    22d0:	783b      	ldrb	r3, [r7, #0]
    22d2:	b35b      	cbz	r3, 232c <usb_serial_write+0x184>
    22d4:	4d1b      	ldr	r5, [pc, #108]	; (2344 <usb_serial_write+0x19c>)
    22d6:	f24d 09e9 	movw	r9, #53481	; 0xd0e9
					tx_noautoflush = 1;
    22da:	f04f 0a01 	mov.w	sl, #1
    22de:	e008      	b.n	22f2 <usb_serial_write+0x14a>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    22e0:	f1b9 0901 	subs.w	r9, r9, #1
    22e4:	d019      	beq.n	231a <usb_serial_write+0x172>
    22e6:	782b      	ldrb	r3, [r5, #0]
    22e8:	b9bb      	cbnz	r3, 231a <usb_serial_write+0x172>
				yield();
    22ea:	f000 f8b1 	bl	2450 <yield>
				if (!usb_configuration) {
    22ee:	783b      	ldrb	r3, [r7, #0]
    22f0:	b1e3      	cbz	r3, 232c <usb_serial_write+0x184>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    22f2:	2004      	movs	r0, #4
    22f4:	f7ff f814 	bl	1320 <usb_tx_packet_count>
    22f8:	2807      	cmp	r0, #7
    22fa:	d8f1      	bhi.n	22e0 <usb_serial_write+0x138>
					tx_noautoflush = 1;
    22fc:	4b0f      	ldr	r3, [pc, #60]	; (233c <usb_serial_write+0x194>)
    22fe:	f883 a000 	strb.w	sl, [r3]
					tx_packet = usb_malloc();
    2302:	f7ff fea5 	bl	2050 <usb_malloc>
    2306:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    230a:	2800      	cmp	r0, #0
    230c:	f47f af60 	bne.w	21d0 <usb_serial_write+0x28>
					tx_noautoflush = 0;
    2310:	4b0a      	ldr	r3, [pc, #40]	; (233c <usb_serial_write+0x194>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    2312:	f1b9 0901 	subs.w	r9, r9, #1
					tx_noautoflush = 0;
    2316:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    2318:	d1e5      	bne.n	22e6 <usb_serial_write+0x13e>
					transmit_previous_timeout = 1;
    231a:	2301      	movs	r3, #1
					return -1;
    231c:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    2320:	702b      	strb	r3, [r5, #0]
}
    2322:	b003      	add	sp, #12
    2324:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2328:	4619      	mov	r1, r3
    232a:	e7a8      	b.n	227e <usb_serial_write+0xd6>
					tx_noautoflush = 0;
    232c:	4a03      	ldr	r2, [pc, #12]	; (233c <usb_serial_write+0x194>)
    232e:	2300      	movs	r3, #0
					return -1;
    2330:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    2334:	7013      	strb	r3, [r2, #0]
}
    2336:	b003      	add	sp, #12
    2338:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    233c:	1fff947d 	.word	0x1fff947d
    2340:	1fff9474 	.word	0x1fff9474
    2344:	1fff9484 	.word	0x1fff9484
    2348:	1fff947c 	.word	0x1fff947c
    234c:	1fff9480 	.word	0x1fff9480

00002350 <usb_serial_putchar>:
{
    2350:	b500      	push	{lr}
    2352:	b083      	sub	sp, #12
    2354:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    2356:	2101      	movs	r1, #1
{
    2358:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    235c:	4618      	mov	r0, r3
    235e:	f7ff ff23 	bl	21a8 <usb_serial_write>
}
    2362:	b003      	add	sp, #12
    2364:	f85d fb04 	ldr.w	pc, [sp], #4

00002368 <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    2368:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    236a:	4d0e      	ldr	r5, [pc, #56]	; (23a4 <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    236c:	4c0e      	ldr	r4, [pc, #56]	; (23a8 <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    236e:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    2370:	2301      	movs	r3, #1
    2372:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    2374:	b128      	cbz	r0, 2382 <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    2376:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    2378:	2300      	movs	r3, #0
    237a:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    237c:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    2380:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    2382:	4b0a      	ldr	r3, [pc, #40]	; (23ac <usb_serial_write_buffer_free+0x44>)
    2384:	781b      	ldrb	r3, [r3, #0]
    2386:	b913      	cbnz	r3, 238e <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    2388:	2000      	movs	r0, #0
    238a:	7020      	strb	r0, [r4, #0]
			return 0;
    238c:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    238e:	2004      	movs	r0, #4
    2390:	f7fe ffc6 	bl	1320 <usb_tx_packet_count>
		if (!usb_configuration ||
    2394:	2807      	cmp	r0, #7
    2396:	d8f7      	bhi.n	2388 <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    2398:	f7ff fe5a 	bl	2050 <usb_malloc>
    239c:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    239e:	2800      	cmp	r0, #0
    23a0:	d1e9      	bne.n	2376 <usb_serial_write_buffer_free+0xe>
    23a2:	e7f1      	b.n	2388 <usb_serial_write_buffer_free+0x20>
    23a4:	1fff9480 	.word	0x1fff9480
    23a8:	1fff947d 	.word	0x1fff947d
    23ac:	1fff9474 	.word	0x1fff9474

000023b0 <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    23b0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    23b2:	4b11      	ldr	r3, [pc, #68]	; (23f8 <usb_serial_flush_output+0x48>)
    23b4:	781b      	ldrb	r3, [r3, #0]
    23b6:	b18b      	cbz	r3, 23dc <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    23b8:	4e10      	ldr	r6, [pc, #64]	; (23fc <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    23ba:	4d11      	ldr	r5, [pc, #68]	; (2400 <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    23bc:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    23be:	2701      	movs	r7, #1
    23c0:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    23c2:	b164      	cbz	r4, 23de <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    23c4:	4a0f      	ldr	r2, [pc, #60]	; (2404 <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    23c6:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    23c8:	2700      	movs	r7, #0
    23ca:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    23cc:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    23ce:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    23d0:	2004      	movs	r0, #4
    23d2:	f7ff f81f 	bl	1414 <usb_tx>
		tx_packet = NULL;
    23d6:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    23d8:	2300      	movs	r3, #0
    23da:	702b      	strb	r3, [r5, #0]
    23dc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    23de:	f7ff fe37 	bl	2050 <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    23e2:	4b08      	ldr	r3, [pc, #32]	; (2404 <usb_serial_flush_output+0x54>)
		if (tx) {
    23e4:	b128      	cbz	r0, 23f2 <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    23e6:	4601      	mov	r1, r0
    23e8:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    23ea:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    23ec:	f7ff f812 	bl	1414 <usb_tx>
    23f0:	e7f2      	b.n	23d8 <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    23f2:	701f      	strb	r7, [r3, #0]
    23f4:	e7f0      	b.n	23d8 <usb_serial_flush_output+0x28>
    23f6:	bf00      	nop
    23f8:	1fff9474 	.word	0x1fff9474
    23fc:	1fff9480 	.word	0x1fff9480
    2400:	1fff947d 	.word	0x1fff947d
    2404:	1fff947c 	.word	0x1fff947c

00002408 <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    2408:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    240a:	4b0e      	ldr	r3, [pc, #56]	; (2444 <usb_serial_flush_callback+0x3c>)
    240c:	781b      	ldrb	r3, [r3, #0]
    240e:	b973      	cbnz	r3, 242e <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    2410:	4c0d      	ldr	r4, [pc, #52]	; (2448 <usb_serial_flush_callback+0x40>)
    2412:	6821      	ldr	r1, [r4, #0]
    2414:	b161      	cbz	r1, 2430 <usb_serial_flush_callback+0x28>
    2416:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    241a:	884b      	ldrh	r3, [r1, #2]
    241c:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    241e:	2004      	movs	r0, #4
    2420:	f7fe fff8 	bl	1414 <usb_tx>
		tx_packet = NULL;
    2424:	6025      	str	r5, [r4, #0]
    2426:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    2428:	4b08      	ldr	r3, [pc, #32]	; (244c <usb_serial_flush_callback+0x44>)
    242a:	2201      	movs	r2, #1
    242c:	701a      	strb	r2, [r3, #0]
    242e:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    2430:	f7ff fe0e 	bl	2050 <usb_malloc>
		if (tx) {
    2434:	2800      	cmp	r0, #0
    2436:	d0f7      	beq.n	2428 <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    2438:	4601      	mov	r1, r0
		}
	}
}
    243a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    243e:	2004      	movs	r0, #4
    2440:	f7fe bfe8 	b.w	1414 <usb_tx>
    2444:	1fff947d 	.word	0x1fff947d
    2448:	1fff9480 	.word	0x1fff9480
    244c:	1fff947c 	.word	0x1fff947c

00002450 <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    2450:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    2452:	4c22      	ldr	r4, [pc, #136]	; (24dc <yield+0x8c>)
    2454:	7823      	ldrb	r3, [r4, #0]
    2456:	b103      	cbz	r3, 245a <yield+0xa>
    2458:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    245a:	2301      	movs	r3, #1
    245c:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    245e:	f7ff fe79 	bl	2154 <usb_serial_available>
	if (Serial.available()) serialEvent();
    2462:	bb70      	cbnz	r0, 24c2 <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    2464:	f000 fa26 	bl	28b4 <serial_available>
	if (Serial1.available()) serialEvent1();
    2468:	bb40      	cbnz	r0, 24bc <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    246a:	f000 fab9 	bl	29e0 <serial2_available>
	if (Serial2.available()) serialEvent2();
    246e:	bb10      	cbnz	r0, 24b6 <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    2470:	f000 fb4c 	bl	2b0c <serial3_available>
	if (Serial3.available()) serialEvent3();
    2474:	b9e0      	cbnz	r0, 24b0 <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    2476:	2300      	movs	r3, #0
    2478:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    247a:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    247e:	2b00      	cmp	r3, #0
    2480:	d1ea      	bne.n	2458 <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2482:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    2486:	b672      	cpsid	i
		EventResponder *first = firstYield;
    2488:	4b15      	ldr	r3, [pc, #84]	; (24e0 <yield+0x90>)
    248a:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    248c:	b1e0      	cbz	r0, 24c8 <yield+0x78>
		if (runningFromYield) {
    248e:	4c15      	ldr	r4, [pc, #84]	; (24e4 <yield+0x94>)
    2490:	7822      	ldrb	r2, [r4, #0]
    2492:	b9ca      	cbnz	r2, 24c8 <yield+0x78>
		firstYield = first->_next;
    2494:	6945      	ldr	r5, [r0, #20]
    2496:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    2498:	2301      	movs	r3, #1
    249a:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    249c:	b1c5      	cbz	r5, 24d0 <yield+0x80>
			firstYield->_prev = nullptr;
    249e:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    24a0:	b901      	cbnz	r1, 24a4 <yield+0x54>
    24a2:	b662      	cpsie	i
		first->_triggered = false;
    24a4:	2500      	movs	r5, #0
    24a6:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    24a8:	6883      	ldr	r3, [r0, #8]
    24aa:	4798      	blx	r3
		runningFromYield = false;
    24ac:	7025      	strb	r5, [r4, #0]
    24ae:	e7d3      	b.n	2458 <yield+0x8>
	if (Serial3.available()) serialEvent3();
    24b0:	f000 f98e 	bl	27d0 <serialEvent3()>
    24b4:	e7df      	b.n	2476 <yield+0x26>
	if (Serial2.available()) serialEvent2();
    24b6:	f000 f989 	bl	27cc <serialEvent2()>
    24ba:	e7d9      	b.n	2470 <yield+0x20>
	if (Serial1.available()) serialEvent1();
    24bc:	f000 f984 	bl	27c8 <serialEvent1()>
    24c0:	e7d3      	b.n	246a <yield+0x1a>
	if (Serial.available()) serialEvent();
    24c2:	f7ff fdc3 	bl	204c <serialEvent()>
    24c6:	e7cd      	b.n	2464 <yield+0x14>
		if (doit) __enable_irq();
    24c8:	2900      	cmp	r1, #0
    24ca:	d1c5      	bne.n	2458 <yield+0x8>
    24cc:	b662      	cpsie	i
    24ce:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    24d0:	4b05      	ldr	r3, [pc, #20]	; (24e8 <yield+0x98>)
    24d2:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    24d4:	2900      	cmp	r1, #0
    24d6:	d1e5      	bne.n	24a4 <yield+0x54>
    24d8:	e7e3      	b.n	24a2 <yield+0x52>
    24da:	bf00      	nop
    24dc:	1fff948d 	.word	0x1fff948d
    24e0:	1fff94a0 	.word	0x1fff94a0
    24e4:	1fff94a4 	.word	0x1fff94a4
    24e8:	1fff949c 	.word	0x1fff949c

000024ec <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    24ec:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    24ee:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    24f0:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    24f2:	2c02      	cmp	r4, #2
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    24f4:	4603      	mov	r3, r0
		_data = data;
    24f6:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    24f8:	d00f      	beq.n	251a <EventResponder::triggerEvent(int, void*)+0x2e>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    24fa:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    24fe:	b672      	cpsid	i
// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
	bool irq = disableInterrupts();
	if (_triggered == false) {
    2500:	7f42      	ldrb	r2, [r0, #29]
    2502:	b932      	cbnz	r2, 2512 <EventResponder::triggerEvent(int, void*)+0x26>
		// not already triggered
		if (_type == EventTypeYield) {
    2504:	7f00      	ldrb	r0, [r0, #28]
    2506:	2801      	cmp	r0, #1
    2508:	d00a      	beq.n	2520 <EventResponder::triggerEvent(int, void*)+0x34>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    250a:	2803      	cmp	r0, #3
    250c:	d012      	beq.n	2534 <EventResponder::triggerEvent(int, void*)+0x48>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    250e:	2201      	movs	r2, #1
    2510:	775a      	strb	r2, [r3, #29]
		if (doit) __enable_irq();
    2512:	b901      	cbnz	r1, 2516 <EventResponder::triggerEvent(int, void*)+0x2a>
    2514:	b662      	cpsie	i
	}
    2516:	bc10      	pop	{r4}
    2518:	4770      	bx	lr
			(*_function)(*this);
    251a:	6883      	ldr	r3, [r0, #8]
	}
    251c:	bc10      	pop	{r4}
			(*_function)(*this);
    251e:	4718      	bx	r3
			if (firstYield == nullptr) {
    2520:	4c11      	ldr	r4, [pc, #68]	; (2568 <EventResponder::triggerEvent(int, void*)+0x7c>)
    2522:	6820      	ldr	r0, [r4, #0]
    2524:	b1a0      	cbz	r0, 2550 <EventResponder::triggerEvent(int, void*)+0x64>
				_prev = lastYield;
    2526:	4811      	ldr	r0, [pc, #68]	; (256c <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2528:	615a      	str	r2, [r3, #20]
				_prev = lastYield;
    252a:	6802      	ldr	r2, [r0, #0]
    252c:	619a      	str	r2, [r3, #24]
				lastYield = this;
    252e:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2530:	6153      	str	r3, [r2, #20]
    2532:	e7ec      	b.n	250e <EventResponder::triggerEvent(int, void*)+0x22>
			if (firstInterrupt == nullptr) {
    2534:	4c0e      	ldr	r4, [pc, #56]	; (2570 <EventResponder::triggerEvent(int, void*)+0x84>)
    2536:	6820      	ldr	r0, [r4, #0]
    2538:	b180      	cbz	r0, 255c <EventResponder::triggerEvent(int, void*)+0x70>
				_prev = lastInterrupt;
    253a:	480e      	ldr	r0, [pc, #56]	; (2574 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    253c:	615a      	str	r2, [r3, #20]
				_prev = lastInterrupt;
    253e:	6802      	ldr	r2, [r0, #0]
    2540:	619a      	str	r2, [r3, #24]
				lastInterrupt = this;
    2542:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2544:	6153      	str	r3, [r2, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2546:	4a0c      	ldr	r2, [pc, #48]	; (2578 <EventResponder::triggerEvent(int, void*)+0x8c>)
    2548:	f04f 5080 	mov.w	r0, #268435456	; 0x10000000
    254c:	6010      	str	r0, [r2, #0]
    254e:	e7de      	b.n	250e <EventResponder::triggerEvent(int, void*)+0x22>
				lastYield = this;
    2550:	4a06      	ldr	r2, [pc, #24]	; (256c <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2552:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2554:	6198      	str	r0, [r3, #24]
				firstYield = this;
    2556:	6023      	str	r3, [r4, #0]
				lastYield = this;
    2558:	6013      	str	r3, [r2, #0]
    255a:	e7d8      	b.n	250e <EventResponder::triggerEvent(int, void*)+0x22>
				lastInterrupt = this;
    255c:	4a05      	ldr	r2, [pc, #20]	; (2574 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    255e:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2560:	6198      	str	r0, [r3, #24]
				firstInterrupt = this;
    2562:	6023      	str	r3, [r4, #0]
				lastInterrupt = this;
    2564:	6013      	str	r3, [r2, #0]
    2566:	e7ee      	b.n	2546 <EventResponder::triggerEvent(int, void*)+0x5a>
    2568:	1fff94a0 	.word	0x1fff94a0
    256c:	1fff949c 	.word	0x1fff949c
    2570:	1fff9490 	.word	0x1fff9490
    2574:	1fff9494 	.word	0x1fff9494
    2578:	e000ed04 	.word	0xe000ed04

0000257c <pendablesrvreq_isr>:
	}
	enableInterrupts(irq);
}

void pendablesrvreq_isr(void)
{
    257c:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    257e:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    2582:	b672      	cpsid	i

void EventResponder::runFromInterrupt()
{
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    2584:	4c0c      	ldr	r4, [pc, #48]	; (25b8 <pendablesrvreq_isr+0x3c>)
    2586:	6820      	ldr	r0, [r4, #0]
		if (first) {
    2588:	b180      	cbz	r0, 25ac <pendablesrvreq_isr+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    258a:	4e0c      	ldr	r6, [pc, #48]	; (25bc <pendablesrvreq_isr+0x40>)
				firstInterrupt->_prev = nullptr;
    258c:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    258e:	6943      	ldr	r3, [r0, #20]
    2590:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    2592:	b173      	cbz	r3, 25b2 <pendablesrvreq_isr+0x36>
				firstInterrupt->_prev = nullptr;
    2594:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    2596:	b902      	cbnz	r2, 259a <pendablesrvreq_isr+0x1e>
    2598:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    259a:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    259c:	6883      	ldr	r3, [r0, #8]
    259e:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    25a0:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    25a4:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    25a6:	6820      	ldr	r0, [r4, #0]
		if (first) {
    25a8:	2800      	cmp	r0, #0
    25aa:	d1f0      	bne.n	258e <pendablesrvreq_isr+0x12>
		if (doit) __enable_irq();
    25ac:	b902      	cbnz	r2, 25b0 <pendablesrvreq_isr+0x34>
    25ae:	b662      	cpsie	i
    25b0:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    25b2:	6033      	str	r3, [r6, #0]
    25b4:	e7ef      	b.n	2596 <pendablesrvreq_isr+0x1a>
    25b6:	bf00      	nop
    25b8:	1fff9490 	.word	0x1fff9490
    25bc:	1fff9494 	.word	0x1fff9494

000025c0 <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    25c0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	MillisTimer *timer = listActive;
    25c4:	4d74      	ldr	r5, [pc, #464]	; (2798 <MillisTimer::runFromTimer()+0x1d8>)
    25c6:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    25c8:	2c00      	cmp	r4, #0
    25ca:	d031      	beq.n	2630 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    25cc:	6823      	ldr	r3, [r4, #0]
    25ce:	2b00      	cmp	r3, #0
    25d0:	d12c      	bne.n	262c <MillisTimer::runFromTimer()+0x6c>
    25d2:	f8df 91d8 	ldr.w	r9, [pc, #472]	; 27ac <MillisTimer::runFromTimer()+0x1ec>
			if (firstInterrupt == nullptr) {
    25d6:	4f71      	ldr	r7, [pc, #452]	; (279c <MillisTimer::runFromTimer()+0x1dc>)
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    25d8:	f8df 81d4 	ldr.w	r8, [pc, #468]	; 27b0 <MillisTimer::runFromTimer()+0x1f0>
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    25dc:	461e      	mov	r6, r3
			MillisTimer *next = timer->_next;
    25de:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    25e0:	b103      	cbz	r3, 25e4 <MillisTimer::runFromTimer()+0x24>
    25e2:	60de      	str	r6, [r3, #12]
			listActive = next;
			timer->_state = TimerOff;
			EventResponderRef event = *(timer->_event);
    25e4:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    25e6:	602b      	str	r3, [r5, #0]
			event.triggerEvent(0, timer);
    25e8:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    25ea:	7526      	strb	r6, [r4, #20]
			event.triggerEvent(0, timer);
    25ec:	681b      	ldr	r3, [r3, #0]
    25ee:	454b      	cmp	r3, r9
    25f0:	d157      	bne.n	26a2 <MillisTimer::runFromTimer()+0xe2>
		if (_type == EventTypeImmediate) {
    25f2:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    25f4:	6046      	str	r6, [r0, #4]
		if (_type == EventTypeImmediate) {
    25f6:	2b02      	cmp	r3, #2
		_data = data;
    25f8:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    25fa:	d056      	beq.n	26aa <MillisTimer::runFromTimer()+0xea>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    25fc:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    2600:	b672      	cpsid	i
	if (_triggered == false) {
    2602:	7f43      	ldrb	r3, [r0, #29]
    2604:	b943      	cbnz	r3, 2618 <MillisTimer::runFromTimer()+0x58>
		if (_type == EventTypeYield) {
    2606:	7f01      	ldrb	r1, [r0, #28]
    2608:	2901      	cmp	r1, #1
    260a:	f000 8088 	beq.w	271e <MillisTimer::runFromTimer()+0x15e>
		} else if (_type == EventTypeInterrupt) {
    260e:	2903      	cmp	r1, #3
    2610:	f000 8091 	beq.w	2736 <MillisTimer::runFromTimer()+0x176>
		_triggered = true;
    2614:	2301      	movs	r3, #1
    2616:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    2618:	b902      	cbnz	r2, 261c <MillisTimer::runFromTimer()+0x5c>
    261a:	b662      	cpsie	i
			if (timer->_reload) {
    261c:	6863      	ldr	r3, [r4, #4]
    261e:	2b00      	cmp	r3, #0
    2620:	d12c      	bne.n	267c <MillisTimer::runFromTimer()+0xbc>
    2622:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    2624:	b124      	cbz	r4, 2630 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    2626:	6823      	ldr	r3, [r4, #0]
    2628:	2b00      	cmp	r3, #0
    262a:	d0d8      	beq.n	25de <MillisTimer::runFromTimer()+0x1e>
			timer->_ms--;
    262c:	3b01      	subs	r3, #1
    262e:	6023      	str	r3, [r4, #0]
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2630:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    2634:	b672      	cpsid	i
			}
			timer = listActive;
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    2636:	4a5a      	ldr	r2, [pc, #360]	; (27a0 <MillisTimer::runFromTimer()+0x1e0>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2638:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    263a:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    263c:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    263e:	b903      	cbnz	r3, 2642 <MillisTimer::runFromTimer()+0x82>
    2640:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    2642:	2800      	cmp	r0, #0
    2644:	f000 80a5 	beq.w	2792 <MillisTimer::runFromTimer()+0x1d2>
    2648:	682c      	ldr	r4, [r5, #0]
	_state = TimerActive;
    264a:	2702      	movs	r7, #2
		_prev = nullptr;
    264c:	f04f 0e00 	mov.w	lr, #0
		MillisTimer *next = waiting->_next;
    2650:	6886      	ldr	r6, [r0, #8]
	if (listActive == nullptr) {
    2652:	2c00      	cmp	r4, #0
    2654:	d05f      	beq.n	2716 <MillisTimer::runFromTimer()+0x156>
	} else if (_ms < listActive->_ms) {
    2656:	6803      	ldr	r3, [r0, #0]
    2658:	6821      	ldr	r1, [r4, #0]
    265a:	428b      	cmp	r3, r1
    265c:	d23a      	bcs.n	26d4 <MillisTimer::runFromTimer()+0x114>
		listActive->_ms -= _ms;	
    265e:	1acb      	subs	r3, r1, r3
		_next = listActive;
    2660:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2662:	f8c0 e00c 	str.w	lr, [r0, #12]
		listActive->_ms -= _ms;	
    2666:	4601      	mov	r1, r0
    2668:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    266a:	60e0      	str	r0, [r4, #12]
	_state = TimerActive;
    266c:	7507      	strb	r7, [r0, #20]
    266e:	4630      	mov	r0, r6
    2670:	460c      	mov	r4, r1
	while (waiting) {
    2672:	2e00      	cmp	r6, #0
    2674:	d1ec      	bne.n	2650 <MillisTimer::runFromTimer()+0x90>
    2676:	6029      	str	r1, [r5, #0]
    2678:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	if (listActive == nullptr) {
    267c:	6828      	ldr	r0, [r5, #0]
    267e:	4a46      	ldr	r2, [pc, #280]	; (2798 <MillisTimer::runFromTimer()+0x1d8>)
				timer->_ms = timer->_reload;
    2680:	6023      	str	r3, [r4, #0]
	if (listActive == nullptr) {
    2682:	2800      	cmp	r0, #0
    2684:	d073      	beq.n	276e <MillisTimer::runFromTimer()+0x1ae>
	} else if (_ms < listActive->_ms) {
    2686:	6801      	ldr	r1, [r0, #0]
    2688:	428b      	cmp	r3, r1
    268a:	d211      	bcs.n	26b0 <MillisTimer::runFromTimer()+0xf0>
		listActive->_ms -= _ms;	
    268c:	1acb      	subs	r3, r1, r3
		_next = listActive;
    268e:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2690:	60e6      	str	r6, [r4, #12]
		listActive->_ms -= _ms;	
    2692:	6003      	str	r3, [r0, #0]
		listActive->_prev = this;
    2694:	60c4      	str	r4, [r0, #12]
		listActive = this;
    2696:	6014      	str	r4, [r2, #0]
    2698:	4620      	mov	r0, r4
	_state = TimerActive;
    269a:	2302      	movs	r3, #2
    269c:	7523      	strb	r3, [r4, #20]
    269e:	4604      	mov	r4, r0
    26a0:	e7c1      	b.n	2626 <MillisTimer::runFromTimer()+0x66>
			event.triggerEvent(0, timer);
    26a2:	4622      	mov	r2, r4
    26a4:	2100      	movs	r1, #0
    26a6:	4798      	blx	r3
    26a8:	e7b8      	b.n	261c <MillisTimer::runFromTimer()+0x5c>
			(*_function)(*this);
    26aa:	6883      	ldr	r3, [r0, #8]
    26ac:	4798      	blx	r3
    26ae:	e7b5      	b.n	261c <MillisTimer::runFromTimer()+0x5c>
	} else if (_ms < listActive->_ms) {
    26b0:	4686      	mov	lr, r0
    26b2:	e003      	b.n	26bc <MillisTimer::runFromTimer()+0xfc>
			if (_ms < timer->_ms) {
    26b4:	6811      	ldr	r1, [r2, #0]
    26b6:	428b      	cmp	r3, r1
    26b8:	4696      	mov	lr, r2
    26ba:	d349      	bcc.n	2750 <MillisTimer::runFromTimer()+0x190>
		while (timer->_next) {
    26bc:	f8de 2008 	ldr.w	r2, [lr, #8]
		_ms -= timer->_ms;
    26c0:	1a5b      	subs	r3, r3, r1
    26c2:	6023      	str	r3, [r4, #0]
		while (timer->_next) {
    26c4:	2a00      	cmp	r2, #0
    26c6:	d1f5      	bne.n	26b4 <MillisTimer::runFromTimer()+0xf4>
		_next = nullptr;
    26c8:	60a2      	str	r2, [r4, #8]
		_prev = timer;
    26ca:	f8c4 e00c 	str.w	lr, [r4, #12]
		timer->_next = this;
    26ce:	f8ce 4008 	str.w	r4, [lr, #8]
    26d2:	e7e2      	b.n	269a <MillisTimer::runFromTimer()+0xda>
	} else if (_ms < listActive->_ms) {
    26d4:	46a4      	mov	ip, r4
    26d6:	e003      	b.n	26e0 <MillisTimer::runFromTimer()+0x120>
			if (_ms < timer->_ms) {
    26d8:	6811      	ldr	r1, [r2, #0]
    26da:	428b      	cmp	r3, r1
    26dc:	4694      	mov	ip, r2
    26de:	d30c      	bcc.n	26fa <MillisTimer::runFromTimer()+0x13a>
		while (timer->_next) {
    26e0:	f8dc 2008 	ldr.w	r2, [ip, #8]
		_ms -= timer->_ms;
    26e4:	1a5b      	subs	r3, r3, r1
    26e6:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    26e8:	2a00      	cmp	r2, #0
    26ea:	d1f5      	bne.n	26d8 <MillisTimer::runFromTimer()+0x118>
		_next = nullptr;
    26ec:	6082      	str	r2, [r0, #8]
		_prev = timer;
    26ee:	f8c0 c00c 	str.w	ip, [r0, #12]
		timer->_next = this;
    26f2:	4621      	mov	r1, r4
    26f4:	f8cc 0008 	str.w	r0, [ip, #8]
    26f8:	e7b8      	b.n	266c <MillisTimer::runFromTimer()+0xac>
				_prev = timer->_prev;
    26fa:	68d2      	ldr	r2, [r2, #12]
    26fc:	60c2      	str	r2, [r0, #12]
				_next = timer;
    26fe:	f8c0 c008 	str.w	ip, [r0, #8]
				timer->_prev = this;
    2702:	f8cc 000c 	str.w	r0, [ip, #12]
				_prev->_next = this;
    2706:	68c2      	ldr	r2, [r0, #12]
				timer->_ms -= _ms;
    2708:	1acb      	subs	r3, r1, r3
				_prev->_next = this;
    270a:	6090      	str	r0, [r2, #8]
				_state = TimerActive;
    270c:	4621      	mov	r1, r4
				timer->_ms -= _ms;
    270e:	f8cc 3000 	str.w	r3, [ip]
				_state = TimerActive;
    2712:	7507      	strb	r7, [r0, #20]
    2714:	e7ab      	b.n	266e <MillisTimer::runFromTimer()+0xae>
		_next = nullptr;
    2716:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2718:	60c4      	str	r4, [r0, #12]
    271a:	4601      	mov	r1, r0
    271c:	e7a6      	b.n	266c <MillisTimer::runFromTimer()+0xac>
			if (firstYield == nullptr) {
    271e:	f8df e094 	ldr.w	lr, [pc, #148]	; 27b4 <MillisTimer::runFromTimer()+0x1f4>
    2722:	f8de 1000 	ldr.w	r1, [lr]
    2726:	b339      	cbz	r1, 2778 <MillisTimer::runFromTimer()+0x1b8>
				_prev = lastYield;
    2728:	491e      	ldr	r1, [pc, #120]	; (27a4 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    272a:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    272c:	680b      	ldr	r3, [r1, #0]
    272e:	6183      	str	r3, [r0, #24]
				lastYield = this;
    2730:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2732:	6158      	str	r0, [r3, #20]
    2734:	e76e      	b.n	2614 <MillisTimer::runFromTimer()+0x54>
			if (firstInterrupt == nullptr) {
    2736:	6839      	ldr	r1, [r7, #0]
    2738:	b329      	cbz	r1, 2786 <MillisTimer::runFromTimer()+0x1c6>
				_prev = lastInterrupt;
    273a:	491b      	ldr	r1, [pc, #108]	; (27a8 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    273c:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    273e:	680b      	ldr	r3, [r1, #0]
    2740:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    2742:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2744:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2746:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    274a:	f8c8 3000 	str.w	r3, [r8]
    274e:	e761      	b.n	2614 <MillisTimer::runFromTimer()+0x54>
				_prev = timer->_prev;
    2750:	68d2      	ldr	r2, [r2, #12]
    2752:	60e2      	str	r2, [r4, #12]
				_next = timer;
    2754:	f8c4 e008 	str.w	lr, [r4, #8]
				timer->_prev = this;
    2758:	f8ce 400c 	str.w	r4, [lr, #12]
				_prev->_next = this;
    275c:	68e2      	ldr	r2, [r4, #12]
				timer->_ms -= _ms;
    275e:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    2760:	2102      	movs	r1, #2
				_prev->_next = this;
    2762:	6094      	str	r4, [r2, #8]
				timer->_ms -= _ms;
    2764:	f8ce 3000 	str.w	r3, [lr]
				_state = TimerActive;
    2768:	7521      	strb	r1, [r4, #20]
    276a:	4604      	mov	r4, r0
    276c:	e75b      	b.n	2626 <MillisTimer::runFromTimer()+0x66>
		_next = nullptr;
    276e:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2770:	60e0      	str	r0, [r4, #12]
		listActive = this;
    2772:	6014      	str	r4, [r2, #0]
    2774:	4620      	mov	r0, r4
    2776:	e790      	b.n	269a <MillisTimer::runFromTimer()+0xda>
				lastYield = this;
    2778:	4b0a      	ldr	r3, [pc, #40]	; (27a4 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    277a:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    277c:	6181      	str	r1, [r0, #24]
				firstYield = this;
    277e:	f8ce 0000 	str.w	r0, [lr]
				lastYield = this;
    2782:	6018      	str	r0, [r3, #0]
    2784:	e746      	b.n	2614 <MillisTimer::runFromTimer()+0x54>
				lastInterrupt = this;
    2786:	4b08      	ldr	r3, [pc, #32]	; (27a8 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2788:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    278a:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    278c:	6038      	str	r0, [r7, #0]
				lastInterrupt = this;
    278e:	6018      	str	r0, [r3, #0]
    2790:	e7d9      	b.n	2746 <MillisTimer::runFromTimer()+0x186>
    2792:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    2796:	bf00      	nop
    2798:	1fff9498 	.word	0x1fff9498
    279c:	1fff9490 	.word	0x1fff9490
    27a0:	1fff94a8 	.word	0x1fff94a8
    27a4:	1fff949c 	.word	0x1fff949c
    27a8:	1fff9494 	.word	0x1fff9494
    27ac:	000024ed 	.word	0x000024ed
    27b0:	e000ed04 	.word	0xe000ed04
    27b4:	1fff94a0 	.word	0x1fff94a0

000027b8 <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    27b8:	4a02      	ldr	r2, [pc, #8]	; (27c4 <systick_isr+0xc>)
    27ba:	6813      	ldr	r3, [r2, #0]
    27bc:	3301      	adds	r3, #1
    27be:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    27c0:	f7ff befe 	b.w	25c0 <MillisTimer::runFromTimer()>
    27c4:	1fff9390 	.word	0x1fff9390

000027c8 <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    27c8:	4770      	bx	lr
    27ca:	bf00      	nop

000027cc <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    27cc:	4770      	bx	lr
    27ce:	bf00      	nop

000027d0 <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    27d0:	4770      	bx	lr
    27d2:	bf00      	nop

000027d4 <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    27d4:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    27d6:	4829      	ldr	r0, [pc, #164]	; (287c <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    27d8:	4a29      	ldr	r2, [pc, #164]	; (2880 <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    27da:	4b2a      	ldr	r3, [pc, #168]	; (2884 <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    27dc:	4d2a      	ldr	r5, [pc, #168]	; (2888 <analog_init+0xb4>)
	VREF_TRM = 0x60;
    27de:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    27e0:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    27e2:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    27e4:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    27e6:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    27e8:	4c28      	ldr	r4, [pc, #160]	; (288c <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    27ea:	2b08      	cmp	r3, #8
    27ec:	d030      	beq.n	2850 <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    27ee:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    27f0:	4827      	ldr	r0, [pc, #156]	; (2890 <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    27f2:	4928      	ldr	r1, [pc, #160]	; (2894 <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    27f4:	d037      	beq.n	2866 <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    27f6:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    27f8:	bf0c      	ite	eq
    27fa:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    27fc:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    27fe:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2800:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2802:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2804:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2806:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    2808:	4b23      	ldr	r3, [pc, #140]	; (2898 <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    280a:	4924      	ldr	r1, [pc, #144]	; (289c <analog_init+0xc8>)
	if (analog_reference_internal) {
    280c:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    280e:	4a24      	ldr	r2, [pc, #144]	; (28a0 <analog_init+0xcc>)
	if (analog_reference_internal) {
    2810:	b1bb      	cbz	r3, 2842 <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2812:	2301      	movs	r3, #1
    2814:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2816:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    2818:	4b22      	ldr	r3, [pc, #136]	; (28a4 <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    281a:	4923      	ldr	r1, [pc, #140]	; (28a8 <analog_init+0xd4>)
	num = analog_num_average;
    281c:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    281e:	4a23      	ldr	r2, [pc, #140]	; (28ac <analog_init+0xd8>)
	if (num <= 1) {
    2820:	2b01      	cmp	r3, #1
    2822:	d926      	bls.n	2872 <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    2824:	2b04      	cmp	r3, #4
    2826:	d90f      	bls.n	2848 <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    2828:	2b08      	cmp	r3, #8
    282a:	d91e      	bls.n	286a <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    282c:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    282e:	bf94      	ite	ls
    2830:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2832:	2387      	movhi	r3, #135	; 0x87
    2834:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2836:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    2838:	4b1d      	ldr	r3, [pc, #116]	; (28b0 <analog_init+0xdc>)
    283a:	2201      	movs	r2, #1
    283c:	701a      	strb	r2, [r3, #0]
}
    283e:	bc30      	pop	{r4, r5}
    2840:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2842:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2844:	6013      	str	r3, [r2, #0]
    2846:	e7e7      	b.n	2818 <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2848:	2384      	movs	r3, #132	; 0x84
    284a:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    284c:	6013      	str	r3, [r2, #0]
    284e:	e7f3      	b.n	2838 <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2850:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2854:	490f      	ldr	r1, [pc, #60]	; (2894 <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2856:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2858:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    285a:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    285c:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    285e:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2860:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2862:	600b      	str	r3, [r1, #0]
    2864:	e7d0      	b.n	2808 <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2866:	2239      	movs	r2, #57	; 0x39
    2868:	e7f7      	b.n	285a <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    286a:	2385      	movs	r3, #133	; 0x85
    286c:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    286e:	6013      	str	r3, [r2, #0]
    2870:	e7e2      	b.n	2838 <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    2872:	2380      	movs	r3, #128	; 0x80
    2874:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2876:	6013      	str	r3, [r2, #0]
    2878:	e7de      	b.n	2838 <analog_init+0x64>
    287a:	bf00      	nop
    287c:	40074000 	.word	0x40074000
    2880:	40074001 	.word	0x40074001
    2884:	1fff8904 	.word	0x1fff8904
    2888:	4003b008 	.word	0x4003b008
    288c:	4003b00c 	.word	0x4003b00c
    2890:	400bb008 	.word	0x400bb008
    2894:	400bb00c 	.word	0x400bb00c
    2898:	1fff94ad 	.word	0x1fff94ad
    289c:	4003b020 	.word	0x4003b020
    28a0:	400bb020 	.word	0x400bb020
    28a4:	1fff8905 	.word	0x1fff8905
    28a8:	4003b024 	.word	0x4003b024
    28ac:	400bb024 	.word	0x400bb024
    28b0:	1fff94ac 	.word	0x1fff94ac

000028b4 <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    28b4:	4a05      	ldr	r2, [pc, #20]	; (28cc <serial_available+0x18>)
	tail = rx_buffer_tail;
    28b6:	4b06      	ldr	r3, [pc, #24]	; (28d0 <serial_available+0x1c>)
	head = rx_buffer_head;
    28b8:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    28ba:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    28bc:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    28be:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    28c0:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    28c2:	bf38      	it	cc
    28c4:	3040      	addcc	r0, #64	; 0x40
    28c6:	1ac0      	subs	r0, r0, r3
}
    28c8:	4770      	bx	lr
    28ca:	bf00      	nop
    28cc:	1fff9538 	.word	0x1fff9538
    28d0:	1fff94b5 	.word	0x1fff94b5

000028d4 <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    28d4:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    28d6:	4b38      	ldr	r3, [pc, #224]	; (29b8 <uart0_status_isr+0xe4>)
    28d8:	791a      	ldrb	r2, [r3, #4]
    28da:	f012 0f30 	tst.w	r2, #48	; 0x30
    28de:	d02c      	beq.n	293a <uart0_status_isr+0x66>
		__disable_irq();
    28e0:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    28e2:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    28e4:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    28e8:	2900      	cmp	r1, #0
    28ea:	d03d      	beq.n	2968 <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    28ec:	b662      	cpsie	i
			head = rx_buffer_head;
    28ee:	4f33      	ldr	r7, [pc, #204]	; (29bc <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    28f0:	4933      	ldr	r1, [pc, #204]	; (29c0 <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    28f2:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    28f4:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    28f6:	4e33      	ldr	r6, [pc, #204]	; (29c4 <uart0_status_isr+0xf0>)
					n = UART0_D;
    28f8:	461c      	mov	r4, r3
			head = rx_buffer_head;
    28fa:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    28fc:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    28fe:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2900:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    2902:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2904:	bf28      	it	cs
    2906:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2908:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    290a:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    290e:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2910:	bf1c      	itt	ne
    2912:	54f1      	strbne	r1, [r6, r3]
    2914:	4618      	movne	r0, r3
			} while (--avail > 0);
    2916:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    291a:	d1f0      	bne.n	28fe <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    291c:	4b2a      	ldr	r3, [pc, #168]	; (29c8 <uart0_status_isr+0xf4>)
    291e:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2920:	b2c2      	uxtb	r2, r0
    2922:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2924:	b14b      	cbz	r3, 293a <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2926:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2928:	bf36      	itet	cc
    292a:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    292e:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2930:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2932:	2827      	cmp	r0, #39	; 0x27
    2934:	bfc4      	itt	gt
    2936:	2201      	movgt	r2, #1
    2938:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    293a:	491f      	ldr	r1, [pc, #124]	; (29b8 <uart0_status_isr+0xe4>)
    293c:	78ca      	ldrb	r2, [r1, #3]
    293e:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2940:	0615      	lsls	r5, r2, #24
    2942:	d416      	bmi.n	2972 <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    2944:	0652      	lsls	r2, r2, #25
    2946:	d50d      	bpl.n	2964 <uart0_status_isr+0x90>
    2948:	4b1b      	ldr	r3, [pc, #108]	; (29b8 <uart0_status_isr+0xe4>)
    294a:	791b      	ldrb	r3, [r3, #4]
    294c:	065b      	lsls	r3, r3, #25
    294e:	d509      	bpl.n	2964 <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2950:	4b1e      	ldr	r3, [pc, #120]	; (29cc <uart0_status_isr+0xf8>)
		transmitting = 0;
    2952:	491f      	ldr	r1, [pc, #124]	; (29d0 <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2954:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2956:	2200      	movs	r2, #0
    2958:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    295a:	b103      	cbz	r3, 295e <uart0_status_isr+0x8a>
    295c:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    295e:	4b16      	ldr	r3, [pc, #88]	; (29b8 <uart0_status_isr+0xe4>)
    2960:	223c      	movs	r2, #60	; 0x3c
    2962:	70da      	strb	r2, [r3, #3]
	}
}
    2964:	bcf0      	pop	{r4, r5, r6, r7}
    2966:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2968:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    296a:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    296c:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    296e:	b662      	cpsie	i
    2970:	e7e3      	b.n	293a <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2972:	790b      	ldrb	r3, [r1, #4]
    2974:	061c      	lsls	r4, r3, #24
    2976:	d5e5      	bpl.n	2944 <uart0_status_isr+0x70>
		head = tx_buffer_head;
    2978:	4b16      	ldr	r3, [pc, #88]	; (29d4 <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    297a:	4e17      	ldr	r6, [pc, #92]	; (29d8 <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    297c:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    297e:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2980:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    2982:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2984:	429c      	cmp	r4, r3
    2986:	d00e      	beq.n	29a6 <uart0_status_isr+0xd2>
    2988:	4d14      	ldr	r5, [pc, #80]	; (29dc <uart0_status_isr+0x108>)
    298a:	e001      	b.n	2990 <uart0_status_isr+0xbc>
    298c:	42a3      	cmp	r3, r4
    298e:	d00a      	beq.n	29a6 <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    2990:	3301      	adds	r3, #1
    2992:	2b40      	cmp	r3, #64	; 0x40
    2994:	bf28      	it	cs
    2996:	2300      	movcs	r3, #0
			avail = UART0_S1;
    2998:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    299a:	5ce8      	ldrb	r0, [r5, r3]
    299c:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    299e:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    29a0:	7d08      	ldrb	r0, [r1, #20]
    29a2:	2807      	cmp	r0, #7
    29a4:	d9f2      	bls.n	298c <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    29a6:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    29a8:	4903      	ldr	r1, [pc, #12]	; (29b8 <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    29aa:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    29ac:	790b      	ldrb	r3, [r1, #4]
    29ae:	0618      	lsls	r0, r3, #24
    29b0:	bf44      	itt	mi
    29b2:	237c      	movmi	r3, #124	; 0x7c
    29b4:	70cb      	strbmi	r3, [r1, #3]
    29b6:	e7c5      	b.n	2944 <uart0_status_isr+0x70>
    29b8:	4006a000 	.word	0x4006a000
    29bc:	1fff9538 	.word	0x1fff9538
    29c0:	1fff94b5 	.word	0x1fff94b5
    29c4:	1fff94f8 	.word	0x1fff94f8
    29c8:	1fff94b0 	.word	0x1fff94b0
    29cc:	1fff953c 	.word	0x1fff953c
    29d0:	1fff94b4 	.word	0x1fff94b4
    29d4:	1fff9540 	.word	0x1fff9540
    29d8:	1fff9539 	.word	0x1fff9539
    29dc:	1fff94b8 	.word	0x1fff94b8

000029e0 <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    29e0:	4a05      	ldr	r2, [pc, #20]	; (29f8 <serial2_available+0x18>)
	tail = rx_buffer_tail;
    29e2:	4b06      	ldr	r3, [pc, #24]	; (29fc <serial2_available+0x1c>)
	head = rx_buffer_head;
    29e4:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    29e6:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    29e8:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    29ea:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    29ec:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    29ee:	bf38      	it	cc
    29f0:	3040      	addcc	r0, #64	; 0x40
    29f2:	1ac0      	subs	r0, r0, r3
}
    29f4:	4770      	bx	lr
    29f6:	bf00      	nop
    29f8:	1fff95b4 	.word	0x1fff95b4
    29fc:	1fff9549 	.word	0x1fff9549

00002a00 <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    2a00:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    2a02:	4b38      	ldr	r3, [pc, #224]	; (2ae4 <uart1_status_isr+0xe4>)
    2a04:	791a      	ldrb	r2, [r3, #4]
    2a06:	f012 0f30 	tst.w	r2, #48	; 0x30
    2a0a:	d02c      	beq.n	2a66 <uart1_status_isr+0x66>
		__disable_irq();
    2a0c:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    2a0e:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2a10:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2a14:	2900      	cmp	r1, #0
    2a16:	d03d      	beq.n	2a94 <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2a18:	b662      	cpsie	i
			head = rx_buffer_head;
    2a1a:	4f33      	ldr	r7, [pc, #204]	; (2ae8 <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2a1c:	4933      	ldr	r1, [pc, #204]	; (2aec <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    2a1e:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2a20:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2a22:	4e33      	ldr	r6, [pc, #204]	; (2af0 <uart1_status_isr+0xf0>)
					n = UART1_D;
    2a24:	461c      	mov	r4, r3
			head = rx_buffer_head;
    2a26:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2a28:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2a2a:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2a2c:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    2a2e:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2a30:	bf28      	it	cs
    2a32:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2a34:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2a36:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    2a3a:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2a3c:	bf1c      	itt	ne
    2a3e:	54f1      	strbne	r1, [r6, r3]
    2a40:	4618      	movne	r0, r3
			} while (--avail > 0);
    2a42:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2a46:	d1f0      	bne.n	2a2a <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2a48:	4b2a      	ldr	r3, [pc, #168]	; (2af4 <uart1_status_isr+0xf4>)
    2a4a:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2a4c:	b2c2      	uxtb	r2, r0
    2a4e:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2a50:	b14b      	cbz	r3, 2a66 <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2a52:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2a54:	bf36      	itet	cc
    2a56:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2a5a:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2a5c:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2a5e:	2827      	cmp	r0, #39	; 0x27
    2a60:	bfc4      	itt	gt
    2a62:	2201      	movgt	r2, #1
    2a64:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    2a66:	491f      	ldr	r1, [pc, #124]	; (2ae4 <uart1_status_isr+0xe4>)
    2a68:	78ca      	ldrb	r2, [r1, #3]
    2a6a:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2a6c:	0615      	lsls	r5, r2, #24
    2a6e:	d416      	bmi.n	2a9e <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    2a70:	0652      	lsls	r2, r2, #25
    2a72:	d50d      	bpl.n	2a90 <uart1_status_isr+0x90>
    2a74:	4b1b      	ldr	r3, [pc, #108]	; (2ae4 <uart1_status_isr+0xe4>)
    2a76:	791b      	ldrb	r3, [r3, #4]
    2a78:	065b      	lsls	r3, r3, #25
    2a7a:	d509      	bpl.n	2a90 <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2a7c:	4b1e      	ldr	r3, [pc, #120]	; (2af8 <uart1_status_isr+0xf8>)
		transmitting = 0;
    2a7e:	491f      	ldr	r1, [pc, #124]	; (2afc <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2a80:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2a82:	2200      	movs	r2, #0
    2a84:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2a86:	b103      	cbz	r3, 2a8a <uart1_status_isr+0x8a>
    2a88:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    2a8a:	4b16      	ldr	r3, [pc, #88]	; (2ae4 <uart1_status_isr+0xe4>)
    2a8c:	223c      	movs	r2, #60	; 0x3c
    2a8e:	70da      	strb	r2, [r3, #3]
	}
}
    2a90:	bcf0      	pop	{r4, r5, r6, r7}
    2a92:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2a94:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    2a96:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2a98:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    2a9a:	b662      	cpsie	i
    2a9c:	e7e3      	b.n	2a66 <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2a9e:	790b      	ldrb	r3, [r1, #4]
    2aa0:	061c      	lsls	r4, r3, #24
    2aa2:	d5e5      	bpl.n	2a70 <uart1_status_isr+0x70>
		head = tx_buffer_head;
    2aa4:	4b16      	ldr	r3, [pc, #88]	; (2b00 <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    2aa6:	4e17      	ldr	r6, [pc, #92]	; (2b04 <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    2aa8:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    2aaa:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2aac:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    2aae:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2ab0:	429c      	cmp	r4, r3
    2ab2:	d00e      	beq.n	2ad2 <uart1_status_isr+0xd2>
    2ab4:	4d14      	ldr	r5, [pc, #80]	; (2b08 <uart1_status_isr+0x108>)
    2ab6:	e001      	b.n	2abc <uart1_status_isr+0xbc>
    2ab8:	42a3      	cmp	r3, r4
    2aba:	d00a      	beq.n	2ad2 <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    2abc:	3301      	adds	r3, #1
    2abe:	2b28      	cmp	r3, #40	; 0x28
    2ac0:	bf28      	it	cs
    2ac2:	2300      	movcs	r3, #0
			avail = UART1_S1;
    2ac4:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    2ac6:	5ce8      	ldrb	r0, [r5, r3]
    2ac8:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    2aca:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    2acc:	7d08      	ldrb	r0, [r1, #20]
    2ace:	2807      	cmp	r0, #7
    2ad0:	d9f2      	bls.n	2ab8 <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    2ad2:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    2ad4:	4903      	ldr	r1, [pc, #12]	; (2ae4 <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    2ad6:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    2ad8:	790b      	ldrb	r3, [r1, #4]
    2ada:	0618      	lsls	r0, r3, #24
    2adc:	bf44      	itt	mi
    2ade:	237c      	movmi	r3, #124	; 0x7c
    2ae0:	70cb      	strbmi	r3, [r1, #3]
    2ae2:	e7c5      	b.n	2a70 <uart1_status_isr+0x70>
    2ae4:	4006b000 	.word	0x4006b000
    2ae8:	1fff95b4 	.word	0x1fff95b4
    2aec:	1fff9549 	.word	0x1fff9549
    2af0:	1fff9574 	.word	0x1fff9574
    2af4:	1fff9544 	.word	0x1fff9544
    2af8:	1fff95b8 	.word	0x1fff95b8
    2afc:	1fff9548 	.word	0x1fff9548
    2b00:	1fff95bc 	.word	0x1fff95bc
    2b04:	1fff95b5 	.word	0x1fff95b5
    2b08:	1fff954c 	.word	0x1fff954c

00002b0c <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2b0c:	4a05      	ldr	r2, [pc, #20]	; (2b24 <serial3_available+0x18>)
	tail = rx_buffer_tail;
    2b0e:	4b06      	ldr	r3, [pc, #24]	; (2b28 <serial3_available+0x1c>)
	head = rx_buffer_head;
    2b10:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2b12:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2b14:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2b16:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2b18:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    2b1a:	bf38      	it	cc
    2b1c:	3040      	addcc	r0, #64	; 0x40
    2b1e:	1ac0      	subs	r0, r0, r3
}
    2b20:	4770      	bx	lr
    2b22:	bf00      	nop
    2b24:	1fff9630 	.word	0x1fff9630
    2b28:	1fff95c5 	.word	0x1fff95c5

00002b2c <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    2b2c:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    2b2e:	4b2b      	ldr	r3, [pc, #172]	; (2bdc <uart2_status_isr+0xb0>)
    2b30:	791a      	ldrb	r2, [r3, #4]
    2b32:	0694      	lsls	r4, r2, #26
    2b34:	d51f      	bpl.n	2b76 <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    2b36:	482a      	ldr	r0, [pc, #168]	; (2be0 <uart2_status_isr+0xb4>)
			n = UART2_D;
    2b38:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    2b3a:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    2b3c:	4929      	ldr	r1, [pc, #164]	; (2be4 <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    2b3e:	3301      	adds	r3, #1
    2b40:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    2b42:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    2b44:	bfc8      	it	gt
    2b46:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    2b48:	428b      	cmp	r3, r1
			n = UART2_D;
    2b4a:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    2b4c:	d003      	beq.n	2b56 <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    2b4e:	4c26      	ldr	r4, [pc, #152]	; (2be8 <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    2b50:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    2b52:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    2b54:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    2b56:	4a25      	ldr	r2, [pc, #148]	; (2bec <uart2_status_isr+0xc0>)
    2b58:	6811      	ldr	r1, [r2, #0]
    2b5a:	b161      	cbz	r1, 2b76 <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    2b5c:	4a24      	ldr	r2, [pc, #144]	; (2bf0 <uart2_status_isr+0xc4>)
    2b5e:	7812      	ldrb	r2, [r2, #0]
    2b60:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    2b62:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2b64:	bf36      	itet	cc
    2b66:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    2b6a:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2b6c:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2b6e:	2b27      	cmp	r3, #39	; 0x27
    2b70:	bfc4      	itt	gt
    2b72:	2301      	movgt	r3, #1
    2b74:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    2b76:	4a19      	ldr	r2, [pc, #100]	; (2bdc <uart2_status_isr+0xb0>)
    2b78:	78d3      	ldrb	r3, [r2, #3]
    2b7a:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2b7c:	0618      	lsls	r0, r3, #24
    2b7e:	d411      	bmi.n	2ba4 <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    2b80:	065a      	lsls	r2, r3, #25
    2b82:	d50d      	bpl.n	2ba0 <uart2_status_isr+0x74>
    2b84:	4b15      	ldr	r3, [pc, #84]	; (2bdc <uart2_status_isr+0xb0>)
    2b86:	791b      	ldrb	r3, [r3, #4]
    2b88:	065b      	lsls	r3, r3, #25
    2b8a:	d509      	bpl.n	2ba0 <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2b8c:	4b19      	ldr	r3, [pc, #100]	; (2bf4 <uart2_status_isr+0xc8>)
		transmitting = 0;
    2b8e:	491a      	ldr	r1, [pc, #104]	; (2bf8 <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    2b90:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2b92:	2200      	movs	r2, #0
    2b94:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2b96:	b103      	cbz	r3, 2b9a <uart2_status_isr+0x6e>
    2b98:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    2b9a:	4b10      	ldr	r3, [pc, #64]	; (2bdc <uart2_status_isr+0xb0>)
    2b9c:	222c      	movs	r2, #44	; 0x2c
    2b9e:	70da      	strb	r2, [r3, #3]
	}
}
    2ba0:	bc30      	pop	{r4, r5}
    2ba2:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2ba4:	7911      	ldrb	r1, [r2, #4]
    2ba6:	0609      	lsls	r1, r1, #24
    2ba8:	d5ea      	bpl.n	2b80 <uart2_status_isr+0x54>
		head = tx_buffer_head;
    2baa:	4914      	ldr	r1, [pc, #80]	; (2bfc <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    2bac:	4810      	ldr	r0, [pc, #64]	; (2bf0 <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    2bae:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    2bb0:	7801      	ldrb	r1, [r0, #0]
    2bb2:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    2bb4:	428c      	cmp	r4, r1
    2bb6:	d00d      	beq.n	2bd4 <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    2bb8:	1c4a      	adds	r2, r1, #1
    2bba:	2a27      	cmp	r2, #39	; 0x27
    2bbc:	bf84      	itt	hi
    2bbe:	2100      	movhi	r1, #0
    2bc0:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    2bc2:	4d0f      	ldr	r5, [pc, #60]	; (2c00 <uart2_status_isr+0xd4>)
			UART2_D = n;
    2bc4:	4c05      	ldr	r4, [pc, #20]	; (2bdc <uart2_status_isr+0xb0>)
    2bc6:	bf98      	it	ls
    2bc8:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    2bca:	5caa      	ldrb	r2, [r5, r2]
    2bcc:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    2bce:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    2bd0:	7001      	strb	r1, [r0, #0]
    2bd2:	e7d5      	b.n	2b80 <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    2bd4:	216c      	movs	r1, #108	; 0x6c
    2bd6:	70d1      	strb	r1, [r2, #3]
    2bd8:	e7d2      	b.n	2b80 <uart2_status_isr+0x54>
    2bda:	bf00      	nop
    2bdc:	4006c000 	.word	0x4006c000
    2be0:	1fff9630 	.word	0x1fff9630
    2be4:	1fff95c5 	.word	0x1fff95c5
    2be8:	1fff95f0 	.word	0x1fff95f0
    2bec:	1fff95c0 	.word	0x1fff95c0
    2bf0:	1fff9631 	.word	0x1fff9631
    2bf4:	1fff9634 	.word	0x1fff9634
    2bf8:	1fff95c4 	.word	0x1fff95c4
    2bfc:	1fff9638 	.word	0x1fff9638
    2c00:	1fff95c8 	.word	0x1fff95c8

00002c04 <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    2c04:	b570      	push	{r4, r5, r6, lr}
    2c06:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    2c08:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2c0a:	4b30      	ldr	r3, [pc, #192]	; (2ccc <usb_init_serialnumber+0xc8>)
	FTFL_FCCOB0 = 0x41;
    2c0c:	4d30      	ldr	r5, [pc, #192]	; (2cd0 <usb_init_serialnumber+0xcc>)
	FTFL_FCCOB1 = 15;
    2c0e:	4831      	ldr	r0, [pc, #196]	; (2cd4 <usb_init_serialnumber+0xd0>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2c10:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    2c12:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    2c14:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2c16:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2c18:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    2c1a:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2c1c:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    2c1e:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2c20:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2c22:	7813      	ldrb	r3, [r2, #0]
    2c24:	061b      	lsls	r3, r3, #24
    2c26:	d5fc      	bpl.n	2c22 <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    2c28:	4b2b      	ldr	r3, [pc, #172]	; (2cd8 <usb_init_serialnumber+0xd4>)
    2c2a:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    2c2c:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    2c2e:	4b2b      	ldr	r3, [pc, #172]	; (2cdc <usb_init_serialnumber+0xd8>)
    2c30:	4298      	cmp	r0, r3
    2c32:	bf98      	it	ls
    2c34:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    2c38:	f04f 020a 	mov.w	r2, #10
	if (num < 10000000) num = num * 10;
    2c3c:	bf98      	it	ls
    2c3e:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    2c40:	a901      	add	r1, sp, #4
    2c42:	f7fe f917 	bl	e74 <ultoa>
	for (i=0; i<10; i++) {
		char c = buf[i];
    2c46:	f89d 2004 	ldrb.w	r2, [sp, #4]
    2c4a:	4b25      	ldr	r3, [pc, #148]	; (2ce0 <usb_init_serialnumber+0xdc>)
		if (!c) break;
    2c4c:	b352      	cbz	r2, 2ca4 <usb_init_serialnumber+0xa0>
		char c = buf[i];
    2c4e:	f89d 1005 	ldrb.w	r1, [sp, #5]
		usb_string_serial_number_default.wString[i] = c;
    2c52:	805a      	strh	r2, [r3, #2]
		if (!c) break;
    2c54:	b361      	cbz	r1, 2cb0 <usb_init_serialnumber+0xac>
		char c = buf[i];
    2c56:	f89d 2006 	ldrb.w	r2, [sp, #6]
		usb_string_serial_number_default.wString[i] = c;
    2c5a:	8099      	strh	r1, [r3, #4]
		if (!c) break;
    2c5c:	b352      	cbz	r2, 2cb4 <usb_init_serialnumber+0xb0>
		char c = buf[i];
    2c5e:	f89d 1007 	ldrb.w	r1, [sp, #7]
		usb_string_serial_number_default.wString[i] = c;
    2c62:	80da      	strh	r2, [r3, #6]
		if (!c) break;
    2c64:	b341      	cbz	r1, 2cb8 <usb_init_serialnumber+0xb4>
		char c = buf[i];
    2c66:	f89d 2008 	ldrb.w	r2, [sp, #8]
		usb_string_serial_number_default.wString[i] = c;
    2c6a:	8119      	strh	r1, [r3, #8]
		if (!c) break;
    2c6c:	b332      	cbz	r2, 2cbc <usb_init_serialnumber+0xb8>
		char c = buf[i];
    2c6e:	f89d 1009 	ldrb.w	r1, [sp, #9]
		usb_string_serial_number_default.wString[i] = c;
    2c72:	815a      	strh	r2, [r3, #10]
		if (!c) break;
    2c74:	b321      	cbz	r1, 2cc0 <usb_init_serialnumber+0xbc>
		char c = buf[i];
    2c76:	f89d 200a 	ldrb.w	r2, [sp, #10]
		usb_string_serial_number_default.wString[i] = c;
    2c7a:	8199      	strh	r1, [r3, #12]
		if (!c) break;
    2c7c:	b312      	cbz	r2, 2cc4 <usb_init_serialnumber+0xc0>
		char c = buf[i];
    2c7e:	f89d 100b 	ldrb.w	r1, [sp, #11]
		usb_string_serial_number_default.wString[i] = c;
    2c82:	81da      	strh	r2, [r3, #14]
		if (!c) break;
    2c84:	b301      	cbz	r1, 2cc8 <usb_init_serialnumber+0xc4>
		char c = buf[i];
    2c86:	f89d 200c 	ldrb.w	r2, [sp, #12]
		usb_string_serial_number_default.wString[i] = c;
    2c8a:	8219      	strh	r1, [r3, #16]
		if (!c) break;
    2c8c:	b14a      	cbz	r2, 2ca2 <usb_init_serialnumber+0x9e>
		char c = buf[i];
    2c8e:	f89d 100d 	ldrb.w	r1, [sp, #13]
		usb_string_serial_number_default.wString[i] = c;
    2c92:	825a      	strh	r2, [r3, #18]
	for (i=0; i<10; i++) {
    2c94:	2209      	movs	r2, #9
		if (!c) break;
    2c96:	b129      	cbz	r1, 2ca4 <usb_init_serialnumber+0xa0>
    2c98:	2216      	movs	r2, #22
		usb_string_serial_number_default.wString[i] = c;
    2c9a:	8299      	strh	r1, [r3, #20]
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    2c9c:	701a      	strb	r2, [r3, #0]
}
    2c9e:	b004      	add	sp, #16
    2ca0:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    2ca2:	2208      	movs	r2, #8
    2ca4:	3201      	adds	r2, #1
    2ca6:	0052      	lsls	r2, r2, #1
    2ca8:	b2d2      	uxtb	r2, r2
	usb_string_serial_number_default.bLength = i * 2 + 2;
    2caa:	701a      	strb	r2, [r3, #0]
}
    2cac:	b004      	add	sp, #16
    2cae:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    2cb0:	2201      	movs	r2, #1
    2cb2:	e7f7      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2cb4:	2202      	movs	r2, #2
    2cb6:	e7f5      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2cb8:	2203      	movs	r2, #3
    2cba:	e7f3      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2cbc:	2204      	movs	r2, #4
    2cbe:	e7f1      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2cc0:	2205      	movs	r2, #5
    2cc2:	e7ef      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2cc4:	2206      	movs	r2, #6
    2cc6:	e7ed      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2cc8:	2207      	movs	r2, #7
    2cca:	e7eb      	b.n	2ca4 <usb_init_serialnumber+0xa0>
    2ccc:	40020000 	.word	0x40020000
    2cd0:	40020007 	.word	0x40020007
    2cd4:	40020006 	.word	0x40020006
    2cd8:	40020008 	.word	0x40020008
    2cdc:	0098967f 	.word	0x0098967f
    2ce0:	1fff8994 	.word	0x1fff8994

00002ce4 <__aeabi_atexit>:
    2ce4:	460b      	mov	r3, r1
    2ce6:	4601      	mov	r1, r0
    2ce8:	4618      	mov	r0, r3
    2cea:	f000 bad5 	b.w	3298 <__cxa_atexit>
    2cee:	bf00      	nop

00002cf0 <__aeabi_frsub>:
    2cf0:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
    2cf4:	e002      	b.n	2cfc <__addsf3>
    2cf6:	bf00      	nop

00002cf8 <__aeabi_fsub>:
    2cf8:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

00002cfc <__addsf3>:
    2cfc:	0042      	lsls	r2, r0, #1
    2cfe:	bf1f      	itttt	ne
    2d00:	ea5f 0341 	movsne.w	r3, r1, lsl #1
    2d04:	ea92 0f03 	teqne	r2, r3
    2d08:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
    2d0c:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    2d10:	d06a      	beq.n	2de8 <__addsf3+0xec>
    2d12:	ea4f 6212 	mov.w	r2, r2, lsr #24
    2d16:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
    2d1a:	bfc1      	itttt	gt
    2d1c:	18d2      	addgt	r2, r2, r3
    2d1e:	4041      	eorgt	r1, r0
    2d20:	4048      	eorgt	r0, r1
    2d22:	4041      	eorgt	r1, r0
    2d24:	bfb8      	it	lt
    2d26:	425b      	neglt	r3, r3
    2d28:	2b19      	cmp	r3, #25
    2d2a:	bf88      	it	hi
    2d2c:	4770      	bxhi	lr
    2d2e:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
    2d32:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2d36:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    2d3a:	bf18      	it	ne
    2d3c:	4240      	negne	r0, r0
    2d3e:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    2d42:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
    2d46:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
    2d4a:	bf18      	it	ne
    2d4c:	4249      	negne	r1, r1
    2d4e:	ea92 0f03 	teq	r2, r3
    2d52:	d03f      	beq.n	2dd4 <__addsf3+0xd8>
    2d54:	f1a2 0201 	sub.w	r2, r2, #1
    2d58:	fa41 fc03 	asr.w	ip, r1, r3
    2d5c:	eb10 000c 	adds.w	r0, r0, ip
    2d60:	f1c3 0320 	rsb	r3, r3, #32
    2d64:	fa01 f103 	lsl.w	r1, r1, r3
    2d68:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    2d6c:	d502      	bpl.n	2d74 <__addsf3+0x78>
    2d6e:	4249      	negs	r1, r1
    2d70:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
    2d74:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    2d78:	d313      	bcc.n	2da2 <__addsf3+0xa6>
    2d7a:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
    2d7e:	d306      	bcc.n	2d8e <__addsf3+0x92>
    2d80:	0840      	lsrs	r0, r0, #1
    2d82:	ea4f 0131 	mov.w	r1, r1, rrx
    2d86:	f102 0201 	add.w	r2, r2, #1
    2d8a:	2afe      	cmp	r2, #254	; 0xfe
    2d8c:	d251      	bcs.n	2e32 <__addsf3+0x136>
    2d8e:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
    2d92:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2d96:	bf08      	it	eq
    2d98:	f020 0001 	biceq.w	r0, r0, #1
    2d9c:	ea40 0003 	orr.w	r0, r0, r3
    2da0:	4770      	bx	lr
    2da2:	0049      	lsls	r1, r1, #1
    2da4:	eb40 0000 	adc.w	r0, r0, r0
    2da8:	f410 0f00 	tst.w	r0, #8388608	; 0x800000
    2dac:	f1a2 0201 	sub.w	r2, r2, #1
    2db0:	d1ed      	bne.n	2d8e <__addsf3+0x92>
    2db2:	fab0 fc80 	clz	ip, r0
    2db6:	f1ac 0c08 	sub.w	ip, ip, #8
    2dba:	ebb2 020c 	subs.w	r2, r2, ip
    2dbe:	fa00 f00c 	lsl.w	r0, r0, ip
    2dc2:	bfaa      	itet	ge
    2dc4:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
    2dc8:	4252      	neglt	r2, r2
    2dca:	4318      	orrge	r0, r3
    2dcc:	bfbc      	itt	lt
    2dce:	40d0      	lsrlt	r0, r2
    2dd0:	4318      	orrlt	r0, r3
    2dd2:	4770      	bx	lr
    2dd4:	f092 0f00 	teq	r2, #0
    2dd8:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
    2ddc:	bf06      	itte	eq
    2dde:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
    2de2:	3201      	addeq	r2, #1
    2de4:	3b01      	subne	r3, #1
    2de6:	e7b5      	b.n	2d54 <__addsf3+0x58>
    2de8:	ea4f 0341 	mov.w	r3, r1, lsl #1
    2dec:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    2df0:	bf18      	it	ne
    2df2:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    2df6:	d021      	beq.n	2e3c <__addsf3+0x140>
    2df8:	ea92 0f03 	teq	r2, r3
    2dfc:	d004      	beq.n	2e08 <__addsf3+0x10c>
    2dfe:	f092 0f00 	teq	r2, #0
    2e02:	bf08      	it	eq
    2e04:	4608      	moveq	r0, r1
    2e06:	4770      	bx	lr
    2e08:	ea90 0f01 	teq	r0, r1
    2e0c:	bf1c      	itt	ne
    2e0e:	2000      	movne	r0, #0
    2e10:	4770      	bxne	lr
    2e12:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
    2e16:	d104      	bne.n	2e22 <__addsf3+0x126>
    2e18:	0040      	lsls	r0, r0, #1
    2e1a:	bf28      	it	cs
    2e1c:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
    2e20:	4770      	bx	lr
    2e22:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
    2e26:	bf3c      	itt	cc
    2e28:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
    2e2c:	4770      	bxcc	lr
    2e2e:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    2e32:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
    2e36:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2e3a:	4770      	bx	lr
    2e3c:	ea7f 6222 	mvns.w	r2, r2, asr #24
    2e40:	bf16      	itet	ne
    2e42:	4608      	movne	r0, r1
    2e44:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
    2e48:	4601      	movne	r1, r0
    2e4a:	0242      	lsls	r2, r0, #9
    2e4c:	bf06      	itte	eq
    2e4e:	ea5f 2341 	movseq.w	r3, r1, lsl #9
    2e52:	ea90 0f01 	teqeq	r0, r1
    2e56:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
    2e5a:	4770      	bx	lr

00002e5c <__aeabi_ui2f>:
    2e5c:	f04f 0300 	mov.w	r3, #0
    2e60:	e004      	b.n	2e6c <__aeabi_i2f+0x8>
    2e62:	bf00      	nop

00002e64 <__aeabi_i2f>:
    2e64:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
    2e68:	bf48      	it	mi
    2e6a:	4240      	negmi	r0, r0
    2e6c:	ea5f 0c00 	movs.w	ip, r0
    2e70:	bf08      	it	eq
    2e72:	4770      	bxeq	lr
    2e74:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
    2e78:	4601      	mov	r1, r0
    2e7a:	f04f 0000 	mov.w	r0, #0
    2e7e:	e01c      	b.n	2eba <__aeabi_l2f+0x2a>

00002e80 <__aeabi_ul2f>:
    2e80:	ea50 0201 	orrs.w	r2, r0, r1
    2e84:	bf08      	it	eq
    2e86:	4770      	bxeq	lr
    2e88:	f04f 0300 	mov.w	r3, #0
    2e8c:	e00a      	b.n	2ea4 <__aeabi_l2f+0x14>
    2e8e:	bf00      	nop

00002e90 <__aeabi_l2f>:
    2e90:	ea50 0201 	orrs.w	r2, r0, r1
    2e94:	bf08      	it	eq
    2e96:	4770      	bxeq	lr
    2e98:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
    2e9c:	d502      	bpl.n	2ea4 <__aeabi_l2f+0x14>
    2e9e:	4240      	negs	r0, r0
    2ea0:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    2ea4:	ea5f 0c01 	movs.w	ip, r1
    2ea8:	bf02      	ittt	eq
    2eaa:	4684      	moveq	ip, r0
    2eac:	4601      	moveq	r1, r0
    2eae:	2000      	moveq	r0, #0
    2eb0:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
    2eb4:	bf08      	it	eq
    2eb6:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
    2eba:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
    2ebe:	fabc f28c 	clz	r2, ip
    2ec2:	3a08      	subs	r2, #8
    2ec4:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
    2ec8:	db10      	blt.n	2eec <__aeabi_l2f+0x5c>
    2eca:	fa01 fc02 	lsl.w	ip, r1, r2
    2ece:	4463      	add	r3, ip
    2ed0:	fa00 fc02 	lsl.w	ip, r0, r2
    2ed4:	f1c2 0220 	rsb	r2, r2, #32
    2ed8:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    2edc:	fa20 f202 	lsr.w	r2, r0, r2
    2ee0:	eb43 0002 	adc.w	r0, r3, r2
    2ee4:	bf08      	it	eq
    2ee6:	f020 0001 	biceq.w	r0, r0, #1
    2eea:	4770      	bx	lr
    2eec:	f102 0220 	add.w	r2, r2, #32
    2ef0:	fa01 fc02 	lsl.w	ip, r1, r2
    2ef4:	f1c2 0220 	rsb	r2, r2, #32
    2ef8:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
    2efc:	fa21 f202 	lsr.w	r2, r1, r2
    2f00:	eb43 0002 	adc.w	r0, r3, r2
    2f04:	bf08      	it	eq
    2f06:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    2f0a:	4770      	bx	lr

00002f0c <__aeabi_fmul>:
    2f0c:	f04f 0cff 	mov.w	ip, #255	; 0xff
    2f10:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    2f14:	bf1e      	ittt	ne
    2f16:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    2f1a:	ea92 0f0c 	teqne	r2, ip
    2f1e:	ea93 0f0c 	teqne	r3, ip
    2f22:	d06f      	beq.n	3004 <__aeabi_fmul+0xf8>
    2f24:	441a      	add	r2, r3
    2f26:	ea80 0c01 	eor.w	ip, r0, r1
    2f2a:	0240      	lsls	r0, r0, #9
    2f2c:	bf18      	it	ne
    2f2e:	ea5f 2141 	movsne.w	r1, r1, lsl #9
    2f32:	d01e      	beq.n	2f72 <__aeabi_fmul+0x66>
    2f34:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
    2f38:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
    2f3c:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
    2f40:	fba0 3101 	umull	r3, r1, r0, r1
    2f44:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    2f48:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
    2f4c:	bf3e      	ittt	cc
    2f4e:	0049      	lslcc	r1, r1, #1
    2f50:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
    2f54:	005b      	lslcc	r3, r3, #1
    2f56:	ea40 0001 	orr.w	r0, r0, r1
    2f5a:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
    2f5e:	2afd      	cmp	r2, #253	; 0xfd
    2f60:	d81d      	bhi.n	2f9e <__aeabi_fmul+0x92>
    2f62:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    2f66:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2f6a:	bf08      	it	eq
    2f6c:	f020 0001 	biceq.w	r0, r0, #1
    2f70:	4770      	bx	lr
    2f72:	f090 0f00 	teq	r0, #0
    2f76:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    2f7a:	bf08      	it	eq
    2f7c:	0249      	lsleq	r1, r1, #9
    2f7e:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    2f82:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
    2f86:	3a7f      	subs	r2, #127	; 0x7f
    2f88:	bfc2      	ittt	gt
    2f8a:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    2f8e:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    2f92:	4770      	bxgt	lr
    2f94:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2f98:	f04f 0300 	mov.w	r3, #0
    2f9c:	3a01      	subs	r2, #1
    2f9e:	dc5d      	bgt.n	305c <__aeabi_fmul+0x150>
    2fa0:	f112 0f19 	cmn.w	r2, #25
    2fa4:	bfdc      	itt	le
    2fa6:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
    2faa:	4770      	bxle	lr
    2fac:	f1c2 0200 	rsb	r2, r2, #0
    2fb0:	0041      	lsls	r1, r0, #1
    2fb2:	fa21 f102 	lsr.w	r1, r1, r2
    2fb6:	f1c2 0220 	rsb	r2, r2, #32
    2fba:	fa00 fc02 	lsl.w	ip, r0, r2
    2fbe:	ea5f 0031 	movs.w	r0, r1, rrx
    2fc2:	f140 0000 	adc.w	r0, r0, #0
    2fc6:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
    2fca:	bf08      	it	eq
    2fcc:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    2fd0:	4770      	bx	lr
    2fd2:	f092 0f00 	teq	r2, #0
    2fd6:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    2fda:	bf02      	ittt	eq
    2fdc:	0040      	lsleq	r0, r0, #1
    2fde:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    2fe2:	3a01      	subeq	r2, #1
    2fe4:	d0f9      	beq.n	2fda <__aeabi_fmul+0xce>
    2fe6:	ea40 000c 	orr.w	r0, r0, ip
    2fea:	f093 0f00 	teq	r3, #0
    2fee:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    2ff2:	bf02      	ittt	eq
    2ff4:	0049      	lsleq	r1, r1, #1
    2ff6:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    2ffa:	3b01      	subeq	r3, #1
    2ffc:	d0f9      	beq.n	2ff2 <__aeabi_fmul+0xe6>
    2ffe:	ea41 010c 	orr.w	r1, r1, ip
    3002:	e78f      	b.n	2f24 <__aeabi_fmul+0x18>
    3004:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    3008:	ea92 0f0c 	teq	r2, ip
    300c:	bf18      	it	ne
    300e:	ea93 0f0c 	teqne	r3, ip
    3012:	d00a      	beq.n	302a <__aeabi_fmul+0x11e>
    3014:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    3018:	bf18      	it	ne
    301a:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    301e:	d1d8      	bne.n	2fd2 <__aeabi_fmul+0xc6>
    3020:	ea80 0001 	eor.w	r0, r0, r1
    3024:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    3028:	4770      	bx	lr
    302a:	f090 0f00 	teq	r0, #0
    302e:	bf17      	itett	ne
    3030:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
    3034:	4608      	moveq	r0, r1
    3036:	f091 0f00 	teqne	r1, #0
    303a:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
    303e:	d014      	beq.n	306a <__aeabi_fmul+0x15e>
    3040:	ea92 0f0c 	teq	r2, ip
    3044:	d101      	bne.n	304a <__aeabi_fmul+0x13e>
    3046:	0242      	lsls	r2, r0, #9
    3048:	d10f      	bne.n	306a <__aeabi_fmul+0x15e>
    304a:	ea93 0f0c 	teq	r3, ip
    304e:	d103      	bne.n	3058 <__aeabi_fmul+0x14c>
    3050:	024b      	lsls	r3, r1, #9
    3052:	bf18      	it	ne
    3054:	4608      	movne	r0, r1
    3056:	d108      	bne.n	306a <__aeabi_fmul+0x15e>
    3058:	ea80 0001 	eor.w	r0, r0, r1
    305c:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    3060:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    3064:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3068:	4770      	bx	lr
    306a:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    306e:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
    3072:	4770      	bx	lr

00003074 <__aeabi_fdiv>:
    3074:	f04f 0cff 	mov.w	ip, #255	; 0xff
    3078:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    307c:	bf1e      	ittt	ne
    307e:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    3082:	ea92 0f0c 	teqne	r2, ip
    3086:	ea93 0f0c 	teqne	r3, ip
    308a:	d069      	beq.n	3160 <__aeabi_fdiv+0xec>
    308c:	eba2 0203 	sub.w	r2, r2, r3
    3090:	ea80 0c01 	eor.w	ip, r0, r1
    3094:	0249      	lsls	r1, r1, #9
    3096:	ea4f 2040 	mov.w	r0, r0, lsl #9
    309a:	d037      	beq.n	310c <__aeabi_fdiv+0x98>
    309c:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    30a0:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
    30a4:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
    30a8:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    30ac:	428b      	cmp	r3, r1
    30ae:	bf38      	it	cc
    30b0:	005b      	lslcc	r3, r3, #1
    30b2:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
    30b6:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
    30ba:	428b      	cmp	r3, r1
    30bc:	bf24      	itt	cs
    30be:	1a5b      	subcs	r3, r3, r1
    30c0:	ea40 000c 	orrcs.w	r0, r0, ip
    30c4:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
    30c8:	bf24      	itt	cs
    30ca:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
    30ce:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    30d2:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
    30d6:	bf24      	itt	cs
    30d8:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
    30dc:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    30e0:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
    30e4:	bf24      	itt	cs
    30e6:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
    30ea:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    30ee:	011b      	lsls	r3, r3, #4
    30f0:	bf18      	it	ne
    30f2:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
    30f6:	d1e0      	bne.n	30ba <__aeabi_fdiv+0x46>
    30f8:	2afd      	cmp	r2, #253	; 0xfd
    30fa:	f63f af50 	bhi.w	2f9e <__aeabi_fmul+0x92>
    30fe:	428b      	cmp	r3, r1
    3100:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    3104:	bf08      	it	eq
    3106:	f020 0001 	biceq.w	r0, r0, #1
    310a:	4770      	bx	lr
    310c:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    3110:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    3114:	327f      	adds	r2, #127	; 0x7f
    3116:	bfc2      	ittt	gt
    3118:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    311c:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    3120:	4770      	bxgt	lr
    3122:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3126:	f04f 0300 	mov.w	r3, #0
    312a:	3a01      	subs	r2, #1
    312c:	e737      	b.n	2f9e <__aeabi_fmul+0x92>
    312e:	f092 0f00 	teq	r2, #0
    3132:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    3136:	bf02      	ittt	eq
    3138:	0040      	lsleq	r0, r0, #1
    313a:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    313e:	3a01      	subeq	r2, #1
    3140:	d0f9      	beq.n	3136 <__aeabi_fdiv+0xc2>
    3142:	ea40 000c 	orr.w	r0, r0, ip
    3146:	f093 0f00 	teq	r3, #0
    314a:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    314e:	bf02      	ittt	eq
    3150:	0049      	lsleq	r1, r1, #1
    3152:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    3156:	3b01      	subeq	r3, #1
    3158:	d0f9      	beq.n	314e <__aeabi_fdiv+0xda>
    315a:	ea41 010c 	orr.w	r1, r1, ip
    315e:	e795      	b.n	308c <__aeabi_fdiv+0x18>
    3160:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    3164:	ea92 0f0c 	teq	r2, ip
    3168:	d108      	bne.n	317c <__aeabi_fdiv+0x108>
    316a:	0242      	lsls	r2, r0, #9
    316c:	f47f af7d 	bne.w	306a <__aeabi_fmul+0x15e>
    3170:	ea93 0f0c 	teq	r3, ip
    3174:	f47f af70 	bne.w	3058 <__aeabi_fmul+0x14c>
    3178:	4608      	mov	r0, r1
    317a:	e776      	b.n	306a <__aeabi_fmul+0x15e>
    317c:	ea93 0f0c 	teq	r3, ip
    3180:	d104      	bne.n	318c <__aeabi_fdiv+0x118>
    3182:	024b      	lsls	r3, r1, #9
    3184:	f43f af4c 	beq.w	3020 <__aeabi_fmul+0x114>
    3188:	4608      	mov	r0, r1
    318a:	e76e      	b.n	306a <__aeabi_fmul+0x15e>
    318c:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    3190:	bf18      	it	ne
    3192:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    3196:	d1ca      	bne.n	312e <__aeabi_fdiv+0xba>
    3198:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
    319c:	f47f af5c 	bne.w	3058 <__aeabi_fmul+0x14c>
    31a0:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
    31a4:	f47f af3c 	bne.w	3020 <__aeabi_fmul+0x114>
    31a8:	e75f      	b.n	306a <__aeabi_fmul+0x15e>
    31aa:	bf00      	nop

000031ac <__gesf2>:
    31ac:	f04f 3cff 	mov.w	ip, #4294967295
    31b0:	e006      	b.n	31c0 <__cmpsf2+0x4>
    31b2:	bf00      	nop

000031b4 <__lesf2>:
    31b4:	f04f 0c01 	mov.w	ip, #1
    31b8:	e002      	b.n	31c0 <__cmpsf2+0x4>
    31ba:	bf00      	nop

000031bc <__cmpsf2>:
    31bc:	f04f 0c01 	mov.w	ip, #1
    31c0:	f84d cd04 	str.w	ip, [sp, #-4]!
    31c4:	ea4f 0240 	mov.w	r2, r0, lsl #1
    31c8:	ea4f 0341 	mov.w	r3, r1, lsl #1
    31cc:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    31d0:	bf18      	it	ne
    31d2:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    31d6:	d011      	beq.n	31fc <__cmpsf2+0x40>
    31d8:	b001      	add	sp, #4
    31da:	ea52 0c53 	orrs.w	ip, r2, r3, lsr #1
    31de:	bf18      	it	ne
    31e0:	ea90 0f01 	teqne	r0, r1
    31e4:	bf58      	it	pl
    31e6:	ebb2 0003 	subspl.w	r0, r2, r3
    31ea:	bf88      	it	hi
    31ec:	17c8      	asrhi	r0, r1, #31
    31ee:	bf38      	it	cc
    31f0:	ea6f 70e1 	mvncc.w	r0, r1, asr #31
    31f4:	bf18      	it	ne
    31f6:	f040 0001 	orrne.w	r0, r0, #1
    31fa:	4770      	bx	lr
    31fc:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    3200:	d102      	bne.n	3208 <__cmpsf2+0x4c>
    3202:	ea5f 2c40 	movs.w	ip, r0, lsl #9
    3206:	d105      	bne.n	3214 <__cmpsf2+0x58>
    3208:	ea7f 6c23 	mvns.w	ip, r3, asr #24
    320c:	d1e4      	bne.n	31d8 <__cmpsf2+0x1c>
    320e:	ea5f 2c41 	movs.w	ip, r1, lsl #9
    3212:	d0e1      	beq.n	31d8 <__cmpsf2+0x1c>
    3214:	f85d 0b04 	ldr.w	r0, [sp], #4
    3218:	4770      	bx	lr
    321a:	bf00      	nop

0000321c <__aeabi_cfrcmple>:
    321c:	4684      	mov	ip, r0
    321e:	4608      	mov	r0, r1
    3220:	4661      	mov	r1, ip
    3222:	e7ff      	b.n	3224 <__aeabi_cfcmpeq>

00003224 <__aeabi_cfcmpeq>:
    3224:	b50f      	push	{r0, r1, r2, r3, lr}
    3226:	f7ff ffc9 	bl	31bc <__cmpsf2>
    322a:	2800      	cmp	r0, #0
    322c:	bf48      	it	mi
    322e:	f110 0f00 	cmnmi.w	r0, #0
    3232:	bd0f      	pop	{r0, r1, r2, r3, pc}

00003234 <__aeabi_fcmpeq>:
    3234:	f84d ed08 	str.w	lr, [sp, #-8]!
    3238:	f7ff fff4 	bl	3224 <__aeabi_cfcmpeq>
    323c:	bf0c      	ite	eq
    323e:	2001      	moveq	r0, #1
    3240:	2000      	movne	r0, #0
    3242:	f85d fb08 	ldr.w	pc, [sp], #8
    3246:	bf00      	nop

00003248 <__aeabi_fcmplt>:
    3248:	f84d ed08 	str.w	lr, [sp, #-8]!
    324c:	f7ff ffea 	bl	3224 <__aeabi_cfcmpeq>
    3250:	bf34      	ite	cc
    3252:	2001      	movcc	r0, #1
    3254:	2000      	movcs	r0, #0
    3256:	f85d fb08 	ldr.w	pc, [sp], #8
    325a:	bf00      	nop

0000325c <__aeabi_fcmple>:
    325c:	f84d ed08 	str.w	lr, [sp, #-8]!
    3260:	f7ff ffe0 	bl	3224 <__aeabi_cfcmpeq>
    3264:	bf94      	ite	ls
    3266:	2001      	movls	r0, #1
    3268:	2000      	movhi	r0, #0
    326a:	f85d fb08 	ldr.w	pc, [sp], #8
    326e:	bf00      	nop

00003270 <__aeabi_fcmpge>:
    3270:	f84d ed08 	str.w	lr, [sp, #-8]!
    3274:	f7ff ffd2 	bl	321c <__aeabi_cfrcmple>
    3278:	bf94      	ite	ls
    327a:	2001      	movls	r0, #1
    327c:	2000      	movhi	r0, #0
    327e:	f85d fb08 	ldr.w	pc, [sp], #8
    3282:	bf00      	nop

00003284 <__aeabi_fcmpgt>:
    3284:	f84d ed08 	str.w	lr, [sp, #-8]!
    3288:	f7ff ffc8 	bl	321c <__aeabi_cfrcmple>
    328c:	bf34      	ite	cc
    328e:	2001      	movcc	r0, #1
    3290:	2000      	movcs	r0, #0
    3292:	f85d fb08 	ldr.w	pc, [sp], #8
    3296:	bf00      	nop

00003298 <__cxa_atexit>:
    3298:	4613      	mov	r3, r2
    329a:	460a      	mov	r2, r1
    329c:	4601      	mov	r1, r0
    329e:	2002      	movs	r0, #2
    32a0:	f000 bb04 	b.w	38ac <__register_exitproc>

000032a4 <__errno>:
    32a4:	4b01      	ldr	r3, [pc, #4]	; (32ac <__errno+0x8>)
    32a6:	6818      	ldr	r0, [r3, #0]
    32a8:	4770      	bx	lr
    32aa:	bf00      	nop
    32ac:	1fff8dd8 	.word	0x1fff8dd8

000032b0 <__libc_init_array>:
    32b0:	b570      	push	{r4, r5, r6, lr}
    32b2:	4e0f      	ldr	r6, [pc, #60]	; (32f0 <__libc_init_array+0x40>)
    32b4:	4d0f      	ldr	r5, [pc, #60]	; (32f4 <__libc_init_array+0x44>)
    32b6:	1b76      	subs	r6, r6, r5
    32b8:	10b6      	asrs	r6, r6, #2
    32ba:	bf18      	it	ne
    32bc:	2400      	movne	r4, #0
    32be:	d005      	beq.n	32cc <__libc_init_array+0x1c>
    32c0:	3401      	adds	r4, #1
    32c2:	f855 3b04 	ldr.w	r3, [r5], #4
    32c6:	4798      	blx	r3
    32c8:	42a6      	cmp	r6, r4
    32ca:	d1f9      	bne.n	32c0 <__libc_init_array+0x10>
    32cc:	4e0a      	ldr	r6, [pc, #40]	; (32f8 <__libc_init_array+0x48>)
    32ce:	4d0b      	ldr	r5, [pc, #44]	; (32fc <__libc_init_array+0x4c>)
    32d0:	1b76      	subs	r6, r6, r5
    32d2:	f000 fd83 	bl	3ddc <_init>
    32d6:	10b6      	asrs	r6, r6, #2
    32d8:	bf18      	it	ne
    32da:	2400      	movne	r4, #0
    32dc:	d006      	beq.n	32ec <__libc_init_array+0x3c>
    32de:	3401      	adds	r4, #1
    32e0:	f855 3b04 	ldr.w	r3, [r5], #4
    32e4:	4798      	blx	r3
    32e6:	42a6      	cmp	r6, r4
    32e8:	d1f9      	bne.n	32de <__libc_init_array+0x2e>
    32ea:	bd70      	pop	{r4, r5, r6, pc}
    32ec:	bd70      	pop	{r4, r5, r6, pc}
    32ee:	bf00      	nop
    32f0:	00003de8 	.word	0x00003de8
    32f4:	00003de8 	.word	0x00003de8
    32f8:	00003df4 	.word	0x00003df4
    32fc:	00003de8 	.word	0x00003de8

00003300 <malloc>:
    3300:	4b02      	ldr	r3, [pc, #8]	; (330c <malloc+0xc>)
    3302:	4601      	mov	r1, r0
    3304:	6818      	ldr	r0, [r3, #0]
    3306:	f000 b803 	b.w	3310 <_malloc_r>
    330a:	bf00      	nop
    330c:	1fff8dd8 	.word	0x1fff8dd8

00003310 <_malloc_r>:
    3310:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3314:	f101 050b 	add.w	r5, r1, #11
    3318:	2d16      	cmp	r5, #22
    331a:	b083      	sub	sp, #12
    331c:	4606      	mov	r6, r0
    331e:	f240 809f 	bls.w	3460 <_malloc_r+0x150>
    3322:	f035 0507 	bics.w	r5, r5, #7
    3326:	f100 80bf 	bmi.w	34a8 <_malloc_r+0x198>
    332a:	42a9      	cmp	r1, r5
    332c:	f200 80bc 	bhi.w	34a8 <_malloc_r+0x198>
    3330:	f000 faa6 	bl	3880 <__malloc_lock>
    3334:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    3338:	f0c0 829c 	bcc.w	3874 <_malloc_r+0x564>
    333c:	0a6b      	lsrs	r3, r5, #9
    333e:	f000 80ba 	beq.w	34b6 <_malloc_r+0x1a6>
    3342:	2b04      	cmp	r3, #4
    3344:	f200 8183 	bhi.w	364e <_malloc_r+0x33e>
    3348:	09a8      	lsrs	r0, r5, #6
    334a:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    334e:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3352:	3038      	adds	r0, #56	; 0x38
    3354:	4fc4      	ldr	r7, [pc, #784]	; (3668 <_malloc_r+0x358>)
    3356:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    335a:	f1a3 0108 	sub.w	r1, r3, #8
    335e:	685c      	ldr	r4, [r3, #4]
    3360:	42a1      	cmp	r1, r4
    3362:	d107      	bne.n	3374 <_malloc_r+0x64>
    3364:	e0ac      	b.n	34c0 <_malloc_r+0x1b0>
    3366:	2a00      	cmp	r2, #0
    3368:	f280 80ac 	bge.w	34c4 <_malloc_r+0x1b4>
    336c:	68e4      	ldr	r4, [r4, #12]
    336e:	42a1      	cmp	r1, r4
    3370:	f000 80a6 	beq.w	34c0 <_malloc_r+0x1b0>
    3374:	6863      	ldr	r3, [r4, #4]
    3376:	f023 0303 	bic.w	r3, r3, #3
    337a:	1b5a      	subs	r2, r3, r5
    337c:	2a0f      	cmp	r2, #15
    337e:	ddf2      	ble.n	3366 <_malloc_r+0x56>
    3380:	49b9      	ldr	r1, [pc, #740]	; (3668 <_malloc_r+0x358>)
    3382:	693c      	ldr	r4, [r7, #16]
    3384:	f101 0e08 	add.w	lr, r1, #8
    3388:	4574      	cmp	r4, lr
    338a:	f000 81b3 	beq.w	36f4 <_malloc_r+0x3e4>
    338e:	6863      	ldr	r3, [r4, #4]
    3390:	f023 0303 	bic.w	r3, r3, #3
    3394:	1b5a      	subs	r2, r3, r5
    3396:	2a0f      	cmp	r2, #15
    3398:	f300 8199 	bgt.w	36ce <_malloc_r+0x3be>
    339c:	2a00      	cmp	r2, #0
    339e:	f8c1 e014 	str.w	lr, [r1, #20]
    33a2:	f8c1 e010 	str.w	lr, [r1, #16]
    33a6:	f280 809e 	bge.w	34e6 <_malloc_r+0x1d6>
    33aa:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    33ae:	f080 8167 	bcs.w	3680 <_malloc_r+0x370>
    33b2:	08db      	lsrs	r3, r3, #3
    33b4:	f103 0c01 	add.w	ip, r3, #1
    33b8:	2201      	movs	r2, #1
    33ba:	109b      	asrs	r3, r3, #2
    33bc:	fa02 f303 	lsl.w	r3, r2, r3
    33c0:	684a      	ldr	r2, [r1, #4]
    33c2:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    33c6:	f8c4 8008 	str.w	r8, [r4, #8]
    33ca:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    33ce:	431a      	orrs	r2, r3
    33d0:	f1a9 0308 	sub.w	r3, r9, #8
    33d4:	60e3      	str	r3, [r4, #12]
    33d6:	604a      	str	r2, [r1, #4]
    33d8:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    33dc:	f8c8 400c 	str.w	r4, [r8, #12]
    33e0:	1083      	asrs	r3, r0, #2
    33e2:	2401      	movs	r4, #1
    33e4:	409c      	lsls	r4, r3
    33e6:	4294      	cmp	r4, r2
    33e8:	f200 808a 	bhi.w	3500 <_malloc_r+0x1f0>
    33ec:	4214      	tst	r4, r2
    33ee:	d106      	bne.n	33fe <_malloc_r+0xee>
    33f0:	f020 0003 	bic.w	r0, r0, #3
    33f4:	0064      	lsls	r4, r4, #1
    33f6:	4214      	tst	r4, r2
    33f8:	f100 0004 	add.w	r0, r0, #4
    33fc:	d0fa      	beq.n	33f4 <_malloc_r+0xe4>
    33fe:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    3402:	46cc      	mov	ip, r9
    3404:	4680      	mov	r8, r0
    3406:	f8dc 100c 	ldr.w	r1, [ip, #12]
    340a:	458c      	cmp	ip, r1
    340c:	d107      	bne.n	341e <_malloc_r+0x10e>
    340e:	e173      	b.n	36f8 <_malloc_r+0x3e8>
    3410:	2a00      	cmp	r2, #0
    3412:	f280 8181 	bge.w	3718 <_malloc_r+0x408>
    3416:	68c9      	ldr	r1, [r1, #12]
    3418:	458c      	cmp	ip, r1
    341a:	f000 816d 	beq.w	36f8 <_malloc_r+0x3e8>
    341e:	684b      	ldr	r3, [r1, #4]
    3420:	f023 0303 	bic.w	r3, r3, #3
    3424:	1b5a      	subs	r2, r3, r5
    3426:	2a0f      	cmp	r2, #15
    3428:	ddf2      	ble.n	3410 <_malloc_r+0x100>
    342a:	460c      	mov	r4, r1
    342c:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    3430:	f854 8f08 	ldr.w	r8, [r4, #8]!
    3434:	194b      	adds	r3, r1, r5
    3436:	f045 0501 	orr.w	r5, r5, #1
    343a:	604d      	str	r5, [r1, #4]
    343c:	f042 0101 	orr.w	r1, r2, #1
    3440:	f8c8 c00c 	str.w	ip, [r8, #12]
    3444:	4630      	mov	r0, r6
    3446:	f8cc 8008 	str.w	r8, [ip, #8]
    344a:	617b      	str	r3, [r7, #20]
    344c:	613b      	str	r3, [r7, #16]
    344e:	f8c3 e00c 	str.w	lr, [r3, #12]
    3452:	f8c3 e008 	str.w	lr, [r3, #8]
    3456:	6059      	str	r1, [r3, #4]
    3458:	509a      	str	r2, [r3, r2]
    345a:	f000 fa13 	bl	3884 <__malloc_unlock>
    345e:	e01f      	b.n	34a0 <_malloc_r+0x190>
    3460:	2910      	cmp	r1, #16
    3462:	d821      	bhi.n	34a8 <_malloc_r+0x198>
    3464:	f000 fa0c 	bl	3880 <__malloc_lock>
    3468:	2510      	movs	r5, #16
    346a:	2306      	movs	r3, #6
    346c:	2002      	movs	r0, #2
    346e:	4f7e      	ldr	r7, [pc, #504]	; (3668 <_malloc_r+0x358>)
    3470:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    3474:	f1a3 0208 	sub.w	r2, r3, #8
    3478:	685c      	ldr	r4, [r3, #4]
    347a:	4294      	cmp	r4, r2
    347c:	f000 8145 	beq.w	370a <_malloc_r+0x3fa>
    3480:	6863      	ldr	r3, [r4, #4]
    3482:	68e1      	ldr	r1, [r4, #12]
    3484:	68a5      	ldr	r5, [r4, #8]
    3486:	f023 0303 	bic.w	r3, r3, #3
    348a:	4423      	add	r3, r4
    348c:	4630      	mov	r0, r6
    348e:	685a      	ldr	r2, [r3, #4]
    3490:	60e9      	str	r1, [r5, #12]
    3492:	f042 0201 	orr.w	r2, r2, #1
    3496:	608d      	str	r5, [r1, #8]
    3498:	605a      	str	r2, [r3, #4]
    349a:	f000 f9f3 	bl	3884 <__malloc_unlock>
    349e:	3408      	adds	r4, #8
    34a0:	4620      	mov	r0, r4
    34a2:	b003      	add	sp, #12
    34a4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    34a8:	2400      	movs	r4, #0
    34aa:	230c      	movs	r3, #12
    34ac:	4620      	mov	r0, r4
    34ae:	6033      	str	r3, [r6, #0]
    34b0:	b003      	add	sp, #12
    34b2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    34b6:	2380      	movs	r3, #128	; 0x80
    34b8:	f04f 0e40 	mov.w	lr, #64	; 0x40
    34bc:	203f      	movs	r0, #63	; 0x3f
    34be:	e749      	b.n	3354 <_malloc_r+0x44>
    34c0:	4670      	mov	r0, lr
    34c2:	e75d      	b.n	3380 <_malloc_r+0x70>
    34c4:	4423      	add	r3, r4
    34c6:	68e1      	ldr	r1, [r4, #12]
    34c8:	685a      	ldr	r2, [r3, #4]
    34ca:	68a5      	ldr	r5, [r4, #8]
    34cc:	f042 0201 	orr.w	r2, r2, #1
    34d0:	60e9      	str	r1, [r5, #12]
    34d2:	4630      	mov	r0, r6
    34d4:	608d      	str	r5, [r1, #8]
    34d6:	605a      	str	r2, [r3, #4]
    34d8:	f000 f9d4 	bl	3884 <__malloc_unlock>
    34dc:	3408      	adds	r4, #8
    34de:	4620      	mov	r0, r4
    34e0:	b003      	add	sp, #12
    34e2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    34e6:	4423      	add	r3, r4
    34e8:	4630      	mov	r0, r6
    34ea:	685a      	ldr	r2, [r3, #4]
    34ec:	f042 0201 	orr.w	r2, r2, #1
    34f0:	605a      	str	r2, [r3, #4]
    34f2:	f000 f9c7 	bl	3884 <__malloc_unlock>
    34f6:	3408      	adds	r4, #8
    34f8:	4620      	mov	r0, r4
    34fa:	b003      	add	sp, #12
    34fc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3500:	68bc      	ldr	r4, [r7, #8]
    3502:	6863      	ldr	r3, [r4, #4]
    3504:	f023 0803 	bic.w	r8, r3, #3
    3508:	45a8      	cmp	r8, r5
    350a:	d304      	bcc.n	3516 <_malloc_r+0x206>
    350c:	ebc5 0308 	rsb	r3, r5, r8
    3510:	2b0f      	cmp	r3, #15
    3512:	f300 808c 	bgt.w	362e <_malloc_r+0x31e>
    3516:	4b55      	ldr	r3, [pc, #340]	; (366c <_malloc_r+0x35c>)
    3518:	f8df 9160 	ldr.w	r9, [pc, #352]	; 367c <_malloc_r+0x36c>
    351c:	681a      	ldr	r2, [r3, #0]
    351e:	f8d9 3000 	ldr.w	r3, [r9]
    3522:	3301      	adds	r3, #1
    3524:	442a      	add	r2, r5
    3526:	eb04 0a08 	add.w	sl, r4, r8
    352a:	f000 8160 	beq.w	37ee <_malloc_r+0x4de>
    352e:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    3532:	320f      	adds	r2, #15
    3534:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    3538:	f022 020f 	bic.w	r2, r2, #15
    353c:	4611      	mov	r1, r2
    353e:	4630      	mov	r0, r6
    3540:	9201      	str	r2, [sp, #4]
    3542:	f000 f9a1 	bl	3888 <_sbrk_r>
    3546:	f1b0 3fff 	cmp.w	r0, #4294967295
    354a:	4683      	mov	fp, r0
    354c:	9a01      	ldr	r2, [sp, #4]
    354e:	f000 8158 	beq.w	3802 <_malloc_r+0x4f2>
    3552:	4582      	cmp	sl, r0
    3554:	f200 80fc 	bhi.w	3750 <_malloc_r+0x440>
    3558:	4b45      	ldr	r3, [pc, #276]	; (3670 <_malloc_r+0x360>)
    355a:	6819      	ldr	r1, [r3, #0]
    355c:	45da      	cmp	sl, fp
    355e:	4411      	add	r1, r2
    3560:	6019      	str	r1, [r3, #0]
    3562:	f000 8153 	beq.w	380c <_malloc_r+0x4fc>
    3566:	f8d9 0000 	ldr.w	r0, [r9]
    356a:	f8df e110 	ldr.w	lr, [pc, #272]	; 367c <_malloc_r+0x36c>
    356e:	3001      	adds	r0, #1
    3570:	bf1b      	ittet	ne
    3572:	ebca 0a0b 	rsbne	sl, sl, fp
    3576:	4451      	addne	r1, sl
    3578:	f8ce b000 	streq.w	fp, [lr]
    357c:	6019      	strne	r1, [r3, #0]
    357e:	f01b 0107 	ands.w	r1, fp, #7
    3582:	f000 8117 	beq.w	37b4 <_malloc_r+0x4a4>
    3586:	f1c1 0008 	rsb	r0, r1, #8
    358a:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    358e:	4483      	add	fp, r0
    3590:	3108      	adds	r1, #8
    3592:	445a      	add	r2, fp
    3594:	f3c2 020b 	ubfx	r2, r2, #0, #12
    3598:	ebc2 0901 	rsb	r9, r2, r1
    359c:	4649      	mov	r1, r9
    359e:	4630      	mov	r0, r6
    35a0:	9301      	str	r3, [sp, #4]
    35a2:	f000 f971 	bl	3888 <_sbrk_r>
    35a6:	1c43      	adds	r3, r0, #1
    35a8:	9b01      	ldr	r3, [sp, #4]
    35aa:	f000 813f 	beq.w	382c <_malloc_r+0x51c>
    35ae:	ebcb 0200 	rsb	r2, fp, r0
    35b2:	444a      	add	r2, r9
    35b4:	f042 0201 	orr.w	r2, r2, #1
    35b8:	6819      	ldr	r1, [r3, #0]
    35ba:	f8c7 b008 	str.w	fp, [r7, #8]
    35be:	4449      	add	r1, r9
    35c0:	42bc      	cmp	r4, r7
    35c2:	f8cb 2004 	str.w	r2, [fp, #4]
    35c6:	6019      	str	r1, [r3, #0]
    35c8:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 3670 <_malloc_r+0x360>
    35cc:	d016      	beq.n	35fc <_malloc_r+0x2ec>
    35ce:	f1b8 0f0f 	cmp.w	r8, #15
    35d2:	f240 80fd 	bls.w	37d0 <_malloc_r+0x4c0>
    35d6:	6862      	ldr	r2, [r4, #4]
    35d8:	f1a8 030c 	sub.w	r3, r8, #12
    35dc:	f023 0307 	bic.w	r3, r3, #7
    35e0:	18e0      	adds	r0, r4, r3
    35e2:	f002 0201 	and.w	r2, r2, #1
    35e6:	f04f 0e05 	mov.w	lr, #5
    35ea:	431a      	orrs	r2, r3
    35ec:	2b0f      	cmp	r3, #15
    35ee:	6062      	str	r2, [r4, #4]
    35f0:	f8c0 e004 	str.w	lr, [r0, #4]
    35f4:	f8c0 e008 	str.w	lr, [r0, #8]
    35f8:	f200 811c 	bhi.w	3834 <_malloc_r+0x524>
    35fc:	4b1d      	ldr	r3, [pc, #116]	; (3674 <_malloc_r+0x364>)
    35fe:	68bc      	ldr	r4, [r7, #8]
    3600:	681a      	ldr	r2, [r3, #0]
    3602:	4291      	cmp	r1, r2
    3604:	bf88      	it	hi
    3606:	6019      	strhi	r1, [r3, #0]
    3608:	4b1b      	ldr	r3, [pc, #108]	; (3678 <_malloc_r+0x368>)
    360a:	681a      	ldr	r2, [r3, #0]
    360c:	4291      	cmp	r1, r2
    360e:	6862      	ldr	r2, [r4, #4]
    3610:	bf88      	it	hi
    3612:	6019      	strhi	r1, [r3, #0]
    3614:	f022 0203 	bic.w	r2, r2, #3
    3618:	4295      	cmp	r5, r2
    361a:	eba2 0305 	sub.w	r3, r2, r5
    361e:	d801      	bhi.n	3624 <_malloc_r+0x314>
    3620:	2b0f      	cmp	r3, #15
    3622:	dc04      	bgt.n	362e <_malloc_r+0x31e>
    3624:	4630      	mov	r0, r6
    3626:	f000 f92d 	bl	3884 <__malloc_unlock>
    362a:	2400      	movs	r4, #0
    362c:	e738      	b.n	34a0 <_malloc_r+0x190>
    362e:	1962      	adds	r2, r4, r5
    3630:	f043 0301 	orr.w	r3, r3, #1
    3634:	f045 0501 	orr.w	r5, r5, #1
    3638:	6065      	str	r5, [r4, #4]
    363a:	4630      	mov	r0, r6
    363c:	60ba      	str	r2, [r7, #8]
    363e:	6053      	str	r3, [r2, #4]
    3640:	f000 f920 	bl	3884 <__malloc_unlock>
    3644:	3408      	adds	r4, #8
    3646:	4620      	mov	r0, r4
    3648:	b003      	add	sp, #12
    364a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    364e:	2b14      	cmp	r3, #20
    3650:	d971      	bls.n	3736 <_malloc_r+0x426>
    3652:	2b54      	cmp	r3, #84	; 0x54
    3654:	f200 80a4 	bhi.w	37a0 <_malloc_r+0x490>
    3658:	0b28      	lsrs	r0, r5, #12
    365a:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    365e:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3662:	306e      	adds	r0, #110	; 0x6e
    3664:	e676      	b.n	3354 <_malloc_r+0x44>
    3666:	bf00      	nop
    3668:	1fff8ddc 	.word	0x1fff8ddc
    366c:	1fff9644 	.word	0x1fff9644
    3670:	1fff9648 	.word	0x1fff9648
    3674:	1fff9640 	.word	0x1fff9640
    3678:	1fff963c 	.word	0x1fff963c
    367c:	1fff91e8 	.word	0x1fff91e8
    3680:	0a5a      	lsrs	r2, r3, #9
    3682:	2a04      	cmp	r2, #4
    3684:	d95e      	bls.n	3744 <_malloc_r+0x434>
    3686:	2a14      	cmp	r2, #20
    3688:	f200 80b3 	bhi.w	37f2 <_malloc_r+0x4e2>
    368c:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    3690:	0049      	lsls	r1, r1, #1
    3692:	325b      	adds	r2, #91	; 0x5b
    3694:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    3698:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    369c:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 387c <_malloc_r+0x56c>
    36a0:	f1ac 0c08 	sub.w	ip, ip, #8
    36a4:	458c      	cmp	ip, r1
    36a6:	f000 8088 	beq.w	37ba <_malloc_r+0x4aa>
    36aa:	684a      	ldr	r2, [r1, #4]
    36ac:	f022 0203 	bic.w	r2, r2, #3
    36b0:	4293      	cmp	r3, r2
    36b2:	d202      	bcs.n	36ba <_malloc_r+0x3aa>
    36b4:	6889      	ldr	r1, [r1, #8]
    36b6:	458c      	cmp	ip, r1
    36b8:	d1f7      	bne.n	36aa <_malloc_r+0x39a>
    36ba:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    36be:	687a      	ldr	r2, [r7, #4]
    36c0:	f8c4 c00c 	str.w	ip, [r4, #12]
    36c4:	60a1      	str	r1, [r4, #8]
    36c6:	f8cc 4008 	str.w	r4, [ip, #8]
    36ca:	60cc      	str	r4, [r1, #12]
    36cc:	e688      	b.n	33e0 <_malloc_r+0xd0>
    36ce:	1963      	adds	r3, r4, r5
    36d0:	f042 0701 	orr.w	r7, r2, #1
    36d4:	f045 0501 	orr.w	r5, r5, #1
    36d8:	6065      	str	r5, [r4, #4]
    36da:	4630      	mov	r0, r6
    36dc:	614b      	str	r3, [r1, #20]
    36de:	610b      	str	r3, [r1, #16]
    36e0:	f8c3 e00c 	str.w	lr, [r3, #12]
    36e4:	f8c3 e008 	str.w	lr, [r3, #8]
    36e8:	605f      	str	r7, [r3, #4]
    36ea:	509a      	str	r2, [r3, r2]
    36ec:	3408      	adds	r4, #8
    36ee:	f000 f8c9 	bl	3884 <__malloc_unlock>
    36f2:	e6d5      	b.n	34a0 <_malloc_r+0x190>
    36f4:	684a      	ldr	r2, [r1, #4]
    36f6:	e673      	b.n	33e0 <_malloc_r+0xd0>
    36f8:	f108 0801 	add.w	r8, r8, #1
    36fc:	f018 0f03 	tst.w	r8, #3
    3700:	f10c 0c08 	add.w	ip, ip, #8
    3704:	f47f ae7f 	bne.w	3406 <_malloc_r+0xf6>
    3708:	e030      	b.n	376c <_malloc_r+0x45c>
    370a:	68dc      	ldr	r4, [r3, #12]
    370c:	42a3      	cmp	r3, r4
    370e:	bf08      	it	eq
    3710:	3002      	addeq	r0, #2
    3712:	f43f ae35 	beq.w	3380 <_malloc_r+0x70>
    3716:	e6b3      	b.n	3480 <_malloc_r+0x170>
    3718:	440b      	add	r3, r1
    371a:	460c      	mov	r4, r1
    371c:	685a      	ldr	r2, [r3, #4]
    371e:	68c9      	ldr	r1, [r1, #12]
    3720:	f854 5f08 	ldr.w	r5, [r4, #8]!
    3724:	f042 0201 	orr.w	r2, r2, #1
    3728:	605a      	str	r2, [r3, #4]
    372a:	4630      	mov	r0, r6
    372c:	60e9      	str	r1, [r5, #12]
    372e:	608d      	str	r5, [r1, #8]
    3730:	f000 f8a8 	bl	3884 <__malloc_unlock>
    3734:	e6b4      	b.n	34a0 <_malloc_r+0x190>
    3736:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    373a:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    373e:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3742:	e607      	b.n	3354 <_malloc_r+0x44>
    3744:	099a      	lsrs	r2, r3, #6
    3746:	f102 0139 	add.w	r1, r2, #57	; 0x39
    374a:	0049      	lsls	r1, r1, #1
    374c:	3238      	adds	r2, #56	; 0x38
    374e:	e7a1      	b.n	3694 <_malloc_r+0x384>
    3750:	42bc      	cmp	r4, r7
    3752:	4b4a      	ldr	r3, [pc, #296]	; (387c <_malloc_r+0x56c>)
    3754:	f43f af00 	beq.w	3558 <_malloc_r+0x248>
    3758:	689c      	ldr	r4, [r3, #8]
    375a:	6862      	ldr	r2, [r4, #4]
    375c:	f022 0203 	bic.w	r2, r2, #3
    3760:	e75a      	b.n	3618 <_malloc_r+0x308>
    3762:	f859 3908 	ldr.w	r3, [r9], #-8
    3766:	4599      	cmp	r9, r3
    3768:	f040 8082 	bne.w	3870 <_malloc_r+0x560>
    376c:	f010 0f03 	tst.w	r0, #3
    3770:	f100 30ff 	add.w	r0, r0, #4294967295
    3774:	d1f5      	bne.n	3762 <_malloc_r+0x452>
    3776:	687b      	ldr	r3, [r7, #4]
    3778:	ea23 0304 	bic.w	r3, r3, r4
    377c:	607b      	str	r3, [r7, #4]
    377e:	0064      	lsls	r4, r4, #1
    3780:	429c      	cmp	r4, r3
    3782:	f63f aebd 	bhi.w	3500 <_malloc_r+0x1f0>
    3786:	2c00      	cmp	r4, #0
    3788:	f43f aeba 	beq.w	3500 <_malloc_r+0x1f0>
    378c:	421c      	tst	r4, r3
    378e:	4640      	mov	r0, r8
    3790:	f47f ae35 	bne.w	33fe <_malloc_r+0xee>
    3794:	0064      	lsls	r4, r4, #1
    3796:	421c      	tst	r4, r3
    3798:	f100 0004 	add.w	r0, r0, #4
    379c:	d0fa      	beq.n	3794 <_malloc_r+0x484>
    379e:	e62e      	b.n	33fe <_malloc_r+0xee>
    37a0:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    37a4:	d818      	bhi.n	37d8 <_malloc_r+0x4c8>
    37a6:	0be8      	lsrs	r0, r5, #15
    37a8:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    37ac:	ea4f 034e 	mov.w	r3, lr, lsl #1
    37b0:	3077      	adds	r0, #119	; 0x77
    37b2:	e5cf      	b.n	3354 <_malloc_r+0x44>
    37b4:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    37b8:	e6eb      	b.n	3592 <_malloc_r+0x282>
    37ba:	2101      	movs	r1, #1
    37bc:	f8d8 3004 	ldr.w	r3, [r8, #4]
    37c0:	1092      	asrs	r2, r2, #2
    37c2:	fa01 f202 	lsl.w	r2, r1, r2
    37c6:	431a      	orrs	r2, r3
    37c8:	f8c8 2004 	str.w	r2, [r8, #4]
    37cc:	4661      	mov	r1, ip
    37ce:	e777      	b.n	36c0 <_malloc_r+0x3b0>
    37d0:	2301      	movs	r3, #1
    37d2:	f8cb 3004 	str.w	r3, [fp, #4]
    37d6:	e725      	b.n	3624 <_malloc_r+0x314>
    37d8:	f240 5254 	movw	r2, #1364	; 0x554
    37dc:	4293      	cmp	r3, r2
    37de:	d820      	bhi.n	3822 <_malloc_r+0x512>
    37e0:	0ca8      	lsrs	r0, r5, #18
    37e2:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    37e6:	ea4f 034e 	mov.w	r3, lr, lsl #1
    37ea:	307c      	adds	r0, #124	; 0x7c
    37ec:	e5b2      	b.n	3354 <_malloc_r+0x44>
    37ee:	3210      	adds	r2, #16
    37f0:	e6a4      	b.n	353c <_malloc_r+0x22c>
    37f2:	2a54      	cmp	r2, #84	; 0x54
    37f4:	d826      	bhi.n	3844 <_malloc_r+0x534>
    37f6:	0b1a      	lsrs	r2, r3, #12
    37f8:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    37fc:	0049      	lsls	r1, r1, #1
    37fe:	326e      	adds	r2, #110	; 0x6e
    3800:	e748      	b.n	3694 <_malloc_r+0x384>
    3802:	68bc      	ldr	r4, [r7, #8]
    3804:	6862      	ldr	r2, [r4, #4]
    3806:	f022 0203 	bic.w	r2, r2, #3
    380a:	e705      	b.n	3618 <_malloc_r+0x308>
    380c:	f3ca 000b 	ubfx	r0, sl, #0, #12
    3810:	2800      	cmp	r0, #0
    3812:	f47f aea8 	bne.w	3566 <_malloc_r+0x256>
    3816:	4442      	add	r2, r8
    3818:	68bb      	ldr	r3, [r7, #8]
    381a:	f042 0201 	orr.w	r2, r2, #1
    381e:	605a      	str	r2, [r3, #4]
    3820:	e6ec      	b.n	35fc <_malloc_r+0x2ec>
    3822:	23fe      	movs	r3, #254	; 0xfe
    3824:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    3828:	207e      	movs	r0, #126	; 0x7e
    382a:	e593      	b.n	3354 <_malloc_r+0x44>
    382c:	2201      	movs	r2, #1
    382e:	f04f 0900 	mov.w	r9, #0
    3832:	e6c1      	b.n	35b8 <_malloc_r+0x2a8>
    3834:	f104 0108 	add.w	r1, r4, #8
    3838:	4630      	mov	r0, r6
    383a:	f000 f8fb 	bl	3a34 <_free_r>
    383e:	f8d9 1000 	ldr.w	r1, [r9]
    3842:	e6db      	b.n	35fc <_malloc_r+0x2ec>
    3844:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    3848:	d805      	bhi.n	3856 <_malloc_r+0x546>
    384a:	0bda      	lsrs	r2, r3, #15
    384c:	f102 0178 	add.w	r1, r2, #120	; 0x78
    3850:	0049      	lsls	r1, r1, #1
    3852:	3277      	adds	r2, #119	; 0x77
    3854:	e71e      	b.n	3694 <_malloc_r+0x384>
    3856:	f240 5154 	movw	r1, #1364	; 0x554
    385a:	428a      	cmp	r2, r1
    385c:	d805      	bhi.n	386a <_malloc_r+0x55a>
    385e:	0c9a      	lsrs	r2, r3, #18
    3860:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    3864:	0049      	lsls	r1, r1, #1
    3866:	327c      	adds	r2, #124	; 0x7c
    3868:	e714      	b.n	3694 <_malloc_r+0x384>
    386a:	21fe      	movs	r1, #254	; 0xfe
    386c:	227e      	movs	r2, #126	; 0x7e
    386e:	e711      	b.n	3694 <_malloc_r+0x384>
    3870:	687b      	ldr	r3, [r7, #4]
    3872:	e784      	b.n	377e <_malloc_r+0x46e>
    3874:	08e8      	lsrs	r0, r5, #3
    3876:	1c43      	adds	r3, r0, #1
    3878:	005b      	lsls	r3, r3, #1
    387a:	e5f8      	b.n	346e <_malloc_r+0x15e>
    387c:	1fff8ddc 	.word	0x1fff8ddc

00003880 <__malloc_lock>:
    3880:	4770      	bx	lr
    3882:	bf00      	nop

00003884 <__malloc_unlock>:
    3884:	4770      	bx	lr
    3886:	bf00      	nop

00003888 <_sbrk_r>:
    3888:	b538      	push	{r3, r4, r5, lr}
    388a:	4c07      	ldr	r4, [pc, #28]	; (38a8 <_sbrk_r+0x20>)
    388c:	2300      	movs	r3, #0
    388e:	4605      	mov	r5, r0
    3890:	4608      	mov	r0, r1
    3892:	6023      	str	r3, [r4, #0]
    3894:	f7fd fad8 	bl	e48 <_sbrk>
    3898:	1c43      	adds	r3, r0, #1
    389a:	d000      	beq.n	389e <_sbrk_r+0x16>
    389c:	bd38      	pop	{r3, r4, r5, pc}
    389e:	6823      	ldr	r3, [r4, #0]
    38a0:	2b00      	cmp	r3, #0
    38a2:	d0fb      	beq.n	389c <_sbrk_r+0x14>
    38a4:	602b      	str	r3, [r5, #0]
    38a6:	bd38      	pop	{r3, r4, r5, pc}
    38a8:	1fff9684 	.word	0x1fff9684

000038ac <__register_exitproc>:
    38ac:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    38b0:	4c25      	ldr	r4, [pc, #148]	; (3948 <__register_exitproc+0x9c>)
    38b2:	6825      	ldr	r5, [r4, #0]
    38b4:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    38b8:	4606      	mov	r6, r0
    38ba:	4688      	mov	r8, r1
    38bc:	4692      	mov	sl, r2
    38be:	4699      	mov	r9, r3
    38c0:	b3c4      	cbz	r4, 3934 <__register_exitproc+0x88>
    38c2:	6860      	ldr	r0, [r4, #4]
    38c4:	281f      	cmp	r0, #31
    38c6:	dc17      	bgt.n	38f8 <__register_exitproc+0x4c>
    38c8:	1c43      	adds	r3, r0, #1
    38ca:	b176      	cbz	r6, 38ea <__register_exitproc+0x3e>
    38cc:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    38d0:	2201      	movs	r2, #1
    38d2:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    38d6:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    38da:	4082      	lsls	r2, r0
    38dc:	4311      	orrs	r1, r2
    38de:	2e02      	cmp	r6, #2
    38e0:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    38e4:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    38e8:	d01e      	beq.n	3928 <__register_exitproc+0x7c>
    38ea:	3002      	adds	r0, #2
    38ec:	6063      	str	r3, [r4, #4]
    38ee:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    38f2:	2000      	movs	r0, #0
    38f4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    38f8:	4b14      	ldr	r3, [pc, #80]	; (394c <__register_exitproc+0xa0>)
    38fa:	b303      	cbz	r3, 393e <__register_exitproc+0x92>
    38fc:	f44f 70c8 	mov.w	r0, #400	; 0x190
    3900:	f7ff fcfe 	bl	3300 <malloc>
    3904:	4604      	mov	r4, r0
    3906:	b1d0      	cbz	r0, 393e <__register_exitproc+0x92>
    3908:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    390c:	2700      	movs	r7, #0
    390e:	e880 0088 	stmia.w	r0, {r3, r7}
    3912:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    3916:	4638      	mov	r0, r7
    3918:	2301      	movs	r3, #1
    391a:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    391e:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    3922:	2e00      	cmp	r6, #0
    3924:	d0e1      	beq.n	38ea <__register_exitproc+0x3e>
    3926:	e7d1      	b.n	38cc <__register_exitproc+0x20>
    3928:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    392c:	430a      	orrs	r2, r1
    392e:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    3932:	e7da      	b.n	38ea <__register_exitproc+0x3e>
    3934:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    3938:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    393c:	e7c1      	b.n	38c2 <__register_exitproc+0x16>
    393e:	f04f 30ff 	mov.w	r0, #4294967295
    3942:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    3946:	bf00      	nop
    3948:	00003dd8 	.word	0x00003dd8
    394c:	00003301 	.word	0x00003301

00003950 <register_fini>:
    3950:	4b02      	ldr	r3, [pc, #8]	; (395c <register_fini+0xc>)
    3952:	b113      	cbz	r3, 395a <register_fini+0xa>
    3954:	4802      	ldr	r0, [pc, #8]	; (3960 <register_fini+0x10>)
    3956:	f000 b805 	b.w	3964 <atexit>
    395a:	4770      	bx	lr
    395c:	00000000 	.word	0x00000000
    3960:	00003971 	.word	0x00003971

00003964 <atexit>:
    3964:	2300      	movs	r3, #0
    3966:	4601      	mov	r1, r0
    3968:	461a      	mov	r2, r3
    396a:	4618      	mov	r0, r3
    396c:	f7ff bf9e 	b.w	38ac <__register_exitproc>

00003970 <__libc_fini_array>:
    3970:	b538      	push	{r3, r4, r5, lr}
    3972:	4d07      	ldr	r5, [pc, #28]	; (3990 <__libc_fini_array+0x20>)
    3974:	4c07      	ldr	r4, [pc, #28]	; (3994 <__libc_fini_array+0x24>)
    3976:	1b2c      	subs	r4, r5, r4
    3978:	10a4      	asrs	r4, r4, #2
    397a:	d005      	beq.n	3988 <__libc_fini_array+0x18>
    397c:	3c01      	subs	r4, #1
    397e:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    3982:	4798      	blx	r3
    3984:	2c00      	cmp	r4, #0
    3986:	d1f9      	bne.n	397c <__libc_fini_array+0xc>
    3988:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    398c:	f000 ba32 	b.w	3df4 <__init_array_end>
	...

00003998 <_malloc_trim_r>:
    3998:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    399a:	4f23      	ldr	r7, [pc, #140]	; (3a28 <_malloc_trim_r+0x90>)
    399c:	460c      	mov	r4, r1
    399e:	4606      	mov	r6, r0
    39a0:	f7ff ff6e 	bl	3880 <__malloc_lock>
    39a4:	68bb      	ldr	r3, [r7, #8]
    39a6:	685d      	ldr	r5, [r3, #4]
    39a8:	f025 0503 	bic.w	r5, r5, #3
    39ac:	1b29      	subs	r1, r5, r4
    39ae:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    39b2:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    39b6:	f021 010f 	bic.w	r1, r1, #15
    39ba:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    39be:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    39c2:	db07      	blt.n	39d4 <_malloc_trim_r+0x3c>
    39c4:	2100      	movs	r1, #0
    39c6:	4630      	mov	r0, r6
    39c8:	f7ff ff5e 	bl	3888 <_sbrk_r>
    39cc:	68bb      	ldr	r3, [r7, #8]
    39ce:	442b      	add	r3, r5
    39d0:	4298      	cmp	r0, r3
    39d2:	d004      	beq.n	39de <_malloc_trim_r+0x46>
    39d4:	4630      	mov	r0, r6
    39d6:	f7ff ff55 	bl	3884 <__malloc_unlock>
    39da:	2000      	movs	r0, #0
    39dc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    39de:	4261      	negs	r1, r4
    39e0:	4630      	mov	r0, r6
    39e2:	f7ff ff51 	bl	3888 <_sbrk_r>
    39e6:	3001      	adds	r0, #1
    39e8:	d00d      	beq.n	3a06 <_malloc_trim_r+0x6e>
    39ea:	4b10      	ldr	r3, [pc, #64]	; (3a2c <_malloc_trim_r+0x94>)
    39ec:	68ba      	ldr	r2, [r7, #8]
    39ee:	6819      	ldr	r1, [r3, #0]
    39f0:	1b2d      	subs	r5, r5, r4
    39f2:	f045 0501 	orr.w	r5, r5, #1
    39f6:	4630      	mov	r0, r6
    39f8:	1b09      	subs	r1, r1, r4
    39fa:	6055      	str	r5, [r2, #4]
    39fc:	6019      	str	r1, [r3, #0]
    39fe:	f7ff ff41 	bl	3884 <__malloc_unlock>
    3a02:	2001      	movs	r0, #1
    3a04:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    3a06:	2100      	movs	r1, #0
    3a08:	4630      	mov	r0, r6
    3a0a:	f7ff ff3d 	bl	3888 <_sbrk_r>
    3a0e:	68ba      	ldr	r2, [r7, #8]
    3a10:	1a83      	subs	r3, r0, r2
    3a12:	2b0f      	cmp	r3, #15
    3a14:	ddde      	ble.n	39d4 <_malloc_trim_r+0x3c>
    3a16:	4c06      	ldr	r4, [pc, #24]	; (3a30 <_malloc_trim_r+0x98>)
    3a18:	4904      	ldr	r1, [pc, #16]	; (3a2c <_malloc_trim_r+0x94>)
    3a1a:	6824      	ldr	r4, [r4, #0]
    3a1c:	f043 0301 	orr.w	r3, r3, #1
    3a20:	1b00      	subs	r0, r0, r4
    3a22:	6053      	str	r3, [r2, #4]
    3a24:	6008      	str	r0, [r1, #0]
    3a26:	e7d5      	b.n	39d4 <_malloc_trim_r+0x3c>
    3a28:	1fff8ddc 	.word	0x1fff8ddc
    3a2c:	1fff9648 	.word	0x1fff9648
    3a30:	1fff91e8 	.word	0x1fff91e8

00003a34 <_free_r>:
    3a34:	2900      	cmp	r1, #0
    3a36:	d045      	beq.n	3ac4 <_free_r+0x90>
    3a38:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3a3c:	460d      	mov	r5, r1
    3a3e:	4680      	mov	r8, r0
    3a40:	f7ff ff1e 	bl	3880 <__malloc_lock>
    3a44:	f855 7c04 	ldr.w	r7, [r5, #-4]
    3a48:	496a      	ldr	r1, [pc, #424]	; (3bf4 <_free_r+0x1c0>)
    3a4a:	f027 0301 	bic.w	r3, r7, #1
    3a4e:	f1a5 0408 	sub.w	r4, r5, #8
    3a52:	18e2      	adds	r2, r4, r3
    3a54:	688e      	ldr	r6, [r1, #8]
    3a56:	6850      	ldr	r0, [r2, #4]
    3a58:	42b2      	cmp	r2, r6
    3a5a:	f020 0003 	bic.w	r0, r0, #3
    3a5e:	d062      	beq.n	3b26 <_free_r+0xf2>
    3a60:	07fe      	lsls	r6, r7, #31
    3a62:	6050      	str	r0, [r2, #4]
    3a64:	d40b      	bmi.n	3a7e <_free_r+0x4a>
    3a66:	f855 7c08 	ldr.w	r7, [r5, #-8]
    3a6a:	1be4      	subs	r4, r4, r7
    3a6c:	f101 0e08 	add.w	lr, r1, #8
    3a70:	68a5      	ldr	r5, [r4, #8]
    3a72:	4575      	cmp	r5, lr
    3a74:	443b      	add	r3, r7
    3a76:	d06f      	beq.n	3b58 <_free_r+0x124>
    3a78:	68e7      	ldr	r7, [r4, #12]
    3a7a:	60ef      	str	r7, [r5, #12]
    3a7c:	60bd      	str	r5, [r7, #8]
    3a7e:	1815      	adds	r5, r2, r0
    3a80:	686d      	ldr	r5, [r5, #4]
    3a82:	07ed      	lsls	r5, r5, #31
    3a84:	d542      	bpl.n	3b0c <_free_r+0xd8>
    3a86:	f043 0201 	orr.w	r2, r3, #1
    3a8a:	6062      	str	r2, [r4, #4]
    3a8c:	50e3      	str	r3, [r4, r3]
    3a8e:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    3a92:	d218      	bcs.n	3ac6 <_free_r+0x92>
    3a94:	08db      	lsrs	r3, r3, #3
    3a96:	1c5a      	adds	r2, r3, #1
    3a98:	684d      	ldr	r5, [r1, #4]
    3a9a:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    3a9e:	60a7      	str	r7, [r4, #8]
    3aa0:	2001      	movs	r0, #1
    3aa2:	109b      	asrs	r3, r3, #2
    3aa4:	fa00 f303 	lsl.w	r3, r0, r3
    3aa8:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    3aac:	431d      	orrs	r5, r3
    3aae:	3808      	subs	r0, #8
    3ab0:	60e0      	str	r0, [r4, #12]
    3ab2:	604d      	str	r5, [r1, #4]
    3ab4:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    3ab8:	60fc      	str	r4, [r7, #12]
    3aba:	4640      	mov	r0, r8
    3abc:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3ac0:	f7ff bee0 	b.w	3884 <__malloc_unlock>
    3ac4:	4770      	bx	lr
    3ac6:	0a5a      	lsrs	r2, r3, #9
    3ac8:	2a04      	cmp	r2, #4
    3aca:	d853      	bhi.n	3b74 <_free_r+0x140>
    3acc:	099a      	lsrs	r2, r3, #6
    3ace:	f102 0739 	add.w	r7, r2, #57	; 0x39
    3ad2:	007f      	lsls	r7, r7, #1
    3ad4:	f102 0538 	add.w	r5, r2, #56	; 0x38
    3ad8:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    3adc:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    3ae0:	4944      	ldr	r1, [pc, #272]	; (3bf4 <_free_r+0x1c0>)
    3ae2:	3808      	subs	r0, #8
    3ae4:	4290      	cmp	r0, r2
    3ae6:	d04d      	beq.n	3b84 <_free_r+0x150>
    3ae8:	6851      	ldr	r1, [r2, #4]
    3aea:	f021 0103 	bic.w	r1, r1, #3
    3aee:	428b      	cmp	r3, r1
    3af0:	d202      	bcs.n	3af8 <_free_r+0xc4>
    3af2:	6892      	ldr	r2, [r2, #8]
    3af4:	4290      	cmp	r0, r2
    3af6:	d1f7      	bne.n	3ae8 <_free_r+0xb4>
    3af8:	68d0      	ldr	r0, [r2, #12]
    3afa:	60e0      	str	r0, [r4, #12]
    3afc:	60a2      	str	r2, [r4, #8]
    3afe:	6084      	str	r4, [r0, #8]
    3b00:	60d4      	str	r4, [r2, #12]
    3b02:	4640      	mov	r0, r8
    3b04:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3b08:	f7ff bebc 	b.w	3884 <__malloc_unlock>
    3b0c:	6895      	ldr	r5, [r2, #8]
    3b0e:	4f3a      	ldr	r7, [pc, #232]	; (3bf8 <_free_r+0x1c4>)
    3b10:	42bd      	cmp	r5, r7
    3b12:	4403      	add	r3, r0
    3b14:	d03f      	beq.n	3b96 <_free_r+0x162>
    3b16:	68d0      	ldr	r0, [r2, #12]
    3b18:	60e8      	str	r0, [r5, #12]
    3b1a:	f043 0201 	orr.w	r2, r3, #1
    3b1e:	6085      	str	r5, [r0, #8]
    3b20:	6062      	str	r2, [r4, #4]
    3b22:	50e3      	str	r3, [r4, r3]
    3b24:	e7b3      	b.n	3a8e <_free_r+0x5a>
    3b26:	07ff      	lsls	r7, r7, #31
    3b28:	4403      	add	r3, r0
    3b2a:	d407      	bmi.n	3b3c <_free_r+0x108>
    3b2c:	f855 2c08 	ldr.w	r2, [r5, #-8]
    3b30:	1aa4      	subs	r4, r4, r2
    3b32:	4413      	add	r3, r2
    3b34:	68a0      	ldr	r0, [r4, #8]
    3b36:	68e2      	ldr	r2, [r4, #12]
    3b38:	60c2      	str	r2, [r0, #12]
    3b3a:	6090      	str	r0, [r2, #8]
    3b3c:	4a2f      	ldr	r2, [pc, #188]	; (3bfc <_free_r+0x1c8>)
    3b3e:	6812      	ldr	r2, [r2, #0]
    3b40:	f043 0001 	orr.w	r0, r3, #1
    3b44:	4293      	cmp	r3, r2
    3b46:	6060      	str	r0, [r4, #4]
    3b48:	608c      	str	r4, [r1, #8]
    3b4a:	d3b6      	bcc.n	3aba <_free_r+0x86>
    3b4c:	4b2c      	ldr	r3, [pc, #176]	; (3c00 <_free_r+0x1cc>)
    3b4e:	4640      	mov	r0, r8
    3b50:	6819      	ldr	r1, [r3, #0]
    3b52:	f7ff ff21 	bl	3998 <_malloc_trim_r>
    3b56:	e7b0      	b.n	3aba <_free_r+0x86>
    3b58:	1811      	adds	r1, r2, r0
    3b5a:	6849      	ldr	r1, [r1, #4]
    3b5c:	07c9      	lsls	r1, r1, #31
    3b5e:	d444      	bmi.n	3bea <_free_r+0x1b6>
    3b60:	6891      	ldr	r1, [r2, #8]
    3b62:	68d2      	ldr	r2, [r2, #12]
    3b64:	60ca      	str	r2, [r1, #12]
    3b66:	4403      	add	r3, r0
    3b68:	f043 0001 	orr.w	r0, r3, #1
    3b6c:	6091      	str	r1, [r2, #8]
    3b6e:	6060      	str	r0, [r4, #4]
    3b70:	50e3      	str	r3, [r4, r3]
    3b72:	e7a2      	b.n	3aba <_free_r+0x86>
    3b74:	2a14      	cmp	r2, #20
    3b76:	d817      	bhi.n	3ba8 <_free_r+0x174>
    3b78:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    3b7c:	007f      	lsls	r7, r7, #1
    3b7e:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    3b82:	e7a9      	b.n	3ad8 <_free_r+0xa4>
    3b84:	10aa      	asrs	r2, r5, #2
    3b86:	684b      	ldr	r3, [r1, #4]
    3b88:	2501      	movs	r5, #1
    3b8a:	fa05 f202 	lsl.w	r2, r5, r2
    3b8e:	4313      	orrs	r3, r2
    3b90:	604b      	str	r3, [r1, #4]
    3b92:	4602      	mov	r2, r0
    3b94:	e7b1      	b.n	3afa <_free_r+0xc6>
    3b96:	f043 0201 	orr.w	r2, r3, #1
    3b9a:	614c      	str	r4, [r1, #20]
    3b9c:	610c      	str	r4, [r1, #16]
    3b9e:	60e5      	str	r5, [r4, #12]
    3ba0:	60a5      	str	r5, [r4, #8]
    3ba2:	6062      	str	r2, [r4, #4]
    3ba4:	50e3      	str	r3, [r4, r3]
    3ba6:	e788      	b.n	3aba <_free_r+0x86>
    3ba8:	2a54      	cmp	r2, #84	; 0x54
    3baa:	d806      	bhi.n	3bba <_free_r+0x186>
    3bac:	0b1a      	lsrs	r2, r3, #12
    3bae:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    3bb2:	007f      	lsls	r7, r7, #1
    3bb4:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    3bb8:	e78e      	b.n	3ad8 <_free_r+0xa4>
    3bba:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    3bbe:	d806      	bhi.n	3bce <_free_r+0x19a>
    3bc0:	0bda      	lsrs	r2, r3, #15
    3bc2:	f102 0778 	add.w	r7, r2, #120	; 0x78
    3bc6:	007f      	lsls	r7, r7, #1
    3bc8:	f102 0577 	add.w	r5, r2, #119	; 0x77
    3bcc:	e784      	b.n	3ad8 <_free_r+0xa4>
    3bce:	f240 5054 	movw	r0, #1364	; 0x554
    3bd2:	4282      	cmp	r2, r0
    3bd4:	d806      	bhi.n	3be4 <_free_r+0x1b0>
    3bd6:	0c9a      	lsrs	r2, r3, #18
    3bd8:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    3bdc:	007f      	lsls	r7, r7, #1
    3bde:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    3be2:	e779      	b.n	3ad8 <_free_r+0xa4>
    3be4:	27fe      	movs	r7, #254	; 0xfe
    3be6:	257e      	movs	r5, #126	; 0x7e
    3be8:	e776      	b.n	3ad8 <_free_r+0xa4>
    3bea:	f043 0201 	orr.w	r2, r3, #1
    3bee:	6062      	str	r2, [r4, #4]
    3bf0:	50e3      	str	r3, [r4, r3]
    3bf2:	e762      	b.n	3aba <_free_r+0x86>
    3bf4:	1fff8ddc 	.word	0x1fff8ddc
    3bf8:	1fff8de4 	.word	0x1fff8de4
    3bfc:	1fff91e4 	.word	0x1fff91e4
    3c00:	1fff9644 	.word	0x1fff9644
    3c04:	ffff0020 	.word	0xffff0020
    3c08:	736e6553 	.word	0x736e6553
    3c0c:	4f20726f 	.word	0x4f20726f
    3c10:	6950206e 	.word	0x6950206e
    3c14:	0000206e 	.word	0x0000206e
    3c18:	6d6f4320 	.word	0x6d6f4320
    3c1c:	74656c70 	.word	0x74656c70
    3c20:	ffff0065 	.word	0xffff0065
    3c24:	74696e49 	.word	0x74696e49
    3c28:	746e4920 	.word	0x746e4920
    3c2c:	75727265 	.word	0x75727265
    3c30:	20737470 	.word	0x20737470
    3c34:	0000202d 	.word	0x0000202d
    3c38:	706d6f43 	.word	0x706d6f43
    3c3c:	6574656c 	.word	0x6574656c
    3c40:	00000000 	.word	0x00000000
    3c44:	ffff0a0d 	.word	0xffff0a0d

00003c48 <digital_pin_to_info_PGM>:
    3c48:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    3c58:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    3c68:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    3c78:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    3c88:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    3c98:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    3ca8:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    3cb8:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    3cc8:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    3cd8:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    3ce8:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    3cf8:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    3d08:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    3d18:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    3d28:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    3d38:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    3d48:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

00003d58 <vtable for usb_serial_class>:
	...
    3d60:	00002045 0000203d 00002039 00002035     E ..= ..9 ..5 ..
    3d70:	00002031 0000202d 00002029 00002025     1 ..- ..) ..% ..

00003d80 <usb_endpoint_config_table>:
    3d80:	15191500                                ....

00003d84 <usb_descriptor_list>:
    3d84:	00000100 1fff8908 00000012 00000200     ................
    3d94:	1fff8934 00000043 00000300 1fff8990     4...C...........
    3da4:	00000000 04090301 1fff891c 00000000     ................
    3db4:	04090302 1fff8978 00000000 04090303     ....x...........
    3dc4:	1fff8994 00000000 00000000 00000000     ................
    3dd4:	00000000                                ....

00003dd8 <_global_impure_ptr>:
    3dd8:	1fff89b0                                ....

00003ddc <_init>:
    3ddc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3dde:	bf00      	nop
    3de0:	bcf8      	pop	{r3, r4, r5, r6, r7}
    3de2:	bc08      	pop	{r3}
    3de4:	469e      	mov	lr, r3
    3de6:	4770      	bx	lr

00003de8 <__init_array_start>:
    3de8:	00003951 	.word	0x00003951

00003dec <__frame_dummy_init_array_entry>:
    3dec:	00000435 00000bf1                       5.......

Disassembly of section .fini:

00003df4 <_fini>:
    3df4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3df6:	bf00      	nop

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
1fff880c:	1fff9688                                ....

1fff8810 <isr_table_portA>:
1fff8810:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8820:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8830:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8840:	00000ec1 00000ec1                       ........

1fff8848 <isr_table_portB>:
1fff8848:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8858:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8868:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8878:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff8888:	00000ec1 00000ec1 00000ec1 00000ec1     ................

1fff8898 <isr_table_portC>:
1fff8898:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff88a8:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff88b8:	00000ec1 00000ec1 00000ec1 00000ec1     ................

1fff88c8 <isr_table_portD>:
1fff88c8:	00000ec1 00000ec1 00000ec1 00000ec1     ................
1fff88d8:	00000ec1 00000ec1 00000ec1 00000ec1     ................

1fff88e8 <isr_table_portE>:
1fff88e8:	00000ec1 00000ec1                       ........

1fff88f0 <Serial>:
1fff88f0:	00003d60 00000000 000003e8 00000000     `=..............

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
