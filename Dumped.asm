
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 d5 0c 00 00 8d 0c 00 00     ... ............
      10:	8d 0c 00 00 8d 0c 00 00 8d 0c 00 00 8d 0c 00 00     ................
      20:	8d 0c 00 00 8d 0c 00 00 8d 0c 00 00 d5 0c 00 00     ................
      30:	d5 0c 00 00 8d 0c 00 00 09 20 00 00 0d 21 00 00     ......... ...!..
      40:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      50:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      60:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      70:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      80:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      90:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      a0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      b0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      c0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      d0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      e0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
      f0:	d5 0c 00 00 29 22 00 00 d5 0c 00 00 55 23 00 00     ....)"......U#..
     100:	d5 0c 00 00 81 24 00 00 d5 0c 00 00 d5 0c 00 00     .....$..........
     110:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     120:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     130:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     140:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     150:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     160:	d5 0c 00 00 f5 11 00 00 d5 0c 00 00 d5 0c 00 00     ................
     170:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     180:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     190:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     1a0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00 d5 0c 00 00     ................
     1b0:	d5 0c 00 00 d5 0c 00 00 d5 0c 00 00                 ............

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
     1d0:	f000 fd84 	bl	cdc <startup_early_hook>
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
     2d6:	f000 fe65 	bl	fa4 <_init_Teensyduino_internal_>

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
     2e4:	f000 fdf8 	bl	ed8 <rtc_set>
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
     302:	f000 fde9 	bl	ed8 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f003 f85f 	bl	33cc <__libc_init_array>

	startup_late_hook();
     30e:	f000 fceb 	bl	ce8 <startup_late_hook>
	main();
     312:	f000 fb31 	bl	978 <main>
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
     33c:	00003f30 	.word	0x00003f30
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91ec 	.word	0x1fff91ec
     348:	1fff96ac 	.word	0x1fff96ac
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
     380:	5ab4c3db 	.word	0x5ab4c3db
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
     430:	00003f2c 	.word	0x00003f2c

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
     460:	00003f2c 	.word	0x00003f2c
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
     47c:	f000 fbe4 	bl	c48 <memset>

}
     480:	4620      	mov	r0, r4
     482:	bd10      	pop	{r4, pc}

00000484 <BaseOOTX::~BaseOOTX()>:

BaseOOTX::~BaseOOTX() {
}
     484:	4770      	bx	lr
     486:	bf00      	nop

00000488 <SensorNode::SensorNode(SensorPinData_t)>:
        }
        CurrentLEDState = LEDState;
    }
}

SensorNode::SensorNode(SensorPinData_t PinData) {
     488:	b430      	push	{r4, r5}
     48a:	b084      	sub	sp, #16
     48c:	ac01      	add	r4, sp, #4
     48e:	e884 000e 	stmia.w	r4, {r1, r2, r3}
     492:	4605      	mov	r5, r0
    _PinData = PinData;
     494:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
     498:	f105 02cc 	add.w	r2, r5, #204	; 0xcc
     49c:	e882 000b 	stmia.w	r2, {r0, r1, r3}

}
     4a0:	4628      	mov	r0, r5
     4a2:	b004      	add	sp, #16
     4a4:	bc30      	pop	{r4, r5}
     4a6:	4770      	bx	lr

000004a8 <SensorNode::Init()>:


void SensorNode::Init() {
     4a8:	b538      	push	{r3, r4, r5, lr}
     4aa:	4604      	mov	r4, r0
	size_t print(char c)				{ return write((uint8_t)c); }
	size_t print(const char s[])			{ return write(s); }
	size_t print(const __FlashStringHelper *f)	{ return write((const char *)f); }

	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
	size_t print(int n)				{ return print((long)n); }
     4ac:	4d18      	ldr	r5, [pc, #96]	; (510 <SensorNode::Init()+0x68>)
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     4ae:	4819      	ldr	r0, [pc, #100]	; (514 <SensorNode::Init()+0x6c>)
     4b0:	210e      	movs	r1, #14
     4b2:	f001 fbe9 	bl	1c88 <usb_serial_write>
     4b6:	f8d4 10cc 	ldr.w	r1, [r4, #204]	; 0xcc
     4ba:	4628      	mov	r0, r5
     4bc:	f000 fae2 	bl	a84 <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
     4c0:	f894 00cc 	ldrb.w	r0, [r4, #204]	; 0xcc
     4c4:	2100      	movs	r1, #0
     4c6:	f000 fd19 	bl	efc <pinMode>
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
     4ca:	f894 00d0 	ldrb.w	r0, [r4, #208]	; 0xd0
     4ce:	2100      	movs	r1, #0
     4d0:	f000 fd14 	bl	efc <pinMode>
    pinMode(_PinData.LED2Pin, INPUT);
     4d4:	f894 00d4 	ldrb.w	r0, [r4, #212]	; 0xd4
     4d8:	2100      	movs	r1, #0
     4da:	f000 fd0f 	bl	efc <pinMode>
    Angles[STATION_A][HORZ] = 0;
     4de:	2300      	movs	r3, #0
     4e0:	f8c4 30b0 	str.w	r3, [r4, #176]	; 0xb0
    Angles[STATION_A][VERT] = 0;
     4e4:	f8c4 30b4 	str.w	r3, [r4, #180]	; 0xb4
    Angles[STATION_B][HORZ] = 0;
     4e8:	f8c4 30b8 	str.w	r3, [r4, #184]	; 0xb8
    Angles[STATION_B][VERT] = 0;
     4ec:	f8c4 30bc 	str.w	r3, [r4, #188]	; 0xbc
    Location[X_AXIS] = 0;
     4f0:	f8c4 30c0 	str.w	r3, [r4, #192]	; 0xc0
    Location[Y_AXIS] = 0;
     4f4:	f8c4 30c4 	str.w	r3, [r4, #196]	; 0xc4
    Location[Z_AXIS] = 0;
     4f8:	f8c4 30c8 	str.w	r3, [r4, #200]	; 0xc8
     4fc:	2109      	movs	r1, #9
     4fe:	4806      	ldr	r0, [pc, #24]	; (518 <SensorNode::Init()+0x70>)
     500:	f001 fbc2 	bl	1c88 <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
	size_t print(const Printable &obj)		{ return obj.printTo(*this); }
	size_t println(void);
	size_t println(const String &s)			{ return print(s) + println(); }
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
     504:	4628      	mov	r0, r5

    Serial.println(" Complete");
}
     506:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     50a:	f000 ba6b 	b.w	9e4 <Print::println()>
     50e:	bf00      	nop
     510:	1fff88f0 	.word	0x1fff88f0
     514:	00003d20 	.word	0x00003d20
     518:	00003d30 	.word	0x00003d30

0000051c <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     51c:	4770      	bx	lr
     51e:	bf00      	nop

00000520 <SensorNode::GetPulsePin()>:

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}
     520:	f890 00cc 	ldrb.w	r0, [r0, #204]	; 0xcc
     524:	4770      	bx	lr
     526:	bf00      	nop

00000528 <SensorNode::NewSweepInterrupt(unsigned long, unsigned long)>:

void SensorNode::NewSweepInterrupt(u_int32_t PulseLength, u_int32_t PulseStartTime) {
    LatestSweepInterrupt.Length = PulseLength;
    LatestSweepInterrupt.StartTime = PulseStartTime;
    LatestSweepInterrupt.New = true;
     528:	7a03      	ldrb	r3, [r0, #8]
    LatestSweepInterrupt.Length = PulseLength;
     52a:	6001      	str	r1, [r0, #0]
    LatestSweepInterrupt.New = true;
     52c:	f043 0301 	orr.w	r3, r3, #1
    LatestSweepInterrupt.StartTime = PulseStartTime;
     530:	6042      	str	r2, [r0, #4]
    LatestSweepInterrupt.New = true;
     532:	7203      	strb	r3, [r0, #8]
     534:	4770      	bx	lr
     536:	bf00      	nop

00000538 <SensorNode::MovingAverageCalc(unsigned char, unsigned char)>:
    AverageAngle[Source][Axis][AverageAnglePointers[Source][Axis]] = New;
    ++AverageAnglePointers[Source][Axis] %= AVERAGE_SIZE;

}

float SensorNode::MovingAverageCalc(u_int8_t Source, u_int8_t Axis) {
     538:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     53c:	eb01 0181 	add.w	r1, r1, r1, lsl #2
     540:	00d2      	lsls	r2, r2, #3
     542:	0109      	lsls	r1, r1, #4
     544:	b538      	push	{r3, r4, r5, lr}
     546:	1854      	adds	r4, r2, r1
     548:	3230      	adds	r2, #48	; 0x30
     54a:	3408      	adds	r4, #8
     54c:	4411      	add	r1, r2
     54e:	2300      	movs	r3, #0
     550:	4404      	add	r4, r0
     552:	1845      	adds	r5, r0, r1
    for (int i = 0; i < AVERAGE_SIZE; i++) {
        float This = AverageAngle[Source][Axis][i];

//        Serial.print(This);
//        Serial.print(" - ");
        Total += This;
     554:	f854 1f04 	ldr.w	r1, [r4, #4]!
     558:	4618      	mov	r0, r3
     55a:	f002 fcd3 	bl	2f04 <__addsf3>
    for (int i = 0; i < AVERAGE_SIZE; i++) {
     55e:	42ac      	cmp	r4, r5
        Total += This;
     560:	4603      	mov	r3, r0
    for (int i = 0; i < AVERAGE_SIZE; i++) {
     562:	d1f7      	bne.n	554 <SensorNode::MovingAverageCalc(unsigned char, unsigned char)+0x1c>
    }
   // Serial.println(" ");


    return Total / (float) AVERAGE_SIZE;
     564:	4901      	ldr	r1, [pc, #4]	; (56c <SensorNode::MovingAverageCalc(unsigned char, unsigned char)+0x34>)
     566:	f002 fe89 	bl	327c <__aeabi_fdiv>


}
     56a:	bd38      	pop	{r3, r4, r5, pc}
     56c:	41200000 	.word	0x41200000

00000570 <SensorNode::PrepareForReading()>:

void SensorNode::PrepareForReading() {
    Angles[STATION_A][HORZ] = MovingAverageCalc(STATION_A, HORZ);
     570:	2200      	movs	r2, #0
void SensorNode::PrepareForReading() {
     572:	b510      	push	{r4, lr}
    Angles[STATION_A][HORZ] = MovingAverageCalc(STATION_A, HORZ);
     574:	4611      	mov	r1, r2
void SensorNode::PrepareForReading() {
     576:	4604      	mov	r4, r0
    Angles[STATION_A][HORZ] = MovingAverageCalc(STATION_A, HORZ);
     578:	f7ff ffde 	bl	538 <SensorNode::MovingAverageCalc(unsigned char, unsigned char)>
    Angles[STATION_A][VERT] = MovingAverageCalc(STATION_A, VERT);
     57c:	2201      	movs	r2, #1
    Angles[STATION_A][HORZ] = MovingAverageCalc(STATION_A, HORZ);
     57e:	f8c4 00b0 	str.w	r0, [r4, #176]	; 0xb0
    Angles[STATION_A][VERT] = MovingAverageCalc(STATION_A, VERT);
     582:	2100      	movs	r1, #0
     584:	4620      	mov	r0, r4
     586:	f7ff ffd7 	bl	538 <SensorNode::MovingAverageCalc(unsigned char, unsigned char)>
    Angles[STATION_B][HORZ] = MovingAverageCalc(STATION_B, HORZ);
     58a:	2200      	movs	r2, #0
    Angles[STATION_A][VERT] = MovingAverageCalc(STATION_A, VERT);
     58c:	f8c4 00b4 	str.w	r0, [r4, #180]	; 0xb4
    Angles[STATION_B][HORZ] = MovingAverageCalc(STATION_B, HORZ);
     590:	2101      	movs	r1, #1
     592:	4620      	mov	r0, r4
     594:	f7ff ffd0 	bl	538 <SensorNode::MovingAverageCalc(unsigned char, unsigned char)>
    Angles[STATION_B][VERT] = MovingAverageCalc(STATION_B, VERT);
     598:	2201      	movs	r2, #1
    Angles[STATION_B][HORZ] = MovingAverageCalc(STATION_B, HORZ);
     59a:	f8c4 00b8 	str.w	r0, [r4, #184]	; 0xb8
    Angles[STATION_B][VERT] = MovingAverageCalc(STATION_B, VERT);
     59e:	4611      	mov	r1, r2
     5a0:	4620      	mov	r0, r4
     5a2:	f7ff ffc9 	bl	538 <SensorNode::MovingAverageCalc(unsigned char, unsigned char)>
     5a6:	f8c4 00bc 	str.w	r0, [r4, #188]	; 0xbc
     5aa:	bd10      	pop	{r4, pc}

000005ac <SensorNode::CheckAndHandleSweep(unsigned long, unsigned char, unsigned char, unsigned long, unsigned char)>:

}

bool SensorNode::CheckAndHandleSweep(u_int32_t Now, u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                                     u_int8_t CurrentStationLock) {
     5ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     5ae:	f89d 401c 	ldrb.w	r4, [sp, #28]
    noInterrupts();
     5b2:	b672      	cpsid	i
    Pulse SafeCopy = LatestSweepInterrupt;
     5b4:	7a01      	ldrb	r1, [r0, #8]
     5b6:	6846      	ldr	r6, [r0, #4]
    LatestSweepInterrupt.New = false;
     5b8:	460d      	mov	r5, r1
     5ba:	f36f 0500 	bfc	r5, #0, #1
     5be:	7205      	strb	r5, [r0, #8]
    Pulse SafeCopy = LatestSweepInterrupt;
     5c0:	f001 0101 	and.w	r1, r1, #1
    interrupts();
     5c4:	b662      	cpsie	i
    if (SafeCopy.New) {
     5c6:	b109      	cbz	r1, 5cc <SensorNode::CheckAndHandleSweep(unsigned long, unsigned char, unsigned char, unsigned long, unsigned char)+0x20>
        if (CurrentStationLock == DUAL_STATION_LOCK) {
     5c8:	2c02      	cmp	r4, #2
     5ca:	d000      	beq.n	5ce <SensorNode::CheckAndHandleSweep(unsigned long, unsigned char, unsigned char, unsigned long, unsigned char)+0x22>
            //Angles[SweepSource][SweepAxis] = NewAngle;
            MovingAverageAdd(NewAngle, SweepSource, SweepAxis);
            return true;
        }
    }
}
     5cc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    AverageAngle[Source][Axis][AverageAnglePointers[Source][Axis]] = New;
     5ce:	eb00 0542 	add.w	r5, r0, r2, lsl #1
     5d2:	441d      	add	r5, r3
     5d4:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     5d8:	0092      	lsls	r2, r2, #2
     5da:	f895 70ac 	ldrb.w	r7, [r5, #172]	; 0xac
     5de:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     5e2:	eb02 0443 	add.w	r4, r2, r3, lsl #1
     5e6:	9b06      	ldr	r3, [sp, #24]
     5e8:	443c      	add	r4, r7
     5ea:	4601      	mov	r1, r0
     5ec:	3402      	adds	r4, #2
     5ee:	1af0      	subs	r0, r6, r3
     5f0:	eb01 0484 	add.w	r4, r1, r4, lsl #2
     5f4:	f002 fd36 	bl	3064 <__aeabi_ui2f>
     5f8:	4908      	ldr	r1, [pc, #32]	; (61c <SensorNode::CheckAndHandleSweep(unsigned long, unsigned char, unsigned char, unsigned long, unsigned char)+0x70>)
     5fa:	f002 fe3f 	bl	327c <__aeabi_fdiv>
    ++AverageAnglePointers[Source][Axis] %= AVERAGE_SIZE;
     5fe:	3701      	adds	r7, #1
     600:	4b07      	ldr	r3, [pc, #28]	; (620 <SensorNode::CheckAndHandleSweep(unsigned long, unsigned char, unsigned char, unsigned long, unsigned char)+0x74>)
    AverageAngle[Source][Axis][AverageAnglePointers[Source][Axis]] = New;
     602:	6060      	str	r0, [r4, #4]
    ++AverageAnglePointers[Source][Axis] %= AVERAGE_SIZE;
     604:	b2ff      	uxtb	r7, r7
     606:	fba3 2307 	umull	r2, r3, r3, r7
     60a:	08db      	lsrs	r3, r3, #3
     60c:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     610:	eba7 0743 	sub.w	r7, r7, r3, lsl #1
     614:	f885 70ac 	strb.w	r7, [r5, #172]	; 0xac
            return true;
     618:	2001      	movs	r0, #1
     61a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     61c:	44e77555 	.word	0x44e77555
     620:	cccccccd 	.word	0xcccccccd

00000624 <InitTimer()>:
#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {
     624:	b4f0      	push	{r4, r5, r6, r7}

    SIM_SCGC6 |= SIM_SCGC6_PIT;
     626:	4a08      	ldr	r2, [pc, #32]	; (648 <InitTimer()+0x24>)
    PIT_LDVAL0 = UINT32_MAX;
     628:	4e08      	ldr	r6, [pc, #32]	; (64c <InitTimer()+0x28>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     62a:	6813      	ldr	r3, [r2, #0]
    PIT_MCR = 0;
     62c:	4c08      	ldr	r4, [pc, #32]	; (650 <InitTimer()+0x2c>)
    PIT_TCTRL0 = 1;
     62e:	4909      	ldr	r1, [pc, #36]	; (654 <InitTimer()+0x30>)
    PIT_LDVAL0 = UINT32_MAX;
     630:	f04f 37ff 	mov.w	r7, #4294967295
    PIT_MCR = 0;
     634:	2500      	movs	r5, #0
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     636:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
    PIT_TCTRL0 = 1;
     63a:	2001      	movs	r0, #1
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     63c:	6013      	str	r3, [r2, #0]
    PIT_LDVAL0 = UINT32_MAX;
     63e:	6037      	str	r7, [r6, #0]
    PIT_MCR = 0;
     640:	6025      	str	r5, [r4, #0]
    PIT_TCTRL0 = 1;
     642:	6008      	str	r0, [r1, #0]

}
     644:	bcf0      	pop	{r4, r5, r6, r7}
     646:	4770      	bx	lr
     648:	4004803c 	.word	0x4004803c
     64c:	40037100 	.word	0x40037100
     650:	40037000 	.word	0x40037000
     654:	40037108 	.word	0x40037108

00000658 <__tcf_1>:
#include "SensorNode.h"
#include "Timing.h"
#include "OOTX.h"

SensorNode Nodes[] = {SENSOR_1_PINS};
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     658:	b510      	push	{r4, lr}
     65a:	4c05      	ldr	r4, [pc, #20]	; (670 <__tcf_1+0x18>)
     65c:	f104 004c 	add.w	r0, r4, #76	; 0x4c
     660:	f7ff ff10 	bl	484 <BaseOOTX::~BaseOOTX()>
     664:	4620      	mov	r0, r4
     666:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     66a:	f7ff bf0b 	b.w	484 <BaseOOTX::~BaseOOTX()>
     66e:	bf00      	nop
     670:	1fff9208 	.word	0x1fff9208

00000674 <__tcf_0>:
SensorNode Nodes[] = {SENSOR_1_PINS};
     674:	4801      	ldr	r0, [pc, #4]	; (67c <__tcf_0+0x8>)
     676:	f7ff bf51 	b.w	51c <SensorNode::~SensorNode()>
     67a:	bf00      	nop
     67c:	1fff92c0 	.word	0x1fff92c0

00000680 <Interrupt0Change()>:
        Nodes[ID].NewSweepInterrupt(LastCallToNow,Now);\
}\
In_ISR = false;\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);
     680:	4b20      	ldr	r3, [pc, #128]	; (704 <Interrupt0Change()+0x84>)
     682:	b570      	push	{r4, r5, r6, lr}
     684:	681c      	ldr	r4, [r3, #0]
     686:	43e4      	mvns	r4, r4
     688:	b662      	cpsie	i
     68a:	4d1f      	ldr	r5, [pc, #124]	; (708 <Interrupt0Change()+0x88>)
     68c:	782b      	ldrb	r3, [r5, #0]
     68e:	2b00      	cmp	r3, #0
     690:	d130      	bne.n	6f4 <Interrupt0Change()+0x74>
     692:	4b1e      	ldr	r3, [pc, #120]	; (70c <Interrupt0Change()+0x8c>)
     694:	6819      	ldr	r1, [r3, #0]
     696:	601c      	str	r4, [r3, #0]
     698:	1a61      	subs	r1, r4, r1
     69a:	f6a1 6288 	subw	r2, r1, #3720	; 0xe88
     69e:	f241 2348 	movw	r3, #4680	; 0x1248
     6a2:	2001      	movs	r0, #1
     6a4:	429a      	cmp	r2, r3
     6a6:	7028      	strb	r0, [r5, #0]
     6a8:	d818      	bhi.n	6dc <Interrupt0Change()+0x5c>

Pulse LatestBaseSync[2];

void NewSyncInterrupt(u_int8_t SourceNode, u_int32_t PulseLength, u_int32_t PulseStartTime) {
    static Pulse LastDetectedSync = {0, 0};
    if (!IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime,
     6aa:	4a19      	ldr	r2, [pc, #100]	; (710 <Interrupt0Change()+0x90>)
     6ac:	6853      	ldr	r3, [r2, #4]
     6ae:	1ae3      	subs	r3, r4, r3
     6b0:	f5b3 6fe1 	cmp.w	r3, #1800	; 0x708
     6b4:	d90f      	bls.n	6d6 <Interrupt0Change()+0x56>
                  PULSETRAIN_SYNC_DISCREPANCY)) { // New Sync Pulse? (multiple nodes feed same function)
        u_int8_t SourceStation = IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime, US_TO_TICKS(1000));
        LastDetectedSync.StartTime = LatestBaseSync[SourceStation].StartTime = PulseStartTime;
     6b6:	f64e 2060 	movw	r0, #60000	; 0xea60
     6ba:	4e16      	ldr	r6, [pc, #88]	; (714 <Interrupt0Change()+0x94>)
     6bc:	6054      	str	r4, [r2, #4]
     6be:	4283      	cmp	r3, r0
     6c0:	bf94      	ite	ls
     6c2:	230c      	movls	r3, #12
     6c4:	2300      	movhi	r3, #0
     6c6:	18f0      	adds	r0, r6, r3
        LastDetectedSync.Length = LatestBaseSync[SourceStation].Length = PulseLength;
     6c8:	6011      	str	r1, [r2, #0]
        LatestBaseSync[SourceStation].New = true;
     6ca:	7a02      	ldrb	r2, [r0, #8]
        LastDetectedSync.Length = LatestBaseSync[SourceStation].Length = PulseLength;
     6cc:	50f1      	str	r1, [r6, r3]
        LatestBaseSync[SourceStation].New = true;
     6ce:	f042 0301 	orr.w	r3, r2, #1
        LastDetectedSync.StartTime = LatestBaseSync[SourceStation].StartTime = PulseStartTime;
     6d2:	6044      	str	r4, [r0, #4]
        LatestBaseSync[SourceStation].New = true;
     6d4:	7203      	strb	r3, [r0, #8]
void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);
     6d6:	2300      	movs	r3, #0
     6d8:	702b      	strb	r3, [r5, #0]
     6da:	bd70      	pop	{r4, r5, r6, pc}
     6dc:	f5a1 7396 	sub.w	r3, r1, #300	; 0x12c
     6e0:	f5b3 7f16 	cmp.w	r3, #600	; 0x258
     6e4:	d8f7      	bhi.n	6d6 <Interrupt0Change()+0x56>
     6e6:	4622      	mov	r2, r4
     6e8:	480b      	ldr	r0, [pc, #44]	; (718 <Interrupt0Change()+0x98>)
     6ea:	f7ff ff1d 	bl	528 <SensorNode::NewSweepInterrupt(unsigned long, unsigned long)>
     6ee:	2300      	movs	r3, #0
     6f0:	702b      	strb	r3, [r5, #0]
     6f2:	bd70      	pop	{r4, r5, r6, pc}
     6f4:	2105      	movs	r1, #5
     6f6:	4809      	ldr	r0, [pc, #36]	; (71c <Interrupt0Change()+0x9c>)
     6f8:	f001 fac6 	bl	1c88 <usb_serial_write>
     6fc:	4808      	ldr	r0, [pc, #32]	; (720 <Interrupt0Change()+0xa0>)
     6fe:	f000 f971 	bl	9e4 <Print::println()>
     702:	e7c6      	b.n	692 <Interrupt0Change()+0x12>
     704:	40037104 	.word	0x40037104
     708:	1fff92b9 	.word	0x1fff92b9
     70c:	1fff92b0 	.word	0x1fff92b0
     710:	1fff92a0 	.word	0x1fff92a0
     714:	1fff939c 	.word	0x1fff939c
     718:	1fff92c0 	.word	0x1fff92c0
     71c:	00003d3c 	.word	0x00003d3c
     720:	1fff88f0 	.word	0x1fff88f0

00000724 <ConfigureInterrupts()>:
void ConfigureInterrupts() {
     724:	b508      	push	{r3, lr}
     726:	2112      	movs	r1, #18
     728:	4809      	ldr	r0, [pc, #36]	; (750 <ConfigureInterrupts()+0x2c>)
     72a:	f001 faad 	bl	1c88 <usb_serial_write>
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
     72e:	4809      	ldr	r0, [pc, #36]	; (754 <ConfigureInterrupts()+0x30>)
     730:	f7ff fef6 	bl	520 <SensorNode::GetPulsePin()>
     734:	2204      	movs	r2, #4
     736:	4908      	ldr	r1, [pc, #32]	; (758 <ConfigureInterrupts()+0x34>)
     738:	f000 fb52 	bl	de0 <attachInterrupt>
     73c:	2108      	movs	r1, #8
     73e:	4807      	ldr	r0, [pc, #28]	; (75c <ConfigureInterrupts()+0x38>)
     740:	f001 faa2 	bl	1c88 <usb_serial_write>
     744:	4806      	ldr	r0, [pc, #24]	; (760 <ConfigureInterrupts()+0x3c>)
}
     746:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
     74a:	f000 b94b 	b.w	9e4 <Print::println()>
     74e:	bf00      	nop
     750:	00003d44 	.word	0x00003d44
     754:	1fff92c0 	.word	0x1fff92c0
     758:	00000681 	.word	0x00000681
     75c:	00003d58 	.word	0x00003d58
     760:	1fff88f0 	.word	0x1fff88f0

00000764 <MainSetup()>:
void MainSetup() {
     764:	b508      	push	{r3, lr}
    pinMode(LED_BUILTIN, OUTPUT);
     766:	2101      	movs	r1, #1
     768:	200d      	movs	r0, #13
     76a:	f000 fbc7 	bl	efc <pinMode>
    delay(2000);
     76e:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     772:	f000 fbc9 	bl	f08 <delay>
        Nodes[i].Init();
     776:	4807      	ldr	r0, [pc, #28]	; (794 <MainSetup()+0x30>)
     778:	f7ff fe96 	bl	4a8 <SensorNode::Init()>
    delay(100);
     77c:	2064      	movs	r0, #100	; 0x64
     77e:	f000 fbc3 	bl	f08 <delay>
    InitTimer(); //Start up better timer (If using)
     782:	f7ff ff4f 	bl	624 <InitTimer()>
    ConfigureInterrupts(); // Set up Channel Interrupts
     786:	f7ff ffcd 	bl	724 <ConfigureInterrupts()>
			} else if (pin == 11) {
				CORE_PIN11_PORTSET = CORE_PIN11_BITMASK;
			} else if (pin == 12) {
				CORE_PIN12_PORTSET = CORE_PIN12_BITMASK;
			} else if (pin == 13) {
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     78a:	4b03      	ldr	r3, [pc, #12]	; (798 <MainSetup()+0x34>)
     78c:	2220      	movs	r2, #32
     78e:	601a      	str	r2, [r3, #0]
     790:	bd08      	pop	{r3, pc}
     792:	bf00      	nop
     794:	1fff92c0 	.word	0x1fff92c0
     798:	400ff084 	.word	0x400ff084

0000079c <MainLoop()>:

    }
}


void MainLoop() {
     79c:	b5f0      	push	{r4, r5, r6, r7, lr}
    static u_int8_t NextSweepSource = 0;
    static u_int8_t NextSweepAxis = 0;
    static u_int8_t CurrentStationLock = 0;
    static u_int32_t SyncSweepStartTime = 0;

    u_int32_t RunStartTime = CURRENT_TIME;
     79e:	4b67      	ldr	r3, [pc, #412]	; (93c <MainLoop()+0x1a0>)

    if (LatestBaseSync[STATION_A].New) {
     7a0:	4867      	ldr	r0, [pc, #412]	; (940 <MainLoop()+0x1a4>)
    u_int32_t RunStartTime = CURRENT_TIME;
     7a2:	6819      	ldr	r1, [r3, #0]
    if (LatestBaseSync[STATION_A].New) {
     7a4:	7a03      	ldrb	r3, [r0, #8]
     7a6:	07df      	lsls	r7, r3, #31
void MainLoop() {
     7a8:	b085      	sub	sp, #20
    u_int32_t RunStartTime = CURRENT_TIME;
     7aa:	ea6f 0101 	mvn.w	r1, r1
    if (LatestBaseSync[STATION_A].New) {
     7ae:	d428      	bmi.n	802 <MainLoop()+0x66>
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_A;
        NextSweepAxis = AXIS(SyncPulseMeaning);


    }
    if (LatestBaseSync[STATION_B].New) {
     7b0:	7d02      	ldrb	r2, [r0, #20]
     7b2:	4c64      	ldr	r4, [pc, #400]	; (944 <MainLoop()+0x1a8>)
     7b4:	4d64      	ldr	r5, [pc, #400]	; (948 <MainLoop()+0x1ac>)
     7b6:	4f65      	ldr	r7, [pc, #404]	; (94c <MainLoop()+0x1b0>)
     7b8:	4b61      	ldr	r3, [pc, #388]	; (940 <MainLoop()+0x1a4>)
     7ba:	07d6      	lsls	r6, r2, #31
     7bc:	d447      	bmi.n	84e <MainLoop()+0xb2>
     7be:	782a      	ldrb	r2, [r5, #0]
     7c0:	783b      	ldrb	r3, [r7, #0]
     7c2:	6826      	ldr	r6, [r4, #0]
        SyncSweepStartTime = SafeCopy.StartTime;


    }

    if ((RunStartTime - LatestBaseSync[STATION_B].StartTime) >= 2 * PULSETRAIN_LENGTH_TICKS) {
     7c4:	6900      	ldr	r0, [r0, #16]
     7c6:	4c62      	ldr	r4, [pc, #392]	; (950 <MainLoop()+0x1b4>)
     7c8:	4d5d      	ldr	r5, [pc, #372]	; (940 <MainLoop()+0x1a4>)
     7ca:	1a08      	subs	r0, r1, r0
     7cc:	42a0      	cmp	r0, r4
     7ce:	d961      	bls.n	894 <MainLoop()+0xf8>
        if ((RunStartTime - LatestBaseSync[STATION_A].StartTime) >= 2 * PULSETRAIN_LENGTH_TICKS) {
     7d0:	6868      	ldr	r0, [r5, #4]
            CurrentStationLock = NO_STATION_LOCK;
     7d2:	4d60      	ldr	r5, [pc, #384]	; (954 <MainLoop()+0x1b8>)
        if ((RunStartTime - LatestBaseSync[STATION_A].StartTime) >= 2 * PULSETRAIN_LENGTH_TICKS) {
     7d4:	1a08      	subs	r0, r1, r0
     7d6:	42a0      	cmp	r0, r4
            CurrentStationLock = NO_STATION_LOCK;
     7d8:	bf8c      	ite	hi
     7da:	2000      	movhi	r0, #0
        }
        else {
            CurrentStationLock = SINGLE_STATION_LOCK;
     7dc:	2001      	movls	r0, #1
     7de:	7028      	strb	r0, [r5, #0]
        CurrentStationLock = DUAL_STATION_LOCK;
    }

    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(RunStartTime, NextSweepSource, NextSweepAxis, SyncSweepStartTime,
                                     CurrentStationLock);
     7e0:	4c5d      	ldr	r4, [pc, #372]	; (958 <MainLoop()+0x1bc>)
     7e2:	9001      	str	r0, [sp, #4]
     7e4:	9600      	str	r6, [sp, #0]
     7e6:	4620      	mov	r0, r4
     7e8:	f7ff fee0 	bl	5ac <SensorNode::CheckAndHandleSweep(unsigned long, unsigned char, unsigned char, unsigned long, unsigned char)>
	// do not remove this "redundant" code without
	// carefully verifying the case mentioned here:
	//
	// https://forum.pjrc.com/threads/17469-millis%28%29-on-teensy-3?p=104924&viewfull=1#post104924
	//
	volatile uint32_t ret = systick_millis_count; // single aligned 32 bit is atomic
     7ec:	495b      	ldr	r1, [pc, #364]	; (95c <MainLoop()+0x1c0>)
    }

    static unsigned long t = 0;
    if (millis() - t > 100) {
     7ee:	4a5c      	ldr	r2, [pc, #368]	; (960 <MainLoop()+0x1c4>)
     7f0:	680b      	ldr	r3, [r1, #0]
     7f2:	9302      	str	r3, [sp, #8]
	return ret;
     7f4:	9b02      	ldr	r3, [sp, #8]
     7f6:	6810      	ldr	r0, [r2, #0]
     7f8:	1a1b      	subs	r3, r3, r0
     7fa:	2b64      	cmp	r3, #100	; 0x64
     7fc:	d84e      	bhi.n	89c <MainLoop()+0x100>
        //OOTX[STATION_A].PrintBuffer();


    }

}
     7fe:	b005      	add	sp, #20
     800:	bdf0      	pop	{r4, r5, r6, r7, pc}
        noInterrupts();
     802:	b672      	cpsid	i
        LatestBaseSync[STATION_A].New = false;
     804:	7a03      	ldrb	r3, [r0, #8]
     806:	f36f 0300 	bfc	r3, #0, #1
        Pulse SafeCopy = LatestBaseSync[STATION_A];
     80a:	e890 0024 	ldmia.w	r0, {r2, r5}
        LatestBaseSync[STATION_A].New = false;
     80e:	7203      	strb	r3, [r0, #8]
        interrupts();
     810:	b662      	cpsie	i
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
     812:	4b54      	ldr	r3, [pc, #336]	; (964 <MainLoop()+0x1c8>)
     814:	4e54      	ldr	r6, [pc, #336]	; (968 <MainLoop()+0x1cc>)
        SyncSweepStartTime = SafeCopy.StartTime;
     816:	4c4b      	ldr	r4, [pc, #300]	; (944 <MainLoop()+0x1a8>)
        NextSweepAxis = AXIS(SyncPulseMeaning);
     818:	4f4c      	ldr	r7, [pc, #304]	; (94c <MainLoop()+0x1b0>)
        SyncSweepStartTime = SafeCopy.StartTime;
     81a:	6025      	str	r5, [r4, #0]
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
     81c:	eb02 0242 	add.w	r2, r2, r2, lsl #1
     820:	0112      	lsls	r2, r2, #4
     822:	fba3 2302 	umull	r2, r3, r3, r2
     826:	095b      	lsrs	r3, r3, #5
     828:	f6a3 13c5 	subw	r3, r3, #2501	; 0x9c5
     82c:	fba6 2303 	umull	r2, r3, r6, r3
     830:	f3c3 1347 	ubfx	r3, r3, #5, #8
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_A;
     834:	4d44      	ldr	r5, [pc, #272]	; (948 <MainLoop()+0x1ac>)
     836:	f013 0204 	ands.w	r2, r3, #4
     83a:	bf18      	it	ne
     83c:	782a      	ldrbne	r2, [r5, #0]
     83e:	702a      	strb	r2, [r5, #0]
    if (LatestBaseSync[STATION_B].New) {
     840:	7d02      	ldrb	r2, [r0, #20]
        NextSweepAxis = AXIS(SyncPulseMeaning);
     842:	f003 0301 	and.w	r3, r3, #1
    if (LatestBaseSync[STATION_B].New) {
     846:	07d6      	lsls	r6, r2, #31
        NextSweepAxis = AXIS(SyncPulseMeaning);
     848:	703b      	strb	r3, [r7, #0]
    if (LatestBaseSync[STATION_B].New) {
     84a:	4b3d      	ldr	r3, [pc, #244]	; (940 <MainLoop()+0x1a4>)
     84c:	d5b7      	bpl.n	7be <MainLoop()+0x22>
        noInterrupts();
     84e:	b672      	cpsid	i
        LatestBaseSync[STATION_B].New = false;
     850:	f893 e014 	ldrb.w	lr, [r3, #20]
        Pulse SafeCopy = LatestBaseSync[STATION_B];
     854:	68da      	ldr	r2, [r3, #12]
     856:	691e      	ldr	r6, [r3, #16]
        LatestBaseSync[STATION_B].New = false;
     858:	f36f 0e00 	bfc	lr, #0, #1
     85c:	f883 e014 	strb.w	lr, [r3, #20]
        interrupts();
     860:	b662      	cpsie	i
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
     862:	4b40      	ldr	r3, [pc, #256]	; (964 <MainLoop()+0x1c8>)
     864:	f8df e100 	ldr.w	lr, [pc, #256]	; 968 <MainLoop()+0x1cc>
        SyncSweepStartTime = SafeCopy.StartTime;
     868:	6026      	str	r6, [r4, #0]
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
     86a:	eb02 0242 	add.w	r2, r2, r2, lsl #1
     86e:	0112      	lsls	r2, r2, #4
     870:	fba3 2302 	umull	r2, r3, r3, r2
     874:	095b      	lsrs	r3, r3, #5
     876:	f6a3 13c5 	subw	r3, r3, #2501	; 0x9c5
     87a:	fbae 2303 	umull	r2, r3, lr, r3
     87e:	f3c3 1347 	ubfx	r3, r3, #5, #8
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_B;
     882:	075a      	lsls	r2, r3, #29
     884:	bf4c      	ite	mi
     886:	782a      	ldrbmi	r2, [r5, #0]
     888:	2201      	movpl	r2, #1
        NextSweepAxis = AXIS(SyncPulseMeaning);
     88a:	f003 0301 	and.w	r3, r3, #1
     88e:	703b      	strb	r3, [r7, #0]
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_B;
     890:	702a      	strb	r2, [r5, #0]
     892:	e797      	b.n	7c4 <MainLoop()+0x28>
        CurrentStationLock = DUAL_STATION_LOCK;
     894:	4d2f      	ldr	r5, [pc, #188]	; (954 <MainLoop()+0x1b8>)
     896:	2002      	movs	r0, #2
     898:	7028      	strb	r0, [r5, #0]
     89a:	e7a1      	b.n	7e0 <MainLoop()+0x44>
	volatile uint32_t ret = systick_millis_count; // single aligned 32 bit is atomic
     89c:	680b      	ldr	r3, [r1, #0]
     89e:	9303      	str	r3, [sp, #12]
	return ret;
     8a0:	9b03      	ldr	r3, [sp, #12]
        t = millis();
     8a2:	6013      	str	r3, [r2, #0]
        Nodes[0].PrepareForReading();
     8a4:	4620      	mov	r0, r4
     8a6:	f7ff fe63 	bl	570 <SensorNode::PrepareForReading()>
	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
     8aa:	2300      	movs	r3, #0
     8ac:	220a      	movs	r2, #10
     8ae:	7829      	ldrb	r1, [r5, #0]
     8b0:	482e      	ldr	r0, [pc, #184]	; (96c <MainLoop()+0x1d0>)
     8b2:	f000 f8a7 	bl	a04 <Print::printNumber(unsigned long, unsigned char, unsigned char)>
     8b6:	2105      	movs	r1, #5
     8b8:	482d      	ldr	r0, [pc, #180]	; (970 <MainLoop()+0x1d4>)
     8ba:	f001 f9e5 	bl	1c88 <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
     8be:	f8d4 00b0 	ldr.w	r0, [r4, #176]	; 0xb0
     8c2:	f001 fff5 	bl	28b0 <__aeabi_f2d>
     8c6:	2502      	movs	r5, #2
     8c8:	4602      	mov	r2, r0
     8ca:	460b      	mov	r3, r1
     8cc:	9500      	str	r5, [sp, #0]
     8ce:	4827      	ldr	r0, [pc, #156]	; (96c <MainLoop()+0x1d0>)
     8d0:	f000 f8e2 	bl	a98 <Print::printFloat(double, unsigned char)>
     8d4:	2101      	movs	r1, #1
     8d6:	4827      	ldr	r0, [pc, #156]	; (974 <MainLoop()+0x1d8>)
     8d8:	f001 f9d6 	bl	1c88 <usb_serial_write>
     8dc:	f8d4 00b4 	ldr.w	r0, [r4, #180]	; 0xb4
     8e0:	f001 ffe6 	bl	28b0 <__aeabi_f2d>
     8e4:	9500      	str	r5, [sp, #0]
     8e6:	4602      	mov	r2, r0
     8e8:	460b      	mov	r3, r1
     8ea:	4820      	ldr	r0, [pc, #128]	; (96c <MainLoop()+0x1d0>)
     8ec:	f000 f8d4 	bl	a98 <Print::printFloat(double, unsigned char)>
     8f0:	2101      	movs	r1, #1
     8f2:	4820      	ldr	r0, [pc, #128]	; (974 <MainLoop()+0x1d8>)
     8f4:	f001 f9c8 	bl	1c88 <usb_serial_write>
     8f8:	f8d4 00b8 	ldr.w	r0, [r4, #184]	; 0xb8
     8fc:	f001 ffd8 	bl	28b0 <__aeabi_f2d>
     900:	9500      	str	r5, [sp, #0]
     902:	4602      	mov	r2, r0
     904:	460b      	mov	r3, r1
     906:	4819      	ldr	r0, [pc, #100]	; (96c <MainLoop()+0x1d0>)
     908:	f000 f8c6 	bl	a98 <Print::printFloat(double, unsigned char)>
     90c:	2101      	movs	r1, #1
     90e:	4819      	ldr	r0, [pc, #100]	; (974 <MainLoop()+0x1d8>)
     910:	f001 f9ba 	bl	1c88 <usb_serial_write>
     914:	f8d4 00bc 	ldr.w	r0, [r4, #188]	; 0xbc
     918:	f001 ffca 	bl	28b0 <__aeabi_f2d>
     91c:	9500      	str	r5, [sp, #0]
     91e:	4602      	mov	r2, r0
     920:	460b      	mov	r3, r1
     922:	4812      	ldr	r0, [pc, #72]	; (96c <MainLoop()+0x1d0>)
     924:	f000 f8b8 	bl	a98 <Print::printFloat(double, unsigned char)>
     928:	2101      	movs	r1, #1
     92a:	4812      	ldr	r0, [pc, #72]	; (974 <MainLoop()+0x1d8>)
     92c:	f001 f9ac 	bl	1c88 <usb_serial_write>
	size_t println(const char s[])			{ return print(s) + println(); }
     930:	480e      	ldr	r0, [pc, #56]	; (96c <MainLoop()+0x1d0>)
     932:	f000 f857 	bl	9e4 <Print::println()>
}
     936:	b005      	add	sp, #20
     938:	bdf0      	pop	{r4, r5, r6, r7, pc}
     93a:	bf00      	nop
     93c:	40037104 	.word	0x40037104
     940:	1fff939c 	.word	0x1fff939c
     944:	1fff92bc 	.word	0x1fff92bc
     948:	1fff92b8 	.word	0x1fff92b8
     94c:	1fff92ac 	.word	0x1fff92ac
     950:	000f4217 	.word	0x000f4217
     954:	1fff9398 	.word	0x1fff9398
     958:	1fff92c0 	.word	0x1fff92c0
     95c:	1fff93b4 	.word	0x1fff93b4
     960:	1fff92b4 	.word	0x1fff92b4
     964:	88888889 	.word	0x88888889
     968:	10624dd3 	.word	0x10624dd3
     96c:	1fff88f0 	.word	0x1fff88f0
     970:	00003d64 	.word	0x00003d64
     974:	00003d68 	.word	0x00003d68

00000978 <main>:

int main() {
     978:	b508      	push	{r3, lr}
    MainSetup();
     97a:	f7ff fef3 	bl	764 <MainSetup()>
    delay(200);
     97e:	20c8      	movs	r0, #200	; 0xc8
     980:	f000 fac2 	bl	f08 <delay>
    while (true) {
        MainLoop();
     984:	f7ff ff0a 	bl	79c <MainLoop()>
        yield(); // Critical for interrupts. For some reason. TODO Investigate.
     988:	f001 fa82 	bl	1e90 <yield>
     98c:	e7fa      	b.n	984 <main+0xc>
     98e:	bf00      	nop

00000990 <_GLOBAL__sub_I_SENSOR_1_PINS>:
    }
    return 0;
     990:	b538      	push	{r3, r4, r5, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     992:	4b0e      	ldr	r3, [pc, #56]	; (9cc <_GLOBAL__sub_I_SENSOR_1_PINS+0x3c>)
     994:	4c0e      	ldr	r4, [pc, #56]	; (9d0 <_GLOBAL__sub_I_SENSOR_1_PINS+0x40>)
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     996:	4d0f      	ldr	r5, [pc, #60]	; (9d4 <_GLOBAL__sub_I_SENSOR_1_PINS+0x44>)
SensorNode Nodes[] = {SENSOR_1_PINS};
     998:	480f      	ldr	r0, [pc, #60]	; (9d8 <_GLOBAL__sub_I_SENSOR_1_PINS+0x48>)
     99a:	cb0e      	ldmia	r3, {r1, r2, r3}
     99c:	f7ff fd74 	bl	488 <SensorNode::SensorNode(SensorPinData_t)>
     9a0:	4622      	mov	r2, r4
     9a2:	490e      	ldr	r1, [pc, #56]	; (9dc <_GLOBAL__sub_I_SENSOR_1_PINS+0x4c>)
     9a4:	2000      	movs	r0, #0
     9a6:	f001 fe19 	bl	25dc <__aeabi_atexit>
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     9aa:	4628      	mov	r0, r5
     9ac:	2100      	movs	r1, #0
     9ae:	f7ff fd5d 	bl	46c <BaseOOTX::BaseOOTX(int)>
     9b2:	f105 004c 	add.w	r0, r5, #76	; 0x4c
     9b6:	2101      	movs	r1, #1
     9b8:	f7ff fd58 	bl	46c <BaseOOTX::BaseOOTX(int)>
     9bc:	4622      	mov	r2, r4
     9be:	4908      	ldr	r1, [pc, #32]	; (9e0 <_GLOBAL__sub_I_SENSOR_1_PINS+0x50>)
     9c0:	2000      	movs	r0, #0
     9c2:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     9c6:	f001 be09 	b.w	25dc <__aeabi_atexit>
     9ca:	bf00      	nop
     9cc:	1fff8800 	.word	0x1fff8800
     9d0:	1fff87fc 	.word	0x1fff87fc
     9d4:	1fff9208 	.word	0x1fff9208
     9d8:	1fff92c0 	.word	0x1fff92c0
     9dc:	00000675 	.word	0x00000675
     9e0:	00000659 	.word	0x00000659

000009e4 <Print::println()>:
	return printNumber(n, 10, sign);
}


size_t Print::println(void)
{
     9e4:	b500      	push	{lr}
	uint8_t buf[2]={'\r', '\n'};
     9e6:	4a06      	ldr	r2, [pc, #24]	; (a00 <Print::println()+0x1c>)
	return write(buf, 2);
     9e8:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     9ea:	8812      	ldrh	r2, [r2, #0]
	return write(buf, 2);
     9ec:	685b      	ldr	r3, [r3, #4]
{
     9ee:	b083      	sub	sp, #12
	return write(buf, 2);
     9f0:	a901      	add	r1, sp, #4
	uint8_t buf[2]={'\r', '\n'};
     9f2:	f8ad 2004 	strh.w	r2, [sp, #4]
	return write(buf, 2);
     9f6:	2202      	movs	r2, #2
     9f8:	4798      	blx	r3
}
     9fa:	b003      	add	sp, #12
     9fc:	f85d fb04 	ldr.w	pc, [sp], #4
     a00:	00003d6c 	.word	0x00003d6c

00000a04 <Print::printNumber(unsigned long, unsigned char, unsigned char)>:
}

#else

size_t Print::printNumber(unsigned long n, uint8_t base, uint8_t sign)
{
     a04:	b5f0      	push	{r4, r5, r6, r7, lr}
     a06:	4607      	mov	r7, r0
     a08:	b08b      	sub	sp, #44	; 0x2c
	uint8_t digit, i;

	// TODO: make these checks as inline, since base is
	// almost always a constant.  base = 0 (BYTE) should
	// inline as a call directly to write()
	if (base == 0) {
     a0a:	2a00      	cmp	r2, #0
     a0c:	d033      	beq.n	a76 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x72>
		return write((uint8_t)n);
	} else if (base == 1) {
		base = 10;
     a0e:	2a01      	cmp	r2, #1
     a10:	bf08      	it	eq
     a12:	220a      	moveq	r2, #10
	}


	if (n == 0) {
     a14:	b351      	cbz	r1, a6c <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x68>
     a16:	2421      	movs	r4, #33	; 0x21
     a18:	e000      	b.n	a1c <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x18>
		while (1) {
			digit = n % base;
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
			n /= base;
			if (n == 0) break;
			i--;
     a1a:	b2f4      	uxtb	r4, r6
			digit = n % base;
     a1c:	fbb1 f5f2 	udiv	r5, r1, r2
     a20:	fb02 1115 	mls	r1, r2, r5, r1
     a24:	b2c8      	uxtb	r0, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a26:	2909      	cmp	r1, #9
     a28:	f100 0130 	add.w	r1, r0, #48	; 0x30
     a2c:	bf98      	it	ls
     a2e:	b2c8      	uxtbls	r0, r1
     a30:	a90a      	add	r1, sp, #40	; 0x28
     a32:	bf88      	it	hi
     a34:	3037      	addhi	r0, #55	; 0x37
     a36:	4421      	add	r1, r4
     a38:	bf88      	it	hi
     a3a:	b2c0      	uxtbhi	r0, r0
     a3c:	f801 0c24 	strb.w	r0, [r1, #-36]
			i--;
     a40:	1e66      	subs	r6, r4, #1
			if (n == 0) break;
     a42:	4629      	mov	r1, r5
     a44:	2d00      	cmp	r5, #0
     a46:	d1e8      	bne.n	a1a <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x16>
		}
	}
	if (sign) {
     a48:	b133      	cbz	r3, a58 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x54>
		i--;
     a4a:	3c01      	subs	r4, #1
     a4c:	b2e4      	uxtb	r4, r4
		buf[i] = '-';
     a4e:	ab0a      	add	r3, sp, #40	; 0x28
     a50:	4423      	add	r3, r4
     a52:	222d      	movs	r2, #45	; 0x2d
     a54:	f803 2c24 	strb.w	r2, [r3, #-36]
	}
	return write(buf + i, sizeof(buf) - i);
     a58:	683b      	ldr	r3, [r7, #0]
     a5a:	aa01      	add	r2, sp, #4
     a5c:	1911      	adds	r1, r2, r4
     a5e:	685b      	ldr	r3, [r3, #4]
     a60:	4638      	mov	r0, r7
     a62:	f1c4 0222 	rsb	r2, r4, #34	; 0x22
     a66:	4798      	blx	r3
}
     a68:	b00b      	add	sp, #44	; 0x2c
     a6a:	bdf0      	pop	{r4, r5, r6, r7, pc}
		buf[sizeof(buf) - 1] = '0';
     a6c:	2230      	movs	r2, #48	; 0x30
     a6e:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
		i = sizeof(buf) - 1;
     a72:	2421      	movs	r4, #33	; 0x21
     a74:	e7e8      	b.n	a48 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x44>
		return write((uint8_t)n);
     a76:	6803      	ldr	r3, [r0, #0]
     a78:	b2c9      	uxtb	r1, r1
     a7a:	681b      	ldr	r3, [r3, #0]
     a7c:	4798      	blx	r3
}
     a7e:	b00b      	add	sp, #44	; 0x2c
     a80:	bdf0      	pop	{r4, r5, r6, r7, pc}
     a82:	bf00      	nop

00000a84 <Print::print(long)>:
	if (n < 0) {
     a84:	2900      	cmp	r1, #0
		n = -n;
     a86:	bfba      	itte	lt
     a88:	4249      	neglt	r1, r1
		sign = '-';
     a8a:	232d      	movlt	r3, #45	; 0x2d
	uint8_t sign=0;
     a8c:	2300      	movge	r3, #0
	return printNumber(n, 10, sign);
     a8e:	220a      	movs	r2, #10
     a90:	f7ff bfb8 	b.w	a04 <Print::printNumber(unsigned long, unsigned char, unsigned char)>
     a94:	ffff ffff 			; <UNDEFINED> instruction: 0xffffffff

00000a98 <Print::printFloat(double, unsigned char)>:

#endif

size_t Print::printFloat(double number, uint8_t digits) 
{
     a98:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
     a9c:	b085      	sub	sp, #20
     a9e:	4680      	mov	r8, r0
	uint8_t sign=0;
	size_t count=0;

	if (isnan(number)) return print("nan");
     aa0:	4619      	mov	r1, r3
     aa2:	4610      	mov	r0, r2
{
     aa4:	4616      	mov	r6, r2
     aa6:	461f      	mov	r7, r3
     aa8:	f89d 5030 	ldrb.w	r5, [sp, #48]	; 0x30
	if (isnan(number)) return print("nan");
     aac:	f002 f9ee 	bl	2e8c <__aeabi_dcmpun>
     ab0:	2800      	cmp	r0, #0
     ab2:	f040 80b1 	bne.w	c18 <Print::printFloat(double, unsigned char)+0x180>
    	if (isinf(number)) return print("inf");
     ab6:	f027 4400 	bic.w	r4, r7, #2147483648	; 0x80000000
     aba:	4630      	mov	r0, r6
     abc:	4621      	mov	r1, r4
     abe:	f04f 32ff 	mov.w	r2, #4294967295
     ac2:	4b59      	ldr	r3, [pc, #356]	; (c28 <Print::printFloat(double, unsigned char)+0x190>)
     ac4:	f002 f9e2 	bl	2e8c <__aeabi_dcmpun>
     ac8:	b998      	cbnz	r0, af2 <Print::printFloat(double, unsigned char)+0x5a>
     aca:	4630      	mov	r0, r6
     acc:	4621      	mov	r1, r4
     ace:	f04f 32ff 	mov.w	r2, #4294967295
     ad2:	4b55      	ldr	r3, [pc, #340]	; (c28 <Print::printFloat(double, unsigned char)+0x190>)
     ad4:	f002 f9bc 	bl	2e50 <__aeabi_dcmple>
     ad8:	b958      	cbnz	r0, af2 <Print::printFloat(double, unsigned char)+0x5a>
	size_t write(const char *str)			{ return write((const uint8_t *)str, strlen(str)); }
     ada:	f8d8 3000 	ldr.w	r3, [r8]
     ade:	4953      	ldr	r1, [pc, #332]	; (c2c <Print::printFloat(double, unsigned char)+0x194>)
     ae0:	685b      	ldr	r3, [r3, #4]
     ae2:	4640      	mov	r0, r8
     ae4:	2203      	movs	r2, #3
     ae6:	4798      	blx	r3
     ae8:	4681      	mov	r9, r0
			remainder -= n; 
		}
		count += write(buf, count);
	}
	return count;
}
     aea:	4648      	mov	r0, r9
     aec:	b005      	add	sp, #20
     aee:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    	if (number > 4294967040.0f) return print("ovf");  // constant determined empirically
     af2:	4630      	mov	r0, r6
     af4:	4639      	mov	r1, r7
     af6:	f04f 4260 	mov.w	r2, #3758096384	; 0xe0000000
     afa:	4b4d      	ldr	r3, [pc, #308]	; (c30 <Print::printFloat(double, unsigned char)+0x198>)
     afc:	f002 f9bc 	bl	2e78 <__aeabi_dcmpgt>
     b00:	2800      	cmp	r0, #0
     b02:	d170      	bne.n	be6 <Print::printFloat(double, unsigned char)+0x14e>
    	if (number <-4294967040.0f) return print("ovf");  // constant determined empirically
     b04:	4630      	mov	r0, r6
     b06:	4639      	mov	r1, r7
     b08:	f04f 4260 	mov.w	r2, #3758096384	; 0xe0000000
     b0c:	4b49      	ldr	r3, [pc, #292]	; (c34 <Print::printFloat(double, unsigned char)+0x19c>)
     b0e:	f002 f995 	bl	2e3c <__aeabi_dcmplt>
     b12:	2800      	cmp	r0, #0
     b14:	d167      	bne.n	be6 <Print::printFloat(double, unsigned char)+0x14e>
	if (number < 0.0) {
     b16:	4630      	mov	r0, r6
     b18:	4639      	mov	r1, r7
     b1a:	2200      	movs	r2, #0
     b1c:	2300      	movs	r3, #0
     b1e:	f002 f98d 	bl	2e3c <__aeabi_dcmplt>
     b22:	2800      	cmp	r0, #0
     b24:	d163      	bne.n	bee <Print::printFloat(double, unsigned char)+0x156>
	uint8_t sign=0;
     b26:	4681      	mov	r9, r0
	for (uint8_t i=0; i<digits; ++i) {
     b28:	2d00      	cmp	r5, #0
     b2a:	d065      	beq.n	bf8 <Print::printFloat(double, unsigned char)+0x160>
     b2c:	4b42      	ldr	r3, [pc, #264]	; (c38 <Print::printFloat(double, unsigned char)+0x1a0>)
     b2e:	2400      	movs	r4, #0
     b30:	2200      	movs	r2, #0
		rounding *= 0.1;
     b32:	4610      	mov	r0, r2
     b34:	4619      	mov	r1, r3
     b36:	a33a      	add	r3, pc, #232	; (adr r3, c20 <Print::printFloat(double, unsigned char)+0x188>)
     b38:	e9d3 2300 	ldrd	r2, r3, [r3]
     b3c:	f001 ff0c 	bl	2958 <__aeabi_dmul>
     b40:	3401      	adds	r4, #1
     b42:	460b      	mov	r3, r1
	for (uint8_t i=0; i<digits; ++i) {
     b44:	b2e1      	uxtb	r1, r4
     b46:	428d      	cmp	r5, r1
		rounding *= 0.1;
     b48:	4602      	mov	r2, r0
	for (uint8_t i=0; i<digits; ++i) {
     b4a:	d8f2      	bhi.n	b32 <Print::printFloat(double, unsigned char)+0x9a>
	number += rounding;
     b4c:	4630      	mov	r0, r6
     b4e:	4639      	mov	r1, r7
     b50:	f001 fd50 	bl	25f4 <__adddf3>
     b54:	460f      	mov	r7, r1
     b56:	4606      	mov	r6, r0
	unsigned long int_part = (unsigned long)number;
     b58:	f002 f9ae 	bl	2eb8 <__aeabi_d2uiz>
     b5c:	4604      	mov	r4, r0
	double remainder = number - (double)int_part;
     b5e:	f001 fe85 	bl	286c <__aeabi_ui2d>
     b62:	4602      	mov	r2, r0
     b64:	460b      	mov	r3, r1
     b66:	4630      	mov	r0, r6
     b68:	4639      	mov	r1, r7
     b6a:	f001 fd41 	bl	25f0 <__aeabi_dsub>
	count += printNumber(int_part, 10, sign);
     b6e:	464b      	mov	r3, r9
	double remainder = number - (double)int_part;
     b70:	4606      	mov	r6, r0
     b72:	460f      	mov	r7, r1
	count += printNumber(int_part, 10, sign);
     b74:	220a      	movs	r2, #10
     b76:	4621      	mov	r1, r4
     b78:	4640      	mov	r0, r8
     b7a:	f7ff ff43 	bl	a04 <Print::printNumber(unsigned long, unsigned char, unsigned char)>
     b7e:	2d0f      	cmp	r5, #15
     b80:	bf28      	it	cs
     b82:	250f      	movcs	r5, #15
     b84:	3501      	adds	r5, #1
		buf[0] = '.';
     b86:	232e      	movs	r3, #46	; 0x2e
	count += printNumber(int_part, 10, sign);
     b88:	4681      	mov	r9, r0
     b8a:	b2ed      	uxtb	r5, r5
		buf[0] = '.';
     b8c:	f88d 3000 	strb.w	r3, [sp]
     b90:	2401      	movs	r4, #1
			remainder *= 10.0;
     b92:	2200      	movs	r2, #0
     b94:	4b29      	ldr	r3, [pc, #164]	; (c3c <Print::printFloat(double, unsigned char)+0x1a4>)
     b96:	4630      	mov	r0, r6
     b98:	4639      	mov	r1, r7
     b9a:	f001 fedd 	bl	2958 <__aeabi_dmul>
     b9e:	460f      	mov	r7, r1
     ba0:	4606      	mov	r6, r0
			n = (uint8_t)(remainder);
     ba2:	f002 f989 	bl	2eb8 <__aeabi_d2uiz>
			buf[count++] = '0' + n;
     ba6:	ab04      	add	r3, sp, #16
     ba8:	4423      	add	r3, r4
			n = (uint8_t)(remainder);
     baa:	b2c0      	uxtb	r0, r0
			buf[count++] = '0' + n;
     bac:	f100 0230 	add.w	r2, r0, #48	; 0x30
     bb0:	f803 2c10 	strb.w	r2, [r3, #-16]
			remainder -= n; 
     bb4:	f001 fe6a 	bl	288c <__aeabi_i2d>
     bb8:	4602      	mov	r2, r0
     bba:	460b      	mov	r3, r1
     bbc:	4630      	mov	r0, r6
     bbe:	4639      	mov	r1, r7
     bc0:	f001 fd16 	bl	25f0 <__aeabi_dsub>
			buf[count++] = '0' + n;
     bc4:	3401      	adds	r4, #1
     bc6:	b2e4      	uxtb	r4, r4
		while (digits-- > 0) {
     bc8:	42ac      	cmp	r4, r5
			remainder -= n; 
     bca:	4606      	mov	r6, r0
     bcc:	460f      	mov	r7, r1
		while (digits-- > 0) {
     bce:	d1e0      	bne.n	b92 <Print::printFloat(double, unsigned char)+0xfa>
		count += write(buf, count);
     bd0:	f8d8 3000 	ldr.w	r3, [r8]
     bd4:	4622      	mov	r2, r4
     bd6:	685b      	ldr	r3, [r3, #4]
     bd8:	4640      	mov	r0, r8
     bda:	4669      	mov	r1, sp
     bdc:	4798      	blx	r3
}
     bde:	4648      	mov	r0, r9
     be0:	b005      	add	sp, #20
     be2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
     be6:	f8d8 3000 	ldr.w	r3, [r8]
     bea:	4915      	ldr	r1, [pc, #84]	; (c40 <Print::printFloat(double, unsigned char)+0x1a8>)
     bec:	e778      	b.n	ae0 <Print::printFloat(double, unsigned char)+0x48>
		number = -number;
     bee:	f107 4700 	add.w	r7, r7, #2147483648	; 0x80000000
		sign = 1;
     bf2:	f04f 0901 	mov.w	r9, #1
     bf6:	e797      	b.n	b28 <Print::printFloat(double, unsigned char)+0x90>
	count += printNumber(int_part, 10, sign);
     bf8:	2200      	movs	r2, #0
     bfa:	4b0f      	ldr	r3, [pc, #60]	; (c38 <Print::printFloat(double, unsigned char)+0x1a0>)
     bfc:	4630      	mov	r0, r6
     bfe:	4639      	mov	r1, r7
     c00:	f001 fcf8 	bl	25f4 <__adddf3>
     c04:	f002 f958 	bl	2eb8 <__aeabi_d2uiz>
     c08:	464b      	mov	r3, r9
     c0a:	4601      	mov	r1, r0
     c0c:	220a      	movs	r2, #10
     c0e:	4640      	mov	r0, r8
     c10:	f7ff fef8 	bl	a04 <Print::printNumber(unsigned long, unsigned char, unsigned char)>
     c14:	4681      	mov	r9, r0
     c16:	e768      	b.n	aea <Print::printFloat(double, unsigned char)+0x52>
     c18:	f8d8 3000 	ldr.w	r3, [r8]
     c1c:	4909      	ldr	r1, [pc, #36]	; (c44 <Print::printFloat(double, unsigned char)+0x1ac>)
     c1e:	e75f      	b.n	ae0 <Print::printFloat(double, unsigned char)+0x48>
     c20:	a0000000 	.word	0xa0000000
     c24:	3fb99999 	.word	0x3fb99999
     c28:	7fefffff 	.word	0x7fefffff
     c2c:	00003d78 	.word	0x00003d78
     c30:	41efffff 	.word	0x41efffff
     c34:	c1efffff 	.word	0xc1efffff
     c38:	3fe00000 	.word	0x3fe00000
     c3c:	40240000 	.word	0x40240000
     c40:	00003d74 	.word	0x00003d74
     c44:	00003d70 	.word	0x00003d70

00000c48 <memset>:
     c48:	b501      	push	{r0, lr}
     c4a:	b1ea      	cbz	r2, c88 <memset+0x40>
     c4c:	2a10      	cmp	r2, #16
     c4e:	db17      	blt.n	c80 <memset+0x38>
     c50:	f000 0307 	and.w	r3, r0, #7
     c54:	b133      	cbz	r3, c64 <memset+0x1c>
     c56:	f1c3 0308 	rsb	r3, r3, #8
     c5a:	1ad2      	subs	r2, r2, r3
     c5c:	3b01      	subs	r3, #1
     c5e:	f800 1b01 	strb.w	r1, [r0], #1
     c62:	dcfb      	bgt.n	c5c <memset+0x14>
     c64:	b2c9      	uxtb	r1, r1
     c66:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
     c6a:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
     c6e:	468c      	mov	ip, r1
     c70:	08d3      	lsrs	r3, r2, #3
     c72:	3b01      	subs	r3, #1
     c74:	e8e0 1c02 	strd	r1, ip, [r0], #8
     c78:	dcfb      	bgt.n	c72 <memset+0x2a>
     c7a:	f012 0207 	ands.w	r2, r2, #7
     c7e:	d003      	beq.n	c88 <memset+0x40>
     c80:	3a01      	subs	r2, #1
     c82:	f800 1b01 	strb.w	r1, [r0], #1
     c86:	dcfb      	bgt.n	c80 <memset+0x38>
     c88:	bd01      	pop	{r0, pc}
     c8a:	bf00      	nop

00000c8c <fault_isr>:
{
     c8c:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     c8e:	4c10      	ldr	r4, [pc, #64]	; (cd0 <fault_isr+0x44>)
     c90:	e008      	b.n	ca4 <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     c92:	6823      	ldr	r3, [r4, #0]
     c94:	0559      	lsls	r1, r3, #21
     c96:	d40d      	bmi.n	cb4 <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     c98:	6823      	ldr	r3, [r4, #0]
     c9a:	051a      	lsls	r2, r3, #20
     c9c:	d40f      	bmi.n	cbe <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     c9e:	6823      	ldr	r3, [r4, #0]
     ca0:	04db      	lsls	r3, r3, #19
     ca2:	d411      	bmi.n	cc8 <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     ca4:	6823      	ldr	r3, [r4, #0]
     ca6:	0358      	lsls	r0, r3, #13
     ca8:	d5f3      	bpl.n	c92 <fault_isr+0x6>
     caa:	f000 faa3 	bl	11f4 <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     cae:	6823      	ldr	r3, [r4, #0]
     cb0:	0559      	lsls	r1, r3, #21
     cb2:	d5f1      	bpl.n	c98 <fault_isr+0xc>
     cb4:	f001 fab8 	bl	2228 <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     cb8:	6823      	ldr	r3, [r4, #0]
     cba:	051a      	lsls	r2, r3, #20
     cbc:	d5ef      	bpl.n	c9e <fault_isr+0x12>
     cbe:	f001 fb49 	bl	2354 <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     cc2:	6823      	ldr	r3, [r4, #0]
     cc4:	04db      	lsls	r3, r3, #19
     cc6:	d5ed      	bpl.n	ca4 <fault_isr+0x18>
     cc8:	f001 fbda 	bl	2480 <uart2_status_isr>
     ccc:	e7ea      	b.n	ca4 <fault_isr+0x18>
     cce:	bf00      	nop
     cd0:	40048034 	.word	0x40048034

00000cd4 <unused_isr>:
{
     cd4:	b508      	push	{r3, lr}
	fault_isr();
     cd6:	f7ff ffd9 	bl	c8c <fault_isr>
     cda:	bf00      	nop

00000cdc <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
     cdc:	4b01      	ldr	r3, [pc, #4]	; (ce4 <startup_early_hook+0x8>)
     cde:	2210      	movs	r2, #16
     ce0:	801a      	strh	r2, [r3, #0]
     ce2:	4770      	bx	lr
     ce4:	40052000 	.word	0x40052000

00000ce8 <startup_late_hook>:
static void startup_default_late_hook(void) {}
     ce8:	4770      	bx	lr
     cea:	bf00      	nop

00000cec <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
     cec:	4909      	ldr	r1, [pc, #36]	; (d14 <_sbrk+0x28>)
{
     cee:	b508      	push	{r3, lr}
	prev = __brkval;
     cf0:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
     cf2:	b130      	cbz	r0, d02 <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
     cf4:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
     cf6:	4418      	add	r0, r3
     cf8:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
     cfc:	4290      	cmp	r0, r2
     cfe:	d202      	bcs.n	d06 <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
     d00:	6008      	str	r0, [r1, #0]
	}
	return prev;
     d02:	4618      	mov	r0, r3
}
     d04:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
     d06:	f002 fb5b 	bl	33c0 <__errno>
     d0a:	230c      	movs	r3, #12
     d0c:	6003      	str	r3, [r0, #0]
			return (void *)-1;
     d0e:	f04f 30ff 	mov.w	r0, #4294967295
     d12:	bd08      	pop	{r3, pc}
     d14:	1fff880c 	.word	0x1fff880c

00000d18 <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
     d18:	b4f0      	push	{r4, r5, r6, r7}
     d1a:	1e4d      	subs	r5, r1, #1
     d1c:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
     d1e:	2400      	movs	r4, #0
     d20:	e000      	b.n	d24 <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
     d22:	3401      	adds	r4, #1
		digit = val % radix;
     d24:	fbb0 f3f2 	udiv	r3, r0, r2
     d28:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     d2c:	2809      	cmp	r0, #9
     d2e:	f100 0730 	add.w	r7, r0, #48	; 0x30
     d32:	bf8a      	itet	hi
     d34:	3037      	addhi	r0, #55	; 0x37
     d36:	b2f8      	uxtbls	r0, r7
     d38:	b2c0      	uxtbhi	r0, r0
     d3a:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
     d3e:	4618      	mov	r0, r3
     d40:	2b00      	cmp	r3, #0
     d42:	d1ee      	bne.n	d22 <ultoa+0xa>
	}
	buf[i + 1] = 0;
     d44:	190a      	adds	r2, r1, r4
     d46:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
     d48:	b14c      	cbz	r4, d5e <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
     d4a:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
     d4c:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
     d50:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
     d52:	3301      	adds	r3, #1
     d54:	1ae0      	subs	r0, r4, r3
     d56:	4283      	cmp	r3, r0
		buf[i] = t;
     d58:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
     d5c:	dbf5      	blt.n	d4a <ultoa+0x32>
	}
	return buf;
}
     d5e:	4608      	mov	r0, r1
     d60:	bcf0      	pop	{r4, r5, r6, r7}
     d62:	4770      	bx	lr

00000d64 <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
     d64:	4770      	bx	lr
     d66:	bf00      	nop

00000d68 <pinMode.part.1>:
void pinMode(uint8_t pin, uint8_t mode)
{
	volatile uint32_t *config;

	if (pin >= CORE_NUM_DIGITAL) return;
	config = portConfigRegister(pin);
     d68:	4a1c      	ldr	r2, [pc, #112]	; (ddc <pinMode.part.1+0x74>)
     d6a:	eb02 03c0 	add.w	r3, r2, r0, lsl #3

	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     d6e:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
     d70:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     d72:	d011      	beq.n	d98 <pinMode.part.1+0x30>
     d74:	2904      	cmp	r1, #4
     d76:	d01b      	beq.n	db0 <pinMode.part.1+0x48>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
     d78:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
     d7c:	2200      	movs	r2, #0
     d7e:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
     d82:	b129      	cbz	r1, d90 <pinMode.part.1+0x28>
			*config = PORT_PCR_MUX(1);
		} else if (mode == INPUT_PULLUP) {
     d84:	2902      	cmp	r1, #2
     d86:	d020      	beq.n	dca <pinMode.part.1+0x62>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
		} else if (mode == INPUT_PULLDOWN) {
     d88:	2903      	cmp	r1, #3
     d8a:	d022      	beq.n	dd2 <pinMode.part.1+0x6a>
		    *config &= ~PORT_PCR_ODE;
     d8c:	601a      	str	r2, [r3, #0]
     d8e:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
     d90:	f44f 7280 	mov.w	r2, #256	; 0x100
     d94:	601a      	str	r2, [r3, #0]
     d96:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     d98:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d9c:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     da0:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     da4:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
     da6:	681a      	ldr	r2, [r3, #0]
     da8:	f022 0220 	bic.w	r2, r2, #32
     dac:	601a      	str	r2, [r3, #0]
     dae:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     db0:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     db4:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     db8:	2001      	movs	r0, #1
     dba:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     dbe:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
     dc0:	681a      	ldr	r2, [r3, #0]
     dc2:	f042 0220 	orr.w	r2, r2, #32
     dc6:	601a      	str	r2, [r3, #0]
     dc8:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
     dca:	f240 1203 	movw	r2, #259	; 0x103
     dce:	601a      	str	r2, [r3, #0]
     dd0:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
     dd2:	f44f 7281 	mov.w	r2, #258	; 0x102
     dd6:	601a      	str	r2, [r3, #0]
     dd8:	4770      	bx	lr
     dda:	bf00      	nop
     ddc:	00003d7c 	.word	0x00003d7c

00000de0 <attachInterrupt>:
	if (pin >= CORE_NUM_DIGITAL) return;
     de0:	2821      	cmp	r0, #33	; 0x21
     de2:	d817      	bhi.n	e14 <attachInterrupt+0x34>
{
     de4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	switch (mode) {
     de6:	2a04      	cmp	r2, #4
     de8:	d813      	bhi.n	e12 <attachInterrupt+0x32>
     dea:	e8df f002 	tbb	[pc, r2]
     dee:	4c49      	.short	0x4c49
     df0:	144f      	.short	0x144f
     df2:	46          	.byte	0x46
     df3:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     df4:	482c      	ldr	r0, [pc, #176]	; (ea8 <attachInterrupt+0xc8>)
	__disable_irq();
     df6:	b672      	cpsid	i
	cfg = *config;
     df8:	6823      	ldr	r3, [r4, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
     dfa:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
     dfe:	f043 7280 	orr.w	r2, r3, #16777216	; 0x1000000
	isr_table[pin_index] = function;	// set the function pointer
     e02:	f3c4 0184 	ubfx	r1, r4, #2, #5
	cfg |= mask;
     e06:	4316      	orrs	r6, r2
	*config = cfg;
     e08:	6023      	str	r3, [r4, #0]
	isr_table[pin_index] = function;	// set the function pointer
     e0a:	f840 5021 	str.w	r5, [r0, r1, lsl #2]
	*config = cfg;			// enable the new interrupt
     e0e:	6026      	str	r6, [r4, #0]
	__enable_irq();
     e10:	b662      	cpsie	i
     e12:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     e14:	4770      	bx	lr
	switch (mode) {
     e16:	f44f 2610 	mov.w	r6, #589824	; 0x90000
	config = portConfigRegister(pin);
     e1a:	4b24      	ldr	r3, [pc, #144]	; (eac <attachInterrupt+0xcc>)
     e1c:	eb03 03c0 	add.w	r3, r3, r0, lsl #3
     e20:	460d      	mov	r5, r1
     e22:	685c      	ldr	r4, [r3, #4]
	if ((*config & 0x00000700) == 0) {
     e24:	6821      	ldr	r1, [r4, #0]
     e26:	f411 61e0 	ands.w	r1, r1, #1792	; 0x700
     e2a:	d034      	beq.n	e96 <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
     e2c:	4b20      	ldr	r3, [pc, #128]	; (eb0 <attachInterrupt+0xd0>)
     e2e:	4a21      	ldr	r2, [pc, #132]	; (eb4 <attachInterrupt+0xd4>)
     e30:	4921      	ldr	r1, [pc, #132]	; (eb8 <attachInterrupt+0xd8>)
     e32:	f8c3 219c 	str.w	r2, [r3, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     e36:	f104 4240 	add.w	r2, r4, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
     e3a:	4820      	ldr	r0, [pc, #128]	; (ebc <attachInterrupt+0xdc>)
     e3c:	f8c3 11a4 	str.w	r1, [r3, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     e40:	f5a2 2192 	sub.w	r1, r2, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
     e44:	4f1e      	ldr	r7, [pc, #120]	; (ec0 <attachInterrupt+0xe0>)
     e46:	f8c3 01a0 	str.w	r0, [r3, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     e4a:	297c      	cmp	r1, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
     e4c:	481d      	ldr	r0, [pc, #116]	; (ec4 <attachInterrupt+0xe4>)
     e4e:	f8c3 71a8 	str.w	r7, [r3, #424]	; 0x1a8
     e52:	f8c3 01ac 	str.w	r0, [r3, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     e56:	d9cd      	bls.n	df4 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     e58:	f5a2 2394 	sub.w	r3, r2, #303104	; 0x4a000
     e5c:	2b7c      	cmp	r3, #124	; 0x7c
     e5e:	d918      	bls.n	e92 <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     e60:	f5a2 2396 	sub.w	r3, r2, #307200	; 0x4b000
     e64:	2b7c      	cmp	r3, #124	; 0x7c
     e66:	d919      	bls.n	e9c <attachInterrupt+0xbc>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     e68:	f5a2 2398 	sub.w	r3, r2, #311296	; 0x4c000
     e6c:	2b7c      	cmp	r3, #124	; 0x7c
     e6e:	d917      	bls.n	ea0 <attachInterrupt+0xc0>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     e70:	f5a2 229a 	sub.w	r2, r2, #315392	; 0x4d000
     e74:	2a7c      	cmp	r2, #124	; 0x7c
     e76:	d915      	bls.n	ea4 <attachInterrupt+0xc4>
     e78:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	switch (mode) {
     e7a:	f44f 2630 	mov.w	r6, #720896	; 0xb0000
     e7e:	e7cc      	b.n	e1a <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
     e80:	f44f 2600 	mov.w	r6, #524288	; 0x80000
     e84:	e7c9      	b.n	e1a <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
     e86:	f44f 2640 	mov.w	r6, #786432	; 0xc0000
     e8a:	e7c6      	b.n	e1a <attachInterrupt+0x3a>
	switch (mode) {
     e8c:	f44f 2620 	mov.w	r6, #655360	; 0xa0000
     e90:	e7c3      	b.n	e1a <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     e92:	480d      	ldr	r0, [pc, #52]	; (ec8 <attachInterrupt+0xe8>)
     e94:	e7af      	b.n	df6 <attachInterrupt+0x16>
     e96:	f7ff ff67 	bl	d68 <pinMode.part.1>
     e9a:	e7c7      	b.n	e2c <attachInterrupt+0x4c>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     e9c:	480b      	ldr	r0, [pc, #44]	; (ecc <attachInterrupt+0xec>)
     e9e:	e7aa      	b.n	df6 <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     ea0:	480b      	ldr	r0, [pc, #44]	; (ed0 <attachInterrupt+0xf0>)
     ea2:	e7a8      	b.n	df6 <attachInterrupt+0x16>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     ea4:	480b      	ldr	r0, [pc, #44]	; (ed4 <attachInterrupt+0xf4>)
     ea6:	e7a6      	b.n	df6 <attachInterrupt+0x16>
     ea8:	1fff8810 	.word	0x1fff8810
     eac:	00003d7c 	.word	0x00003d7c
     eb0:	1fff8200 	.word	0x1fff8200
     eb4:	1fff87d1 	.word	0x1fff87d1
     eb8:	1fff8779 	.word	0x1fff8779
     ebc:	1fff87a5 	.word	0x1fff87a5
     ec0:	1fff874d 	.word	0x1fff874d
     ec4:	1fff8721 	.word	0x1fff8721
     ec8:	1fff8848 	.word	0x1fff8848
     ecc:	1fff8898 	.word	0x1fff8898
     ed0:	1fff88c8 	.word	0x1fff88c8
     ed4:	1fff88e8 	.word	0x1fff88e8

00000ed8 <rtc_set>:
{
     ed8:	b430      	push	{r4, r5}
	RTC_SR = 0;
     eda:	4b05      	ldr	r3, [pc, #20]	; (ef0 <rtc_set+0x18>)
	RTC_TPR = 0;
     edc:	4d05      	ldr	r5, [pc, #20]	; (ef4 <rtc_set+0x1c>)
	RTC_TSR = t;
     ede:	4c06      	ldr	r4, [pc, #24]	; (ef8 <rtc_set+0x20>)
	RTC_SR = 0;
     ee0:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
     ee2:	2110      	movs	r1, #16
	RTC_SR = 0;
     ee4:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
     ee6:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
     ee8:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
     eea:	6019      	str	r1, [r3, #0]
}
     eec:	bc30      	pop	{r4, r5}
     eee:	4770      	bx	lr
     ef0:	4003d014 	.word	0x4003d014
     ef4:	4003d004 	.word	0x4003d004
     ef8:	4003d000 	.word	0x4003d000

00000efc <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
     efc:	2821      	cmp	r0, #33	; 0x21
     efe:	d801      	bhi.n	f04 <pinMode+0x8>
     f00:	f7ff bf32 	b.w	d68 <pinMode.part.1>
     f04:	4770      	bx	lr
     f06:	bf00      	nop

00000f08 <delay>:
#endif
	return count * 1000 + current / (F_CPU / 1000000);
}

void delay(uint32_t ms)
{
     f08:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
     f0c:	4605      	mov	r5, r0
	__disable_irq();
     f0e:	b672      	cpsid	i
	count = systick_millis_count;
     f10:	4f20      	ldr	r7, [pc, #128]	; (f94 <delay+0x8c>)
	current = SYST_CVR;
     f12:	4b21      	ldr	r3, [pc, #132]	; (f98 <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f14:	4a21      	ldr	r2, [pc, #132]	; (f9c <delay+0x94>)
	current = SYST_CVR;
     f16:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     f18:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f1a:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     f1c:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     f1e:	0152      	lsls	r2, r2, #5
     f20:	d502      	bpl.n	f28 <delay+0x20>
     f22:	2b32      	cmp	r3, #50	; 0x32
     f24:	bf88      	it	hi
     f26:	3401      	addhi	r4, #1
	uint32_t start = micros();

	if (ms > 0) {
     f28:	b395      	cbz	r5, f90 <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
     f2a:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     f2e:	4e1c      	ldr	r6, [pc, #112]	; (fa0 <delay+0x98>)
	current = SYST_CVR;
     f30:	f8df 9064 	ldr.w	r9, [pc, #100]	; f98 <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f34:	f8df 8064 	ldr.w	r8, [pc, #100]	; f9c <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
     f38:	33bf      	adds	r3, #191	; 0xbf
     f3a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     f3e:	fba6 1303 	umull	r1, r3, r6, r3
     f42:	fb02 f404 	mul.w	r4, r2, r4
     f46:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
     f4a:	b672      	cpsid	i
	current = SYST_CVR;
     f4c:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     f50:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f52:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     f56:	b662      	cpsie	i
		while (1) {
			while ((micros() - start) >= 1000) {
     f58:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     f5c:	33bf      	adds	r3, #191	; 0xbf
     f5e:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     f62:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     f66:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     f6a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     f6e:	d002      	beq.n	f76 <delay+0x6e>
     f70:	2932      	cmp	r1, #50	; 0x32
     f72:	bf88      	it	hi
     f74:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     f76:	fb00 3302 	mla	r3, r0, r2, r3
     f7a:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     f7e:	d304      	bcc.n	f8a <delay+0x82>
				ms--;
				if (ms == 0) return;
     f80:	3d01      	subs	r5, #1
     f82:	d005      	beq.n	f90 <delay+0x88>
				start += 1000;
     f84:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     f88:	e7df      	b.n	f4a <delay+0x42>
			}
			yield();
     f8a:	f000 ff81 	bl	1e90 <yield>
		}
     f8e:	e7dc      	b.n	f4a <delay+0x42>
     f90:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     f94:	1fff93b4 	.word	0x1fff93b4
     f98:	e000e018 	.word	0xe000e018
     f9c:	e000ed04 	.word	0xe000ed04
     fa0:	88888889 	.word	0x88888889

00000fa4 <_init_Teensyduino_internal_>:
{
     fa4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     fa6:	4b2d      	ldr	r3, [pc, #180]	; (105c <_init_Teensyduino_internal_+0xb8>)
	FTM0_CNT = 0;
     fa8:	492d      	ldr	r1, [pc, #180]	; (1060 <_init_Teensyduino_internal_+0xbc>)
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     faa:	f8df e0d0 	ldr.w	lr, [pc, #208]	; 107c <_init_Teensyduino_internal_+0xd8>
	FTM0_MOD = DEFAULT_FTM_MOD;
     fae:	f8df c0d0 	ldr.w	ip, [pc, #208]	; 1080 <_init_Teensyduino_internal_+0xdc>
	FTM0_C1SC = 0x28;
     fb2:	4e2c      	ldr	r6, [pc, #176]	; (1064 <_init_Teensyduino_internal_+0xc0>)
	FTM0_C3SC = 0x28;
     fb4:	4d2c      	ldr	r5, [pc, #176]	; (1068 <_init_Teensyduino_internal_+0xc4>)
	FTM0_C4SC = 0x28;
     fb6:	4c2d      	ldr	r4, [pc, #180]	; (106c <_init_Teensyduino_internal_+0xc8>)
	FTM0_C2SC = 0x28;
     fb8:	4a2d      	ldr	r2, [pc, #180]	; (1070 <_init_Teensyduino_internal_+0xcc>)
	FTM0_C5SC = 0x28;
     fba:	4f2e      	ldr	r7, [pc, #184]	; (1074 <_init_Teensyduino_internal_+0xd0>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     fbc:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
     fc0:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
     fc2:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
     fc6:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
     fc8:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
     fcc:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
     fce:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
     fd2:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
     fd4:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
     fd8:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
     fda:	2000      	movs	r0, #0
     fdc:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     fde:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
     fe0:	f64e 71ff 	movw	r1, #61439	; 0xefff
     fe4:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     fe8:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
     fec:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
     fee:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
     ff0:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
     ff2:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
     ff4:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
     ff6:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
     ff8:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     ffa:	2209      	movs	r2, #9
     ffc:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
    1000:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
    1004:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
    1008:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
    100c:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
    1010:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
    1014:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
    1018:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
    101a:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    101e:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
    1022:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
    1026:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
    102a:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
    102c:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1030:	4811      	ldr	r0, [pc, #68]	; (1078 <_init_Teensyduino_internal_+0xd4>)
	FTM2_MOD = DEFAULT_FTM_MOD;
    1032:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
    1034:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
    1038:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
    103c:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
    103e:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
    1040:	6002      	str	r2, [r0, #0]
	analog_init();
    1042:	f001 f871 	bl	2128 <analog_init>
	delay(50);
    1046:	2032      	movs	r0, #50	; 0x32
    1048:	f7ff ff5e 	bl	f08 <delay>
	usb_init();
    104c:	f000 fcfe 	bl	1a4c <usb_init>
	delay(350);
    1050:	f44f 70af 	mov.w	r0, #350	; 0x15e
}
    1054:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
	delay(350);
    1058:	f7ff bf56 	b.w	f08 <delay>
    105c:	e000e108 	.word	0xe000e108
    1060:	40038004 	.word	0x40038004
    1064:	40038014 	.word	0x40038014
    1068:	40038024 	.word	0x40038024
    106c:	4003802c 	.word	0x4003802c
    1070:	4003801c 	.word	0x4003801c
    1074:	40038034 	.word	0x40038034
    1078:	400b8000 	.word	0x400b8000
    107c:	4003800c 	.word	0x4003800c
    1080:	40038008 	.word	0x40038008

00001084 <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
    1084:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    1086:	2b03      	cmp	r3, #3
    1088:	d814      	bhi.n	10b4 <usb_rx+0x30>
	__disable_irq();
    108a:	b672      	cpsid	i
	ret = rx_first[endpoint];
    108c:	490a      	ldr	r1, [pc, #40]	; (10b8 <usb_rx+0x34>)
    108e:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
    1092:	b168      	cbz	r0, 10b0 <usb_rx+0x2c>
{
    1094:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
    1096:	4c09      	ldr	r4, [pc, #36]	; (10bc <usb_rx+0x38>)
    1098:	8805      	ldrh	r5, [r0, #0]
    109a:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
    109e:	6846      	ldr	r6, [r0, #4]
    10a0:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
    10a4:	1b52      	subs	r2, r2, r5
    10a6:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
    10aa:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
    10ac:	bc70      	pop	{r4, r5, r6}
    10ae:	4770      	bx	lr
	__enable_irq();
    10b0:	b662      	cpsie	i
}
    10b2:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    10b4:	2000      	movs	r0, #0
    10b6:	4770      	bx	lr
    10b8:	1fff9410 	.word	0x1fff9410
    10bc:	1fff9694 	.word	0x1fff9694

000010c0 <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
    10c0:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
    10c2:	2803      	cmp	r0, #3
    10c4:	d80b      	bhi.n	10de <usb_tx_packet_count+0x1e>
	__disable_irq();
    10c6:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
    10c8:	4b07      	ldr	r3, [pc, #28]	; (10e8 <usb_tx_packet_count+0x28>)
    10ca:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
    10ce:	b143      	cbz	r3, 10e2 <usb_tx_packet_count+0x22>
    10d0:	2000      	movs	r0, #0
    10d2:	685b      	ldr	r3, [r3, #4]
    10d4:	3001      	adds	r0, #1
    10d6:	2b00      	cmp	r3, #0
    10d8:	d1fb      	bne.n	10d2 <usb_tx_packet_count+0x12>
	__enable_irq();
    10da:	b662      	cpsie	i
	return count;
    10dc:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
    10de:	2000      	movs	r0, #0
}
    10e0:	4770      	bx	lr
	uint32_t count=0;
    10e2:	4618      	mov	r0, r3
    10e4:	e7f9      	b.n	10da <usb_tx_packet_count+0x1a>
    10e6:	bf00      	nop
    10e8:	1fff9464 	.word	0x1fff9464

000010ec <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
    10ec:	b4f0      	push	{r4, r5, r6, r7}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
    10ee:	b672      	cpsid	i
	cfg = usb_endpoint_config_table;
    10f0:	491a      	ldr	r1, [pc, #104]	; (115c <usb_rx_memory+0x70>)
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
			if (table[index(i, RX, EVEN)].desc == 0) {
    10f2:	4e1b      	ldr	r6, [pc, #108]	; (1160 <usb_rx_memory+0x74>)
	for (i=1; i <= NUM_ENDPOINTS; i++) {
    10f4:	2301      	movs	r3, #1
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    10f6:	f811 4b01 	ldrb.w	r4, [r1], #1
			if (table[index(i, RX, EVEN)].desc == 0) {
    10fa:	4f19      	ldr	r7, [pc, #100]	; (1160 <usb_rx_memory+0x74>)
    10fc:	009a      	lsls	r2, r3, #2
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    10fe:	0724      	lsls	r4, r4, #28
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
    1100:	f042 0501 	orr.w	r5, r2, #1
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1104:	d505      	bpl.n	1112 <usb_rx_memory+0x26>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1106:	f856 4032 	ldr.w	r4, [r6, r2, lsl #3]
    110a:	b164      	cbz	r4, 1126 <usb_rx_memory+0x3a>
			if (table[index(i, RX, ODD)].desc == 0) {
    110c:	f856 2035 	ldr.w	r2, [r6, r5, lsl #3]
    1110:	b1ba      	cbz	r2, 1142 <usb_rx_memory+0x56>
	for (i=1; i <= NUM_ENDPOINTS; i++) {
    1112:	3301      	adds	r3, #1
    1114:	2b05      	cmp	r3, #5
    1116:	d1ee      	bne.n	10f6 <usb_rx_memory+0xa>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
    1118:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
    111a:	4b12      	ldr	r3, [pc, #72]	; (1164 <usb_rx_memory+0x78>)
    111c:	2200      	movs	r2, #0
    111e:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
    1120:	bcf0      	pop	{r4, r5, r6, r7}
	usb_free(packet);
    1122:	f000 bd25 	b.w	1b70 <usb_free>
				usb_rx_memory_needed--;
    1126:	4c0f      	ldr	r4, [pc, #60]	; (1164 <usb_rx_memory+0x78>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1128:	4d0f      	ldr	r5, [pc, #60]	; (1168 <usb_rx_memory+0x7c>)
				usb_rx_memory_needed--;
    112a:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    112c:	f847 5032 	str.w	r5, [r7, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
    1130:	eb07 1343 	add.w	r3, r7, r3, lsl #5
    1134:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    1136:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
    1138:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    113a:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    113c:	b662      	cpsie	i
}
    113e:	bcf0      	pop	{r4, r5, r6, r7}
    1140:	4770      	bx	lr
				usb_rx_memory_needed--;
    1142:	4908      	ldr	r1, [pc, #32]	; (1164 <usb_rx_memory+0x78>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1144:	4b09      	ldr	r3, [pc, #36]	; (116c <usb_rx_memory+0x80>)
				usb_rx_memory_needed--;
    1146:	780a      	ldrb	r2, [r1, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1148:	f847 3035 	str.w	r3, [r7, r5, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
    114c:	eb07 03c5 	add.w	r3, r7, r5, lsl #3
    1150:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    1152:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
    1154:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    1156:	700a      	strb	r2, [r1, #0]
				__enable_irq();
    1158:	b662      	cpsie	i
				return;
    115a:	e7f0      	b.n	113e <usb_rx_memory+0x52>
    115c:	00003eb4 	.word	0x00003eb4
    1160:	1fff8000 	.word	0x1fff8000
    1164:	1fff948d 	.word	0x1fff948d
    1168:	00400088 	.word	0x00400088
    116c:	004000c8 	.word	0x004000c8

00001170 <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
    1170:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
    1172:	2b03      	cmp	r3, #3
    1174:	d81d      	bhi.n	11b2 <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    1176:	4a1b      	ldr	r2, [pc, #108]	; (11e4 <usb_tx+0x74>)
    1178:	0140      	lsls	r0, r0, #5
    117a:	f040 0010 	orr.w	r0, r0, #16
{
    117e:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    1180:	4410      	add	r0, r2
	__disable_irq();
    1182:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
    1184:	4c18      	ldr	r4, [pc, #96]	; (11e8 <usb_tx+0x78>)
    1186:	5ce2      	ldrb	r2, [r4, r3]
    1188:	2a03      	cmp	r2, #3
    118a:	d81b      	bhi.n	11c4 <usb_tx+0x54>
    118c:	e8df f002 	tbb	[pc, r2]
    1190:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
    1194:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    1196:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
    1198:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    119a:	f010 0f08 	tst.w	r0, #8
    119e:	bf14      	ite	ne
    11a0:	23c8      	movne	r3, #200	; 0xc8
    11a2:	2388      	moveq	r3, #136	; 0x88
    11a4:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
    11a8:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    11aa:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
    11ac:	6041      	str	r1, [r0, #4]
	__enable_irq();
    11ae:	b662      	cpsie	i
}
    11b0:	bc30      	pop	{r4, r5}
    11b2:	4770      	bx	lr
		b++;
    11b4:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
    11b6:	2202      	movs	r2, #2
		break;
    11b8:	e7ed      	b.n	1196 <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
    11ba:	2205      	movs	r2, #5
    11bc:	e7eb      	b.n	1196 <usb_tx+0x26>
		b++;
    11be:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
    11c0:	2204      	movs	r2, #4
		break;
    11c2:	e7e8      	b.n	1196 <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
    11c4:	4a09      	ldr	r2, [pc, #36]	; (11ec <usb_tx+0x7c>)
    11c6:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    11ca:	b138      	cbz	r0, 11dc <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
    11cc:	4a08      	ldr	r2, [pc, #32]	; (11f0 <usb_tx+0x80>)
    11ce:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    11d2:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
    11d4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
    11d8:	b662      	cpsie	i
		return;
    11da:	e7e9      	b.n	11b0 <usb_tx+0x40>
			tx_first[endpoint] = packet;
    11dc:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    11e0:	4a03      	ldr	r2, [pc, #12]	; (11f0 <usb_tx+0x80>)
    11e2:	e7f7      	b.n	11d4 <usb_tx+0x64>
    11e4:	1fff8000 	.word	0x1fff8000
    11e8:	1fff949c 	.word	0x1fff949c
    11ec:	1fff9464 	.word	0x1fff9464
    11f0:	1fff9474 	.word	0x1fff9474

000011f4 <usb_isr>:
}



void usb_isr(void)
{
    11f4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
    11f8:	f8df a304 	ldr.w	sl, [pc, #772]	; 1500 <usb_isr+0x30c>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
    11fc:	f8df b304 	ldr.w	fp, [pc, #772]	; 1504 <usb_isr+0x310>
{
    1200:	b087      	sub	sp, #28
    1202:	e044      	b.n	128e <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
    1204:	4fa9      	ldr	r7, [pc, #676]	; (14ac <usb_isr+0x2b8>)
    1206:	ea4f 0893 	mov.w	r8, r3, lsr #2
    120a:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
    120e:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    1210:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
    1214:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
    1218:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    121a:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
    121e:	f003 04ff 	and.w	r4, r3, #255	; 0xff
    1222:	2b00      	cmp	r3, #0
    1224:	f040 80fe 	bne.w	1424 <usb_isr+0x230>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
    1228:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
    122c:	0c1b      	lsrs	r3, r3, #16
    122e:	b299      	uxth	r1, r3
    1230:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
    1234:	2b00      	cmp	r3, #0
    1236:	f000 80ec 	beq.w	1412 <usb_isr+0x21e>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
    123a:	4b9d      	ldr	r3, [pc, #628]	; (14b0 <usb_isr+0x2bc>)
					packet->index = 0;
    123c:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    1240:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    1244:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    1248:	2a00      	cmp	r2, #0
    124a:	f000 822b 	beq.w	16a4 <usb_isr+0x4b0>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    124e:	4d99      	ldr	r5, [pc, #612]	; (14b4 <usb_isr+0x2c0>)
    1250:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    1254:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    1256:	4c98      	ldr	r4, [pc, #608]	; (14b8 <usb_isr+0x2c4>)
					rx_last[endpoint] = packet;
    1258:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    125c:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    1260:	4419      	add	r1, r3
    1262:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    1266:	f000 fc63 	bl	1b30 <usb_malloc>
					if (packet) {
    126a:	2800      	cmp	r0, #0
    126c:	f000 8213 	beq.w	1696 <usb_isr+0x4a2>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    1270:	4a92      	ldr	r2, [pc, #584]	; (14bc <usb_isr+0x2c8>)
    1272:	4b93      	ldr	r3, [pc, #588]	; (14c0 <usb_isr+0x2cc>)
    1274:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    1278:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    127c:	bf18      	it	ne
    127e:	4613      	movne	r3, r2
						b->addr = packet->buf;
    1280:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    1284:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    1288:	2308      	movs	r3, #8
    128a:	f88a 3000 	strb.w	r3, [sl]
	status = USB0_ISTAT;
    128e:	f89a 4000 	ldrb.w	r4, [sl]
    1292:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    1294:	0760      	lsls	r0, r4, #29
    1296:	d51a      	bpl.n	12ce <usb_isr+0xda>
		if (usb_configuration) {
    1298:	4b8a      	ldr	r3, [pc, #552]	; (14c4 <usb_isr+0x2d0>)
    129a:	781b      	ldrb	r3, [r3, #0]
    129c:	b1a3      	cbz	r3, 12c8 <usb_isr+0xd4>
			t = usb_reboot_timer;
    129e:	498a      	ldr	r1, [pc, #552]	; (14c8 <usb_isr+0x2d4>)
    12a0:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    12a2:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    12a6:	b122      	cbz	r2, 12b2 <usb_isr+0xbe>
				usb_reboot_timer = --t;
    12a8:	3b01      	subs	r3, #1
    12aa:	b2db      	uxtb	r3, r3
    12ac:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    12ae:	b903      	cbnz	r3, 12b2 <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    12b0:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    12b2:	4986      	ldr	r1, [pc, #536]	; (14cc <usb_isr+0x2d8>)
    12b4:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    12b6:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    12ba:	b12a      	cbz	r2, 12c8 <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    12bc:	3b01      	subs	r3, #1
    12be:	b2db      	uxtb	r3, r3
    12c0:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    12c2:	2b00      	cmp	r3, #0
    12c4:	f000 81bd 	beq.w	1642 <usb_isr+0x44e>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    12c8:	2304      	movs	r3, #4
    12ca:	f88a 3000 	strb.w	r3, [sl]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    12ce:	f004 0308 	and.w	r3, r4, #8
    12d2:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    12d6:	2b00      	cmp	r3, #0
    12d8:	f000 80c8 	beq.w	146c <usb_isr+0x278>
		stat = USB0_STAT;
    12dc:	f89b 3000 	ldrb.w	r3, [fp]
    12e0:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    12e2:	091e      	lsrs	r6, r3, #4
    12e4:	d18e      	bne.n	1204 <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    12e6:	089c      	lsrs	r4, r3, #2
    12e8:	4f70      	ldr	r7, [pc, #448]	; (14ac <usb_isr+0x2b8>)
	switch (pid) {
    12ea:	f857 2034 	ldr.w	r2, [r7, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    12ee:	eb07 01c4 	add.w	r1, r7, r4, lsl #3
	switch (pid) {
    12f2:	f3c2 0283 	ubfx	r2, r2, #2, #4
    12f6:	3a01      	subs	r2, #1
	buf = b->addr;
    12f8:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    12fa:	2a0c      	cmp	r2, #12
    12fc:	f200 8085 	bhi.w	140a <usb_isr+0x216>
    1300:	e8df f002 	tbb	[pc, r2]
    1304:	83837979 	.word	0x83837979
    1308:	83838383 	.word	0x83838383
    130c:	83838342 	.word	0x83838342
    1310:	07          	.byte	0x07
    1311:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    1312:	6808      	ldr	r0, [r1, #0]
		ep0_tx_ptr = NULL;
    1314:	4b6e      	ldr	r3, [pc, #440]	; (14d0 <usb_isr+0x2dc>)
		setup.word1 = *(uint32_t *)(buf);
    1316:	4d6f      	ldr	r5, [pc, #444]	; (14d4 <usb_isr+0x2e0>)
		ep0_tx_ptr = NULL;
    1318:	9301      	str	r3, [sp, #4]
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    131a:	4b68      	ldr	r3, [pc, #416]	; (14bc <usb_isr+0x2c8>)
		setup.word2 = *(uint32_t *)(buf + 4);
    131c:	684a      	ldr	r2, [r1, #4]
		ep0_tx_data_toggle = 1;
    131e:	4e6e      	ldr	r6, [pc, #440]	; (14d8 <usb_isr+0x2e4>)
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    1320:	f847 3034 	str.w	r3, [r7, r4, lsl #3]
	switch (setup.wRequestAndType) {
    1324:	b281      	uxth	r1, r0
    1326:	f240 6481 	movw	r4, #1665	; 0x681
		ep0_tx_ptr = NULL;
    132a:	4b69      	ldr	r3, [pc, #420]	; (14d0 <usb_isr+0x2dc>)
		setup.word2 = *(uint32_t *)(buf + 4);
    132c:	606a      	str	r2, [r5, #4]
		setup.word1 = *(uint32_t *)(buf);
    132e:	6028      	str	r0, [r5, #0]
		ep0_tx_ptr = NULL;
    1330:	2200      	movs	r2, #0
		ep0_tx_data_toggle = 1;
    1332:	2001      	movs	r0, #1
	switch (setup.wRequestAndType) {
    1334:	42a1      	cmp	r1, r4
		ep0_tx_ptr = NULL;
    1336:	601a      	str	r2, [r3, #0]
		table[index(0, TX, EVEN)].desc = 0;
    1338:	613a      	str	r2, [r7, #16]
		table[index(0, TX, ODD)].desc = 0;
    133a:	61ba      	str	r2, [r7, #24]
		ep0_tx_data_toggle = 1;
    133c:	7030      	strb	r0, [r6, #0]
	switch (setup.wRequestAndType) {
    133e:	f200 80e3 	bhi.w	1508 <usb_isr+0x314>
    1342:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    1346:	f080 8227 	bcs.w	1798 <usb_isr+0x5a4>
    134a:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    134e:	f000 81e0 	beq.w	1712 <usb_isr+0x51e>
    1352:	f200 81c3 	bhi.w	16dc <usb_isr+0x4e8>
    1356:	2980      	cmp	r1, #128	; 0x80
    1358:	f000 8236 	beq.w	17c8 <usb_isr+0x5d4>
    135c:	2982      	cmp	r1, #130	; 0x82
    135e:	f040 81de 	bne.w	171e <usb_isr+0x52a>
    1362:	88a9      	ldrh	r1, [r5, #4]
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1364:	4b5d      	ldr	r3, [pc, #372]	; (14dc <usb_isr+0x2e8>)
    1366:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    136a:	2904      	cmp	r1, #4
    136c:	f200 81d8 	bhi.w	1720 <usb_isr+0x52c>
		reply_buffer[0] = 0;
    1370:	4c5b      	ldr	r4, [pc, #364]	; (14e0 <usb_isr+0x2ec>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1372:	0089      	lsls	r1, r1, #2
    1374:	440b      	add	r3, r1
		reply_buffer[0] = 0;
    1376:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1378:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    137a:	781a      	ldrb	r2, [r3, #0]
    137c:	0793      	lsls	r3, r2, #30
    137e:	f140 8322 	bpl.w	19c6 <usb_isr+0x7d2>
    1382:	7020      	strb	r0, [r4, #0]
		datalen = 2;
    1384:	2002      	movs	r0, #2
    1386:	e223      	b.n	17d0 <usb_isr+0x5dc>
		data = ep0_tx_ptr;
    1388:	4b51      	ldr	r3, [pc, #324]	; (14d0 <usb_isr+0x2dc>)
    138a:	9301      	str	r3, [sp, #4]
    138c:	681a      	ldr	r2, [r3, #0]
		if (data) {
    138e:	b33a      	cbz	r2, 13e0 <usb_isr+0x1ec>
			size = ep0_tx_len;
    1390:	4b54      	ldr	r3, [pc, #336]	; (14e4 <usb_isr+0x2f0>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1392:	4e51      	ldr	r6, [pc, #324]	; (14d8 <usb_isr+0x2e4>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1394:	4954      	ldr	r1, [pc, #336]	; (14e8 <usb_isr+0x2f4>)
			size = ep0_tx_len;
    1396:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1398:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    139a:	780d      	ldrb	r5, [r1, #0]
    139c:	2840      	cmp	r0, #64	; 0x40
    139e:	4686      	mov	lr, r0
    13a0:	f045 0802 	orr.w	r8, r5, #2
    13a4:	bf28      	it	cs
    13a6:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    13aa:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    13ac:	f084 0401 	eor.w	r4, r4, #1
    13b0:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    13b2:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    13b6:	bf0c      	ite	eq
    13b8:	2488      	moveq	r4, #136	; 0x88
    13ba:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    13bc:	eb07 06c8 	add.w	r6, r7, r8, lsl #3
			ep0_tx_len -= size;
    13c0:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    13c2:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    13c6:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    13ca:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    13cc:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    13ce:	f847 4038 	str.w	r4, [r7, r8, lsl #3]
			data += size;
    13d2:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    13d4:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    13d6:	2800      	cmp	r0, #0
    13d8:	f000 80b7 	beq.w	154a <usb_isr+0x356>
    13dc:	9b01      	ldr	r3, [sp, #4]
    13de:	601a      	str	r2, [r3, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    13e0:	4b3c      	ldr	r3, [pc, #240]	; (14d4 <usb_isr+0x2e0>)
    13e2:	881a      	ldrh	r2, [r3, #0]
    13e4:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    13e8:	d10f      	bne.n	140a <usb_isr+0x216>
			setup.bRequest = 0;
    13ea:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    13ec:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    13ee:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    13f0:	4b3e      	ldr	r3, [pc, #248]	; (14ec <usb_isr+0x2f8>)
    13f2:	701a      	strb	r2, [r3, #0]
    13f4:	e009      	b.n	140a <usb_isr+0x216>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    13f6:	4a37      	ldr	r2, [pc, #220]	; (14d4 <usb_isr+0x2e0>)
    13f8:	8810      	ldrh	r0, [r2, #0]
    13fa:	f242 0221 	movw	r2, #8225	; 0x2021
    13fe:	4290      	cmp	r0, r2
    1400:	f000 80a8 	beq.w	1554 <usb_isr+0x360>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    1404:	4a2d      	ldr	r2, [pc, #180]	; (14bc <usb_isr+0x2c8>)
    1406:	f847 2034 	str.w	r2, [r7, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    140a:	4a39      	ldr	r2, [pc, #228]	; (14f0 <usb_isr+0x2fc>)
    140c:	2301      	movs	r3, #1
    140e:	7013      	strb	r3, [r2, #0]
    1410:	e73a      	b.n	1288 <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    1412:	4a2a      	ldr	r2, [pc, #168]	; (14bc <usb_isr+0x2c8>)
    1414:	4b2a      	ldr	r3, [pc, #168]	; (14c0 <usb_isr+0x2cc>)
    1416:	f019 0f08 	tst.w	r9, #8
    141a:	bf18      	it	ne
    141c:	4613      	movne	r3, r2
    141e:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    1422:	e731      	b.n	1288 <usb_isr+0x94>
				usb_free(packet);
    1424:	f000 fba4 	bl	1b70 <usb_free>
				packet = tx_first[endpoint];
    1428:	4a32      	ldr	r2, [pc, #200]	; (14f4 <usb_isr+0x300>)
					switch (tx_state[endpoint]) {
    142a:	4933      	ldr	r1, [pc, #204]	; (14f8 <usb_isr+0x304>)
				packet = tx_first[endpoint];
    142c:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    1430:	2b00      	cmp	r3, #0
    1432:	f000 813b 	beq.w	16ac <usb_isr+0x4b8>
					tx_first[endpoint] = packet->next;
    1436:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    1438:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    143a:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    143e:	f103 0208 	add.w	r2, r3, #8
    1442:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    1446:	2c03      	cmp	r4, #3
    1448:	d805      	bhi.n	1456 <usb_isr+0x262>
    144a:	e8df f004 	tbb	[pc, r4]
    144e:	022c      	.short	0x022c
    1450:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    1452:	2202      	movs	r2, #2
    1454:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    1456:	881a      	ldrh	r2, [r3, #0]
    1458:	f019 0f08 	tst.w	r9, #8
    145c:	bf0c      	ite	eq
    145e:	2388      	moveq	r3, #136	; 0x88
    1460:	23c8      	movne	r3, #200	; 0xc8
    1462:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    1466:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    146a:	e70d      	b.n	1288 <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    146c:	07e0      	lsls	r0, r4, #31
    146e:	f100 80eb 	bmi.w	1648 <usb_isr+0x454>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    1472:	0621      	lsls	r1, r4, #24
    1474:	f100 8128 	bmi.w	16c8 <usb_isr+0x4d4>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1478:	07a2      	lsls	r2, r4, #30
    147a:	d506      	bpl.n	148a <usb_isr+0x296>
		uint8_t err = USB0_ERRSTAT;
    147c:	4a1f      	ldr	r2, [pc, #124]	; (14fc <usb_isr+0x308>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    147e:	4920      	ldr	r1, [pc, #128]	; (1500 <usb_isr+0x30c>)
		uint8_t err = USB0_ERRSTAT;
    1480:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1482:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    1484:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    1486:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1488:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    148a:	06e3      	lsls	r3, r4, #27
    148c:	d502      	bpl.n	1494 <usb_isr+0x2a0>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    148e:	4b1c      	ldr	r3, [pc, #112]	; (1500 <usb_isr+0x30c>)
    1490:	2210      	movs	r2, #16
    1492:	701a      	strb	r2, [r3, #0]
	}

}
    1494:	b007      	add	sp, #28
    1496:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    149a:	2204      	movs	r2, #4
    149c:	558a      	strb	r2, [r1, r6]
						break;
    149e:	e7da      	b.n	1456 <usb_isr+0x262>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    14a0:	2205      	movs	r2, #5
    14a2:	558a      	strb	r2, [r1, r6]
						break;
    14a4:	e7d7      	b.n	1456 <usb_isr+0x262>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    14a6:	2203      	movs	r2, #3
    14a8:	558a      	strb	r2, [r1, r6]
						break;
    14aa:	e7d4      	b.n	1456 <usb_isr+0x262>
    14ac:	1fff8000 	.word	0x1fff8000
    14b0:	1fff9410 	.word	0x1fff9410
    14b4:	1fff93bc 	.word	0x1fff93bc
    14b8:	1fff9694 	.word	0x1fff9694
    14bc:	004000c8 	.word	0x004000c8
    14c0:	00400088 	.word	0x00400088
    14c4:	1fff9498 	.word	0x1fff9498
    14c8:	1fff9421 	.word	0x1fff9421
    14cc:	1fff94a0 	.word	0x1fff94a0
    14d0:	1fff93b8 	.word	0x1fff93b8
    14d4:	1fff9484 	.word	0x1fff9484
    14d8:	1fff9420 	.word	0x1fff9420
    14dc:	400720c0 	.word	0x400720c0
    14e0:	1fff9490 	.word	0x1fff9490
    14e4:	1fff93cc 	.word	0x1fff93cc
    14e8:	1fff948c 	.word	0x1fff948c
    14ec:	40072098 	.word	0x40072098
    14f0:	40072094 	.word	0x40072094
    14f4:	1fff9464 	.word	0x1fff9464
    14f8:	1fff949c 	.word	0x1fff949c
    14fc:	40072088 	.word	0x40072088
    1500:	40072080 	.word	0x40072080
    1504:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    1508:	f242 0421 	movw	r4, #8225	; 0x2021
    150c:	42a1      	cmp	r1, r4
    150e:	f000 8094 	beq.w	163a <usb_isr+0x446>
    1512:	d843      	bhi.n	159c <usb_isr+0x3a8>
    1514:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    1518:	f000 81a8 	beq.w	186c <usb_isr+0x678>
    151c:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    1520:	f040 80fd 	bne.w	171e <usb_isr+0x52a>
		usb_configuration = setup.wValue;
    1524:	4ab8      	ldr	r2, [pc, #736]	; (1808 <usb_isr+0x614>)
    1526:	4cb9      	ldr	r4, [pc, #740]	; (180c <usb_isr+0x618>)
    1528:	78a9      	ldrb	r1, [r5, #2]
    152a:	7011      	strb	r1, [r2, #0]
    152c:	f104 0580 	add.w	r5, r4, #128	; 0x80
    1530:	e003      	b.n	153a <usb_isr+0x346>
    1532:	3408      	adds	r4, #8
		for (i=4; i < (NUM_ENDPOINTS+1)*4; i++) {
    1534:	42ac      	cmp	r4, r5
    1536:	f000 819e 	beq.w	1876 <usb_isr+0x682>
			if (table[i].desc & BDT_OWN) {
    153a:	6a23      	ldr	r3, [r4, #32]
    153c:	0619      	lsls	r1, r3, #24
    153e:	d5f8      	bpl.n	1532 <usb_isr+0x33e>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    1540:	6a60      	ldr	r0, [r4, #36]	; 0x24
    1542:	3808      	subs	r0, #8
    1544:	f000 fb14 	bl	1b70 <usb_free>
    1548:	e7f3      	b.n	1532 <usb_isr+0x33e>
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    154a:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    154e:	bf18      	it	ne
    1550:	2200      	movne	r2, #0
    1552:	e743      	b.n	13dc <usb_isr+0x1e8>
    1554:	4aae      	ldr	r2, [pc, #696]	; (1810 <usb_isr+0x61c>)
    1556:	1dcd      	adds	r5, r1, #7
				*dst++ = *buf++;
    1558:	f811 3b01 	ldrb.w	r3, [r1], #1
    155c:	f802 3f01 	strb.w	r3, [r2, #1]!
			for (i=0; i<7; i++) {
    1560:	42a9      	cmp	r1, r5
    1562:	d1f9      	bne.n	1558 <usb_isr+0x364>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1564:	4aab      	ldr	r2, [pc, #684]	; (1814 <usb_isr+0x620>)
    1566:	6812      	ldr	r2, [r2, #0]
    1568:	2a86      	cmp	r2, #134	; 0x86
    156a:	f000 8111 	beq.w	1790 <usb_isr+0x59c>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    156e:	49aa      	ldr	r1, [pc, #680]	; (1818 <usb_isr+0x624>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1570:	4eaa      	ldr	r6, [pc, #680]	; (181c <usb_isr+0x628>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1572:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1574:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1576:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    157a:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    157c:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    1580:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1582:	bf0c      	ite	eq
    1584:	2188      	moveq	r1, #136	; 0x88
    1586:	21c8      	movne	r1, #200	; 0xc8
    1588:	f847 1032 	str.w	r1, [r7, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    158c:	eb07 02c2 	add.w	r2, r7, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    1590:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1594:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    1596:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1598:	6051      	str	r1, [r2, #4]
    159a:	e733      	b.n	1404 <usb_isr+0x210>
	switch (setup.wRequestAndType) {
    159c:	f242 2421 	movw	r4, #8737	; 0x2221
    15a0:	42a1      	cmp	r1, r4
    15a2:	f040 81fe 	bne.w	19a2 <usb_isr+0x7ae>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    15a6:	f8df c2bc 	ldr.w	ip, [pc, #700]	; 1864 <usb_isr+0x670>
    15aa:	4b9d      	ldr	r3, [pc, #628]	; (1820 <usb_isr+0x62c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    15ac:	499d      	ldr	r1, [pc, #628]	; (1824 <usb_isr+0x630>)
    15ae:	78ac      	ldrb	r4, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    15b0:	f8dc 5000 	ldr.w	r5, [ip]
    15b4:	601d      	str	r5, [r3, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    15b6:	4681      	mov	r9, r0
    15b8:	700c      	strb	r4, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    15ba:	2000      	movs	r0, #0
    15bc:	9002      	str	r0, [sp, #8]
    15be:	4680      	mov	r8, r0
    15c0:	4684      	mov	ip, r0
    15c2:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    15c4:	4994      	ldr	r1, [pc, #592]	; (1818 <usb_isr+0x624>)
    15c6:	780d      	ldrb	r5, [r1, #0]
    15c8:	f045 0e02 	orr.w	lr, r5, #2
    15cc:	eb07 03ce 	add.w	r3, r7, lr, lsl #3
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15d0:	f1b9 0f00 	cmp.w	r9, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    15d4:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15d6:	bf0c      	ite	eq
    15d8:	2488      	moveq	r4, #136	; 0x88
    15da:	24c8      	movne	r4, #200	; 0xc8
    15dc:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    15e0:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15e4:	f847 303e 	str.w	r3, [r7, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    15e8:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    15ea:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    15ec:	f8df e21c 	ldr.w	lr, [pc, #540]	; 180c <usb_isr+0x618>
	ep0_tx_data_toggle ^= 1;
    15f0:	4b8a      	ldr	r3, [pc, #552]	; (181c <usb_isr+0x628>)
	ep0_tx_bdt_bank ^= 1;
    15f2:	f8df 8224 	ldr.w	r8, [pc, #548]	; 1818 <usb_isr+0x624>
	if (datalen == 0 && size < EP0_SIZE) return;
    15f6:	2800      	cmp	r0, #0
    15f8:	f040 8098 	bne.w	172c <usb_isr+0x538>
    15fc:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    1600:	d11b      	bne.n	163a <usb_isr+0x446>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1602:	f044 0402 	orr.w	r4, r4, #2
    1606:	eb07 03c4 	add.w	r3, r7, r4, lsl #3
    160a:	9f02      	ldr	r7, [sp, #8]
    160c:	f8df e1fc 	ldr.w	lr, [pc, #508]	; 180c <usb_isr+0x618>
    1610:	605f      	str	r7, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1612:	2a00      	cmp	r2, #0
    1614:	f040 809f 	bne.w	1756 <usb_isr+0x562>
    1618:	0402      	lsls	r2, r0, #16
    161a:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	data += size;
    161e:	4407      	add	r7, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1620:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
	ep0_tx_data_toggle ^= 1;
    1624:	f886 9000 	strb.w	r9, [r6]
	ep0_tx_bdt_bank ^= 1;
    1628:	700d      	strb	r5, [r1, #0]
	data += size;
    162a:	463b      	mov	r3, r7
	if (datalen == 0 && size < EP0_SIZE) return;
    162c:	2840      	cmp	r0, #64	; 0x40
    162e:	d104      	bne.n	163a <usb_isr+0x446>
    1630:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    1632:	4a7d      	ldr	r2, [pc, #500]	; (1828 <usb_isr+0x634>)
	ep0_tx_ptr = data;
    1634:	9901      	ldr	r1, [sp, #4]
	ep0_tx_len = datalen;
    1636:	8010      	strh	r0, [r2, #0]
	ep0_tx_ptr = data;
    1638:	600b      	str	r3, [r1, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    163a:	4a7c      	ldr	r2, [pc, #496]	; (182c <usb_isr+0x638>)
    163c:	2301      	movs	r3, #1
    163e:	7013      	strb	r3, [r2, #0]
    1640:	e6e3      	b.n	140a <usb_isr+0x216>
				if (t == 0) usb_serial_flush_callback();
    1642:	f000 fc01 	bl	1e48 <usb_serial_flush_callback>
    1646:	e63f      	b.n	12c8 <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1648:	4b70      	ldr	r3, [pc, #448]	; (180c <usb_isr+0x618>)
		USB0_CTL = USB_CTL_ODDRST;
    164a:	4878      	ldr	r0, [pc, #480]	; (182c <usb_isr+0x638>)
		ep0_tx_bdt_bank = 0;
    164c:	4972      	ldr	r1, [pc, #456]	; (1818 <usb_isr+0x624>)
		table[index(0, TX, EVEN)].desc = 0;
    164e:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    1650:	f04f 0e02 	mov.w	lr, #2
    1654:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1658:	4f75      	ldr	r7, [pc, #468]	; (1830 <usb_isr+0x63c>)
		ep0_tx_bdt_bank = 0;
    165a:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    165c:	4975      	ldr	r1, [pc, #468]	; (1834 <usb_isr+0x640>)
    165e:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    1660:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    1662:	4e75      	ldr	r6, [pc, #468]	; (1838 <usb_isr+0x644>)
		USB0_ISTAT = 0xFF;
    1664:	4d75      	ldr	r5, [pc, #468]	; (183c <usb_isr+0x648>)
		USB0_ADDR = 0;
    1666:	4c76      	ldr	r4, [pc, #472]	; (1840 <usb_isr+0x64c>)
		table[index(0, TX, ODD)].desc = 0;
    1668:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    166a:	210d      	movs	r1, #13
    166c:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    166e:	21ff      	movs	r1, #255	; 0xff
    1670:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    1672:	f8df e1f4 	ldr.w	lr, [pc, #500]	; 1868 <usb_isr+0x674>
		USB0_ISTAT = 0xFF;
    1676:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    1678:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    167a:	4d72      	ldr	r5, [pc, #456]	; (1844 <usb_isr+0x650>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    167c:	4a72      	ldr	r2, [pc, #456]	; (1848 <usb_isr+0x654>)
		USB0_ERREN = 0xFF;
    167e:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1682:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    1684:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1686:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    168a:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    168c:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    168e:	60da      	str	r2, [r3, #12]
}
    1690:	b007      	add	sp, #28
    1692:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    1696:	4a6d      	ldr	r2, [pc, #436]	; (184c <usb_isr+0x658>)
						b->desc = 0;
    1698:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    169c:	7813      	ldrb	r3, [r2, #0]
    169e:	3301      	adds	r3, #1
    16a0:	7013      	strb	r3, [r2, #0]
    16a2:	e5f1      	b.n	1288 <usb_isr+0x94>
						rx_first[endpoint] = packet;
    16a4:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    16a8:	4d69      	ldr	r5, [pc, #420]	; (1850 <usb_isr+0x65c>)
    16aa:	e5d4      	b.n	1256 <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    16ac:	5d8b      	ldrb	r3, [r1, r6]
    16ae:	2b03      	cmp	r3, #3
    16b0:	d867      	bhi.n	1782 <usb_isr+0x58e>
    16b2:	a201      	add	r2, pc, #4	; (adr r2, 16b8 <usb_isr+0x4c4>)
    16b4:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    16b8:	00001289 	.word	0x00001289
    16bc:	00001289 	.word	0x00001289
    16c0:	0000170d 	.word	0x0000170d
    16c4:	00001707 	.word	0x00001707
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    16c8:	4959      	ldr	r1, [pc, #356]	; (1830 <usb_isr+0x63c>)
		USB0_ISTAT = USB_ISTAT_STALL;
    16ca:	4b5c      	ldr	r3, [pc, #368]	; (183c <usb_isr+0x648>)
    16cc:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    16ce:	200d      	movs	r0, #13
    16d0:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    16d2:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    16d4:	07a2      	lsls	r2, r4, #30
    16d6:	f57f aed8 	bpl.w	148a <usb_isr+0x296>
    16da:	e6cf      	b.n	147c <usb_isr+0x288>
	switch (setup.wRequestAndType) {
    16dc:	f240 3202 	movw	r2, #770	; 0x302
    16e0:	4291      	cmp	r1, r2
    16e2:	f040 8156 	bne.w	1992 <usb_isr+0x79e>
    16e6:	88a9      	ldrh	r1, [r5, #4]
    16e8:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    16ec:	2904      	cmp	r1, #4
    16ee:	d816      	bhi.n	171e <usb_isr+0x52a>
    16f0:	886a      	ldrh	r2, [r5, #2]
    16f2:	b9a2      	cbnz	r2, 171e <usb_isr+0x52a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    16f4:	4c4e      	ldr	r4, [pc, #312]	; (1830 <usb_isr+0x63c>)
    16f6:	0089      	lsls	r1, r1, #2
    16f8:	440c      	add	r4, r1
    16fa:	4681      	mov	r9, r0
    16fc:	7821      	ldrb	r1, [r4, #0]
    16fe:	f041 0102 	orr.w	r1, r1, #2
    1702:	7021      	strb	r1, [r4, #0]
    1704:	e759      	b.n	15ba <usb_isr+0x3c6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1706:	2301      	movs	r3, #1
    1708:	558b      	strb	r3, [r1, r6]
						break;
    170a:	e5bd      	b.n	1288 <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    170c:	2300      	movs	r3, #0
    170e:	558b      	strb	r3, [r1, r6]
						break;
    1710:	e5ba      	b.n	1288 <usb_isr+0x94>
    1712:	88a9      	ldrh	r1, [r5, #4]
    1714:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1718:	2904      	cmp	r1, #4
    171a:	f240 8147 	bls.w	19ac <usb_isr+0x7b8>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    171e:	4b44      	ldr	r3, [pc, #272]	; (1830 <usb_isr+0x63c>)
    1720:	220f      	movs	r2, #15
    1722:	701a      	strb	r2, [r3, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1724:	4a41      	ldr	r2, [pc, #260]	; (182c <usb_isr+0x638>)
    1726:	2301      	movs	r3, #1
    1728:	7013      	strb	r3, [r2, #0]
    172a:	e66e      	b.n	140a <usb_isr+0x216>
	if (size > EP0_SIZE) size = EP0_SIZE;
    172c:	2840      	cmp	r0, #64	; 0x40
    172e:	f67f af68 	bls.w	1602 <usb_isr+0x40e>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1732:	f044 0402 	orr.w	r4, r4, #2
    1736:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    173a:	9e02      	ldr	r6, [sp, #8]
    173c:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    173e:	b1aa      	cbz	r2, 176c <usb_isr+0x578>
    1740:	4a44      	ldr	r2, [pc, #272]	; (1854 <usb_isr+0x660>)
	ep0_tx_data_toggle ^= 1;
    1742:	f883 9000 	strb.w	r9, [r3]
	data += size;
    1746:	4633      	mov	r3, r6
    1748:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    174a:	f888 5000 	strb.w	r5, [r8]
	data += size;
    174e:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1750:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1754:	e76d      	b.n	1632 <usb_isr+0x43e>
    1756:	0402      	lsls	r2, r0, #16
	data += size;
    1758:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_data_toggle ^= 1;
    175a:	f886 9000 	strb.w	r9, [r6]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    175e:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	ep0_tx_bdt_bank ^= 1;
    1762:	700d      	strb	r5, [r1, #0]
	data += size;
    1764:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1766:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    176a:	e75f      	b.n	162c <usb_isr+0x438>
	ep0_tx_data_toggle ^= 1;
    176c:	f883 9000 	strb.w	r9, [r3]
	data += size;
    1770:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1772:	4a30      	ldr	r2, [pc, #192]	; (1834 <usb_isr+0x640>)
	ep0_tx_bdt_bank ^= 1;
    1774:	f888 5000 	strb.w	r5, [r8]
    1778:	3840      	subs	r0, #64	; 0x40
	data += size;
    177a:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    177c:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1780:	e757      	b.n	1632 <usb_isr+0x43e>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    1782:	f019 0f08 	tst.w	r9, #8
    1786:	bf0c      	ite	eq
    1788:	2302      	moveq	r3, #2
    178a:	2303      	movne	r3, #3
    178c:	558b      	strb	r3, [r1, r6]
						break;
    178e:	e57b      	b.n	1288 <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1790:	4a31      	ldr	r2, [pc, #196]	; (1858 <usb_isr+0x664>)
    1792:	210f      	movs	r1, #15
    1794:	7011      	strb	r1, [r2, #0]
    1796:	e6ea      	b.n	156e <usb_isr+0x37a>
			if (list->addr == NULL) break;
    1798:	4a30      	ldr	r2, [pc, #192]	; (185c <usb_isr+0x668>)
    179a:	6854      	ldr	r4, [r2, #4]
    179c:	2c00      	cmp	r4, #0
    179e:	d0be      	beq.n	171e <usb_isr+0x52a>
    17a0:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    17a2:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    17a6:	e003      	b.n	17b0 <usb_isr+0x5bc>
		for (list = usb_descriptor_list; 1; list++) {
    17a8:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    17aa:	6854      	ldr	r4, [r2, #4]
    17ac:	2c00      	cmp	r4, #0
    17ae:	d0b6      	beq.n	171e <usb_isr+0x52a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    17b0:	8813      	ldrh	r3, [r2, #0]
    17b2:	4283      	cmp	r3, r0
    17b4:	d1f8      	bne.n	17a8 <usb_isr+0x5b4>
    17b6:	8853      	ldrh	r3, [r2, #2]
    17b8:	4573      	cmp	r3, lr
    17ba:	d1f5      	bne.n	17a8 <usb_isr+0x5b4>
				if ((setup.wValue >> 8) == 3) {
    17bc:	0a00      	lsrs	r0, r0, #8
    17be:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    17c0:	bf0c      	ite	eq
    17c2:	7820      	ldrbeq	r0, [r4, #0]
					datalen = list->length;
    17c4:	8910      	ldrhne	r0, [r2, #8]
    17c6:	e003      	b.n	17d0 <usb_isr+0x5dc>
		reply_buffer[0] = 0;
    17c8:	4c25      	ldr	r4, [pc, #148]	; (1860 <usb_isr+0x66c>)
		datalen = 2;
    17ca:	2002      	movs	r0, #2
		reply_buffer[0] = 0;
    17cc:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    17ce:	7062      	strb	r2, [r4, #1]
	if (datalen > setup.wLength) datalen = setup.wLength;
    17d0:	88ea      	ldrh	r2, [r5, #6]
    17d2:	4282      	cmp	r2, r0
    17d4:	f080 810c 	bcs.w	19f0 <usb_isr+0x7fc>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    17d8:	490f      	ldr	r1, [pc, #60]	; (1818 <usb_isr+0x624>)
    17da:	780d      	ldrb	r5, [r1, #0]
    17dc:	2a40      	cmp	r2, #64	; 0x40
    17de:	f045 0e02 	orr.w	lr, r5, #2
    17e2:	4694      	mov	ip, r2
    17e4:	eb07 00ce 	add.w	r0, r7, lr, lsl #3
    17e8:	bf28      	it	cs
    17ea:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    17ee:	eb04 030c 	add.w	r3, r4, ip
    17f2:	6044      	str	r4, [r0, #4]
    17f4:	9302      	str	r3, [sp, #8]
    17f6:	ebcc 0002 	rsb	r0, ip, r2
    17fa:	ea4f 480c 	mov.w	r8, ip, lsl #16
    17fe:	f04f 0901 	mov.w	r9, #1
    1802:	2200      	movs	r2, #0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1804:	24c8      	movs	r4, #200	; 0xc8
    1806:	e6e9      	b.n	15dc <usb_isr+0x3e8>
    1808:	1fff9498 	.word	0x1fff9498
    180c:	1fff8000 	.word	0x1fff8000
    1810:	1fff969b 	.word	0x1fff969b
    1814:	1fff969c 	.word	0x1fff969c
    1818:	1fff948c 	.word	0x1fff948c
    181c:	1fff9420 	.word	0x1fff9420
    1820:	1fff96a4 	.word	0x1fff96a4
    1824:	1fff94b0 	.word	0x1fff94b0
    1828:	1fff93cc 	.word	0x1fff93cc
    182c:	40072094 	.word	0x40072094
    1830:	400720c0 	.word	0x400720c0
    1834:	00400088 	.word	0x00400088
    1838:	40072088 	.word	0x40072088
    183c:	40072080 	.word	0x40072080
    1840:	40072098 	.word	0x40072098
    1844:	1fff93d0 	.word	0x1fff93d0
    1848:	1fff9424 	.word	0x1fff9424
    184c:	1fff948d 	.word	0x1fff948d
    1850:	1fff93bc 	.word	0x1fff93bc
    1854:	004000c8 	.word	0x004000c8
    1858:	1fff9421 	.word	0x1fff9421
    185c:	00003eb8 	.word	0x00003eb8
    1860:	1fff9490 	.word	0x1fff9490
    1864:	1fff93b4 	.word	0x1fff93b4
    1868:	4007208c 	.word	0x4007208c
		reply_buffer[0] = usb_configuration;
    186c:	4a68      	ldr	r2, [pc, #416]	; (1a10 <usb_isr+0x81c>)
    186e:	4c69      	ldr	r4, [pc, #420]	; (1a14 <usb_isr+0x820>)
    1870:	7812      	ldrb	r2, [r2, #0]
    1872:	7022      	strb	r2, [r4, #0]
    1874:	e7ac      	b.n	17d0 <usb_isr+0x5dc>
    1876:	4968      	ldr	r1, [pc, #416]	; (1a18 <usb_isr+0x824>)
    1878:	4b68      	ldr	r3, [pc, #416]	; (1a1c <usb_isr+0x828>)
    187a:	4a69      	ldr	r2, [pc, #420]	; (1a20 <usb_isr+0x82c>)
    187c:	9102      	str	r1, [sp, #8]
    187e:	4969      	ldr	r1, [pc, #420]	; (1a24 <usb_isr+0x830>)
    1880:	4c69      	ldr	r4, [pc, #420]	; (1a28 <usb_isr+0x834>)
    1882:	4d6a      	ldr	r5, [pc, #424]	; (1a2c <usb_isr+0x838>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1884:	9403      	str	r4, [sp, #12]
    1886:	9605      	str	r6, [sp, #20]
		for (i=4; i < (NUM_ENDPOINTS+1)*4; i++) {
    1888:	f04f 0900 	mov.w	r9, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    188c:	4688      	mov	r8, r1
    188e:	461c      	mov	r4, r3
    1890:	4616      	mov	r6, r2
    1892:	9504      	str	r5, [sp, #16]
			p = rx_first[i];
    1894:	6820      	ldr	r0, [r4, #0]
			while (p) {
    1896:	b128      	cbz	r0, 18a4 <usb_isr+0x6b0>
				n = p->next;
    1898:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    189a:	f000 f969 	bl	1b70 <usb_free>
			while (p) {
    189e:	4628      	mov	r0, r5
    18a0:	2d00      	cmp	r5, #0
    18a2:	d1f9      	bne.n	1898 <usb_isr+0x6a4>
			rx_first[i] = NULL;
    18a4:	2300      	movs	r3, #0
    18a6:	6023      	str	r3, [r4, #0]
			rx_last[i] = NULL;
    18a8:	9b04      	ldr	r3, [sp, #16]
			p = tx_first[i];
    18aa:	6830      	ldr	r0, [r6, #0]
			rx_last[i] = NULL;
    18ac:	461a      	mov	r2, r3
    18ae:	2300      	movs	r3, #0
    18b0:	f842 3029 	str.w	r3, [r2, r9, lsl #2]
			while (p) {
    18b4:	b128      	cbz	r0, 18c2 <usb_isr+0x6ce>
				n = p->next;
    18b6:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    18b8:	f000 f95a 	bl	1b70 <usb_free>
			while (p) {
    18bc:	4628      	mov	r0, r5
    18be:	2d00      	cmp	r5, #0
    18c0:	d1f9      	bne.n	18b6 <usb_isr+0x6c2>
			tx_first[i] = NULL;
    18c2:	2200      	movs	r2, #0
    18c4:	6032      	str	r2, [r6, #0]
			tx_last[i] = NULL;
    18c6:	9a02      	ldr	r2, [sp, #8]
			switch (tx_state[i]) {
    18c8:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    18cc:	4611      	mov	r1, r2
    18ce:	2200      	movs	r2, #0
    18d0:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    18d4:	9a03      	ldr	r2, [sp, #12]
			tx_last[i] = NULL;
    18d6:	9102      	str	r1, [sp, #8]
			switch (tx_state[i]) {
    18d8:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    18da:	f04f 0100 	mov.w	r1, #0
    18de:	f822 1019 	strh.w	r1, [r2, r9, lsl #1]
			switch (tx_state[i]) {
    18e2:	2b03      	cmp	r3, #3
    18e4:	d807      	bhi.n	18f6 <usb_isr+0x702>
    18e6:	e8df f003 	tbb	[pc, r3]
    18ea:	0234      	.short	0x0234
    18ec:	0234      	.short	0x0234
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    18ee:	f04f 0301 	mov.w	r3, #1
    18f2:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    18f6:	f109 0901 	add.w	r9, r9, #1
    18fa:	f1b9 0f04 	cmp.w	r9, #4
    18fe:	f104 0404 	add.w	r4, r4, #4
    1902:	f106 0604 	add.w	r6, r6, #4
    1906:	f108 0801 	add.w	r8, r8, #1
    190a:	d1c3      	bne.n	1894 <usb_isr+0x6a0>
		usb_rx_memory_needed = 0;
    190c:	4b48      	ldr	r3, [pc, #288]	; (1a30 <usb_isr+0x83c>)
    190e:	9e05      	ldr	r6, [sp, #20]
		reg = &USB0_ENDPT1;
    1910:	f8df 9130 	ldr.w	r9, [pc, #304]	; 1a44 <usb_isr+0x850>
		cfg = usb_endpoint_config_table;
    1914:	f8df 8130 	ldr.w	r8, [pc, #304]	; 1a48 <usb_isr+0x854>
		usb_rx_memory_needed = 0;
    1918:	2100      	movs	r1, #0
    191a:	7019      	strb	r1, [r3, #0]
		for (i=1; i <= NUM_ENDPOINTS; i++) {
    191c:	2501      	movs	r5, #1
			epconf = *cfg++;
    191e:	f818 3b01 	ldrb.w	r3, [r8], #1
			*reg = epconf;
    1922:	f809 3b04 	strb.w	r3, [r9], #4
			if (epconf & USB_ENDPT_EPRXEN) {
    1926:	071a      	lsls	r2, r3, #28
    1928:	d418      	bmi.n	195c <usb_isr+0x768>
    192a:	00ac      	lsls	r4, r5, #2
			table[index(i, TX, EVEN)].desc = 0;
    192c:	f044 0202 	orr.w	r2, r4, #2
			table[index(i, TX, ODD)].desc = 0;
    1930:	f044 0403 	orr.w	r4, r4, #3
			table[index(i, TX, EVEN)].desc = 0;
    1934:	2300      	movs	r3, #0
    1936:	f847 3032 	str.w	r3, [r7, r2, lsl #3]
			table[index(i, TX, ODD)].desc = 0;
    193a:	f847 3034 	str.w	r3, [r7, r4, lsl #3]
		for (i=1; i <= NUM_ENDPOINTS; i++) {
    193e:	4b3d      	ldr	r3, [pc, #244]	; (1a34 <usb_isr+0x840>)
    1940:	4599      	cmp	r9, r3
    1942:	f105 0501 	add.w	r5, r5, #1
    1946:	d1ea      	bne.n	191e <usb_isr+0x72a>
    1948:	f896 9000 	ldrb.w	r9, [r6]
    194c:	f089 0201 	eor.w	r2, r9, #1
    1950:	e633      	b.n	15ba <usb_isr+0x3c6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1952:	f04f 0300 	mov.w	r3, #0
    1956:	f888 3000 	strb.w	r3, [r8]
    195a:	e7cc      	b.n	18f6 <usb_isr+0x702>
				p = usb_malloc();
    195c:	f000 f8e8 	bl	1b30 <usb_malloc>
					table[index(i, RX, EVEN)].addr = p->buf;
    1960:	00ac      	lsls	r4, r5, #2
    1962:	eb07 1345 	add.w	r3, r7, r5, lsl #5
    1966:	f100 0208 	add.w	r2, r0, #8
				if (p) {
    196a:	2800      	cmp	r0, #0
    196c:	d037      	beq.n	19de <usb_isr+0x7ea>
					table[index(i, RX, EVEN)].addr = p->buf;
    196e:	605a      	str	r2, [r3, #4]
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1970:	4b31      	ldr	r3, [pc, #196]	; (1a38 <usb_isr+0x844>)
    1972:	f847 3034 	str.w	r3, [r7, r4, lsl #3]
				p = usb_malloc();
    1976:	f000 f8db 	bl	1b30 <usb_malloc>
					table[index(i, RX, ODD)].addr = p->buf;
    197a:	f044 0301 	orr.w	r3, r4, #1
    197e:	eb07 02c3 	add.w	r2, r7, r3, lsl #3
    1982:	f100 0108 	add.w	r1, r0, #8
				if (p) {
    1986:	b300      	cbz	r0, 19ca <usb_isr+0x7d6>
					table[index(i, RX, ODD)].addr = p->buf;
    1988:	6051      	str	r1, [r2, #4]
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    198a:	4a2c      	ldr	r2, [pc, #176]	; (1a3c <usb_isr+0x848>)
    198c:	f847 2033 	str.w	r2, [r7, r3, lsl #3]
    1990:	e7cc      	b.n	192c <usb_isr+0x738>
	switch (setup.wRequestAndType) {
    1992:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    1996:	f47f aec2 	bne.w	171e <usb_isr+0x52a>
    199a:	2200      	movs	r2, #0
    199c:	f04f 0901 	mov.w	r9, #1
    19a0:	e60b      	b.n	15ba <usb_isr+0x3c6>
    19a2:	f242 3221 	movw	r2, #8993	; 0x2321
    19a6:	4291      	cmp	r1, r2
    19a8:	d0f7      	beq.n	199a <usb_isr+0x7a6>
    19aa:	e6b8      	b.n	171e <usb_isr+0x52a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    19ac:	886a      	ldrh	r2, [r5, #2]
    19ae:	2a00      	cmp	r2, #0
    19b0:	f47f aeb5 	bne.w	171e <usb_isr+0x52a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    19b4:	4c22      	ldr	r4, [pc, #136]	; (1a40 <usb_isr+0x84c>)
    19b6:	0089      	lsls	r1, r1, #2
    19b8:	440c      	add	r4, r1
    19ba:	4681      	mov	r9, r0
    19bc:	7821      	ldrb	r1, [r4, #0]
    19be:	f021 0102 	bic.w	r1, r1, #2
    19c2:	7021      	strb	r1, [r4, #0]
    19c4:	e5f9      	b.n	15ba <usb_isr+0x3c6>
		datalen = 2;
    19c6:	2002      	movs	r0, #2
    19c8:	e702      	b.n	17d0 <usb_isr+0x5dc>
					usb_rx_memory_needed++;
    19ca:	4b19      	ldr	r3, [pc, #100]	; (1a30 <usb_isr+0x83c>)
					table[index(i, RX, ODD)].desc = 0;
    19cc:	f044 0201 	orr.w	r2, r4, #1
					usb_rx_memory_needed++;
    19d0:	781b      	ldrb	r3, [r3, #0]
					table[index(i, RX, ODD)].desc = 0;
    19d2:	f847 0032 	str.w	r0, [r7, r2, lsl #3]
					usb_rx_memory_needed++;
    19d6:	4a16      	ldr	r2, [pc, #88]	; (1a30 <usb_isr+0x83c>)
    19d8:	3301      	adds	r3, #1
    19da:	7013      	strb	r3, [r2, #0]
    19dc:	e7a6      	b.n	192c <usb_isr+0x738>
					usb_rx_memory_needed++;
    19de:	4b14      	ldr	r3, [pc, #80]	; (1a30 <usb_isr+0x83c>)
    19e0:	4a13      	ldr	r2, [pc, #76]	; (1a30 <usb_isr+0x83c>)
    19e2:	781b      	ldrb	r3, [r3, #0]
					table[index(i, RX, EVEN)].desc = 0;
    19e4:	00ac      	lsls	r4, r5, #2
					usb_rx_memory_needed++;
    19e6:	3301      	adds	r3, #1
					table[index(i, RX, EVEN)].desc = 0;
    19e8:	f847 0034 	str.w	r0, [r7, r4, lsl #3]
					usb_rx_memory_needed++;
    19ec:	7013      	strb	r3, [r2, #0]
    19ee:	e7c2      	b.n	1976 <usb_isr+0x782>
    19f0:	2840      	cmp	r0, #64	; 0x40
    19f2:	4684      	mov	ip, r0
    19f4:	bf28      	it	cs
    19f6:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    19fa:	eb04 030c 	add.w	r3, r4, ip
    19fe:	ebcc 0000 	rsb	r0, ip, r0
    1a02:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1a06:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1a08:	2200      	movs	r2, #0
    1a0a:	f04f 0901 	mov.w	r9, #1
    1a0e:	e5d9      	b.n	15c4 <usb_isr+0x3d0>
    1a10:	1fff9498 	.word	0x1fff9498
    1a14:	1fff9490 	.word	0x1fff9490
    1a18:	1fff9474 	.word	0x1fff9474
    1a1c:	1fff9410 	.word	0x1fff9410
    1a20:	1fff9464 	.word	0x1fff9464
    1a24:	1fff949c 	.word	0x1fff949c
    1a28:	1fff9694 	.word	0x1fff9694
    1a2c:	1fff93bc 	.word	0x1fff93bc
    1a30:	1fff948d 	.word	0x1fff948d
    1a34:	400720d4 	.word	0x400720d4
    1a38:	00400088 	.word	0x00400088
    1a3c:	004000c8 	.word	0x004000c8
    1a40:	400720c0 	.word	0x400720c0
    1a44:	400720c4 	.word	0x400720c4
    1a48:	00003eb4 	.word	0x00003eb4

00001a4c <usb_init>:



void usb_init(void)
{
    1a4c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    1a50:	4c20      	ldr	r4, [pc, #128]	; (1ad4 <usb_init+0x88>)
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    1a52:	f000 fd81 	bl	2558 <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    1a56:	2200      	movs	r2, #0
    1a58:	f104 0088 	add.w	r0, r4, #136	; 0x88
	usb_init_serialnumber();
    1a5c:	4623      	mov	r3, r4
		table[i].desc = 0;
    1a5e:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    1a60:	605a      	str	r2, [r3, #4]
    1a62:	3308      	adds	r3, #8
	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
    1a64:	4283      	cmp	r3, r0
		table[i].desc = 0;
    1a66:	f04f 0100 	mov.w	r1, #0
	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
    1a6a:	d1f8      	bne.n	1a5e <usb_init+0x12>
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1a6c:	4a1a      	ldr	r2, [pc, #104]	; (1ad8 <usb_init+0x8c>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1a6e:	4f1b      	ldr	r7, [pc, #108]	; (1adc <usb_init+0x90>)
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1a70:	6813      	ldr	r3, [r2, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1a72:	4d1b      	ldr	r5, [pc, #108]	; (1ae0 <usb_init+0x94>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1a74:	481b      	ldr	r0, [pc, #108]	; (1ae4 <usb_init+0x98>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
	USB0_ERRSTAT = 0xFF;
	USB0_OTGISTAT = 0xFF;
    1a76:	4e1c      	ldr	r6, [pc, #112]	; (1ae8 <usb_init+0x9c>)
	USB0_ISTAT = 0xFF;
    1a78:	f8df 8078 	ldr.w	r8, [pc, #120]	; 1af4 <usb_init+0xa8>
	USB0_ERRSTAT = 0xFF;
    1a7c:	f8df c078 	ldr.w	ip, [pc, #120]	; 1af8 <usb_init+0xac>

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    1a80:	f8df 9078 	ldr.w	r9, [pc, #120]	; 1afc <usb_init+0xb0>
	USB0_USBCTRL = 0;
    1a84:	f8df e078 	ldr.w	lr, [pc, #120]	; 1b00 <usb_init+0xb4>
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1a88:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    1a8c:	6013      	str	r3, [r2, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1a8e:	f3c4 2307 	ubfx	r3, r4, #8, #8
    1a92:	703b      	strb	r3, [r7, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1a94:	f3c4 4307 	ubfx	r3, r4, #16, #8
    1a98:	702b      	strb	r3, [r5, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1a9a:	0e24      	lsrs	r4, r4, #24
	USB0_ISTAT = 0xFF;
    1a9c:	23ff      	movs	r3, #255	; 0xff
	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
	NVIC_ENABLE_IRQ(IRQ_USBOTG);

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1a9e:	f502 3228 	add.w	r2, r2, #172032	; 0x2a000
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1aa2:	7004      	strb	r4, [r0, #0]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1aa4:	4d11      	ldr	r5, [pc, #68]	; (1aec <usb_init+0xa0>)
	USB0_ISTAT = 0xFF;
    1aa6:	f888 3000 	strb.w	r3, [r8]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1aaa:	4811      	ldr	r0, [pc, #68]	; (1af0 <usb_init+0xa4>)
	USB0_ERRSTAT = 0xFF;
    1aac:	f88c 3000 	strb.w	r3, [ip]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1ab0:	32d4      	adds	r2, #212	; 0xd4
	USB0_OTGISTAT = 0xFF;
    1ab2:	7033      	strb	r3, [r6, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    1ab4:	2301      	movs	r3, #1
    1ab6:	f889 3000 	strb.w	r3, [r9]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1aba:	2670      	movs	r6, #112	; 0x70
	USB0_USBCTRL = 0;
    1abc:	f88e 1000 	strb.w	r1, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1ac0:	f44f 7400 	mov.w	r4, #512	; 0x200
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1ac4:	2110      	movs	r1, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    1ac6:	f807 3c18 	strb.w	r3, [r7, #-24]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1aca:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1acc:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1ace:	7011      	strb	r1, [r2, #0]
    1ad0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    1ad4:	1fff8000 	.word	0x1fff8000
    1ad8:	40048034 	.word	0x40048034
    1adc:	4007209c 	.word	0x4007209c
    1ae0:	400720b0 	.word	0x400720b0
    1ae4:	400720b4 	.word	0x400720b4
    1ae8:	40072010 	.word	0x40072010
    1aec:	e000e449 	.word	0xe000e449
    1af0:	e000e108 	.word	0xe000e108
    1af4:	40072080 	.word	0x40072080
    1af8:	40072088 	.word	0x40072088
    1afc:	40072094 	.word	0x40072094
    1b00:	40072100 	.word	0x40072100

00001b04 <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    1b04:	f000 b8a4 	b.w	1c50 <usb_serial_flush_input>

00001b08 <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    1b08:	f000 b87c 	b.w	1c04 <usb_serial_peekchar>

00001b0c <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    1b0c:	f000 b856 	b.w	1bbc <usb_serial_getchar>

00001b10 <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    1b10:	f000 b890 	b.w	1c34 <usb_serial_available>

00001b14 <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    1b14:	f000 b96c 	b.w	1df0 <usb_serial_flush_output>

00001b18 <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    1b18:	f000 b946 	b.w	1da8 <usb_serial_write_buffer_free>

00001b1c <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    1b1c:	4608      	mov	r0, r1
    1b1e:	4611      	mov	r1, r2
    1b20:	f000 b8b2 	b.w	1c88 <usb_serial_write>

00001b24 <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    1b24:	4608      	mov	r0, r1
    1b26:	f000 b933 	b.w	1d90 <usb_serial_putchar>
    1b2a:	bf00      	nop

00001b2c <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    1b2c:	4770      	bx	lr
    1b2e:	bf00      	nop

00001b30 <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    1b30:	b672      	cpsid	i
	avail = usb_buffer_available;
    1b32:	480d      	ldr	r0, [pc, #52]	; (1b68 <usb_malloc+0x38>)
    1b34:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    1b36:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    1b3a:	2b0b      	cmp	r3, #11
    1b3c:	dc10      	bgt.n	1b60 <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    1b3e:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1b42:	40d9      	lsrs	r1, r3
    1b44:	ea22 0201 	bic.w	r2, r2, r1
    1b48:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1b4a:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    1b4c:	4807      	ldr	r0, [pc, #28]	; (1b6c <usb_malloc+0x3c>)
    1b4e:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    1b52:	00db      	lsls	r3, r3, #3
    1b54:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    1b56:	2100      	movs	r1, #0
    1b58:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    1b5a:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    1b5c:	6051      	str	r1, [r2, #4]
}
    1b5e:	4770      	bx	lr
		__enable_irq();
    1b60:	b662      	cpsie	i
		return NULL;
    1b62:	2000      	movs	r0, #0
    1b64:	4770      	bx	lr
    1b66:	bf00      	nop
    1b68:	1fff8900 	.word	0x1fff8900
    1b6c:	1fff83bc 	.word	0x1fff83bc

00001b70 <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    1b70:	4b0d      	ldr	r3, [pc, #52]	; (1ba8 <usb_free+0x38>)
    1b72:	4a0e      	ldr	r2, [pc, #56]	; (1bac <usb_free+0x3c>)
    1b74:	1ac3      	subs	r3, r0, r3
    1b76:	fba2 2303 	umull	r2, r3, r2, r3
    1b7a:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    1b7c:	2b0b      	cmp	r3, #11
    1b7e:	d80c      	bhi.n	1b9a <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    1b80:	4a0b      	ldr	r2, [pc, #44]	; (1bb0 <usb_free+0x40>)
    1b82:	7812      	ldrb	r2, [r2, #0]
    1b84:	b952      	cbnz	r2, 1b9c <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    1b86:	b672      	cpsid	i
	usb_buffer_available |= mask;
    1b88:	480a      	ldr	r0, [pc, #40]	; (1bb4 <usb_free+0x44>)
    1b8a:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1b8e:	6802      	ldr	r2, [r0, #0]
    1b90:	fa21 f303 	lsr.w	r3, r1, r3
    1b94:	431a      	orrs	r2, r3
    1b96:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1b98:	b662      	cpsie	i
    1b9a:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    1b9c:	4a06      	ldr	r2, [pc, #24]	; (1bb8 <usb_free+0x48>)
    1b9e:	7812      	ldrb	r2, [r2, #0]
    1ba0:	2a00      	cmp	r2, #0
    1ba2:	d0f0      	beq.n	1b86 <usb_free+0x16>
		usb_rx_memory(p);
    1ba4:	f7ff baa2 	b.w	10ec <usb_rx_memory>
    1ba8:	1fff83bc 	.word	0x1fff83bc
    1bac:	38e38e39 	.word	0x38e38e39
    1bb0:	1fff948d 	.word	0x1fff948d
    1bb4:	1fff8900 	.word	0x1fff8900
    1bb8:	1fff9498 	.word	0x1fff9498

00001bbc <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    1bbc:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    1bbe:	4d0f      	ldr	r5, [pc, #60]	; (1bfc <usb_serial_getchar+0x40>)
    1bc0:	6828      	ldr	r0, [r5, #0]
    1bc2:	b178      	cbz	r0, 1be4 <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    1bc4:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    1bc6:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    1bc8:	18c1      	adds	r1, r0, r3
    1bca:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    1bcc:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    1bce:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    1bd0:	d202      	bcs.n	1bd8 <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    1bd2:	8043      	strh	r3, [r0, #2]
	}
	return c;
    1bd4:	4620      	mov	r0, r4
}
    1bd6:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    1bd8:	f7ff ffca 	bl	1b70 <usb_free>
		rx_packet = NULL;
    1bdc:	2300      	movs	r3, #0
	return c;
    1bde:	4620      	mov	r0, r4
		rx_packet = NULL;
    1be0:	602b      	str	r3, [r5, #0]
    1be2:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    1be4:	4b06      	ldr	r3, [pc, #24]	; (1c00 <usb_serial_getchar+0x44>)
    1be6:	781b      	ldrb	r3, [r3, #0]
    1be8:	b12b      	cbz	r3, 1bf6 <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1bea:	2003      	movs	r0, #3
    1bec:	f7ff fa4a 	bl	1084 <usb_rx>
    1bf0:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    1bf2:	2800      	cmp	r0, #0
    1bf4:	d1e6      	bne.n	1bc4 <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    1bf6:	f04f 30ff 	mov.w	r0, #4294967295
    1bfa:	bd38      	pop	{r3, r4, r5, pc}
    1bfc:	1fff94ac 	.word	0x1fff94ac
    1c00:	1fff9498 	.word	0x1fff9498

00001c04 <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    1c04:	b510      	push	{r4, lr}
	if (!rx_packet) {
    1c06:	4c09      	ldr	r4, [pc, #36]	; (1c2c <usb_serial_peekchar+0x28>)
    1c08:	6820      	ldr	r0, [r4, #0]
    1c0a:	b118      	cbz	r0, 1c14 <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    1c0c:	8843      	ldrh	r3, [r0, #2]
    1c0e:	4418      	add	r0, r3
    1c10:	7a00      	ldrb	r0, [r0, #8]
}
    1c12:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    1c14:	4b06      	ldr	r3, [pc, #24]	; (1c30 <usb_serial_peekchar+0x2c>)
    1c16:	781b      	ldrb	r3, [r3, #0]
    1c18:	b12b      	cbz	r3, 1c26 <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1c1a:	2003      	movs	r0, #3
    1c1c:	f7ff fa32 	bl	1084 <usb_rx>
    1c20:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    1c22:	2800      	cmp	r0, #0
    1c24:	d1f2      	bne.n	1c0c <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    1c26:	f04f 30ff 	mov.w	r0, #4294967295
    1c2a:	bd10      	pop	{r4, pc}
    1c2c:	1fff94ac 	.word	0x1fff94ac
    1c30:	1fff9498 	.word	0x1fff9498

00001c34 <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1c34:	4b04      	ldr	r3, [pc, #16]	; (1c48 <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    1c36:	4a05      	ldr	r2, [pc, #20]	; (1c4c <usb_serial_available+0x18>)
    1c38:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    1c3a:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1c3c:	b11b      	cbz	r3, 1c46 <usb_serial_available+0x12>
    1c3e:	881a      	ldrh	r2, [r3, #0]
    1c40:	885b      	ldrh	r3, [r3, #2]
    1c42:	1ad3      	subs	r3, r2, r3
    1c44:	4418      	add	r0, r3
	return count;
}
    1c46:	4770      	bx	lr
    1c48:	1fff94ac 	.word	0x1fff94ac
    1c4c:	1fff9694 	.word	0x1fff9694

00001c50 <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    1c50:	4b0b      	ldr	r3, [pc, #44]	; (1c80 <usb_serial_flush_input+0x30>)
    1c52:	781b      	ldrb	r3, [r3, #0]
    1c54:	b19b      	cbz	r3, 1c7e <usb_serial_flush_input+0x2e>
{
    1c56:	b510      	push	{r4, lr}
	if (rx_packet) {
    1c58:	4c0a      	ldr	r4, [pc, #40]	; (1c84 <usb_serial_flush_input+0x34>)
    1c5a:	6820      	ldr	r0, [r4, #0]
    1c5c:	b148      	cbz	r0, 1c72 <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    1c5e:	f7ff ff87 	bl	1b70 <usb_free>
		rx_packet = NULL;
    1c62:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    1c64:	2003      	movs	r0, #3
		rx_packet = NULL;
    1c66:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    1c68:	f7ff fa0c 	bl	1084 <usb_rx>
		if (!rx) break;
    1c6c:	b130      	cbz	r0, 1c7c <usb_serial_flush_input+0x2c>
		usb_free(rx);
    1c6e:	f7ff ff7f 	bl	1b70 <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    1c72:	2003      	movs	r0, #3
    1c74:	f7ff fa06 	bl	1084 <usb_rx>
		if (!rx) break;
    1c78:	2800      	cmp	r0, #0
    1c7a:	d1f8      	bne.n	1c6e <usb_serial_flush_input+0x1e>
    1c7c:	bd10      	pop	{r4, pc}
    1c7e:	4770      	bx	lr
    1c80:	1fff9498 	.word	0x1fff9498
    1c84:	1fff94ac 	.word	0x1fff94ac

00001c88 <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    1c88:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    1c8c:	f8df 90f8 	ldr.w	r9, [pc, #248]	; 1d88 <usb_serial_write+0x100>
{
    1c90:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    1c92:	2201      	movs	r2, #1
    1c94:	f889 2000 	strb.w	r2, [r9]
	while (size > 0) {
    1c98:	9101      	str	r1, [sp, #4]
    1c9a:	b369      	cbz	r1, 1cf8 <usb_serial_write+0x70>
    1c9c:	f8df 80ec 	ldr.w	r8, [pc, #236]	; 1d8c <usb_serial_write+0x104>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    1ca0:	4f36      	ldr	r7, [pc, #216]	; (1d7c <usb_serial_write+0xf4>)
	while (size > 0) {
    1ca2:	9e01      	ldr	r6, [sp, #4]
    1ca4:	4683      	mov	fp, r0
		if (!tx_packet) {
    1ca6:	f8d8 0000 	ldr.w	r0, [r8]
    1caa:	b3b0      	cbz	r0, 1d1a <usb_serial_write+0x92>
    1cac:	4d34      	ldr	r5, [pc, #208]	; (1d80 <usb_serial_write+0xf8>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    1cae:	8844      	ldrh	r4, [r0, #2]
    1cb0:	f1c4 0140 	rsb	r1, r4, #64	; 0x40
    1cb4:	42b1      	cmp	r1, r6
    1cb6:	bf28      	it	cs
    1cb8:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    1cba:	eb04 0e01 	add.w	lr, r4, r1
		transmit_previous_timeout = 0;
    1cbe:	2200      	movs	r2, #0
		tx_packet->index += len;
    1cc0:	fa1f fe8e 	uxth.w	lr, lr
		transmit_previous_timeout = 0;
    1cc4:	702a      	strb	r2, [r5, #0]
		size -= len;
    1cc6:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    1cc8:	f8a0 e002 	strh.w	lr, [r0, #2]
		dest = tx_packet->buf + tx_packet->index;
    1ccc:	f100 0208 	add.w	r2, r0, #8
		while (len-- > 0) *dest++ = *src++;
    1cd0:	b151      	cbz	r1, 1ce8 <usb_serial_write+0x60>
    1cd2:	3c01      	subs	r4, #1
    1cd4:	4422      	add	r2, r4
    1cd6:	4459      	add	r1, fp
    1cd8:	f81b 4b01 	ldrb.w	r4, [fp], #1
    1cdc:	f802 4f01 	strb.w	r4, [r2, #1]!
    1ce0:	458b      	cmp	fp, r1
    1ce2:	d1f9      	bne.n	1cd8 <usb_serial_write+0x50>
    1ce4:	f8b0 e002 	ldrh.w	lr, [r0, #2]
		if (tx_packet->index >= CDC_TX_SIZE) {
    1ce8:	f1be 0f3f 	cmp.w	lr, #63	; 0x3f
    1cec:	d80b      	bhi.n	1d06 <usb_serial_write+0x7e>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    1cee:	4a25      	ldr	r2, [pc, #148]	; (1d84 <usb_serial_write+0xfc>)
    1cf0:	2105      	movs	r1, #5
    1cf2:	7011      	strb	r1, [r2, #0]
	while (size > 0) {
    1cf4:	2e00      	cmp	r6, #0
    1cf6:	d1d6      	bne.n	1ca6 <usb_serial_write+0x1e>
	}
	tx_noautoflush = 0;
	return ret;
    1cf8:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    1cfa:	2300      	movs	r3, #0
    1cfc:	f889 3000 	strb.w	r3, [r9]
}
    1d00:	b003      	add	sp, #12
    1d02:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    1d06:	2240      	movs	r2, #64	; 0x40
    1d08:	8002      	strh	r2, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1d0a:	4601      	mov	r1, r0
    1d0c:	2004      	movs	r0, #4
    1d0e:	f7ff fa2f 	bl	1170 <usb_tx>
			tx_packet = NULL;
    1d12:	2200      	movs	r2, #0
    1d14:	f8c8 2000 	str.w	r2, [r8]
    1d18:	e7e9      	b.n	1cee <usb_serial_write+0x66>
				if (!usb_configuration) {
    1d1a:	783a      	ldrb	r2, [r7, #0]
    1d1c:	b32a      	cbz	r2, 1d6a <usb_serial_write+0xe2>
    1d1e:	4d18      	ldr	r5, [pc, #96]	; (1d80 <usb_serial_write+0xf8>)
    1d20:	f24d 04e9 	movw	r4, #53481	; 0xd0e9
					tx_noautoflush = 1;
    1d24:	f04f 0a01 	mov.w	sl, #1
    1d28:	e007      	b.n	1d3a <usb_serial_write+0xb2>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1d2a:	3c01      	subs	r4, #1
    1d2c:	d016      	beq.n	1d5c <usb_serial_write+0xd4>
    1d2e:	782a      	ldrb	r2, [r5, #0]
    1d30:	b9a2      	cbnz	r2, 1d5c <usb_serial_write+0xd4>
				yield();
    1d32:	f000 f8ad 	bl	1e90 <yield>
				if (!usb_configuration) {
    1d36:	783a      	ldrb	r2, [r7, #0]
    1d38:	b1ba      	cbz	r2, 1d6a <usb_serial_write+0xe2>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    1d3a:	2004      	movs	r0, #4
    1d3c:	f7ff f9c0 	bl	10c0 <usb_tx_packet_count>
    1d40:	2807      	cmp	r0, #7
    1d42:	d8f2      	bhi.n	1d2a <usb_serial_write+0xa2>
					tx_noautoflush = 1;
    1d44:	f889 a000 	strb.w	sl, [r9]
					tx_packet = usb_malloc();
    1d48:	f7ff fef2 	bl	1b30 <usb_malloc>
    1d4c:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    1d50:	2800      	cmp	r0, #0
    1d52:	d1ac      	bne.n	1cae <usb_serial_write+0x26>
					tx_noautoflush = 0;
    1d54:	4b0c      	ldr	r3, [pc, #48]	; (1d88 <usb_serial_write+0x100>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1d56:	3c01      	subs	r4, #1
					tx_noautoflush = 0;
    1d58:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1d5a:	d1e8      	bne.n	1d2e <usb_serial_write+0xa6>
					transmit_previous_timeout = 1;
    1d5c:	2301      	movs	r3, #1
					return -1;
    1d5e:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    1d62:	702b      	strb	r3, [r5, #0]
}
    1d64:	b003      	add	sp, #12
    1d66:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
					tx_noautoflush = 0;
    1d6a:	2300      	movs	r3, #0
					return -1;
    1d6c:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    1d70:	f889 3000 	strb.w	r3, [r9]
}
    1d74:	b003      	add	sp, #12
    1d76:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1d7a:	bf00      	nop
    1d7c:	1fff9498 	.word	0x1fff9498
    1d80:	1fff94a8 	.word	0x1fff94a8
    1d84:	1fff94a0 	.word	0x1fff94a0
    1d88:	1fff94a1 	.word	0x1fff94a1
    1d8c:	1fff94a4 	.word	0x1fff94a4

00001d90 <usb_serial_putchar>:
{
    1d90:	b500      	push	{lr}
    1d92:	b083      	sub	sp, #12
    1d94:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    1d96:	2101      	movs	r1, #1
{
    1d98:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    1d9c:	4618      	mov	r0, r3
    1d9e:	f7ff ff73 	bl	1c88 <usb_serial_write>
}
    1da2:	b003      	add	sp, #12
    1da4:	f85d fb04 	ldr.w	pc, [sp], #4

00001da8 <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    1da8:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    1daa:	4d0e      	ldr	r5, [pc, #56]	; (1de4 <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    1dac:	4c0e      	ldr	r4, [pc, #56]	; (1de8 <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    1dae:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    1db0:	2301      	movs	r3, #1
    1db2:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    1db4:	b128      	cbz	r0, 1dc2 <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    1db6:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    1db8:	2300      	movs	r3, #0
    1dba:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    1dbc:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    1dc0:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    1dc2:	4b0a      	ldr	r3, [pc, #40]	; (1dec <usb_serial_write_buffer_free+0x44>)
    1dc4:	781b      	ldrb	r3, [r3, #0]
    1dc6:	b913      	cbnz	r3, 1dce <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    1dc8:	2000      	movs	r0, #0
    1dca:	7020      	strb	r0, [r4, #0]
			return 0;
    1dcc:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1dce:	2004      	movs	r0, #4
    1dd0:	f7ff f976 	bl	10c0 <usb_tx_packet_count>
		if (!usb_configuration ||
    1dd4:	2807      	cmp	r0, #7
    1dd6:	d8f7      	bhi.n	1dc8 <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    1dd8:	f7ff feaa 	bl	1b30 <usb_malloc>
    1ddc:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1dde:	2800      	cmp	r0, #0
    1de0:	d1e9      	bne.n	1db6 <usb_serial_write_buffer_free+0xe>
    1de2:	e7f1      	b.n	1dc8 <usb_serial_write_buffer_free+0x20>
    1de4:	1fff94a4 	.word	0x1fff94a4
    1de8:	1fff94a1 	.word	0x1fff94a1
    1dec:	1fff9498 	.word	0x1fff9498

00001df0 <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    1df0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    1df2:	4b11      	ldr	r3, [pc, #68]	; (1e38 <usb_serial_flush_output+0x48>)
    1df4:	781b      	ldrb	r3, [r3, #0]
    1df6:	b18b      	cbz	r3, 1e1c <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    1df8:	4e10      	ldr	r6, [pc, #64]	; (1e3c <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    1dfa:	4d11      	ldr	r5, [pc, #68]	; (1e40 <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    1dfc:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    1dfe:	2701      	movs	r7, #1
    1e00:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    1e02:	b164      	cbz	r4, 1e1e <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    1e04:	4a0f      	ldr	r2, [pc, #60]	; (1e44 <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    1e06:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    1e08:	2700      	movs	r7, #0
    1e0a:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1e0c:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    1e0e:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1e10:	2004      	movs	r0, #4
    1e12:	f7ff f9ad 	bl	1170 <usb_tx>
		tx_packet = NULL;
    1e16:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    1e18:	2300      	movs	r3, #0
    1e1a:	702b      	strb	r3, [r5, #0]
    1e1c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    1e1e:	f7ff fe87 	bl	1b30 <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    1e22:	4b08      	ldr	r3, [pc, #32]	; (1e44 <usb_serial_flush_output+0x54>)
		if (tx) {
    1e24:	b128      	cbz	r0, 1e32 <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1e26:	4601      	mov	r1, r0
    1e28:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    1e2a:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    1e2c:	f7ff f9a0 	bl	1170 <usb_tx>
    1e30:	e7f2      	b.n	1e18 <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    1e32:	701f      	strb	r7, [r3, #0]
    1e34:	e7f0      	b.n	1e18 <usb_serial_flush_output+0x28>
    1e36:	bf00      	nop
    1e38:	1fff9498 	.word	0x1fff9498
    1e3c:	1fff94a4 	.word	0x1fff94a4
    1e40:	1fff94a1 	.word	0x1fff94a1
    1e44:	1fff94a0 	.word	0x1fff94a0

00001e48 <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    1e48:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    1e4a:	4b0e      	ldr	r3, [pc, #56]	; (1e84 <usb_serial_flush_callback+0x3c>)
    1e4c:	781b      	ldrb	r3, [r3, #0]
    1e4e:	b973      	cbnz	r3, 1e6e <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    1e50:	4c0d      	ldr	r4, [pc, #52]	; (1e88 <usb_serial_flush_callback+0x40>)
    1e52:	6821      	ldr	r1, [r4, #0]
    1e54:	b161      	cbz	r1, 1e70 <usb_serial_flush_callback+0x28>
    1e56:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    1e5a:	884b      	ldrh	r3, [r1, #2]
    1e5c:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1e5e:	2004      	movs	r0, #4
    1e60:	f7ff f986 	bl	1170 <usb_tx>
		tx_packet = NULL;
    1e64:	6025      	str	r5, [r4, #0]
    1e66:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    1e68:	4b08      	ldr	r3, [pc, #32]	; (1e8c <usb_serial_flush_callback+0x44>)
    1e6a:	2201      	movs	r2, #1
    1e6c:	701a      	strb	r2, [r3, #0]
    1e6e:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    1e70:	f7ff fe5e 	bl	1b30 <usb_malloc>
		if (tx) {
    1e74:	2800      	cmp	r0, #0
    1e76:	d0f7      	beq.n	1e68 <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1e78:	4601      	mov	r1, r0
		}
	}
}
    1e7a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    1e7e:	2004      	movs	r0, #4
    1e80:	f7ff b976 	b.w	1170 <usb_tx>
    1e84:	1fff94a1 	.word	0x1fff94a1
    1e88:	1fff94a4 	.word	0x1fff94a4
    1e8c:	1fff94a0 	.word	0x1fff94a0

00001e90 <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    1e90:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    1e92:	4c22      	ldr	r4, [pc, #136]	; (1f1c <yield+0x8c>)
    1e94:	7823      	ldrb	r3, [r4, #0]
    1e96:	b103      	cbz	r3, 1e9a <yield+0xa>
    1e98:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    1e9a:	2301      	movs	r3, #1
    1e9c:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    1e9e:	f7ff fec9 	bl	1c34 <usb_serial_available>
	if (Serial.available()) serialEvent();
    1ea2:	bb70      	cbnz	r0, 1f02 <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    1ea4:	f000 f9b0 	bl	2208 <serial_available>
	if (Serial1.available()) serialEvent1();
    1ea8:	bb40      	cbnz	r0, 1efc <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    1eaa:	f000 fa43 	bl	2334 <serial2_available>
	if (Serial2.available()) serialEvent2();
    1eae:	bb10      	cbnz	r0, 1ef6 <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    1eb0:	f000 fad6 	bl	2460 <serial3_available>
	if (Serial3.available()) serialEvent3();
    1eb4:	b9e0      	cbnz	r0, 1ef0 <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    1eb6:	2300      	movs	r3, #0
    1eb8:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    1eba:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    1ebe:	2b00      	cmp	r3, #0
    1ec0:	d1ea      	bne.n	1e98 <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    1ec2:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    1ec6:	b672      	cpsid	i
		EventResponder *first = firstYield;
    1ec8:	4b15      	ldr	r3, [pc, #84]	; (1f20 <yield+0x90>)
    1eca:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    1ecc:	b1e0      	cbz	r0, 1f08 <yield+0x78>
		if (runningFromYield) {
    1ece:	4c15      	ldr	r4, [pc, #84]	; (1f24 <yield+0x94>)
    1ed0:	7822      	ldrb	r2, [r4, #0]
    1ed2:	b9ca      	cbnz	r2, 1f08 <yield+0x78>
		firstYield = first->_next;
    1ed4:	6945      	ldr	r5, [r0, #20]
    1ed6:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    1ed8:	2301      	movs	r3, #1
    1eda:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    1edc:	b1c5      	cbz	r5, 1f10 <yield+0x80>
			firstYield->_prev = nullptr;
    1ede:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    1ee0:	b901      	cbnz	r1, 1ee4 <yield+0x54>
    1ee2:	b662      	cpsie	i
		first->_triggered = false;
    1ee4:	2500      	movs	r5, #0
    1ee6:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    1ee8:	6883      	ldr	r3, [r0, #8]
    1eea:	4798      	blx	r3
		runningFromYield = false;
    1eec:	7025      	strb	r5, [r4, #0]
    1eee:	e7d3      	b.n	1e98 <yield+0x8>
	if (Serial3.available()) serialEvent3();
    1ef0:	f000 f918 	bl	2124 <serialEvent3()>
    1ef4:	e7df      	b.n	1eb6 <yield+0x26>
	if (Serial2.available()) serialEvent2();
    1ef6:	f000 f913 	bl	2120 <serialEvent2()>
    1efa:	e7d9      	b.n	1eb0 <yield+0x20>
	if (Serial1.available()) serialEvent1();
    1efc:	f000 f90e 	bl	211c <serialEvent1()>
    1f00:	e7d3      	b.n	1eaa <yield+0x1a>
	if (Serial.available()) serialEvent();
    1f02:	f7ff fe13 	bl	1b2c <serialEvent()>
    1f06:	e7cd      	b.n	1ea4 <yield+0x14>
		if (doit) __enable_irq();
    1f08:	2900      	cmp	r1, #0
    1f0a:	d1c5      	bne.n	1e98 <yield+0x8>
    1f0c:	b662      	cpsie	i
    1f0e:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    1f10:	4b05      	ldr	r3, [pc, #20]	; (1f28 <yield+0x98>)
    1f12:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    1f14:	2900      	cmp	r1, #0
    1f16:	d1e5      	bne.n	1ee4 <yield+0x54>
    1f18:	e7e3      	b.n	1ee2 <yield+0x52>
    1f1a:	bf00      	nop
    1f1c:	1fff94b1 	.word	0x1fff94b1
    1f20:	1fff94c4 	.word	0x1fff94c4
    1f24:	1fff94c8 	.word	0x1fff94c8
    1f28:	1fff94c0 	.word	0x1fff94c0

00001f2c <EventResponder::triggerEventNotImmediate()>:
bool EventResponder::runningFromYield = false;

// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
    1f2c:	b410      	push	{r4}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    1f2e:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    1f32:	b672      	cpsid	i
	bool irq = disableInterrupts();
	if (_triggered == false) {
    1f34:	7f43      	ldrb	r3, [r0, #29]
    1f36:	b933      	cbnz	r3, 1f46 <EventResponder::triggerEventNotImmediate()+0x1a>
		// not already triggered
		if (_type == EventTypeYield) {
    1f38:	7f01      	ldrb	r1, [r0, #28]
    1f3a:	2901      	cmp	r1, #1
    1f3c:	d007      	beq.n	1f4e <EventResponder::triggerEventNotImmediate()+0x22>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    1f3e:	2903      	cmp	r1, #3
    1f40:	d00f      	beq.n	1f62 <EventResponder::triggerEventNotImmediate()+0x36>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    1f42:	2301      	movs	r3, #1
    1f44:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    1f46:	b902      	cbnz	r2, 1f4a <EventResponder::triggerEventNotImmediate()+0x1e>
    1f48:	b662      	cpsie	i
	}
	enableInterrupts(irq);
}
    1f4a:	bc10      	pop	{r4}
    1f4c:	4770      	bx	lr
			if (firstYield == nullptr) {
    1f4e:	4c12      	ldr	r4, [pc, #72]	; (1f98 <EventResponder::triggerEventNotImmediate()+0x6c>)
    1f50:	6821      	ldr	r1, [r4, #0]
    1f52:	b1a1      	cbz	r1, 1f7e <EventResponder::triggerEventNotImmediate()+0x52>
				_prev = lastYield;
    1f54:	4911      	ldr	r1, [pc, #68]	; (1f9c <EventResponder::triggerEventNotImmediate()+0x70>)
				_next = nullptr;
    1f56:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    1f58:	680b      	ldr	r3, [r1, #0]
    1f5a:	6183      	str	r3, [r0, #24]
				lastYield = this;
    1f5c:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    1f5e:	6158      	str	r0, [r3, #20]
    1f60:	e7ef      	b.n	1f42 <EventResponder::triggerEventNotImmediate()+0x16>
			if (firstInterrupt == nullptr) {
    1f62:	4c0f      	ldr	r4, [pc, #60]	; (1fa0 <EventResponder::triggerEventNotImmediate()+0x74>)
    1f64:	6821      	ldr	r1, [r4, #0]
    1f66:	b181      	cbz	r1, 1f8a <EventResponder::triggerEventNotImmediate()+0x5e>
				_prev = lastInterrupt;
    1f68:	490e      	ldr	r1, [pc, #56]	; (1fa4 <EventResponder::triggerEventNotImmediate()+0x78>)
				_next = nullptr;
    1f6a:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    1f6c:	680b      	ldr	r3, [r1, #0]
    1f6e:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    1f70:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    1f72:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    1f74:	4b0c      	ldr	r3, [pc, #48]	; (1fa8 <EventResponder::triggerEventNotImmediate()+0x7c>)
    1f76:	f04f 5180 	mov.w	r1, #268435456	; 0x10000000
    1f7a:	6019      	str	r1, [r3, #0]
    1f7c:	e7e1      	b.n	1f42 <EventResponder::triggerEventNotImmediate()+0x16>
				lastYield = this;
    1f7e:	4b07      	ldr	r3, [pc, #28]	; (1f9c <EventResponder::triggerEventNotImmediate()+0x70>)
				_next = nullptr;
    1f80:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    1f82:	6181      	str	r1, [r0, #24]
				firstYield = this;
    1f84:	6020      	str	r0, [r4, #0]
				lastYield = this;
    1f86:	6018      	str	r0, [r3, #0]
    1f88:	e7db      	b.n	1f42 <EventResponder::triggerEventNotImmediate()+0x16>
				lastInterrupt = this;
    1f8a:	4b06      	ldr	r3, [pc, #24]	; (1fa4 <EventResponder::triggerEventNotImmediate()+0x78>)
				_next = nullptr;
    1f8c:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    1f8e:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    1f90:	6020      	str	r0, [r4, #0]
				lastInterrupt = this;
    1f92:	6018      	str	r0, [r3, #0]
    1f94:	e7ee      	b.n	1f74 <EventResponder::triggerEventNotImmediate()+0x48>
    1f96:	bf00      	nop
    1f98:	1fff94c4 	.word	0x1fff94c4
    1f9c:	1fff94c0 	.word	0x1fff94c0
    1fa0:	1fff94b4 	.word	0x1fff94b4
    1fa4:	1fff94b8 	.word	0x1fff94b8
    1fa8:	e000ed04 	.word	0xe000ed04

00001fac <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    1fac:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    1fae:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    1fb0:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    1fb2:	2c02      	cmp	r4, #2
		_data = data;
    1fb4:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    1fb6:	d002      	beq.n	1fbe <EventResponder::triggerEvent(int, void*)+0x12>
	}
    1fb8:	bc10      	pop	{r4}
			triggerEventNotImmediate();
    1fba:	f7ff bfb7 	b.w	1f2c <EventResponder::triggerEventNotImmediate()>
			(*_function)(*this);
    1fbe:	6883      	ldr	r3, [r0, #8]
	}
    1fc0:	bc10      	pop	{r4}
			(*_function)(*this);
    1fc2:	4718      	bx	r3

00001fc4 <EventResponder::runFromInterrupt()>:
{
	EventResponder::runFromInterrupt();
}

void EventResponder::runFromInterrupt()
{
    1fc4:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    1fc6:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    1fca:	b672      	cpsid	i
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    1fcc:	4c0c      	ldr	r4, [pc, #48]	; (2000 <EventResponder::runFromInterrupt()+0x3c>)
    1fce:	6820      	ldr	r0, [r4, #0]
		if (first) {
    1fd0:	b180      	cbz	r0, 1ff4 <EventResponder::runFromInterrupt()+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    1fd2:	4e0c      	ldr	r6, [pc, #48]	; (2004 <EventResponder::runFromInterrupt()+0x40>)
				firstInterrupt->_prev = nullptr;
    1fd4:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    1fd6:	6943      	ldr	r3, [r0, #20]
    1fd8:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    1fda:	b173      	cbz	r3, 1ffa <EventResponder::runFromInterrupt()+0x36>
				firstInterrupt->_prev = nullptr;
    1fdc:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    1fde:	b902      	cbnz	r2, 1fe2 <EventResponder::runFromInterrupt()+0x1e>
    1fe0:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    1fe2:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    1fe4:	6883      	ldr	r3, [r0, #8]
    1fe6:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    1fe8:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    1fec:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    1fee:	6820      	ldr	r0, [r4, #0]
		if (first) {
    1ff0:	2800      	cmp	r0, #0
    1ff2:	d1f0      	bne.n	1fd6 <EventResponder::runFromInterrupt()+0x12>
		if (doit) __enable_irq();
    1ff4:	b902      	cbnz	r2, 1ff8 <EventResponder::runFromInterrupt()+0x34>
    1ff6:	b662      	cpsie	i
    1ff8:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    1ffa:	6033      	str	r3, [r6, #0]
    1ffc:	e7ef      	b.n	1fde <EventResponder::runFromInterrupt()+0x1a>
    1ffe:	bf00      	nop
    2000:	1fff94b4 	.word	0x1fff94b4
    2004:	1fff94b8 	.word	0x1fff94b8

00002008 <pendablesrvreq_isr>:
	EventResponder::runFromInterrupt();
    2008:	f7ff bfdc 	b.w	1fc4 <EventResponder::runFromInterrupt()>

0000200c <MillisTimer::addToActiveList()>:
	enableTimerInterrupt(irq);
}

void MillisTimer::addToActiveList() // only called by runFromTimer()
{
	if (listActive == nullptr) {
    200c:	4a18      	ldr	r2, [pc, #96]	; (2070 <MillisTimer::addToActiveList()+0x64>)
{
    200e:	b430      	push	{r4, r5}
	if (listActive == nullptr) {
    2010:	6814      	ldr	r4, [r2, #0]
    2012:	2c00      	cmp	r4, #0
    2014:	d027      	beq.n	2066 <MillisTimer::addToActiveList()+0x5a>
		// list is empty, easy case
		_next = nullptr;
		_prev = nullptr;
		listActive = this;
	} else if (_ms < listActive->_ms) {
    2016:	6803      	ldr	r3, [r0, #0]
    2018:	6821      	ldr	r1, [r4, #0]
    201a:	428b      	cmp	r3, r1
    201c:	d20e      	bcs.n	203c <MillisTimer::addToActiveList()+0x30>
		// this timer triggers before any on the list
		_next = listActive;
		_prev = nullptr;
		listActive->_prev = this;
		// Decrement the next items wait time be our wait time as to properly handle waits for all other items...
		listActive->_ms -= _ms;	
    201e:	1acb      	subs	r3, r1, r3
		_prev = nullptr;
    2020:	2100      	movs	r1, #0
		_next = listActive;
    2022:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2024:	60c1      	str	r1, [r0, #12]
		listActive->_ms -= _ms;	
    2026:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    2028:	60e0      	str	r0, [r4, #12]
		listActive = this;
    202a:	6010      	str	r0, [r2, #0]
		_ms -= timer->_ms;
		_next = nullptr;
		_prev = timer;
		timer->_next = this;
	}
	_state = TimerActive;
    202c:	2302      	movs	r3, #2
    202e:	7503      	strb	r3, [r0, #20]
}
    2030:	bc30      	pop	{r4, r5}
    2032:	4770      	bx	lr
			if (_ms < timer->_ms) {
    2034:	6811      	ldr	r1, [r2, #0]
    2036:	428b      	cmp	r3, r1
    2038:	4614      	mov	r4, r2
    203a:	d308      	bcc.n	204e <MillisTimer::addToActiveList()+0x42>
		while (timer->_next) {
    203c:	68a2      	ldr	r2, [r4, #8]
		_ms -= timer->_ms;
    203e:	1a5b      	subs	r3, r3, r1
    2040:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    2042:	2a00      	cmp	r2, #0
    2044:	d1f6      	bne.n	2034 <MillisTimer::addToActiveList()+0x28>
		_next = nullptr;
    2046:	6082      	str	r2, [r0, #8]
		_prev = timer;
    2048:	60c4      	str	r4, [r0, #12]
		timer->_next = this;
    204a:	60a0      	str	r0, [r4, #8]
    204c:	e7ee      	b.n	202c <MillisTimer::addToActiveList()+0x20>
				_prev = timer->_prev;
    204e:	68d2      	ldr	r2, [r2, #12]
    2050:	60c2      	str	r2, [r0, #12]
				_next = timer;
    2052:	6084      	str	r4, [r0, #8]
				timer->_prev = this;
    2054:	60e0      	str	r0, [r4, #12]
				_prev->_next = this;
    2056:	68c5      	ldr	r5, [r0, #12]
				timer->_ms -= _ms;
    2058:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    205a:	2202      	movs	r2, #2
				_prev->_next = this;
    205c:	60a8      	str	r0, [r5, #8]
				timer->_ms -= _ms;
    205e:	6023      	str	r3, [r4, #0]
				_state = TimerActive;
    2060:	7502      	strb	r2, [r0, #20]
}
    2062:	bc30      	pop	{r4, r5}
    2064:	4770      	bx	lr
		_next = nullptr;
    2066:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2068:	60c4      	str	r4, [r0, #12]
		listActive = this;
    206a:	6010      	str	r0, [r2, #0]
    206c:	e7de      	b.n	202c <MillisTimer::addToActiveList()+0x20>
    206e:	bf00      	nop
    2070:	1fff94bc 	.word	0x1fff94bc

00002074 <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    2074:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	MillisTimer *timer = listActive;
    2076:	4e22      	ldr	r6, [pc, #136]	; (2100 <MillisTimer::runFromTimer()+0x8c>)
    2078:	6834      	ldr	r4, [r6, #0]
	while (timer) {
    207a:	b32c      	cbz	r4, 20c8 <MillisTimer::runFromTimer()+0x54>
		if (timer->_ms > 0) {
    207c:	6823      	ldr	r3, [r4, #0]
    207e:	2b00      	cmp	r3, #0
    2080:	d13a      	bne.n	20f8 <MillisTimer::runFromTimer()+0x84>
    2082:	4f20      	ldr	r7, [pc, #128]	; (2104 <MillisTimer::runFromTimer()+0x90>)
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    2084:	461d      	mov	r5, r3
    2086:	e004      	b.n	2092 <MillisTimer::runFromTimer()+0x1e>
			event.triggerEvent(0, timer);
			if (timer->_reload) {
				timer->_ms = timer->_reload;
				timer->addToActiveList();
			}
			timer = listActive;
    2088:	6834      	ldr	r4, [r6, #0]
	while (timer) {
    208a:	b1ec      	cbz	r4, 20c8 <MillisTimer::runFromTimer()+0x54>
		if (timer->_ms > 0) {
    208c:	6823      	ldr	r3, [r4, #0]
    208e:	2b00      	cmp	r3, #0
    2090:	d132      	bne.n	20f8 <MillisTimer::runFromTimer()+0x84>
			MillisTimer *next = timer->_next;
    2092:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    2094:	b103      	cbz	r3, 2098 <MillisTimer::runFromTimer()+0x24>
    2096:	60dd      	str	r5, [r3, #12]
			EventResponderRef event = *(timer->_event);
    2098:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    209a:	6033      	str	r3, [r6, #0]
			event.triggerEvent(0, timer);
    209c:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    209e:	7525      	strb	r5, [r4, #20]
			event.triggerEvent(0, timer);
    20a0:	681b      	ldr	r3, [r3, #0]
    20a2:	42bb      	cmp	r3, r7
    20a4:	d121      	bne.n	20ea <MillisTimer::runFromTimer()+0x76>
		if (_type == EventTypeImmediate) {
    20a6:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    20a8:	6045      	str	r5, [r0, #4]
		if (_type == EventTypeImmediate) {
    20aa:	2b02      	cmp	r3, #2
		_data = data;
    20ac:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    20ae:	d020      	beq.n	20f2 <MillisTimer::runFromTimer()+0x7e>
			triggerEventNotImmediate();
    20b0:	f7ff ff3c 	bl	1f2c <EventResponder::triggerEventNotImmediate()>
			if (timer->_reload) {
    20b4:	6863      	ldr	r3, [r4, #4]
    20b6:	2b00      	cmp	r3, #0
    20b8:	d0e6      	beq.n	2088 <MillisTimer::runFromTimer()+0x14>
				timer->_ms = timer->_reload;
    20ba:	6023      	str	r3, [r4, #0]
				timer->addToActiveList();
    20bc:	4620      	mov	r0, r4
    20be:	f7ff ffa5 	bl	200c <MillisTimer::addToActiveList()>
			timer = listActive;
    20c2:	6834      	ldr	r4, [r6, #0]
	while (timer) {
    20c4:	2c00      	cmp	r4, #0
    20c6:	d1e1      	bne.n	208c <MillisTimer::runFromTimer()+0x18>
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    20c8:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    20cc:	b672      	cpsid	i
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    20ce:	4a0e      	ldr	r2, [pc, #56]	; (2108 <MillisTimer::runFromTimer()+0x94>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    20d0:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    20d2:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    20d4:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    20d6:	b903      	cbnz	r3, 20da <MillisTimer::runFromTimer()+0x66>
    20d8:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    20da:	b128      	cbz	r0, 20e8 <MillisTimer::runFromTimer()+0x74>
		MillisTimer *next = waiting->_next;
    20dc:	6884      	ldr	r4, [r0, #8]
		waiting->addToActiveList();
    20de:	f7ff ff95 	bl	200c <MillisTimer::addToActiveList()>
	while (waiting) {
    20e2:	4620      	mov	r0, r4
    20e4:	2800      	cmp	r0, #0
    20e6:	d1f9      	bne.n	20dc <MillisTimer::runFromTimer()+0x68>
    20e8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
			event.triggerEvent(0, timer);
    20ea:	4622      	mov	r2, r4
    20ec:	2100      	movs	r1, #0
    20ee:	4798      	blx	r3
    20f0:	e7e0      	b.n	20b4 <MillisTimer::runFromTimer()+0x40>
			(*_function)(*this);
    20f2:	6883      	ldr	r3, [r0, #8]
    20f4:	4798      	blx	r3
    20f6:	e7dd      	b.n	20b4 <MillisTimer::runFromTimer()+0x40>
			timer->_ms--;
    20f8:	3b01      	subs	r3, #1
    20fa:	6023      	str	r3, [r4, #0]
			break;
    20fc:	e7e4      	b.n	20c8 <MillisTimer::runFromTimer()+0x54>
    20fe:	bf00      	nop
    2100:	1fff94bc 	.word	0x1fff94bc
    2104:	00001fad 	.word	0x00001fad
    2108:	1fff94cc 	.word	0x1fff94cc

0000210c <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    210c:	4a02      	ldr	r2, [pc, #8]	; (2118 <systick_isr+0xc>)
    210e:	6813      	ldr	r3, [r2, #0]
    2110:	3301      	adds	r3, #1
    2112:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    2114:	f7ff bfae 	b.w	2074 <MillisTimer::runFromTimer()>
    2118:	1fff93b4 	.word	0x1fff93b4

0000211c <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    211c:	4770      	bx	lr
    211e:	bf00      	nop

00002120 <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    2120:	4770      	bx	lr
    2122:	bf00      	nop

00002124 <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    2124:	4770      	bx	lr
    2126:	bf00      	nop

00002128 <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    2128:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    212a:	4829      	ldr	r0, [pc, #164]	; (21d0 <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    212c:	4a29      	ldr	r2, [pc, #164]	; (21d4 <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    212e:	4b2a      	ldr	r3, [pc, #168]	; (21d8 <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2130:	4d2a      	ldr	r5, [pc, #168]	; (21dc <analog_init+0xb4>)
	VREF_TRM = 0x60;
    2132:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2134:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    2136:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2138:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    213a:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    213c:	4c28      	ldr	r4, [pc, #160]	; (21e0 <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    213e:	2b08      	cmp	r3, #8
    2140:	d030      	beq.n	21a4 <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    2142:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2144:	4827      	ldr	r0, [pc, #156]	; (21e4 <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2146:	4928      	ldr	r1, [pc, #160]	; (21e8 <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    2148:	d037      	beq.n	21ba <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    214a:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    214c:	bf0c      	ite	eq
    214e:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2150:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2152:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2154:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2156:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2158:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    215a:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    215c:	4b23      	ldr	r3, [pc, #140]	; (21ec <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    215e:	4924      	ldr	r1, [pc, #144]	; (21f0 <analog_init+0xc8>)
	if (analog_reference_internal) {
    2160:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2162:	4a24      	ldr	r2, [pc, #144]	; (21f4 <analog_init+0xcc>)
	if (analog_reference_internal) {
    2164:	b1bb      	cbz	r3, 2196 <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2166:	2301      	movs	r3, #1
    2168:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    216a:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    216c:	4b22      	ldr	r3, [pc, #136]	; (21f8 <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    216e:	4923      	ldr	r1, [pc, #140]	; (21fc <analog_init+0xd4>)
	num = analog_num_average;
    2170:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2172:	4a23      	ldr	r2, [pc, #140]	; (2200 <analog_init+0xd8>)
	if (num <= 1) {
    2174:	2b01      	cmp	r3, #1
    2176:	d926      	bls.n	21c6 <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    2178:	2b04      	cmp	r3, #4
    217a:	d90f      	bls.n	219c <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    217c:	2b08      	cmp	r3, #8
    217e:	d91e      	bls.n	21be <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    2180:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    2182:	bf94      	ite	ls
    2184:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2186:	2387      	movhi	r3, #135	; 0x87
    2188:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    218a:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    218c:	4b1d      	ldr	r3, [pc, #116]	; (2204 <analog_init+0xdc>)
    218e:	2201      	movs	r2, #1
    2190:	701a      	strb	r2, [r3, #0]
}
    2192:	bc30      	pop	{r4, r5}
    2194:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2196:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2198:	6013      	str	r3, [r2, #0]
    219a:	e7e7      	b.n	216c <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    219c:	2384      	movs	r3, #132	; 0x84
    219e:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    21a0:	6013      	str	r3, [r2, #0]
    21a2:	e7f3      	b.n	218c <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    21a4:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    21a8:	490f      	ldr	r1, [pc, #60]	; (21e8 <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    21aa:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    21ac:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    21ae:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    21b0:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    21b2:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    21b4:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    21b6:	600b      	str	r3, [r1, #0]
    21b8:	e7d0      	b.n	215c <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    21ba:	2239      	movs	r2, #57	; 0x39
    21bc:	e7f7      	b.n	21ae <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    21be:	2385      	movs	r3, #133	; 0x85
    21c0:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    21c2:	6013      	str	r3, [r2, #0]
    21c4:	e7e2      	b.n	218c <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    21c6:	2380      	movs	r3, #128	; 0x80
    21c8:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    21ca:	6013      	str	r3, [r2, #0]
    21cc:	e7de      	b.n	218c <analog_init+0x64>
    21ce:	bf00      	nop
    21d0:	40074000 	.word	0x40074000
    21d4:	40074001 	.word	0x40074001
    21d8:	1fff8904 	.word	0x1fff8904
    21dc:	4003b008 	.word	0x4003b008
    21e0:	4003b00c 	.word	0x4003b00c
    21e4:	400bb008 	.word	0x400bb008
    21e8:	400bb00c 	.word	0x400bb00c
    21ec:	1fff94d1 	.word	0x1fff94d1
    21f0:	4003b020 	.word	0x4003b020
    21f4:	400bb020 	.word	0x400bb020
    21f8:	1fff8905 	.word	0x1fff8905
    21fc:	4003b024 	.word	0x4003b024
    2200:	400bb024 	.word	0x400bb024
    2204:	1fff94d0 	.word	0x1fff94d0

00002208 <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2208:	4a05      	ldr	r2, [pc, #20]	; (2220 <serial_available+0x18>)
	tail = rx_buffer_tail;
    220a:	4b06      	ldr	r3, [pc, #24]	; (2224 <serial_available+0x1c>)
	head = rx_buffer_head;
    220c:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    220e:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2210:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2212:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2214:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    2216:	bf38      	it	cc
    2218:	3040      	addcc	r0, #64	; 0x40
    221a:	1ac0      	subs	r0, r0, r3
}
    221c:	4770      	bx	lr
    221e:	bf00      	nop
    2220:	1fff94d8 	.word	0x1fff94d8
    2224:	1fff94d9 	.word	0x1fff94d9

00002228 <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    2228:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    222a:	4b38      	ldr	r3, [pc, #224]	; (230c <uart0_status_isr+0xe4>)
    222c:	791a      	ldrb	r2, [r3, #4]
    222e:	f012 0f30 	tst.w	r2, #48	; 0x30
    2232:	d02c      	beq.n	228e <uart0_status_isr+0x66>
		__disable_irq();
    2234:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    2236:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2238:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    223c:	2900      	cmp	r1, #0
    223e:	d03d      	beq.n	22bc <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2240:	b662      	cpsie	i
			head = rx_buffer_head;
    2242:	4f33      	ldr	r7, [pc, #204]	; (2310 <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2244:	4933      	ldr	r1, [pc, #204]	; (2314 <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    2246:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2248:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    224a:	4e33      	ldr	r6, [pc, #204]	; (2318 <uart0_status_isr+0xf0>)
					n = UART0_D;
    224c:	461c      	mov	r4, r3
			head = rx_buffer_head;
    224e:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2250:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2252:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2254:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    2256:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2258:	bf28      	it	cs
    225a:	2300      	movcs	r3, #0
				if (newhead != tail) {
    225c:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    225e:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    2262:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2264:	bf1c      	itt	ne
    2266:	54f1      	strbne	r1, [r6, r3]
    2268:	4618      	movne	r0, r3
			} while (--avail > 0);
    226a:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    226e:	d1f0      	bne.n	2252 <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2270:	4b2a      	ldr	r3, [pc, #168]	; (231c <uart0_status_isr+0xf4>)
    2272:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2274:	b2c2      	uxtb	r2, r0
    2276:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2278:	b14b      	cbz	r3, 228e <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    227a:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    227c:	bf36      	itet	cc
    227e:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2282:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2284:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2286:	2827      	cmp	r0, #39	; 0x27
    2288:	bfc4      	itt	gt
    228a:	2201      	movgt	r2, #1
    228c:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    228e:	491f      	ldr	r1, [pc, #124]	; (230c <uart0_status_isr+0xe4>)
    2290:	78ca      	ldrb	r2, [r1, #3]
    2292:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2294:	0615      	lsls	r5, r2, #24
    2296:	d416      	bmi.n	22c6 <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    2298:	0652      	lsls	r2, r2, #25
    229a:	d50d      	bpl.n	22b8 <uart0_status_isr+0x90>
    229c:	4b1b      	ldr	r3, [pc, #108]	; (230c <uart0_status_isr+0xe4>)
    229e:	791b      	ldrb	r3, [r3, #4]
    22a0:	065b      	lsls	r3, r3, #25
    22a2:	d509      	bpl.n	22b8 <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    22a4:	4b1e      	ldr	r3, [pc, #120]	; (2320 <uart0_status_isr+0xf8>)
		transmitting = 0;
    22a6:	491f      	ldr	r1, [pc, #124]	; (2324 <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    22a8:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    22aa:	2200      	movs	r2, #0
    22ac:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    22ae:	b103      	cbz	r3, 22b2 <uart0_status_isr+0x8a>
    22b0:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    22b2:	4b16      	ldr	r3, [pc, #88]	; (230c <uart0_status_isr+0xe4>)
    22b4:	223c      	movs	r2, #60	; 0x3c
    22b6:	70da      	strb	r2, [r3, #3]
	}
}
    22b8:	bcf0      	pop	{r4, r5, r6, r7}
    22ba:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    22bc:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    22be:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    22c0:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    22c2:	b662      	cpsie	i
    22c4:	e7e3      	b.n	228e <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    22c6:	790b      	ldrb	r3, [r1, #4]
    22c8:	061c      	lsls	r4, r3, #24
    22ca:	d5e5      	bpl.n	2298 <uart0_status_isr+0x70>
		head = tx_buffer_head;
    22cc:	4b16      	ldr	r3, [pc, #88]	; (2328 <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    22ce:	4e17      	ldr	r6, [pc, #92]	; (232c <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    22d0:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    22d2:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    22d4:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    22d6:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    22d8:	429c      	cmp	r4, r3
    22da:	d00e      	beq.n	22fa <uart0_status_isr+0xd2>
    22dc:	4d14      	ldr	r5, [pc, #80]	; (2330 <uart0_status_isr+0x108>)
    22de:	e001      	b.n	22e4 <uart0_status_isr+0xbc>
    22e0:	42a3      	cmp	r3, r4
    22e2:	d00a      	beq.n	22fa <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    22e4:	3301      	adds	r3, #1
    22e6:	2b40      	cmp	r3, #64	; 0x40
    22e8:	bf28      	it	cs
    22ea:	2300      	movcs	r3, #0
			avail = UART0_S1;
    22ec:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    22ee:	5ce8      	ldrb	r0, [r5, r3]
    22f0:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    22f2:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    22f4:	7d08      	ldrb	r0, [r1, #20]
    22f6:	2807      	cmp	r0, #7
    22f8:	d9f2      	bls.n	22e0 <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    22fa:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    22fc:	4903      	ldr	r1, [pc, #12]	; (230c <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    22fe:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    2300:	790b      	ldrb	r3, [r1, #4]
    2302:	0618      	lsls	r0, r3, #24
    2304:	bf44      	itt	mi
    2306:	237c      	movmi	r3, #124	; 0x7c
    2308:	70cb      	strbmi	r3, [r1, #3]
    230a:	e7c5      	b.n	2298 <uart0_status_isr+0x70>
    230c:	4006a000 	.word	0x4006a000
    2310:	1fff94d8 	.word	0x1fff94d8
    2314:	1fff94d9 	.word	0x1fff94d9
    2318:	1fff951c 	.word	0x1fff951c
    231c:	1fff94d4 	.word	0x1fff94d4
    2320:	1fff9560 	.word	0x1fff9560
    2324:	1fff955c 	.word	0x1fff955c
    2328:	1fff9564 	.word	0x1fff9564
    232c:	1fff955d 	.word	0x1fff955d
    2330:	1fff94dc 	.word	0x1fff94dc

00002334 <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2334:	4a05      	ldr	r2, [pc, #20]	; (234c <serial2_available+0x18>)
	tail = rx_buffer_tail;
    2336:	4b06      	ldr	r3, [pc, #24]	; (2350 <serial2_available+0x1c>)
	head = rx_buffer_head;
    2338:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    233a:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    233c:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    233e:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2340:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    2342:	bf38      	it	cc
    2344:	3040      	addcc	r0, #64	; 0x40
    2346:	1ac0      	subs	r0, r0, r3
}
    2348:	4770      	bx	lr
    234a:	bf00      	nop
    234c:	1fff95d8 	.word	0x1fff95d8
    2350:	1fff956d 	.word	0x1fff956d

00002354 <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    2354:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    2356:	4b38      	ldr	r3, [pc, #224]	; (2438 <uart1_status_isr+0xe4>)
    2358:	791a      	ldrb	r2, [r3, #4]
    235a:	f012 0f30 	tst.w	r2, #48	; 0x30
    235e:	d02c      	beq.n	23ba <uart1_status_isr+0x66>
		__disable_irq();
    2360:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    2362:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2364:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2368:	2900      	cmp	r1, #0
    236a:	d03d      	beq.n	23e8 <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    236c:	b662      	cpsie	i
			head = rx_buffer_head;
    236e:	4f33      	ldr	r7, [pc, #204]	; (243c <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2370:	4933      	ldr	r1, [pc, #204]	; (2440 <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    2372:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2374:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2376:	4e33      	ldr	r6, [pc, #204]	; (2444 <uart1_status_isr+0xf0>)
					n = UART1_D;
    2378:	461c      	mov	r4, r3
			head = rx_buffer_head;
    237a:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    237c:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    237e:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2380:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    2382:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2384:	bf28      	it	cs
    2386:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2388:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    238a:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    238e:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2390:	bf1c      	itt	ne
    2392:	54f1      	strbne	r1, [r6, r3]
    2394:	4618      	movne	r0, r3
			} while (--avail > 0);
    2396:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    239a:	d1f0      	bne.n	237e <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    239c:	4b2a      	ldr	r3, [pc, #168]	; (2448 <uart1_status_isr+0xf4>)
    239e:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    23a0:	b2c2      	uxtb	r2, r0
    23a2:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    23a4:	b14b      	cbz	r3, 23ba <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    23a6:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    23a8:	bf36      	itet	cc
    23aa:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    23ae:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    23b0:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    23b2:	2827      	cmp	r0, #39	; 0x27
    23b4:	bfc4      	itt	gt
    23b6:	2201      	movgt	r2, #1
    23b8:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    23ba:	491f      	ldr	r1, [pc, #124]	; (2438 <uart1_status_isr+0xe4>)
    23bc:	78ca      	ldrb	r2, [r1, #3]
    23be:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    23c0:	0615      	lsls	r5, r2, #24
    23c2:	d416      	bmi.n	23f2 <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    23c4:	0652      	lsls	r2, r2, #25
    23c6:	d50d      	bpl.n	23e4 <uart1_status_isr+0x90>
    23c8:	4b1b      	ldr	r3, [pc, #108]	; (2438 <uart1_status_isr+0xe4>)
    23ca:	791b      	ldrb	r3, [r3, #4]
    23cc:	065b      	lsls	r3, r3, #25
    23ce:	d509      	bpl.n	23e4 <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    23d0:	4b1e      	ldr	r3, [pc, #120]	; (244c <uart1_status_isr+0xf8>)
		transmitting = 0;
    23d2:	491f      	ldr	r1, [pc, #124]	; (2450 <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    23d4:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    23d6:	2200      	movs	r2, #0
    23d8:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    23da:	b103      	cbz	r3, 23de <uart1_status_isr+0x8a>
    23dc:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    23de:	4b16      	ldr	r3, [pc, #88]	; (2438 <uart1_status_isr+0xe4>)
    23e0:	223c      	movs	r2, #60	; 0x3c
    23e2:	70da      	strb	r2, [r3, #3]
	}
}
    23e4:	bcf0      	pop	{r4, r5, r6, r7}
    23e6:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    23e8:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    23ea:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    23ec:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    23ee:	b662      	cpsie	i
    23f0:	e7e3      	b.n	23ba <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    23f2:	790b      	ldrb	r3, [r1, #4]
    23f4:	061c      	lsls	r4, r3, #24
    23f6:	d5e5      	bpl.n	23c4 <uart1_status_isr+0x70>
		head = tx_buffer_head;
    23f8:	4b16      	ldr	r3, [pc, #88]	; (2454 <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    23fa:	4e17      	ldr	r6, [pc, #92]	; (2458 <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    23fc:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    23fe:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2400:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    2402:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    2404:	429c      	cmp	r4, r3
    2406:	d00e      	beq.n	2426 <uart1_status_isr+0xd2>
    2408:	4d14      	ldr	r5, [pc, #80]	; (245c <uart1_status_isr+0x108>)
    240a:	e001      	b.n	2410 <uart1_status_isr+0xbc>
    240c:	42a3      	cmp	r3, r4
    240e:	d00a      	beq.n	2426 <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    2410:	3301      	adds	r3, #1
    2412:	2b28      	cmp	r3, #40	; 0x28
    2414:	bf28      	it	cs
    2416:	2300      	movcs	r3, #0
			avail = UART1_S1;
    2418:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    241a:	5ce8      	ldrb	r0, [r5, r3]
    241c:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    241e:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    2420:	7d08      	ldrb	r0, [r1, #20]
    2422:	2807      	cmp	r0, #7
    2424:	d9f2      	bls.n	240c <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    2426:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    2428:	4903      	ldr	r1, [pc, #12]	; (2438 <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    242a:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    242c:	790b      	ldrb	r3, [r1, #4]
    242e:	0618      	lsls	r0, r3, #24
    2430:	bf44      	itt	mi
    2432:	237c      	movmi	r3, #124	; 0x7c
    2434:	70cb      	strbmi	r3, [r1, #3]
    2436:	e7c5      	b.n	23c4 <uart1_status_isr+0x70>
    2438:	4006b000 	.word	0x4006b000
    243c:	1fff95d8 	.word	0x1fff95d8
    2440:	1fff956d 	.word	0x1fff956d
    2444:	1fff9598 	.word	0x1fff9598
    2448:	1fff9568 	.word	0x1fff9568
    244c:	1fff95dc 	.word	0x1fff95dc
    2450:	1fff956c 	.word	0x1fff956c
    2454:	1fff95e0 	.word	0x1fff95e0
    2458:	1fff95d9 	.word	0x1fff95d9
    245c:	1fff9570 	.word	0x1fff9570

00002460 <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2460:	4a05      	ldr	r2, [pc, #20]	; (2478 <serial3_available+0x18>)
	tail = rx_buffer_tail;
    2462:	4b06      	ldr	r3, [pc, #24]	; (247c <serial3_available+0x1c>)
	head = rx_buffer_head;
    2464:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2466:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2468:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    246a:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    246c:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    246e:	bf38      	it	cc
    2470:	3040      	addcc	r0, #64	; 0x40
    2472:	1ac0      	subs	r0, r0, r3
}
    2474:	4770      	bx	lr
    2476:	bf00      	nop
    2478:	1fff95e8 	.word	0x1fff95e8
    247c:	1fff95e9 	.word	0x1fff95e9

00002480 <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    2480:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    2482:	4b2b      	ldr	r3, [pc, #172]	; (2530 <uart2_status_isr+0xb0>)
    2484:	791a      	ldrb	r2, [r3, #4]
    2486:	0694      	lsls	r4, r2, #26
    2488:	d51f      	bpl.n	24ca <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    248a:	482a      	ldr	r0, [pc, #168]	; (2534 <uart2_status_isr+0xb4>)
			n = UART2_D;
    248c:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    248e:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    2490:	4929      	ldr	r1, [pc, #164]	; (2538 <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    2492:	3301      	adds	r3, #1
    2494:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    2496:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    2498:	bfc8      	it	gt
    249a:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    249c:	428b      	cmp	r3, r1
			n = UART2_D;
    249e:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    24a0:	d003      	beq.n	24aa <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    24a2:	4c26      	ldr	r4, [pc, #152]	; (253c <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    24a4:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    24a6:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    24a8:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    24aa:	4a25      	ldr	r2, [pc, #148]	; (2540 <uart2_status_isr+0xc0>)
    24ac:	6811      	ldr	r1, [r2, #0]
    24ae:	b161      	cbz	r1, 24ca <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    24b0:	4a24      	ldr	r2, [pc, #144]	; (2544 <uart2_status_isr+0xc4>)
    24b2:	7812      	ldrb	r2, [r2, #0]
    24b4:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    24b6:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    24b8:	bf36      	itet	cc
    24ba:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    24be:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    24c0:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    24c2:	2b27      	cmp	r3, #39	; 0x27
    24c4:	bfc4      	itt	gt
    24c6:	2301      	movgt	r3, #1
    24c8:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    24ca:	4a19      	ldr	r2, [pc, #100]	; (2530 <uart2_status_isr+0xb0>)
    24cc:	78d3      	ldrb	r3, [r2, #3]
    24ce:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    24d0:	0618      	lsls	r0, r3, #24
    24d2:	d411      	bmi.n	24f8 <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    24d4:	065a      	lsls	r2, r3, #25
    24d6:	d50d      	bpl.n	24f4 <uart2_status_isr+0x74>
    24d8:	4b15      	ldr	r3, [pc, #84]	; (2530 <uart2_status_isr+0xb0>)
    24da:	791b      	ldrb	r3, [r3, #4]
    24dc:	065b      	lsls	r3, r3, #25
    24de:	d509      	bpl.n	24f4 <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    24e0:	4b19      	ldr	r3, [pc, #100]	; (2548 <uart2_status_isr+0xc8>)
		transmitting = 0;
    24e2:	491a      	ldr	r1, [pc, #104]	; (254c <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    24e4:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    24e6:	2200      	movs	r2, #0
    24e8:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    24ea:	b103      	cbz	r3, 24ee <uart2_status_isr+0x6e>
    24ec:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    24ee:	4b10      	ldr	r3, [pc, #64]	; (2530 <uart2_status_isr+0xb0>)
    24f0:	222c      	movs	r2, #44	; 0x2c
    24f2:	70da      	strb	r2, [r3, #3]
	}
}
    24f4:	bc30      	pop	{r4, r5}
    24f6:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    24f8:	7911      	ldrb	r1, [r2, #4]
    24fa:	0609      	lsls	r1, r1, #24
    24fc:	d5ea      	bpl.n	24d4 <uart2_status_isr+0x54>
		head = tx_buffer_head;
    24fe:	4914      	ldr	r1, [pc, #80]	; (2550 <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    2500:	4810      	ldr	r0, [pc, #64]	; (2544 <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    2502:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    2504:	7801      	ldrb	r1, [r0, #0]
    2506:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    2508:	428c      	cmp	r4, r1
    250a:	d00d      	beq.n	2528 <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    250c:	1c4a      	adds	r2, r1, #1
    250e:	2a27      	cmp	r2, #39	; 0x27
    2510:	bf84      	itt	hi
    2512:	2100      	movhi	r1, #0
    2514:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    2516:	4d0f      	ldr	r5, [pc, #60]	; (2554 <uart2_status_isr+0xd4>)
			UART2_D = n;
    2518:	4c05      	ldr	r4, [pc, #20]	; (2530 <uart2_status_isr+0xb0>)
    251a:	bf98      	it	ls
    251c:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    251e:	5caa      	ldrb	r2, [r5, r2]
    2520:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    2522:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    2524:	7001      	strb	r1, [r0, #0]
    2526:	e7d5      	b.n	24d4 <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    2528:	216c      	movs	r1, #108	; 0x6c
    252a:	70d1      	strb	r1, [r2, #3]
    252c:	e7d2      	b.n	24d4 <uart2_status_isr+0x54>
    252e:	bf00      	nop
    2530:	4006c000 	.word	0x4006c000
    2534:	1fff95e8 	.word	0x1fff95e8
    2538:	1fff95e9 	.word	0x1fff95e9
    253c:	1fff9614 	.word	0x1fff9614
    2540:	1fff95e4 	.word	0x1fff95e4
    2544:	1fff9655 	.word	0x1fff9655
    2548:	1fff9658 	.word	0x1fff9658
    254c:	1fff9654 	.word	0x1fff9654
    2550:	1fff965c 	.word	0x1fff965c
    2554:	1fff95ec 	.word	0x1fff95ec

00002558 <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    2558:	b570      	push	{r4, r5, r6, lr}
    255a:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    255c:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    255e:	4b19      	ldr	r3, [pc, #100]	; (25c4 <usb_init_serialnumber+0x6c>)
	FTFL_FCCOB0 = 0x41;
    2560:	4d19      	ldr	r5, [pc, #100]	; (25c8 <usb_init_serialnumber+0x70>)
	FTFL_FCCOB1 = 15;
    2562:	481a      	ldr	r0, [pc, #104]	; (25cc <usb_init_serialnumber+0x74>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2564:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    2566:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    2568:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    256a:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    256c:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    256e:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2570:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    2572:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2574:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2576:	7813      	ldrb	r3, [r2, #0]
    2578:	061b      	lsls	r3, r3, #24
    257a:	d5fc      	bpl.n	2576 <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    257c:	4b14      	ldr	r3, [pc, #80]	; (25d0 <usb_init_serialnumber+0x78>)
    257e:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    2580:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    2582:	4b14      	ldr	r3, [pc, #80]	; (25d4 <usb_init_serialnumber+0x7c>)
    2584:	4c14      	ldr	r4, [pc, #80]	; (25d8 <usb_init_serialnumber+0x80>)
    2586:	4298      	cmp	r0, r3
    2588:	bf98      	it	ls
    258a:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    258e:	a901      	add	r1, sp, #4
	if (num < 10000000) num = num * 10;
    2590:	bf98      	it	ls
    2592:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    2594:	220a      	movs	r2, #10
    2596:	f7fe fbbf 	bl	d18 <ultoa>
    259a:	a901      	add	r1, sp, #4
    259c:	4620      	mov	r0, r4
	for (i=0; i<10; i++) {
    259e:	2300      	movs	r3, #0
		char c = buf[i];
    25a0:	f811 2b01 	ldrb.w	r2, [r1], #1
    25a4:	3301      	adds	r3, #1
		if (!c) break;
    25a6:	b13a      	cbz	r2, 25b8 <usb_init_serialnumber+0x60>
	for (i=0; i<10; i++) {
    25a8:	2b0a      	cmp	r3, #10
		usb_string_serial_number_default.wString[i] = c;
    25aa:	f820 2f02 	strh.w	r2, [r0, #2]!
	for (i=0; i<10; i++) {
    25ae:	d1f7      	bne.n	25a0 <usb_init_serialnumber+0x48>
    25b0:	2316      	movs	r3, #22
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    25b2:	7023      	strb	r3, [r4, #0]
}
    25b4:	b004      	add	sp, #16
    25b6:	bd70      	pop	{r4, r5, r6, pc}
    25b8:	005b      	lsls	r3, r3, #1
    25ba:	b2db      	uxtb	r3, r3
	usb_string_serial_number_default.bLength = i * 2 + 2;
    25bc:	7023      	strb	r3, [r4, #0]
}
    25be:	b004      	add	sp, #16
    25c0:	bd70      	pop	{r4, r5, r6, pc}
    25c2:	bf00      	nop
    25c4:	40020000 	.word	0x40020000
    25c8:	40020007 	.word	0x40020007
    25cc:	40020006 	.word	0x40020006
    25d0:	40020008 	.word	0x40020008
    25d4:	0098967f 	.word	0x0098967f
    25d8:	1fff8994 	.word	0x1fff8994

000025dc <__aeabi_atexit>:
    25dc:	460b      	mov	r3, r1
    25de:	4601      	mov	r1, r0
    25e0:	4618      	mov	r0, r3
    25e2:	f000 bee7 	b.w	33b4 <__cxa_atexit>
    25e6:	bf00      	nop

000025e8 <__aeabi_drsub>:
    25e8:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000
    25ec:	e002      	b.n	25f4 <__adddf3>
    25ee:	bf00      	nop

000025f0 <__aeabi_dsub>:
    25f0:	f083 4300 	eor.w	r3, r3, #2147483648	; 0x80000000

000025f4 <__adddf3>:
    25f4:	b530      	push	{r4, r5, lr}
    25f6:	ea4f 0441 	mov.w	r4, r1, lsl #1
    25fa:	ea4f 0543 	mov.w	r5, r3, lsl #1
    25fe:	ea94 0f05 	teq	r4, r5
    2602:	bf08      	it	eq
    2604:	ea90 0f02 	teqeq	r0, r2
    2608:	bf1f      	itttt	ne
    260a:	ea54 0c00 	orrsne.w	ip, r4, r0
    260e:	ea55 0c02 	orrsne.w	ip, r5, r2
    2612:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
    2616:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    261a:	f000 80e2 	beq.w	27e2 <__adddf3+0x1ee>
    261e:	ea4f 5454 	mov.w	r4, r4, lsr #21
    2622:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
    2626:	bfb8      	it	lt
    2628:	426d      	neglt	r5, r5
    262a:	dd0c      	ble.n	2646 <__adddf3+0x52>
    262c:	442c      	add	r4, r5
    262e:	ea80 0202 	eor.w	r2, r0, r2
    2632:	ea81 0303 	eor.w	r3, r1, r3
    2636:	ea82 0000 	eor.w	r0, r2, r0
    263a:	ea83 0101 	eor.w	r1, r3, r1
    263e:	ea80 0202 	eor.w	r2, r0, r2
    2642:	ea81 0303 	eor.w	r3, r1, r3
    2646:	2d36      	cmp	r5, #54	; 0x36
    2648:	bf88      	it	hi
    264a:	bd30      	pophi	{r4, r5, pc}
    264c:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    2650:	ea4f 3101 	mov.w	r1, r1, lsl #12
    2654:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
    2658:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
    265c:	d002      	beq.n	2664 <__adddf3+0x70>
    265e:	4240      	negs	r0, r0
    2660:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    2664:	f013 4f00 	tst.w	r3, #2147483648	; 0x80000000
    2668:	ea4f 3303 	mov.w	r3, r3, lsl #12
    266c:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
    2670:	d002      	beq.n	2678 <__adddf3+0x84>
    2672:	4252      	negs	r2, r2
    2674:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
    2678:	ea94 0f05 	teq	r4, r5
    267c:	f000 80a7 	beq.w	27ce <__adddf3+0x1da>
    2680:	f1a4 0401 	sub.w	r4, r4, #1
    2684:	f1d5 0e20 	rsbs	lr, r5, #32
    2688:	db0d      	blt.n	26a6 <__adddf3+0xb2>
    268a:	fa02 fc0e 	lsl.w	ip, r2, lr
    268e:	fa22 f205 	lsr.w	r2, r2, r5
    2692:	1880      	adds	r0, r0, r2
    2694:	f141 0100 	adc.w	r1, r1, #0
    2698:	fa03 f20e 	lsl.w	r2, r3, lr
    269c:	1880      	adds	r0, r0, r2
    269e:	fa43 f305 	asr.w	r3, r3, r5
    26a2:	4159      	adcs	r1, r3
    26a4:	e00e      	b.n	26c4 <__adddf3+0xd0>
    26a6:	f1a5 0520 	sub.w	r5, r5, #32
    26aa:	f10e 0e20 	add.w	lr, lr, #32
    26ae:	2a01      	cmp	r2, #1
    26b0:	fa03 fc0e 	lsl.w	ip, r3, lr
    26b4:	bf28      	it	cs
    26b6:	f04c 0c02 	orrcs.w	ip, ip, #2
    26ba:	fa43 f305 	asr.w	r3, r3, r5
    26be:	18c0      	adds	r0, r0, r3
    26c0:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
    26c4:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    26c8:	d507      	bpl.n	26da <__adddf3+0xe6>
    26ca:	f04f 0e00 	mov.w	lr, #0
    26ce:	f1dc 0c00 	rsbs	ip, ip, #0
    26d2:	eb7e 0000 	sbcs.w	r0, lr, r0
    26d6:	eb6e 0101 	sbc.w	r1, lr, r1
    26da:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
    26de:	d31b      	bcc.n	2718 <__adddf3+0x124>
    26e0:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
    26e4:	d30c      	bcc.n	2700 <__adddf3+0x10c>
    26e6:	0849      	lsrs	r1, r1, #1
    26e8:	ea5f 0030 	movs.w	r0, r0, rrx
    26ec:	ea4f 0c3c 	mov.w	ip, ip, rrx
    26f0:	f104 0401 	add.w	r4, r4, #1
    26f4:	ea4f 5244 	mov.w	r2, r4, lsl #21
    26f8:	f512 0f80 	cmn.w	r2, #4194304	; 0x400000
    26fc:	f080 809a 	bcs.w	2834 <__adddf3+0x240>
    2700:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    2704:	bf08      	it	eq
    2706:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    270a:	f150 0000 	adcs.w	r0, r0, #0
    270e:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    2712:	ea41 0105 	orr.w	r1, r1, r5
    2716:	bd30      	pop	{r4, r5, pc}
    2718:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
    271c:	4140      	adcs	r0, r0
    271e:	eb41 0101 	adc.w	r1, r1, r1
    2722:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    2726:	f1a4 0401 	sub.w	r4, r4, #1
    272a:	d1e9      	bne.n	2700 <__adddf3+0x10c>
    272c:	f091 0f00 	teq	r1, #0
    2730:	bf04      	itt	eq
    2732:	4601      	moveq	r1, r0
    2734:	2000      	moveq	r0, #0
    2736:	fab1 f381 	clz	r3, r1
    273a:	bf08      	it	eq
    273c:	3320      	addeq	r3, #32
    273e:	f1a3 030b 	sub.w	r3, r3, #11
    2742:	f1b3 0220 	subs.w	r2, r3, #32
    2746:	da0c      	bge.n	2762 <__adddf3+0x16e>
    2748:	320c      	adds	r2, #12
    274a:	dd08      	ble.n	275e <__adddf3+0x16a>
    274c:	f102 0c14 	add.w	ip, r2, #20
    2750:	f1c2 020c 	rsb	r2, r2, #12
    2754:	fa01 f00c 	lsl.w	r0, r1, ip
    2758:	fa21 f102 	lsr.w	r1, r1, r2
    275c:	e00c      	b.n	2778 <__adddf3+0x184>
    275e:	f102 0214 	add.w	r2, r2, #20
    2762:	bfd8      	it	le
    2764:	f1c2 0c20 	rsble	ip, r2, #32
    2768:	fa01 f102 	lsl.w	r1, r1, r2
    276c:	fa20 fc0c 	lsr.w	ip, r0, ip
    2770:	bfdc      	itt	le
    2772:	ea41 010c 	orrle.w	r1, r1, ip
    2776:	4090      	lslle	r0, r2
    2778:	1ae4      	subs	r4, r4, r3
    277a:	bfa2      	ittt	ge
    277c:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
    2780:	4329      	orrge	r1, r5
    2782:	bd30      	popge	{r4, r5, pc}
    2784:	ea6f 0404 	mvn.w	r4, r4
    2788:	3c1f      	subs	r4, #31
    278a:	da1c      	bge.n	27c6 <__adddf3+0x1d2>
    278c:	340c      	adds	r4, #12
    278e:	dc0e      	bgt.n	27ae <__adddf3+0x1ba>
    2790:	f104 0414 	add.w	r4, r4, #20
    2794:	f1c4 0220 	rsb	r2, r4, #32
    2798:	fa20 f004 	lsr.w	r0, r0, r4
    279c:	fa01 f302 	lsl.w	r3, r1, r2
    27a0:	ea40 0003 	orr.w	r0, r0, r3
    27a4:	fa21 f304 	lsr.w	r3, r1, r4
    27a8:	ea45 0103 	orr.w	r1, r5, r3
    27ac:	bd30      	pop	{r4, r5, pc}
    27ae:	f1c4 040c 	rsb	r4, r4, #12
    27b2:	f1c4 0220 	rsb	r2, r4, #32
    27b6:	fa20 f002 	lsr.w	r0, r0, r2
    27ba:	fa01 f304 	lsl.w	r3, r1, r4
    27be:	ea40 0003 	orr.w	r0, r0, r3
    27c2:	4629      	mov	r1, r5
    27c4:	bd30      	pop	{r4, r5, pc}
    27c6:	fa21 f004 	lsr.w	r0, r1, r4
    27ca:	4629      	mov	r1, r5
    27cc:	bd30      	pop	{r4, r5, pc}
    27ce:	f094 0f00 	teq	r4, #0
    27d2:	f483 1380 	eor.w	r3, r3, #1048576	; 0x100000
    27d6:	bf06      	itte	eq
    27d8:	f481 1180 	eoreq.w	r1, r1, #1048576	; 0x100000
    27dc:	3401      	addeq	r4, #1
    27de:	3d01      	subne	r5, #1
    27e0:	e74e      	b.n	2680 <__adddf3+0x8c>
    27e2:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    27e6:	bf18      	it	ne
    27e8:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    27ec:	d029      	beq.n	2842 <__adddf3+0x24e>
    27ee:	ea94 0f05 	teq	r4, r5
    27f2:	bf08      	it	eq
    27f4:	ea90 0f02 	teqeq	r0, r2
    27f8:	d005      	beq.n	2806 <__adddf3+0x212>
    27fa:	ea54 0c00 	orrs.w	ip, r4, r0
    27fe:	bf04      	itt	eq
    2800:	4619      	moveq	r1, r3
    2802:	4610      	moveq	r0, r2
    2804:	bd30      	pop	{r4, r5, pc}
    2806:	ea91 0f03 	teq	r1, r3
    280a:	bf1e      	ittt	ne
    280c:	2100      	movne	r1, #0
    280e:	2000      	movne	r0, #0
    2810:	bd30      	popne	{r4, r5, pc}
    2812:	ea5f 5c54 	movs.w	ip, r4, lsr #21
    2816:	d105      	bne.n	2824 <__adddf3+0x230>
    2818:	0040      	lsls	r0, r0, #1
    281a:	4149      	adcs	r1, r1
    281c:	bf28      	it	cs
    281e:	f041 4100 	orrcs.w	r1, r1, #2147483648	; 0x80000000
    2822:	bd30      	pop	{r4, r5, pc}
    2824:	f514 0480 	adds.w	r4, r4, #4194304	; 0x400000
    2828:	bf3c      	itt	cc
    282a:	f501 1180 	addcc.w	r1, r1, #1048576	; 0x100000
    282e:	bd30      	popcc	{r4, r5, pc}
    2830:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    2834:	f045 41fe 	orr.w	r1, r5, #2130706432	; 0x7f000000
    2838:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
    283c:	f04f 0000 	mov.w	r0, #0
    2840:	bd30      	pop	{r4, r5, pc}
    2842:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    2846:	bf1a      	itte	ne
    2848:	4619      	movne	r1, r3
    284a:	4610      	movne	r0, r2
    284c:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
    2850:	bf1c      	itt	ne
    2852:	460b      	movne	r3, r1
    2854:	4602      	movne	r2, r0
    2856:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    285a:	bf06      	itte	eq
    285c:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
    2860:	ea91 0f03 	teqeq	r1, r3
    2864:	f441 2100 	orrne.w	r1, r1, #524288	; 0x80000
    2868:	bd30      	pop	{r4, r5, pc}
    286a:	bf00      	nop

0000286c <__aeabi_ui2d>:
    286c:	f090 0f00 	teq	r0, #0
    2870:	bf04      	itt	eq
    2872:	2100      	moveq	r1, #0
    2874:	4770      	bxeq	lr
    2876:	b530      	push	{r4, r5, lr}
    2878:	f44f 6480 	mov.w	r4, #1024	; 0x400
    287c:	f104 0432 	add.w	r4, r4, #50	; 0x32
    2880:	f04f 0500 	mov.w	r5, #0
    2884:	f04f 0100 	mov.w	r1, #0
    2888:	e750      	b.n	272c <__adddf3+0x138>
    288a:	bf00      	nop

0000288c <__aeabi_i2d>:
    288c:	f090 0f00 	teq	r0, #0
    2890:	bf04      	itt	eq
    2892:	2100      	moveq	r1, #0
    2894:	4770      	bxeq	lr
    2896:	b530      	push	{r4, r5, lr}
    2898:	f44f 6480 	mov.w	r4, #1024	; 0x400
    289c:	f104 0432 	add.w	r4, r4, #50	; 0x32
    28a0:	f010 4500 	ands.w	r5, r0, #2147483648	; 0x80000000
    28a4:	bf48      	it	mi
    28a6:	4240      	negmi	r0, r0
    28a8:	f04f 0100 	mov.w	r1, #0
    28ac:	e73e      	b.n	272c <__adddf3+0x138>
    28ae:	bf00      	nop

000028b0 <__aeabi_f2d>:
    28b0:	0042      	lsls	r2, r0, #1
    28b2:	ea4f 01e2 	mov.w	r1, r2, asr #3
    28b6:	ea4f 0131 	mov.w	r1, r1, rrx
    28ba:	ea4f 7002 	mov.w	r0, r2, lsl #28
    28be:	bf1f      	itttt	ne
    28c0:	f012 437f 	andsne.w	r3, r2, #4278190080	; 0xff000000
    28c4:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
    28c8:	f081 5160 	eorne.w	r1, r1, #939524096	; 0x38000000
    28cc:	4770      	bxne	lr
    28ce:	f092 0f00 	teq	r2, #0
    28d2:	bf14      	ite	ne
    28d4:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
    28d8:	4770      	bxeq	lr
    28da:	b530      	push	{r4, r5, lr}
    28dc:	f44f 7460 	mov.w	r4, #896	; 0x380
    28e0:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    28e4:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
    28e8:	e720      	b.n	272c <__adddf3+0x138>
    28ea:	bf00      	nop

000028ec <__aeabi_ul2d>:
    28ec:	ea50 0201 	orrs.w	r2, r0, r1
    28f0:	bf08      	it	eq
    28f2:	4770      	bxeq	lr
    28f4:	b530      	push	{r4, r5, lr}
    28f6:	f04f 0500 	mov.w	r5, #0
    28fa:	e00a      	b.n	2912 <__aeabi_l2d+0x16>

000028fc <__aeabi_l2d>:
    28fc:	ea50 0201 	orrs.w	r2, r0, r1
    2900:	bf08      	it	eq
    2902:	4770      	bxeq	lr
    2904:	b530      	push	{r4, r5, lr}
    2906:	f011 4500 	ands.w	r5, r1, #2147483648	; 0x80000000
    290a:	d502      	bpl.n	2912 <__aeabi_l2d+0x16>
    290c:	4240      	negs	r0, r0
    290e:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    2912:	f44f 6480 	mov.w	r4, #1024	; 0x400
    2916:	f104 0432 	add.w	r4, r4, #50	; 0x32
    291a:	ea5f 5c91 	movs.w	ip, r1, lsr #22
    291e:	f43f aedc 	beq.w	26da <__adddf3+0xe6>
    2922:	f04f 0203 	mov.w	r2, #3
    2926:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    292a:	bf18      	it	ne
    292c:	3203      	addne	r2, #3
    292e:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    2932:	bf18      	it	ne
    2934:	3203      	addne	r2, #3
    2936:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
    293a:	f1c2 0320 	rsb	r3, r2, #32
    293e:	fa00 fc03 	lsl.w	ip, r0, r3
    2942:	fa20 f002 	lsr.w	r0, r0, r2
    2946:	fa01 fe03 	lsl.w	lr, r1, r3
    294a:	ea40 000e 	orr.w	r0, r0, lr
    294e:	fa21 f102 	lsr.w	r1, r1, r2
    2952:	4414      	add	r4, r2
    2954:	e6c1      	b.n	26da <__adddf3+0xe6>
    2956:	bf00      	nop

00002958 <__aeabi_dmul>:
    2958:	b570      	push	{r4, r5, r6, lr}
    295a:	f04f 0cff 	mov.w	ip, #255	; 0xff
    295e:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
    2962:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    2966:	bf1d      	ittte	ne
    2968:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    296c:	ea94 0f0c 	teqne	r4, ip
    2970:	ea95 0f0c 	teqne	r5, ip
    2974:	f000 f8de 	bleq	2b34 <__aeabi_dmul+0x1dc>
    2978:	442c      	add	r4, r5
    297a:	ea81 0603 	eor.w	r6, r1, r3
    297e:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
    2982:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
    2986:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
    298a:	bf18      	it	ne
    298c:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
    2990:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    2994:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
    2998:	d038      	beq.n	2a0c <__aeabi_dmul+0xb4>
    299a:	fba0 ce02 	umull	ip, lr, r0, r2
    299e:	f04f 0500 	mov.w	r5, #0
    29a2:	fbe1 e502 	umlal	lr, r5, r1, r2
    29a6:	f006 4200 	and.w	r2, r6, #2147483648	; 0x80000000
    29aa:	fbe0 e503 	umlal	lr, r5, r0, r3
    29ae:	f04f 0600 	mov.w	r6, #0
    29b2:	fbe1 5603 	umlal	r5, r6, r1, r3
    29b6:	f09c 0f00 	teq	ip, #0
    29ba:	bf18      	it	ne
    29bc:	f04e 0e01 	orrne.w	lr, lr, #1
    29c0:	f1a4 04ff 	sub.w	r4, r4, #255	; 0xff
    29c4:	f5b6 7f00 	cmp.w	r6, #512	; 0x200
    29c8:	f564 7440 	sbc.w	r4, r4, #768	; 0x300
    29cc:	d204      	bcs.n	29d8 <__aeabi_dmul+0x80>
    29ce:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
    29d2:	416d      	adcs	r5, r5
    29d4:	eb46 0606 	adc.w	r6, r6, r6
    29d8:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
    29dc:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
    29e0:	ea4f 20c5 	mov.w	r0, r5, lsl #11
    29e4:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
    29e8:	ea4f 2ece 	mov.w	lr, lr, lsl #11
    29ec:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
    29f0:	bf88      	it	hi
    29f2:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
    29f6:	d81e      	bhi.n	2a36 <__aeabi_dmul+0xde>
    29f8:	f1be 4f00 	cmp.w	lr, #2147483648	; 0x80000000
    29fc:	bf08      	it	eq
    29fe:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
    2a02:	f150 0000 	adcs.w	r0, r0, #0
    2a06:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    2a0a:	bd70      	pop	{r4, r5, r6, pc}
    2a0c:	f006 4600 	and.w	r6, r6, #2147483648	; 0x80000000
    2a10:	ea46 0101 	orr.w	r1, r6, r1
    2a14:	ea40 0002 	orr.w	r0, r0, r2
    2a18:	ea81 0103 	eor.w	r1, r1, r3
    2a1c:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
    2a20:	bfc2      	ittt	gt
    2a22:	ebd4 050c 	rsbsgt	r5, r4, ip
    2a26:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    2a2a:	bd70      	popgt	{r4, r5, r6, pc}
    2a2c:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    2a30:	f04f 0e00 	mov.w	lr, #0
    2a34:	3c01      	subs	r4, #1
    2a36:	f300 80ab 	bgt.w	2b90 <__aeabi_dmul+0x238>
    2a3a:	f114 0f36 	cmn.w	r4, #54	; 0x36
    2a3e:	bfde      	ittt	le
    2a40:	2000      	movle	r0, #0
    2a42:	f001 4100 	andle.w	r1, r1, #2147483648	; 0x80000000
    2a46:	bd70      	pople	{r4, r5, r6, pc}
    2a48:	f1c4 0400 	rsb	r4, r4, #0
    2a4c:	3c20      	subs	r4, #32
    2a4e:	da35      	bge.n	2abc <__aeabi_dmul+0x164>
    2a50:	340c      	adds	r4, #12
    2a52:	dc1b      	bgt.n	2a8c <__aeabi_dmul+0x134>
    2a54:	f104 0414 	add.w	r4, r4, #20
    2a58:	f1c4 0520 	rsb	r5, r4, #32
    2a5c:	fa00 f305 	lsl.w	r3, r0, r5
    2a60:	fa20 f004 	lsr.w	r0, r0, r4
    2a64:	fa01 f205 	lsl.w	r2, r1, r5
    2a68:	ea40 0002 	orr.w	r0, r0, r2
    2a6c:	f001 4200 	and.w	r2, r1, #2147483648	; 0x80000000
    2a70:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
    2a74:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    2a78:	fa21 f604 	lsr.w	r6, r1, r4
    2a7c:	eb42 0106 	adc.w	r1, r2, r6
    2a80:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    2a84:	bf08      	it	eq
    2a86:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    2a8a:	bd70      	pop	{r4, r5, r6, pc}
    2a8c:	f1c4 040c 	rsb	r4, r4, #12
    2a90:	f1c4 0520 	rsb	r5, r4, #32
    2a94:	fa00 f304 	lsl.w	r3, r0, r4
    2a98:	fa20 f005 	lsr.w	r0, r0, r5
    2a9c:	fa01 f204 	lsl.w	r2, r1, r4
    2aa0:	ea40 0002 	orr.w	r0, r0, r2
    2aa4:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    2aa8:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    2aac:	f141 0100 	adc.w	r1, r1, #0
    2ab0:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    2ab4:	bf08      	it	eq
    2ab6:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    2aba:	bd70      	pop	{r4, r5, r6, pc}
    2abc:	f1c4 0520 	rsb	r5, r4, #32
    2ac0:	fa00 f205 	lsl.w	r2, r0, r5
    2ac4:	ea4e 0e02 	orr.w	lr, lr, r2
    2ac8:	fa20 f304 	lsr.w	r3, r0, r4
    2acc:	fa01 f205 	lsl.w	r2, r1, r5
    2ad0:	ea43 0302 	orr.w	r3, r3, r2
    2ad4:	fa21 f004 	lsr.w	r0, r1, r4
    2ad8:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    2adc:	fa21 f204 	lsr.w	r2, r1, r4
    2ae0:	ea20 0002 	bic.w	r0, r0, r2
    2ae4:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
    2ae8:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    2aec:	bf08      	it	eq
    2aee:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    2af2:	bd70      	pop	{r4, r5, r6, pc}
    2af4:	f094 0f00 	teq	r4, #0
    2af8:	d10f      	bne.n	2b1a <__aeabi_dmul+0x1c2>
    2afa:	f001 4600 	and.w	r6, r1, #2147483648	; 0x80000000
    2afe:	0040      	lsls	r0, r0, #1
    2b00:	eb41 0101 	adc.w	r1, r1, r1
    2b04:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    2b08:	bf08      	it	eq
    2b0a:	3c01      	subeq	r4, #1
    2b0c:	d0f7      	beq.n	2afe <__aeabi_dmul+0x1a6>
    2b0e:	ea41 0106 	orr.w	r1, r1, r6
    2b12:	f095 0f00 	teq	r5, #0
    2b16:	bf18      	it	ne
    2b18:	4770      	bxne	lr
    2b1a:	f003 4600 	and.w	r6, r3, #2147483648	; 0x80000000
    2b1e:	0052      	lsls	r2, r2, #1
    2b20:	eb43 0303 	adc.w	r3, r3, r3
    2b24:	f413 1f80 	tst.w	r3, #1048576	; 0x100000
    2b28:	bf08      	it	eq
    2b2a:	3d01      	subeq	r5, #1
    2b2c:	d0f7      	beq.n	2b1e <__aeabi_dmul+0x1c6>
    2b2e:	ea43 0306 	orr.w	r3, r3, r6
    2b32:	4770      	bx	lr
    2b34:	ea94 0f0c 	teq	r4, ip
    2b38:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    2b3c:	bf18      	it	ne
    2b3e:	ea95 0f0c 	teqne	r5, ip
    2b42:	d00c      	beq.n	2b5e <__aeabi_dmul+0x206>
    2b44:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    2b48:	bf18      	it	ne
    2b4a:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    2b4e:	d1d1      	bne.n	2af4 <__aeabi_dmul+0x19c>
    2b50:	ea81 0103 	eor.w	r1, r1, r3
    2b54:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    2b58:	f04f 0000 	mov.w	r0, #0
    2b5c:	bd70      	pop	{r4, r5, r6, pc}
    2b5e:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    2b62:	bf06      	itte	eq
    2b64:	4610      	moveq	r0, r2
    2b66:	4619      	moveq	r1, r3
    2b68:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    2b6c:	d019      	beq.n	2ba2 <__aeabi_dmul+0x24a>
    2b6e:	ea94 0f0c 	teq	r4, ip
    2b72:	d102      	bne.n	2b7a <__aeabi_dmul+0x222>
    2b74:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
    2b78:	d113      	bne.n	2ba2 <__aeabi_dmul+0x24a>
    2b7a:	ea95 0f0c 	teq	r5, ip
    2b7e:	d105      	bne.n	2b8c <__aeabi_dmul+0x234>
    2b80:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
    2b84:	bf1c      	itt	ne
    2b86:	4610      	movne	r0, r2
    2b88:	4619      	movne	r1, r3
    2b8a:	d10a      	bne.n	2ba2 <__aeabi_dmul+0x24a>
    2b8c:	ea81 0103 	eor.w	r1, r1, r3
    2b90:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    2b94:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
    2b98:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
    2b9c:	f04f 0000 	mov.w	r0, #0
    2ba0:	bd70      	pop	{r4, r5, r6, pc}
    2ba2:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
    2ba6:	f441 0178 	orr.w	r1, r1, #16252928	; 0xf80000
    2baa:	bd70      	pop	{r4, r5, r6, pc}

00002bac <__aeabi_ddiv>:
    2bac:	b570      	push	{r4, r5, r6, lr}
    2bae:	f04f 0cff 	mov.w	ip, #255	; 0xff
    2bb2:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
    2bb6:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    2bba:	bf1d      	ittte	ne
    2bbc:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    2bc0:	ea94 0f0c 	teqne	r4, ip
    2bc4:	ea95 0f0c 	teqne	r5, ip
    2bc8:	f000 f8a7 	bleq	2d1a <__aeabi_ddiv+0x16e>
    2bcc:	eba4 0405 	sub.w	r4, r4, r5
    2bd0:	ea81 0e03 	eor.w	lr, r1, r3
    2bd4:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    2bd8:	ea4f 3101 	mov.w	r1, r1, lsl #12
    2bdc:	f000 8088 	beq.w	2cf0 <__aeabi_ddiv+0x144>
    2be0:	ea4f 3303 	mov.w	r3, r3, lsl #12
    2be4:	f04f 5580 	mov.w	r5, #268435456	; 0x10000000
    2be8:	ea45 1313 	orr.w	r3, r5, r3, lsr #4
    2bec:	ea43 6312 	orr.w	r3, r3, r2, lsr #24
    2bf0:	ea4f 2202 	mov.w	r2, r2, lsl #8
    2bf4:	ea45 1511 	orr.w	r5, r5, r1, lsr #4
    2bf8:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
    2bfc:	ea4f 2600 	mov.w	r6, r0, lsl #8
    2c00:	f00e 4100 	and.w	r1, lr, #2147483648	; 0x80000000
    2c04:	429d      	cmp	r5, r3
    2c06:	bf08      	it	eq
    2c08:	4296      	cmpeq	r6, r2
    2c0a:	f144 04fd 	adc.w	r4, r4, #253	; 0xfd
    2c0e:	f504 7440 	add.w	r4, r4, #768	; 0x300
    2c12:	d202      	bcs.n	2c1a <__aeabi_ddiv+0x6e>
    2c14:	085b      	lsrs	r3, r3, #1
    2c16:	ea4f 0232 	mov.w	r2, r2, rrx
    2c1a:	1ab6      	subs	r6, r6, r2
    2c1c:	eb65 0503 	sbc.w	r5, r5, r3
    2c20:	085b      	lsrs	r3, r3, #1
    2c22:	ea4f 0232 	mov.w	r2, r2, rrx
    2c26:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
    2c2a:	f44f 2c00 	mov.w	ip, #524288	; 0x80000
    2c2e:	ebb6 0e02 	subs.w	lr, r6, r2
    2c32:	eb75 0e03 	sbcs.w	lr, r5, r3
    2c36:	bf22      	ittt	cs
    2c38:	1ab6      	subcs	r6, r6, r2
    2c3a:	4675      	movcs	r5, lr
    2c3c:	ea40 000c 	orrcs.w	r0, r0, ip
    2c40:	085b      	lsrs	r3, r3, #1
    2c42:	ea4f 0232 	mov.w	r2, r2, rrx
    2c46:	ebb6 0e02 	subs.w	lr, r6, r2
    2c4a:	eb75 0e03 	sbcs.w	lr, r5, r3
    2c4e:	bf22      	ittt	cs
    2c50:	1ab6      	subcs	r6, r6, r2
    2c52:	4675      	movcs	r5, lr
    2c54:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    2c58:	085b      	lsrs	r3, r3, #1
    2c5a:	ea4f 0232 	mov.w	r2, r2, rrx
    2c5e:	ebb6 0e02 	subs.w	lr, r6, r2
    2c62:	eb75 0e03 	sbcs.w	lr, r5, r3
    2c66:	bf22      	ittt	cs
    2c68:	1ab6      	subcs	r6, r6, r2
    2c6a:	4675      	movcs	r5, lr
    2c6c:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    2c70:	085b      	lsrs	r3, r3, #1
    2c72:	ea4f 0232 	mov.w	r2, r2, rrx
    2c76:	ebb6 0e02 	subs.w	lr, r6, r2
    2c7a:	eb75 0e03 	sbcs.w	lr, r5, r3
    2c7e:	bf22      	ittt	cs
    2c80:	1ab6      	subcs	r6, r6, r2
    2c82:	4675      	movcs	r5, lr
    2c84:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    2c88:	ea55 0e06 	orrs.w	lr, r5, r6
    2c8c:	d018      	beq.n	2cc0 <__aeabi_ddiv+0x114>
    2c8e:	ea4f 1505 	mov.w	r5, r5, lsl #4
    2c92:	ea45 7516 	orr.w	r5, r5, r6, lsr #28
    2c96:	ea4f 1606 	mov.w	r6, r6, lsl #4
    2c9a:	ea4f 03c3 	mov.w	r3, r3, lsl #3
    2c9e:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
    2ca2:	ea4f 02c2 	mov.w	r2, r2, lsl #3
    2ca6:	ea5f 1c1c 	movs.w	ip, ip, lsr #4
    2caa:	d1c0      	bne.n	2c2e <__aeabi_ddiv+0x82>
    2cac:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    2cb0:	d10b      	bne.n	2cca <__aeabi_ddiv+0x11e>
    2cb2:	ea41 0100 	orr.w	r1, r1, r0
    2cb6:	f04f 0000 	mov.w	r0, #0
    2cba:	f04f 4c00 	mov.w	ip, #2147483648	; 0x80000000
    2cbe:	e7b6      	b.n	2c2e <__aeabi_ddiv+0x82>
    2cc0:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    2cc4:	bf04      	itt	eq
    2cc6:	4301      	orreq	r1, r0
    2cc8:	2000      	moveq	r0, #0
    2cca:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
    2cce:	bf88      	it	hi
    2cd0:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
    2cd4:	f63f aeaf 	bhi.w	2a36 <__aeabi_dmul+0xde>
    2cd8:	ebb5 0c03 	subs.w	ip, r5, r3
    2cdc:	bf04      	itt	eq
    2cde:	ebb6 0c02 	subseq.w	ip, r6, r2
    2ce2:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    2ce6:	f150 0000 	adcs.w	r0, r0, #0
    2cea:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    2cee:	bd70      	pop	{r4, r5, r6, pc}
    2cf0:	f00e 4e00 	and.w	lr, lr, #2147483648	; 0x80000000
    2cf4:	ea4e 3111 	orr.w	r1, lr, r1, lsr #12
    2cf8:	eb14 045c 	adds.w	r4, r4, ip, lsr #1
    2cfc:	bfc2      	ittt	gt
    2cfe:	ebd4 050c 	rsbsgt	r5, r4, ip
    2d02:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    2d06:	bd70      	popgt	{r4, r5, r6, pc}
    2d08:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    2d0c:	f04f 0e00 	mov.w	lr, #0
    2d10:	3c01      	subs	r4, #1
    2d12:	e690      	b.n	2a36 <__aeabi_dmul+0xde>
    2d14:	ea45 0e06 	orr.w	lr, r5, r6
    2d18:	e68d      	b.n	2a36 <__aeabi_dmul+0xde>
    2d1a:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    2d1e:	ea94 0f0c 	teq	r4, ip
    2d22:	bf08      	it	eq
    2d24:	ea95 0f0c 	teqeq	r5, ip
    2d28:	f43f af3b 	beq.w	2ba2 <__aeabi_dmul+0x24a>
    2d2c:	ea94 0f0c 	teq	r4, ip
    2d30:	d10a      	bne.n	2d48 <__aeabi_ddiv+0x19c>
    2d32:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    2d36:	f47f af34 	bne.w	2ba2 <__aeabi_dmul+0x24a>
    2d3a:	ea95 0f0c 	teq	r5, ip
    2d3e:	f47f af25 	bne.w	2b8c <__aeabi_dmul+0x234>
    2d42:	4610      	mov	r0, r2
    2d44:	4619      	mov	r1, r3
    2d46:	e72c      	b.n	2ba2 <__aeabi_dmul+0x24a>
    2d48:	ea95 0f0c 	teq	r5, ip
    2d4c:	d106      	bne.n	2d5c <__aeabi_ddiv+0x1b0>
    2d4e:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    2d52:	f43f aefd 	beq.w	2b50 <__aeabi_dmul+0x1f8>
    2d56:	4610      	mov	r0, r2
    2d58:	4619      	mov	r1, r3
    2d5a:	e722      	b.n	2ba2 <__aeabi_dmul+0x24a>
    2d5c:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    2d60:	bf18      	it	ne
    2d62:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    2d66:	f47f aec5 	bne.w	2af4 <__aeabi_dmul+0x19c>
    2d6a:	ea50 0441 	orrs.w	r4, r0, r1, lsl #1
    2d6e:	f47f af0d 	bne.w	2b8c <__aeabi_dmul+0x234>
    2d72:	ea52 0543 	orrs.w	r5, r2, r3, lsl #1
    2d76:	f47f aeeb 	bne.w	2b50 <__aeabi_dmul+0x1f8>
    2d7a:	e712      	b.n	2ba2 <__aeabi_dmul+0x24a>

00002d7c <__gedf2>:
    2d7c:	f04f 3cff 	mov.w	ip, #4294967295
    2d80:	e006      	b.n	2d90 <__cmpdf2+0x4>
    2d82:	bf00      	nop

00002d84 <__ledf2>:
    2d84:	f04f 0c01 	mov.w	ip, #1
    2d88:	e002      	b.n	2d90 <__cmpdf2+0x4>
    2d8a:	bf00      	nop

00002d8c <__cmpdf2>:
    2d8c:	f04f 0c01 	mov.w	ip, #1
    2d90:	f84d cd04 	str.w	ip, [sp, #-4]!
    2d94:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    2d98:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    2d9c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    2da0:	bf18      	it	ne
    2da2:	ea7f 5c6c 	mvnsne.w	ip, ip, asr #21
    2da6:	d01b      	beq.n	2de0 <__cmpdf2+0x54>
    2da8:	b001      	add	sp, #4
    2daa:	ea50 0c41 	orrs.w	ip, r0, r1, lsl #1
    2dae:	bf0c      	ite	eq
    2db0:	ea52 0c43 	orrseq.w	ip, r2, r3, lsl #1
    2db4:	ea91 0f03 	teqne	r1, r3
    2db8:	bf02      	ittt	eq
    2dba:	ea90 0f02 	teqeq	r0, r2
    2dbe:	2000      	moveq	r0, #0
    2dc0:	4770      	bxeq	lr
    2dc2:	f110 0f00 	cmn.w	r0, #0
    2dc6:	ea91 0f03 	teq	r1, r3
    2dca:	bf58      	it	pl
    2dcc:	4299      	cmppl	r1, r3
    2dce:	bf08      	it	eq
    2dd0:	4290      	cmpeq	r0, r2
    2dd2:	bf2c      	ite	cs
    2dd4:	17d8      	asrcs	r0, r3, #31
    2dd6:	ea6f 70e3 	mvncc.w	r0, r3, asr #31
    2dda:	f040 0001 	orr.w	r0, r0, #1
    2dde:	4770      	bx	lr
    2de0:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    2de4:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    2de8:	d102      	bne.n	2df0 <__cmpdf2+0x64>
    2dea:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
    2dee:	d107      	bne.n	2e00 <__cmpdf2+0x74>
    2df0:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    2df4:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    2df8:	d1d6      	bne.n	2da8 <__cmpdf2+0x1c>
    2dfa:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
    2dfe:	d0d3      	beq.n	2da8 <__cmpdf2+0x1c>
    2e00:	f85d 0b04 	ldr.w	r0, [sp], #4
    2e04:	4770      	bx	lr
    2e06:	bf00      	nop

00002e08 <__aeabi_cdrcmple>:
    2e08:	4684      	mov	ip, r0
    2e0a:	4610      	mov	r0, r2
    2e0c:	4662      	mov	r2, ip
    2e0e:	468c      	mov	ip, r1
    2e10:	4619      	mov	r1, r3
    2e12:	4663      	mov	r3, ip
    2e14:	e000      	b.n	2e18 <__aeabi_cdcmpeq>
    2e16:	bf00      	nop

00002e18 <__aeabi_cdcmpeq>:
    2e18:	b501      	push	{r0, lr}
    2e1a:	f7ff ffb7 	bl	2d8c <__cmpdf2>
    2e1e:	2800      	cmp	r0, #0
    2e20:	bf48      	it	mi
    2e22:	f110 0f00 	cmnmi.w	r0, #0
    2e26:	bd01      	pop	{r0, pc}

00002e28 <__aeabi_dcmpeq>:
    2e28:	f84d ed08 	str.w	lr, [sp, #-8]!
    2e2c:	f7ff fff4 	bl	2e18 <__aeabi_cdcmpeq>
    2e30:	bf0c      	ite	eq
    2e32:	2001      	moveq	r0, #1
    2e34:	2000      	movne	r0, #0
    2e36:	f85d fb08 	ldr.w	pc, [sp], #8
    2e3a:	bf00      	nop

00002e3c <__aeabi_dcmplt>:
    2e3c:	f84d ed08 	str.w	lr, [sp, #-8]!
    2e40:	f7ff ffea 	bl	2e18 <__aeabi_cdcmpeq>
    2e44:	bf34      	ite	cc
    2e46:	2001      	movcc	r0, #1
    2e48:	2000      	movcs	r0, #0
    2e4a:	f85d fb08 	ldr.w	pc, [sp], #8
    2e4e:	bf00      	nop

00002e50 <__aeabi_dcmple>:
    2e50:	f84d ed08 	str.w	lr, [sp, #-8]!
    2e54:	f7ff ffe0 	bl	2e18 <__aeabi_cdcmpeq>
    2e58:	bf94      	ite	ls
    2e5a:	2001      	movls	r0, #1
    2e5c:	2000      	movhi	r0, #0
    2e5e:	f85d fb08 	ldr.w	pc, [sp], #8
    2e62:	bf00      	nop

00002e64 <__aeabi_dcmpge>:
    2e64:	f84d ed08 	str.w	lr, [sp, #-8]!
    2e68:	f7ff ffce 	bl	2e08 <__aeabi_cdrcmple>
    2e6c:	bf94      	ite	ls
    2e6e:	2001      	movls	r0, #1
    2e70:	2000      	movhi	r0, #0
    2e72:	f85d fb08 	ldr.w	pc, [sp], #8
    2e76:	bf00      	nop

00002e78 <__aeabi_dcmpgt>:
    2e78:	f84d ed08 	str.w	lr, [sp, #-8]!
    2e7c:	f7ff ffc4 	bl	2e08 <__aeabi_cdrcmple>
    2e80:	bf34      	ite	cc
    2e82:	2001      	movcc	r0, #1
    2e84:	2000      	movcs	r0, #0
    2e86:	f85d fb08 	ldr.w	pc, [sp], #8
    2e8a:	bf00      	nop

00002e8c <__aeabi_dcmpun>:
    2e8c:	ea4f 0c41 	mov.w	ip, r1, lsl #1
    2e90:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    2e94:	d102      	bne.n	2e9c <__aeabi_dcmpun+0x10>
    2e96:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
    2e9a:	d10a      	bne.n	2eb2 <__aeabi_dcmpun+0x26>
    2e9c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
    2ea0:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
    2ea4:	d102      	bne.n	2eac <__aeabi_dcmpun+0x20>
    2ea6:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
    2eaa:	d102      	bne.n	2eb2 <__aeabi_dcmpun+0x26>
    2eac:	f04f 0000 	mov.w	r0, #0
    2eb0:	4770      	bx	lr
    2eb2:	f04f 0001 	mov.w	r0, #1
    2eb6:	4770      	bx	lr

00002eb8 <__aeabi_d2uiz>:
    2eb8:	004a      	lsls	r2, r1, #1
    2eba:	d211      	bcs.n	2ee0 <__aeabi_d2uiz+0x28>
    2ebc:	f512 1200 	adds.w	r2, r2, #2097152	; 0x200000
    2ec0:	d211      	bcs.n	2ee6 <__aeabi_d2uiz+0x2e>
    2ec2:	d50d      	bpl.n	2ee0 <__aeabi_d2uiz+0x28>
    2ec4:	f46f 7378 	mvn.w	r3, #992	; 0x3e0
    2ec8:	ebb3 5262 	subs.w	r2, r3, r2, asr #21
    2ecc:	d40e      	bmi.n	2eec <__aeabi_d2uiz+0x34>
    2ece:	ea4f 23c1 	mov.w	r3, r1, lsl #11
    2ed2:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
    2ed6:	ea43 5350 	orr.w	r3, r3, r0, lsr #21
    2eda:	fa23 f002 	lsr.w	r0, r3, r2
    2ede:	4770      	bx	lr
    2ee0:	f04f 0000 	mov.w	r0, #0
    2ee4:	4770      	bx	lr
    2ee6:	ea50 3001 	orrs.w	r0, r0, r1, lsl #12
    2eea:	d102      	bne.n	2ef2 <__aeabi_d2uiz+0x3a>
    2eec:	f04f 30ff 	mov.w	r0, #4294967295
    2ef0:	4770      	bx	lr
    2ef2:	f04f 0000 	mov.w	r0, #0
    2ef6:	4770      	bx	lr

00002ef8 <__aeabi_frsub>:
    2ef8:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
    2efc:	e002      	b.n	2f04 <__addsf3>
    2efe:	bf00      	nop

00002f00 <__aeabi_fsub>:
    2f00:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

00002f04 <__addsf3>:
    2f04:	0042      	lsls	r2, r0, #1
    2f06:	bf1f      	itttt	ne
    2f08:	ea5f 0341 	movsne.w	r3, r1, lsl #1
    2f0c:	ea92 0f03 	teqne	r2, r3
    2f10:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
    2f14:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    2f18:	d06a      	beq.n	2ff0 <__addsf3+0xec>
    2f1a:	ea4f 6212 	mov.w	r2, r2, lsr #24
    2f1e:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
    2f22:	bfc1      	itttt	gt
    2f24:	18d2      	addgt	r2, r2, r3
    2f26:	4041      	eorgt	r1, r0
    2f28:	4048      	eorgt	r0, r1
    2f2a:	4041      	eorgt	r1, r0
    2f2c:	bfb8      	it	lt
    2f2e:	425b      	neglt	r3, r3
    2f30:	2b19      	cmp	r3, #25
    2f32:	bf88      	it	hi
    2f34:	4770      	bxhi	lr
    2f36:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
    2f3a:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2f3e:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    2f42:	bf18      	it	ne
    2f44:	4240      	negne	r0, r0
    2f46:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    2f4a:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
    2f4e:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
    2f52:	bf18      	it	ne
    2f54:	4249      	negne	r1, r1
    2f56:	ea92 0f03 	teq	r2, r3
    2f5a:	d03f      	beq.n	2fdc <__addsf3+0xd8>
    2f5c:	f1a2 0201 	sub.w	r2, r2, #1
    2f60:	fa41 fc03 	asr.w	ip, r1, r3
    2f64:	eb10 000c 	adds.w	r0, r0, ip
    2f68:	f1c3 0320 	rsb	r3, r3, #32
    2f6c:	fa01 f103 	lsl.w	r1, r1, r3
    2f70:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    2f74:	d502      	bpl.n	2f7c <__addsf3+0x78>
    2f76:	4249      	negs	r1, r1
    2f78:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
    2f7c:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    2f80:	d313      	bcc.n	2faa <__addsf3+0xa6>
    2f82:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
    2f86:	d306      	bcc.n	2f96 <__addsf3+0x92>
    2f88:	0840      	lsrs	r0, r0, #1
    2f8a:	ea4f 0131 	mov.w	r1, r1, rrx
    2f8e:	f102 0201 	add.w	r2, r2, #1
    2f92:	2afe      	cmp	r2, #254	; 0xfe
    2f94:	d251      	bcs.n	303a <__addsf3+0x136>
    2f96:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
    2f9a:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2f9e:	bf08      	it	eq
    2fa0:	f020 0001 	biceq.w	r0, r0, #1
    2fa4:	ea40 0003 	orr.w	r0, r0, r3
    2fa8:	4770      	bx	lr
    2faa:	0049      	lsls	r1, r1, #1
    2fac:	eb40 0000 	adc.w	r0, r0, r0
    2fb0:	f410 0f00 	tst.w	r0, #8388608	; 0x800000
    2fb4:	f1a2 0201 	sub.w	r2, r2, #1
    2fb8:	d1ed      	bne.n	2f96 <__addsf3+0x92>
    2fba:	fab0 fc80 	clz	ip, r0
    2fbe:	f1ac 0c08 	sub.w	ip, ip, #8
    2fc2:	ebb2 020c 	subs.w	r2, r2, ip
    2fc6:	fa00 f00c 	lsl.w	r0, r0, ip
    2fca:	bfaa      	itet	ge
    2fcc:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
    2fd0:	4252      	neglt	r2, r2
    2fd2:	4318      	orrge	r0, r3
    2fd4:	bfbc      	itt	lt
    2fd6:	40d0      	lsrlt	r0, r2
    2fd8:	4318      	orrlt	r0, r3
    2fda:	4770      	bx	lr
    2fdc:	f092 0f00 	teq	r2, #0
    2fe0:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
    2fe4:	bf06      	itte	eq
    2fe6:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
    2fea:	3201      	addeq	r2, #1
    2fec:	3b01      	subne	r3, #1
    2fee:	e7b5      	b.n	2f5c <__addsf3+0x58>
    2ff0:	ea4f 0341 	mov.w	r3, r1, lsl #1
    2ff4:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    2ff8:	bf18      	it	ne
    2ffa:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    2ffe:	d021      	beq.n	3044 <__addsf3+0x140>
    3000:	ea92 0f03 	teq	r2, r3
    3004:	d004      	beq.n	3010 <__addsf3+0x10c>
    3006:	f092 0f00 	teq	r2, #0
    300a:	bf08      	it	eq
    300c:	4608      	moveq	r0, r1
    300e:	4770      	bx	lr
    3010:	ea90 0f01 	teq	r0, r1
    3014:	bf1c      	itt	ne
    3016:	2000      	movne	r0, #0
    3018:	4770      	bxne	lr
    301a:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
    301e:	d104      	bne.n	302a <__addsf3+0x126>
    3020:	0040      	lsls	r0, r0, #1
    3022:	bf28      	it	cs
    3024:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
    3028:	4770      	bx	lr
    302a:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
    302e:	bf3c      	itt	cc
    3030:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
    3034:	4770      	bxcc	lr
    3036:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    303a:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
    303e:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3042:	4770      	bx	lr
    3044:	ea7f 6222 	mvns.w	r2, r2, asr #24
    3048:	bf16      	itet	ne
    304a:	4608      	movne	r0, r1
    304c:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
    3050:	4601      	movne	r1, r0
    3052:	0242      	lsls	r2, r0, #9
    3054:	bf06      	itte	eq
    3056:	ea5f 2341 	movseq.w	r3, r1, lsl #9
    305a:	ea90 0f01 	teqeq	r0, r1
    305e:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
    3062:	4770      	bx	lr

00003064 <__aeabi_ui2f>:
    3064:	f04f 0300 	mov.w	r3, #0
    3068:	e004      	b.n	3074 <__aeabi_i2f+0x8>
    306a:	bf00      	nop

0000306c <__aeabi_i2f>:
    306c:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
    3070:	bf48      	it	mi
    3072:	4240      	negmi	r0, r0
    3074:	ea5f 0c00 	movs.w	ip, r0
    3078:	bf08      	it	eq
    307a:	4770      	bxeq	lr
    307c:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
    3080:	4601      	mov	r1, r0
    3082:	f04f 0000 	mov.w	r0, #0
    3086:	e01c      	b.n	30c2 <__aeabi_l2f+0x2a>

00003088 <__aeabi_ul2f>:
    3088:	ea50 0201 	orrs.w	r2, r0, r1
    308c:	bf08      	it	eq
    308e:	4770      	bxeq	lr
    3090:	f04f 0300 	mov.w	r3, #0
    3094:	e00a      	b.n	30ac <__aeabi_l2f+0x14>
    3096:	bf00      	nop

00003098 <__aeabi_l2f>:
    3098:	ea50 0201 	orrs.w	r2, r0, r1
    309c:	bf08      	it	eq
    309e:	4770      	bxeq	lr
    30a0:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
    30a4:	d502      	bpl.n	30ac <__aeabi_l2f+0x14>
    30a6:	4240      	negs	r0, r0
    30a8:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    30ac:	ea5f 0c01 	movs.w	ip, r1
    30b0:	bf02      	ittt	eq
    30b2:	4684      	moveq	ip, r0
    30b4:	4601      	moveq	r1, r0
    30b6:	2000      	moveq	r0, #0
    30b8:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
    30bc:	bf08      	it	eq
    30be:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
    30c2:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
    30c6:	fabc f28c 	clz	r2, ip
    30ca:	3a08      	subs	r2, #8
    30cc:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
    30d0:	db10      	blt.n	30f4 <__aeabi_l2f+0x5c>
    30d2:	fa01 fc02 	lsl.w	ip, r1, r2
    30d6:	4463      	add	r3, ip
    30d8:	fa00 fc02 	lsl.w	ip, r0, r2
    30dc:	f1c2 0220 	rsb	r2, r2, #32
    30e0:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    30e4:	fa20 f202 	lsr.w	r2, r0, r2
    30e8:	eb43 0002 	adc.w	r0, r3, r2
    30ec:	bf08      	it	eq
    30ee:	f020 0001 	biceq.w	r0, r0, #1
    30f2:	4770      	bx	lr
    30f4:	f102 0220 	add.w	r2, r2, #32
    30f8:	fa01 fc02 	lsl.w	ip, r1, r2
    30fc:	f1c2 0220 	rsb	r2, r2, #32
    3100:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
    3104:	fa21 f202 	lsr.w	r2, r1, r2
    3108:	eb43 0002 	adc.w	r0, r3, r2
    310c:	bf08      	it	eq
    310e:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    3112:	4770      	bx	lr

00003114 <__aeabi_fmul>:
    3114:	f04f 0cff 	mov.w	ip, #255	; 0xff
    3118:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    311c:	bf1e      	ittt	ne
    311e:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    3122:	ea92 0f0c 	teqne	r2, ip
    3126:	ea93 0f0c 	teqne	r3, ip
    312a:	d06f      	beq.n	320c <__aeabi_fmul+0xf8>
    312c:	441a      	add	r2, r3
    312e:	ea80 0c01 	eor.w	ip, r0, r1
    3132:	0240      	lsls	r0, r0, #9
    3134:	bf18      	it	ne
    3136:	ea5f 2141 	movsne.w	r1, r1, lsl #9
    313a:	d01e      	beq.n	317a <__aeabi_fmul+0x66>
    313c:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
    3140:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
    3144:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
    3148:	fba0 3101 	umull	r3, r1, r0, r1
    314c:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    3150:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
    3154:	bf3e      	ittt	cc
    3156:	0049      	lslcc	r1, r1, #1
    3158:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
    315c:	005b      	lslcc	r3, r3, #1
    315e:	ea40 0001 	orr.w	r0, r0, r1
    3162:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
    3166:	2afd      	cmp	r2, #253	; 0xfd
    3168:	d81d      	bhi.n	31a6 <__aeabi_fmul+0x92>
    316a:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    316e:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    3172:	bf08      	it	eq
    3174:	f020 0001 	biceq.w	r0, r0, #1
    3178:	4770      	bx	lr
    317a:	f090 0f00 	teq	r0, #0
    317e:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    3182:	bf08      	it	eq
    3184:	0249      	lsleq	r1, r1, #9
    3186:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    318a:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
    318e:	3a7f      	subs	r2, #127	; 0x7f
    3190:	bfc2      	ittt	gt
    3192:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    3196:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    319a:	4770      	bxgt	lr
    319c:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    31a0:	f04f 0300 	mov.w	r3, #0
    31a4:	3a01      	subs	r2, #1
    31a6:	dc5d      	bgt.n	3264 <__aeabi_fmul+0x150>
    31a8:	f112 0f19 	cmn.w	r2, #25
    31ac:	bfdc      	itt	le
    31ae:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
    31b2:	4770      	bxle	lr
    31b4:	f1c2 0200 	rsb	r2, r2, #0
    31b8:	0041      	lsls	r1, r0, #1
    31ba:	fa21 f102 	lsr.w	r1, r1, r2
    31be:	f1c2 0220 	rsb	r2, r2, #32
    31c2:	fa00 fc02 	lsl.w	ip, r0, r2
    31c6:	ea5f 0031 	movs.w	r0, r1, rrx
    31ca:	f140 0000 	adc.w	r0, r0, #0
    31ce:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
    31d2:	bf08      	it	eq
    31d4:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    31d8:	4770      	bx	lr
    31da:	f092 0f00 	teq	r2, #0
    31de:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    31e2:	bf02      	ittt	eq
    31e4:	0040      	lsleq	r0, r0, #1
    31e6:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    31ea:	3a01      	subeq	r2, #1
    31ec:	d0f9      	beq.n	31e2 <__aeabi_fmul+0xce>
    31ee:	ea40 000c 	orr.w	r0, r0, ip
    31f2:	f093 0f00 	teq	r3, #0
    31f6:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    31fa:	bf02      	ittt	eq
    31fc:	0049      	lsleq	r1, r1, #1
    31fe:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    3202:	3b01      	subeq	r3, #1
    3204:	d0f9      	beq.n	31fa <__aeabi_fmul+0xe6>
    3206:	ea41 010c 	orr.w	r1, r1, ip
    320a:	e78f      	b.n	312c <__aeabi_fmul+0x18>
    320c:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    3210:	ea92 0f0c 	teq	r2, ip
    3214:	bf18      	it	ne
    3216:	ea93 0f0c 	teqne	r3, ip
    321a:	d00a      	beq.n	3232 <__aeabi_fmul+0x11e>
    321c:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    3220:	bf18      	it	ne
    3222:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    3226:	d1d8      	bne.n	31da <__aeabi_fmul+0xc6>
    3228:	ea80 0001 	eor.w	r0, r0, r1
    322c:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    3230:	4770      	bx	lr
    3232:	f090 0f00 	teq	r0, #0
    3236:	bf17      	itett	ne
    3238:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
    323c:	4608      	moveq	r0, r1
    323e:	f091 0f00 	teqne	r1, #0
    3242:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
    3246:	d014      	beq.n	3272 <__aeabi_fmul+0x15e>
    3248:	ea92 0f0c 	teq	r2, ip
    324c:	d101      	bne.n	3252 <__aeabi_fmul+0x13e>
    324e:	0242      	lsls	r2, r0, #9
    3250:	d10f      	bne.n	3272 <__aeabi_fmul+0x15e>
    3252:	ea93 0f0c 	teq	r3, ip
    3256:	d103      	bne.n	3260 <__aeabi_fmul+0x14c>
    3258:	024b      	lsls	r3, r1, #9
    325a:	bf18      	it	ne
    325c:	4608      	movne	r0, r1
    325e:	d108      	bne.n	3272 <__aeabi_fmul+0x15e>
    3260:	ea80 0001 	eor.w	r0, r0, r1
    3264:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    3268:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    326c:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    3270:	4770      	bx	lr
    3272:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    3276:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
    327a:	4770      	bx	lr

0000327c <__aeabi_fdiv>:
    327c:	f04f 0cff 	mov.w	ip, #255	; 0xff
    3280:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    3284:	bf1e      	ittt	ne
    3286:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    328a:	ea92 0f0c 	teqne	r2, ip
    328e:	ea93 0f0c 	teqne	r3, ip
    3292:	d069      	beq.n	3368 <__aeabi_fdiv+0xec>
    3294:	eba2 0203 	sub.w	r2, r2, r3
    3298:	ea80 0c01 	eor.w	ip, r0, r1
    329c:	0249      	lsls	r1, r1, #9
    329e:	ea4f 2040 	mov.w	r0, r0, lsl #9
    32a2:	d037      	beq.n	3314 <__aeabi_fdiv+0x98>
    32a4:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    32a8:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
    32ac:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
    32b0:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    32b4:	428b      	cmp	r3, r1
    32b6:	bf38      	it	cc
    32b8:	005b      	lslcc	r3, r3, #1
    32ba:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
    32be:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
    32c2:	428b      	cmp	r3, r1
    32c4:	bf24      	itt	cs
    32c6:	1a5b      	subcs	r3, r3, r1
    32c8:	ea40 000c 	orrcs.w	r0, r0, ip
    32cc:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
    32d0:	bf24      	itt	cs
    32d2:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
    32d6:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    32da:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
    32de:	bf24      	itt	cs
    32e0:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
    32e4:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    32e8:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
    32ec:	bf24      	itt	cs
    32ee:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
    32f2:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    32f6:	011b      	lsls	r3, r3, #4
    32f8:	bf18      	it	ne
    32fa:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
    32fe:	d1e0      	bne.n	32c2 <__aeabi_fdiv+0x46>
    3300:	2afd      	cmp	r2, #253	; 0xfd
    3302:	f63f af50 	bhi.w	31a6 <__aeabi_fmul+0x92>
    3306:	428b      	cmp	r3, r1
    3308:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    330c:	bf08      	it	eq
    330e:	f020 0001 	biceq.w	r0, r0, #1
    3312:	4770      	bx	lr
    3314:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    3318:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    331c:	327f      	adds	r2, #127	; 0x7f
    331e:	bfc2      	ittt	gt
    3320:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    3324:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    3328:	4770      	bxgt	lr
    332a:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    332e:	f04f 0300 	mov.w	r3, #0
    3332:	3a01      	subs	r2, #1
    3334:	e737      	b.n	31a6 <__aeabi_fmul+0x92>
    3336:	f092 0f00 	teq	r2, #0
    333a:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    333e:	bf02      	ittt	eq
    3340:	0040      	lsleq	r0, r0, #1
    3342:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    3346:	3a01      	subeq	r2, #1
    3348:	d0f9      	beq.n	333e <__aeabi_fdiv+0xc2>
    334a:	ea40 000c 	orr.w	r0, r0, ip
    334e:	f093 0f00 	teq	r3, #0
    3352:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    3356:	bf02      	ittt	eq
    3358:	0049      	lsleq	r1, r1, #1
    335a:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    335e:	3b01      	subeq	r3, #1
    3360:	d0f9      	beq.n	3356 <__aeabi_fdiv+0xda>
    3362:	ea41 010c 	orr.w	r1, r1, ip
    3366:	e795      	b.n	3294 <__aeabi_fdiv+0x18>
    3368:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    336c:	ea92 0f0c 	teq	r2, ip
    3370:	d108      	bne.n	3384 <__aeabi_fdiv+0x108>
    3372:	0242      	lsls	r2, r0, #9
    3374:	f47f af7d 	bne.w	3272 <__aeabi_fmul+0x15e>
    3378:	ea93 0f0c 	teq	r3, ip
    337c:	f47f af70 	bne.w	3260 <__aeabi_fmul+0x14c>
    3380:	4608      	mov	r0, r1
    3382:	e776      	b.n	3272 <__aeabi_fmul+0x15e>
    3384:	ea93 0f0c 	teq	r3, ip
    3388:	d104      	bne.n	3394 <__aeabi_fdiv+0x118>
    338a:	024b      	lsls	r3, r1, #9
    338c:	f43f af4c 	beq.w	3228 <__aeabi_fmul+0x114>
    3390:	4608      	mov	r0, r1
    3392:	e76e      	b.n	3272 <__aeabi_fmul+0x15e>
    3394:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    3398:	bf18      	it	ne
    339a:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    339e:	d1ca      	bne.n	3336 <__aeabi_fdiv+0xba>
    33a0:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
    33a4:	f47f af5c 	bne.w	3260 <__aeabi_fmul+0x14c>
    33a8:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
    33ac:	f47f af3c 	bne.w	3228 <__aeabi_fmul+0x114>
    33b0:	e75f      	b.n	3272 <__aeabi_fmul+0x15e>
    33b2:	bf00      	nop

000033b4 <__cxa_atexit>:
    33b4:	4613      	mov	r3, r2
    33b6:	460a      	mov	r2, r1
    33b8:	4601      	mov	r1, r0
    33ba:	2002      	movs	r0, #2
    33bc:	f000 bb04 	b.w	39c8 <__register_exitproc>

000033c0 <__errno>:
    33c0:	4b01      	ldr	r3, [pc, #4]	; (33c8 <__errno+0x8>)
    33c2:	6818      	ldr	r0, [r3, #0]
    33c4:	4770      	bx	lr
    33c6:	bf00      	nop
    33c8:	1fff8dd8 	.word	0x1fff8dd8

000033cc <__libc_init_array>:
    33cc:	b570      	push	{r4, r5, r6, lr}
    33ce:	4e0f      	ldr	r6, [pc, #60]	; (340c <__libc_init_array+0x40>)
    33d0:	4d0f      	ldr	r5, [pc, #60]	; (3410 <__libc_init_array+0x44>)
    33d2:	1b76      	subs	r6, r6, r5
    33d4:	10b6      	asrs	r6, r6, #2
    33d6:	bf18      	it	ne
    33d8:	2400      	movne	r4, #0
    33da:	d005      	beq.n	33e8 <__libc_init_array+0x1c>
    33dc:	3401      	adds	r4, #1
    33de:	f855 3b04 	ldr.w	r3, [r5], #4
    33e2:	4798      	blx	r3
    33e4:	42a6      	cmp	r6, r4
    33e6:	d1f9      	bne.n	33dc <__libc_init_array+0x10>
    33e8:	4e0a      	ldr	r6, [pc, #40]	; (3414 <__libc_init_array+0x48>)
    33ea:	4d0b      	ldr	r5, [pc, #44]	; (3418 <__libc_init_array+0x4c>)
    33ec:	1b76      	subs	r6, r6, r5
    33ee:	f000 fd8f 	bl	3f10 <_init>
    33f2:	10b6      	asrs	r6, r6, #2
    33f4:	bf18      	it	ne
    33f6:	2400      	movne	r4, #0
    33f8:	d006      	beq.n	3408 <__libc_init_array+0x3c>
    33fa:	3401      	adds	r4, #1
    33fc:	f855 3b04 	ldr.w	r3, [r5], #4
    3400:	4798      	blx	r3
    3402:	42a6      	cmp	r6, r4
    3404:	d1f9      	bne.n	33fa <__libc_init_array+0x2e>
    3406:	bd70      	pop	{r4, r5, r6, pc}
    3408:	bd70      	pop	{r4, r5, r6, pc}
    340a:	bf00      	nop
    340c:	00003f1c 	.word	0x00003f1c
    3410:	00003f1c 	.word	0x00003f1c
    3414:	00003f28 	.word	0x00003f28
    3418:	00003f1c 	.word	0x00003f1c

0000341c <malloc>:
    341c:	4b02      	ldr	r3, [pc, #8]	; (3428 <malloc+0xc>)
    341e:	4601      	mov	r1, r0
    3420:	6818      	ldr	r0, [r3, #0]
    3422:	f000 b803 	b.w	342c <_malloc_r>
    3426:	bf00      	nop
    3428:	1fff8dd8 	.word	0x1fff8dd8

0000342c <_malloc_r>:
    342c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3430:	f101 050b 	add.w	r5, r1, #11
    3434:	2d16      	cmp	r5, #22
    3436:	b083      	sub	sp, #12
    3438:	4606      	mov	r6, r0
    343a:	f240 809f 	bls.w	357c <_malloc_r+0x150>
    343e:	f035 0507 	bics.w	r5, r5, #7
    3442:	f100 80bf 	bmi.w	35c4 <_malloc_r+0x198>
    3446:	42a9      	cmp	r1, r5
    3448:	f200 80bc 	bhi.w	35c4 <_malloc_r+0x198>
    344c:	f000 faa6 	bl	399c <__malloc_lock>
    3450:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    3454:	f0c0 829c 	bcc.w	3990 <_malloc_r+0x564>
    3458:	0a6b      	lsrs	r3, r5, #9
    345a:	f000 80ba 	beq.w	35d2 <_malloc_r+0x1a6>
    345e:	2b04      	cmp	r3, #4
    3460:	f200 8183 	bhi.w	376a <_malloc_r+0x33e>
    3464:	09a8      	lsrs	r0, r5, #6
    3466:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    346a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    346e:	3038      	adds	r0, #56	; 0x38
    3470:	4fc4      	ldr	r7, [pc, #784]	; (3784 <_malloc_r+0x358>)
    3472:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    3476:	f1a3 0108 	sub.w	r1, r3, #8
    347a:	685c      	ldr	r4, [r3, #4]
    347c:	42a1      	cmp	r1, r4
    347e:	d107      	bne.n	3490 <_malloc_r+0x64>
    3480:	e0ac      	b.n	35dc <_malloc_r+0x1b0>
    3482:	2a00      	cmp	r2, #0
    3484:	f280 80ac 	bge.w	35e0 <_malloc_r+0x1b4>
    3488:	68e4      	ldr	r4, [r4, #12]
    348a:	42a1      	cmp	r1, r4
    348c:	f000 80a6 	beq.w	35dc <_malloc_r+0x1b0>
    3490:	6863      	ldr	r3, [r4, #4]
    3492:	f023 0303 	bic.w	r3, r3, #3
    3496:	1b5a      	subs	r2, r3, r5
    3498:	2a0f      	cmp	r2, #15
    349a:	ddf2      	ble.n	3482 <_malloc_r+0x56>
    349c:	49b9      	ldr	r1, [pc, #740]	; (3784 <_malloc_r+0x358>)
    349e:	693c      	ldr	r4, [r7, #16]
    34a0:	f101 0e08 	add.w	lr, r1, #8
    34a4:	4574      	cmp	r4, lr
    34a6:	f000 81b3 	beq.w	3810 <_malloc_r+0x3e4>
    34aa:	6863      	ldr	r3, [r4, #4]
    34ac:	f023 0303 	bic.w	r3, r3, #3
    34b0:	1b5a      	subs	r2, r3, r5
    34b2:	2a0f      	cmp	r2, #15
    34b4:	f300 8199 	bgt.w	37ea <_malloc_r+0x3be>
    34b8:	2a00      	cmp	r2, #0
    34ba:	f8c1 e014 	str.w	lr, [r1, #20]
    34be:	f8c1 e010 	str.w	lr, [r1, #16]
    34c2:	f280 809e 	bge.w	3602 <_malloc_r+0x1d6>
    34c6:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    34ca:	f080 8167 	bcs.w	379c <_malloc_r+0x370>
    34ce:	08db      	lsrs	r3, r3, #3
    34d0:	f103 0c01 	add.w	ip, r3, #1
    34d4:	2201      	movs	r2, #1
    34d6:	109b      	asrs	r3, r3, #2
    34d8:	fa02 f303 	lsl.w	r3, r2, r3
    34dc:	684a      	ldr	r2, [r1, #4]
    34de:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    34e2:	f8c4 8008 	str.w	r8, [r4, #8]
    34e6:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    34ea:	431a      	orrs	r2, r3
    34ec:	f1a9 0308 	sub.w	r3, r9, #8
    34f0:	60e3      	str	r3, [r4, #12]
    34f2:	604a      	str	r2, [r1, #4]
    34f4:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    34f8:	f8c8 400c 	str.w	r4, [r8, #12]
    34fc:	1083      	asrs	r3, r0, #2
    34fe:	2401      	movs	r4, #1
    3500:	409c      	lsls	r4, r3
    3502:	4294      	cmp	r4, r2
    3504:	f200 808a 	bhi.w	361c <_malloc_r+0x1f0>
    3508:	4214      	tst	r4, r2
    350a:	d106      	bne.n	351a <_malloc_r+0xee>
    350c:	f020 0003 	bic.w	r0, r0, #3
    3510:	0064      	lsls	r4, r4, #1
    3512:	4214      	tst	r4, r2
    3514:	f100 0004 	add.w	r0, r0, #4
    3518:	d0fa      	beq.n	3510 <_malloc_r+0xe4>
    351a:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    351e:	46cc      	mov	ip, r9
    3520:	4680      	mov	r8, r0
    3522:	f8dc 100c 	ldr.w	r1, [ip, #12]
    3526:	458c      	cmp	ip, r1
    3528:	d107      	bne.n	353a <_malloc_r+0x10e>
    352a:	e173      	b.n	3814 <_malloc_r+0x3e8>
    352c:	2a00      	cmp	r2, #0
    352e:	f280 8181 	bge.w	3834 <_malloc_r+0x408>
    3532:	68c9      	ldr	r1, [r1, #12]
    3534:	458c      	cmp	ip, r1
    3536:	f000 816d 	beq.w	3814 <_malloc_r+0x3e8>
    353a:	684b      	ldr	r3, [r1, #4]
    353c:	f023 0303 	bic.w	r3, r3, #3
    3540:	1b5a      	subs	r2, r3, r5
    3542:	2a0f      	cmp	r2, #15
    3544:	ddf2      	ble.n	352c <_malloc_r+0x100>
    3546:	460c      	mov	r4, r1
    3548:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    354c:	f854 8f08 	ldr.w	r8, [r4, #8]!
    3550:	194b      	adds	r3, r1, r5
    3552:	f045 0501 	orr.w	r5, r5, #1
    3556:	604d      	str	r5, [r1, #4]
    3558:	f042 0101 	orr.w	r1, r2, #1
    355c:	f8c8 c00c 	str.w	ip, [r8, #12]
    3560:	4630      	mov	r0, r6
    3562:	f8cc 8008 	str.w	r8, [ip, #8]
    3566:	617b      	str	r3, [r7, #20]
    3568:	613b      	str	r3, [r7, #16]
    356a:	f8c3 e00c 	str.w	lr, [r3, #12]
    356e:	f8c3 e008 	str.w	lr, [r3, #8]
    3572:	6059      	str	r1, [r3, #4]
    3574:	509a      	str	r2, [r3, r2]
    3576:	f000 fa13 	bl	39a0 <__malloc_unlock>
    357a:	e01f      	b.n	35bc <_malloc_r+0x190>
    357c:	2910      	cmp	r1, #16
    357e:	d821      	bhi.n	35c4 <_malloc_r+0x198>
    3580:	f000 fa0c 	bl	399c <__malloc_lock>
    3584:	2510      	movs	r5, #16
    3586:	2306      	movs	r3, #6
    3588:	2002      	movs	r0, #2
    358a:	4f7e      	ldr	r7, [pc, #504]	; (3784 <_malloc_r+0x358>)
    358c:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    3590:	f1a3 0208 	sub.w	r2, r3, #8
    3594:	685c      	ldr	r4, [r3, #4]
    3596:	4294      	cmp	r4, r2
    3598:	f000 8145 	beq.w	3826 <_malloc_r+0x3fa>
    359c:	6863      	ldr	r3, [r4, #4]
    359e:	68e1      	ldr	r1, [r4, #12]
    35a0:	68a5      	ldr	r5, [r4, #8]
    35a2:	f023 0303 	bic.w	r3, r3, #3
    35a6:	4423      	add	r3, r4
    35a8:	4630      	mov	r0, r6
    35aa:	685a      	ldr	r2, [r3, #4]
    35ac:	60e9      	str	r1, [r5, #12]
    35ae:	f042 0201 	orr.w	r2, r2, #1
    35b2:	608d      	str	r5, [r1, #8]
    35b4:	605a      	str	r2, [r3, #4]
    35b6:	f000 f9f3 	bl	39a0 <__malloc_unlock>
    35ba:	3408      	adds	r4, #8
    35bc:	4620      	mov	r0, r4
    35be:	b003      	add	sp, #12
    35c0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    35c4:	2400      	movs	r4, #0
    35c6:	230c      	movs	r3, #12
    35c8:	4620      	mov	r0, r4
    35ca:	6033      	str	r3, [r6, #0]
    35cc:	b003      	add	sp, #12
    35ce:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    35d2:	2380      	movs	r3, #128	; 0x80
    35d4:	f04f 0e40 	mov.w	lr, #64	; 0x40
    35d8:	203f      	movs	r0, #63	; 0x3f
    35da:	e749      	b.n	3470 <_malloc_r+0x44>
    35dc:	4670      	mov	r0, lr
    35de:	e75d      	b.n	349c <_malloc_r+0x70>
    35e0:	4423      	add	r3, r4
    35e2:	68e1      	ldr	r1, [r4, #12]
    35e4:	685a      	ldr	r2, [r3, #4]
    35e6:	68a5      	ldr	r5, [r4, #8]
    35e8:	f042 0201 	orr.w	r2, r2, #1
    35ec:	60e9      	str	r1, [r5, #12]
    35ee:	4630      	mov	r0, r6
    35f0:	608d      	str	r5, [r1, #8]
    35f2:	605a      	str	r2, [r3, #4]
    35f4:	f000 f9d4 	bl	39a0 <__malloc_unlock>
    35f8:	3408      	adds	r4, #8
    35fa:	4620      	mov	r0, r4
    35fc:	b003      	add	sp, #12
    35fe:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3602:	4423      	add	r3, r4
    3604:	4630      	mov	r0, r6
    3606:	685a      	ldr	r2, [r3, #4]
    3608:	f042 0201 	orr.w	r2, r2, #1
    360c:	605a      	str	r2, [r3, #4]
    360e:	f000 f9c7 	bl	39a0 <__malloc_unlock>
    3612:	3408      	adds	r4, #8
    3614:	4620      	mov	r0, r4
    3616:	b003      	add	sp, #12
    3618:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    361c:	68bc      	ldr	r4, [r7, #8]
    361e:	6863      	ldr	r3, [r4, #4]
    3620:	f023 0803 	bic.w	r8, r3, #3
    3624:	45a8      	cmp	r8, r5
    3626:	d304      	bcc.n	3632 <_malloc_r+0x206>
    3628:	ebc5 0308 	rsb	r3, r5, r8
    362c:	2b0f      	cmp	r3, #15
    362e:	f300 808c 	bgt.w	374a <_malloc_r+0x31e>
    3632:	4b55      	ldr	r3, [pc, #340]	; (3788 <_malloc_r+0x35c>)
    3634:	f8df 9160 	ldr.w	r9, [pc, #352]	; 3798 <_malloc_r+0x36c>
    3638:	681a      	ldr	r2, [r3, #0]
    363a:	f8d9 3000 	ldr.w	r3, [r9]
    363e:	3301      	adds	r3, #1
    3640:	442a      	add	r2, r5
    3642:	eb04 0a08 	add.w	sl, r4, r8
    3646:	f000 8160 	beq.w	390a <_malloc_r+0x4de>
    364a:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    364e:	320f      	adds	r2, #15
    3650:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    3654:	f022 020f 	bic.w	r2, r2, #15
    3658:	4611      	mov	r1, r2
    365a:	4630      	mov	r0, r6
    365c:	9201      	str	r2, [sp, #4]
    365e:	f000 f9a1 	bl	39a4 <_sbrk_r>
    3662:	f1b0 3fff 	cmp.w	r0, #4294967295
    3666:	4683      	mov	fp, r0
    3668:	9a01      	ldr	r2, [sp, #4]
    366a:	f000 8158 	beq.w	391e <_malloc_r+0x4f2>
    366e:	4582      	cmp	sl, r0
    3670:	f200 80fc 	bhi.w	386c <_malloc_r+0x440>
    3674:	4b45      	ldr	r3, [pc, #276]	; (378c <_malloc_r+0x360>)
    3676:	6819      	ldr	r1, [r3, #0]
    3678:	45da      	cmp	sl, fp
    367a:	4411      	add	r1, r2
    367c:	6019      	str	r1, [r3, #0]
    367e:	f000 8153 	beq.w	3928 <_malloc_r+0x4fc>
    3682:	f8d9 0000 	ldr.w	r0, [r9]
    3686:	f8df e110 	ldr.w	lr, [pc, #272]	; 3798 <_malloc_r+0x36c>
    368a:	3001      	adds	r0, #1
    368c:	bf1b      	ittet	ne
    368e:	ebca 0a0b 	rsbne	sl, sl, fp
    3692:	4451      	addne	r1, sl
    3694:	f8ce b000 	streq.w	fp, [lr]
    3698:	6019      	strne	r1, [r3, #0]
    369a:	f01b 0107 	ands.w	r1, fp, #7
    369e:	f000 8117 	beq.w	38d0 <_malloc_r+0x4a4>
    36a2:	f1c1 0008 	rsb	r0, r1, #8
    36a6:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    36aa:	4483      	add	fp, r0
    36ac:	3108      	adds	r1, #8
    36ae:	445a      	add	r2, fp
    36b0:	f3c2 020b 	ubfx	r2, r2, #0, #12
    36b4:	ebc2 0901 	rsb	r9, r2, r1
    36b8:	4649      	mov	r1, r9
    36ba:	4630      	mov	r0, r6
    36bc:	9301      	str	r3, [sp, #4]
    36be:	f000 f971 	bl	39a4 <_sbrk_r>
    36c2:	1c43      	adds	r3, r0, #1
    36c4:	9b01      	ldr	r3, [sp, #4]
    36c6:	f000 813f 	beq.w	3948 <_malloc_r+0x51c>
    36ca:	ebcb 0200 	rsb	r2, fp, r0
    36ce:	444a      	add	r2, r9
    36d0:	f042 0201 	orr.w	r2, r2, #1
    36d4:	6819      	ldr	r1, [r3, #0]
    36d6:	f8c7 b008 	str.w	fp, [r7, #8]
    36da:	4449      	add	r1, r9
    36dc:	42bc      	cmp	r4, r7
    36de:	f8cb 2004 	str.w	r2, [fp, #4]
    36e2:	6019      	str	r1, [r3, #0]
    36e4:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 378c <_malloc_r+0x360>
    36e8:	d016      	beq.n	3718 <_malloc_r+0x2ec>
    36ea:	f1b8 0f0f 	cmp.w	r8, #15
    36ee:	f240 80fd 	bls.w	38ec <_malloc_r+0x4c0>
    36f2:	6862      	ldr	r2, [r4, #4]
    36f4:	f1a8 030c 	sub.w	r3, r8, #12
    36f8:	f023 0307 	bic.w	r3, r3, #7
    36fc:	18e0      	adds	r0, r4, r3
    36fe:	f002 0201 	and.w	r2, r2, #1
    3702:	f04f 0e05 	mov.w	lr, #5
    3706:	431a      	orrs	r2, r3
    3708:	2b0f      	cmp	r3, #15
    370a:	6062      	str	r2, [r4, #4]
    370c:	f8c0 e004 	str.w	lr, [r0, #4]
    3710:	f8c0 e008 	str.w	lr, [r0, #8]
    3714:	f200 811c 	bhi.w	3950 <_malloc_r+0x524>
    3718:	4b1d      	ldr	r3, [pc, #116]	; (3790 <_malloc_r+0x364>)
    371a:	68bc      	ldr	r4, [r7, #8]
    371c:	681a      	ldr	r2, [r3, #0]
    371e:	4291      	cmp	r1, r2
    3720:	bf88      	it	hi
    3722:	6019      	strhi	r1, [r3, #0]
    3724:	4b1b      	ldr	r3, [pc, #108]	; (3794 <_malloc_r+0x368>)
    3726:	681a      	ldr	r2, [r3, #0]
    3728:	4291      	cmp	r1, r2
    372a:	6862      	ldr	r2, [r4, #4]
    372c:	bf88      	it	hi
    372e:	6019      	strhi	r1, [r3, #0]
    3730:	f022 0203 	bic.w	r2, r2, #3
    3734:	4295      	cmp	r5, r2
    3736:	eba2 0305 	sub.w	r3, r2, r5
    373a:	d801      	bhi.n	3740 <_malloc_r+0x314>
    373c:	2b0f      	cmp	r3, #15
    373e:	dc04      	bgt.n	374a <_malloc_r+0x31e>
    3740:	4630      	mov	r0, r6
    3742:	f000 f92d 	bl	39a0 <__malloc_unlock>
    3746:	2400      	movs	r4, #0
    3748:	e738      	b.n	35bc <_malloc_r+0x190>
    374a:	1962      	adds	r2, r4, r5
    374c:	f043 0301 	orr.w	r3, r3, #1
    3750:	f045 0501 	orr.w	r5, r5, #1
    3754:	6065      	str	r5, [r4, #4]
    3756:	4630      	mov	r0, r6
    3758:	60ba      	str	r2, [r7, #8]
    375a:	6053      	str	r3, [r2, #4]
    375c:	f000 f920 	bl	39a0 <__malloc_unlock>
    3760:	3408      	adds	r4, #8
    3762:	4620      	mov	r0, r4
    3764:	b003      	add	sp, #12
    3766:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    376a:	2b14      	cmp	r3, #20
    376c:	d971      	bls.n	3852 <_malloc_r+0x426>
    376e:	2b54      	cmp	r3, #84	; 0x54
    3770:	f200 80a4 	bhi.w	38bc <_malloc_r+0x490>
    3774:	0b28      	lsrs	r0, r5, #12
    3776:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    377a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    377e:	306e      	adds	r0, #110	; 0x6e
    3780:	e676      	b.n	3470 <_malloc_r+0x44>
    3782:	bf00      	nop
    3784:	1fff8ddc 	.word	0x1fff8ddc
    3788:	1fff9668 	.word	0x1fff9668
    378c:	1fff966c 	.word	0x1fff966c
    3790:	1fff9664 	.word	0x1fff9664
    3794:	1fff9660 	.word	0x1fff9660
    3798:	1fff91e8 	.word	0x1fff91e8
    379c:	0a5a      	lsrs	r2, r3, #9
    379e:	2a04      	cmp	r2, #4
    37a0:	d95e      	bls.n	3860 <_malloc_r+0x434>
    37a2:	2a14      	cmp	r2, #20
    37a4:	f200 80b3 	bhi.w	390e <_malloc_r+0x4e2>
    37a8:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    37ac:	0049      	lsls	r1, r1, #1
    37ae:	325b      	adds	r2, #91	; 0x5b
    37b0:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    37b4:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    37b8:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 3998 <_malloc_r+0x56c>
    37bc:	f1ac 0c08 	sub.w	ip, ip, #8
    37c0:	458c      	cmp	ip, r1
    37c2:	f000 8088 	beq.w	38d6 <_malloc_r+0x4aa>
    37c6:	684a      	ldr	r2, [r1, #4]
    37c8:	f022 0203 	bic.w	r2, r2, #3
    37cc:	4293      	cmp	r3, r2
    37ce:	d202      	bcs.n	37d6 <_malloc_r+0x3aa>
    37d0:	6889      	ldr	r1, [r1, #8]
    37d2:	458c      	cmp	ip, r1
    37d4:	d1f7      	bne.n	37c6 <_malloc_r+0x39a>
    37d6:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    37da:	687a      	ldr	r2, [r7, #4]
    37dc:	f8c4 c00c 	str.w	ip, [r4, #12]
    37e0:	60a1      	str	r1, [r4, #8]
    37e2:	f8cc 4008 	str.w	r4, [ip, #8]
    37e6:	60cc      	str	r4, [r1, #12]
    37e8:	e688      	b.n	34fc <_malloc_r+0xd0>
    37ea:	1963      	adds	r3, r4, r5
    37ec:	f042 0701 	orr.w	r7, r2, #1
    37f0:	f045 0501 	orr.w	r5, r5, #1
    37f4:	6065      	str	r5, [r4, #4]
    37f6:	4630      	mov	r0, r6
    37f8:	614b      	str	r3, [r1, #20]
    37fa:	610b      	str	r3, [r1, #16]
    37fc:	f8c3 e00c 	str.w	lr, [r3, #12]
    3800:	f8c3 e008 	str.w	lr, [r3, #8]
    3804:	605f      	str	r7, [r3, #4]
    3806:	509a      	str	r2, [r3, r2]
    3808:	3408      	adds	r4, #8
    380a:	f000 f8c9 	bl	39a0 <__malloc_unlock>
    380e:	e6d5      	b.n	35bc <_malloc_r+0x190>
    3810:	684a      	ldr	r2, [r1, #4]
    3812:	e673      	b.n	34fc <_malloc_r+0xd0>
    3814:	f108 0801 	add.w	r8, r8, #1
    3818:	f018 0f03 	tst.w	r8, #3
    381c:	f10c 0c08 	add.w	ip, ip, #8
    3820:	f47f ae7f 	bne.w	3522 <_malloc_r+0xf6>
    3824:	e030      	b.n	3888 <_malloc_r+0x45c>
    3826:	68dc      	ldr	r4, [r3, #12]
    3828:	42a3      	cmp	r3, r4
    382a:	bf08      	it	eq
    382c:	3002      	addeq	r0, #2
    382e:	f43f ae35 	beq.w	349c <_malloc_r+0x70>
    3832:	e6b3      	b.n	359c <_malloc_r+0x170>
    3834:	440b      	add	r3, r1
    3836:	460c      	mov	r4, r1
    3838:	685a      	ldr	r2, [r3, #4]
    383a:	68c9      	ldr	r1, [r1, #12]
    383c:	f854 5f08 	ldr.w	r5, [r4, #8]!
    3840:	f042 0201 	orr.w	r2, r2, #1
    3844:	605a      	str	r2, [r3, #4]
    3846:	4630      	mov	r0, r6
    3848:	60e9      	str	r1, [r5, #12]
    384a:	608d      	str	r5, [r1, #8]
    384c:	f000 f8a8 	bl	39a0 <__malloc_unlock>
    3850:	e6b4      	b.n	35bc <_malloc_r+0x190>
    3852:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    3856:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    385a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    385e:	e607      	b.n	3470 <_malloc_r+0x44>
    3860:	099a      	lsrs	r2, r3, #6
    3862:	f102 0139 	add.w	r1, r2, #57	; 0x39
    3866:	0049      	lsls	r1, r1, #1
    3868:	3238      	adds	r2, #56	; 0x38
    386a:	e7a1      	b.n	37b0 <_malloc_r+0x384>
    386c:	42bc      	cmp	r4, r7
    386e:	4b4a      	ldr	r3, [pc, #296]	; (3998 <_malloc_r+0x56c>)
    3870:	f43f af00 	beq.w	3674 <_malloc_r+0x248>
    3874:	689c      	ldr	r4, [r3, #8]
    3876:	6862      	ldr	r2, [r4, #4]
    3878:	f022 0203 	bic.w	r2, r2, #3
    387c:	e75a      	b.n	3734 <_malloc_r+0x308>
    387e:	f859 3908 	ldr.w	r3, [r9], #-8
    3882:	4599      	cmp	r9, r3
    3884:	f040 8082 	bne.w	398c <_malloc_r+0x560>
    3888:	f010 0f03 	tst.w	r0, #3
    388c:	f100 30ff 	add.w	r0, r0, #4294967295
    3890:	d1f5      	bne.n	387e <_malloc_r+0x452>
    3892:	687b      	ldr	r3, [r7, #4]
    3894:	ea23 0304 	bic.w	r3, r3, r4
    3898:	607b      	str	r3, [r7, #4]
    389a:	0064      	lsls	r4, r4, #1
    389c:	429c      	cmp	r4, r3
    389e:	f63f aebd 	bhi.w	361c <_malloc_r+0x1f0>
    38a2:	2c00      	cmp	r4, #0
    38a4:	f43f aeba 	beq.w	361c <_malloc_r+0x1f0>
    38a8:	421c      	tst	r4, r3
    38aa:	4640      	mov	r0, r8
    38ac:	f47f ae35 	bne.w	351a <_malloc_r+0xee>
    38b0:	0064      	lsls	r4, r4, #1
    38b2:	421c      	tst	r4, r3
    38b4:	f100 0004 	add.w	r0, r0, #4
    38b8:	d0fa      	beq.n	38b0 <_malloc_r+0x484>
    38ba:	e62e      	b.n	351a <_malloc_r+0xee>
    38bc:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    38c0:	d818      	bhi.n	38f4 <_malloc_r+0x4c8>
    38c2:	0be8      	lsrs	r0, r5, #15
    38c4:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    38c8:	ea4f 034e 	mov.w	r3, lr, lsl #1
    38cc:	3077      	adds	r0, #119	; 0x77
    38ce:	e5cf      	b.n	3470 <_malloc_r+0x44>
    38d0:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    38d4:	e6eb      	b.n	36ae <_malloc_r+0x282>
    38d6:	2101      	movs	r1, #1
    38d8:	f8d8 3004 	ldr.w	r3, [r8, #4]
    38dc:	1092      	asrs	r2, r2, #2
    38de:	fa01 f202 	lsl.w	r2, r1, r2
    38e2:	431a      	orrs	r2, r3
    38e4:	f8c8 2004 	str.w	r2, [r8, #4]
    38e8:	4661      	mov	r1, ip
    38ea:	e777      	b.n	37dc <_malloc_r+0x3b0>
    38ec:	2301      	movs	r3, #1
    38ee:	f8cb 3004 	str.w	r3, [fp, #4]
    38f2:	e725      	b.n	3740 <_malloc_r+0x314>
    38f4:	f240 5254 	movw	r2, #1364	; 0x554
    38f8:	4293      	cmp	r3, r2
    38fa:	d820      	bhi.n	393e <_malloc_r+0x512>
    38fc:	0ca8      	lsrs	r0, r5, #18
    38fe:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    3902:	ea4f 034e 	mov.w	r3, lr, lsl #1
    3906:	307c      	adds	r0, #124	; 0x7c
    3908:	e5b2      	b.n	3470 <_malloc_r+0x44>
    390a:	3210      	adds	r2, #16
    390c:	e6a4      	b.n	3658 <_malloc_r+0x22c>
    390e:	2a54      	cmp	r2, #84	; 0x54
    3910:	d826      	bhi.n	3960 <_malloc_r+0x534>
    3912:	0b1a      	lsrs	r2, r3, #12
    3914:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    3918:	0049      	lsls	r1, r1, #1
    391a:	326e      	adds	r2, #110	; 0x6e
    391c:	e748      	b.n	37b0 <_malloc_r+0x384>
    391e:	68bc      	ldr	r4, [r7, #8]
    3920:	6862      	ldr	r2, [r4, #4]
    3922:	f022 0203 	bic.w	r2, r2, #3
    3926:	e705      	b.n	3734 <_malloc_r+0x308>
    3928:	f3ca 000b 	ubfx	r0, sl, #0, #12
    392c:	2800      	cmp	r0, #0
    392e:	f47f aea8 	bne.w	3682 <_malloc_r+0x256>
    3932:	4442      	add	r2, r8
    3934:	68bb      	ldr	r3, [r7, #8]
    3936:	f042 0201 	orr.w	r2, r2, #1
    393a:	605a      	str	r2, [r3, #4]
    393c:	e6ec      	b.n	3718 <_malloc_r+0x2ec>
    393e:	23fe      	movs	r3, #254	; 0xfe
    3940:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    3944:	207e      	movs	r0, #126	; 0x7e
    3946:	e593      	b.n	3470 <_malloc_r+0x44>
    3948:	2201      	movs	r2, #1
    394a:	f04f 0900 	mov.w	r9, #0
    394e:	e6c1      	b.n	36d4 <_malloc_r+0x2a8>
    3950:	f104 0108 	add.w	r1, r4, #8
    3954:	4630      	mov	r0, r6
    3956:	f000 f8fb 	bl	3b50 <_free_r>
    395a:	f8d9 1000 	ldr.w	r1, [r9]
    395e:	e6db      	b.n	3718 <_malloc_r+0x2ec>
    3960:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    3964:	d805      	bhi.n	3972 <_malloc_r+0x546>
    3966:	0bda      	lsrs	r2, r3, #15
    3968:	f102 0178 	add.w	r1, r2, #120	; 0x78
    396c:	0049      	lsls	r1, r1, #1
    396e:	3277      	adds	r2, #119	; 0x77
    3970:	e71e      	b.n	37b0 <_malloc_r+0x384>
    3972:	f240 5154 	movw	r1, #1364	; 0x554
    3976:	428a      	cmp	r2, r1
    3978:	d805      	bhi.n	3986 <_malloc_r+0x55a>
    397a:	0c9a      	lsrs	r2, r3, #18
    397c:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    3980:	0049      	lsls	r1, r1, #1
    3982:	327c      	adds	r2, #124	; 0x7c
    3984:	e714      	b.n	37b0 <_malloc_r+0x384>
    3986:	21fe      	movs	r1, #254	; 0xfe
    3988:	227e      	movs	r2, #126	; 0x7e
    398a:	e711      	b.n	37b0 <_malloc_r+0x384>
    398c:	687b      	ldr	r3, [r7, #4]
    398e:	e784      	b.n	389a <_malloc_r+0x46e>
    3990:	08e8      	lsrs	r0, r5, #3
    3992:	1c43      	adds	r3, r0, #1
    3994:	005b      	lsls	r3, r3, #1
    3996:	e5f8      	b.n	358a <_malloc_r+0x15e>
    3998:	1fff8ddc 	.word	0x1fff8ddc

0000399c <__malloc_lock>:
    399c:	4770      	bx	lr
    399e:	bf00      	nop

000039a0 <__malloc_unlock>:
    39a0:	4770      	bx	lr
    39a2:	bf00      	nop

000039a4 <_sbrk_r>:
    39a4:	b538      	push	{r3, r4, r5, lr}
    39a6:	4c07      	ldr	r4, [pc, #28]	; (39c4 <_sbrk_r+0x20>)
    39a8:	2300      	movs	r3, #0
    39aa:	4605      	mov	r5, r0
    39ac:	4608      	mov	r0, r1
    39ae:	6023      	str	r3, [r4, #0]
    39b0:	f7fd f99c 	bl	cec <_sbrk>
    39b4:	1c43      	adds	r3, r0, #1
    39b6:	d000      	beq.n	39ba <_sbrk_r+0x16>
    39b8:	bd38      	pop	{r3, r4, r5, pc}
    39ba:	6823      	ldr	r3, [r4, #0]
    39bc:	2b00      	cmp	r3, #0
    39be:	d0fb      	beq.n	39b8 <_sbrk_r+0x14>
    39c0:	602b      	str	r3, [r5, #0]
    39c2:	bd38      	pop	{r3, r4, r5, pc}
    39c4:	1fff96a8 	.word	0x1fff96a8

000039c8 <__register_exitproc>:
    39c8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    39cc:	4c25      	ldr	r4, [pc, #148]	; (3a64 <__register_exitproc+0x9c>)
    39ce:	6825      	ldr	r5, [r4, #0]
    39d0:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    39d4:	4606      	mov	r6, r0
    39d6:	4688      	mov	r8, r1
    39d8:	4692      	mov	sl, r2
    39da:	4699      	mov	r9, r3
    39dc:	b3c4      	cbz	r4, 3a50 <__register_exitproc+0x88>
    39de:	6860      	ldr	r0, [r4, #4]
    39e0:	281f      	cmp	r0, #31
    39e2:	dc17      	bgt.n	3a14 <__register_exitproc+0x4c>
    39e4:	1c43      	adds	r3, r0, #1
    39e6:	b176      	cbz	r6, 3a06 <__register_exitproc+0x3e>
    39e8:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    39ec:	2201      	movs	r2, #1
    39ee:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    39f2:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    39f6:	4082      	lsls	r2, r0
    39f8:	4311      	orrs	r1, r2
    39fa:	2e02      	cmp	r6, #2
    39fc:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    3a00:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    3a04:	d01e      	beq.n	3a44 <__register_exitproc+0x7c>
    3a06:	3002      	adds	r0, #2
    3a08:	6063      	str	r3, [r4, #4]
    3a0a:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    3a0e:	2000      	movs	r0, #0
    3a10:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    3a14:	4b14      	ldr	r3, [pc, #80]	; (3a68 <__register_exitproc+0xa0>)
    3a16:	b303      	cbz	r3, 3a5a <__register_exitproc+0x92>
    3a18:	f44f 70c8 	mov.w	r0, #400	; 0x190
    3a1c:	f7ff fcfe 	bl	341c <malloc>
    3a20:	4604      	mov	r4, r0
    3a22:	b1d0      	cbz	r0, 3a5a <__register_exitproc+0x92>
    3a24:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    3a28:	2700      	movs	r7, #0
    3a2a:	e880 0088 	stmia.w	r0, {r3, r7}
    3a2e:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    3a32:	4638      	mov	r0, r7
    3a34:	2301      	movs	r3, #1
    3a36:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    3a3a:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    3a3e:	2e00      	cmp	r6, #0
    3a40:	d0e1      	beq.n	3a06 <__register_exitproc+0x3e>
    3a42:	e7d1      	b.n	39e8 <__register_exitproc+0x20>
    3a44:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    3a48:	430a      	orrs	r2, r1
    3a4a:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    3a4e:	e7da      	b.n	3a06 <__register_exitproc+0x3e>
    3a50:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    3a54:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    3a58:	e7c1      	b.n	39de <__register_exitproc+0x16>
    3a5a:	f04f 30ff 	mov.w	r0, #4294967295
    3a5e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    3a62:	bf00      	nop
    3a64:	00003f0c 	.word	0x00003f0c
    3a68:	0000341d 	.word	0x0000341d

00003a6c <register_fini>:
    3a6c:	4b02      	ldr	r3, [pc, #8]	; (3a78 <register_fini+0xc>)
    3a6e:	b113      	cbz	r3, 3a76 <register_fini+0xa>
    3a70:	4802      	ldr	r0, [pc, #8]	; (3a7c <register_fini+0x10>)
    3a72:	f000 b805 	b.w	3a80 <atexit>
    3a76:	4770      	bx	lr
    3a78:	00000000 	.word	0x00000000
    3a7c:	00003a8d 	.word	0x00003a8d

00003a80 <atexit>:
    3a80:	2300      	movs	r3, #0
    3a82:	4601      	mov	r1, r0
    3a84:	461a      	mov	r2, r3
    3a86:	4618      	mov	r0, r3
    3a88:	f7ff bf9e 	b.w	39c8 <__register_exitproc>

00003a8c <__libc_fini_array>:
    3a8c:	b538      	push	{r3, r4, r5, lr}
    3a8e:	4d07      	ldr	r5, [pc, #28]	; (3aac <__libc_fini_array+0x20>)
    3a90:	4c07      	ldr	r4, [pc, #28]	; (3ab0 <__libc_fini_array+0x24>)
    3a92:	1b2c      	subs	r4, r5, r4
    3a94:	10a4      	asrs	r4, r4, #2
    3a96:	d005      	beq.n	3aa4 <__libc_fini_array+0x18>
    3a98:	3c01      	subs	r4, #1
    3a9a:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    3a9e:	4798      	blx	r3
    3aa0:	2c00      	cmp	r4, #0
    3aa2:	d1f9      	bne.n	3a98 <__libc_fini_array+0xc>
    3aa4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    3aa8:	f000 ba3e 	b.w	3f28 <__init_array_end>
	...

00003ab4 <_malloc_trim_r>:
    3ab4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3ab6:	4f23      	ldr	r7, [pc, #140]	; (3b44 <_malloc_trim_r+0x90>)
    3ab8:	460c      	mov	r4, r1
    3aba:	4606      	mov	r6, r0
    3abc:	f7ff ff6e 	bl	399c <__malloc_lock>
    3ac0:	68bb      	ldr	r3, [r7, #8]
    3ac2:	685d      	ldr	r5, [r3, #4]
    3ac4:	f025 0503 	bic.w	r5, r5, #3
    3ac8:	1b29      	subs	r1, r5, r4
    3aca:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    3ace:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    3ad2:	f021 010f 	bic.w	r1, r1, #15
    3ad6:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    3ada:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    3ade:	db07      	blt.n	3af0 <_malloc_trim_r+0x3c>
    3ae0:	2100      	movs	r1, #0
    3ae2:	4630      	mov	r0, r6
    3ae4:	f7ff ff5e 	bl	39a4 <_sbrk_r>
    3ae8:	68bb      	ldr	r3, [r7, #8]
    3aea:	442b      	add	r3, r5
    3aec:	4298      	cmp	r0, r3
    3aee:	d004      	beq.n	3afa <_malloc_trim_r+0x46>
    3af0:	4630      	mov	r0, r6
    3af2:	f7ff ff55 	bl	39a0 <__malloc_unlock>
    3af6:	2000      	movs	r0, #0
    3af8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    3afa:	4261      	negs	r1, r4
    3afc:	4630      	mov	r0, r6
    3afe:	f7ff ff51 	bl	39a4 <_sbrk_r>
    3b02:	3001      	adds	r0, #1
    3b04:	d00d      	beq.n	3b22 <_malloc_trim_r+0x6e>
    3b06:	4b10      	ldr	r3, [pc, #64]	; (3b48 <_malloc_trim_r+0x94>)
    3b08:	68ba      	ldr	r2, [r7, #8]
    3b0a:	6819      	ldr	r1, [r3, #0]
    3b0c:	1b2d      	subs	r5, r5, r4
    3b0e:	f045 0501 	orr.w	r5, r5, #1
    3b12:	4630      	mov	r0, r6
    3b14:	1b09      	subs	r1, r1, r4
    3b16:	6055      	str	r5, [r2, #4]
    3b18:	6019      	str	r1, [r3, #0]
    3b1a:	f7ff ff41 	bl	39a0 <__malloc_unlock>
    3b1e:	2001      	movs	r0, #1
    3b20:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    3b22:	2100      	movs	r1, #0
    3b24:	4630      	mov	r0, r6
    3b26:	f7ff ff3d 	bl	39a4 <_sbrk_r>
    3b2a:	68ba      	ldr	r2, [r7, #8]
    3b2c:	1a83      	subs	r3, r0, r2
    3b2e:	2b0f      	cmp	r3, #15
    3b30:	ddde      	ble.n	3af0 <_malloc_trim_r+0x3c>
    3b32:	4c06      	ldr	r4, [pc, #24]	; (3b4c <_malloc_trim_r+0x98>)
    3b34:	4904      	ldr	r1, [pc, #16]	; (3b48 <_malloc_trim_r+0x94>)
    3b36:	6824      	ldr	r4, [r4, #0]
    3b38:	f043 0301 	orr.w	r3, r3, #1
    3b3c:	1b00      	subs	r0, r0, r4
    3b3e:	6053      	str	r3, [r2, #4]
    3b40:	6008      	str	r0, [r1, #0]
    3b42:	e7d5      	b.n	3af0 <_malloc_trim_r+0x3c>
    3b44:	1fff8ddc 	.word	0x1fff8ddc
    3b48:	1fff966c 	.word	0x1fff966c
    3b4c:	1fff91e8 	.word	0x1fff91e8

00003b50 <_free_r>:
    3b50:	2900      	cmp	r1, #0
    3b52:	d045      	beq.n	3be0 <_free_r+0x90>
    3b54:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3b58:	460d      	mov	r5, r1
    3b5a:	4680      	mov	r8, r0
    3b5c:	f7ff ff1e 	bl	399c <__malloc_lock>
    3b60:	f855 7c04 	ldr.w	r7, [r5, #-4]
    3b64:	496a      	ldr	r1, [pc, #424]	; (3d10 <_free_r+0x1c0>)
    3b66:	f027 0301 	bic.w	r3, r7, #1
    3b6a:	f1a5 0408 	sub.w	r4, r5, #8
    3b6e:	18e2      	adds	r2, r4, r3
    3b70:	688e      	ldr	r6, [r1, #8]
    3b72:	6850      	ldr	r0, [r2, #4]
    3b74:	42b2      	cmp	r2, r6
    3b76:	f020 0003 	bic.w	r0, r0, #3
    3b7a:	d062      	beq.n	3c42 <_free_r+0xf2>
    3b7c:	07fe      	lsls	r6, r7, #31
    3b7e:	6050      	str	r0, [r2, #4]
    3b80:	d40b      	bmi.n	3b9a <_free_r+0x4a>
    3b82:	f855 7c08 	ldr.w	r7, [r5, #-8]
    3b86:	1be4      	subs	r4, r4, r7
    3b88:	f101 0e08 	add.w	lr, r1, #8
    3b8c:	68a5      	ldr	r5, [r4, #8]
    3b8e:	4575      	cmp	r5, lr
    3b90:	443b      	add	r3, r7
    3b92:	d06f      	beq.n	3c74 <_free_r+0x124>
    3b94:	68e7      	ldr	r7, [r4, #12]
    3b96:	60ef      	str	r7, [r5, #12]
    3b98:	60bd      	str	r5, [r7, #8]
    3b9a:	1815      	adds	r5, r2, r0
    3b9c:	686d      	ldr	r5, [r5, #4]
    3b9e:	07ed      	lsls	r5, r5, #31
    3ba0:	d542      	bpl.n	3c28 <_free_r+0xd8>
    3ba2:	f043 0201 	orr.w	r2, r3, #1
    3ba6:	6062      	str	r2, [r4, #4]
    3ba8:	50e3      	str	r3, [r4, r3]
    3baa:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    3bae:	d218      	bcs.n	3be2 <_free_r+0x92>
    3bb0:	08db      	lsrs	r3, r3, #3
    3bb2:	1c5a      	adds	r2, r3, #1
    3bb4:	684d      	ldr	r5, [r1, #4]
    3bb6:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    3bba:	60a7      	str	r7, [r4, #8]
    3bbc:	2001      	movs	r0, #1
    3bbe:	109b      	asrs	r3, r3, #2
    3bc0:	fa00 f303 	lsl.w	r3, r0, r3
    3bc4:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    3bc8:	431d      	orrs	r5, r3
    3bca:	3808      	subs	r0, #8
    3bcc:	60e0      	str	r0, [r4, #12]
    3bce:	604d      	str	r5, [r1, #4]
    3bd0:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    3bd4:	60fc      	str	r4, [r7, #12]
    3bd6:	4640      	mov	r0, r8
    3bd8:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3bdc:	f7ff bee0 	b.w	39a0 <__malloc_unlock>
    3be0:	4770      	bx	lr
    3be2:	0a5a      	lsrs	r2, r3, #9
    3be4:	2a04      	cmp	r2, #4
    3be6:	d853      	bhi.n	3c90 <_free_r+0x140>
    3be8:	099a      	lsrs	r2, r3, #6
    3bea:	f102 0739 	add.w	r7, r2, #57	; 0x39
    3bee:	007f      	lsls	r7, r7, #1
    3bf0:	f102 0538 	add.w	r5, r2, #56	; 0x38
    3bf4:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    3bf8:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    3bfc:	4944      	ldr	r1, [pc, #272]	; (3d10 <_free_r+0x1c0>)
    3bfe:	3808      	subs	r0, #8
    3c00:	4290      	cmp	r0, r2
    3c02:	d04d      	beq.n	3ca0 <_free_r+0x150>
    3c04:	6851      	ldr	r1, [r2, #4]
    3c06:	f021 0103 	bic.w	r1, r1, #3
    3c0a:	428b      	cmp	r3, r1
    3c0c:	d202      	bcs.n	3c14 <_free_r+0xc4>
    3c0e:	6892      	ldr	r2, [r2, #8]
    3c10:	4290      	cmp	r0, r2
    3c12:	d1f7      	bne.n	3c04 <_free_r+0xb4>
    3c14:	68d0      	ldr	r0, [r2, #12]
    3c16:	60e0      	str	r0, [r4, #12]
    3c18:	60a2      	str	r2, [r4, #8]
    3c1a:	6084      	str	r4, [r0, #8]
    3c1c:	60d4      	str	r4, [r2, #12]
    3c1e:	4640      	mov	r0, r8
    3c20:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3c24:	f7ff bebc 	b.w	39a0 <__malloc_unlock>
    3c28:	6895      	ldr	r5, [r2, #8]
    3c2a:	4f3a      	ldr	r7, [pc, #232]	; (3d14 <_free_r+0x1c4>)
    3c2c:	42bd      	cmp	r5, r7
    3c2e:	4403      	add	r3, r0
    3c30:	d03f      	beq.n	3cb2 <_free_r+0x162>
    3c32:	68d0      	ldr	r0, [r2, #12]
    3c34:	60e8      	str	r0, [r5, #12]
    3c36:	f043 0201 	orr.w	r2, r3, #1
    3c3a:	6085      	str	r5, [r0, #8]
    3c3c:	6062      	str	r2, [r4, #4]
    3c3e:	50e3      	str	r3, [r4, r3]
    3c40:	e7b3      	b.n	3baa <_free_r+0x5a>
    3c42:	07ff      	lsls	r7, r7, #31
    3c44:	4403      	add	r3, r0
    3c46:	d407      	bmi.n	3c58 <_free_r+0x108>
    3c48:	f855 2c08 	ldr.w	r2, [r5, #-8]
    3c4c:	1aa4      	subs	r4, r4, r2
    3c4e:	4413      	add	r3, r2
    3c50:	68a0      	ldr	r0, [r4, #8]
    3c52:	68e2      	ldr	r2, [r4, #12]
    3c54:	60c2      	str	r2, [r0, #12]
    3c56:	6090      	str	r0, [r2, #8]
    3c58:	4a2f      	ldr	r2, [pc, #188]	; (3d18 <_free_r+0x1c8>)
    3c5a:	6812      	ldr	r2, [r2, #0]
    3c5c:	f043 0001 	orr.w	r0, r3, #1
    3c60:	4293      	cmp	r3, r2
    3c62:	6060      	str	r0, [r4, #4]
    3c64:	608c      	str	r4, [r1, #8]
    3c66:	d3b6      	bcc.n	3bd6 <_free_r+0x86>
    3c68:	4b2c      	ldr	r3, [pc, #176]	; (3d1c <_free_r+0x1cc>)
    3c6a:	4640      	mov	r0, r8
    3c6c:	6819      	ldr	r1, [r3, #0]
    3c6e:	f7ff ff21 	bl	3ab4 <_malloc_trim_r>
    3c72:	e7b0      	b.n	3bd6 <_free_r+0x86>
    3c74:	1811      	adds	r1, r2, r0
    3c76:	6849      	ldr	r1, [r1, #4]
    3c78:	07c9      	lsls	r1, r1, #31
    3c7a:	d444      	bmi.n	3d06 <_free_r+0x1b6>
    3c7c:	6891      	ldr	r1, [r2, #8]
    3c7e:	68d2      	ldr	r2, [r2, #12]
    3c80:	60ca      	str	r2, [r1, #12]
    3c82:	4403      	add	r3, r0
    3c84:	f043 0001 	orr.w	r0, r3, #1
    3c88:	6091      	str	r1, [r2, #8]
    3c8a:	6060      	str	r0, [r4, #4]
    3c8c:	50e3      	str	r3, [r4, r3]
    3c8e:	e7a2      	b.n	3bd6 <_free_r+0x86>
    3c90:	2a14      	cmp	r2, #20
    3c92:	d817      	bhi.n	3cc4 <_free_r+0x174>
    3c94:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    3c98:	007f      	lsls	r7, r7, #1
    3c9a:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    3c9e:	e7a9      	b.n	3bf4 <_free_r+0xa4>
    3ca0:	10aa      	asrs	r2, r5, #2
    3ca2:	684b      	ldr	r3, [r1, #4]
    3ca4:	2501      	movs	r5, #1
    3ca6:	fa05 f202 	lsl.w	r2, r5, r2
    3caa:	4313      	orrs	r3, r2
    3cac:	604b      	str	r3, [r1, #4]
    3cae:	4602      	mov	r2, r0
    3cb0:	e7b1      	b.n	3c16 <_free_r+0xc6>
    3cb2:	f043 0201 	orr.w	r2, r3, #1
    3cb6:	614c      	str	r4, [r1, #20]
    3cb8:	610c      	str	r4, [r1, #16]
    3cba:	60e5      	str	r5, [r4, #12]
    3cbc:	60a5      	str	r5, [r4, #8]
    3cbe:	6062      	str	r2, [r4, #4]
    3cc0:	50e3      	str	r3, [r4, r3]
    3cc2:	e788      	b.n	3bd6 <_free_r+0x86>
    3cc4:	2a54      	cmp	r2, #84	; 0x54
    3cc6:	d806      	bhi.n	3cd6 <_free_r+0x186>
    3cc8:	0b1a      	lsrs	r2, r3, #12
    3cca:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    3cce:	007f      	lsls	r7, r7, #1
    3cd0:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    3cd4:	e78e      	b.n	3bf4 <_free_r+0xa4>
    3cd6:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    3cda:	d806      	bhi.n	3cea <_free_r+0x19a>
    3cdc:	0bda      	lsrs	r2, r3, #15
    3cde:	f102 0778 	add.w	r7, r2, #120	; 0x78
    3ce2:	007f      	lsls	r7, r7, #1
    3ce4:	f102 0577 	add.w	r5, r2, #119	; 0x77
    3ce8:	e784      	b.n	3bf4 <_free_r+0xa4>
    3cea:	f240 5054 	movw	r0, #1364	; 0x554
    3cee:	4282      	cmp	r2, r0
    3cf0:	d806      	bhi.n	3d00 <_free_r+0x1b0>
    3cf2:	0c9a      	lsrs	r2, r3, #18
    3cf4:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    3cf8:	007f      	lsls	r7, r7, #1
    3cfa:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    3cfe:	e779      	b.n	3bf4 <_free_r+0xa4>
    3d00:	27fe      	movs	r7, #254	; 0xfe
    3d02:	257e      	movs	r5, #126	; 0x7e
    3d04:	e776      	b.n	3bf4 <_free_r+0xa4>
    3d06:	f043 0201 	orr.w	r2, r3, #1
    3d0a:	6062      	str	r2, [r4, #4]
    3d0c:	50e3      	str	r3, [r4, r3]
    3d0e:	e762      	b.n	3bd6 <_free_r+0x86>
    3d10:	1fff8ddc 	.word	0x1fff8ddc
    3d14:	1fff8de4 	.word	0x1fff8de4
    3d18:	1fff91e4 	.word	0x1fff91e4
    3d1c:	1fff9668 	.word	0x1fff9668
    3d20:	736e6553 	.word	0x736e6553
    3d24:	4f20726f 	.word	0x4f20726f
    3d28:	6950206e 	.word	0x6950206e
    3d2c:	0000206e 	.word	0x0000206e
    3d30:	6d6f4320 	.word	0x6d6f4320
    3d34:	74656c70 	.word	0x74656c70
    3d38:	ffff0065 	.word	0xffff0065
    3d3c:	53494e49 	.word	0x53494e49
    3d40:	00000052 	.word	0x00000052
    3d44:	74696e49 	.word	0x74696e49
    3d48:	746e4920 	.word	0x746e4920
    3d4c:	75727265 	.word	0x75727265
    3d50:	20737470 	.word	0x20737470
    3d54:	0000202d 	.word	0x0000202d
    3d58:	706d6f43 	.word	0x706d6f43
    3d5c:	6574656c 	.word	0x6574656c
    3d60:	00000000 	.word	0x00000000
    3d64:	3a412020 	.word	0x3a412020
    3d68:	ffff0020 	.word	0xffff0020
    3d6c:	ffff0a0d 	.word	0xffff0a0d
    3d70:	006e616e 	.word	0x006e616e
    3d74:	0066766f 	.word	0x0066766f
    3d78:	00666e69 	.word	0x00666e69

00003d7c <digital_pin_to_info_PGM>:
    3d7c:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    3d8c:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    3d9c:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    3dac:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    3dbc:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    3dcc:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    3ddc:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    3dec:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    3dfc:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    3e0c:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    3e1c:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    3e2c:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    3e3c:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    3e4c:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    3e5c:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    3e6c:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    3e7c:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

00003e8c <vtable for usb_serial_class>:
	...
    3e94:	00001b25 00001b1d 00001b19 00001b15     %...............
    3ea4:	00001b11 00001b0d 00001b09 00001b05     ................

00003eb4 <usb_endpoint_config_table>:
    3eb4:	15191500                                ....

00003eb8 <usb_descriptor_list>:
    3eb8:	00000100 1fff8908 00000012 00000200     ................
    3ec8:	1fff8934 00000043 00000300 1fff8990     4...C...........
    3ed8:	00000000 04090301 1fff891c 00000000     ................
    3ee8:	04090302 1fff8978 00000000 04090303     ....x...........
    3ef8:	1fff8994 00000000 00000000 00000000     ................
    3f08:	00000000                                ....

00003f0c <_global_impure_ptr>:
    3f0c:	1fff89b0                                ....

00003f10 <_init>:
    3f10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3f12:	bf00      	nop
    3f14:	bcf8      	pop	{r3, r4, r5, r6, r7}
    3f16:	bc08      	pop	{r3}
    3f18:	469e      	mov	lr, r3
    3f1a:	4770      	bx	lr

00003f1c <__init_array_start>:
    3f1c:	00003a6d 	.word	0x00003a6d

00003f20 <__frame_dummy_init_array_entry>:
    3f20:	00000435 00000991                       5.......

Disassembly of section .fini:

00003f28 <_fini>:
    3f28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3f2a:	bf00      	nop

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
1fff880c:	1fff96ac                                ....

1fff8810 <isr_table_portA>:
1fff8810:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8820:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8830:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8840:	00000d65 00000d65                       e...e...

1fff8848 <isr_table_portB>:
1fff8848:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8858:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8868:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8878:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff8888:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...

1fff8898 <isr_table_portC>:
1fff8898:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff88a8:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff88b8:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...

1fff88c8 <isr_table_portD>:
1fff88c8:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...
1fff88d8:	00000d65 00000d65 00000d65 00000d65     e...e...e...e...

1fff88e8 <isr_table_portE>:
1fff88e8:	00000d65 00000d65                       e...e...

1fff88f0 <Serial>:
1fff88f0:	00003e94 00000000 000003e8 00000000     .>..............

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
