
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 29 0b 00 00 e1 0a 00 00     ... ....).......
      10:	e1 0a 00 00 e1 0a 00 00 e1 0a 00 00 e1 0a 00 00     ................
      20:	e1 0a 00 00 e1 0a 00 00 e1 0a 00 00 29 0b 00 00     ............)...
      30:	29 0b 00 00 e1 0a 00 00 75 22 00 00 b1 24 00 00     ).......u"...$..
      40:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      50:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      60:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      70:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      80:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      90:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      a0:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      b0:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      c0:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      d0:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      e0:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
      f0:	29 0b 00 00 cd 25 00 00 29 0b 00 00 f9 26 00 00     )....%..)....&..
     100:	29 0b 00 00 25 28 00 00 29 0b 00 00 29 0b 00 00     )...%(..)...)...
     110:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     120:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     130:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     140:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     150:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     160:	29 0b 00 00 91 11 00 00 29 0b 00 00 29 0b 00 00     ).......)...)...
     170:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     180:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     190:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     1a0:	29 0b 00 00 29 0b 00 00 29 0b 00 00 29 0b 00 00     )...)...)...)...
     1b0:	29 0b 00 00 29 0b 00 00 29 0b 00 00                 )...)...)...

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
     1d0:	f000 fcae 	bl	b30 <startup_early_hook>
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
     2d6:	f000 fd03 	bl	ce0 <_init_Teensyduino_internal_>

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
     2e4:	f000 fcea 	bl	cbc <rtc_set>
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
     302:	f000 fcdb 	bl	cbc <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f002 fdd7 	bl	2ebc <__libc_init_array>

	startup_late_hook();
     30e:	f000 fc15 	bl	b3c <startup_late_hook>
	main();
     312:	f000 fb0d 	bl	930 <main>
     316:	e7fe      	b.n	316 <ResetHandler+0x15a>
     318:	4005200e 	.word	0x4005200e
     31c:	40048030 	.word	0x40048030
     320:	00043f82 	.word	0x00043f82
     324:	2b000001 	.word	0x2b000001
     328:	4003d010 	.word	0x4003d010
     32c:	4003d014 	.word	0x4003d014
     330:	4007d002 	.word	0x4007d002
     334:	4007e000 	.word	0x4007e000
     338:	1fff91dc 	.word	0x1fff91dc
     33c:	00003a04 	.word	0x00003a04
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91dc 	.word	0x1fff91dc
     348:	1fff9810 	.word	0x1fff9810
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
     380:	5a9c2692 	.word	0x5a9c2692
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
     428:	1fff91dc 	.word	0x1fff91dc
     42c:	00000000 	.word	0x00000000
     430:	00003a00 	.word	0x00003a00

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
     45c:	1fff91e0 	.word	0x1fff91e0
     460:	00003a00 	.word	0x00003a00
     464:	1fff91dc 	.word	0x1fff91dc
     468:	00000000 	.word	0x00000000

0000046c <SensorNode::SensorNode(unsigned char)>:

#include "SensorNode.h"


SensorNode::SensorNode(u_int8_t InputPin) {
    _InputPin = InputPin;
     46c:	f8c0 10c0 	str.w	r1, [r0, #192]	; 0xc0
}
     470:	4770      	bx	lr
     472:	bf00      	nop

00000474 <SensorNode::NeedsPulseHandling()>:

bool SensorNode::NeedsPulseHandling() {
    return !(ProcessPointer == LastWaveformPointer());
     474:	f990 3000 	ldrsb.w	r3, [r0]
     478:	4a08      	ldr	r2, [pc, #32]	; (49c <SensorNode::NeedsPulseHandling()+0x28>)
     47a:	f990 0001 	ldrsb.w	r0, [r0, #1]
     47e:	3b01      	subs	r3, #1
     480:	fb82 2103 	smull	r2, r1, r2, r3
     484:	17da      	asrs	r2, r3, #31
     486:	ebc2 02a1 	rsb	r2, r2, r1, asr #2
     48a:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     48e:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     492:	b25b      	sxtb	r3, r3
}
     494:	1ac0      	subs	r0, r0, r3
     496:	bf18      	it	ne
     498:	2001      	movne	r0, #1
     49a:	4770      	bx	lr
     49c:	66666667 	.word	0x66666667

000004a0 <SensorNode::Init()>:

int8_t SensorNode::ProcessPointerOffset(int8_t Offset) {
    return (ProcessPointer + Offset) % WAVEFORM_SIZE;
}

void SensorNode::Init() {
     4a0:	b538      	push	{r3, r4, r5, lr}
     4a2:	4604      	mov	r4, r0
	size_t print(char c)				{ return write((uint8_t)c); }
	size_t print(const char s[])			{ return write(s); }
	size_t print(const __FlashStringHelper *f)	{ return write((const char *)f); }

	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
	size_t print(int n)				{ return print((long)n); }
     4a4:	4d24      	ldr	r5, [pc, #144]	; (538 <SensorNode::Init()+0x98>)
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     4a6:	4825      	ldr	r0, [pc, #148]	; (53c <SensorNode::Init()+0x9c>)
     4a8:	210e      	movs	r1, #14
     4aa:	f001 fcf9 	bl	1ea0 <usb_serial_write>
     4ae:	f8d4 10c0 	ldr.w	r1, [r4, #192]	; 0xc0
     4b2:	4628      	mov	r0, r5
     4b4:	f000 fa78 	bl	9a8 <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_InputPin);
    pinMode(_InputPin, INPUT);
     4b8:	f894 00c0 	ldrb.w	r0, [r4, #192]	; 0xc0
     4bc:	2100      	movs	r1, #0
     4be:	f000 fd03 	bl	ec8 <pinMode>
    WaveformPointer = 1;
    ProcessPointer = 0;
     4c2:	2300      	movs	r3, #0
    Angles[STATION_A][HORZ] = 0;
     4c4:	2200      	movs	r2, #0
    WaveformPointer = 1;
     4c6:	2101      	movs	r1, #1
     4c8:	7021      	strb	r1, [r4, #0]
    ProcessPointer = 0;
     4ca:	7063      	strb	r3, [r4, #1]
    Angles[STATION_A][VERT] = 0;
    Angles[STATION_B][HORZ] = 0;
    Angles[STATION_B][VERT] = 0;
    for (int i = 0; i < WAVEFORM_SIZE; i++) {
        Waveform[i].PulseDurationTicks = 0;
     4cc:	60e3      	str	r3, [r4, #12]
        Waveform[i].RisingEdgeTicks = 0;
     4ce:	6063      	str	r3, [r4, #4]
        //Waveform[i].LastPulseToThisPulseTicks = 0;
        Waveform[i].FallingEdgeTicks = 0;
     4d0:	60a3      	str	r3, [r4, #8]
        Waveform[i].PulseDurationTicks = 0;
     4d2:	61e3      	str	r3, [r4, #28]
        Waveform[i].RisingEdgeTicks = 0;
     4d4:	6163      	str	r3, [r4, #20]
        Waveform[i].FallingEdgeTicks = 0;
     4d6:	61a3      	str	r3, [r4, #24]
        Waveform[i].PulseDurationTicks = 0;
     4d8:	62e3      	str	r3, [r4, #44]	; 0x2c
        Waveform[i].RisingEdgeTicks = 0;
     4da:	6263      	str	r3, [r4, #36]	; 0x24
        Waveform[i].FallingEdgeTicks = 0;
     4dc:	62a3      	str	r3, [r4, #40]	; 0x28
        Waveform[i].PulseDurationTicks = 0;
     4de:	63e3      	str	r3, [r4, #60]	; 0x3c
        Waveform[i].RisingEdgeTicks = 0;
     4e0:	6363      	str	r3, [r4, #52]	; 0x34
        Waveform[i].FallingEdgeTicks = 0;
     4e2:	63a3      	str	r3, [r4, #56]	; 0x38
        Waveform[i].PulseDurationTicks = 0;
     4e4:	64e3      	str	r3, [r4, #76]	; 0x4c
        Waveform[i].RisingEdgeTicks = 0;
     4e6:	6463      	str	r3, [r4, #68]	; 0x44
        Waveform[i].FallingEdgeTicks = 0;
     4e8:	64a3      	str	r3, [r4, #72]	; 0x48
        Waveform[i].PulseDurationTicks = 0;
     4ea:	65e3      	str	r3, [r4, #92]	; 0x5c
        Waveform[i].RisingEdgeTicks = 0;
     4ec:	6563      	str	r3, [r4, #84]	; 0x54
        Waveform[i].FallingEdgeTicks = 0;
     4ee:	65a3      	str	r3, [r4, #88]	; 0x58
        Waveform[i].PulseDurationTicks = 0;
     4f0:	66e3      	str	r3, [r4, #108]	; 0x6c
        Waveform[i].RisingEdgeTicks = 0;
     4f2:	6663      	str	r3, [r4, #100]	; 0x64
        Waveform[i].FallingEdgeTicks = 0;
     4f4:	66a3      	str	r3, [r4, #104]	; 0x68
        Waveform[i].PulseDurationTicks = 0;
     4f6:	67e3      	str	r3, [r4, #124]	; 0x7c
        Waveform[i].RisingEdgeTicks = 0;
     4f8:	6763      	str	r3, [r4, #116]	; 0x74
        Waveform[i].FallingEdgeTicks = 0;
     4fa:	67a3      	str	r3, [r4, #120]	; 0x78
        Waveform[i].PulseDurationTicks = 0;
     4fc:	f8c4 308c 	str.w	r3, [r4, #140]	; 0x8c
        Waveform[i].RisingEdgeTicks = 0;
     500:	f8c4 3084 	str.w	r3, [r4, #132]	; 0x84
    Angles[STATION_A][HORZ] = 0;
     504:	f8c4 20a4 	str.w	r2, [r4, #164]	; 0xa4
    Angles[STATION_A][VERT] = 0;
     508:	f8c4 20a8 	str.w	r2, [r4, #168]	; 0xa8
    Angles[STATION_B][HORZ] = 0;
     50c:	f8c4 20ac 	str.w	r2, [r4, #172]	; 0xac
    Angles[STATION_B][VERT] = 0;
     510:	f8c4 20b0 	str.w	r2, [r4, #176]	; 0xb0
     514:	2109      	movs	r1, #9
        Waveform[i].FallingEdgeTicks = 0;
     516:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
     51a:	4809      	ldr	r0, [pc, #36]	; (540 <SensorNode::Init()+0xa0>)
        Waveform[i].PulseDurationTicks = 0;
     51c:	f8c4 309c 	str.w	r3, [r4, #156]	; 0x9c
        Waveform[i].RisingEdgeTicks = 0;
     520:	f8c4 3094 	str.w	r3, [r4, #148]	; 0x94
        Waveform[i].FallingEdgeTicks = 0;
     524:	f8c4 3098 	str.w	r3, [r4, #152]	; 0x98
     528:	f001 fcba 	bl	1ea0 <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
	size_t print(const Printable &obj)		{ return obj.printTo(*this); }
	size_t println(void);
	size_t println(const String &s)			{ return print(s) + println(); }
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
     52c:	4628      	mov	r0, r5
    }
    Serial.println(" Complete");
}
     52e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     532:	f000 bab3 	b.w	a9c <Print::println()>
     536:	bf00      	nop
     538:	1fff88e4 	.word	0x1fff88e4
     53c:	00003810 	.word	0x00003810
     540:	00003820 	.word	0x00003820

00000544 <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     544:	4770      	bx	lr
     546:	bf00      	nop

00000548 <SensorNode::GetPin()>:

u_int8_t SensorNode::GetPin() {
    return _InputPin;
}
     548:	f890 00c0 	ldrb.w	r0, [r0, #192]	; 0xc0
     54c:	4770      	bx	lr
     54e:	bf00      	nop

00000550 <SensorNode::RisingEdge(unsigned long)>:
    (++WaveformPointer) %= WAVEFORM_SIZE;
     550:	7803      	ldrb	r3, [r0, #0]
     552:	4a0b      	ldr	r2, [pc, #44]	; (580 <SensorNode::RisingEdge(unsigned long)+0x30>)
     554:	3301      	adds	r3, #1
     556:	b25b      	sxtb	r3, r3

void SensorNode::RisingEdge(u_int32_t TimeTicks) {
     558:	b410      	push	{r4}
    (++WaveformPointer) %= WAVEFORM_SIZE;
     55a:	fb82 2403 	smull	r2, r4, r2, r3
     55e:	17da      	asrs	r2, r3, #31
     560:	ebc2 02a4 	rsb	r2, r2, r4, asr #2
     564:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     568:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     56c:	b25b      	sxtb	r3, r3
    IncWaveformPointer();
    Waveform[WaveformPointer].Valid = false;
     56e:	eb00 1203 	add.w	r2, r0, r3, lsl #4
     572:	2400      	movs	r4, #0
    (++WaveformPointer) %= WAVEFORM_SIZE;
     574:	7003      	strb	r3, [r0, #0]
    Waveform[WaveformPointer].Valid = false;
     576:	7414      	strb	r4, [r2, #16]
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
     578:	6051      	str	r1, [r2, #4]

}
     57a:	bc10      	pop	{r4}
     57c:	4770      	bx	lr
     57e:	bf00      	nop
     580:	66666667 	.word	0x66666667

00000584 <SensorNode::FallingEdge(unsigned long)>:

void SensorNode::FallingEdge(u_int32_t TimeTicks) {
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     584:	f990 2000 	ldrsb.w	r2, [r0]
     588:	eb00 1002 	add.w	r0, r0, r2, lsl #4
    Waveform[WaveformPointer].Valid = false;
     58c:	2300      	movs	r3, #0
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     58e:	6081      	str	r1, [r0, #8]
    Waveform[WaveformPointer].Valid = false;
     590:	7403      	strb	r3, [r0, #16]
     592:	4770      	bx	lr

00000594 <SensorNode::PulseHandler()>:
}

Pulse* SensorNode::PulseHandler() {
     594:	b4f0      	push	{r4, r5, r6, r7}
     596:	4604      	mov	r4, r0
    Pulse *LatestPulse = &Waveform[ProcessPointer];
     598:	f990 0001 	ldrsb.w	r0, [r0, #1]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     59c:	4a16      	ldr	r2, [pc, #88]	; (5f8 <SensorNode::PulseHandler()+0x64>)
     59e:	eb04 1500 	add.w	r5, r4, r0, lsl #4
     5a2:	1c43      	adds	r3, r0, #1
    LatestPulse->PulseDurationTicks =
            LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     5a4:	68ae      	ldr	r6, [r5, #8]
     5a6:	6869      	ldr	r1, [r5, #4]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5a8:	b25b      	sxtb	r3, r3
            LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     5aa:	1a71      	subs	r1, r6, r1
    LatestPulse->IsSyncPulse = (bool)IN_RANGE(FLASH_PULSE_LENGTH_TICKS_MIN,
                                                     LatestPulse->PulseDurationTicks,
                                                     FLASH_PULSE_LENGTH_TICKS_MAX);
     5ac:	f6a1 36b8 	subw	r6, r1, #3000	; 0xbb8
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5b0:	fb82 2503 	smull	r2, r5, r2, r3
                                                     FLASH_PULSE_LENGTH_TICKS_MAX);
     5b4:	f241 7770 	movw	r7, #6000	; 0x1770
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5b8:	17da      	asrs	r2, r3, #31
                                                     FLASH_PULSE_LENGTH_TICKS_MAX);
     5ba:	42be      	cmp	r6, r7
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5bc:	ebc2 02a5 	rsb	r2, r2, r5, asr #2
    LatestPulse->IsSweepPulse = (bool)IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,
                                                      LatestPulse->PulseDurationTicks,
                                                      SWEEP_PULSE_LENGTH_TICKS_MAX);
     5c0:	f1a1 0578 	sub.w	r5, r1, #120	; 0x78
            LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     5c4:	eb04 1000 	add.w	r0, r4, r0, lsl #4
                                                     FLASH_PULSE_LENGTH_TICKS_MAX);
     5c8:	bf8c      	ite	hi
     5ca:	2600      	movhi	r6, #0
     5cc:	2601      	movls	r6, #1
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5ce:	eb02 0282 	add.w	r2, r2, r2, lsl #2
                                                      SWEEP_PULSE_LENGTH_TICKS_MAX);
     5d2:	f5b5 7f43 	cmp.w	r5, #780	; 0x30c
     5d6:	bf8c      	ite	hi
     5d8:	2500      	movhi	r5, #0
     5da:	2501      	movls	r5, #1
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5dc:	eba3 0242 	sub.w	r2, r3, r2, lsl #1
    LatestPulse->Valid = true;
     5e0:	2701      	movs	r7, #1
    LatestPulse->ReadOut = false;
     5e2:	2300      	movs	r3, #0
                                                     FLASH_PULSE_LENGTH_TICKS_MAX);
     5e4:	7446      	strb	r6, [r0, #17]
                                                      SWEEP_PULSE_LENGTH_TICKS_MAX);
     5e6:	7485      	strb	r5, [r0, #18]
    LatestPulse->Valid = true;
     5e8:	7407      	strb	r7, [r0, #16]
            LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
     5ea:	60c1      	str	r1, [r0, #12]
    LatestPulse->ReadOut = false;
     5ec:	74c3      	strb	r3, [r0, #19]
    (++ProcessPointer) %= WAVEFORM_SIZE;
     5ee:	7062      	strb	r2, [r4, #1]
    IncProcessPointer();
    return LatestPulse;
}
     5f0:	3004      	adds	r0, #4
     5f2:	bcf0      	pop	{r4, r5, r6, r7}
     5f4:	4770      	bx	lr
     5f6:	bf00      	nop
     5f8:	66666667 	.word	0x66666667

000005fc <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)>:

u_int32_t PulseAge(Pulse &TestPulse) {
    return CURRENT_TIME - TestPulse.RisingEdgeTicks;
}

void SensorNode::CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime) {
     5fc:	b570      	push	{r4, r5, r6, lr}
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     5fe:	f990 5001 	ldrsb.w	r5, [r0, #1]
     602:	b35d      	cbz	r5, 65c <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x60>
     604:	4c16      	ldr	r4, [pc, #88]	; (660 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x64>)
     606:	3d01      	subs	r5, #1
     608:	fb84 4605 	smull	r4, r6, r4, r5
     60c:	17ec      	asrs	r4, r5, #31
     60e:	ebc4 04a6 	rsb	r4, r4, r6, asr #2
     612:	eb04 0484 	add.w	r4, r4, r4, lsl #2
     616:	eba5 0444 	sub.w	r4, r5, r4, lsl #1
    Pulse* LastPulse = &Waveform[LastProcessPointer()];
    if (LastPulse->Valid and LastPulse->IsSweepPulse and not LastPulse->ReadOut){
     61a:	eb00 1404 	add.w	r4, r0, r4, lsl #4
     61e:	7c25      	ldrb	r5, [r4, #16]
     620:	b1dd      	cbz	r5, 65a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x5e>
     622:	7ca5      	ldrb	r5, [r4, #18]
     624:	b1cd      	cbz	r5, 65a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x5e>
     626:	7ce5      	ldrb	r5, [r4, #19]
     628:	b9bd      	cbnz	r5, 65a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x5e>
        LastPulse->ReadOut = true;
        Angles[SweepSource][SweepAxis] = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks-SweepStartTime);
     62a:	eb02 0241 	add.w	r2, r2, r1, lsl #1
     62e:	461e      	mov	r6, r3
        LastPulse->ReadOut = true;
     630:	2301      	movs	r3, #1
        Angles[SweepSource][SweepAxis] = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks-SweepStartTime);
     632:	3228      	adds	r2, #40	; 0x28
        LastPulse->ReadOut = true;
     634:	74e3      	strb	r3, [r4, #19]
     636:	4605      	mov	r5, r0
        Angles[SweepSource][SweepAxis] = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks-SweepStartTime);
     638:	6860      	ldr	r0, [r4, #4]
     63a:	eb05 0482 	add.w	r4, r5, r2, lsl #2
     63e:	f002 fa89 	bl	2b54 <__aeabi_ui2f>
     642:	4605      	mov	r5, r0
     644:	4630      	mov	r0, r6
     646:	f002 fa85 	bl	2b54 <__aeabi_ui2f>
     64a:	4906      	ldr	r1, [pc, #24]	; (664 <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x68>)
     64c:	f002 fada 	bl	2c04 <__aeabi_fmul>
     650:	4601      	mov	r1, r0
     652:	4628      	mov	r0, r5
     654:	f002 f9cc 	bl	29f0 <__aeabi_fsub>
     658:	6060      	str	r0, [r4, #4]
     65a:	bd70      	pop	{r4, r5, r6, pc}
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
     65c:	2409      	movs	r4, #9
     65e:	e7dc      	b.n	61a <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)+0x1e>
     660:	66666667 	.word	0x66666667
     664:	371e232a 	.word	0x371e232a

00000668 <InitTimer()>:
#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {
     668:	b4f0      	push	{r4, r5, r6, r7}

    SIM_SCGC6 |= SIM_SCGC6_PIT;
     66a:	4a08      	ldr	r2, [pc, #32]	; (68c <InitTimer()+0x24>)
    PIT_LDVAL0 = UINT32_MAX;
     66c:	4e08      	ldr	r6, [pc, #32]	; (690 <InitTimer()+0x28>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     66e:	6813      	ldr	r3, [r2, #0]
    PIT_MCR = 0;
     670:	4c08      	ldr	r4, [pc, #32]	; (694 <InitTimer()+0x2c>)
    PIT_TCTRL0 = 1;
     672:	4909      	ldr	r1, [pc, #36]	; (698 <InitTimer()+0x30>)
    PIT_LDVAL0 = UINT32_MAX;
     674:	f04f 37ff 	mov.w	r7, #4294967295
    PIT_MCR = 0;
     678:	2500      	movs	r5, #0
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     67a:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
    PIT_TCTRL0 = 1;
     67e:	2001      	movs	r0, #1
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     680:	6013      	str	r3, [r2, #0]
    PIT_LDVAL0 = UINT32_MAX;
     682:	6037      	str	r7, [r6, #0]
    PIT_MCR = 0;
     684:	6025      	str	r5, [r4, #0]
    PIT_TCTRL0 = 1;
     686:	6008      	str	r0, [r1, #0]

}
     688:	bcf0      	pop	{r4, r5, r6, r7}
     68a:	4770      	bx	lr
     68c:	4004803c 	.word	0x4004803c
     690:	40037100 	.word	0x40037100
     694:	40037000 	.word	0x40037000
     698:	40037108 	.word	0x40037108

0000069c <Interrupt0Change()>:
    else { \
        Nodes[ID].FallingEdge(Now);\
}\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PIN, 0);
     69c:	4a06      	ldr	r2, [pc, #24]	; (6b8 <Interrupt0Change()+0x1c>)
		} else if (pin == 7) {
			return (CORE_PIN7_PINREG & CORE_PIN7_BITMASK) ? 1 : 0;
		} else if (pin == 8) {
			return (CORE_PIN8_PINREG & CORE_PIN8_BITMASK) ? 1 : 0;
		} else if (pin == 9) {
			return (CORE_PIN9_PINREG & CORE_PIN9_BITMASK) ? 1 : 0;
     69e:	4b07      	ldr	r3, [pc, #28]	; (6bc <Interrupt0Change()+0x20>)
     6a0:	6811      	ldr	r1, [r2, #0]
     6a2:	681b      	ldr	r3, [r3, #0]
     6a4:	4806      	ldr	r0, [pc, #24]	; (6c0 <Interrupt0Change()+0x24>)
     6a6:	071b      	lsls	r3, r3, #28
     6a8:	ea6f 0101 	mvn.w	r1, r1
     6ac:	d501      	bpl.n	6b2 <Interrupt0Change()+0x16>
     6ae:	f7ff bf4f 	b.w	550 <SensorNode::RisingEdge(unsigned long)>
     6b2:	f7ff bf67 	b.w	584 <SensorNode::FallingEdge(unsigned long)>
     6b6:	bf00      	nop
     6b8:	40037104 	.word	0x40037104
     6bc:	400ff090 	.word	0x400ff090
     6c0:	1fff9204 	.word	0x1fff9204

000006c4 <Interrupt1Change()>:

void Interrupt1Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_2_PIN, 1);
     6c4:	4a06      	ldr	r2, [pc, #24]	; (6e0 <Interrupt1Change()+0x1c>)
		} else if (pin == 10) {
			return (CORE_PIN10_PINREG & CORE_PIN10_BITMASK) ? 1 : 0;
     6c6:	4b07      	ldr	r3, [pc, #28]	; (6e4 <Interrupt1Change()+0x20>)
     6c8:	6811      	ldr	r1, [r2, #0]
     6ca:	681b      	ldr	r3, [r3, #0]
     6cc:	4806      	ldr	r0, [pc, #24]	; (6e8 <Interrupt1Change()+0x24>)
     6ce:	06db      	lsls	r3, r3, #27
     6d0:	ea6f 0101 	mvn.w	r1, r1
     6d4:	d501      	bpl.n	6da <Interrupt1Change()+0x16>
     6d6:	f7ff bf3b 	b.w	550 <SensorNode::RisingEdge(unsigned long)>
     6da:	f7ff bf53 	b.w	584 <SensorNode::FallingEdge(unsigned long)>
     6de:	bf00      	nop
     6e0:	40037104 	.word	0x40037104
     6e4:	400ff090 	.word	0x400ff090
     6e8:	1fff92c8 	.word	0x1fff92c8

000006ec <Interrupt2Change()>:

void Interrupt2Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_3_PIN, 2);
     6ec:	4a06      	ldr	r2, [pc, #24]	; (708 <Interrupt2Change()+0x1c>)
		} else if (pin == 11) {
			return (CORE_PIN11_PINREG & CORE_PIN11_BITMASK) ? 1 : 0;
     6ee:	4b07      	ldr	r3, [pc, #28]	; (70c <Interrupt2Change()+0x20>)
     6f0:	6811      	ldr	r1, [r2, #0]
     6f2:	681b      	ldr	r3, [r3, #0]
     6f4:	4806      	ldr	r0, [pc, #24]	; (710 <Interrupt2Change()+0x24>)
     6f6:	065b      	lsls	r3, r3, #25
     6f8:	ea6f 0101 	mvn.w	r1, r1
     6fc:	d501      	bpl.n	702 <Interrupt2Change()+0x16>
     6fe:	f7ff bf27 	b.w	550 <SensorNode::RisingEdge(unsigned long)>
     702:	f7ff bf3f 	b.w	584 <SensorNode::FallingEdge(unsigned long)>
     706:	bf00      	nop
     708:	40037104 	.word	0x40037104
     70c:	400ff090 	.word	0x400ff090
     710:	1fff938c 	.word	0x1fff938c

00000714 <Interrupt3Change()>:

void Interrupt3Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_4_PIN, 3);
     714:	4a06      	ldr	r2, [pc, #24]	; (730 <Interrupt3Change()+0x1c>)
		} else if (pin == 12) {
			return (CORE_PIN12_PINREG & CORE_PIN12_BITMASK) ? 1 : 0;
     716:	4b07      	ldr	r3, [pc, #28]	; (734 <Interrupt3Change()+0x20>)
     718:	6811      	ldr	r1, [r2, #0]
     71a:	681b      	ldr	r3, [r3, #0]
     71c:	4806      	ldr	r0, [pc, #24]	; (738 <Interrupt3Change()+0x24>)
     71e:	061b      	lsls	r3, r3, #24
     720:	ea6f 0101 	mvn.w	r1, r1
     724:	d501      	bpl.n	72a <Interrupt3Change()+0x16>
     726:	f7ff bf13 	b.w	550 <SensorNode::RisingEdge(unsigned long)>
     72a:	f7ff bf2b 	b.w	584 <SensorNode::FallingEdge(unsigned long)>
     72e:	bf00      	nop
     730:	40037104 	.word	0x40037104
     734:	400ff090 	.word	0x400ff090
     738:	1fff9450 	.word	0x1fff9450

0000073c <__tcf_0>:
SensorNode Nodes[] = {SENSOR_1_PIN, SENSOR_2_PIN, SENSOR_3_PIN, SENSOR_4_PIN};
     73c:	b510      	push	{r4, lr}
     73e:	4c09      	ldr	r4, [pc, #36]	; (764 <__tcf_0+0x28>)
     740:	f504 7013 	add.w	r0, r4, #588	; 0x24c
     744:	f7ff fefe 	bl	544 <SensorNode::~SensorNode()>
     748:	f504 70c4 	add.w	r0, r4, #392	; 0x188
     74c:	f7ff fefa 	bl	544 <SensorNode::~SensorNode()>
     750:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
     754:	f7ff fef6 	bl	544 <SensorNode::~SensorNode()>
     758:	4620      	mov	r0, r4
     75a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     75e:	f7ff bef1 	b.w	544 <SensorNode::~SensorNode()>
     762:	bf00      	nop
     764:	1fff9204 	.word	0x1fff9204

00000768 <ConfigureInterrupts()>:


void ConfigureInterrupts() {
     768:	b510      	push	{r4, lr}
    Serial.print("Init Interrupts - ");
    attachInterrupt(Nodes[0].GetPin(), Interrupt0Change, CHANGE);
     76a:	4c16      	ldr	r4, [pc, #88]	; (7c4 <ConfigureInterrupts()+0x5c>)
     76c:	4816      	ldr	r0, [pc, #88]	; (7c8 <ConfigureInterrupts()+0x60>)
     76e:	2112      	movs	r1, #18
     770:	f001 fb96 	bl	1ea0 <usb_serial_write>
     774:	4620      	mov	r0, r4
     776:	f7ff fee7 	bl	548 <SensorNode::GetPin()>
     77a:	2204      	movs	r2, #4
     77c:	4913      	ldr	r1, [pc, #76]	; (7cc <ConfigureInterrupts()+0x64>)
     77e:	f000 fa1d 	bl	bbc <attachInterrupt>
    attachInterrupt(Nodes[1].GetPin(), Interrupt1Change, CHANGE);
     782:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
     786:	f7ff fedf 	bl	548 <SensorNode::GetPin()>
     78a:	2204      	movs	r2, #4
     78c:	4910      	ldr	r1, [pc, #64]	; (7d0 <ConfigureInterrupts()+0x68>)
     78e:	f000 fa15 	bl	bbc <attachInterrupt>
    attachInterrupt(Nodes[2].GetPin(), Interrupt2Change, CHANGE);
     792:	f504 70c4 	add.w	r0, r4, #392	; 0x188
     796:	f7ff fed7 	bl	548 <SensorNode::GetPin()>
     79a:	2204      	movs	r2, #4
     79c:	490d      	ldr	r1, [pc, #52]	; (7d4 <ConfigureInterrupts()+0x6c>)
     79e:	f000 fa0d 	bl	bbc <attachInterrupt>
    attachInterrupt(Nodes[3].GetPin(), Interrupt3Change, CHANGE);
     7a2:	f504 7013 	add.w	r0, r4, #588	; 0x24c
     7a6:	f7ff fecf 	bl	548 <SensorNode::GetPin()>
     7aa:	2204      	movs	r2, #4
     7ac:	490a      	ldr	r1, [pc, #40]	; (7d8 <ConfigureInterrupts()+0x70>)
     7ae:	f000 fa05 	bl	bbc <attachInterrupt>
     7b2:	2108      	movs	r1, #8
     7b4:	4809      	ldr	r0, [pc, #36]	; (7dc <ConfigureInterrupts()+0x74>)
     7b6:	f001 fb73 	bl	1ea0 <usb_serial_write>
     7ba:	4809      	ldr	r0, [pc, #36]	; (7e0 <ConfigureInterrupts()+0x78>)
    Serial.println("Complete");
}
     7bc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     7c0:	f000 b96c 	b.w	a9c <Print::println()>
     7c4:	1fff9204 	.word	0x1fff9204
     7c8:	0000382c 	.word	0x0000382c
     7cc:	0000069d 	.word	0x0000069d
     7d0:	000006c5 	.word	0x000006c5
     7d4:	000006ed 	.word	0x000006ed
     7d8:	00000715 	.word	0x00000715
     7dc:	00003840 	.word	0x00003840
     7e0:	1fff88e4 	.word	0x1fff88e4

000007e4 <Setup()>:

//char (*__kaboom)[sizeof(float16_t)] = 1;


void Setup() {
     7e4:	b510      	push	{r4, lr}
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
     7e6:	2101      	movs	r1, #1
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
     7e8:	4c10      	ldr	r4, [pc, #64]	; (82c <Setup()+0x48>)
    pinMode(LED_BUILTIN, OUTPUT);
     7ea:	200d      	movs	r0, #13
     7ec:	f000 fb6c 	bl	ec8 <pinMode>
    delay(2000);
     7f0:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     7f4:	f000 fba4 	bl	f40 <delay>
        Nodes[i].Init();
     7f8:	4620      	mov	r0, r4
     7fa:	f7ff fe51 	bl	4a0 <SensorNode::Init()>
     7fe:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
     802:	f7ff fe4d 	bl	4a0 <SensorNode::Init()>
     806:	f504 70c4 	add.w	r0, r4, #392	; 0x188
     80a:	f7ff fe49 	bl	4a0 <SensorNode::Init()>
     80e:	f504 7013 	add.w	r0, r4, #588	; 0x24c
     812:	f7ff fe45 	bl	4a0 <SensorNode::Init()>
    }
    delay(100);
     816:	2064      	movs	r0, #100	; 0x64
     818:	f000 fb92 	bl	f40 <delay>

    InitTimer(); //Start up better timer (If using)
     81c:	f7ff ff24 	bl	668 <InitTimer()>
    ConfigureInterrupts(); // Set up Channel Interrupts
     820:	f7ff ffa2 	bl	768 <ConfigureInterrupts()>
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     824:	4b02      	ldr	r3, [pc, #8]	; (830 <Setup()+0x4c>)
     826:	2220      	movs	r2, #32
     828:	601a      	str	r2, [r3, #0]
     82a:	bd10      	pop	{r4, pc}
     82c:	1fff9204 	.word	0x1fff9204
     830:	400ff084 	.word	0x400ff084

00000834 <Loop()>:
    static u_int8_t NextSweepSource = 0;
    static u_int8_t NextSweepAxis = 0;

    Pulse *EarliestSyncDetectedSource = NULL;
    u_int32_t EarlyTrack = 0;
    u_int32_t BaseTime = CURRENT_TIME;
     834:	4b36      	ldr	r3, [pc, #216]	; (910 <Loop()+0xdc>)
void Loop() {
     836:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     83a:	4c36      	ldr	r4, [pc, #216]	; (914 <Loop()+0xe0>)
    u_int32_t BaseTime = CURRENT_TIME;
     83c:	681f      	ldr	r7, [r3, #0]
    u_int32_t EarlyTrack = 0;
     83e:	f04f 0900 	mov.w	r9, #0
    u_int32_t BaseTime = CURRENT_TIME;
     842:	43ff      	mvns	r7, r7
     844:	f504 7644 	add.w	r6, r4, #784	; 0x310
     848:	4625      	mov	r5, r4
    Pulse *EarliestSyncDetectedSource = NULL;
     84a:	46c8      	mov	r8, r9
                if (BaseTime - NewPulse->RisingEdgeTicks > EarlyTrack) {
                    EarlyTrack = BaseTime - NewPulse->RisingEdgeTicks;
                    EarliestSyncDetectedSource = NewPulse;

                }
                NewPulse->ReadOut = true;
     84c:	f04f 0a01 	mov.w	sl, #1
        if (Nodes[i].NeedsPulseHandling()) {
     850:	4628      	mov	r0, r5
     852:	f7ff fe0f 	bl	474 <SensorNode::NeedsPulseHandling()>
     856:	bb38      	cbnz	r0, 8a8 <Loop()+0x74>
     858:	35c4      	adds	r5, #196	; 0xc4
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
     85a:	42ae      	cmp	r6, r5
     85c:	d1f8      	bne.n	850 <Loop()+0x1c>
            }
        }
    }


    if (EarliestSyncDetectedSource != NULL) {
     85e:	f1b8 0f00 	cmp.w	r8, #0
     862:	d007      	beq.n	874 <Loop()+0x40>
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
     864:	482c      	ldr	r0, [pc, #176]	; (918 <Loop()+0xe4>)
     866:	f8d8 3000 	ldr.w	r3, [r8]
     86a:	6801      	ldr	r1, [r0, #0]
     86c:	1a59      	subs	r1, r3, r1
     86e:	f5b1 7f16 	cmp.w	r1, #600	; 0x258
     872:	d828      	bhi.n	8c6 <Loop()+0x92>
     874:	f8df 80b4 	ldr.w	r8, [pc, #180]	; 92c <Loop()+0xf8>
     878:	4f28      	ldr	r7, [pc, #160]	; (91c <Loop()+0xe8>)
     87a:	4d29      	ldr	r5, [pc, #164]	; (920 <Loop()+0xec>)
     87c:	f898 1000 	ldrb.w	r1, [r8]
     880:	783a      	ldrb	r2, [r7, #0]
     882:	682b      	ldr	r3, [r5, #0]
        }
    }


    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(NextSweepSource, NextSweepAxis, SweepSyncStartTime);
     884:	4620      	mov	r0, r4
     886:	34c4      	adds	r4, #196	; 0xc4
     888:	f7ff feb8 	bl	5fc <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)>
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
     88c:	42a6      	cmp	r6, r4
     88e:	d009      	beq.n	8a4 <Loop()+0x70>
        Nodes[i].CheckAndHandleSweep(NextSweepSource, NextSweepAxis, SweepSyncStartTime);
     890:	4620      	mov	r0, r4
     892:	f898 1000 	ldrb.w	r1, [r8]
     896:	783a      	ldrb	r2, [r7, #0]
     898:	682b      	ldr	r3, [r5, #0]
     89a:	34c4      	adds	r4, #196	; 0xc4
     89c:	f7ff feae 	bl	5fc <SensorNode::CheckAndHandleSweep(unsigned char, unsigned char, unsigned long)>
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
     8a0:	42a6      	cmp	r6, r4
     8a2:	d1f5      	bne.n	890 <Loop()+0x5c>
     8a4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
            Pulse *NewPulse = Nodes[i].PulseHandler();
     8a8:	4628      	mov	r0, r5
     8aa:	f7ff fe73 	bl	594 <SensorNode::PulseHandler()>
            if (NewPulse->IsSyncPulse) {
     8ae:	7b43      	ldrb	r3, [r0, #13]
     8b0:	2b00      	cmp	r3, #0
     8b2:	d0d1      	beq.n	858 <Loop()+0x24>
                if (BaseTime - NewPulse->RisingEdgeTicks > EarlyTrack) {
     8b4:	6803      	ldr	r3, [r0, #0]
                NewPulse->ReadOut = true;
     8b6:	f880 a00f 	strb.w	sl, [r0, #15]
                if (BaseTime - NewPulse->RisingEdgeTicks > EarlyTrack) {
     8ba:	1afb      	subs	r3, r7, r3
     8bc:	454b      	cmp	r3, r9
     8be:	bf84      	itt	hi
     8c0:	4699      	movhi	r9, r3
     8c2:	4680      	movhi	r8, r0
     8c4:	e7c8      	b.n	858 <Loop()+0x24>
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     8c6:	f8d8 2008 	ldr.w	r2, [r8, #8]
     8ca:	4d16      	ldr	r5, [pc, #88]	; (924 <Loop()+0xf0>)
            LastSyncPulseTime = EarliestSyncDetectedSource->RisingEdgeTicks;
     8cc:	6003      	str	r3, [r0, #0]
            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
     8ce:	eb02 0242 	add.w	r2, r2, r2, lsl #1
     8d2:	0112      	lsls	r2, r2, #4
     8d4:	fba5 0202 	umull	r0, r2, r5, r2
     8d8:	0952      	lsrs	r2, r2, #5
     8da:	4813      	ldr	r0, [pc, #76]	; (928 <Loop()+0xf4>)
     8dc:	f6a2 12c5 	subw	r2, r2, #2501	; 0x9c5
     8e0:	fba0 0202 	umull	r0, r2, r0, r2
     8e4:	0952      	lsrs	r2, r2, #5
            if (!SKIP(SyncPulseMeaning)) {
     8e6:	0750      	lsls	r0, r2, #29
     8e8:	d4c4      	bmi.n	874 <Loop()+0x40>
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     8ea:	f5a1 41b6 	sub.w	r1, r1, #23296	; 0x5b00
     8ee:	3968      	subs	r1, #104	; 0x68
     8f0:	f5b1 6f96 	cmp.w	r1, #1200	; 0x4b0
                NextSweepSource = SourceStation;
     8f4:	f8df 8034 	ldr.w	r8, [pc, #52]	; 92c <Loop()+0xf8>
                NextSweepAxis = AXIS(SyncPulseMeaning);
     8f8:	4f08      	ldr	r7, [pc, #32]	; (91c <Loop()+0xe8>)
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks;
     8fa:	4d09      	ldr	r5, [pc, #36]	; (920 <Loop()+0xec>)
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
     8fc:	bf8c      	ite	hi
     8fe:	2100      	movhi	r1, #0
     900:	2101      	movls	r1, #1
                NextSweepAxis = AXIS(SyncPulseMeaning);
     902:	f002 0201 	and.w	r2, r2, #1
                NextSweepSource = SourceStation;
     906:	f888 1000 	strb.w	r1, [r8]
                NextSweepAxis = AXIS(SyncPulseMeaning);
     90a:	703a      	strb	r2, [r7, #0]
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks;
     90c:	602b      	str	r3, [r5, #0]
     90e:	e7b9      	b.n	884 <Loop()+0x50>
     910:	40037104 	.word	0x40037104
     914:	1fff9204 	.word	0x1fff9204
     918:	1fff91f8 	.word	0x1fff91f8
     91c:	1fff9514 	.word	0x1fff9514
     920:	1fff91fc 	.word	0x1fff91fc
     924:	88888889 	.word	0x88888889
     928:	10624dd3 	.word	0x10624dd3
     92c:	1fff9200 	.word	0x1fff9200

00000930 <main>:
    }

}


int main() {
     930:	b508      	push	{r3, lr}
    Setup();
     932:	f7ff ff57 	bl	7e4 <Setup()>
    while (true) {
        Loop();
     936:	f7ff ff7d 	bl	834 <Loop()>
     93a:	e7fc      	b.n	936 <main+0x6>

0000093c <_GLOBAL__sub_I_Nodes>:
    }
    return 0;
     93c:	b510      	push	{r4, lr}
SensorNode Nodes[] = {SENSOR_1_PIN, SENSOR_2_PIN, SENSOR_3_PIN, SENSOR_4_PIN};
     93e:	4c0d      	ldr	r4, [pc, #52]	; (974 <_GLOBAL__sub_I_Nodes+0x38>)
     940:	2109      	movs	r1, #9
     942:	4620      	mov	r0, r4
     944:	f7ff fd92 	bl	46c <SensorNode::SensorNode(unsigned char)>
     948:	f104 00c4 	add.w	r0, r4, #196	; 0xc4
     94c:	210a      	movs	r1, #10
     94e:	f7ff fd8d 	bl	46c <SensorNode::SensorNode(unsigned char)>
     952:	f504 70c4 	add.w	r0, r4, #392	; 0x188
     956:	210b      	movs	r1, #11
     958:	f7ff fd88 	bl	46c <SensorNode::SensorNode(unsigned char)>
     95c:	f504 7013 	add.w	r0, r4, #588	; 0x24c
     960:	210c      	movs	r1, #12
     962:	f7ff fd83 	bl	46c <SensorNode::SensorNode(unsigned char)>
     966:	4a04      	ldr	r2, [pc, #16]	; (978 <_GLOBAL__sub_I_Nodes+0x3c>)
     968:	4904      	ldr	r1, [pc, #16]	; (97c <_GLOBAL__sub_I_Nodes+0x40>)
     96a:	2000      	movs	r0, #0
     96c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
SensorNode Nodes[] = {SENSOR_1_PIN, SENSOR_2_PIN, SENSOR_3_PIN, SENSOR_4_PIN};
     970:	f002 b834 	b.w	29dc <__aeabi_atexit>
     974:	1fff9204 	.word	0x1fff9204
     978:	1fff87fc 	.word	0x1fff87fc
     97c:	0000073d 	.word	0x0000073d

00000980 <Print::write(unsigned char const*, unsigned int)>:
#include "Print.h"



size_t Print::write(const uint8_t *buffer, size_t size)
{
     980:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	size_t count = 0;
	while (size--) count += write(*buffer++);
     982:	b172      	cbz	r2, 9a2 <Print::write(unsigned char const*, unsigned int)+0x22>
     984:	4606      	mov	r6, r0
     986:	460f      	mov	r7, r1
     988:	4614      	mov	r4, r2
     98a:	2500      	movs	r5, #0
     98c:	6833      	ldr	r3, [r6, #0]
     98e:	f817 1b01 	ldrb.w	r1, [r7], #1
     992:	681b      	ldr	r3, [r3, #0]
     994:	4630      	mov	r0, r6
     996:	4798      	blx	r3
     998:	3c01      	subs	r4, #1
     99a:	4405      	add	r5, r0
     99c:	d1f6      	bne.n	98c <Print::write(unsigned char const*, unsigned int)+0xc>
	return count;
}
     99e:	4628      	mov	r0, r5
     9a0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	size_t count = 0;
     9a2:	4615      	mov	r5, r2
     9a4:	e7fb      	b.n	99e <Print::write(unsigned char const*, unsigned int)+0x1e>
     9a6:	bf00      	nop

000009a8 <Print::print(long)>:
	return count;
}


size_t Print::print(long n)
{
     9a8:	b5f0      	push	{r4, r5, r6, r7, lr}
	uint8_t sign=0;

	if (n < 0) {
     9aa:	2900      	cmp	r1, #0
{
     9ac:	b08b      	sub	sp, #44	; 0x2c
     9ae:	4604      	mov	r4, r0
	if (n < 0) {
     9b0:	db1b      	blt.n	9ea <Print::print(long)+0x42>
	} else if (base == 1) {
		base = 10;
	}


	if (n == 0) {
     9b2:	d15a      	bne.n	a6a <Print::print(long)+0xc2>
		buf[sizeof(buf) - 1] = '0';
     9b4:	2330      	movs	r3, #48	; 0x30
     9b6:	f88d 3025 	strb.w	r3, [sp, #37]	; 0x25
	}
	if (sign) {
		i--;
		buf[i] = '-';
	}
	return write(buf + i, sizeof(buf) - i);
     9ba:	6823      	ldr	r3, [r4, #0]
     9bc:	4a35      	ldr	r2, [pc, #212]	; (a94 <Print::print(long)+0xec>)
     9be:	685f      	ldr	r7, [r3, #4]
     9c0:	4297      	cmp	r7, r2
     9c2:	d14a      	bne.n	a5a <Print::print(long)+0xb2>
	while (size--) count += write(*buffer++);
     9c4:	2500      	movs	r5, #0
	return write(buf + i, sizeof(buf) - i);
     9c6:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     9ca:	460e      	mov	r6, r1
     9cc:	440d      	add	r5, r1
     9ce:	2700      	movs	r7, #0
     9d0:	e001      	b.n	9d6 <Print::print(long)+0x2e>
     9d2:	6823      	ldr	r3, [r4, #0]
     9d4:	3601      	adds	r6, #1
	while (size--) count += write(*buffer++);
     9d6:	681b      	ldr	r3, [r3, #0]
     9d8:	7831      	ldrb	r1, [r6, #0]
     9da:	4620      	mov	r0, r4
     9dc:	4798      	blx	r3
     9de:	42b5      	cmp	r5, r6
     9e0:	4407      	add	r7, r0
     9e2:	d1f6      	bne.n	9d2 <Print::print(long)+0x2a>
     9e4:	4638      	mov	r0, r7
}
     9e6:	b00b      	add	sp, #44	; 0x2c
     9e8:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     9ea:	4b2b      	ldr	r3, [pc, #172]	; (a98 <Print::print(long)+0xf0>)
	return printNumber(n, 10, sign);
     9ec:	4249      	negs	r1, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     9ee:	fba3 2301 	umull	r2, r3, r3, r1
     9f2:	08db      	lsrs	r3, r3, #3
     9f4:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     9f8:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
     9fc:	3130      	adds	r1, #48	; 0x30
     9fe:	f88d 1025 	strb.w	r1, [sp, #37]	; 0x25
			if (n == 0) break;
     a02:	2b00      	cmp	r3, #0
     a04:	d044      	beq.n	a90 <Print::print(long)+0xe8>
		sign = '-';
     a06:	262d      	movs	r6, #45	; 0x2d
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a08:	4d23      	ldr	r5, [pc, #140]	; (a98 <Print::print(long)+0xf0>)
		sign = '-';
     a0a:	2221      	movs	r2, #33	; 0x21
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a0c:	fba5 0103 	umull	r0, r1, r5, r3
     a10:	08c9      	lsrs	r1, r1, #3
     a12:	eb01 0081 	add.w	r0, r1, r1, lsl #2
			i--;
     a16:	3a01      	subs	r2, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a18:	eba3 0340 	sub.w	r3, r3, r0, lsl #1
			i--;
     a1c:	b2d2      	uxtb	r2, r2
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a1e:	a80a      	add	r0, sp, #40	; 0x28
     a20:	4410      	add	r0, r2
     a22:	3330      	adds	r3, #48	; 0x30
     a24:	f800 3c24 	strb.w	r3, [r0, #-36]
			if (n == 0) break;
     a28:	460b      	mov	r3, r1
     a2a:	2900      	cmp	r1, #0
     a2c:	d1ee      	bne.n	a0c <Print::print(long)+0x64>
	if (sign) {
     a2e:	b35e      	cbz	r6, a88 <Print::print(long)+0xe0>
		i--;
     a30:	1e55      	subs	r5, r2, #1
     a32:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     a34:	ab0a      	add	r3, sp, #40	; 0x28
     a36:	442b      	add	r3, r5
     a38:	222d      	movs	r2, #45	; 0x2d
     a3a:	f803 2c24 	strb.w	r2, [r3, #-36]
     a3e:	f1c5 0022 	rsb	r0, r5, #34	; 0x22
	return write(buf + i, sizeof(buf) - i);
     a42:	6823      	ldr	r3, [r4, #0]
     a44:	4a13      	ldr	r2, [pc, #76]	; (a94 <Print::print(long)+0xec>)
     a46:	685f      	ldr	r7, [r3, #4]
     a48:	a901      	add	r1, sp, #4
     a4a:	4297      	cmp	r7, r2
     a4c:	4429      	add	r1, r5
     a4e:	d107      	bne.n	a60 <Print::print(long)+0xb8>
	while (size--) count += write(*buffer++);
     a50:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     a54:	2800      	cmp	r0, #0
     a56:	d1b8      	bne.n	9ca <Print::print(long)+0x22>
     a58:	e7c5      	b.n	9e6 <Print::print(long)+0x3e>
	return write(buf + i, sizeof(buf) - i);
     a5a:	2001      	movs	r0, #1
     a5c:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     a60:	4602      	mov	r2, r0
     a62:	4620      	mov	r0, r4
     a64:	47b8      	blx	r7
}
     a66:	b00b      	add	sp, #44	; 0x2c
     a68:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     a6a:	4b0b      	ldr	r3, [pc, #44]	; (a98 <Print::print(long)+0xf0>)
     a6c:	fba3 2301 	umull	r2, r3, r3, r1
     a70:	08db      	lsrs	r3, r3, #3
     a72:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     a76:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
     a7a:	3230      	adds	r2, #48	; 0x30
     a7c:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
			if (n == 0) break;
     a80:	2b00      	cmp	r3, #0
     a82:	d09a      	beq.n	9ba <Print::print(long)+0x12>
	uint8_t sign=0;
     a84:	2600      	movs	r6, #0
     a86:	e7bf      	b.n	a08 <Print::print(long)+0x60>
     a88:	4615      	mov	r5, r2
     a8a:	f1c2 0022 	rsb	r0, r2, #34	; 0x22
     a8e:	e7d8      	b.n	a42 <Print::print(long)+0x9a>
			if (n == 0) break;
     a90:	2221      	movs	r2, #33	; 0x21
     a92:	e7cd      	b.n	a30 <Print::print(long)+0x88>
     a94:	00000981 	.word	0x00000981
     a98:	cccccccd 	.word	0xcccccccd

00000a9c <Print::println()>:
{
     a9c:	b530      	push	{r4, r5, lr}
	return write(buf, 2);
     a9e:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     aa0:	490d      	ldr	r1, [pc, #52]	; (ad8 <Print::println()+0x3c>)
     aa2:	4a0e      	ldr	r2, [pc, #56]	; (adc <Print::println()+0x40>)
	return write(buf, 2);
     aa4:	685c      	ldr	r4, [r3, #4]
	uint8_t buf[2]={'\r', '\n'};
     aa6:	8809      	ldrh	r1, [r1, #0]
{
     aa8:	b083      	sub	sp, #12
     aaa:	4294      	cmp	r4, r2
	uint8_t buf[2]={'\r', '\n'};
     aac:	f8ad 1004 	strh.w	r1, [sp, #4]
     ab0:	d10d      	bne.n	ace <Print::println()+0x32>
     ab2:	4605      	mov	r5, r0
	while (size--) count += write(*buffer++);
     ab4:	681b      	ldr	r3, [r3, #0]
     ab6:	210d      	movs	r1, #13
     ab8:	4798      	blx	r3
     aba:	682b      	ldr	r3, [r5, #0]
     abc:	f89d 1005 	ldrb.w	r1, [sp, #5]
     ac0:	681b      	ldr	r3, [r3, #0]
     ac2:	4604      	mov	r4, r0
     ac4:	4628      	mov	r0, r5
     ac6:	4798      	blx	r3
     ac8:	4420      	add	r0, r4
}
     aca:	b003      	add	sp, #12
     acc:	bd30      	pop	{r4, r5, pc}
	return write(buf, 2);
     ace:	a901      	add	r1, sp, #4
     ad0:	2202      	movs	r2, #2
     ad2:	47a0      	blx	r4
}
     ad4:	b003      	add	sp, #12
     ad6:	bd30      	pop	{r4, r5, pc}
     ad8:	0000384c 	.word	0x0000384c
     adc:	00000981 	.word	0x00000981

00000ae0 <fault_isr>:
{
     ae0:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     ae2:	4c10      	ldr	r4, [pc, #64]	; (b24 <fault_isr+0x44>)
     ae4:	e008      	b.n	af8 <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     ae6:	6823      	ldr	r3, [r4, #0]
     ae8:	0559      	lsls	r1, r3, #21
     aea:	d40d      	bmi.n	b08 <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     aec:	6823      	ldr	r3, [r4, #0]
     aee:	051a      	lsls	r2, r3, #20
     af0:	d40f      	bmi.n	b12 <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     af2:	6823      	ldr	r3, [r4, #0]
     af4:	04db      	lsls	r3, r3, #19
     af6:	d411      	bmi.n	b1c <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     af8:	6823      	ldr	r3, [r4, #0]
     afa:	0358      	lsls	r0, r3, #13
     afc:	d5f3      	bpl.n	ae6 <fault_isr+0x6>
     afe:	f000 fb47 	bl	1190 <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     b02:	6823      	ldr	r3, [r4, #0]
     b04:	0559      	lsls	r1, r3, #21
     b06:	d5f1      	bpl.n	aec <fault_isr+0xc>
     b08:	f001 fd60 	bl	25cc <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     b0c:	6823      	ldr	r3, [r4, #0]
     b0e:	051a      	lsls	r2, r3, #20
     b10:	d5ef      	bpl.n	af2 <fault_isr+0x12>
     b12:	f001 fdf1 	bl	26f8 <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     b16:	6823      	ldr	r3, [r4, #0]
     b18:	04db      	lsls	r3, r3, #19
     b1a:	d5ed      	bpl.n	af8 <fault_isr+0x18>
     b1c:	f001 fe82 	bl	2824 <uart2_status_isr>
     b20:	e7ea      	b.n	af8 <fault_isr+0x18>
     b22:	bf00      	nop
     b24:	40048034 	.word	0x40048034

00000b28 <unused_isr>:
{
     b28:	b508      	push	{r3, lr}
	fault_isr();
     b2a:	f7ff ffd9 	bl	ae0 <fault_isr>
     b2e:	bf00      	nop

00000b30 <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
     b30:	4b01      	ldr	r3, [pc, #4]	; (b38 <startup_early_hook+0x8>)
     b32:	2210      	movs	r2, #16
     b34:	801a      	strh	r2, [r3, #0]
     b36:	4770      	bx	lr
     b38:	40052000 	.word	0x40052000

00000b3c <startup_late_hook>:
static void startup_default_late_hook(void) {}
     b3c:	4770      	bx	lr
     b3e:	bf00      	nop

00000b40 <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
     b40:	4909      	ldr	r1, [pc, #36]	; (b68 <_sbrk+0x28>)
{
     b42:	b508      	push	{r3, lr}
	prev = __brkval;
     b44:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
     b46:	b130      	cbz	r0, b56 <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
     b48:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
     b4a:	4418      	add	r0, r3
     b4c:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
     b50:	4290      	cmp	r0, r2
     b52:	d202      	bcs.n	b5a <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
     b54:	6008      	str	r0, [r1, #0]
	}
	return prev;
     b56:	4618      	mov	r0, r3
}
     b58:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
     b5a:	f002 f9a9 	bl	2eb0 <__errno>
     b5e:	230c      	movs	r3, #12
     b60:	6003      	str	r3, [r0, #0]
			return (void *)-1;
     b62:	f04f 30ff 	mov.w	r0, #4294967295
     b66:	bd08      	pop	{r3, pc}
     b68:	1fff8800 	.word	0x1fff8800

00000b6c <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
     b6c:	b4f0      	push	{r4, r5, r6, r7}
     b6e:	1e4d      	subs	r5, r1, #1
     b70:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
     b72:	2400      	movs	r4, #0
     b74:	e000      	b.n	b78 <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
     b76:	3401      	adds	r4, #1
		digit = val % radix;
     b78:	fbb0 f3f2 	udiv	r3, r0, r2
     b7c:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     b80:	2809      	cmp	r0, #9
     b82:	f100 0730 	add.w	r7, r0, #48	; 0x30
     b86:	bf8a      	itet	hi
     b88:	3037      	addhi	r0, #55	; 0x37
     b8a:	b2f8      	uxtbls	r0, r7
     b8c:	b2c0      	uxtbhi	r0, r0
     b8e:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
     b92:	4618      	mov	r0, r3
     b94:	2b00      	cmp	r3, #0
     b96:	d1ee      	bne.n	b76 <ultoa+0xa>
	}
	buf[i + 1] = 0;
     b98:	190a      	adds	r2, r1, r4
     b9a:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
     b9c:	b14c      	cbz	r4, bb2 <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
     b9e:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
     ba0:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
     ba4:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
     ba6:	3301      	adds	r3, #1
     ba8:	1ae0      	subs	r0, r4, r3
     baa:	4283      	cmp	r3, r0
		buf[i] = t;
     bac:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
     bb0:	dbf5      	blt.n	b9e <ultoa+0x32>
	}
	return buf;
}
     bb2:	4608      	mov	r0, r1
     bb4:	bcf0      	pop	{r4, r5, r6, r7}
     bb6:	4770      	bx	lr

00000bb8 <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
     bb8:	4770      	bx	lr
     bba:	bf00      	nop

00000bbc <attachInterrupt>:
void attachInterrupt(uint8_t pin, void (*function)(void), int mode)
{
	volatile uint32_t *config;
	uint32_t cfg, mask;

	if (pin >= CORE_NUM_DIGITAL) return;
     bbc:	2821      	cmp	r0, #33	; 0x21
{
     bbe:	b4f0      	push	{r4, r5, r6, r7}
	if (pin >= CORE_NUM_DIGITAL) return;
     bc0:	d815      	bhi.n	bee <attachInterrupt+0x32>
	switch (mode) {
     bc2:	2a04      	cmp	r2, #4
     bc4:	d813      	bhi.n	bee <attachInterrupt+0x32>
     bc6:	e8df f002 	tbb	[pc, r2]
     bca:	4c49      	.short	0x4c49
     bcc:	144f      	.short	0x144f
     bce:	46          	.byte	0x46
     bcf:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     bd0:	4e2e      	ldr	r6, [pc, #184]	; (c8c <attachInterrupt+0xd0>)
	attachInterruptVector(IRQ_PORTD, port_D_isr);
	attachInterruptVector(IRQ_PORTE, port_E_isr);
	voidFuncPtr* isr_table = getIsrTable(config);
	if(!isr_table) return;
	uint32_t pin_index = getPinIndex(config);
	__disable_irq();
     bd2:	b672      	cpsid	i
	cfg = *config;
     bd4:	681a      	ldr	r2, [r3, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
     bd6:	f422 2270 	bic.w	r2, r2, #983040	; 0xf0000
     bda:	f042 7080 	orr.w	r0, r2, #16777216	; 0x1000000
	*config = cfg;
	isr_table[pin_index] = function;	// set the function pointer
     bde:	f3c3 0484 	ubfx	r4, r3, #2, #5
	cfg |= mask;
     be2:	4328      	orrs	r0, r5
	*config = cfg;
     be4:	601a      	str	r2, [r3, #0]
	isr_table[pin_index] = function;	// set the function pointer
     be6:	f846 1024 	str.w	r1, [r6, r4, lsl #2]
	*config = cfg;			// enable the new interrupt
     bea:	6018      	str	r0, [r3, #0]
	__enable_irq();
     bec:	b662      	cpsie	i
	intFunc[pin] = function;	// set the function pointer
	cfg |= mask;
	*config = cfg;			// enable the new interrupt
	__enable_irq();
#endif
}
     bee:	bcf0      	pop	{r4, r5, r6, r7}
     bf0:	4770      	bx	lr
	switch (mode) {
     bf2:	f44f 2510 	mov.w	r5, #589824	; 0x90000
	config = portConfigRegister(pin);
     bf6:	4c26      	ldr	r4, [pc, #152]	; (c90 <attachInterrupt+0xd4>)
     bf8:	eb04 03c0 	add.w	r3, r4, r0, lsl #3
     bfc:	685b      	ldr	r3, [r3, #4]
	if ((*config & 0x00000700) == 0) {
     bfe:	681a      	ldr	r2, [r3, #0]
     c00:	f412 62e0 	ands.w	r2, r2, #1792	; 0x700
     c04:	d035      	beq.n	c72 <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
     c06:	4a23      	ldr	r2, [pc, #140]	; (c94 <attachInterrupt+0xd8>)
     c08:	4c23      	ldr	r4, [pc, #140]	; (c98 <attachInterrupt+0xdc>)
     c0a:	4824      	ldr	r0, [pc, #144]	; (c9c <attachInterrupt+0xe0>)
     c0c:	f8c2 419c 	str.w	r4, [r2, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     c10:	f103 4440 	add.w	r4, r3, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
     c14:	4e22      	ldr	r6, [pc, #136]	; (ca0 <attachInterrupt+0xe4>)
     c16:	f8c2 01a4 	str.w	r0, [r2, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     c1a:	f5a4 2092 	sub.w	r0, r4, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
     c1e:	4f21      	ldr	r7, [pc, #132]	; (ca4 <attachInterrupt+0xe8>)
     c20:	f8c2 61a0 	str.w	r6, [r2, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     c24:	287c      	cmp	r0, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
     c26:	4e20      	ldr	r6, [pc, #128]	; (ca8 <attachInterrupt+0xec>)
     c28:	f8c2 71a8 	str.w	r7, [r2, #424]	; 0x1a8
     c2c:	f8c2 61ac 	str.w	r6, [r2, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     c30:	d9ce      	bls.n	bd0 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     c32:	f5a4 2294 	sub.w	r2, r4, #303104	; 0x4a000
     c36:	2a7c      	cmp	r2, #124	; 0x7c
     c38:	d919      	bls.n	c6e <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     c3a:	f5a4 2296 	sub.w	r2, r4, #307200	; 0x4b000
     c3e:	2a7c      	cmp	r2, #124	; 0x7c
     c40:	d91f      	bls.n	c82 <attachInterrupt+0xc6>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     c42:	f5a4 2298 	sub.w	r2, r4, #311296	; 0x4c000
     c46:	2a7c      	cmp	r2, #124	; 0x7c
     c48:	d91d      	bls.n	c86 <attachInterrupt+0xca>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     c4a:	f5a4 249a 	sub.w	r4, r4, #315392	; 0x4d000
     c4e:	2c7c      	cmp	r4, #124	; 0x7c
     c50:	d8cd      	bhi.n	bee <attachInterrupt+0x32>
     c52:	4e16      	ldr	r6, [pc, #88]	; (cac <attachInterrupt+0xf0>)
     c54:	e7bd      	b.n	bd2 <attachInterrupt+0x16>
	switch (mode) {
     c56:	f44f 2530 	mov.w	r5, #720896	; 0xb0000
     c5a:	e7cc      	b.n	bf6 <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
     c5c:	f44f 2500 	mov.w	r5, #524288	; 0x80000
     c60:	e7c9      	b.n	bf6 <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
     c62:	f44f 2540 	mov.w	r5, #786432	; 0xc0000
     c66:	e7c6      	b.n	bf6 <attachInterrupt+0x3a>
	switch (mode) {
     c68:	f44f 2520 	mov.w	r5, #655360	; 0xa0000
     c6c:	e7c3      	b.n	bf6 <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     c6e:	4e10      	ldr	r6, [pc, #64]	; (cb0 <attachInterrupt+0xf4>)
     c70:	e7af      	b.n	bd2 <attachInterrupt+0x16>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
     c72:	f854 4030 	ldr.w	r4, [r4, r0, lsl #3]
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
			*config = PORT_PCR_MUX(1);
     c76:	f44f 7080 	mov.w	r0, #256	; 0x100
		*portModeRegister(pin) = 0;
     c7a:	f884 2280 	strb.w	r2, [r4, #640]	; 0x280
			*config = PORT_PCR_MUX(1);
     c7e:	6018      	str	r0, [r3, #0]
     c80:	e7c1      	b.n	c06 <attachInterrupt+0x4a>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     c82:	4e0c      	ldr	r6, [pc, #48]	; (cb4 <attachInterrupt+0xf8>)
     c84:	e7a5      	b.n	bd2 <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     c86:	4e0c      	ldr	r6, [pc, #48]	; (cb8 <attachInterrupt+0xfc>)
     c88:	e7a3      	b.n	bd2 <attachInterrupt+0x16>
     c8a:	bf00      	nop
     c8c:	1fff8804 	.word	0x1fff8804
     c90:	00003850 	.word	0x00003850
     c94:	1fff8200 	.word	0x1fff8200
     c98:	1fff87d1 	.word	0x1fff87d1
     c9c:	1fff8779 	.word	0x1fff8779
     ca0:	1fff87a5 	.word	0x1fff87a5
     ca4:	1fff874d 	.word	0x1fff874d
     ca8:	1fff8721 	.word	0x1fff8721
     cac:	1fff88dc 	.word	0x1fff88dc
     cb0:	1fff883c 	.word	0x1fff883c
     cb4:	1fff888c 	.word	0x1fff888c
     cb8:	1fff88bc 	.word	0x1fff88bc

00000cbc <rtc_set>:
{
     cbc:	b430      	push	{r4, r5}
	RTC_SR = 0;
     cbe:	4b05      	ldr	r3, [pc, #20]	; (cd4 <rtc_set+0x18>)
	RTC_TPR = 0;
     cc0:	4d05      	ldr	r5, [pc, #20]	; (cd8 <rtc_set+0x1c>)
	RTC_TSR = t;
     cc2:	4c06      	ldr	r4, [pc, #24]	; (cdc <rtc_set+0x20>)
	RTC_SR = 0;
     cc4:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
     cc6:	2110      	movs	r1, #16
	RTC_SR = 0;
     cc8:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
     cca:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
     ccc:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
     cce:	6019      	str	r1, [r3, #0]
}
     cd0:	bc30      	pop	{r4, r5}
     cd2:	4770      	bx	lr
     cd4:	4003d014 	.word	0x4003d014
     cd8:	4003d004 	.word	0x4003d004
     cdc:	4003d000 	.word	0x4003d000

00000ce0 <_init_Teensyduino_internal_>:
{
     ce0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     ce4:	4b6a      	ldr	r3, [pc, #424]	; (e90 <_init_Teensyduino_internal_+0x1b0>)
	FTM0_CNT = 0;
     ce6:	496b      	ldr	r1, [pc, #428]	; (e94 <_init_Teensyduino_internal_+0x1b4>)
	FTM0_C1SC = 0x28;
     ce8:	4e6b      	ldr	r6, [pc, #428]	; (e98 <_init_Teensyduino_internal_+0x1b8>)
	FTM0_C3SC = 0x28;
     cea:	4d6c      	ldr	r5, [pc, #432]	; (e9c <_init_Teensyduino_internal_+0x1bc>)
	FTM0_C4SC = 0x28;
     cec:	4c6c      	ldr	r4, [pc, #432]	; (ea0 <_init_Teensyduino_internal_+0x1c0>)
	FTM0_MOD = DEFAULT_FTM_MOD;
     cee:	f8df c1d0 	ldr.w	ip, [pc, #464]	; ec0 <_init_Teensyduino_internal_+0x1e0>
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     cf2:	f8df e1d0 	ldr.w	lr, [pc, #464]	; ec4 <_init_Teensyduino_internal_+0x1e4>
	FTM0_C2SC = 0x28;
     cf6:	4a6b      	ldr	r2, [pc, #428]	; (ea4 <_init_Teensyduino_internal_+0x1c4>)
	FTM0_C5SC = 0x28;
     cf8:	4f6b      	ldr	r7, [pc, #428]	; (ea8 <_init_Teensyduino_internal_+0x1c8>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     cfa:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
     cfe:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
     d00:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
     d04:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
     d06:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
     d0a:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
     d0c:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
     d10:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
     d12:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
     d16:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
     d18:	2000      	movs	r0, #0
     d1a:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     d1c:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
     d1e:	f64e 71ff 	movw	r1, #61439	; 0xefff
     d22:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     d26:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
     d2a:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
     d2c:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
     d2e:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
     d30:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
     d32:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
     d34:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
     d36:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     d38:	2209      	movs	r2, #9
     d3a:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
     d3e:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
     d42:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
     d46:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
     d4a:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
     d4e:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
     d52:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
     d56:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     d58:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     d5c:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
     d60:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
     d64:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
     d68:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     d6a:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     d6e:	484f      	ldr	r0, [pc, #316]	; (eac <_init_Teensyduino_internal_+0x1cc>)
	FTM2_MOD = DEFAULT_FTM_MOD;
     d70:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
     d72:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
     d76:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
     d7a:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
     d7c:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     d7e:	6002      	str	r2, [r0, #0]
	analog_init();
     d80:	f001 fba4 	bl	24cc <analog_init>

uint32_t micros(void)
{
	uint32_t count, current, istatus;

	__disable_irq();
     d84:	b672      	cpsid	i
	current = SYST_CVR;
	count = systick_millis_count;
     d86:	4d4a      	ldr	r5, [pc, #296]	; (eb0 <_init_Teensyduino_internal_+0x1d0>)
	current = SYST_CVR;
     d88:	4b4a      	ldr	r3, [pc, #296]	; (eb4 <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d8a:	4a4b      	ldr	r2, [pc, #300]	; (eb8 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     d8c:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     d8e:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d90:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     d92:	b662      	cpsie	i
	 //systick_current = current;
	 //systick_count = count;
	 //systick_istatus = istatus & SCB_ICSR_PENDSTSET ? 1 : 0;
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     d94:	0151      	lsls	r1, r2, #5
     d96:	d502      	bpl.n	d9e <_init_Teensyduino_internal_+0xbe>
     d98:	2b32      	cmp	r3, #50	; 0x32
     d9a:	bf88      	it	hi
     d9c:	3401      	addhi	r4, #1
#if defined(KINETISL) && F_CPU == 48000000
	return count * 1000 + ((current * (uint32_t)87381) >> 22);
#elif defined(KINETISL) && F_CPU == 24000000
	return count * 1000 + ((current * (uint32_t)174763) >> 22);
#endif
	return count * 1000 + current / (F_CPU / 1000000);
     d9e:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     da2:	4f46      	ldr	r7, [pc, #280]	; (ebc <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     da4:	f8df 910c 	ldr.w	r9, [pc, #268]	; eb4 <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     da8:	f8df 810c 	ldr.w	r8, [pc, #268]	; eb8 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     dac:	33bf      	adds	r3, #191	; 0xbf
     dae:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     db2:	fba7 1303 	umull	r1, r3, r7, r3
     db6:	fb02 f404 	mul.w	r4, r2, r4
     dba:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     dbe:	2632      	movs	r6, #50	; 0x32
	__disable_irq();
     dc0:	b672      	cpsid	i
	current = SYST_CVR;
     dc2:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     dc6:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     dc8:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     dcc:	b662      	cpsie	i
{
	uint32_t start = micros();

	if (ms > 0) {
		while (1) {
			while ((micros() - start) >= 1000) {
     dce:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     dd2:	33bf      	adds	r3, #191	; 0xbf
     dd4:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     dd8:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     ddc:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     de0:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     de4:	d002      	beq.n	dec <_init_Teensyduino_internal_+0x10c>
     de6:	2932      	cmp	r1, #50	; 0x32
     de8:	bf88      	it	hi
     dea:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     dec:	fb00 3302 	mla	r3, r0, r2, r3
     df0:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     df4:	d304      	bcc.n	e00 <_init_Teensyduino_internal_+0x120>
				ms--;
				if (ms == 0) return;
     df6:	3e01      	subs	r6, #1
     df8:	d005      	beq.n	e06 <_init_Teensyduino_internal_+0x126>
				start += 1000;
     dfa:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     dfe:	e7df      	b.n	dc0 <_init_Teensyduino_internal_+0xe0>
			}
			yield();
     e00:	f001 f9a2 	bl	2148 <yield>
     e04:	e7dc      	b.n	dc0 <_init_Teensyduino_internal_+0xe0>
	usb_init();
     e06:	f000 ff1d 	bl	1c44 <usb_init>
	__disable_irq();
     e0a:	b672      	cpsid	i
	current = SYST_CVR;
     e0c:	4b29      	ldr	r3, [pc, #164]	; (eb4 <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e0e:	4a2a      	ldr	r2, [pc, #168]	; (eb8 <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     e10:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     e12:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e14:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     e16:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     e18:	0152      	lsls	r2, r2, #5
     e1a:	d502      	bpl.n	e22 <_init_Teensyduino_internal_+0x142>
     e1c:	2b32      	cmp	r3, #50	; 0x32
     e1e:	bf88      	it	hi
     e20:	3401      	addhi	r4, #1
	return count * 1000 + current / (F_CPU / 1000000);
     e22:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     e26:	4f25      	ldr	r7, [pc, #148]	; (ebc <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     e28:	f8df 9088 	ldr.w	r9, [pc, #136]	; eb4 <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e2c:	f8df 8088 	ldr.w	r8, [pc, #136]	; eb8 <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     e30:	33bf      	adds	r3, #191	; 0xbf
     e32:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     e36:	fba7 1303 	umull	r1, r3, r7, r3
     e3a:	fb02 f404 	mul.w	r4, r2, r4
     e3e:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     e42:	f44f 76af 	mov.w	r6, #350	; 0x15e
	__disable_irq();
     e46:	b672      	cpsid	i
	current = SYST_CVR;
     e48:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     e4c:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     e4e:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     e52:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     e54:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     e58:	33bf      	adds	r3, #191	; 0xbf
     e5a:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     e5e:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     e62:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     e66:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     e6a:	d002      	beq.n	e72 <_init_Teensyduino_internal_+0x192>
     e6c:	2932      	cmp	r1, #50	; 0x32
     e6e:	bf88      	it	hi
     e70:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     e72:	fb00 3302 	mla	r3, r0, r2, r3
     e76:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     e7a:	d304      	bcc.n	e86 <_init_Teensyduino_internal_+0x1a6>
				if (ms == 0) return;
     e7c:	3e01      	subs	r6, #1
     e7e:	d005      	beq.n	e8c <_init_Teensyduino_internal_+0x1ac>
				start += 1000;
     e80:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     e84:	e7df      	b.n	e46 <_init_Teensyduino_internal_+0x166>
			yield();
     e86:	f001 f95f 	bl	2148 <yield>
     e8a:	e7dc      	b.n	e46 <_init_Teensyduino_internal_+0x166>
     e8c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     e90:	e000e108 	.word	0xe000e108
     e94:	40038004 	.word	0x40038004
     e98:	40038014 	.word	0x40038014
     e9c:	40038024 	.word	0x40038024
     ea0:	4003802c 	.word	0x4003802c
     ea4:	4003801c 	.word	0x4003801c
     ea8:	40038034 	.word	0x40038034
     eac:	400b8000 	.word	0x400b8000
     eb0:	1fff9518 	.word	0x1fff9518
     eb4:	e000e018 	.word	0xe000e018
     eb8:	e000ed04 	.word	0xe000ed04
     ebc:	88888889 	.word	0x88888889
     ec0:	40038008 	.word	0x40038008
     ec4:	4003800c 	.word	0x4003800c

00000ec8 <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
     ec8:	2821      	cmp	r0, #33	; 0x21
     eca:	d820      	bhi.n	f0e <pinMode+0x46>
	config = portConfigRegister(pin);
     ecc:	4a1b      	ldr	r2, [pc, #108]	; (f3c <pinMode+0x74>)
     ece:	eb02 03c0 	add.w	r3, r2, r0, lsl #3
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     ed2:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
     ed4:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     ed6:	d00f      	beq.n	ef8 <pinMode+0x30>
     ed8:	2904      	cmp	r1, #4
     eda:	d01d      	beq.n	f18 <pinMode+0x50>
		*portModeRegister(pin) = 0;
     edc:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
     ee0:	2200      	movs	r2, #0
     ee2:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
		if (mode == INPUT) {
     ee6:	b199      	cbz	r1, f10 <pinMode+0x48>
		} else if (mode == INPUT_PULLUP) {
     ee8:	2902      	cmp	r1, #2
     eea:	d022      	beq.n	f32 <pinMode+0x6a>
		} else if (mode == INPUT_PULLDOWN) {
     eec:	2903      	cmp	r1, #3
     eee:	d10d      	bne.n	f0c <pinMode+0x44>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
     ef0:	f44f 7281 	mov.w	r2, #258	; 0x102
     ef4:	601a      	str	r2, [r3, #0]
     ef6:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     ef8:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     efc:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     f00:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     f04:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
     f06:	681a      	ldr	r2, [r3, #0]
     f08:	f022 0220 	bic.w	r2, r2, #32
     f0c:	601a      	str	r2, [r3, #0]
     f0e:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
     f10:	f44f 7280 	mov.w	r2, #256	; 0x100
     f14:	601a      	str	r2, [r3, #0]
     f16:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     f18:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     f1c:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     f20:	2001      	movs	r0, #1
     f22:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     f26:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
     f28:	681a      	ldr	r2, [r3, #0]
     f2a:	f042 0220 	orr.w	r2, r2, #32
     f2e:	601a      	str	r2, [r3, #0]
     f30:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
     f32:	f240 1203 	movw	r2, #259	; 0x103
     f36:	601a      	str	r2, [r3, #0]
     f38:	4770      	bx	lr
     f3a:	bf00      	nop
     f3c:	00003850 	.word	0x00003850

00000f40 <delay>:
{
     f40:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
     f44:	4605      	mov	r5, r0
	__disable_irq();
     f46:	b672      	cpsid	i
	count = systick_millis_count;
     f48:	4f20      	ldr	r7, [pc, #128]	; (fcc <delay+0x8c>)
	current = SYST_CVR;
     f4a:	4b21      	ldr	r3, [pc, #132]	; (fd0 <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f4c:	4a21      	ldr	r2, [pc, #132]	; (fd4 <delay+0x94>)
	current = SYST_CVR;
     f4e:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     f50:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f52:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     f54:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     f56:	0152      	lsls	r2, r2, #5
     f58:	d502      	bpl.n	f60 <delay+0x20>
     f5a:	2b32      	cmp	r3, #50	; 0x32
     f5c:	bf88      	it	hi
     f5e:	3401      	addhi	r4, #1
	if (ms > 0) {
     f60:	b395      	cbz	r5, fc8 <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
     f62:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     f66:	4e1c      	ldr	r6, [pc, #112]	; (fd8 <delay+0x98>)
	current = SYST_CVR;
     f68:	f8df 9064 	ldr.w	r9, [pc, #100]	; fd0 <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f6c:	f8df 8064 	ldr.w	r8, [pc, #100]	; fd4 <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
     f70:	33bf      	adds	r3, #191	; 0xbf
     f72:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     f76:	fba6 1303 	umull	r1, r3, r6, r3
     f7a:	fb02 f404 	mul.w	r4, r2, r4
     f7e:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
     f82:	b672      	cpsid	i
	current = SYST_CVR;
     f84:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     f88:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     f8a:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     f8e:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     f90:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     f94:	33bf      	adds	r3, #191	; 0xbf
     f96:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     f9a:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     f9e:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     fa2:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     fa6:	d002      	beq.n	fae <delay+0x6e>
     fa8:	2932      	cmp	r1, #50	; 0x32
     faa:	bf88      	it	hi
     fac:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     fae:	fb00 3302 	mla	r3, r0, r2, r3
     fb2:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     fb6:	d304      	bcc.n	fc2 <delay+0x82>
				if (ms == 0) return;
     fb8:	3d01      	subs	r5, #1
     fba:	d005      	beq.n	fc8 <delay+0x88>
				start += 1000;
     fbc:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     fc0:	e7df      	b.n	f82 <delay+0x42>
			yield();
     fc2:	f001 f8c1 	bl	2148 <yield>
		}
     fc6:	e7dc      	b.n	f82 <delay+0x42>
     fc8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     fcc:	1fff9518 	.word	0x1fff9518
     fd0:	e000e018 	.word	0xe000e018
     fd4:	e000ed04 	.word	0xe000ed04
     fd8:	88888889 	.word	0x88888889

00000fdc <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
     fdc:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     fde:	2b03      	cmp	r3, #3
     fe0:	d814      	bhi.n	100c <usb_rx+0x30>
	__disable_irq();
     fe2:	b672      	cpsid	i
	ret = rx_first[endpoint];
     fe4:	490a      	ldr	r1, [pc, #40]	; (1010 <usb_rx+0x34>)
     fe6:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
     fea:	b168      	cbz	r0, 1008 <usb_rx+0x2c>
{
     fec:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
     fee:	4c09      	ldr	r4, [pc, #36]	; (1014 <usb_rx+0x38>)
     ff0:	8805      	ldrh	r5, [r0, #0]
     ff2:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
     ff6:	6846      	ldr	r6, [r0, #4]
     ff8:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
     ffc:	1b52      	subs	r2, r2, r5
     ffe:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
    1002:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
    1004:	bc70      	pop	{r4, r5, r6}
    1006:	4770      	bx	lr
	__enable_irq();
    1008:	b662      	cpsie	i
}
    100a:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
    100c:	2000      	movs	r0, #0
    100e:	4770      	bx	lr
    1010:	1fff9574 	.word	0x1fff9574
    1014:	1fff97f8 	.word	0x1fff97f8

00001018 <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
    1018:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
    101a:	2803      	cmp	r0, #3
    101c:	d80b      	bhi.n	1036 <usb_tx_packet_count+0x1e>
	__disable_irq();
    101e:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
    1020:	4b07      	ldr	r3, [pc, #28]	; (1040 <usb_tx_packet_count+0x28>)
    1022:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
    1026:	b143      	cbz	r3, 103a <usb_tx_packet_count+0x22>
    1028:	2000      	movs	r0, #0
    102a:	685b      	ldr	r3, [r3, #4]
    102c:	3001      	adds	r0, #1
    102e:	2b00      	cmp	r3, #0
    1030:	d1fb      	bne.n	102a <usb_tx_packet_count+0x12>
	__enable_irq();
    1032:	b662      	cpsie	i
	return count;
    1034:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
    1036:	2000      	movs	r0, #0
}
    1038:	4770      	bx	lr
	uint32_t count=0;
    103a:	4618      	mov	r0, r3
    103c:	e7f9      	b.n	1032 <usb_tx_packet_count+0x1a>
    103e:	bf00      	nop
    1040:	1fff95c8 	.word	0x1fff95c8

00001044 <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
    1044:	b430      	push	{r4, r5}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
    1046:	b672      	cpsid	i
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1048:	4a2b      	ldr	r2, [pc, #172]	; (10f8 <usb_rx_memory+0xb4>)
    104a:	7813      	ldrb	r3, [r2, #0]
    104c:	071d      	lsls	r5, r3, #28
    104e:	d506      	bpl.n	105e <usb_rx_memory+0x1a>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1050:	4b2a      	ldr	r3, [pc, #168]	; (10fc <usb_rx_memory+0xb8>)
    1052:	6a19      	ldr	r1, [r3, #32]
    1054:	2900      	cmp	r1, #0
    1056:	d036      	beq.n	10c6 <usb_rx_memory+0x82>
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
    1058:	6a99      	ldr	r1, [r3, #40]	; 0x28
    105a:	2900      	cmp	r1, #0
    105c:	d041      	beq.n	10e2 <usb_rx_memory+0x9e>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    105e:	7853      	ldrb	r3, [r2, #1]
    1060:	071c      	lsls	r4, r3, #28
    1062:	d506      	bpl.n	1072 <usb_rx_memory+0x2e>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1064:	4b25      	ldr	r3, [pc, #148]	; (10fc <usb_rx_memory+0xb8>)
    1066:	6c19      	ldr	r1, [r3, #64]	; 0x40
    1068:	2900      	cmp	r1, #0
    106a:	d03e      	beq.n	10ea <usb_rx_memory+0xa6>
			if (table[index(i, RX, ODD)].desc == 0) {
    106c:	6c99      	ldr	r1, [r3, #72]	; 0x48
    106e:	2900      	cmp	r1, #0
    1070:	d039      	beq.n	10e6 <usb_rx_memory+0xa2>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1072:	7893      	ldrb	r3, [r2, #2]
    1074:	0719      	lsls	r1, r3, #28
    1076:	d505      	bpl.n	1084 <usb_rx_memory+0x40>
			if (table[index(i, RX, EVEN)].desc == 0) {
    1078:	4b20      	ldr	r3, [pc, #128]	; (10fc <usb_rx_memory+0xb8>)
    107a:	6e19      	ldr	r1, [r3, #96]	; 0x60
    107c:	2900      	cmp	r1, #0
    107e:	d036      	beq.n	10ee <usb_rx_memory+0xaa>
			if (table[index(i, RX, ODD)].desc == 0) {
    1080:	6e99      	ldr	r1, [r3, #104]	; 0x68
    1082:	b189      	cbz	r1, 10a8 <usb_rx_memory+0x64>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
    1084:	78d3      	ldrb	r3, [r2, #3]
    1086:	071b      	lsls	r3, r3, #28
    1088:	d507      	bpl.n	109a <usb_rx_memory+0x56>
			if (table[index(i, RX, EVEN)].desc == 0) {
    108a:	4b1c      	ldr	r3, [pc, #112]	; (10fc <usb_rx_memory+0xb8>)
    108c:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
    1090:	b37a      	cbz	r2, 10f2 <usb_rx_memory+0xae>
			if (table[index(i, RX, ODD)].desc == 0) {
    1092:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
    1096:	2111      	movs	r1, #17
    1098:	b13a      	cbz	r2, 10aa <usb_rx_memory+0x66>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
    109a:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
    109c:	4b18      	ldr	r3, [pc, #96]	; (1100 <usb_rx_memory+0xbc>)
    109e:	2200      	movs	r2, #0
    10a0:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
    10a2:	bc30      	pop	{r4, r5}
	usb_free(packet);
    10a4:	f000 be70 	b.w	1d88 <usb_free>
			if (table[index(i, RX, ODD)].desc == 0) {
    10a8:	210d      	movs	r1, #13
				usb_rx_memory_needed--;
    10aa:	4c15      	ldr	r4, [pc, #84]	; (1100 <usb_rx_memory+0xbc>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    10ac:	4d15      	ldr	r5, [pc, #84]	; (1104 <usb_rx_memory+0xc0>)
				usb_rx_memory_needed--;
    10ae:	7822      	ldrb	r2, [r4, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    10b0:	f843 5031 	str.w	r5, [r3, r1, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
    10b4:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
    10b8:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    10ba:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
    10bc:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    10be:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    10c0:	b662      	cpsie	i
}
    10c2:	bc30      	pop	{r4, r5}
    10c4:	4770      	bx	lr
			if (table[index(i, RX, EVEN)].desc == 0) {
    10c6:	2204      	movs	r2, #4
				usb_rx_memory_needed--;
    10c8:	4c0d      	ldr	r4, [pc, #52]	; (1100 <usb_rx_memory+0xbc>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    10ca:	4d0f      	ldr	r5, [pc, #60]	; (1108 <usb_rx_memory+0xc4>)
				usb_rx_memory_needed--;
    10cc:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    10ce:	f843 5032 	str.w	r5, [r3, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
    10d2:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    10d6:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
    10d8:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
    10da:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
    10dc:	7022      	strb	r2, [r4, #0]
				__enable_irq();
    10de:	b662      	cpsie	i
				return;
    10e0:	e7ef      	b.n	10c2 <usb_rx_memory+0x7e>
			if (table[index(i, RX, ODD)].desc == 0) {
    10e2:	2105      	movs	r1, #5
    10e4:	e7e1      	b.n	10aa <usb_rx_memory+0x66>
    10e6:	2109      	movs	r1, #9
    10e8:	e7df      	b.n	10aa <usb_rx_memory+0x66>
			if (table[index(i, RX, EVEN)].desc == 0) {
    10ea:	2208      	movs	r2, #8
    10ec:	e7ec      	b.n	10c8 <usb_rx_memory+0x84>
    10ee:	220c      	movs	r2, #12
    10f0:	e7ea      	b.n	10c8 <usb_rx_memory+0x84>
    10f2:	2210      	movs	r2, #16
    10f4:	e7e8      	b.n	10c8 <usb_rx_memory+0x84>
    10f6:	bf00      	nop
    10f8:	00003988 	.word	0x00003988
    10fc:	1fff8000 	.word	0x1fff8000
    1100:	1fff95f1 	.word	0x1fff95f1
    1104:	004000c8 	.word	0x004000c8
    1108:	00400088 	.word	0x00400088

0000110c <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
    110c:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
    110e:	2b03      	cmp	r3, #3
    1110:	d81d      	bhi.n	114e <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    1112:	4a1b      	ldr	r2, [pc, #108]	; (1180 <usb_tx+0x74>)
    1114:	0140      	lsls	r0, r0, #5
    1116:	f040 0010 	orr.w	r0, r0, #16
{
    111a:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
    111c:	4410      	add	r0, r2
	__disable_irq();
    111e:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
    1120:	4c18      	ldr	r4, [pc, #96]	; (1184 <usb_tx+0x78>)
    1122:	5ce2      	ldrb	r2, [r4, r3]
    1124:	2a03      	cmp	r2, #3
    1126:	d81b      	bhi.n	1160 <usb_tx+0x54>
    1128:	e8df f002 	tbb	[pc, r2]
    112c:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
    1130:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    1132:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
    1134:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    1136:	f010 0f08 	tst.w	r0, #8
    113a:	bf14      	ite	ne
    113c:	23c8      	movne	r3, #200	; 0xc8
    113e:	2388      	moveq	r3, #136	; 0x88
    1140:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
    1144:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
    1146:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
    1148:	6041      	str	r1, [r0, #4]
	__enable_irq();
    114a:	b662      	cpsie	i
}
    114c:	bc30      	pop	{r4, r5}
    114e:	4770      	bx	lr
		b++;
    1150:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
    1152:	2202      	movs	r2, #2
		break;
    1154:	e7ed      	b.n	1132 <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
    1156:	2205      	movs	r2, #5
    1158:	e7eb      	b.n	1132 <usb_tx+0x26>
		b++;
    115a:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
    115c:	2204      	movs	r2, #4
		break;
    115e:	e7e8      	b.n	1132 <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
    1160:	4a09      	ldr	r2, [pc, #36]	; (1188 <usb_tx+0x7c>)
    1162:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    1166:	b138      	cbz	r0, 1178 <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
    1168:	4a08      	ldr	r2, [pc, #32]	; (118c <usb_tx+0x80>)
    116a:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    116e:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
    1170:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
    1174:	b662      	cpsie	i
		return;
    1176:	e7e9      	b.n	114c <usb_tx+0x40>
			tx_first[endpoint] = packet;
    1178:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    117c:	4a03      	ldr	r2, [pc, #12]	; (118c <usb_tx+0x80>)
    117e:	e7f7      	b.n	1170 <usb_tx+0x64>
    1180:	1fff8000 	.word	0x1fff8000
    1184:	1fff9600 	.word	0x1fff9600
    1188:	1fff95c8 	.word	0x1fff95c8
    118c:	1fff95d8 	.word	0x1fff95d8

00001190 <usb_isr>:
}



void usb_isr(void)
{
    1190:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
    1194:	f8df b30c 	ldr.w	fp, [pc, #780]	; 14a4 <usb_isr+0x314>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
    1198:	f8df a30c 	ldr.w	sl, [pc, #780]	; 14a8 <usb_isr+0x318>
{
    119c:	b087      	sub	sp, #28
    119e:	e044      	b.n	122a <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
    11a0:	4fab      	ldr	r7, [pc, #684]	; (1450 <usb_isr+0x2c0>)
    11a2:	ea4f 0893 	mov.w	r8, r3, lsr #2
    11a6:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
    11aa:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    11ac:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
    11b0:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
    11b4:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    11b6:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
    11ba:	f003 04ff 	and.w	r4, r3, #255	; 0xff
    11be:	2b00      	cmp	r3, #0
    11c0:	f040 8102 	bne.w	13c8 <usb_isr+0x238>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
    11c4:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
    11c8:	0c1b      	lsrs	r3, r3, #16
    11ca:	b299      	uxth	r1, r3
    11cc:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
    11d0:	2b00      	cmp	r3, #0
    11d2:	f000 80f0 	beq.w	13b6 <usb_isr+0x226>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
    11d6:	4b9f      	ldr	r3, [pc, #636]	; (1454 <usb_isr+0x2c4>)
					packet->index = 0;
    11d8:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    11dc:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    11e0:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    11e4:	2a00      	cmp	r2, #0
    11e6:	f000 82c5 	beq.w	1774 <usb_isr+0x5e4>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    11ea:	4d9b      	ldr	r5, [pc, #620]	; (1458 <usb_isr+0x2c8>)
    11ec:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    11f0:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    11f2:	4c9a      	ldr	r4, [pc, #616]	; (145c <usb_isr+0x2cc>)
					rx_last[endpoint] = packet;
    11f4:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    11f8:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    11fc:	4419      	add	r1, r3
    11fe:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    1202:	f000 fda1 	bl	1d48 <usb_malloc>
					if (packet) {
    1206:	2800      	cmp	r0, #0
    1208:	f000 82ad 	beq.w	1766 <usb_isr+0x5d6>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    120c:	4a94      	ldr	r2, [pc, #592]	; (1460 <usb_isr+0x2d0>)
    120e:	4b95      	ldr	r3, [pc, #596]	; (1464 <usb_isr+0x2d4>)
    1210:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    1214:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    1218:	bf18      	it	ne
    121a:	4613      	movne	r3, r2
						b->addr = packet->buf;
    121c:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    1220:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    1224:	2308      	movs	r3, #8
    1226:	f88b 3000 	strb.w	r3, [fp]
	status = USB0_ISTAT;
    122a:	f89b 4000 	ldrb.w	r4, [fp]
    122e:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    1230:	0761      	lsls	r1, r4, #29
    1232:	d51a      	bpl.n	126a <usb_isr+0xda>
		if (usb_configuration) {
    1234:	4b8c      	ldr	r3, [pc, #560]	; (1468 <usb_isr+0x2d8>)
    1236:	781b      	ldrb	r3, [r3, #0]
    1238:	b1a3      	cbz	r3, 1264 <usb_isr+0xd4>
			t = usb_reboot_timer;
    123a:	498c      	ldr	r1, [pc, #560]	; (146c <usb_isr+0x2dc>)
    123c:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    123e:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    1242:	b122      	cbz	r2, 124e <usb_isr+0xbe>
				usb_reboot_timer = --t;
    1244:	3b01      	subs	r3, #1
    1246:	b2db      	uxtb	r3, r3
    1248:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    124a:	b903      	cbnz	r3, 124e <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    124c:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    124e:	4988      	ldr	r1, [pc, #544]	; (1470 <usb_isr+0x2e0>)
    1250:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    1252:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    1256:	b12a      	cbz	r2, 1264 <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    1258:	3b01      	subs	r3, #1
    125a:	b2db      	uxtb	r3, r3
    125c:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    125e:	2b00      	cmp	r3, #0
    1260:	f000 8257 	beq.w	1712 <usb_isr+0x582>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    1264:	2304      	movs	r3, #4
    1266:	f88b 3000 	strb.w	r3, [fp]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    126a:	f004 0308 	and.w	r3, r4, #8
    126e:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    1272:	2b00      	cmp	r3, #0
    1274:	f000 80cc 	beq.w	1410 <usb_isr+0x280>
		stat = USB0_STAT;
    1278:	f89a 3000 	ldrb.w	r3, [sl]
    127c:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    127e:	091e      	lsrs	r6, r3, #4
    1280:	d18e      	bne.n	11a0 <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    1282:	089c      	lsrs	r4, r3, #2
    1284:	f8df 91c8 	ldr.w	r9, [pc, #456]	; 1450 <usb_isr+0x2c0>
	switch (pid) {
    1288:	f859 2034 	ldr.w	r2, [r9, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    128c:	eb09 01c4 	add.w	r1, r9, r4, lsl #3
	switch (pid) {
    1290:	f3c2 0283 	ubfx	r2, r2, #2, #4
    1294:	3a01      	subs	r2, #1
	buf = b->addr;
    1296:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    1298:	2a0c      	cmp	r2, #12
    129a:	f200 8088 	bhi.w	13ae <usb_isr+0x21e>
    129e:	e8df f002 	tbb	[pc, r2]
    12a2:	7c7c      	.short	0x7c7c
    12a4:	86868686 	.word	0x86868686
    12a8:	86478686 	.word	0x86478686
    12ac:	8686      	.short	0x8686
    12ae:	07          	.byte	0x07
    12af:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    12b0:	6808      	ldr	r0, [r1, #0]
    12b2:	4d70      	ldr	r5, [pc, #448]	; (1474 <usb_isr+0x2e4>)
		setup.word2 = *(uint32_t *)(buf + 4);
    12b4:	684a      	ldr	r2, [r1, #4]
		ep0_tx_ptr = NULL;
    12b6:	4f70      	ldr	r7, [pc, #448]	; (1478 <usb_isr+0x2e8>)
		ep0_tx_data_toggle = 1;
    12b8:	4e70      	ldr	r6, [pc, #448]	; (147c <usb_isr+0x2ec>)
		setup.word1 = *(uint32_t *)(buf);
    12ba:	6028      	str	r0, [r5, #0]
	switch (setup.wRequestAndType) {
    12bc:	b281      	uxth	r1, r0
    12be:	f240 6081 	movw	r0, #1665	; 0x681
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    12c2:	4b67      	ldr	r3, [pc, #412]	; (1460 <usb_isr+0x2d0>)
		setup.word2 = *(uint32_t *)(buf + 4);
    12c4:	606a      	str	r2, [r5, #4]
		ep0_tx_data_toggle = 1;
    12c6:	f04f 0e01 	mov.w	lr, #1
		ep0_tx_ptr = NULL;
    12ca:	2200      	movs	r2, #0
	switch (setup.wRequestAndType) {
    12cc:	4281      	cmp	r1, r0
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    12ce:	f849 3034 	str.w	r3, [r9, r4, lsl #3]
		ep0_tx_ptr = NULL;
    12d2:	603a      	str	r2, [r7, #0]
		table[index(0, TX, EVEN)].desc = 0;
    12d4:	f8c9 2010 	str.w	r2, [r9, #16]
		table[index(0, TX, ODD)].desc = 0;
    12d8:	f8c9 2018 	str.w	r2, [r9, #24]
		ep0_tx_data_toggle = 1;
    12dc:	f886 e000 	strb.w	lr, [r6]
		table[index(0, TX, EVEN)].desc = 0;
    12e0:	4c5b      	ldr	r4, [pc, #364]	; (1450 <usb_isr+0x2c0>)
	switch (setup.wRequestAndType) {
    12e2:	f200 80e3 	bhi.w	14ac <usb_isr+0x31c>
    12e6:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    12ea:	f080 8346 	bcs.w	197a <usb_isr+0x7ea>
    12ee:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    12f2:	f000 82fc 	beq.w	18ee <usb_isr+0x75e>
    12f6:	f200 828d 	bhi.w	1814 <usb_isr+0x684>
    12fa:	2980      	cmp	r1, #128	; 0x80
    12fc:	f000 8377 	beq.w	19ee <usb_isr+0x85e>
    1300:	2982      	cmp	r1, #130	; 0x82
    1302:	f040 82fa 	bne.w	18fa <usb_isr+0x76a>
    1306:	88a9      	ldrh	r1, [r5, #4]
    1308:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    130c:	2904      	cmp	r1, #4
    130e:	f200 82f4 	bhi.w	18fa <usb_isr+0x76a>
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1312:	485b      	ldr	r0, [pc, #364]	; (1480 <usb_isr+0x2f0>)
		reply_buffer[0] = 0;
    1314:	4c5b      	ldr	r4, [pc, #364]	; (1484 <usb_isr+0x2f4>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1316:	0089      	lsls	r1, r1, #2
    1318:	4408      	add	r0, r1
		reply_buffer[0] = 0;
    131a:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    131c:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    131e:	7802      	ldrb	r2, [r0, #0]
    1320:	0793      	lsls	r3, r2, #30
    1322:	f140 8455 	bpl.w	1bd0 <usb_isr+0xa40>
    1326:	f884 e000 	strb.w	lr, [r4]
		datalen = 2;
    132a:	f04f 0e02 	mov.w	lr, #2
    132e:	e342      	b.n	19b6 <usb_isr+0x826>
		data = ep0_tx_ptr;
    1330:	4f51      	ldr	r7, [pc, #324]	; (1478 <usb_isr+0x2e8>)
    1332:	683a      	ldr	r2, [r7, #0]
		if (data) {
    1334:	b332      	cbz	r2, 1384 <usb_isr+0x1f4>
			size = ep0_tx_len;
    1336:	4b54      	ldr	r3, [pc, #336]	; (1488 <usb_isr+0x2f8>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1338:	4e50      	ldr	r6, [pc, #320]	; (147c <usb_isr+0x2ec>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    133a:	4954      	ldr	r1, [pc, #336]	; (148c <usb_isr+0x2fc>)
			size = ep0_tx_len;
    133c:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    133e:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1340:	780d      	ldrb	r5, [r1, #0]
    1342:	2840      	cmp	r0, #64	; 0x40
    1344:	4686      	mov	lr, r0
    1346:	f045 0802 	orr.w	r8, r5, #2
    134a:	bf28      	it	cs
    134c:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1350:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    1352:	f084 0401 	eor.w	r4, r4, #1
    1356:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    1358:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    135c:	bf0c      	ite	eq
    135e:	2488      	moveq	r4, #136	; 0x88
    1360:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1362:	eb09 06c8 	add.w	r6, r9, r8, lsl #3
			ep0_tx_len -= size;
    1366:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    1368:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    136c:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1370:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    1372:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1374:	f849 4038 	str.w	r4, [r9, r8, lsl #3]
			data += size;
    1378:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    137a:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    137c:	2800      	cmp	r0, #0
    137e:	f000 8145 	beq.w	160c <usb_isr+0x47c>
    1382:	603a      	str	r2, [r7, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    1384:	4b3b      	ldr	r3, [pc, #236]	; (1474 <usb_isr+0x2e4>)
    1386:	881a      	ldrh	r2, [r3, #0]
    1388:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    138c:	d10f      	bne.n	13ae <usb_isr+0x21e>
			setup.bRequest = 0;
    138e:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    1390:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    1392:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    1394:	4b3e      	ldr	r3, [pc, #248]	; (1490 <usb_isr+0x300>)
    1396:	701a      	strb	r2, [r3, #0]
    1398:	e009      	b.n	13ae <usb_isr+0x21e>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    139a:	4a36      	ldr	r2, [pc, #216]	; (1474 <usb_isr+0x2e4>)
    139c:	8810      	ldrh	r0, [r2, #0]
    139e:	f242 0221 	movw	r2, #8225	; 0x2021
    13a2:	4290      	cmp	r0, r2
    13a4:	f000 8137 	beq.w	1616 <usb_isr+0x486>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    13a8:	4a2d      	ldr	r2, [pc, #180]	; (1460 <usb_isr+0x2d0>)
    13aa:	f849 2034 	str.w	r2, [r9, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    13ae:	4a39      	ldr	r2, [pc, #228]	; (1494 <usb_isr+0x304>)
    13b0:	2301      	movs	r3, #1
    13b2:	7013      	strb	r3, [r2, #0]
    13b4:	e736      	b.n	1224 <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    13b6:	4a2a      	ldr	r2, [pc, #168]	; (1460 <usb_isr+0x2d0>)
    13b8:	4b2a      	ldr	r3, [pc, #168]	; (1464 <usb_isr+0x2d4>)
    13ba:	f019 0f08 	tst.w	r9, #8
    13be:	bf18      	it	ne
    13c0:	4613      	movne	r3, r2
    13c2:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    13c6:	e72d      	b.n	1224 <usb_isr+0x94>
				usb_free(packet);
    13c8:	f000 fcde 	bl	1d88 <usb_free>
				packet = tx_first[endpoint];
    13cc:	4a32      	ldr	r2, [pc, #200]	; (1498 <usb_isr+0x308>)
					switch (tx_state[endpoint]) {
    13ce:	4933      	ldr	r1, [pc, #204]	; (149c <usb_isr+0x30c>)
				packet = tx_first[endpoint];
    13d0:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    13d4:	2b00      	cmp	r3, #0
    13d6:	f000 81d1 	beq.w	177c <usb_isr+0x5ec>
					tx_first[endpoint] = packet->next;
    13da:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    13dc:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    13de:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    13e2:	f103 0208 	add.w	r2, r3, #8
    13e6:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    13ea:	2c03      	cmp	r4, #3
    13ec:	d805      	bhi.n	13fa <usb_isr+0x26a>
    13ee:	e8df f004 	tbb	[pc, r4]
    13f2:	022c      	.short	0x022c
    13f4:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    13f6:	2202      	movs	r2, #2
    13f8:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    13fa:	881a      	ldrh	r2, [r3, #0]
    13fc:	f019 0f08 	tst.w	r9, #8
    1400:	bf0c      	ite	eq
    1402:	2388      	moveq	r3, #136	; 0x88
    1404:	23c8      	movne	r3, #200	; 0xc8
    1406:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    140a:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    140e:	e709      	b.n	1224 <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    1410:	07e0      	lsls	r0, r4, #31
    1412:	f100 8181 	bmi.w	1718 <usb_isr+0x588>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    1416:	0621      	lsls	r1, r4, #24
    1418:	f100 81f2 	bmi.w	1800 <usb_isr+0x670>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    141c:	07a2      	lsls	r2, r4, #30
    141e:	d506      	bpl.n	142e <usb_isr+0x29e>
		uint8_t err = USB0_ERRSTAT;
    1420:	4a1f      	ldr	r2, [pc, #124]	; (14a0 <usb_isr+0x310>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    1422:	4920      	ldr	r1, [pc, #128]	; (14a4 <usb_isr+0x314>)
		uint8_t err = USB0_ERRSTAT;
    1424:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1426:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    1428:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    142a:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    142c:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    142e:	06e3      	lsls	r3, r4, #27
    1430:	d502      	bpl.n	1438 <usb_isr+0x2a8>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    1432:	4b1c      	ldr	r3, [pc, #112]	; (14a4 <usb_isr+0x314>)
    1434:	2210      	movs	r2, #16
    1436:	701a      	strb	r2, [r3, #0]
	}

}
    1438:	b007      	add	sp, #28
    143a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    143e:	2204      	movs	r2, #4
    1440:	558a      	strb	r2, [r1, r6]
						break;
    1442:	e7da      	b.n	13fa <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    1444:	2205      	movs	r2, #5
    1446:	558a      	strb	r2, [r1, r6]
						break;
    1448:	e7d7      	b.n	13fa <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    144a:	2203      	movs	r2, #3
    144c:	558a      	strb	r2, [r1, r6]
						break;
    144e:	e7d4      	b.n	13fa <usb_isr+0x26a>
    1450:	1fff8000 	.word	0x1fff8000
    1454:	1fff9574 	.word	0x1fff9574
    1458:	1fff9520 	.word	0x1fff9520
    145c:	1fff97f8 	.word	0x1fff97f8
    1460:	004000c8 	.word	0x004000c8
    1464:	00400088 	.word	0x00400088
    1468:	1fff95fc 	.word	0x1fff95fc
    146c:	1fff9585 	.word	0x1fff9585
    1470:	1fff9604 	.word	0x1fff9604
    1474:	1fff95e8 	.word	0x1fff95e8
    1478:	1fff951c 	.word	0x1fff951c
    147c:	1fff9584 	.word	0x1fff9584
    1480:	400720c0 	.word	0x400720c0
    1484:	1fff95f4 	.word	0x1fff95f4
    1488:	1fff9530 	.word	0x1fff9530
    148c:	1fff95f0 	.word	0x1fff95f0
    1490:	40072098 	.word	0x40072098
    1494:	40072094 	.word	0x40072094
    1498:	1fff95c8 	.word	0x1fff95c8
    149c:	1fff9600 	.word	0x1fff9600
    14a0:	40072088 	.word	0x40072088
    14a4:	40072080 	.word	0x40072080
    14a8:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    14ac:	f242 0021 	movw	r0, #8225	; 0x2021
    14b0:	4281      	cmp	r1, r0
    14b2:	f000 812a 	beq.w	170a <usb_isr+0x57a>
    14b6:	f200 80d8 	bhi.w	166a <usb_isr+0x4da>
    14ba:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    14be:	f000 8276 	beq.w	19ae <usb_isr+0x81e>
    14c2:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    14c6:	f040 8218 	bne.w	18fa <usb_isr+0x76a>
			if (table[i].desc & BDT_OWN) {
    14ca:	6a22      	ldr	r2, [r4, #32]
		usb_configuration = setup.wValue;
    14cc:	49b3      	ldr	r1, [pc, #716]	; (179c <usb_isr+0x60c>)
    14ce:	78a8      	ldrb	r0, [r5, #2]
    14d0:	7008      	strb	r0, [r1, #0]
			if (table[i].desc & BDT_OWN) {
    14d2:	0612      	lsls	r2, r2, #24
    14d4:	f100 8337 	bmi.w	1b46 <usb_isr+0x9b6>
    14d8:	f8d9 2028 	ldr.w	r2, [r9, #40]	; 0x28
    14dc:	49b0      	ldr	r1, [pc, #704]	; (17a0 <usb_isr+0x610>)
    14de:	0613      	lsls	r3, r2, #24
    14e0:	f100 832c 	bmi.w	1b3c <usb_isr+0x9ac>
    14e4:	f8d9 2030 	ldr.w	r2, [r9, #48]	; 0x30
    14e8:	49ad      	ldr	r1, [pc, #692]	; (17a0 <usb_isr+0x610>)
    14ea:	0615      	lsls	r5, r2, #24
    14ec:	f100 82ff 	bmi.w	1aee <usb_isr+0x95e>
    14f0:	f8d9 2038 	ldr.w	r2, [r9, #56]	; 0x38
    14f4:	49aa      	ldr	r1, [pc, #680]	; (17a0 <usb_isr+0x610>)
    14f6:	0614      	lsls	r4, r2, #24
    14f8:	f100 82f4 	bmi.w	1ae4 <usb_isr+0x954>
    14fc:	f8d9 2040 	ldr.w	r2, [r9, #64]	; 0x40
    1500:	49a7      	ldr	r1, [pc, #668]	; (17a0 <usb_isr+0x610>)
    1502:	0610      	lsls	r0, r2, #24
    1504:	f100 8347 	bmi.w	1b96 <usb_isr+0xa06>
    1508:	f8d9 2048 	ldr.w	r2, [r9, #72]	; 0x48
    150c:	49a4      	ldr	r1, [pc, #656]	; (17a0 <usb_isr+0x610>)
    150e:	0612      	lsls	r2, r2, #24
    1510:	f100 833c 	bmi.w	1b8c <usb_isr+0x9fc>
    1514:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
    1518:	49a1      	ldr	r1, [pc, #644]	; (17a0 <usb_isr+0x610>)
    151a:	0613      	lsls	r3, r2, #24
    151c:	f100 8331 	bmi.w	1b82 <usb_isr+0x9f2>
    1520:	f8d9 2058 	ldr.w	r2, [r9, #88]	; 0x58
    1524:	499e      	ldr	r1, [pc, #632]	; (17a0 <usb_isr+0x610>)
    1526:	0615      	lsls	r5, r2, #24
    1528:	f100 8326 	bmi.w	1b78 <usb_isr+0x9e8>
    152c:	f8d9 2060 	ldr.w	r2, [r9, #96]	; 0x60
    1530:	499b      	ldr	r1, [pc, #620]	; (17a0 <usb_isr+0x610>)
    1532:	0614      	lsls	r4, r2, #24
    1534:	f100 831b 	bmi.w	1b6e <usb_isr+0x9de>
    1538:	f8d9 2068 	ldr.w	r2, [r9, #104]	; 0x68
    153c:	4998      	ldr	r1, [pc, #608]	; (17a0 <usb_isr+0x610>)
    153e:	0610      	lsls	r0, r2, #24
    1540:	f100 8310 	bmi.w	1b64 <usb_isr+0x9d4>
    1544:	f8d9 2070 	ldr.w	r2, [r9, #112]	; 0x70
    1548:	4995      	ldr	r1, [pc, #596]	; (17a0 <usb_isr+0x610>)
    154a:	0612      	lsls	r2, r2, #24
    154c:	f100 8305 	bmi.w	1b5a <usb_isr+0x9ca>
    1550:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    1554:	4992      	ldr	r1, [pc, #584]	; (17a0 <usb_isr+0x610>)
    1556:	0613      	lsls	r3, r2, #24
    1558:	f100 82fa 	bmi.w	1b50 <usb_isr+0x9c0>
    155c:	f8d9 2080 	ldr.w	r2, [r9, #128]	; 0x80
    1560:	498f      	ldr	r1, [pc, #572]	; (17a0 <usb_isr+0x610>)
    1562:	0615      	lsls	r5, r2, #24
    1564:	f100 832e 	bmi.w	1bc4 <usb_isr+0xa34>
    1568:	f8d9 2088 	ldr.w	r2, [r9, #136]	; 0x88
    156c:	498c      	ldr	r1, [pc, #560]	; (17a0 <usb_isr+0x610>)
    156e:	0614      	lsls	r4, r2, #24
    1570:	f100 8322 	bmi.w	1bb8 <usb_isr+0xa28>
    1574:	f8d9 2090 	ldr.w	r2, [r9, #144]	; 0x90
    1578:	4989      	ldr	r1, [pc, #548]	; (17a0 <usb_isr+0x610>)
    157a:	0610      	lsls	r0, r2, #24
    157c:	f100 8316 	bmi.w	1bac <usb_isr+0xa1c>
    1580:	f8d9 2098 	ldr.w	r2, [r9, #152]	; 0x98
    1584:	4986      	ldr	r1, [pc, #536]	; (17a0 <usb_isr+0x610>)
    1586:	0612      	lsls	r2, r2, #24
    1588:	f100 830a 	bmi.w	1ba0 <usb_isr+0xa10>
    158c:	4885      	ldr	r0, [pc, #532]	; (17a4 <usb_isr+0x614>)
    158e:	4a86      	ldr	r2, [pc, #536]	; (17a8 <usb_isr+0x618>)
    1590:	4986      	ldr	r1, [pc, #536]	; (17ac <usb_isr+0x61c>)
    1592:	9001      	str	r0, [sp, #4]
    1594:	4886      	ldr	r0, [pc, #536]	; (17b0 <usb_isr+0x620>)
    1596:	4c87      	ldr	r4, [pc, #540]	; (17b4 <usb_isr+0x624>)
    1598:	4d87      	ldr	r5, [pc, #540]	; (17b8 <usb_isr+0x628>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    159a:	9402      	str	r4, [sp, #8]
{
    159c:	2300      	movs	r3, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    159e:	9704      	str	r7, [sp, #16]
    15a0:	9605      	str	r6, [sp, #20]
    15a2:	4680      	mov	r8, r0
    15a4:	461c      	mov	r4, r3
    15a6:	460f      	mov	r7, r1
    15a8:	4616      	mov	r6, r2
    15aa:	9503      	str	r5, [sp, #12]
			p = rx_first[i];
    15ac:	6830      	ldr	r0, [r6, #0]
			while (p) {
    15ae:	b128      	cbz	r0, 15bc <usb_isr+0x42c>
				n = p->next;
    15b0:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    15b2:	f000 fbe9 	bl	1d88 <usb_free>
			while (p) {
    15b6:	4628      	mov	r0, r5
    15b8:	2d00      	cmp	r5, #0
    15ba:	d1f9      	bne.n	15b0 <usb_isr+0x420>
			rx_first[i] = NULL;
    15bc:	2300      	movs	r3, #0
    15be:	6033      	str	r3, [r6, #0]
			rx_last[i] = NULL;
    15c0:	9b03      	ldr	r3, [sp, #12]
			p = tx_first[i];
    15c2:	6838      	ldr	r0, [r7, #0]
			rx_last[i] = NULL;
    15c4:	461a      	mov	r2, r3
    15c6:	2300      	movs	r3, #0
    15c8:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
			while (p) {
    15cc:	b128      	cbz	r0, 15da <usb_isr+0x44a>
				n = p->next;
    15ce:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    15d0:	f000 fbda 	bl	1d88 <usb_free>
			while (p) {
    15d4:	4628      	mov	r0, r5
    15d6:	2d00      	cmp	r5, #0
    15d8:	d1f9      	bne.n	15ce <usb_isr+0x43e>
			tx_first[i] = NULL;
    15da:	2200      	movs	r2, #0
    15dc:	603a      	str	r2, [r7, #0]
			tx_last[i] = NULL;
    15de:	9a01      	ldr	r2, [sp, #4]
			switch (tx_state[i]) {
    15e0:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    15e4:	4611      	mov	r1, r2
    15e6:	2200      	movs	r2, #0
    15e8:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    15ec:	9a02      	ldr	r2, [sp, #8]
			tx_last[i] = NULL;
    15ee:	9101      	str	r1, [sp, #4]
			switch (tx_state[i]) {
    15f0:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    15f2:	f04f 0100 	mov.w	r1, #0
    15f6:	f822 1014 	strh.w	r1, [r2, r4, lsl #1]
			switch (tx_state[i]) {
    15fa:	2b03      	cmp	r3, #3
    15fc:	f200 812b 	bhi.w	1856 <usb_isr+0x6c6>
    1600:	e8df f013 	tbh	[pc, r3, lsl #1]
    1604:	01250170 	.word	0x01250170
    1608:	01250170 	.word	0x01250170
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    160c:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1610:	bf18      	it	ne
    1612:	2200      	movne	r2, #0
    1614:	e6b5      	b.n	1382 <usb_isr+0x1f2>
				*dst++ = *buf++;
    1616:	4a69      	ldr	r2, [pc, #420]	; (17bc <usb_isr+0x62c>)
    1618:	780d      	ldrb	r5, [r1, #0]
    161a:	7848      	ldrb	r0, [r1, #1]
    161c:	7015      	strb	r5, [r2, #0]
    161e:	7050      	strb	r0, [r2, #1]
    1620:	788d      	ldrb	r5, [r1, #2]
    1622:	78c8      	ldrb	r0, [r1, #3]
    1624:	7095      	strb	r5, [r2, #2]
    1626:	70d0      	strb	r0, [r2, #3]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1628:	6810      	ldr	r0, [r2, #0]
				*dst++ = *buf++;
    162a:	790d      	ldrb	r5, [r1, #4]
    162c:	7115      	strb	r5, [r2, #4]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    162e:	2886      	cmp	r0, #134	; 0x86
				*dst++ = *buf++;
    1630:	794d      	ldrb	r5, [r1, #5]
    1632:	7989      	ldrb	r1, [r1, #6]
    1634:	7155      	strb	r5, [r2, #5]
    1636:	7191      	strb	r1, [r2, #6]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1638:	f000 819b 	beq.w	1972 <usb_isr+0x7e2>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    163c:	4960      	ldr	r1, [pc, #384]	; (17c0 <usb_isr+0x630>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    163e:	4e61      	ldr	r6, [pc, #388]	; (17c4 <usb_isr+0x634>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1640:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1642:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1644:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1648:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    164a:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    164e:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1650:	bf0c      	ite	eq
    1652:	2188      	moveq	r1, #136	; 0x88
    1654:	21c8      	movne	r1, #200	; 0xc8
    1656:	f849 1032 	str.w	r1, [r9, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    165a:	eb09 02c2 	add.w	r2, r9, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    165e:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1662:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    1664:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1666:	6051      	str	r1, [r2, #4]
    1668:	e69e      	b.n	13a8 <usb_isr+0x218>
	switch (setup.wRequestAndType) {
    166a:	f242 2021 	movw	r0, #8737	; 0x2221
    166e:	4281      	cmp	r1, r0
    1670:	f040 81cb 	bne.w	1a0a <usb_isr+0x87a>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    1674:	4b54      	ldr	r3, [pc, #336]	; (17c8 <usb_isr+0x638>)
    1676:	4c55      	ldr	r4, [pc, #340]	; (17cc <usb_isr+0x63c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    1678:	4955      	ldr	r1, [pc, #340]	; (17d0 <usb_isr+0x640>)
    167a:	78a8      	ldrb	r0, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    167c:	681d      	ldr	r5, [r3, #0]
    167e:	6025      	str	r5, [r4, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    1680:	f8cd e004 	str.w	lr, [sp, #4]
    1684:	7008      	strb	r0, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1686:	2000      	movs	r0, #0
    1688:	9002      	str	r0, [sp, #8]
    168a:	4680      	mov	r8, r0
    168c:	4684      	mov	ip, r0
    168e:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1690:	494b      	ldr	r1, [pc, #300]	; (17c0 <usb_isr+0x630>)
    1692:	780d      	ldrb	r5, [r1, #0]
    1694:	f045 0e02 	orr.w	lr, r5, #2
    1698:	eb09 03ce 	add.w	r3, r9, lr, lsl #3
    169c:	9303      	str	r3, [sp, #12]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    169e:	9b01      	ldr	r3, [sp, #4]
    16a0:	2b00      	cmp	r3, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    16a2:	9b03      	ldr	r3, [sp, #12]
    16a4:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    16a6:	bf0c      	ite	eq
    16a8:	2488      	moveq	r4, #136	; 0x88
    16aa:	24c8      	movne	r4, #200	; 0xc8
    16ac:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    16b0:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    16b4:	f849 303e 	str.w	r3, [r9, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    16b8:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    16ba:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    16bc:	f8df e0e0 	ldr.w	lr, [pc, #224]	; 17a0 <usb_isr+0x610>
	ep0_tx_data_toggle ^= 1;
    16c0:	4b40      	ldr	r3, [pc, #256]	; (17c4 <usb_isr+0x634>)
	ep0_tx_bdt_bank ^= 1;
    16c2:	f8df 80fc 	ldr.w	r8, [pc, #252]	; 17c0 <usb_isr+0x630>
	if (datalen == 0 && size < EP0_SIZE) return;
    16c6:	2800      	cmp	r0, #0
    16c8:	f040 811e 	bne.w	1908 <usb_isr+0x778>
    16cc:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    16d0:	d11b      	bne.n	170a <usb_isr+0x57a>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    16d2:	f044 0c02 	orr.w	ip, r4, #2
    16d6:	eb09 03cc 	add.w	r3, r9, ip, lsl #3
    16da:	9c02      	ldr	r4, [sp, #8]
    16dc:	f8df e0c0 	ldr.w	lr, [pc, #192]	; 17a0 <usb_isr+0x610>
    16e0:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    16e2:	2a00      	cmp	r2, #0
    16e4:	f040 8126 	bne.w	1934 <usb_isr+0x7a4>
    16e8:	0402      	lsls	r2, r0, #16
    16ea:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	ep0_tx_data_toggle ^= 1;
    16ee:	f89d 3004 	ldrb.w	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    16f2:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
	data += size;
    16f6:	4404      	add	r4, r0
	ep0_tx_data_toggle ^= 1;
    16f8:	7033      	strb	r3, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    16fa:	700d      	strb	r5, [r1, #0]
	data += size;
    16fc:	4623      	mov	r3, r4
	if (datalen == 0 && size < EP0_SIZE) return;
    16fe:	2840      	cmp	r0, #64	; 0x40
    1700:	d103      	bne.n	170a <usb_isr+0x57a>
    1702:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    1704:	4a33      	ldr	r2, [pc, #204]	; (17d4 <usb_isr+0x644>)
	ep0_tx_ptr = data;
    1706:	603b      	str	r3, [r7, #0]
	ep0_tx_len = datalen;
    1708:	8010      	strh	r0, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    170a:	4a33      	ldr	r2, [pc, #204]	; (17d8 <usb_isr+0x648>)
    170c:	2301      	movs	r3, #1
    170e:	7013      	strb	r3, [r2, #0]
    1710:	e64d      	b.n	13ae <usb_isr+0x21e>
				if (t == 0) usb_serial_flush_callback();
    1712:	f000 fcf5 	bl	2100 <usb_serial_flush_callback>
    1716:	e5a5      	b.n	1264 <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1718:	4b21      	ldr	r3, [pc, #132]	; (17a0 <usb_isr+0x610>)
		USB0_CTL = USB_CTL_ODDRST;
    171a:	482f      	ldr	r0, [pc, #188]	; (17d8 <usb_isr+0x648>)
		ep0_tx_bdt_bank = 0;
    171c:	4928      	ldr	r1, [pc, #160]	; (17c0 <usb_isr+0x630>)
		table[index(0, TX, EVEN)].desc = 0;
    171e:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    1720:	f04f 0e02 	mov.w	lr, #2
    1724:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1728:	4f2c      	ldr	r7, [pc, #176]	; (17dc <usb_isr+0x64c>)
		ep0_tx_bdt_bank = 0;
    172a:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    172c:	492c      	ldr	r1, [pc, #176]	; (17e0 <usb_isr+0x650>)
    172e:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    1730:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    1732:	4e2c      	ldr	r6, [pc, #176]	; (17e4 <usb_isr+0x654>)
		USB0_ISTAT = 0xFF;
    1734:	4d2c      	ldr	r5, [pc, #176]	; (17e8 <usb_isr+0x658>)
		USB0_ADDR = 0;
    1736:	4c2d      	ldr	r4, [pc, #180]	; (17ec <usb_isr+0x65c>)
		table[index(0, TX, ODD)].desc = 0;
    1738:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    173a:	210d      	movs	r1, #13
    173c:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    173e:	21ff      	movs	r1, #255	; 0xff
    1740:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    1742:	f8df e0b8 	ldr.w	lr, [pc, #184]	; 17fc <usb_isr+0x66c>
		USB0_ISTAT = 0xFF;
    1746:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    1748:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    174a:	4d29      	ldr	r5, [pc, #164]	; (17f0 <usb_isr+0x660>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    174c:	4a29      	ldr	r2, [pc, #164]	; (17f4 <usb_isr+0x664>)
		USB0_ERREN = 0xFF;
    174e:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1752:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    1754:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1756:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    175a:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    175c:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    175e:	60da      	str	r2, [r3, #12]
}
    1760:	b007      	add	sp, #28
    1762:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    1766:	4a24      	ldr	r2, [pc, #144]	; (17f8 <usb_isr+0x668>)
						b->desc = 0;
    1768:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    176c:	7813      	ldrb	r3, [r2, #0]
    176e:	3301      	adds	r3, #1
    1770:	7013      	strb	r3, [r2, #0]
    1772:	e557      	b.n	1224 <usb_isr+0x94>
						rx_first[endpoint] = packet;
    1774:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    1778:	4d0f      	ldr	r5, [pc, #60]	; (17b8 <usb_isr+0x628>)
    177a:	e53a      	b.n	11f2 <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    177c:	5d8b      	ldrb	r3, [r1, r6]
    177e:	2b03      	cmp	r3, #3
    1780:	f200 80f0 	bhi.w	1964 <usb_isr+0x7d4>
    1784:	a201      	add	r2, pc, #4	; (adr r2, 178c <usb_isr+0x5fc>)
    1786:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    178a:	bf00      	nop
    178c:	00001225 	.word	0x00001225
    1790:	00001225 	.word	0x00001225
    1794:	00001849 	.word	0x00001849
    1798:	00001843 	.word	0x00001843
    179c:	1fff95fc 	.word	0x1fff95fc
    17a0:	1fff8000 	.word	0x1fff8000
    17a4:	1fff95d8 	.word	0x1fff95d8
    17a8:	1fff9574 	.word	0x1fff9574
    17ac:	1fff95c8 	.word	0x1fff95c8
    17b0:	1fff9600 	.word	0x1fff9600
    17b4:	1fff97f8 	.word	0x1fff97f8
    17b8:	1fff9520 	.word	0x1fff9520
    17bc:	1fff9800 	.word	0x1fff9800
    17c0:	1fff95f0 	.word	0x1fff95f0
    17c4:	1fff9584 	.word	0x1fff9584
    17c8:	1fff9518 	.word	0x1fff9518
    17cc:	1fff9808 	.word	0x1fff9808
    17d0:	1fff9614 	.word	0x1fff9614
    17d4:	1fff9530 	.word	0x1fff9530
    17d8:	40072094 	.word	0x40072094
    17dc:	400720c0 	.word	0x400720c0
    17e0:	00400088 	.word	0x00400088
    17e4:	40072088 	.word	0x40072088
    17e8:	40072080 	.word	0x40072080
    17ec:	40072098 	.word	0x40072098
    17f0:	1fff9534 	.word	0x1fff9534
    17f4:	1fff9588 	.word	0x1fff9588
    17f8:	1fff95f1 	.word	0x1fff95f1
    17fc:	4007208c 	.word	0x4007208c
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1800:	49bd      	ldr	r1, [pc, #756]	; (1af8 <usb_isr+0x968>)
		USB0_ISTAT = USB_ISTAT_STALL;
    1802:	4bbe      	ldr	r3, [pc, #760]	; (1afc <usb_isr+0x96c>)
    1804:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1806:	200d      	movs	r0, #13
    1808:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    180a:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    180c:	07a2      	lsls	r2, r4, #30
    180e:	f57f ae0e 	bpl.w	142e <usb_isr+0x29e>
    1812:	e605      	b.n	1420 <usb_isr+0x290>
	switch (setup.wRequestAndType) {
    1814:	f240 3202 	movw	r2, #770	; 0x302
    1818:	4291      	cmp	r1, r2
    181a:	f040 80ee 	bne.w	19fa <usb_isr+0x86a>
    181e:	88a9      	ldrh	r1, [r5, #4]
    1820:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1824:	2904      	cmp	r1, #4
    1826:	d868      	bhi.n	18fa <usb_isr+0x76a>
    1828:	886a      	ldrh	r2, [r5, #2]
    182a:	2a00      	cmp	r2, #0
    182c:	d165      	bne.n	18fa <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    182e:	48b2      	ldr	r0, [pc, #712]	; (1af8 <usb_isr+0x968>)
    1830:	f8cd e004 	str.w	lr, [sp, #4]
    1834:	0089      	lsls	r1, r1, #2
    1836:	4408      	add	r0, r1
    1838:	7801      	ldrb	r1, [r0, #0]
    183a:	f041 0102 	orr.w	r1, r1, #2
    183e:	7001      	strb	r1, [r0, #0]
    1840:	e721      	b.n	1686 <usb_isr+0x4f6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1842:	2301      	movs	r3, #1
    1844:	558b      	strb	r3, [r1, r6]
						break;
    1846:	e4ed      	b.n	1224 <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1848:	2300      	movs	r3, #0
    184a:	558b      	strb	r3, [r1, r6]
						break;
    184c:	e4ea      	b.n	1224 <usb_isr+0x94>
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    184e:	f04f 0301 	mov.w	r3, #1
    1852:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    1856:	3401      	adds	r4, #1
    1858:	2c04      	cmp	r4, #4
    185a:	f106 0604 	add.w	r6, r6, #4
    185e:	f107 0704 	add.w	r7, r7, #4
    1862:	f108 0801 	add.w	r8, r8, #1
    1866:	f47f aea1 	bne.w	15ac <usb_isr+0x41c>
			epconf = *cfg++;
    186a:	4ca5      	ldr	r4, [pc, #660]	; (1b00 <usb_isr+0x970>)
			*reg = epconf;
    186c:	4ba5      	ldr	r3, [pc, #660]	; (1b04 <usb_isr+0x974>)
			epconf = *cfg++;
    186e:	7822      	ldrb	r2, [r4, #0]
		usb_rx_memory_needed = 0;
    1870:	4da5      	ldr	r5, [pc, #660]	; (1b08 <usb_isr+0x978>)
    1872:	9f04      	ldr	r7, [sp, #16]
    1874:	9e05      	ldr	r6, [sp, #20]
    1876:	2100      	movs	r1, #0
    1878:	7029      	strb	r1, [r5, #0]
			*reg = epconf;
    187a:	701a      	strb	r2, [r3, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    187c:	0713      	lsls	r3, r2, #28
    187e:	f100 8105 	bmi.w	1a8c <usb_isr+0x8fc>
			epconf = *cfg++;
    1882:	7862      	ldrb	r2, [r4, #1]
			*reg = epconf;
    1884:	49a1      	ldr	r1, [pc, #644]	; (1b0c <usb_isr+0x97c>)
			table[index(i, TX, EVEN)].desc = 0;
    1886:	f8df 8290 	ldr.w	r8, [pc, #656]	; 1b18 <usb_isr+0x988>
			*reg = epconf;
    188a:	700a      	strb	r2, [r1, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    188c:	0710      	lsls	r0, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    188e:	f04f 0100 	mov.w	r1, #0
    1892:	f8c9 1030 	str.w	r1, [r9, #48]	; 0x30
			table[index(i, TX, ODD)].desc = 0;
    1896:	f8c9 1038 	str.w	r1, [r9, #56]	; 0x38
			if (epconf & USB_ENDPT_EPRXEN) {
    189a:	f100 80e1 	bmi.w	1a60 <usb_isr+0x8d0>
			*reg = epconf;
    189e:	499c      	ldr	r1, [pc, #624]	; (1b10 <usb_isr+0x980>)
			epconf = *cfg++;
    18a0:	78a2      	ldrb	r2, [r4, #2]
			*reg = epconf;
    18a2:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    18a4:	2100      	movs	r1, #0
    18a6:	f8c9 1050 	str.w	r1, [r9, #80]	; 0x50
			table[index(i, TX, ODD)].desc = 0;
    18aa:	f8c9 1058 	str.w	r1, [r9, #88]	; 0x58
			if (epconf & USB_ENDPT_EPRXEN) {
    18ae:	0711      	lsls	r1, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    18b0:	f8df 8264 	ldr.w	r8, [pc, #612]	; 1b18 <usb_isr+0x988>
			if (epconf & USB_ENDPT_EPRXEN) {
    18b4:	f100 8100 	bmi.w	1ab8 <usb_isr+0x928>
			epconf = *cfg++;
    18b8:	78e2      	ldrb	r2, [r4, #3]
			*reg = epconf;
    18ba:	4996      	ldr	r1, [pc, #600]	; (1b14 <usb_isr+0x984>)
			table[index(i, TX, EVEN)].desc = 0;
    18bc:	4c96      	ldr	r4, [pc, #600]	; (1b18 <usb_isr+0x988>)
			*reg = epconf;
    18be:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    18c0:	2100      	movs	r1, #0
			if (epconf & USB_ENDPT_EPRXEN) {
    18c2:	0712      	lsls	r2, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    18c4:	f8c9 1070 	str.w	r1, [r9, #112]	; 0x70
			table[index(i, TX, ODD)].desc = 0;
    18c8:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
			if (epconf & USB_ENDPT_EPRXEN) {
    18cc:	f100 80b0 	bmi.w	1a30 <usb_isr+0x8a0>
    18d0:	7833      	ldrb	r3, [r6, #0]
    18d2:	9301      	str	r3, [sp, #4]
			table[index(i, TX, EVEN)].desc = 0;
    18d4:	2100      	movs	r1, #0
    18d6:	f083 0201 	eor.w	r2, r3, #1
    18da:	f8c9 1090 	str.w	r1, [r9, #144]	; 0x90
			table[index(i, TX, ODD)].desc = 0;
    18de:	f8c9 1098 	str.w	r1, [r9, #152]	; 0x98
    18e2:	e6d0      	b.n	1686 <usb_isr+0x4f6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    18e4:	f04f 0300 	mov.w	r3, #0
    18e8:	f888 3000 	strb.w	r3, [r8]
    18ec:	e7b3      	b.n	1856 <usb_isr+0x6c6>
    18ee:	88a9      	ldrh	r1, [r5, #4]
    18f0:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    18f4:	2904      	cmp	r1, #4
    18f6:	f240 808d 	bls.w	1a14 <usb_isr+0x884>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    18fa:	4a7f      	ldr	r2, [pc, #508]	; (1af8 <usb_isr+0x968>)
    18fc:	230f      	movs	r3, #15
    18fe:	7013      	strb	r3, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1900:	4a86      	ldr	r2, [pc, #536]	; (1b1c <usb_isr+0x98c>)
    1902:	2301      	movs	r3, #1
    1904:	7013      	strb	r3, [r2, #0]
    1906:	e552      	b.n	13ae <usb_isr+0x21e>
	if (size > EP0_SIZE) size = EP0_SIZE;
    1908:	2840      	cmp	r0, #64	; 0x40
    190a:	f67f aee2 	bls.w	16d2 <usb_isr+0x542>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    190e:	f044 0402 	orr.w	r4, r4, #2
    1912:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    1916:	9e02      	ldr	r6, [sp, #8]
    1918:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    191a:	b1ba      	cbz	r2, 194c <usb_isr+0x7bc>
	ep0_tx_data_toggle ^= 1;
    191c:	f89d 1004 	ldrb.w	r1, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1920:	4a7f      	ldr	r2, [pc, #508]	; (1b20 <usb_isr+0x990>)
	ep0_tx_data_toggle ^= 1;
    1922:	7019      	strb	r1, [r3, #0]
	data += size;
    1924:	4633      	mov	r3, r6
    1926:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    1928:	f888 5000 	strb.w	r5, [r8]
	data += size;
    192c:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    192e:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1932:	e6e7      	b.n	1704 <usb_isr+0x574>
	ep0_tx_data_toggle ^= 1;
    1934:	f89d 3004 	ldrb.w	r3, [sp, #4]
    1938:	7033      	strb	r3, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    193a:	0402      	lsls	r2, r0, #16
	data += size;
    193c:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_bdt_bank ^= 1;
    193e:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1940:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	data += size;
    1944:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1946:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
    194a:	e6d8      	b.n	16fe <usb_isr+0x56e>
	ep0_tx_data_toggle ^= 1;
    194c:	f89d 1004 	ldrb.w	r1, [sp, #4]
    1950:	7019      	strb	r1, [r3, #0]
	data += size;
    1952:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1954:	4a73      	ldr	r2, [pc, #460]	; (1b24 <usb_isr+0x994>)
	ep0_tx_bdt_bank ^= 1;
    1956:	f888 5000 	strb.w	r5, [r8]
    195a:	3840      	subs	r0, #64	; 0x40
	data += size;
    195c:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    195e:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1962:	e6cf      	b.n	1704 <usb_isr+0x574>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    1964:	f019 0f08 	tst.w	r9, #8
    1968:	bf0c      	ite	eq
    196a:	2302      	moveq	r3, #2
    196c:	2303      	movne	r3, #3
    196e:	558b      	strb	r3, [r1, r6]
						break;
    1970:	e458      	b.n	1224 <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1972:	4a6d      	ldr	r2, [pc, #436]	; (1b28 <usb_isr+0x998>)
    1974:	210f      	movs	r1, #15
    1976:	7011      	strb	r1, [r2, #0]
    1978:	e660      	b.n	163c <usb_isr+0x4ac>
			if (list->addr == NULL) break;
    197a:	4a6c      	ldr	r2, [pc, #432]	; (1b2c <usb_isr+0x99c>)
    197c:	6854      	ldr	r4, [r2, #4]
    197e:	2c00      	cmp	r4, #0
    1980:	d0bb      	beq.n	18fa <usb_isr+0x76a>
    1982:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    1984:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    1988:	e003      	b.n	1992 <usb_isr+0x802>
		for (list = usb_descriptor_list; 1; list++) {
    198a:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    198c:	6854      	ldr	r4, [r2, #4]
    198e:	2c00      	cmp	r4, #0
    1990:	d0b3      	beq.n	18fa <usb_isr+0x76a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    1992:	8813      	ldrh	r3, [r2, #0]
    1994:	4283      	cmp	r3, r0
    1996:	d1f8      	bne.n	198a <usb_isr+0x7fa>
    1998:	8853      	ldrh	r3, [r2, #2]
    199a:	4573      	cmp	r3, lr
    199c:	d1f5      	bne.n	198a <usb_isr+0x7fa>
				if ((setup.wValue >> 8) == 3) {
    199e:	0a00      	lsrs	r0, r0, #8
    19a0:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    19a2:	bf0c      	ite	eq
    19a4:	f894 e000 	ldrbeq.w	lr, [r4]
					datalen = list->length;
    19a8:	f8b2 e008 	ldrhne.w	lr, [r2, #8]
    19ac:	e003      	b.n	19b6 <usb_isr+0x826>
		reply_buffer[0] = usb_configuration;
    19ae:	4a60      	ldr	r2, [pc, #384]	; (1b30 <usb_isr+0x9a0>)
    19b0:	4c60      	ldr	r4, [pc, #384]	; (1b34 <usb_isr+0x9a4>)
    19b2:	7812      	ldrb	r2, [r2, #0]
    19b4:	7022      	strb	r2, [r4, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    19b6:	88e8      	ldrh	r0, [r5, #6]
    19b8:	4570      	cmp	r0, lr
    19ba:	f080 8131 	bcs.w	1c20 <usb_isr+0xa90>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    19be:	495e      	ldr	r1, [pc, #376]	; (1b38 <usb_isr+0x9a8>)
    19c0:	780d      	ldrb	r5, [r1, #0]
    19c2:	2840      	cmp	r0, #64	; 0x40
    19c4:	4684      	mov	ip, r0
    19c6:	f045 0e02 	orr.w	lr, r5, #2
    19ca:	bf28      	it	cs
    19cc:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    19d0:	eb04 030c 	add.w	r3, r4, ip
    19d4:	eb09 02ce 	add.w	r2, r9, lr, lsl #3
    19d8:	9302      	str	r3, [sp, #8]
    19da:	2301      	movs	r3, #1
    19dc:	6054      	str	r4, [r2, #4]
    19de:	ebcc 0000 	rsb	r0, ip, r0
    19e2:	ea4f 480c 	mov.w	r8, ip, lsl #16
    19e6:	2200      	movs	r2, #0
    19e8:	9301      	str	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    19ea:	24c8      	movs	r4, #200	; 0xc8
    19ec:	e65e      	b.n	16ac <usb_isr+0x51c>
		reply_buffer[0] = 0;
    19ee:	4c51      	ldr	r4, [pc, #324]	; (1b34 <usb_isr+0x9a4>)
		datalen = 2;
    19f0:	f04f 0e02 	mov.w	lr, #2
		reply_buffer[0] = 0;
    19f4:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    19f6:	7062      	strb	r2, [r4, #1]
    19f8:	e7dd      	b.n	19b6 <usb_isr+0x826>
	switch (setup.wRequestAndType) {
    19fa:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    19fe:	f47f af7c 	bne.w	18fa <usb_isr+0x76a>
    1a02:	2301      	movs	r3, #1
    1a04:	2200      	movs	r2, #0
    1a06:	9301      	str	r3, [sp, #4]
    1a08:	e63d      	b.n	1686 <usb_isr+0x4f6>
    1a0a:	f242 3221 	movw	r2, #8993	; 0x2321
    1a0e:	4291      	cmp	r1, r2
    1a10:	d0f7      	beq.n	1a02 <usb_isr+0x872>
    1a12:	e772      	b.n	18fa <usb_isr+0x76a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1a14:	886a      	ldrh	r2, [r5, #2]
    1a16:	2a00      	cmp	r2, #0
    1a18:	f47f af6f 	bne.w	18fa <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    1a1c:	4836      	ldr	r0, [pc, #216]	; (1af8 <usb_isr+0x968>)
    1a1e:	f8cd e004 	str.w	lr, [sp, #4]
    1a22:	0089      	lsls	r1, r1, #2
    1a24:	4408      	add	r0, r1
    1a26:	7801      	ldrb	r1, [r0, #0]
    1a28:	f021 0102 	bic.w	r1, r1, #2
    1a2c:	7001      	strb	r1, [r0, #0]
    1a2e:	e62a      	b.n	1686 <usb_isr+0x4f6>
				p = usb_malloc();
    1a30:	f000 f98a 	bl	1d48 <usb_malloc>
				if (p) {
    1a34:	2800      	cmp	r0, #0
    1a36:	f000 80e6 	beq.w	1c06 <usb_isr+0xa76>
					table[index(i, RX, EVEN)].addr = p->buf;
    1a3a:	3008      	adds	r0, #8
    1a3c:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1a40:	4838      	ldr	r0, [pc, #224]	; (1b24 <usb_isr+0x994>)
    1a42:	f8c9 0080 	str.w	r0, [r9, #128]	; 0x80
				p = usb_malloc();
    1a46:	f000 f97f 	bl	1d48 <usb_malloc>
    1a4a:	4a33      	ldr	r2, [pc, #204]	; (1b18 <usb_isr+0x988>)
				if (p) {
    1a4c:	2800      	cmp	r0, #0
    1a4e:	f000 80d4 	beq.w	1bfa <usb_isr+0xa6a>
					table[index(i, RX, ODD)].addr = p->buf;
    1a52:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1a54:	4932      	ldr	r1, [pc, #200]	; (1b20 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1a56:	f8c2 008c 	str.w	r0, [r2, #140]	; 0x8c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1a5a:	f8c2 1088 	str.w	r1, [r2, #136]	; 0x88
    1a5e:	e737      	b.n	18d0 <usb_isr+0x740>
				p = usb_malloc();
    1a60:	f000 f972 	bl	1d48 <usb_malloc>
				if (p) {
    1a64:	2800      	cmp	r0, #0
    1a66:	f000 80bb 	beq.w	1be0 <usb_isr+0xa50>
					table[index(i, RX, EVEN)].addr = p->buf;
    1a6a:	3008      	adds	r0, #8
    1a6c:	f8c8 0044 	str.w	r0, [r8, #68]	; 0x44
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1a70:	482c      	ldr	r0, [pc, #176]	; (1b24 <usb_isr+0x994>)
    1a72:	f8c9 0040 	str.w	r0, [r9, #64]	; 0x40
				p = usb_malloc();
    1a76:	f000 f967 	bl	1d48 <usb_malloc>
    1a7a:	4a27      	ldr	r2, [pc, #156]	; (1b18 <usb_isr+0x988>)
				if (p) {
    1a7c:	2800      	cmp	r0, #0
    1a7e:	f000 80aa 	beq.w	1bd6 <usb_isr+0xa46>
					table[index(i, RX, ODD)].addr = p->buf;
    1a82:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1a84:	4926      	ldr	r1, [pc, #152]	; (1b20 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1a86:	64d0      	str	r0, [r2, #76]	; 0x4c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1a88:	6491      	str	r1, [r2, #72]	; 0x48
    1a8a:	e708      	b.n	189e <usb_isr+0x70e>
				p = usb_malloc();
    1a8c:	f000 f95c 	bl	1d48 <usb_malloc>
				if (p) {
    1a90:	2800      	cmp	r0, #0
    1a92:	f000 80c1 	beq.w	1c18 <usb_isr+0xa88>
					table[index(i, RX, EVEN)].addr = p->buf;
    1a96:	3008      	adds	r0, #8
    1a98:	f8c9 0024 	str.w	r0, [r9, #36]	; 0x24
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1a9c:	4821      	ldr	r0, [pc, #132]	; (1b24 <usb_isr+0x994>)
    1a9e:	f8c9 0020 	str.w	r0, [r9, #32]
				p = usb_malloc();
    1aa2:	f000 f951 	bl	1d48 <usb_malloc>
    1aa6:	4a1c      	ldr	r2, [pc, #112]	; (1b18 <usb_isr+0x988>)
				if (p) {
    1aa8:	2800      	cmp	r0, #0
    1aaa:	f000 80b0 	beq.w	1c0e <usb_isr+0xa7e>
					table[index(i, RX, ODD)].addr = p->buf;
    1aae:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1ab0:	491b      	ldr	r1, [pc, #108]	; (1b20 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1ab2:	62d0      	str	r0, [r2, #44]	; 0x2c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1ab4:	6291      	str	r1, [r2, #40]	; 0x28
    1ab6:	e6e4      	b.n	1882 <usb_isr+0x6f2>
				p = usb_malloc();
    1ab8:	f000 f946 	bl	1d48 <usb_malloc>
				if (p) {
    1abc:	2800      	cmp	r0, #0
    1abe:	f000 8098 	beq.w	1bf2 <usb_isr+0xa62>
					table[index(i, RX, EVEN)].addr = p->buf;
    1ac2:	3008      	adds	r0, #8
    1ac4:	f8c8 0064 	str.w	r0, [r8, #100]	; 0x64
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1ac8:	4816      	ldr	r0, [pc, #88]	; (1b24 <usb_isr+0x994>)
    1aca:	f8c9 0060 	str.w	r0, [r9, #96]	; 0x60
				p = usb_malloc();
    1ace:	f000 f93b 	bl	1d48 <usb_malloc>
    1ad2:	4a11      	ldr	r2, [pc, #68]	; (1b18 <usb_isr+0x988>)
				if (p) {
    1ad4:	2800      	cmp	r0, #0
    1ad6:	f000 8087 	beq.w	1be8 <usb_isr+0xa58>
					table[index(i, RX, ODD)].addr = p->buf;
    1ada:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1adc:	4910      	ldr	r1, [pc, #64]	; (1b20 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1ade:	66d0      	str	r0, [r2, #108]	; 0x6c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1ae0:	6691      	str	r1, [r2, #104]	; 0x68
    1ae2:	e6e9      	b.n	18b8 <usb_isr+0x728>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    1ae4:	6bc8      	ldr	r0, [r1, #60]	; 0x3c
    1ae6:	3808      	subs	r0, #8
    1ae8:	f000 f94e 	bl	1d88 <usb_free>
    1aec:	e506      	b.n	14fc <usb_isr+0x36c>
    1aee:	6b48      	ldr	r0, [r1, #52]	; 0x34
    1af0:	3808      	subs	r0, #8
    1af2:	f000 f949 	bl	1d88 <usb_free>
    1af6:	e4fb      	b.n	14f0 <usb_isr+0x360>
    1af8:	400720c0 	.word	0x400720c0
    1afc:	40072080 	.word	0x40072080
    1b00:	00003988 	.word	0x00003988
    1b04:	400720c4 	.word	0x400720c4
    1b08:	1fff95f1 	.word	0x1fff95f1
    1b0c:	400720c8 	.word	0x400720c8
    1b10:	400720cc 	.word	0x400720cc
    1b14:	400720d0 	.word	0x400720d0
    1b18:	1fff8000 	.word	0x1fff8000
    1b1c:	40072094 	.word	0x40072094
    1b20:	004000c8 	.word	0x004000c8
    1b24:	00400088 	.word	0x00400088
    1b28:	1fff9585 	.word	0x1fff9585
    1b2c:	0000398c 	.word	0x0000398c
    1b30:	1fff95fc 	.word	0x1fff95fc
    1b34:	1fff95f4 	.word	0x1fff95f4
    1b38:	1fff95f0 	.word	0x1fff95f0
    1b3c:	6ac8      	ldr	r0, [r1, #44]	; 0x2c
    1b3e:	3808      	subs	r0, #8
    1b40:	f000 f922 	bl	1d88 <usb_free>
    1b44:	e4ce      	b.n	14e4 <usb_isr+0x354>
    1b46:	6a60      	ldr	r0, [r4, #36]	; 0x24
    1b48:	3808      	subs	r0, #8
    1b4a:	f000 f91d 	bl	1d88 <usb_free>
    1b4e:	e4c3      	b.n	14d8 <usb_isr+0x348>
    1b50:	6fc8      	ldr	r0, [r1, #124]	; 0x7c
    1b52:	3808      	subs	r0, #8
    1b54:	f000 f918 	bl	1d88 <usb_free>
    1b58:	e500      	b.n	155c <usb_isr+0x3cc>
    1b5a:	6f48      	ldr	r0, [r1, #116]	; 0x74
    1b5c:	3808      	subs	r0, #8
    1b5e:	f000 f913 	bl	1d88 <usb_free>
    1b62:	e4f5      	b.n	1550 <usb_isr+0x3c0>
    1b64:	6ec8      	ldr	r0, [r1, #108]	; 0x6c
    1b66:	3808      	subs	r0, #8
    1b68:	f000 f90e 	bl	1d88 <usb_free>
    1b6c:	e4ea      	b.n	1544 <usb_isr+0x3b4>
    1b6e:	6e48      	ldr	r0, [r1, #100]	; 0x64
    1b70:	3808      	subs	r0, #8
    1b72:	f000 f909 	bl	1d88 <usb_free>
    1b76:	e4df      	b.n	1538 <usb_isr+0x3a8>
    1b78:	6dc8      	ldr	r0, [r1, #92]	; 0x5c
    1b7a:	3808      	subs	r0, #8
    1b7c:	f000 f904 	bl	1d88 <usb_free>
    1b80:	e4d4      	b.n	152c <usb_isr+0x39c>
    1b82:	6d48      	ldr	r0, [r1, #84]	; 0x54
    1b84:	3808      	subs	r0, #8
    1b86:	f000 f8ff 	bl	1d88 <usb_free>
    1b8a:	e4c9      	b.n	1520 <usb_isr+0x390>
    1b8c:	6cc8      	ldr	r0, [r1, #76]	; 0x4c
    1b8e:	3808      	subs	r0, #8
    1b90:	f000 f8fa 	bl	1d88 <usb_free>
    1b94:	e4be      	b.n	1514 <usb_isr+0x384>
    1b96:	6c48      	ldr	r0, [r1, #68]	; 0x44
    1b98:	3808      	subs	r0, #8
    1b9a:	f000 f8f5 	bl	1d88 <usb_free>
    1b9e:	e4b3      	b.n	1508 <usb_isr+0x378>
    1ba0:	f8d1 009c 	ldr.w	r0, [r1, #156]	; 0x9c
    1ba4:	3808      	subs	r0, #8
    1ba6:	f000 f8ef 	bl	1d88 <usb_free>
    1baa:	e4ef      	b.n	158c <usb_isr+0x3fc>
    1bac:	f8d1 0094 	ldr.w	r0, [r1, #148]	; 0x94
    1bb0:	3808      	subs	r0, #8
    1bb2:	f000 f8e9 	bl	1d88 <usb_free>
    1bb6:	e4e3      	b.n	1580 <usb_isr+0x3f0>
    1bb8:	f8d1 008c 	ldr.w	r0, [r1, #140]	; 0x8c
    1bbc:	3808      	subs	r0, #8
    1bbe:	f000 f8e3 	bl	1d88 <usb_free>
    1bc2:	e4d7      	b.n	1574 <usb_isr+0x3e4>
    1bc4:	f8d1 0084 	ldr.w	r0, [r1, #132]	; 0x84
    1bc8:	3808      	subs	r0, #8
    1bca:	f000 f8dd 	bl	1d88 <usb_free>
    1bce:	e4cb      	b.n	1568 <usb_isr+0x3d8>
		datalen = 2;
    1bd0:	f04f 0e02 	mov.w	lr, #2
    1bd4:	e6ef      	b.n	19b6 <usb_isr+0x826>
					usb_rx_memory_needed++;
    1bd6:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1bd8:	6490      	str	r0, [r2, #72]	; 0x48
					usb_rx_memory_needed++;
    1bda:	1c4a      	adds	r2, r1, #1
    1bdc:	702a      	strb	r2, [r5, #0]
    1bde:	e65e      	b.n	189e <usb_isr+0x70e>
					usb_rx_memory_needed++;
    1be0:	782a      	ldrb	r2, [r5, #0]
    1be2:	3201      	adds	r2, #1
    1be4:	702a      	strb	r2, [r5, #0]
    1be6:	e744      	b.n	1a72 <usb_isr+0x8e2>
					usb_rx_memory_needed++;
    1be8:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1bea:	6690      	str	r0, [r2, #104]	; 0x68
					usb_rx_memory_needed++;
    1bec:	1c4a      	adds	r2, r1, #1
    1bee:	702a      	strb	r2, [r5, #0]
    1bf0:	e662      	b.n	18b8 <usb_isr+0x728>
					usb_rx_memory_needed++;
    1bf2:	782a      	ldrb	r2, [r5, #0]
    1bf4:	3201      	adds	r2, #1
    1bf6:	702a      	strb	r2, [r5, #0]
    1bf8:	e767      	b.n	1aca <usb_isr+0x93a>
					usb_rx_memory_needed++;
    1bfa:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1bfc:	f8c2 0088 	str.w	r0, [r2, #136]	; 0x88
					usb_rx_memory_needed++;
    1c00:	1c4a      	adds	r2, r1, #1
    1c02:	702a      	strb	r2, [r5, #0]
    1c04:	e664      	b.n	18d0 <usb_isr+0x740>
					usb_rx_memory_needed++;
    1c06:	782a      	ldrb	r2, [r5, #0]
    1c08:	3201      	adds	r2, #1
    1c0a:	702a      	strb	r2, [r5, #0]
    1c0c:	e719      	b.n	1a42 <usb_isr+0x8b2>
					usb_rx_memory_needed++;
    1c0e:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1c10:	6290      	str	r0, [r2, #40]	; 0x28
					usb_rx_memory_needed++;
    1c12:	1c4a      	adds	r2, r1, #1
    1c14:	702a      	strb	r2, [r5, #0]
    1c16:	e634      	b.n	1882 <usb_isr+0x6f2>
					usb_rx_memory_needed++;
    1c18:	782a      	ldrb	r2, [r5, #0]
    1c1a:	3201      	adds	r2, #1
    1c1c:	702a      	strb	r2, [r5, #0]
    1c1e:	e73e      	b.n	1a9e <usb_isr+0x90e>
    1c20:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1c24:	46f4      	mov	ip, lr
    1c26:	bf28      	it	cs
    1c28:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    1c2c:	eb04 030c 	add.w	r3, r4, ip
    1c30:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1c32:	2301      	movs	r3, #1
    1c34:	ebcc 000e 	rsb	r0, ip, lr
    1c38:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1c3c:	2200      	movs	r2, #0
    1c3e:	9301      	str	r3, [sp, #4]
    1c40:	e526      	b.n	1690 <usb_isr+0x500>
    1c42:	bf00      	nop

00001c44 <usb_init>:



void usb_init(void)
{
    1c44:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    1c46:	f000 fe59 	bl	28fc <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    1c4a:	4b29      	ldr	r3, [pc, #164]	; (1cf0 <usb_init+0xac>)
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1c4c:	4829      	ldr	r0, [pc, #164]	; (1cf4 <usb_init+0xb0>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1c4e:	4c2a      	ldr	r4, [pc, #168]	; (1cf8 <usb_init+0xb4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1c50:	4f2a      	ldr	r7, [pc, #168]	; (1cfc <usb_init+0xb8>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1c52:	4d2b      	ldr	r5, [pc, #172]	; (1d00 <usb_init+0xbc>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
    1c54:	f8df c0bc 	ldr.w	ip, [pc, #188]	; 1d14 <usb_init+0xd0>
	USB0_ERRSTAT = 0xFF;
    1c58:	f8df e0bc 	ldr.w	lr, [pc, #188]	; 1d18 <usb_init+0xd4>
	USB0_OTGISTAT = 0xFF;

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    1c5c:	4e29      	ldr	r6, [pc, #164]	; (1d04 <usb_init+0xc0>)
		table[i].desc = 0;
    1c5e:	2200      	movs	r2, #0
    1c60:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    1c62:	605a      	str	r2, [r3, #4]
		table[i].desc = 0;
    1c64:	609a      	str	r2, [r3, #8]
		table[i].addr = 0;
    1c66:	60da      	str	r2, [r3, #12]
		table[i].desc = 0;
    1c68:	611a      	str	r2, [r3, #16]
		table[i].addr = 0;
    1c6a:	615a      	str	r2, [r3, #20]
		table[i].desc = 0;
    1c6c:	619a      	str	r2, [r3, #24]
		table[i].addr = 0;
    1c6e:	61da      	str	r2, [r3, #28]
		table[i].desc = 0;
    1c70:	621a      	str	r2, [r3, #32]
		table[i].addr = 0;
    1c72:	625a      	str	r2, [r3, #36]	; 0x24
		table[i].desc = 0;
    1c74:	629a      	str	r2, [r3, #40]	; 0x28
		table[i].addr = 0;
    1c76:	62da      	str	r2, [r3, #44]	; 0x2c
		table[i].desc = 0;
    1c78:	631a      	str	r2, [r3, #48]	; 0x30
		table[i].addr = 0;
    1c7a:	635a      	str	r2, [r3, #52]	; 0x34
		table[i].desc = 0;
    1c7c:	639a      	str	r2, [r3, #56]	; 0x38
		table[i].addr = 0;
    1c7e:	63da      	str	r2, [r3, #60]	; 0x3c
		table[i].desc = 0;
    1c80:	641a      	str	r2, [r3, #64]	; 0x40
		table[i].addr = 0;
    1c82:	645a      	str	r2, [r3, #68]	; 0x44
		table[i].desc = 0;
    1c84:	649a      	str	r2, [r3, #72]	; 0x48
		table[i].addr = 0;
    1c86:	64da      	str	r2, [r3, #76]	; 0x4c
		table[i].desc = 0;
    1c88:	651a      	str	r2, [r3, #80]	; 0x50
		table[i].addr = 0;
    1c8a:	655a      	str	r2, [r3, #84]	; 0x54
		table[i].desc = 0;
    1c8c:	659a      	str	r2, [r3, #88]	; 0x58
		table[i].addr = 0;
    1c8e:	65da      	str	r2, [r3, #92]	; 0x5c
		table[i].desc = 0;
    1c90:	661a      	str	r2, [r3, #96]	; 0x60
		table[i].addr = 0;
    1c92:	665a      	str	r2, [r3, #100]	; 0x64
		table[i].desc = 0;
    1c94:	669a      	str	r2, [r3, #104]	; 0x68
		table[i].addr = 0;
    1c96:	66da      	str	r2, [r3, #108]	; 0x6c
		table[i].desc = 0;
    1c98:	671a      	str	r2, [r3, #112]	; 0x70
		table[i].addr = 0;
    1c9a:	675a      	str	r2, [r3, #116]	; 0x74
		table[i].desc = 0;
    1c9c:	679a      	str	r2, [r3, #120]	; 0x78
		table[i].addr = 0;
    1c9e:	67da      	str	r2, [r3, #124]	; 0x7c
		table[i].desc = 0;
    1ca0:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1ca4:	6801      	ldr	r1, [r0, #0]
		table[i].addr = 0;
    1ca6:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1caa:	f441 2180 	orr.w	r1, r1, #262144	; 0x40000
    1cae:	6001      	str	r1, [r0, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1cb0:	f3c3 2107 	ubfx	r1, r3, #8, #8
    1cb4:	7021      	strb	r1, [r4, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1cb6:	f3c3 4007 	ubfx	r0, r3, #16, #8
	USB0_OTGISTAT = 0xFF;
    1cba:	4913      	ldr	r1, [pc, #76]	; (1d08 <usb_init+0xc4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1cbc:	7038      	strb	r0, [r7, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1cbe:	0e1b      	lsrs	r3, r3, #24
    1cc0:	702b      	strb	r3, [r5, #0]
	USB0_ISTAT = 0xFF;
    1cc2:	23ff      	movs	r3, #255	; 0xff
    1cc4:	f88c 3000 	strb.w	r3, [ip]

	// enable reset interrupt
	USB0_INTEN = USB_INTEN_USBRSTEN;

	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1cc8:	4d10      	ldr	r5, [pc, #64]	; (1d0c <usb_init+0xc8>)
	USB0_ERRSTAT = 0xFF;
    1cca:	f88e 3000 	strb.w	r3, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1cce:	4810      	ldr	r0, [pc, #64]	; (1d10 <usb_init+0xcc>)
	USB0_OTGISTAT = 0xFF;
    1cd0:	700b      	strb	r3, [r1, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    1cd2:	2301      	movs	r3, #1
    1cd4:	7033      	strb	r3, [r6, #0]
	USB0_USBCTRL = 0;
    1cd6:	f884 2064 	strb.w	r2, [r4, #100]	; 0x64
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1cda:	2670      	movs	r6, #112	; 0x70
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1cdc:	f44f 7400 	mov.w	r4, #512	; 0x200

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1ce0:	2210      	movs	r2, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    1ce2:	f807 3c2c 	strb.w	r3, [r7, #-44]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1ce6:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1ce8:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1cea:	f881 20f8 	strb.w	r2, [r1, #248]	; 0xf8
    1cee:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1cf0:	1fff8000 	.word	0x1fff8000
    1cf4:	40048034 	.word	0x40048034
    1cf8:	4007209c 	.word	0x4007209c
    1cfc:	400720b0 	.word	0x400720b0
    1d00:	400720b4 	.word	0x400720b4
    1d04:	40072094 	.word	0x40072094
    1d08:	40072010 	.word	0x40072010
    1d0c:	e000e449 	.word	0xe000e449
    1d10:	e000e108 	.word	0xe000e108
    1d14:	40072080 	.word	0x40072080
    1d18:	40072088 	.word	0x40072088

00001d1c <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    1d1c:	f000 b8a4 	b.w	1e68 <usb_serial_flush_input>

00001d20 <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    1d20:	f000 b87c 	b.w	1e1c <usb_serial_peekchar>

00001d24 <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    1d24:	f000 b856 	b.w	1dd4 <usb_serial_getchar>

00001d28 <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    1d28:	f000 b890 	b.w	1e4c <usb_serial_available>

00001d2c <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    1d2c:	f000 b9bc 	b.w	20a8 <usb_serial_flush_output>

00001d30 <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    1d30:	f000 b996 	b.w	2060 <usb_serial_write_buffer_free>

00001d34 <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    1d34:	4608      	mov	r0, r1
    1d36:	4611      	mov	r1, r2
    1d38:	f000 b8b2 	b.w	1ea0 <usb_serial_write>

00001d3c <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    1d3c:	4608      	mov	r0, r1
    1d3e:	f000 b983 	b.w	2048 <usb_serial_putchar>
    1d42:	bf00      	nop

00001d44 <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    1d44:	4770      	bx	lr
    1d46:	bf00      	nop

00001d48 <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    1d48:	b672      	cpsid	i
	avail = usb_buffer_available;
    1d4a:	480d      	ldr	r0, [pc, #52]	; (1d80 <usb_malloc+0x38>)
    1d4c:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    1d4e:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    1d52:	2b0b      	cmp	r3, #11
    1d54:	dc10      	bgt.n	1d78 <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    1d56:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1d5a:	40d9      	lsrs	r1, r3
    1d5c:	ea22 0201 	bic.w	r2, r2, r1
    1d60:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1d62:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    1d64:	4807      	ldr	r0, [pc, #28]	; (1d84 <usb_malloc+0x3c>)
    1d66:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    1d6a:	00db      	lsls	r3, r3, #3
    1d6c:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    1d6e:	2100      	movs	r1, #0
    1d70:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    1d72:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    1d74:	6051      	str	r1, [r2, #4]
}
    1d76:	4770      	bx	lr
		__enable_irq();
    1d78:	b662      	cpsie	i
		return NULL;
    1d7a:	2000      	movs	r0, #0
    1d7c:	4770      	bx	lr
    1d7e:	bf00      	nop
    1d80:	1fff88f4 	.word	0x1fff88f4
    1d84:	1fff83bc 	.word	0x1fff83bc

00001d88 <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    1d88:	4b0d      	ldr	r3, [pc, #52]	; (1dc0 <usb_free+0x38>)
    1d8a:	4a0e      	ldr	r2, [pc, #56]	; (1dc4 <usb_free+0x3c>)
    1d8c:	1ac3      	subs	r3, r0, r3
    1d8e:	fba2 2303 	umull	r2, r3, r2, r3
    1d92:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    1d94:	2b0b      	cmp	r3, #11
    1d96:	d80c      	bhi.n	1db2 <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    1d98:	4a0b      	ldr	r2, [pc, #44]	; (1dc8 <usb_free+0x40>)
    1d9a:	7812      	ldrb	r2, [r2, #0]
    1d9c:	b952      	cbnz	r2, 1db4 <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    1d9e:	b672      	cpsid	i
	usb_buffer_available |= mask;
    1da0:	480a      	ldr	r0, [pc, #40]	; (1dcc <usb_free+0x44>)
    1da2:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1da6:	6802      	ldr	r2, [r0, #0]
    1da8:	fa21 f303 	lsr.w	r3, r1, r3
    1dac:	431a      	orrs	r2, r3
    1dae:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1db0:	b662      	cpsie	i
    1db2:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    1db4:	4a06      	ldr	r2, [pc, #24]	; (1dd0 <usb_free+0x48>)
    1db6:	7812      	ldrb	r2, [r2, #0]
    1db8:	2a00      	cmp	r2, #0
    1dba:	d0f0      	beq.n	1d9e <usb_free+0x16>
		usb_rx_memory(p);
    1dbc:	f7ff b942 	b.w	1044 <usb_rx_memory>
    1dc0:	1fff83bc 	.word	0x1fff83bc
    1dc4:	38e38e39 	.word	0x38e38e39
    1dc8:	1fff95f1 	.word	0x1fff95f1
    1dcc:	1fff88f4 	.word	0x1fff88f4
    1dd0:	1fff95fc 	.word	0x1fff95fc

00001dd4 <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    1dd4:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    1dd6:	4d0f      	ldr	r5, [pc, #60]	; (1e14 <usb_serial_getchar+0x40>)
    1dd8:	6828      	ldr	r0, [r5, #0]
    1dda:	b178      	cbz	r0, 1dfc <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    1ddc:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    1dde:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    1de0:	18c1      	adds	r1, r0, r3
    1de2:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    1de4:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    1de6:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    1de8:	d202      	bcs.n	1df0 <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    1dea:	8043      	strh	r3, [r0, #2]
	}
	return c;
    1dec:	4620      	mov	r0, r4
}
    1dee:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    1df0:	f7ff ffca 	bl	1d88 <usb_free>
		rx_packet = NULL;
    1df4:	2300      	movs	r3, #0
	return c;
    1df6:	4620      	mov	r0, r4
		rx_packet = NULL;
    1df8:	602b      	str	r3, [r5, #0]
    1dfa:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    1dfc:	4b06      	ldr	r3, [pc, #24]	; (1e18 <usb_serial_getchar+0x44>)
    1dfe:	781b      	ldrb	r3, [r3, #0]
    1e00:	b12b      	cbz	r3, 1e0e <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1e02:	2003      	movs	r0, #3
    1e04:	f7ff f8ea 	bl	fdc <usb_rx>
    1e08:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    1e0a:	2800      	cmp	r0, #0
    1e0c:	d1e6      	bne.n	1ddc <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    1e0e:	f04f 30ff 	mov.w	r0, #4294967295
    1e12:	bd38      	pop	{r3, r4, r5, pc}
    1e14:	1fff9610 	.word	0x1fff9610
    1e18:	1fff95fc 	.word	0x1fff95fc

00001e1c <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    1e1c:	b510      	push	{r4, lr}
	if (!rx_packet) {
    1e1e:	4c09      	ldr	r4, [pc, #36]	; (1e44 <usb_serial_peekchar+0x28>)
    1e20:	6820      	ldr	r0, [r4, #0]
    1e22:	b118      	cbz	r0, 1e2c <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    1e24:	8843      	ldrh	r3, [r0, #2]
    1e26:	4418      	add	r0, r3
    1e28:	7a00      	ldrb	r0, [r0, #8]
}
    1e2a:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    1e2c:	4b06      	ldr	r3, [pc, #24]	; (1e48 <usb_serial_peekchar+0x2c>)
    1e2e:	781b      	ldrb	r3, [r3, #0]
    1e30:	b12b      	cbz	r3, 1e3e <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1e32:	2003      	movs	r0, #3
    1e34:	f7ff f8d2 	bl	fdc <usb_rx>
    1e38:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    1e3a:	2800      	cmp	r0, #0
    1e3c:	d1f2      	bne.n	1e24 <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    1e3e:	f04f 30ff 	mov.w	r0, #4294967295
    1e42:	bd10      	pop	{r4, pc}
    1e44:	1fff9610 	.word	0x1fff9610
    1e48:	1fff95fc 	.word	0x1fff95fc

00001e4c <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1e4c:	4b04      	ldr	r3, [pc, #16]	; (1e60 <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    1e4e:	4a05      	ldr	r2, [pc, #20]	; (1e64 <usb_serial_available+0x18>)
    1e50:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    1e52:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1e54:	b11b      	cbz	r3, 1e5e <usb_serial_available+0x12>
    1e56:	881a      	ldrh	r2, [r3, #0]
    1e58:	885b      	ldrh	r3, [r3, #2]
    1e5a:	1ad3      	subs	r3, r2, r3
    1e5c:	4418      	add	r0, r3
	return count;
}
    1e5e:	4770      	bx	lr
    1e60:	1fff9610 	.word	0x1fff9610
    1e64:	1fff97f8 	.word	0x1fff97f8

00001e68 <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    1e68:	4b0b      	ldr	r3, [pc, #44]	; (1e98 <usb_serial_flush_input+0x30>)
    1e6a:	781b      	ldrb	r3, [r3, #0]
    1e6c:	b19b      	cbz	r3, 1e96 <usb_serial_flush_input+0x2e>
{
    1e6e:	b510      	push	{r4, lr}
	if (rx_packet) {
    1e70:	4c0a      	ldr	r4, [pc, #40]	; (1e9c <usb_serial_flush_input+0x34>)
    1e72:	6820      	ldr	r0, [r4, #0]
    1e74:	b148      	cbz	r0, 1e8a <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    1e76:	f7ff ff87 	bl	1d88 <usb_free>
		rx_packet = NULL;
    1e7a:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    1e7c:	2003      	movs	r0, #3
		rx_packet = NULL;
    1e7e:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    1e80:	f7ff f8ac 	bl	fdc <usb_rx>
		if (!rx) break;
    1e84:	b130      	cbz	r0, 1e94 <usb_serial_flush_input+0x2c>
		usb_free(rx);
    1e86:	f7ff ff7f 	bl	1d88 <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    1e8a:	2003      	movs	r0, #3
    1e8c:	f7ff f8a6 	bl	fdc <usb_rx>
		if (!rx) break;
    1e90:	2800      	cmp	r0, #0
    1e92:	d1f8      	bne.n	1e86 <usb_serial_flush_input+0x1e>
    1e94:	bd10      	pop	{r4, pc}
    1e96:	4770      	bx	lr
    1e98:	1fff95fc 	.word	0x1fff95fc
    1e9c:	1fff9610 	.word	0x1fff9610

00001ea0 <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    1ea0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    1ea4:	4a63      	ldr	r2, [pc, #396]	; (2034 <usb_serial_write+0x194>)
{
    1ea6:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    1ea8:	2301      	movs	r3, #1
    1eaa:	7013      	strb	r3, [r2, #0]
	while (size > 0) {
    1eac:	9101      	str	r1, [sp, #4]
    1eae:	2900      	cmp	r1, #0
    1eb0:	d06c      	beq.n	1f8c <usb_serial_write+0xec>
    1eb2:	f8df 8190 	ldr.w	r8, [pc, #400]	; 2044 <usb_serial_write+0x1a4>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    1eb6:	4f60      	ldr	r7, [pc, #384]	; (2038 <usb_serial_write+0x198>)
    1eb8:	4604      	mov	r4, r0
    1eba:	f8d8 0000 	ldr.w	r0, [r8]
    1ebe:	460e      	mov	r6, r1
		if (!tx_packet) {
    1ec0:	2800      	cmp	r0, #0
    1ec2:	f000 8081 	beq.w	1fc8 <usb_serial_write+0x128>
    1ec6:	4d5d      	ldr	r5, [pc, #372]	; (203c <usb_serial_write+0x19c>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    1ec8:	8843      	ldrh	r3, [r0, #2]
    1eca:	f1c3 0140 	rsb	r1, r3, #64	; 0x40
    1ece:	42b1      	cmp	r1, r6
    1ed0:	bf28      	it	cs
    1ed2:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    1ed4:	eb03 0901 	add.w	r9, r3, r1
    1ed8:	fa1f f989 	uxth.w	r9, r9
		dest = tx_packet->buf + tx_packet->index;
    1edc:	f100 0208 	add.w	r2, r0, #8
		transmit_previous_timeout = 0;
    1ee0:	f04f 0e00 	mov.w	lr, #0
		size -= len;
    1ee4:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    1ee6:	f8a0 9002 	strh.w	r9, [r0, #2]
		while (len-- > 0) *dest++ = *src++;
    1eea:	f101 3cff 	add.w	ip, r1, #4294967295
		dest = tx_packet->buf + tx_packet->index;
    1eee:	441a      	add	r2, r3
		transmit_previous_timeout = 0;
    1ef0:	f885 e000 	strb.w	lr, [r5]
		while (len-- > 0) *dest++ = *src++;
    1ef4:	2900      	cmp	r1, #0
    1ef6:	d041      	beq.n	1f7c <usb_serial_write+0xdc>
    1ef8:	f103 0508 	add.w	r5, r3, #8
    1efc:	330c      	adds	r3, #12
    1efe:	4403      	add	r3, r0
    1f00:	4405      	add	r5, r0
    1f02:	f104 0904 	add.w	r9, r4, #4
    1f06:	454d      	cmp	r5, r9
    1f08:	bf38      	it	cc
    1f0a:	429c      	cmpcc	r4, r3
    1f0c:	bf2c      	ite	cs
    1f0e:	2301      	movcs	r3, #1
    1f10:	2300      	movcc	r3, #0
    1f12:	2909      	cmp	r1, #9
    1f14:	bf94      	ite	ls
    1f16:	2300      	movls	r3, #0
    1f18:	f003 0301 	andhi.w	r3, r3, #1
    1f1c:	2b00      	cmp	r3, #0
    1f1e:	d04a      	beq.n	1fb6 <usb_serial_write+0x116>
    1f20:	ea44 0305 	orr.w	r3, r4, r5
    1f24:	079b      	lsls	r3, r3, #30
    1f26:	d146      	bne.n	1fb6 <usb_serial_write+0x116>
    1f28:	1f0b      	subs	r3, r1, #4
    1f2a:	089b      	lsrs	r3, r3, #2
    1f2c:	3301      	adds	r3, #1
    1f2e:	f1bc 0f02 	cmp.w	ip, #2
    1f32:	ea4f 0983 	mov.w	r9, r3, lsl #2
    1f36:	d93c      	bls.n	1fb2 <usb_serial_write+0x112>
    1f38:	f1a4 0a04 	sub.w	sl, r4, #4
    1f3c:	469b      	mov	fp, r3
    1f3e:	f10e 0e01 	add.w	lr, lr, #1
    1f42:	f85a 3f04 	ldr.w	r3, [sl, #4]!
    1f46:	f845 3b04 	str.w	r3, [r5], #4
    1f4a:	45f3      	cmp	fp, lr
    1f4c:	d8f7      	bhi.n	1f3e <usb_serial_write+0x9e>
    1f4e:	4549      	cmp	r1, r9
    1f50:	444a      	add	r2, r9
    1f52:	ebc9 0c0c 	rsb	ip, r9, ip
    1f56:	eb04 0309 	add.w	r3, r4, r9
    1f5a:	d061      	beq.n	2020 <usb_serial_write+0x180>
    1f5c:	781d      	ldrb	r5, [r3, #0]
    1f5e:	7015      	strb	r5, [r2, #0]
    1f60:	f1bc 0f00 	cmp.w	ip, #0
    1f64:	d023      	beq.n	1fae <usb_serial_write+0x10e>
    1f66:	785d      	ldrb	r5, [r3, #1]
    1f68:	7055      	strb	r5, [r2, #1]
    1f6a:	f1bc 0f01 	cmp.w	ip, #1
    1f6e:	d01e      	beq.n	1fae <usb_serial_write+0x10e>
    1f70:	789b      	ldrb	r3, [r3, #2]
    1f72:	7093      	strb	r3, [r2, #2]
    1f74:	4421      	add	r1, r4
    1f76:	f8b0 9002 	ldrh.w	r9, [r0, #2]
    1f7a:	460c      	mov	r4, r1
		if (tx_packet->index >= CDC_TX_SIZE) {
    1f7c:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
    1f80:	d80b      	bhi.n	1f9a <usb_serial_write+0xfa>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    1f82:	4b2f      	ldr	r3, [pc, #188]	; (2040 <usb_serial_write+0x1a0>)
    1f84:	2205      	movs	r2, #5
    1f86:	701a      	strb	r2, [r3, #0]
	while (size > 0) {
    1f88:	2e00      	cmp	r6, #0
    1f8a:	d199      	bne.n	1ec0 <usb_serial_write+0x20>
	}
	tx_noautoflush = 0;
	return ret;
    1f8c:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    1f8e:	4a29      	ldr	r2, [pc, #164]	; (2034 <usb_serial_write+0x194>)
    1f90:	2300      	movs	r3, #0
    1f92:	7013      	strb	r3, [r2, #0]
}
    1f94:	b003      	add	sp, #12
    1f96:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    1f9a:	2340      	movs	r3, #64	; 0x40
    1f9c:	8003      	strh	r3, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1f9e:	4601      	mov	r1, r0
    1fa0:	2004      	movs	r0, #4
    1fa2:	f7ff f8b3 	bl	110c <usb_tx>
			tx_packet = NULL;
    1fa6:	2000      	movs	r0, #0
    1fa8:	f8c8 0000 	str.w	r0, [r8]
    1fac:	e7e9      	b.n	1f82 <usb_serial_write+0xe2>
    1fae:	4421      	add	r1, r4
    1fb0:	e7e1      	b.n	1f76 <usb_serial_write+0xd6>
		while (len-- > 0) *dest++ = *src++;
    1fb2:	4623      	mov	r3, r4
    1fb4:	e7d2      	b.n	1f5c <usb_serial_write+0xbc>
    1fb6:	3a01      	subs	r2, #1
    1fb8:	4421      	add	r1, r4
    1fba:	f814 3b01 	ldrb.w	r3, [r4], #1
    1fbe:	f802 3f01 	strb.w	r3, [r2, #1]!
    1fc2:	428c      	cmp	r4, r1
    1fc4:	d1f9      	bne.n	1fba <usb_serial_write+0x11a>
    1fc6:	e7d6      	b.n	1f76 <usb_serial_write+0xd6>
				if (!usb_configuration) {
    1fc8:	783b      	ldrb	r3, [r7, #0]
    1fca:	b35b      	cbz	r3, 2024 <usb_serial_write+0x184>
    1fcc:	4d1b      	ldr	r5, [pc, #108]	; (203c <usb_serial_write+0x19c>)
    1fce:	f24d 09e9 	movw	r9, #53481	; 0xd0e9
					tx_noautoflush = 1;
    1fd2:	f04f 0a01 	mov.w	sl, #1
    1fd6:	e008      	b.n	1fea <usb_serial_write+0x14a>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1fd8:	f1b9 0901 	subs.w	r9, r9, #1
    1fdc:	d019      	beq.n	2012 <usb_serial_write+0x172>
    1fde:	782b      	ldrb	r3, [r5, #0]
    1fe0:	b9bb      	cbnz	r3, 2012 <usb_serial_write+0x172>
				yield();
    1fe2:	f000 f8b1 	bl	2148 <yield>
				if (!usb_configuration) {
    1fe6:	783b      	ldrb	r3, [r7, #0]
    1fe8:	b1e3      	cbz	r3, 2024 <usb_serial_write+0x184>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    1fea:	2004      	movs	r0, #4
    1fec:	f7ff f814 	bl	1018 <usb_tx_packet_count>
    1ff0:	2807      	cmp	r0, #7
    1ff2:	d8f1      	bhi.n	1fd8 <usb_serial_write+0x138>
					tx_noautoflush = 1;
    1ff4:	4b0f      	ldr	r3, [pc, #60]	; (2034 <usb_serial_write+0x194>)
    1ff6:	f883 a000 	strb.w	sl, [r3]
					tx_packet = usb_malloc();
    1ffa:	f7ff fea5 	bl	1d48 <usb_malloc>
    1ffe:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    2002:	2800      	cmp	r0, #0
    2004:	f47f af60 	bne.w	1ec8 <usb_serial_write+0x28>
					tx_noautoflush = 0;
    2008:	4b0a      	ldr	r3, [pc, #40]	; (2034 <usb_serial_write+0x194>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    200a:	f1b9 0901 	subs.w	r9, r9, #1
					tx_noautoflush = 0;
    200e:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    2010:	d1e5      	bne.n	1fde <usb_serial_write+0x13e>
					transmit_previous_timeout = 1;
    2012:	2301      	movs	r3, #1
					return -1;
    2014:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    2018:	702b      	strb	r3, [r5, #0]
}
    201a:	b003      	add	sp, #12
    201c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2020:	4619      	mov	r1, r3
    2022:	e7a8      	b.n	1f76 <usb_serial_write+0xd6>
					tx_noautoflush = 0;
    2024:	4a03      	ldr	r2, [pc, #12]	; (2034 <usb_serial_write+0x194>)
    2026:	2300      	movs	r3, #0
					return -1;
    2028:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    202c:	7013      	strb	r3, [r2, #0]
}
    202e:	b003      	add	sp, #12
    2030:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2034:	1fff9605 	.word	0x1fff9605
    2038:	1fff95fc 	.word	0x1fff95fc
    203c:	1fff960c 	.word	0x1fff960c
    2040:	1fff9604 	.word	0x1fff9604
    2044:	1fff9608 	.word	0x1fff9608

00002048 <usb_serial_putchar>:
{
    2048:	b500      	push	{lr}
    204a:	b083      	sub	sp, #12
    204c:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    204e:	2101      	movs	r1, #1
{
    2050:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    2054:	4618      	mov	r0, r3
    2056:	f7ff ff23 	bl	1ea0 <usb_serial_write>
}
    205a:	b003      	add	sp, #12
    205c:	f85d fb04 	ldr.w	pc, [sp], #4

00002060 <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    2060:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    2062:	4d0e      	ldr	r5, [pc, #56]	; (209c <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    2064:	4c0e      	ldr	r4, [pc, #56]	; (20a0 <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    2066:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    2068:	2301      	movs	r3, #1
    206a:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    206c:	b128      	cbz	r0, 207a <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    206e:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    2070:	2300      	movs	r3, #0
    2072:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    2074:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    2078:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    207a:	4b0a      	ldr	r3, [pc, #40]	; (20a4 <usb_serial_write_buffer_free+0x44>)
    207c:	781b      	ldrb	r3, [r3, #0]
    207e:	b913      	cbnz	r3, 2086 <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    2080:	2000      	movs	r0, #0
    2082:	7020      	strb	r0, [r4, #0]
			return 0;
    2084:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    2086:	2004      	movs	r0, #4
    2088:	f7fe ffc6 	bl	1018 <usb_tx_packet_count>
		if (!usb_configuration ||
    208c:	2807      	cmp	r0, #7
    208e:	d8f7      	bhi.n	2080 <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    2090:	f7ff fe5a 	bl	1d48 <usb_malloc>
    2094:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    2096:	2800      	cmp	r0, #0
    2098:	d1e9      	bne.n	206e <usb_serial_write_buffer_free+0xe>
    209a:	e7f1      	b.n	2080 <usb_serial_write_buffer_free+0x20>
    209c:	1fff9608 	.word	0x1fff9608
    20a0:	1fff9605 	.word	0x1fff9605
    20a4:	1fff95fc 	.word	0x1fff95fc

000020a8 <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    20a8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    20aa:	4b11      	ldr	r3, [pc, #68]	; (20f0 <usb_serial_flush_output+0x48>)
    20ac:	781b      	ldrb	r3, [r3, #0]
    20ae:	b18b      	cbz	r3, 20d4 <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    20b0:	4e10      	ldr	r6, [pc, #64]	; (20f4 <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    20b2:	4d11      	ldr	r5, [pc, #68]	; (20f8 <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    20b4:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    20b6:	2701      	movs	r7, #1
    20b8:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    20ba:	b164      	cbz	r4, 20d6 <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    20bc:	4a0f      	ldr	r2, [pc, #60]	; (20fc <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    20be:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    20c0:	2700      	movs	r7, #0
    20c2:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    20c4:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    20c6:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    20c8:	2004      	movs	r0, #4
    20ca:	f7ff f81f 	bl	110c <usb_tx>
		tx_packet = NULL;
    20ce:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    20d0:	2300      	movs	r3, #0
    20d2:	702b      	strb	r3, [r5, #0]
    20d4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    20d6:	f7ff fe37 	bl	1d48 <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    20da:	4b08      	ldr	r3, [pc, #32]	; (20fc <usb_serial_flush_output+0x54>)
		if (tx) {
    20dc:	b128      	cbz	r0, 20ea <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    20de:	4601      	mov	r1, r0
    20e0:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    20e2:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    20e4:	f7ff f812 	bl	110c <usb_tx>
    20e8:	e7f2      	b.n	20d0 <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    20ea:	701f      	strb	r7, [r3, #0]
    20ec:	e7f0      	b.n	20d0 <usb_serial_flush_output+0x28>
    20ee:	bf00      	nop
    20f0:	1fff95fc 	.word	0x1fff95fc
    20f4:	1fff9608 	.word	0x1fff9608
    20f8:	1fff9605 	.word	0x1fff9605
    20fc:	1fff9604 	.word	0x1fff9604

00002100 <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    2100:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    2102:	4b0e      	ldr	r3, [pc, #56]	; (213c <usb_serial_flush_callback+0x3c>)
    2104:	781b      	ldrb	r3, [r3, #0]
    2106:	b973      	cbnz	r3, 2126 <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    2108:	4c0d      	ldr	r4, [pc, #52]	; (2140 <usb_serial_flush_callback+0x40>)
    210a:	6821      	ldr	r1, [r4, #0]
    210c:	b161      	cbz	r1, 2128 <usb_serial_flush_callback+0x28>
    210e:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    2112:	884b      	ldrh	r3, [r1, #2]
    2114:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    2116:	2004      	movs	r0, #4
    2118:	f7fe fff8 	bl	110c <usb_tx>
		tx_packet = NULL;
    211c:	6025      	str	r5, [r4, #0]
    211e:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    2120:	4b08      	ldr	r3, [pc, #32]	; (2144 <usb_serial_flush_callback+0x44>)
    2122:	2201      	movs	r2, #1
    2124:	701a      	strb	r2, [r3, #0]
    2126:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    2128:	f7ff fe0e 	bl	1d48 <usb_malloc>
		if (tx) {
    212c:	2800      	cmp	r0, #0
    212e:	d0f7      	beq.n	2120 <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    2130:	4601      	mov	r1, r0
		}
	}
}
    2132:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    2136:	2004      	movs	r0, #4
    2138:	f7fe bfe8 	b.w	110c <usb_tx>
    213c:	1fff9605 	.word	0x1fff9605
    2140:	1fff9608 	.word	0x1fff9608
    2144:	1fff9604 	.word	0x1fff9604

00002148 <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    2148:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    214a:	4c22      	ldr	r4, [pc, #136]	; (21d4 <yield+0x8c>)
    214c:	7823      	ldrb	r3, [r4, #0]
    214e:	b103      	cbz	r3, 2152 <yield+0xa>
    2150:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    2152:	2301      	movs	r3, #1
    2154:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    2156:	f7ff fe79 	bl	1e4c <usb_serial_available>
	if (Serial.available()) serialEvent();
    215a:	bb70      	cbnz	r0, 21ba <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    215c:	f000 fa26 	bl	25ac <serial_available>
	if (Serial1.available()) serialEvent1();
    2160:	bb40      	cbnz	r0, 21b4 <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    2162:	f000 fab9 	bl	26d8 <serial2_available>
	if (Serial2.available()) serialEvent2();
    2166:	bb10      	cbnz	r0, 21ae <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    2168:	f000 fb4c 	bl	2804 <serial3_available>
	if (Serial3.available()) serialEvent3();
    216c:	b9e0      	cbnz	r0, 21a8 <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    216e:	2300      	movs	r3, #0
    2170:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    2172:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    2176:	2b00      	cmp	r3, #0
    2178:	d1ea      	bne.n	2150 <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    217a:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    217e:	b672      	cpsid	i
		EventResponder *first = firstYield;
    2180:	4b15      	ldr	r3, [pc, #84]	; (21d8 <yield+0x90>)
    2182:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    2184:	b1e0      	cbz	r0, 21c0 <yield+0x78>
		if (runningFromYield) {
    2186:	4c15      	ldr	r4, [pc, #84]	; (21dc <yield+0x94>)
    2188:	7822      	ldrb	r2, [r4, #0]
    218a:	b9ca      	cbnz	r2, 21c0 <yield+0x78>
		firstYield = first->_next;
    218c:	6945      	ldr	r5, [r0, #20]
    218e:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    2190:	2301      	movs	r3, #1
    2192:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    2194:	b1c5      	cbz	r5, 21c8 <yield+0x80>
			firstYield->_prev = nullptr;
    2196:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    2198:	b901      	cbnz	r1, 219c <yield+0x54>
    219a:	b662      	cpsie	i
		first->_triggered = false;
    219c:	2500      	movs	r5, #0
    219e:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    21a0:	6883      	ldr	r3, [r0, #8]
    21a2:	4798      	blx	r3
		runningFromYield = false;
    21a4:	7025      	strb	r5, [r4, #0]
    21a6:	e7d3      	b.n	2150 <yield+0x8>
	if (Serial3.available()) serialEvent3();
    21a8:	f000 f98e 	bl	24c8 <serialEvent3()>
    21ac:	e7df      	b.n	216e <yield+0x26>
	if (Serial2.available()) serialEvent2();
    21ae:	f000 f989 	bl	24c4 <serialEvent2()>
    21b2:	e7d9      	b.n	2168 <yield+0x20>
	if (Serial1.available()) serialEvent1();
    21b4:	f000 f984 	bl	24c0 <serialEvent1()>
    21b8:	e7d3      	b.n	2162 <yield+0x1a>
	if (Serial.available()) serialEvent();
    21ba:	f7ff fdc3 	bl	1d44 <serialEvent()>
    21be:	e7cd      	b.n	215c <yield+0x14>
		if (doit) __enable_irq();
    21c0:	2900      	cmp	r1, #0
    21c2:	d1c5      	bne.n	2150 <yield+0x8>
    21c4:	b662      	cpsie	i
    21c6:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    21c8:	4b05      	ldr	r3, [pc, #20]	; (21e0 <yield+0x98>)
    21ca:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    21cc:	2900      	cmp	r1, #0
    21ce:	d1e5      	bne.n	219c <yield+0x54>
    21d0:	e7e3      	b.n	219a <yield+0x52>
    21d2:	bf00      	nop
    21d4:	1fff9615 	.word	0x1fff9615
    21d8:	1fff9628 	.word	0x1fff9628
    21dc:	1fff962c 	.word	0x1fff962c
    21e0:	1fff9624 	.word	0x1fff9624

000021e4 <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    21e4:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    21e6:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    21e8:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    21ea:	2c02      	cmp	r4, #2
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    21ec:	4603      	mov	r3, r0
		_data = data;
    21ee:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    21f0:	d00f      	beq.n	2212 <EventResponder::triggerEvent(int, void*)+0x2e>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    21f2:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    21f6:	b672      	cpsid	i
// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
	bool irq = disableInterrupts();
	if (_triggered == false) {
    21f8:	7f42      	ldrb	r2, [r0, #29]
    21fa:	b932      	cbnz	r2, 220a <EventResponder::triggerEvent(int, void*)+0x26>
		// not already triggered
		if (_type == EventTypeYield) {
    21fc:	7f00      	ldrb	r0, [r0, #28]
    21fe:	2801      	cmp	r0, #1
    2200:	d00a      	beq.n	2218 <EventResponder::triggerEvent(int, void*)+0x34>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    2202:	2803      	cmp	r0, #3
    2204:	d012      	beq.n	222c <EventResponder::triggerEvent(int, void*)+0x48>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    2206:	2201      	movs	r2, #1
    2208:	775a      	strb	r2, [r3, #29]
		if (doit) __enable_irq();
    220a:	b901      	cbnz	r1, 220e <EventResponder::triggerEvent(int, void*)+0x2a>
    220c:	b662      	cpsie	i
	}
    220e:	bc10      	pop	{r4}
    2210:	4770      	bx	lr
			(*_function)(*this);
    2212:	6883      	ldr	r3, [r0, #8]
	}
    2214:	bc10      	pop	{r4}
			(*_function)(*this);
    2216:	4718      	bx	r3
			if (firstYield == nullptr) {
    2218:	4c11      	ldr	r4, [pc, #68]	; (2260 <EventResponder::triggerEvent(int, void*)+0x7c>)
    221a:	6820      	ldr	r0, [r4, #0]
    221c:	b1a0      	cbz	r0, 2248 <EventResponder::triggerEvent(int, void*)+0x64>
				_prev = lastYield;
    221e:	4811      	ldr	r0, [pc, #68]	; (2264 <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2220:	615a      	str	r2, [r3, #20]
				_prev = lastYield;
    2222:	6802      	ldr	r2, [r0, #0]
    2224:	619a      	str	r2, [r3, #24]
				lastYield = this;
    2226:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2228:	6153      	str	r3, [r2, #20]
    222a:	e7ec      	b.n	2206 <EventResponder::triggerEvent(int, void*)+0x22>
			if (firstInterrupt == nullptr) {
    222c:	4c0e      	ldr	r4, [pc, #56]	; (2268 <EventResponder::triggerEvent(int, void*)+0x84>)
    222e:	6820      	ldr	r0, [r4, #0]
    2230:	b180      	cbz	r0, 2254 <EventResponder::triggerEvent(int, void*)+0x70>
				_prev = lastInterrupt;
    2232:	480e      	ldr	r0, [pc, #56]	; (226c <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    2234:	615a      	str	r2, [r3, #20]
				_prev = lastInterrupt;
    2236:	6802      	ldr	r2, [r0, #0]
    2238:	619a      	str	r2, [r3, #24]
				lastInterrupt = this;
    223a:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    223c:	6153      	str	r3, [r2, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    223e:	4a0c      	ldr	r2, [pc, #48]	; (2270 <EventResponder::triggerEvent(int, void*)+0x8c>)
    2240:	f04f 5080 	mov.w	r0, #268435456	; 0x10000000
    2244:	6010      	str	r0, [r2, #0]
    2246:	e7de      	b.n	2206 <EventResponder::triggerEvent(int, void*)+0x22>
				lastYield = this;
    2248:	4a06      	ldr	r2, [pc, #24]	; (2264 <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    224a:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    224c:	6198      	str	r0, [r3, #24]
				firstYield = this;
    224e:	6023      	str	r3, [r4, #0]
				lastYield = this;
    2250:	6013      	str	r3, [r2, #0]
    2252:	e7d8      	b.n	2206 <EventResponder::triggerEvent(int, void*)+0x22>
				lastInterrupt = this;
    2254:	4a05      	ldr	r2, [pc, #20]	; (226c <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    2256:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2258:	6198      	str	r0, [r3, #24]
				firstInterrupt = this;
    225a:	6023      	str	r3, [r4, #0]
				lastInterrupt = this;
    225c:	6013      	str	r3, [r2, #0]
    225e:	e7ee      	b.n	223e <EventResponder::triggerEvent(int, void*)+0x5a>
    2260:	1fff9628 	.word	0x1fff9628
    2264:	1fff9624 	.word	0x1fff9624
    2268:	1fff9618 	.word	0x1fff9618
    226c:	1fff961c 	.word	0x1fff961c
    2270:	e000ed04 	.word	0xe000ed04

00002274 <pendablesrvreq_isr>:
	}
	enableInterrupts(irq);
}

void pendablesrvreq_isr(void)
{
    2274:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2276:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    227a:	b672      	cpsid	i

void EventResponder::runFromInterrupt()
{
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    227c:	4c0c      	ldr	r4, [pc, #48]	; (22b0 <pendablesrvreq_isr+0x3c>)
    227e:	6820      	ldr	r0, [r4, #0]
		if (first) {
    2280:	b180      	cbz	r0, 22a4 <pendablesrvreq_isr+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    2282:	4e0c      	ldr	r6, [pc, #48]	; (22b4 <pendablesrvreq_isr+0x40>)
				firstInterrupt->_prev = nullptr;
    2284:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    2286:	6943      	ldr	r3, [r0, #20]
    2288:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    228a:	b173      	cbz	r3, 22aa <pendablesrvreq_isr+0x36>
				firstInterrupt->_prev = nullptr;
    228c:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    228e:	b902      	cbnz	r2, 2292 <pendablesrvreq_isr+0x1e>
    2290:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    2292:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    2294:	6883      	ldr	r3, [r0, #8]
    2296:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2298:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    229c:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    229e:	6820      	ldr	r0, [r4, #0]
		if (first) {
    22a0:	2800      	cmp	r0, #0
    22a2:	d1f0      	bne.n	2286 <pendablesrvreq_isr+0x12>
		if (doit) __enable_irq();
    22a4:	b902      	cbnz	r2, 22a8 <pendablesrvreq_isr+0x34>
    22a6:	b662      	cpsie	i
    22a8:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    22aa:	6033      	str	r3, [r6, #0]
    22ac:	e7ef      	b.n	228e <pendablesrvreq_isr+0x1a>
    22ae:	bf00      	nop
    22b0:	1fff9618 	.word	0x1fff9618
    22b4:	1fff961c 	.word	0x1fff961c

000022b8 <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    22b8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	MillisTimer *timer = listActive;
    22bc:	4d74      	ldr	r5, [pc, #464]	; (2490 <MillisTimer::runFromTimer()+0x1d8>)
    22be:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    22c0:	2c00      	cmp	r4, #0
    22c2:	d031      	beq.n	2328 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    22c4:	6823      	ldr	r3, [r4, #0]
    22c6:	2b00      	cmp	r3, #0
    22c8:	d12c      	bne.n	2324 <MillisTimer::runFromTimer()+0x6c>
    22ca:	f8df 91d8 	ldr.w	r9, [pc, #472]	; 24a4 <MillisTimer::runFromTimer()+0x1ec>
			if (firstInterrupt == nullptr) {
    22ce:	4f71      	ldr	r7, [pc, #452]	; (2494 <MillisTimer::runFromTimer()+0x1dc>)
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    22d0:	f8df 81d4 	ldr.w	r8, [pc, #468]	; 24a8 <MillisTimer::runFromTimer()+0x1f0>
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    22d4:	461e      	mov	r6, r3
			MillisTimer *next = timer->_next;
    22d6:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    22d8:	b103      	cbz	r3, 22dc <MillisTimer::runFromTimer()+0x24>
    22da:	60de      	str	r6, [r3, #12]
			listActive = next;
			timer->_state = TimerOff;
			EventResponderRef event = *(timer->_event);
    22dc:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    22de:	602b      	str	r3, [r5, #0]
			event.triggerEvent(0, timer);
    22e0:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    22e2:	7526      	strb	r6, [r4, #20]
			event.triggerEvent(0, timer);
    22e4:	681b      	ldr	r3, [r3, #0]
    22e6:	454b      	cmp	r3, r9
    22e8:	d157      	bne.n	239a <MillisTimer::runFromTimer()+0xe2>
		if (_type == EventTypeImmediate) {
    22ea:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    22ec:	6046      	str	r6, [r0, #4]
		if (_type == EventTypeImmediate) {
    22ee:	2b02      	cmp	r3, #2
		_data = data;
    22f0:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    22f2:	d056      	beq.n	23a2 <MillisTimer::runFromTimer()+0xea>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    22f4:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    22f8:	b672      	cpsid	i
	if (_triggered == false) {
    22fa:	7f43      	ldrb	r3, [r0, #29]
    22fc:	b943      	cbnz	r3, 2310 <MillisTimer::runFromTimer()+0x58>
		if (_type == EventTypeYield) {
    22fe:	7f01      	ldrb	r1, [r0, #28]
    2300:	2901      	cmp	r1, #1
    2302:	f000 8088 	beq.w	2416 <MillisTimer::runFromTimer()+0x15e>
		} else if (_type == EventTypeInterrupt) {
    2306:	2903      	cmp	r1, #3
    2308:	f000 8091 	beq.w	242e <MillisTimer::runFromTimer()+0x176>
		_triggered = true;
    230c:	2301      	movs	r3, #1
    230e:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    2310:	b902      	cbnz	r2, 2314 <MillisTimer::runFromTimer()+0x5c>
    2312:	b662      	cpsie	i
			if (timer->_reload) {
    2314:	6863      	ldr	r3, [r4, #4]
    2316:	2b00      	cmp	r3, #0
    2318:	d12c      	bne.n	2374 <MillisTimer::runFromTimer()+0xbc>
    231a:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    231c:	b124      	cbz	r4, 2328 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    231e:	6823      	ldr	r3, [r4, #0]
    2320:	2b00      	cmp	r3, #0
    2322:	d0d8      	beq.n	22d6 <MillisTimer::runFromTimer()+0x1e>
			timer->_ms--;
    2324:	3b01      	subs	r3, #1
    2326:	6023      	str	r3, [r4, #0]
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2328:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    232c:	b672      	cpsid	i
			}
			timer = listActive;
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    232e:	4a5a      	ldr	r2, [pc, #360]	; (2498 <MillisTimer::runFromTimer()+0x1e0>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2330:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    2332:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2334:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    2336:	b903      	cbnz	r3, 233a <MillisTimer::runFromTimer()+0x82>
    2338:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    233a:	2800      	cmp	r0, #0
    233c:	f000 80a5 	beq.w	248a <MillisTimer::runFromTimer()+0x1d2>
    2340:	682c      	ldr	r4, [r5, #0]
	_state = TimerActive;
    2342:	2702      	movs	r7, #2
		_prev = nullptr;
    2344:	f04f 0e00 	mov.w	lr, #0
		MillisTimer *next = waiting->_next;
    2348:	6886      	ldr	r6, [r0, #8]
	if (listActive == nullptr) {
    234a:	2c00      	cmp	r4, #0
    234c:	d05f      	beq.n	240e <MillisTimer::runFromTimer()+0x156>
	} else if (_ms < listActive->_ms) {
    234e:	6803      	ldr	r3, [r0, #0]
    2350:	6821      	ldr	r1, [r4, #0]
    2352:	428b      	cmp	r3, r1
    2354:	d23a      	bcs.n	23cc <MillisTimer::runFromTimer()+0x114>
		listActive->_ms -= _ms;	
    2356:	1acb      	subs	r3, r1, r3
		_next = listActive;
    2358:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    235a:	f8c0 e00c 	str.w	lr, [r0, #12]
		listActive->_ms -= _ms;	
    235e:	4601      	mov	r1, r0
    2360:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    2362:	60e0      	str	r0, [r4, #12]
	_state = TimerActive;
    2364:	7507      	strb	r7, [r0, #20]
    2366:	4630      	mov	r0, r6
    2368:	460c      	mov	r4, r1
	while (waiting) {
    236a:	2e00      	cmp	r6, #0
    236c:	d1ec      	bne.n	2348 <MillisTimer::runFromTimer()+0x90>
    236e:	6029      	str	r1, [r5, #0]
    2370:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	if (listActive == nullptr) {
    2374:	6828      	ldr	r0, [r5, #0]
    2376:	4a46      	ldr	r2, [pc, #280]	; (2490 <MillisTimer::runFromTimer()+0x1d8>)
				timer->_ms = timer->_reload;
    2378:	6023      	str	r3, [r4, #0]
	if (listActive == nullptr) {
    237a:	2800      	cmp	r0, #0
    237c:	d073      	beq.n	2466 <MillisTimer::runFromTimer()+0x1ae>
	} else if (_ms < listActive->_ms) {
    237e:	6801      	ldr	r1, [r0, #0]
    2380:	428b      	cmp	r3, r1
    2382:	d211      	bcs.n	23a8 <MillisTimer::runFromTimer()+0xf0>
		listActive->_ms -= _ms;	
    2384:	1acb      	subs	r3, r1, r3
		_next = listActive;
    2386:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2388:	60e6      	str	r6, [r4, #12]
		listActive->_ms -= _ms;	
    238a:	6003      	str	r3, [r0, #0]
		listActive->_prev = this;
    238c:	60c4      	str	r4, [r0, #12]
		listActive = this;
    238e:	6014      	str	r4, [r2, #0]
    2390:	4620      	mov	r0, r4
	_state = TimerActive;
    2392:	2302      	movs	r3, #2
    2394:	7523      	strb	r3, [r4, #20]
    2396:	4604      	mov	r4, r0
    2398:	e7c1      	b.n	231e <MillisTimer::runFromTimer()+0x66>
			event.triggerEvent(0, timer);
    239a:	4622      	mov	r2, r4
    239c:	2100      	movs	r1, #0
    239e:	4798      	blx	r3
    23a0:	e7b8      	b.n	2314 <MillisTimer::runFromTimer()+0x5c>
			(*_function)(*this);
    23a2:	6883      	ldr	r3, [r0, #8]
    23a4:	4798      	blx	r3
    23a6:	e7b5      	b.n	2314 <MillisTimer::runFromTimer()+0x5c>
	} else if (_ms < listActive->_ms) {
    23a8:	4686      	mov	lr, r0
    23aa:	e003      	b.n	23b4 <MillisTimer::runFromTimer()+0xfc>
			if (_ms < timer->_ms) {
    23ac:	6811      	ldr	r1, [r2, #0]
    23ae:	428b      	cmp	r3, r1
    23b0:	4696      	mov	lr, r2
    23b2:	d349      	bcc.n	2448 <MillisTimer::runFromTimer()+0x190>
		while (timer->_next) {
    23b4:	f8de 2008 	ldr.w	r2, [lr, #8]
		_ms -= timer->_ms;
    23b8:	1a5b      	subs	r3, r3, r1
    23ba:	6023      	str	r3, [r4, #0]
		while (timer->_next) {
    23bc:	2a00      	cmp	r2, #0
    23be:	d1f5      	bne.n	23ac <MillisTimer::runFromTimer()+0xf4>
		_next = nullptr;
    23c0:	60a2      	str	r2, [r4, #8]
		_prev = timer;
    23c2:	f8c4 e00c 	str.w	lr, [r4, #12]
		timer->_next = this;
    23c6:	f8ce 4008 	str.w	r4, [lr, #8]
    23ca:	e7e2      	b.n	2392 <MillisTimer::runFromTimer()+0xda>
	} else if (_ms < listActive->_ms) {
    23cc:	46a4      	mov	ip, r4
    23ce:	e003      	b.n	23d8 <MillisTimer::runFromTimer()+0x120>
			if (_ms < timer->_ms) {
    23d0:	6811      	ldr	r1, [r2, #0]
    23d2:	428b      	cmp	r3, r1
    23d4:	4694      	mov	ip, r2
    23d6:	d30c      	bcc.n	23f2 <MillisTimer::runFromTimer()+0x13a>
		while (timer->_next) {
    23d8:	f8dc 2008 	ldr.w	r2, [ip, #8]
		_ms -= timer->_ms;
    23dc:	1a5b      	subs	r3, r3, r1
    23de:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    23e0:	2a00      	cmp	r2, #0
    23e2:	d1f5      	bne.n	23d0 <MillisTimer::runFromTimer()+0x118>
		_next = nullptr;
    23e4:	6082      	str	r2, [r0, #8]
		_prev = timer;
    23e6:	f8c0 c00c 	str.w	ip, [r0, #12]
		timer->_next = this;
    23ea:	4621      	mov	r1, r4
    23ec:	f8cc 0008 	str.w	r0, [ip, #8]
    23f0:	e7b8      	b.n	2364 <MillisTimer::runFromTimer()+0xac>
				_prev = timer->_prev;
    23f2:	68d2      	ldr	r2, [r2, #12]
    23f4:	60c2      	str	r2, [r0, #12]
				_next = timer;
    23f6:	f8c0 c008 	str.w	ip, [r0, #8]
				timer->_prev = this;
    23fa:	f8cc 000c 	str.w	r0, [ip, #12]
				_prev->_next = this;
    23fe:	68c2      	ldr	r2, [r0, #12]
				timer->_ms -= _ms;
    2400:	1acb      	subs	r3, r1, r3
				_prev->_next = this;
    2402:	6090      	str	r0, [r2, #8]
				_state = TimerActive;
    2404:	4621      	mov	r1, r4
				timer->_ms -= _ms;
    2406:	f8cc 3000 	str.w	r3, [ip]
				_state = TimerActive;
    240a:	7507      	strb	r7, [r0, #20]
    240c:	e7ab      	b.n	2366 <MillisTimer::runFromTimer()+0xae>
		_next = nullptr;
    240e:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2410:	60c4      	str	r4, [r0, #12]
    2412:	4601      	mov	r1, r0
    2414:	e7a6      	b.n	2364 <MillisTimer::runFromTimer()+0xac>
			if (firstYield == nullptr) {
    2416:	f8df e094 	ldr.w	lr, [pc, #148]	; 24ac <MillisTimer::runFromTimer()+0x1f4>
    241a:	f8de 1000 	ldr.w	r1, [lr]
    241e:	b339      	cbz	r1, 2470 <MillisTimer::runFromTimer()+0x1b8>
				_prev = lastYield;
    2420:	491e      	ldr	r1, [pc, #120]	; (249c <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    2422:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    2424:	680b      	ldr	r3, [r1, #0]
    2426:	6183      	str	r3, [r0, #24]
				lastYield = this;
    2428:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    242a:	6158      	str	r0, [r3, #20]
    242c:	e76e      	b.n	230c <MillisTimer::runFromTimer()+0x54>
			if (firstInterrupt == nullptr) {
    242e:	6839      	ldr	r1, [r7, #0]
    2430:	b329      	cbz	r1, 247e <MillisTimer::runFromTimer()+0x1c6>
				_prev = lastInterrupt;
    2432:	491b      	ldr	r1, [pc, #108]	; (24a0 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2434:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    2436:	680b      	ldr	r3, [r1, #0]
    2438:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    243a:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    243c:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    243e:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    2442:	f8c8 3000 	str.w	r3, [r8]
    2446:	e761      	b.n	230c <MillisTimer::runFromTimer()+0x54>
				_prev = timer->_prev;
    2448:	68d2      	ldr	r2, [r2, #12]
    244a:	60e2      	str	r2, [r4, #12]
				_next = timer;
    244c:	f8c4 e008 	str.w	lr, [r4, #8]
				timer->_prev = this;
    2450:	f8ce 400c 	str.w	r4, [lr, #12]
				_prev->_next = this;
    2454:	68e2      	ldr	r2, [r4, #12]
				timer->_ms -= _ms;
    2456:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    2458:	2102      	movs	r1, #2
				_prev->_next = this;
    245a:	6094      	str	r4, [r2, #8]
				timer->_ms -= _ms;
    245c:	f8ce 3000 	str.w	r3, [lr]
				_state = TimerActive;
    2460:	7521      	strb	r1, [r4, #20]
    2462:	4604      	mov	r4, r0
    2464:	e75b      	b.n	231e <MillisTimer::runFromTimer()+0x66>
		_next = nullptr;
    2466:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    2468:	60e0      	str	r0, [r4, #12]
		listActive = this;
    246a:	6014      	str	r4, [r2, #0]
    246c:	4620      	mov	r0, r4
    246e:	e790      	b.n	2392 <MillisTimer::runFromTimer()+0xda>
				lastYield = this;
    2470:	4b0a      	ldr	r3, [pc, #40]	; (249c <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    2472:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    2474:	6181      	str	r1, [r0, #24]
				firstYield = this;
    2476:	f8ce 0000 	str.w	r0, [lr]
				lastYield = this;
    247a:	6018      	str	r0, [r3, #0]
    247c:	e746      	b.n	230c <MillisTimer::runFromTimer()+0x54>
				lastInterrupt = this;
    247e:	4b08      	ldr	r3, [pc, #32]	; (24a0 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2480:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    2482:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    2484:	6038      	str	r0, [r7, #0]
				lastInterrupt = this;
    2486:	6018      	str	r0, [r3, #0]
    2488:	e7d9      	b.n	243e <MillisTimer::runFromTimer()+0x186>
    248a:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    248e:	bf00      	nop
    2490:	1fff9620 	.word	0x1fff9620
    2494:	1fff9618 	.word	0x1fff9618
    2498:	1fff9630 	.word	0x1fff9630
    249c:	1fff9624 	.word	0x1fff9624
    24a0:	1fff961c 	.word	0x1fff961c
    24a4:	000021e5 	.word	0x000021e5
    24a8:	e000ed04 	.word	0xe000ed04
    24ac:	1fff9628 	.word	0x1fff9628

000024b0 <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    24b0:	4a02      	ldr	r2, [pc, #8]	; (24bc <systick_isr+0xc>)
    24b2:	6813      	ldr	r3, [r2, #0]
    24b4:	3301      	adds	r3, #1
    24b6:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    24b8:	f7ff befe 	b.w	22b8 <MillisTimer::runFromTimer()>
    24bc:	1fff9518 	.word	0x1fff9518

000024c0 <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    24c0:	4770      	bx	lr
    24c2:	bf00      	nop

000024c4 <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    24c4:	4770      	bx	lr
    24c6:	bf00      	nop

000024c8 <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    24c8:	4770      	bx	lr
    24ca:	bf00      	nop

000024cc <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    24cc:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    24ce:	4829      	ldr	r0, [pc, #164]	; (2574 <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    24d0:	4a29      	ldr	r2, [pc, #164]	; (2578 <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    24d2:	4b2a      	ldr	r3, [pc, #168]	; (257c <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    24d4:	4d2a      	ldr	r5, [pc, #168]	; (2580 <analog_init+0xb4>)
	VREF_TRM = 0x60;
    24d6:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    24d8:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    24da:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    24dc:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    24de:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    24e0:	4c28      	ldr	r4, [pc, #160]	; (2584 <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    24e2:	2b08      	cmp	r3, #8
    24e4:	d030      	beq.n	2548 <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    24e6:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    24e8:	4827      	ldr	r0, [pc, #156]	; (2588 <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    24ea:	4928      	ldr	r1, [pc, #160]	; (258c <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    24ec:	d037      	beq.n	255e <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    24ee:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    24f0:	bf0c      	ite	eq
    24f2:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    24f4:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    24f6:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    24f8:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    24fa:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    24fc:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    24fe:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    2500:	4b23      	ldr	r3, [pc, #140]	; (2590 <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2502:	4924      	ldr	r1, [pc, #144]	; (2594 <analog_init+0xc8>)
	if (analog_reference_internal) {
    2504:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2506:	4a24      	ldr	r2, [pc, #144]	; (2598 <analog_init+0xcc>)
	if (analog_reference_internal) {
    2508:	b1bb      	cbz	r3, 253a <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    250a:	2301      	movs	r3, #1
    250c:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    250e:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    2510:	4b22      	ldr	r3, [pc, #136]	; (259c <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    2512:	4923      	ldr	r1, [pc, #140]	; (25a0 <analog_init+0xd4>)
	num = analog_num_average;
    2514:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2516:	4a23      	ldr	r2, [pc, #140]	; (25a4 <analog_init+0xd8>)
	if (num <= 1) {
    2518:	2b01      	cmp	r3, #1
    251a:	d926      	bls.n	256a <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    251c:	2b04      	cmp	r3, #4
    251e:	d90f      	bls.n	2540 <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    2520:	2b08      	cmp	r3, #8
    2522:	d91e      	bls.n	2562 <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    2524:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    2526:	bf94      	ite	ls
    2528:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    252a:	2387      	movhi	r3, #135	; 0x87
    252c:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    252e:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    2530:	4b1d      	ldr	r3, [pc, #116]	; (25a8 <analog_init+0xdc>)
    2532:	2201      	movs	r2, #1
    2534:	701a      	strb	r2, [r3, #0]
}
    2536:	bc30      	pop	{r4, r5}
    2538:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    253a:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    253c:	6013      	str	r3, [r2, #0]
    253e:	e7e7      	b.n	2510 <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2540:	2384      	movs	r3, #132	; 0x84
    2542:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2544:	6013      	str	r3, [r2, #0]
    2546:	e7f3      	b.n	2530 <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2548:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    254c:	490f      	ldr	r1, [pc, #60]	; (258c <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    254e:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2550:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2552:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2554:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2556:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2558:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    255a:	600b      	str	r3, [r1, #0]
    255c:	e7d0      	b.n	2500 <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    255e:	2239      	movs	r2, #57	; 0x39
    2560:	e7f7      	b.n	2552 <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    2562:	2385      	movs	r3, #133	; 0x85
    2564:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    2566:	6013      	str	r3, [r2, #0]
    2568:	e7e2      	b.n	2530 <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    256a:	2380      	movs	r3, #128	; 0x80
    256c:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    256e:	6013      	str	r3, [r2, #0]
    2570:	e7de      	b.n	2530 <analog_init+0x64>
    2572:	bf00      	nop
    2574:	40074000 	.word	0x40074000
    2578:	40074001 	.word	0x40074001
    257c:	1fff88f8 	.word	0x1fff88f8
    2580:	4003b008 	.word	0x4003b008
    2584:	4003b00c 	.word	0x4003b00c
    2588:	400bb008 	.word	0x400bb008
    258c:	400bb00c 	.word	0x400bb00c
    2590:	1fff9635 	.word	0x1fff9635
    2594:	4003b020 	.word	0x4003b020
    2598:	400bb020 	.word	0x400bb020
    259c:	1fff88f9 	.word	0x1fff88f9
    25a0:	4003b024 	.word	0x4003b024
    25a4:	400bb024 	.word	0x400bb024
    25a8:	1fff9634 	.word	0x1fff9634

000025ac <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    25ac:	4a05      	ldr	r2, [pc, #20]	; (25c4 <serial_available+0x18>)
	tail = rx_buffer_tail;
    25ae:	4b06      	ldr	r3, [pc, #24]	; (25c8 <serial_available+0x1c>)
	head = rx_buffer_head;
    25b0:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    25b2:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    25b4:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    25b6:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    25b8:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    25ba:	bf38      	it	cc
    25bc:	3040      	addcc	r0, #64	; 0x40
    25be:	1ac0      	subs	r0, r0, r3
}
    25c0:	4770      	bx	lr
    25c2:	bf00      	nop
    25c4:	1fff96c0 	.word	0x1fff96c0
    25c8:	1fff963d 	.word	0x1fff963d

000025cc <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    25cc:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    25ce:	4b38      	ldr	r3, [pc, #224]	; (26b0 <uart0_status_isr+0xe4>)
    25d0:	791a      	ldrb	r2, [r3, #4]
    25d2:	f012 0f30 	tst.w	r2, #48	; 0x30
    25d6:	d02c      	beq.n	2632 <uart0_status_isr+0x66>
		__disable_irq();
    25d8:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    25da:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    25dc:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    25e0:	2900      	cmp	r1, #0
    25e2:	d03d      	beq.n	2660 <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    25e4:	b662      	cpsie	i
			head = rx_buffer_head;
    25e6:	4f33      	ldr	r7, [pc, #204]	; (26b4 <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    25e8:	4933      	ldr	r1, [pc, #204]	; (26b8 <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    25ea:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    25ec:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    25ee:	4e33      	ldr	r6, [pc, #204]	; (26bc <uart0_status_isr+0xf0>)
					n = UART0_D;
    25f0:	461c      	mov	r4, r3
			head = rx_buffer_head;
    25f2:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    25f4:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    25f6:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    25f8:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    25fa:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    25fc:	bf28      	it	cs
    25fe:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2600:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2602:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    2606:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2608:	bf1c      	itt	ne
    260a:	54f1      	strbne	r1, [r6, r3]
    260c:	4618      	movne	r0, r3
			} while (--avail > 0);
    260e:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2612:	d1f0      	bne.n	25f6 <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2614:	4b2a      	ldr	r3, [pc, #168]	; (26c0 <uart0_status_isr+0xf4>)
    2616:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2618:	b2c2      	uxtb	r2, r0
    261a:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    261c:	b14b      	cbz	r3, 2632 <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    261e:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2620:	bf36      	itet	cc
    2622:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2626:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2628:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    262a:	2827      	cmp	r0, #39	; 0x27
    262c:	bfc4      	itt	gt
    262e:	2201      	movgt	r2, #1
    2630:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    2632:	491f      	ldr	r1, [pc, #124]	; (26b0 <uart0_status_isr+0xe4>)
    2634:	78ca      	ldrb	r2, [r1, #3]
    2636:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2638:	0615      	lsls	r5, r2, #24
    263a:	d416      	bmi.n	266a <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    263c:	0652      	lsls	r2, r2, #25
    263e:	d50d      	bpl.n	265c <uart0_status_isr+0x90>
    2640:	4b1b      	ldr	r3, [pc, #108]	; (26b0 <uart0_status_isr+0xe4>)
    2642:	791b      	ldrb	r3, [r3, #4]
    2644:	065b      	lsls	r3, r3, #25
    2646:	d509      	bpl.n	265c <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2648:	4b1e      	ldr	r3, [pc, #120]	; (26c4 <uart0_status_isr+0xf8>)
		transmitting = 0;
    264a:	491f      	ldr	r1, [pc, #124]	; (26c8 <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    264c:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    264e:	2200      	movs	r2, #0
    2650:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2652:	b103      	cbz	r3, 2656 <uart0_status_isr+0x8a>
    2654:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    2656:	4b16      	ldr	r3, [pc, #88]	; (26b0 <uart0_status_isr+0xe4>)
    2658:	223c      	movs	r2, #60	; 0x3c
    265a:	70da      	strb	r2, [r3, #3]
	}
}
    265c:	bcf0      	pop	{r4, r5, r6, r7}
    265e:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2660:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    2662:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2664:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    2666:	b662      	cpsie	i
    2668:	e7e3      	b.n	2632 <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    266a:	790b      	ldrb	r3, [r1, #4]
    266c:	061c      	lsls	r4, r3, #24
    266e:	d5e5      	bpl.n	263c <uart0_status_isr+0x70>
		head = tx_buffer_head;
    2670:	4b16      	ldr	r3, [pc, #88]	; (26cc <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    2672:	4e17      	ldr	r6, [pc, #92]	; (26d0 <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    2674:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    2676:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    2678:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    267a:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    267c:	429c      	cmp	r4, r3
    267e:	d00e      	beq.n	269e <uart0_status_isr+0xd2>
    2680:	4d14      	ldr	r5, [pc, #80]	; (26d4 <uart0_status_isr+0x108>)
    2682:	e001      	b.n	2688 <uart0_status_isr+0xbc>
    2684:	42a3      	cmp	r3, r4
    2686:	d00a      	beq.n	269e <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    2688:	3301      	adds	r3, #1
    268a:	2b40      	cmp	r3, #64	; 0x40
    268c:	bf28      	it	cs
    268e:	2300      	movcs	r3, #0
			avail = UART0_S1;
    2690:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    2692:	5ce8      	ldrb	r0, [r5, r3]
    2694:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    2696:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    2698:	7d08      	ldrb	r0, [r1, #20]
    269a:	2807      	cmp	r0, #7
    269c:	d9f2      	bls.n	2684 <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    269e:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    26a0:	4903      	ldr	r1, [pc, #12]	; (26b0 <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    26a2:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    26a4:	790b      	ldrb	r3, [r1, #4]
    26a6:	0618      	lsls	r0, r3, #24
    26a8:	bf44      	itt	mi
    26aa:	237c      	movmi	r3, #124	; 0x7c
    26ac:	70cb      	strbmi	r3, [r1, #3]
    26ae:	e7c5      	b.n	263c <uart0_status_isr+0x70>
    26b0:	4006a000 	.word	0x4006a000
    26b4:	1fff96c0 	.word	0x1fff96c0
    26b8:	1fff963d 	.word	0x1fff963d
    26bc:	1fff9680 	.word	0x1fff9680
    26c0:	1fff9638 	.word	0x1fff9638
    26c4:	1fff96c4 	.word	0x1fff96c4
    26c8:	1fff963c 	.word	0x1fff963c
    26cc:	1fff96c8 	.word	0x1fff96c8
    26d0:	1fff96c1 	.word	0x1fff96c1
    26d4:	1fff9640 	.word	0x1fff9640

000026d8 <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    26d8:	4a05      	ldr	r2, [pc, #20]	; (26f0 <serial2_available+0x18>)
	tail = rx_buffer_tail;
    26da:	4b06      	ldr	r3, [pc, #24]	; (26f4 <serial2_available+0x1c>)
	head = rx_buffer_head;
    26dc:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    26de:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    26e0:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    26e2:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    26e4:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    26e6:	bf38      	it	cc
    26e8:	3040      	addcc	r0, #64	; 0x40
    26ea:	1ac0      	subs	r0, r0, r3
}
    26ec:	4770      	bx	lr
    26ee:	bf00      	nop
    26f0:	1fff973c 	.word	0x1fff973c
    26f4:	1fff96d1 	.word	0x1fff96d1

000026f8 <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    26f8:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    26fa:	4b38      	ldr	r3, [pc, #224]	; (27dc <uart1_status_isr+0xe4>)
    26fc:	791a      	ldrb	r2, [r3, #4]
    26fe:	f012 0f30 	tst.w	r2, #48	; 0x30
    2702:	d02c      	beq.n	275e <uart1_status_isr+0x66>
		__disable_irq();
    2704:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    2706:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2708:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    270c:	2900      	cmp	r1, #0
    270e:	d03d      	beq.n	278c <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2710:	b662      	cpsie	i
			head = rx_buffer_head;
    2712:	4f33      	ldr	r7, [pc, #204]	; (27e0 <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2714:	4933      	ldr	r1, [pc, #204]	; (27e4 <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    2716:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2718:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    271a:	4e33      	ldr	r6, [pc, #204]	; (27e8 <uart1_status_isr+0xf0>)
					n = UART1_D;
    271c:	461c      	mov	r4, r3
			head = rx_buffer_head;
    271e:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2720:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2722:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2724:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    2726:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2728:	bf28      	it	cs
    272a:	2300      	movcs	r3, #0
				if (newhead != tail) {
    272c:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    272e:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    2732:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2734:	bf1c      	itt	ne
    2736:	54f1      	strbne	r1, [r6, r3]
    2738:	4618      	movne	r0, r3
			} while (--avail > 0);
    273a:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    273e:	d1f0      	bne.n	2722 <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2740:	4b2a      	ldr	r3, [pc, #168]	; (27ec <uart1_status_isr+0xf4>)
    2742:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2744:	b2c2      	uxtb	r2, r0
    2746:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2748:	b14b      	cbz	r3, 275e <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    274a:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    274c:	bf36      	itet	cc
    274e:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2752:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2754:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2756:	2827      	cmp	r0, #39	; 0x27
    2758:	bfc4      	itt	gt
    275a:	2201      	movgt	r2, #1
    275c:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    275e:	491f      	ldr	r1, [pc, #124]	; (27dc <uart1_status_isr+0xe4>)
    2760:	78ca      	ldrb	r2, [r1, #3]
    2762:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2764:	0615      	lsls	r5, r2, #24
    2766:	d416      	bmi.n	2796 <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    2768:	0652      	lsls	r2, r2, #25
    276a:	d50d      	bpl.n	2788 <uart1_status_isr+0x90>
    276c:	4b1b      	ldr	r3, [pc, #108]	; (27dc <uart1_status_isr+0xe4>)
    276e:	791b      	ldrb	r3, [r3, #4]
    2770:	065b      	lsls	r3, r3, #25
    2772:	d509      	bpl.n	2788 <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2774:	4b1e      	ldr	r3, [pc, #120]	; (27f0 <uart1_status_isr+0xf8>)
		transmitting = 0;
    2776:	491f      	ldr	r1, [pc, #124]	; (27f4 <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2778:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    277a:	2200      	movs	r2, #0
    277c:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    277e:	b103      	cbz	r3, 2782 <uart1_status_isr+0x8a>
    2780:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    2782:	4b16      	ldr	r3, [pc, #88]	; (27dc <uart1_status_isr+0xe4>)
    2784:	223c      	movs	r2, #60	; 0x3c
    2786:	70da      	strb	r2, [r3, #3]
	}
}
    2788:	bcf0      	pop	{r4, r5, r6, r7}
    278a:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    278c:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    278e:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    2790:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    2792:	b662      	cpsie	i
    2794:	e7e3      	b.n	275e <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2796:	790b      	ldrb	r3, [r1, #4]
    2798:	061c      	lsls	r4, r3, #24
    279a:	d5e5      	bpl.n	2768 <uart1_status_isr+0x70>
		head = tx_buffer_head;
    279c:	4b16      	ldr	r3, [pc, #88]	; (27f8 <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    279e:	4e17      	ldr	r6, [pc, #92]	; (27fc <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    27a0:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    27a2:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    27a4:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    27a6:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    27a8:	429c      	cmp	r4, r3
    27aa:	d00e      	beq.n	27ca <uart1_status_isr+0xd2>
    27ac:	4d14      	ldr	r5, [pc, #80]	; (2800 <uart1_status_isr+0x108>)
    27ae:	e001      	b.n	27b4 <uart1_status_isr+0xbc>
    27b0:	42a3      	cmp	r3, r4
    27b2:	d00a      	beq.n	27ca <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    27b4:	3301      	adds	r3, #1
    27b6:	2b28      	cmp	r3, #40	; 0x28
    27b8:	bf28      	it	cs
    27ba:	2300      	movcs	r3, #0
			avail = UART1_S1;
    27bc:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    27be:	5ce8      	ldrb	r0, [r5, r3]
    27c0:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    27c2:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    27c4:	7d08      	ldrb	r0, [r1, #20]
    27c6:	2807      	cmp	r0, #7
    27c8:	d9f2      	bls.n	27b0 <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    27ca:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    27cc:	4903      	ldr	r1, [pc, #12]	; (27dc <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    27ce:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    27d0:	790b      	ldrb	r3, [r1, #4]
    27d2:	0618      	lsls	r0, r3, #24
    27d4:	bf44      	itt	mi
    27d6:	237c      	movmi	r3, #124	; 0x7c
    27d8:	70cb      	strbmi	r3, [r1, #3]
    27da:	e7c5      	b.n	2768 <uart1_status_isr+0x70>
    27dc:	4006b000 	.word	0x4006b000
    27e0:	1fff973c 	.word	0x1fff973c
    27e4:	1fff96d1 	.word	0x1fff96d1
    27e8:	1fff96fc 	.word	0x1fff96fc
    27ec:	1fff96cc 	.word	0x1fff96cc
    27f0:	1fff9740 	.word	0x1fff9740
    27f4:	1fff96d0 	.word	0x1fff96d0
    27f8:	1fff9744 	.word	0x1fff9744
    27fc:	1fff973d 	.word	0x1fff973d
    2800:	1fff96d4 	.word	0x1fff96d4

00002804 <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2804:	4a05      	ldr	r2, [pc, #20]	; (281c <serial3_available+0x18>)
	tail = rx_buffer_tail;
    2806:	4b06      	ldr	r3, [pc, #24]	; (2820 <serial3_available+0x1c>)
	head = rx_buffer_head;
    2808:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    280a:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    280c:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    280e:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2810:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    2812:	bf38      	it	cc
    2814:	3040      	addcc	r0, #64	; 0x40
    2816:	1ac0      	subs	r0, r0, r3
}
    2818:	4770      	bx	lr
    281a:	bf00      	nop
    281c:	1fff97b8 	.word	0x1fff97b8
    2820:	1fff974d 	.word	0x1fff974d

00002824 <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    2824:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    2826:	4b2b      	ldr	r3, [pc, #172]	; (28d4 <uart2_status_isr+0xb0>)
    2828:	791a      	ldrb	r2, [r3, #4]
    282a:	0694      	lsls	r4, r2, #26
    282c:	d51f      	bpl.n	286e <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    282e:	482a      	ldr	r0, [pc, #168]	; (28d8 <uart2_status_isr+0xb4>)
			n = UART2_D;
    2830:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    2832:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    2834:	4929      	ldr	r1, [pc, #164]	; (28dc <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    2836:	3301      	adds	r3, #1
    2838:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    283a:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    283c:	bfc8      	it	gt
    283e:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    2840:	428b      	cmp	r3, r1
			n = UART2_D;
    2842:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    2844:	d003      	beq.n	284e <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    2846:	4c26      	ldr	r4, [pc, #152]	; (28e0 <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    2848:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    284a:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    284c:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    284e:	4a25      	ldr	r2, [pc, #148]	; (28e4 <uart2_status_isr+0xc0>)
    2850:	6811      	ldr	r1, [r2, #0]
    2852:	b161      	cbz	r1, 286e <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    2854:	4a24      	ldr	r2, [pc, #144]	; (28e8 <uart2_status_isr+0xc4>)
    2856:	7812      	ldrb	r2, [r2, #0]
    2858:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    285a:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    285c:	bf36      	itet	cc
    285e:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    2862:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2864:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2866:	2b27      	cmp	r3, #39	; 0x27
    2868:	bfc4      	itt	gt
    286a:	2301      	movgt	r3, #1
    286c:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    286e:	4a19      	ldr	r2, [pc, #100]	; (28d4 <uart2_status_isr+0xb0>)
    2870:	78d3      	ldrb	r3, [r2, #3]
    2872:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2874:	0618      	lsls	r0, r3, #24
    2876:	d411      	bmi.n	289c <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    2878:	065a      	lsls	r2, r3, #25
    287a:	d50d      	bpl.n	2898 <uart2_status_isr+0x74>
    287c:	4b15      	ldr	r3, [pc, #84]	; (28d4 <uart2_status_isr+0xb0>)
    287e:	791b      	ldrb	r3, [r3, #4]
    2880:	065b      	lsls	r3, r3, #25
    2882:	d509      	bpl.n	2898 <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2884:	4b19      	ldr	r3, [pc, #100]	; (28ec <uart2_status_isr+0xc8>)
		transmitting = 0;
    2886:	491a      	ldr	r1, [pc, #104]	; (28f0 <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    2888:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    288a:	2200      	movs	r2, #0
    288c:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    288e:	b103      	cbz	r3, 2892 <uart2_status_isr+0x6e>
    2890:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    2892:	4b10      	ldr	r3, [pc, #64]	; (28d4 <uart2_status_isr+0xb0>)
    2894:	222c      	movs	r2, #44	; 0x2c
    2896:	70da      	strb	r2, [r3, #3]
	}
}
    2898:	bc30      	pop	{r4, r5}
    289a:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    289c:	7911      	ldrb	r1, [r2, #4]
    289e:	0609      	lsls	r1, r1, #24
    28a0:	d5ea      	bpl.n	2878 <uart2_status_isr+0x54>
		head = tx_buffer_head;
    28a2:	4914      	ldr	r1, [pc, #80]	; (28f4 <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    28a4:	4810      	ldr	r0, [pc, #64]	; (28e8 <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    28a6:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    28a8:	7801      	ldrb	r1, [r0, #0]
    28aa:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    28ac:	428c      	cmp	r4, r1
    28ae:	d00d      	beq.n	28cc <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    28b0:	1c4a      	adds	r2, r1, #1
    28b2:	2a27      	cmp	r2, #39	; 0x27
    28b4:	bf84      	itt	hi
    28b6:	2100      	movhi	r1, #0
    28b8:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    28ba:	4d0f      	ldr	r5, [pc, #60]	; (28f8 <uart2_status_isr+0xd4>)
			UART2_D = n;
    28bc:	4c05      	ldr	r4, [pc, #20]	; (28d4 <uart2_status_isr+0xb0>)
    28be:	bf98      	it	ls
    28c0:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    28c2:	5caa      	ldrb	r2, [r5, r2]
    28c4:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    28c6:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    28c8:	7001      	strb	r1, [r0, #0]
    28ca:	e7d5      	b.n	2878 <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    28cc:	216c      	movs	r1, #108	; 0x6c
    28ce:	70d1      	strb	r1, [r2, #3]
    28d0:	e7d2      	b.n	2878 <uart2_status_isr+0x54>
    28d2:	bf00      	nop
    28d4:	4006c000 	.word	0x4006c000
    28d8:	1fff97b8 	.word	0x1fff97b8
    28dc:	1fff974d 	.word	0x1fff974d
    28e0:	1fff9778 	.word	0x1fff9778
    28e4:	1fff9748 	.word	0x1fff9748
    28e8:	1fff97b9 	.word	0x1fff97b9
    28ec:	1fff97bc 	.word	0x1fff97bc
    28f0:	1fff974c 	.word	0x1fff974c
    28f4:	1fff97c0 	.word	0x1fff97c0
    28f8:	1fff9750 	.word	0x1fff9750

000028fc <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    28fc:	b570      	push	{r4, r5, r6, lr}
    28fe:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    2900:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2902:	4b30      	ldr	r3, [pc, #192]	; (29c4 <usb_init_serialnumber+0xc8>)
	FTFL_FCCOB0 = 0x41;
    2904:	4d30      	ldr	r5, [pc, #192]	; (29c8 <usb_init_serialnumber+0xcc>)
	FTFL_FCCOB1 = 15;
    2906:	4831      	ldr	r0, [pc, #196]	; (29cc <usb_init_serialnumber+0xd0>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2908:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    290a:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    290c:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    290e:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2910:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    2912:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2914:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    2916:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2918:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    291a:	7813      	ldrb	r3, [r2, #0]
    291c:	061b      	lsls	r3, r3, #24
    291e:	d5fc      	bpl.n	291a <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    2920:	4b2b      	ldr	r3, [pc, #172]	; (29d0 <usb_init_serialnumber+0xd4>)
    2922:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    2924:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    2926:	4b2b      	ldr	r3, [pc, #172]	; (29d4 <usb_init_serialnumber+0xd8>)
    2928:	4298      	cmp	r0, r3
    292a:	bf98      	it	ls
    292c:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    2930:	f04f 020a 	mov.w	r2, #10
	if (num < 10000000) num = num * 10;
    2934:	bf98      	it	ls
    2936:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    2938:	a901      	add	r1, sp, #4
    293a:	f7fe f917 	bl	b6c <ultoa>
	for (i=0; i<10; i++) {
		char c = buf[i];
    293e:	f89d 2004 	ldrb.w	r2, [sp, #4]
    2942:	4b25      	ldr	r3, [pc, #148]	; (29d8 <usb_init_serialnumber+0xdc>)
		if (!c) break;
    2944:	b352      	cbz	r2, 299c <usb_init_serialnumber+0xa0>
		char c = buf[i];
    2946:	f89d 1005 	ldrb.w	r1, [sp, #5]
		usb_string_serial_number_default.wString[i] = c;
    294a:	805a      	strh	r2, [r3, #2]
		if (!c) break;
    294c:	b361      	cbz	r1, 29a8 <usb_init_serialnumber+0xac>
		char c = buf[i];
    294e:	f89d 2006 	ldrb.w	r2, [sp, #6]
		usb_string_serial_number_default.wString[i] = c;
    2952:	8099      	strh	r1, [r3, #4]
		if (!c) break;
    2954:	b352      	cbz	r2, 29ac <usb_init_serialnumber+0xb0>
		char c = buf[i];
    2956:	f89d 1007 	ldrb.w	r1, [sp, #7]
		usb_string_serial_number_default.wString[i] = c;
    295a:	80da      	strh	r2, [r3, #6]
		if (!c) break;
    295c:	b341      	cbz	r1, 29b0 <usb_init_serialnumber+0xb4>
		char c = buf[i];
    295e:	f89d 2008 	ldrb.w	r2, [sp, #8]
		usb_string_serial_number_default.wString[i] = c;
    2962:	8119      	strh	r1, [r3, #8]
		if (!c) break;
    2964:	b332      	cbz	r2, 29b4 <usb_init_serialnumber+0xb8>
		char c = buf[i];
    2966:	f89d 1009 	ldrb.w	r1, [sp, #9]
		usb_string_serial_number_default.wString[i] = c;
    296a:	815a      	strh	r2, [r3, #10]
		if (!c) break;
    296c:	b321      	cbz	r1, 29b8 <usb_init_serialnumber+0xbc>
		char c = buf[i];
    296e:	f89d 200a 	ldrb.w	r2, [sp, #10]
		usb_string_serial_number_default.wString[i] = c;
    2972:	8199      	strh	r1, [r3, #12]
		if (!c) break;
    2974:	b312      	cbz	r2, 29bc <usb_init_serialnumber+0xc0>
		char c = buf[i];
    2976:	f89d 100b 	ldrb.w	r1, [sp, #11]
		usb_string_serial_number_default.wString[i] = c;
    297a:	81da      	strh	r2, [r3, #14]
		if (!c) break;
    297c:	b301      	cbz	r1, 29c0 <usb_init_serialnumber+0xc4>
		char c = buf[i];
    297e:	f89d 200c 	ldrb.w	r2, [sp, #12]
		usb_string_serial_number_default.wString[i] = c;
    2982:	8219      	strh	r1, [r3, #16]
		if (!c) break;
    2984:	b14a      	cbz	r2, 299a <usb_init_serialnumber+0x9e>
		char c = buf[i];
    2986:	f89d 100d 	ldrb.w	r1, [sp, #13]
		usb_string_serial_number_default.wString[i] = c;
    298a:	825a      	strh	r2, [r3, #18]
	for (i=0; i<10; i++) {
    298c:	2209      	movs	r2, #9
		if (!c) break;
    298e:	b129      	cbz	r1, 299c <usb_init_serialnumber+0xa0>
    2990:	2216      	movs	r2, #22
		usb_string_serial_number_default.wString[i] = c;
    2992:	8299      	strh	r1, [r3, #20]
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    2994:	701a      	strb	r2, [r3, #0]
}
    2996:	b004      	add	sp, #16
    2998:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    299a:	2208      	movs	r2, #8
    299c:	3201      	adds	r2, #1
    299e:	0052      	lsls	r2, r2, #1
    29a0:	b2d2      	uxtb	r2, r2
	usb_string_serial_number_default.bLength = i * 2 + 2;
    29a2:	701a      	strb	r2, [r3, #0]
}
    29a4:	b004      	add	sp, #16
    29a6:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    29a8:	2201      	movs	r2, #1
    29aa:	e7f7      	b.n	299c <usb_init_serialnumber+0xa0>
    29ac:	2202      	movs	r2, #2
    29ae:	e7f5      	b.n	299c <usb_init_serialnumber+0xa0>
    29b0:	2203      	movs	r2, #3
    29b2:	e7f3      	b.n	299c <usb_init_serialnumber+0xa0>
    29b4:	2204      	movs	r2, #4
    29b6:	e7f1      	b.n	299c <usb_init_serialnumber+0xa0>
    29b8:	2205      	movs	r2, #5
    29ba:	e7ef      	b.n	299c <usb_init_serialnumber+0xa0>
    29bc:	2206      	movs	r2, #6
    29be:	e7ed      	b.n	299c <usb_init_serialnumber+0xa0>
    29c0:	2207      	movs	r2, #7
    29c2:	e7eb      	b.n	299c <usb_init_serialnumber+0xa0>
    29c4:	40020000 	.word	0x40020000
    29c8:	40020007 	.word	0x40020007
    29cc:	40020006 	.word	0x40020006
    29d0:	40020008 	.word	0x40020008
    29d4:	0098967f 	.word	0x0098967f
    29d8:	1fff8988 	.word	0x1fff8988

000029dc <__aeabi_atexit>:
    29dc:	460b      	mov	r3, r1
    29de:	4601      	mov	r1, r0
    29e0:	4618      	mov	r0, r3
    29e2:	f000 ba5f 	b.w	2ea4 <__cxa_atexit>
    29e6:	bf00      	nop

000029e8 <__aeabi_frsub>:
    29e8:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
    29ec:	e002      	b.n	29f4 <__addsf3>
    29ee:	bf00      	nop

000029f0 <__aeabi_fsub>:
    29f0:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

000029f4 <__addsf3>:
    29f4:	0042      	lsls	r2, r0, #1
    29f6:	bf1f      	itttt	ne
    29f8:	ea5f 0341 	movsne.w	r3, r1, lsl #1
    29fc:	ea92 0f03 	teqne	r2, r3
    2a00:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
    2a04:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    2a08:	d06a      	beq.n	2ae0 <__addsf3+0xec>
    2a0a:	ea4f 6212 	mov.w	r2, r2, lsr #24
    2a0e:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
    2a12:	bfc1      	itttt	gt
    2a14:	18d2      	addgt	r2, r2, r3
    2a16:	4041      	eorgt	r1, r0
    2a18:	4048      	eorgt	r0, r1
    2a1a:	4041      	eorgt	r1, r0
    2a1c:	bfb8      	it	lt
    2a1e:	425b      	neglt	r3, r3
    2a20:	2b19      	cmp	r3, #25
    2a22:	bf88      	it	hi
    2a24:	4770      	bxhi	lr
    2a26:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
    2a2a:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2a2e:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    2a32:	bf18      	it	ne
    2a34:	4240      	negne	r0, r0
    2a36:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    2a3a:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
    2a3e:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
    2a42:	bf18      	it	ne
    2a44:	4249      	negne	r1, r1
    2a46:	ea92 0f03 	teq	r2, r3
    2a4a:	d03f      	beq.n	2acc <__addsf3+0xd8>
    2a4c:	f1a2 0201 	sub.w	r2, r2, #1
    2a50:	fa41 fc03 	asr.w	ip, r1, r3
    2a54:	eb10 000c 	adds.w	r0, r0, ip
    2a58:	f1c3 0320 	rsb	r3, r3, #32
    2a5c:	fa01 f103 	lsl.w	r1, r1, r3
    2a60:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    2a64:	d502      	bpl.n	2a6c <__addsf3+0x78>
    2a66:	4249      	negs	r1, r1
    2a68:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
    2a6c:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    2a70:	d313      	bcc.n	2a9a <__addsf3+0xa6>
    2a72:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
    2a76:	d306      	bcc.n	2a86 <__addsf3+0x92>
    2a78:	0840      	lsrs	r0, r0, #1
    2a7a:	ea4f 0131 	mov.w	r1, r1, rrx
    2a7e:	f102 0201 	add.w	r2, r2, #1
    2a82:	2afe      	cmp	r2, #254	; 0xfe
    2a84:	d251      	bcs.n	2b2a <__addsf3+0x136>
    2a86:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
    2a8a:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2a8e:	bf08      	it	eq
    2a90:	f020 0001 	biceq.w	r0, r0, #1
    2a94:	ea40 0003 	orr.w	r0, r0, r3
    2a98:	4770      	bx	lr
    2a9a:	0049      	lsls	r1, r1, #1
    2a9c:	eb40 0000 	adc.w	r0, r0, r0
    2aa0:	f410 0f00 	tst.w	r0, #8388608	; 0x800000
    2aa4:	f1a2 0201 	sub.w	r2, r2, #1
    2aa8:	d1ed      	bne.n	2a86 <__addsf3+0x92>
    2aaa:	fab0 fc80 	clz	ip, r0
    2aae:	f1ac 0c08 	sub.w	ip, ip, #8
    2ab2:	ebb2 020c 	subs.w	r2, r2, ip
    2ab6:	fa00 f00c 	lsl.w	r0, r0, ip
    2aba:	bfaa      	itet	ge
    2abc:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
    2ac0:	4252      	neglt	r2, r2
    2ac2:	4318      	orrge	r0, r3
    2ac4:	bfbc      	itt	lt
    2ac6:	40d0      	lsrlt	r0, r2
    2ac8:	4318      	orrlt	r0, r3
    2aca:	4770      	bx	lr
    2acc:	f092 0f00 	teq	r2, #0
    2ad0:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
    2ad4:	bf06      	itte	eq
    2ad6:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
    2ada:	3201      	addeq	r2, #1
    2adc:	3b01      	subne	r3, #1
    2ade:	e7b5      	b.n	2a4c <__addsf3+0x58>
    2ae0:	ea4f 0341 	mov.w	r3, r1, lsl #1
    2ae4:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    2ae8:	bf18      	it	ne
    2aea:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    2aee:	d021      	beq.n	2b34 <__addsf3+0x140>
    2af0:	ea92 0f03 	teq	r2, r3
    2af4:	d004      	beq.n	2b00 <__addsf3+0x10c>
    2af6:	f092 0f00 	teq	r2, #0
    2afa:	bf08      	it	eq
    2afc:	4608      	moveq	r0, r1
    2afe:	4770      	bx	lr
    2b00:	ea90 0f01 	teq	r0, r1
    2b04:	bf1c      	itt	ne
    2b06:	2000      	movne	r0, #0
    2b08:	4770      	bxne	lr
    2b0a:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
    2b0e:	d104      	bne.n	2b1a <__addsf3+0x126>
    2b10:	0040      	lsls	r0, r0, #1
    2b12:	bf28      	it	cs
    2b14:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
    2b18:	4770      	bx	lr
    2b1a:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
    2b1e:	bf3c      	itt	cc
    2b20:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
    2b24:	4770      	bxcc	lr
    2b26:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    2b2a:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
    2b2e:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2b32:	4770      	bx	lr
    2b34:	ea7f 6222 	mvns.w	r2, r2, asr #24
    2b38:	bf16      	itet	ne
    2b3a:	4608      	movne	r0, r1
    2b3c:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
    2b40:	4601      	movne	r1, r0
    2b42:	0242      	lsls	r2, r0, #9
    2b44:	bf06      	itte	eq
    2b46:	ea5f 2341 	movseq.w	r3, r1, lsl #9
    2b4a:	ea90 0f01 	teqeq	r0, r1
    2b4e:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
    2b52:	4770      	bx	lr

00002b54 <__aeabi_ui2f>:
    2b54:	f04f 0300 	mov.w	r3, #0
    2b58:	e004      	b.n	2b64 <__aeabi_i2f+0x8>
    2b5a:	bf00      	nop

00002b5c <__aeabi_i2f>:
    2b5c:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
    2b60:	bf48      	it	mi
    2b62:	4240      	negmi	r0, r0
    2b64:	ea5f 0c00 	movs.w	ip, r0
    2b68:	bf08      	it	eq
    2b6a:	4770      	bxeq	lr
    2b6c:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
    2b70:	4601      	mov	r1, r0
    2b72:	f04f 0000 	mov.w	r0, #0
    2b76:	e01c      	b.n	2bb2 <__aeabi_l2f+0x2a>

00002b78 <__aeabi_ul2f>:
    2b78:	ea50 0201 	orrs.w	r2, r0, r1
    2b7c:	bf08      	it	eq
    2b7e:	4770      	bxeq	lr
    2b80:	f04f 0300 	mov.w	r3, #0
    2b84:	e00a      	b.n	2b9c <__aeabi_l2f+0x14>
    2b86:	bf00      	nop

00002b88 <__aeabi_l2f>:
    2b88:	ea50 0201 	orrs.w	r2, r0, r1
    2b8c:	bf08      	it	eq
    2b8e:	4770      	bxeq	lr
    2b90:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
    2b94:	d502      	bpl.n	2b9c <__aeabi_l2f+0x14>
    2b96:	4240      	negs	r0, r0
    2b98:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    2b9c:	ea5f 0c01 	movs.w	ip, r1
    2ba0:	bf02      	ittt	eq
    2ba2:	4684      	moveq	ip, r0
    2ba4:	4601      	moveq	r1, r0
    2ba6:	2000      	moveq	r0, #0
    2ba8:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
    2bac:	bf08      	it	eq
    2bae:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
    2bb2:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
    2bb6:	fabc f28c 	clz	r2, ip
    2bba:	3a08      	subs	r2, #8
    2bbc:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
    2bc0:	db10      	blt.n	2be4 <__aeabi_l2f+0x5c>
    2bc2:	fa01 fc02 	lsl.w	ip, r1, r2
    2bc6:	4463      	add	r3, ip
    2bc8:	fa00 fc02 	lsl.w	ip, r0, r2
    2bcc:	f1c2 0220 	rsb	r2, r2, #32
    2bd0:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    2bd4:	fa20 f202 	lsr.w	r2, r0, r2
    2bd8:	eb43 0002 	adc.w	r0, r3, r2
    2bdc:	bf08      	it	eq
    2bde:	f020 0001 	biceq.w	r0, r0, #1
    2be2:	4770      	bx	lr
    2be4:	f102 0220 	add.w	r2, r2, #32
    2be8:	fa01 fc02 	lsl.w	ip, r1, r2
    2bec:	f1c2 0220 	rsb	r2, r2, #32
    2bf0:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
    2bf4:	fa21 f202 	lsr.w	r2, r1, r2
    2bf8:	eb43 0002 	adc.w	r0, r3, r2
    2bfc:	bf08      	it	eq
    2bfe:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    2c02:	4770      	bx	lr

00002c04 <__aeabi_fmul>:
    2c04:	f04f 0cff 	mov.w	ip, #255	; 0xff
    2c08:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    2c0c:	bf1e      	ittt	ne
    2c0e:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    2c12:	ea92 0f0c 	teqne	r2, ip
    2c16:	ea93 0f0c 	teqne	r3, ip
    2c1a:	d06f      	beq.n	2cfc <__aeabi_fmul+0xf8>
    2c1c:	441a      	add	r2, r3
    2c1e:	ea80 0c01 	eor.w	ip, r0, r1
    2c22:	0240      	lsls	r0, r0, #9
    2c24:	bf18      	it	ne
    2c26:	ea5f 2141 	movsne.w	r1, r1, lsl #9
    2c2a:	d01e      	beq.n	2c6a <__aeabi_fmul+0x66>
    2c2c:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
    2c30:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
    2c34:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
    2c38:	fba0 3101 	umull	r3, r1, r0, r1
    2c3c:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    2c40:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
    2c44:	bf3e      	ittt	cc
    2c46:	0049      	lslcc	r1, r1, #1
    2c48:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
    2c4c:	005b      	lslcc	r3, r3, #1
    2c4e:	ea40 0001 	orr.w	r0, r0, r1
    2c52:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
    2c56:	2afd      	cmp	r2, #253	; 0xfd
    2c58:	d81d      	bhi.n	2c96 <__aeabi_fmul+0x92>
    2c5a:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    2c5e:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2c62:	bf08      	it	eq
    2c64:	f020 0001 	biceq.w	r0, r0, #1
    2c68:	4770      	bx	lr
    2c6a:	f090 0f00 	teq	r0, #0
    2c6e:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    2c72:	bf08      	it	eq
    2c74:	0249      	lsleq	r1, r1, #9
    2c76:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    2c7a:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
    2c7e:	3a7f      	subs	r2, #127	; 0x7f
    2c80:	bfc2      	ittt	gt
    2c82:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    2c86:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    2c8a:	4770      	bxgt	lr
    2c8c:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2c90:	f04f 0300 	mov.w	r3, #0
    2c94:	3a01      	subs	r2, #1
    2c96:	dc5d      	bgt.n	2d54 <__aeabi_fmul+0x150>
    2c98:	f112 0f19 	cmn.w	r2, #25
    2c9c:	bfdc      	itt	le
    2c9e:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
    2ca2:	4770      	bxle	lr
    2ca4:	f1c2 0200 	rsb	r2, r2, #0
    2ca8:	0041      	lsls	r1, r0, #1
    2caa:	fa21 f102 	lsr.w	r1, r1, r2
    2cae:	f1c2 0220 	rsb	r2, r2, #32
    2cb2:	fa00 fc02 	lsl.w	ip, r0, r2
    2cb6:	ea5f 0031 	movs.w	r0, r1, rrx
    2cba:	f140 0000 	adc.w	r0, r0, #0
    2cbe:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
    2cc2:	bf08      	it	eq
    2cc4:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    2cc8:	4770      	bx	lr
    2cca:	f092 0f00 	teq	r2, #0
    2cce:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    2cd2:	bf02      	ittt	eq
    2cd4:	0040      	lsleq	r0, r0, #1
    2cd6:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    2cda:	3a01      	subeq	r2, #1
    2cdc:	d0f9      	beq.n	2cd2 <__aeabi_fmul+0xce>
    2cde:	ea40 000c 	orr.w	r0, r0, ip
    2ce2:	f093 0f00 	teq	r3, #0
    2ce6:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    2cea:	bf02      	ittt	eq
    2cec:	0049      	lsleq	r1, r1, #1
    2cee:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    2cf2:	3b01      	subeq	r3, #1
    2cf4:	d0f9      	beq.n	2cea <__aeabi_fmul+0xe6>
    2cf6:	ea41 010c 	orr.w	r1, r1, ip
    2cfa:	e78f      	b.n	2c1c <__aeabi_fmul+0x18>
    2cfc:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    2d00:	ea92 0f0c 	teq	r2, ip
    2d04:	bf18      	it	ne
    2d06:	ea93 0f0c 	teqne	r3, ip
    2d0a:	d00a      	beq.n	2d22 <__aeabi_fmul+0x11e>
    2d0c:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    2d10:	bf18      	it	ne
    2d12:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    2d16:	d1d8      	bne.n	2cca <__aeabi_fmul+0xc6>
    2d18:	ea80 0001 	eor.w	r0, r0, r1
    2d1c:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    2d20:	4770      	bx	lr
    2d22:	f090 0f00 	teq	r0, #0
    2d26:	bf17      	itett	ne
    2d28:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
    2d2c:	4608      	moveq	r0, r1
    2d2e:	f091 0f00 	teqne	r1, #0
    2d32:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
    2d36:	d014      	beq.n	2d62 <__aeabi_fmul+0x15e>
    2d38:	ea92 0f0c 	teq	r2, ip
    2d3c:	d101      	bne.n	2d42 <__aeabi_fmul+0x13e>
    2d3e:	0242      	lsls	r2, r0, #9
    2d40:	d10f      	bne.n	2d62 <__aeabi_fmul+0x15e>
    2d42:	ea93 0f0c 	teq	r3, ip
    2d46:	d103      	bne.n	2d50 <__aeabi_fmul+0x14c>
    2d48:	024b      	lsls	r3, r1, #9
    2d4a:	bf18      	it	ne
    2d4c:	4608      	movne	r0, r1
    2d4e:	d108      	bne.n	2d62 <__aeabi_fmul+0x15e>
    2d50:	ea80 0001 	eor.w	r0, r0, r1
    2d54:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    2d58:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    2d5c:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2d60:	4770      	bx	lr
    2d62:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    2d66:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
    2d6a:	4770      	bx	lr

00002d6c <__aeabi_fdiv>:
    2d6c:	f04f 0cff 	mov.w	ip, #255	; 0xff
    2d70:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    2d74:	bf1e      	ittt	ne
    2d76:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    2d7a:	ea92 0f0c 	teqne	r2, ip
    2d7e:	ea93 0f0c 	teqne	r3, ip
    2d82:	d069      	beq.n	2e58 <__aeabi_fdiv+0xec>
    2d84:	eba2 0203 	sub.w	r2, r2, r3
    2d88:	ea80 0c01 	eor.w	ip, r0, r1
    2d8c:	0249      	lsls	r1, r1, #9
    2d8e:	ea4f 2040 	mov.w	r0, r0, lsl #9
    2d92:	d037      	beq.n	2e04 <__aeabi_fdiv+0x98>
    2d94:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    2d98:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
    2d9c:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
    2da0:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    2da4:	428b      	cmp	r3, r1
    2da6:	bf38      	it	cc
    2da8:	005b      	lslcc	r3, r3, #1
    2daa:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
    2dae:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
    2db2:	428b      	cmp	r3, r1
    2db4:	bf24      	itt	cs
    2db6:	1a5b      	subcs	r3, r3, r1
    2db8:	ea40 000c 	orrcs.w	r0, r0, ip
    2dbc:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
    2dc0:	bf24      	itt	cs
    2dc2:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
    2dc6:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    2dca:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
    2dce:	bf24      	itt	cs
    2dd0:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
    2dd4:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    2dd8:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
    2ddc:	bf24      	itt	cs
    2dde:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
    2de2:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    2de6:	011b      	lsls	r3, r3, #4
    2de8:	bf18      	it	ne
    2dea:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
    2dee:	d1e0      	bne.n	2db2 <__aeabi_fdiv+0x46>
    2df0:	2afd      	cmp	r2, #253	; 0xfd
    2df2:	f63f af50 	bhi.w	2c96 <__aeabi_fmul+0x92>
    2df6:	428b      	cmp	r3, r1
    2df8:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    2dfc:	bf08      	it	eq
    2dfe:	f020 0001 	biceq.w	r0, r0, #1
    2e02:	4770      	bx	lr
    2e04:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    2e08:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    2e0c:	327f      	adds	r2, #127	; 0x7f
    2e0e:	bfc2      	ittt	gt
    2e10:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    2e14:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    2e18:	4770      	bxgt	lr
    2e1a:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    2e1e:	f04f 0300 	mov.w	r3, #0
    2e22:	3a01      	subs	r2, #1
    2e24:	e737      	b.n	2c96 <__aeabi_fmul+0x92>
    2e26:	f092 0f00 	teq	r2, #0
    2e2a:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    2e2e:	bf02      	ittt	eq
    2e30:	0040      	lsleq	r0, r0, #1
    2e32:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    2e36:	3a01      	subeq	r2, #1
    2e38:	d0f9      	beq.n	2e2e <__aeabi_fdiv+0xc2>
    2e3a:	ea40 000c 	orr.w	r0, r0, ip
    2e3e:	f093 0f00 	teq	r3, #0
    2e42:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    2e46:	bf02      	ittt	eq
    2e48:	0049      	lsleq	r1, r1, #1
    2e4a:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    2e4e:	3b01      	subeq	r3, #1
    2e50:	d0f9      	beq.n	2e46 <__aeabi_fdiv+0xda>
    2e52:	ea41 010c 	orr.w	r1, r1, ip
    2e56:	e795      	b.n	2d84 <__aeabi_fdiv+0x18>
    2e58:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    2e5c:	ea92 0f0c 	teq	r2, ip
    2e60:	d108      	bne.n	2e74 <__aeabi_fdiv+0x108>
    2e62:	0242      	lsls	r2, r0, #9
    2e64:	f47f af7d 	bne.w	2d62 <__aeabi_fmul+0x15e>
    2e68:	ea93 0f0c 	teq	r3, ip
    2e6c:	f47f af70 	bne.w	2d50 <__aeabi_fmul+0x14c>
    2e70:	4608      	mov	r0, r1
    2e72:	e776      	b.n	2d62 <__aeabi_fmul+0x15e>
    2e74:	ea93 0f0c 	teq	r3, ip
    2e78:	d104      	bne.n	2e84 <__aeabi_fdiv+0x118>
    2e7a:	024b      	lsls	r3, r1, #9
    2e7c:	f43f af4c 	beq.w	2d18 <__aeabi_fmul+0x114>
    2e80:	4608      	mov	r0, r1
    2e82:	e76e      	b.n	2d62 <__aeabi_fmul+0x15e>
    2e84:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    2e88:	bf18      	it	ne
    2e8a:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    2e8e:	d1ca      	bne.n	2e26 <__aeabi_fdiv+0xba>
    2e90:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
    2e94:	f47f af5c 	bne.w	2d50 <__aeabi_fmul+0x14c>
    2e98:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
    2e9c:	f47f af3c 	bne.w	2d18 <__aeabi_fmul+0x114>
    2ea0:	e75f      	b.n	2d62 <__aeabi_fmul+0x15e>
    2ea2:	bf00      	nop

00002ea4 <__cxa_atexit>:
    2ea4:	4613      	mov	r3, r2
    2ea6:	460a      	mov	r2, r1
    2ea8:	4601      	mov	r1, r0
    2eaa:	2002      	movs	r0, #2
    2eac:	f000 bb04 	b.w	34b8 <__register_exitproc>

00002eb0 <__errno>:
    2eb0:	4b01      	ldr	r3, [pc, #4]	; (2eb8 <__errno+0x8>)
    2eb2:	6818      	ldr	r0, [r3, #0]
    2eb4:	4770      	bx	lr
    2eb6:	bf00      	nop
    2eb8:	1fff8dc8 	.word	0x1fff8dc8

00002ebc <__libc_init_array>:
    2ebc:	b570      	push	{r4, r5, r6, lr}
    2ebe:	4e0f      	ldr	r6, [pc, #60]	; (2efc <__libc_init_array+0x40>)
    2ec0:	4d0f      	ldr	r5, [pc, #60]	; (2f00 <__libc_init_array+0x44>)
    2ec2:	1b76      	subs	r6, r6, r5
    2ec4:	10b6      	asrs	r6, r6, #2
    2ec6:	bf18      	it	ne
    2ec8:	2400      	movne	r4, #0
    2eca:	d005      	beq.n	2ed8 <__libc_init_array+0x1c>
    2ecc:	3401      	adds	r4, #1
    2ece:	f855 3b04 	ldr.w	r3, [r5], #4
    2ed2:	4798      	blx	r3
    2ed4:	42a6      	cmp	r6, r4
    2ed6:	d1f9      	bne.n	2ecc <__libc_init_array+0x10>
    2ed8:	4e0a      	ldr	r6, [pc, #40]	; (2f04 <__libc_init_array+0x48>)
    2eda:	4d0b      	ldr	r5, [pc, #44]	; (2f08 <__libc_init_array+0x4c>)
    2edc:	1b76      	subs	r6, r6, r5
    2ede:	f000 fd81 	bl	39e4 <_init>
    2ee2:	10b6      	asrs	r6, r6, #2
    2ee4:	bf18      	it	ne
    2ee6:	2400      	movne	r4, #0
    2ee8:	d006      	beq.n	2ef8 <__libc_init_array+0x3c>
    2eea:	3401      	adds	r4, #1
    2eec:	f855 3b04 	ldr.w	r3, [r5], #4
    2ef0:	4798      	blx	r3
    2ef2:	42a6      	cmp	r6, r4
    2ef4:	d1f9      	bne.n	2eea <__libc_init_array+0x2e>
    2ef6:	bd70      	pop	{r4, r5, r6, pc}
    2ef8:	bd70      	pop	{r4, r5, r6, pc}
    2efa:	bf00      	nop
    2efc:	000039f0 	.word	0x000039f0
    2f00:	000039f0 	.word	0x000039f0
    2f04:	000039fc 	.word	0x000039fc
    2f08:	000039f0 	.word	0x000039f0

00002f0c <malloc>:
    2f0c:	4b02      	ldr	r3, [pc, #8]	; (2f18 <malloc+0xc>)
    2f0e:	4601      	mov	r1, r0
    2f10:	6818      	ldr	r0, [r3, #0]
    2f12:	f000 b803 	b.w	2f1c <_malloc_r>
    2f16:	bf00      	nop
    2f18:	1fff8dc8 	.word	0x1fff8dc8

00002f1c <_malloc_r>:
    2f1c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2f20:	f101 050b 	add.w	r5, r1, #11
    2f24:	2d16      	cmp	r5, #22
    2f26:	b083      	sub	sp, #12
    2f28:	4606      	mov	r6, r0
    2f2a:	f240 809f 	bls.w	306c <_malloc_r+0x150>
    2f2e:	f035 0507 	bics.w	r5, r5, #7
    2f32:	f100 80bf 	bmi.w	30b4 <_malloc_r+0x198>
    2f36:	42a9      	cmp	r1, r5
    2f38:	f200 80bc 	bhi.w	30b4 <_malloc_r+0x198>
    2f3c:	f000 faa6 	bl	348c <__malloc_lock>
    2f40:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    2f44:	f0c0 829c 	bcc.w	3480 <_malloc_r+0x564>
    2f48:	0a6b      	lsrs	r3, r5, #9
    2f4a:	f000 80ba 	beq.w	30c2 <_malloc_r+0x1a6>
    2f4e:	2b04      	cmp	r3, #4
    2f50:	f200 8183 	bhi.w	325a <_malloc_r+0x33e>
    2f54:	09a8      	lsrs	r0, r5, #6
    2f56:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    2f5a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2f5e:	3038      	adds	r0, #56	; 0x38
    2f60:	4fc4      	ldr	r7, [pc, #784]	; (3274 <_malloc_r+0x358>)
    2f62:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    2f66:	f1a3 0108 	sub.w	r1, r3, #8
    2f6a:	685c      	ldr	r4, [r3, #4]
    2f6c:	42a1      	cmp	r1, r4
    2f6e:	d107      	bne.n	2f80 <_malloc_r+0x64>
    2f70:	e0ac      	b.n	30cc <_malloc_r+0x1b0>
    2f72:	2a00      	cmp	r2, #0
    2f74:	f280 80ac 	bge.w	30d0 <_malloc_r+0x1b4>
    2f78:	68e4      	ldr	r4, [r4, #12]
    2f7a:	42a1      	cmp	r1, r4
    2f7c:	f000 80a6 	beq.w	30cc <_malloc_r+0x1b0>
    2f80:	6863      	ldr	r3, [r4, #4]
    2f82:	f023 0303 	bic.w	r3, r3, #3
    2f86:	1b5a      	subs	r2, r3, r5
    2f88:	2a0f      	cmp	r2, #15
    2f8a:	ddf2      	ble.n	2f72 <_malloc_r+0x56>
    2f8c:	49b9      	ldr	r1, [pc, #740]	; (3274 <_malloc_r+0x358>)
    2f8e:	693c      	ldr	r4, [r7, #16]
    2f90:	f101 0e08 	add.w	lr, r1, #8
    2f94:	4574      	cmp	r4, lr
    2f96:	f000 81b3 	beq.w	3300 <_malloc_r+0x3e4>
    2f9a:	6863      	ldr	r3, [r4, #4]
    2f9c:	f023 0303 	bic.w	r3, r3, #3
    2fa0:	1b5a      	subs	r2, r3, r5
    2fa2:	2a0f      	cmp	r2, #15
    2fa4:	f300 8199 	bgt.w	32da <_malloc_r+0x3be>
    2fa8:	2a00      	cmp	r2, #0
    2faa:	f8c1 e014 	str.w	lr, [r1, #20]
    2fae:	f8c1 e010 	str.w	lr, [r1, #16]
    2fb2:	f280 809e 	bge.w	30f2 <_malloc_r+0x1d6>
    2fb6:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    2fba:	f080 8167 	bcs.w	328c <_malloc_r+0x370>
    2fbe:	08db      	lsrs	r3, r3, #3
    2fc0:	f103 0c01 	add.w	ip, r3, #1
    2fc4:	2201      	movs	r2, #1
    2fc6:	109b      	asrs	r3, r3, #2
    2fc8:	fa02 f303 	lsl.w	r3, r2, r3
    2fcc:	684a      	ldr	r2, [r1, #4]
    2fce:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    2fd2:	f8c4 8008 	str.w	r8, [r4, #8]
    2fd6:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    2fda:	431a      	orrs	r2, r3
    2fdc:	f1a9 0308 	sub.w	r3, r9, #8
    2fe0:	60e3      	str	r3, [r4, #12]
    2fe2:	604a      	str	r2, [r1, #4]
    2fe4:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    2fe8:	f8c8 400c 	str.w	r4, [r8, #12]
    2fec:	1083      	asrs	r3, r0, #2
    2fee:	2401      	movs	r4, #1
    2ff0:	409c      	lsls	r4, r3
    2ff2:	4294      	cmp	r4, r2
    2ff4:	f200 808a 	bhi.w	310c <_malloc_r+0x1f0>
    2ff8:	4214      	tst	r4, r2
    2ffa:	d106      	bne.n	300a <_malloc_r+0xee>
    2ffc:	f020 0003 	bic.w	r0, r0, #3
    3000:	0064      	lsls	r4, r4, #1
    3002:	4214      	tst	r4, r2
    3004:	f100 0004 	add.w	r0, r0, #4
    3008:	d0fa      	beq.n	3000 <_malloc_r+0xe4>
    300a:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    300e:	46cc      	mov	ip, r9
    3010:	4680      	mov	r8, r0
    3012:	f8dc 100c 	ldr.w	r1, [ip, #12]
    3016:	458c      	cmp	ip, r1
    3018:	d107      	bne.n	302a <_malloc_r+0x10e>
    301a:	e173      	b.n	3304 <_malloc_r+0x3e8>
    301c:	2a00      	cmp	r2, #0
    301e:	f280 8181 	bge.w	3324 <_malloc_r+0x408>
    3022:	68c9      	ldr	r1, [r1, #12]
    3024:	458c      	cmp	ip, r1
    3026:	f000 816d 	beq.w	3304 <_malloc_r+0x3e8>
    302a:	684b      	ldr	r3, [r1, #4]
    302c:	f023 0303 	bic.w	r3, r3, #3
    3030:	1b5a      	subs	r2, r3, r5
    3032:	2a0f      	cmp	r2, #15
    3034:	ddf2      	ble.n	301c <_malloc_r+0x100>
    3036:	460c      	mov	r4, r1
    3038:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    303c:	f854 8f08 	ldr.w	r8, [r4, #8]!
    3040:	194b      	adds	r3, r1, r5
    3042:	f045 0501 	orr.w	r5, r5, #1
    3046:	604d      	str	r5, [r1, #4]
    3048:	f042 0101 	orr.w	r1, r2, #1
    304c:	f8c8 c00c 	str.w	ip, [r8, #12]
    3050:	4630      	mov	r0, r6
    3052:	f8cc 8008 	str.w	r8, [ip, #8]
    3056:	617b      	str	r3, [r7, #20]
    3058:	613b      	str	r3, [r7, #16]
    305a:	f8c3 e00c 	str.w	lr, [r3, #12]
    305e:	f8c3 e008 	str.w	lr, [r3, #8]
    3062:	6059      	str	r1, [r3, #4]
    3064:	509a      	str	r2, [r3, r2]
    3066:	f000 fa13 	bl	3490 <__malloc_unlock>
    306a:	e01f      	b.n	30ac <_malloc_r+0x190>
    306c:	2910      	cmp	r1, #16
    306e:	d821      	bhi.n	30b4 <_malloc_r+0x198>
    3070:	f000 fa0c 	bl	348c <__malloc_lock>
    3074:	2510      	movs	r5, #16
    3076:	2306      	movs	r3, #6
    3078:	2002      	movs	r0, #2
    307a:	4f7e      	ldr	r7, [pc, #504]	; (3274 <_malloc_r+0x358>)
    307c:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    3080:	f1a3 0208 	sub.w	r2, r3, #8
    3084:	685c      	ldr	r4, [r3, #4]
    3086:	4294      	cmp	r4, r2
    3088:	f000 8145 	beq.w	3316 <_malloc_r+0x3fa>
    308c:	6863      	ldr	r3, [r4, #4]
    308e:	68e1      	ldr	r1, [r4, #12]
    3090:	68a5      	ldr	r5, [r4, #8]
    3092:	f023 0303 	bic.w	r3, r3, #3
    3096:	4423      	add	r3, r4
    3098:	4630      	mov	r0, r6
    309a:	685a      	ldr	r2, [r3, #4]
    309c:	60e9      	str	r1, [r5, #12]
    309e:	f042 0201 	orr.w	r2, r2, #1
    30a2:	608d      	str	r5, [r1, #8]
    30a4:	605a      	str	r2, [r3, #4]
    30a6:	f000 f9f3 	bl	3490 <__malloc_unlock>
    30aa:	3408      	adds	r4, #8
    30ac:	4620      	mov	r0, r4
    30ae:	b003      	add	sp, #12
    30b0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    30b4:	2400      	movs	r4, #0
    30b6:	230c      	movs	r3, #12
    30b8:	4620      	mov	r0, r4
    30ba:	6033      	str	r3, [r6, #0]
    30bc:	b003      	add	sp, #12
    30be:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    30c2:	2380      	movs	r3, #128	; 0x80
    30c4:	f04f 0e40 	mov.w	lr, #64	; 0x40
    30c8:	203f      	movs	r0, #63	; 0x3f
    30ca:	e749      	b.n	2f60 <_malloc_r+0x44>
    30cc:	4670      	mov	r0, lr
    30ce:	e75d      	b.n	2f8c <_malloc_r+0x70>
    30d0:	4423      	add	r3, r4
    30d2:	68e1      	ldr	r1, [r4, #12]
    30d4:	685a      	ldr	r2, [r3, #4]
    30d6:	68a5      	ldr	r5, [r4, #8]
    30d8:	f042 0201 	orr.w	r2, r2, #1
    30dc:	60e9      	str	r1, [r5, #12]
    30de:	4630      	mov	r0, r6
    30e0:	608d      	str	r5, [r1, #8]
    30e2:	605a      	str	r2, [r3, #4]
    30e4:	f000 f9d4 	bl	3490 <__malloc_unlock>
    30e8:	3408      	adds	r4, #8
    30ea:	4620      	mov	r0, r4
    30ec:	b003      	add	sp, #12
    30ee:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    30f2:	4423      	add	r3, r4
    30f4:	4630      	mov	r0, r6
    30f6:	685a      	ldr	r2, [r3, #4]
    30f8:	f042 0201 	orr.w	r2, r2, #1
    30fc:	605a      	str	r2, [r3, #4]
    30fe:	f000 f9c7 	bl	3490 <__malloc_unlock>
    3102:	3408      	adds	r4, #8
    3104:	4620      	mov	r0, r4
    3106:	b003      	add	sp, #12
    3108:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    310c:	68bc      	ldr	r4, [r7, #8]
    310e:	6863      	ldr	r3, [r4, #4]
    3110:	f023 0803 	bic.w	r8, r3, #3
    3114:	45a8      	cmp	r8, r5
    3116:	d304      	bcc.n	3122 <_malloc_r+0x206>
    3118:	ebc5 0308 	rsb	r3, r5, r8
    311c:	2b0f      	cmp	r3, #15
    311e:	f300 808c 	bgt.w	323a <_malloc_r+0x31e>
    3122:	4b55      	ldr	r3, [pc, #340]	; (3278 <_malloc_r+0x35c>)
    3124:	f8df 9160 	ldr.w	r9, [pc, #352]	; 3288 <_malloc_r+0x36c>
    3128:	681a      	ldr	r2, [r3, #0]
    312a:	f8d9 3000 	ldr.w	r3, [r9]
    312e:	3301      	adds	r3, #1
    3130:	442a      	add	r2, r5
    3132:	eb04 0a08 	add.w	sl, r4, r8
    3136:	f000 8160 	beq.w	33fa <_malloc_r+0x4de>
    313a:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    313e:	320f      	adds	r2, #15
    3140:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    3144:	f022 020f 	bic.w	r2, r2, #15
    3148:	4611      	mov	r1, r2
    314a:	4630      	mov	r0, r6
    314c:	9201      	str	r2, [sp, #4]
    314e:	f000 f9a1 	bl	3494 <_sbrk_r>
    3152:	f1b0 3fff 	cmp.w	r0, #4294967295
    3156:	4683      	mov	fp, r0
    3158:	9a01      	ldr	r2, [sp, #4]
    315a:	f000 8158 	beq.w	340e <_malloc_r+0x4f2>
    315e:	4582      	cmp	sl, r0
    3160:	f200 80fc 	bhi.w	335c <_malloc_r+0x440>
    3164:	4b45      	ldr	r3, [pc, #276]	; (327c <_malloc_r+0x360>)
    3166:	6819      	ldr	r1, [r3, #0]
    3168:	45da      	cmp	sl, fp
    316a:	4411      	add	r1, r2
    316c:	6019      	str	r1, [r3, #0]
    316e:	f000 8153 	beq.w	3418 <_malloc_r+0x4fc>
    3172:	f8d9 0000 	ldr.w	r0, [r9]
    3176:	f8df e110 	ldr.w	lr, [pc, #272]	; 3288 <_malloc_r+0x36c>
    317a:	3001      	adds	r0, #1
    317c:	bf1b      	ittet	ne
    317e:	ebca 0a0b 	rsbne	sl, sl, fp
    3182:	4451      	addne	r1, sl
    3184:	f8ce b000 	streq.w	fp, [lr]
    3188:	6019      	strne	r1, [r3, #0]
    318a:	f01b 0107 	ands.w	r1, fp, #7
    318e:	f000 8117 	beq.w	33c0 <_malloc_r+0x4a4>
    3192:	f1c1 0008 	rsb	r0, r1, #8
    3196:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    319a:	4483      	add	fp, r0
    319c:	3108      	adds	r1, #8
    319e:	445a      	add	r2, fp
    31a0:	f3c2 020b 	ubfx	r2, r2, #0, #12
    31a4:	ebc2 0901 	rsb	r9, r2, r1
    31a8:	4649      	mov	r1, r9
    31aa:	4630      	mov	r0, r6
    31ac:	9301      	str	r3, [sp, #4]
    31ae:	f000 f971 	bl	3494 <_sbrk_r>
    31b2:	1c43      	adds	r3, r0, #1
    31b4:	9b01      	ldr	r3, [sp, #4]
    31b6:	f000 813f 	beq.w	3438 <_malloc_r+0x51c>
    31ba:	ebcb 0200 	rsb	r2, fp, r0
    31be:	444a      	add	r2, r9
    31c0:	f042 0201 	orr.w	r2, r2, #1
    31c4:	6819      	ldr	r1, [r3, #0]
    31c6:	f8c7 b008 	str.w	fp, [r7, #8]
    31ca:	4449      	add	r1, r9
    31cc:	42bc      	cmp	r4, r7
    31ce:	f8cb 2004 	str.w	r2, [fp, #4]
    31d2:	6019      	str	r1, [r3, #0]
    31d4:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 327c <_malloc_r+0x360>
    31d8:	d016      	beq.n	3208 <_malloc_r+0x2ec>
    31da:	f1b8 0f0f 	cmp.w	r8, #15
    31de:	f240 80fd 	bls.w	33dc <_malloc_r+0x4c0>
    31e2:	6862      	ldr	r2, [r4, #4]
    31e4:	f1a8 030c 	sub.w	r3, r8, #12
    31e8:	f023 0307 	bic.w	r3, r3, #7
    31ec:	18e0      	adds	r0, r4, r3
    31ee:	f002 0201 	and.w	r2, r2, #1
    31f2:	f04f 0e05 	mov.w	lr, #5
    31f6:	431a      	orrs	r2, r3
    31f8:	2b0f      	cmp	r3, #15
    31fa:	6062      	str	r2, [r4, #4]
    31fc:	f8c0 e004 	str.w	lr, [r0, #4]
    3200:	f8c0 e008 	str.w	lr, [r0, #8]
    3204:	f200 811c 	bhi.w	3440 <_malloc_r+0x524>
    3208:	4b1d      	ldr	r3, [pc, #116]	; (3280 <_malloc_r+0x364>)
    320a:	68bc      	ldr	r4, [r7, #8]
    320c:	681a      	ldr	r2, [r3, #0]
    320e:	4291      	cmp	r1, r2
    3210:	bf88      	it	hi
    3212:	6019      	strhi	r1, [r3, #0]
    3214:	4b1b      	ldr	r3, [pc, #108]	; (3284 <_malloc_r+0x368>)
    3216:	681a      	ldr	r2, [r3, #0]
    3218:	4291      	cmp	r1, r2
    321a:	6862      	ldr	r2, [r4, #4]
    321c:	bf88      	it	hi
    321e:	6019      	strhi	r1, [r3, #0]
    3220:	f022 0203 	bic.w	r2, r2, #3
    3224:	4295      	cmp	r5, r2
    3226:	eba2 0305 	sub.w	r3, r2, r5
    322a:	d801      	bhi.n	3230 <_malloc_r+0x314>
    322c:	2b0f      	cmp	r3, #15
    322e:	dc04      	bgt.n	323a <_malloc_r+0x31e>
    3230:	4630      	mov	r0, r6
    3232:	f000 f92d 	bl	3490 <__malloc_unlock>
    3236:	2400      	movs	r4, #0
    3238:	e738      	b.n	30ac <_malloc_r+0x190>
    323a:	1962      	adds	r2, r4, r5
    323c:	f043 0301 	orr.w	r3, r3, #1
    3240:	f045 0501 	orr.w	r5, r5, #1
    3244:	6065      	str	r5, [r4, #4]
    3246:	4630      	mov	r0, r6
    3248:	60ba      	str	r2, [r7, #8]
    324a:	6053      	str	r3, [r2, #4]
    324c:	f000 f920 	bl	3490 <__malloc_unlock>
    3250:	3408      	adds	r4, #8
    3252:	4620      	mov	r0, r4
    3254:	b003      	add	sp, #12
    3256:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    325a:	2b14      	cmp	r3, #20
    325c:	d971      	bls.n	3342 <_malloc_r+0x426>
    325e:	2b54      	cmp	r3, #84	; 0x54
    3260:	f200 80a4 	bhi.w	33ac <_malloc_r+0x490>
    3264:	0b28      	lsrs	r0, r5, #12
    3266:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    326a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    326e:	306e      	adds	r0, #110	; 0x6e
    3270:	e676      	b.n	2f60 <_malloc_r+0x44>
    3272:	bf00      	nop
    3274:	1fff8dcc 	.word	0x1fff8dcc
    3278:	1fff97cc 	.word	0x1fff97cc
    327c:	1fff97d0 	.word	0x1fff97d0
    3280:	1fff97c8 	.word	0x1fff97c8
    3284:	1fff97c4 	.word	0x1fff97c4
    3288:	1fff91d8 	.word	0x1fff91d8
    328c:	0a5a      	lsrs	r2, r3, #9
    328e:	2a04      	cmp	r2, #4
    3290:	d95e      	bls.n	3350 <_malloc_r+0x434>
    3292:	2a14      	cmp	r2, #20
    3294:	f200 80b3 	bhi.w	33fe <_malloc_r+0x4e2>
    3298:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    329c:	0049      	lsls	r1, r1, #1
    329e:	325b      	adds	r2, #91	; 0x5b
    32a0:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    32a4:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    32a8:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 3488 <_malloc_r+0x56c>
    32ac:	f1ac 0c08 	sub.w	ip, ip, #8
    32b0:	458c      	cmp	ip, r1
    32b2:	f000 8088 	beq.w	33c6 <_malloc_r+0x4aa>
    32b6:	684a      	ldr	r2, [r1, #4]
    32b8:	f022 0203 	bic.w	r2, r2, #3
    32bc:	4293      	cmp	r3, r2
    32be:	d202      	bcs.n	32c6 <_malloc_r+0x3aa>
    32c0:	6889      	ldr	r1, [r1, #8]
    32c2:	458c      	cmp	ip, r1
    32c4:	d1f7      	bne.n	32b6 <_malloc_r+0x39a>
    32c6:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    32ca:	687a      	ldr	r2, [r7, #4]
    32cc:	f8c4 c00c 	str.w	ip, [r4, #12]
    32d0:	60a1      	str	r1, [r4, #8]
    32d2:	f8cc 4008 	str.w	r4, [ip, #8]
    32d6:	60cc      	str	r4, [r1, #12]
    32d8:	e688      	b.n	2fec <_malloc_r+0xd0>
    32da:	1963      	adds	r3, r4, r5
    32dc:	f042 0701 	orr.w	r7, r2, #1
    32e0:	f045 0501 	orr.w	r5, r5, #1
    32e4:	6065      	str	r5, [r4, #4]
    32e6:	4630      	mov	r0, r6
    32e8:	614b      	str	r3, [r1, #20]
    32ea:	610b      	str	r3, [r1, #16]
    32ec:	f8c3 e00c 	str.w	lr, [r3, #12]
    32f0:	f8c3 e008 	str.w	lr, [r3, #8]
    32f4:	605f      	str	r7, [r3, #4]
    32f6:	509a      	str	r2, [r3, r2]
    32f8:	3408      	adds	r4, #8
    32fa:	f000 f8c9 	bl	3490 <__malloc_unlock>
    32fe:	e6d5      	b.n	30ac <_malloc_r+0x190>
    3300:	684a      	ldr	r2, [r1, #4]
    3302:	e673      	b.n	2fec <_malloc_r+0xd0>
    3304:	f108 0801 	add.w	r8, r8, #1
    3308:	f018 0f03 	tst.w	r8, #3
    330c:	f10c 0c08 	add.w	ip, ip, #8
    3310:	f47f ae7f 	bne.w	3012 <_malloc_r+0xf6>
    3314:	e030      	b.n	3378 <_malloc_r+0x45c>
    3316:	68dc      	ldr	r4, [r3, #12]
    3318:	42a3      	cmp	r3, r4
    331a:	bf08      	it	eq
    331c:	3002      	addeq	r0, #2
    331e:	f43f ae35 	beq.w	2f8c <_malloc_r+0x70>
    3322:	e6b3      	b.n	308c <_malloc_r+0x170>
    3324:	440b      	add	r3, r1
    3326:	460c      	mov	r4, r1
    3328:	685a      	ldr	r2, [r3, #4]
    332a:	68c9      	ldr	r1, [r1, #12]
    332c:	f854 5f08 	ldr.w	r5, [r4, #8]!
    3330:	f042 0201 	orr.w	r2, r2, #1
    3334:	605a      	str	r2, [r3, #4]
    3336:	4630      	mov	r0, r6
    3338:	60e9      	str	r1, [r5, #12]
    333a:	608d      	str	r5, [r1, #8]
    333c:	f000 f8a8 	bl	3490 <__malloc_unlock>
    3340:	e6b4      	b.n	30ac <_malloc_r+0x190>
    3342:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    3346:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    334a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    334e:	e607      	b.n	2f60 <_malloc_r+0x44>
    3350:	099a      	lsrs	r2, r3, #6
    3352:	f102 0139 	add.w	r1, r2, #57	; 0x39
    3356:	0049      	lsls	r1, r1, #1
    3358:	3238      	adds	r2, #56	; 0x38
    335a:	e7a1      	b.n	32a0 <_malloc_r+0x384>
    335c:	42bc      	cmp	r4, r7
    335e:	4b4a      	ldr	r3, [pc, #296]	; (3488 <_malloc_r+0x56c>)
    3360:	f43f af00 	beq.w	3164 <_malloc_r+0x248>
    3364:	689c      	ldr	r4, [r3, #8]
    3366:	6862      	ldr	r2, [r4, #4]
    3368:	f022 0203 	bic.w	r2, r2, #3
    336c:	e75a      	b.n	3224 <_malloc_r+0x308>
    336e:	f859 3908 	ldr.w	r3, [r9], #-8
    3372:	4599      	cmp	r9, r3
    3374:	f040 8082 	bne.w	347c <_malloc_r+0x560>
    3378:	f010 0f03 	tst.w	r0, #3
    337c:	f100 30ff 	add.w	r0, r0, #4294967295
    3380:	d1f5      	bne.n	336e <_malloc_r+0x452>
    3382:	687b      	ldr	r3, [r7, #4]
    3384:	ea23 0304 	bic.w	r3, r3, r4
    3388:	607b      	str	r3, [r7, #4]
    338a:	0064      	lsls	r4, r4, #1
    338c:	429c      	cmp	r4, r3
    338e:	f63f aebd 	bhi.w	310c <_malloc_r+0x1f0>
    3392:	2c00      	cmp	r4, #0
    3394:	f43f aeba 	beq.w	310c <_malloc_r+0x1f0>
    3398:	421c      	tst	r4, r3
    339a:	4640      	mov	r0, r8
    339c:	f47f ae35 	bne.w	300a <_malloc_r+0xee>
    33a0:	0064      	lsls	r4, r4, #1
    33a2:	421c      	tst	r4, r3
    33a4:	f100 0004 	add.w	r0, r0, #4
    33a8:	d0fa      	beq.n	33a0 <_malloc_r+0x484>
    33aa:	e62e      	b.n	300a <_malloc_r+0xee>
    33ac:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    33b0:	d818      	bhi.n	33e4 <_malloc_r+0x4c8>
    33b2:	0be8      	lsrs	r0, r5, #15
    33b4:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    33b8:	ea4f 034e 	mov.w	r3, lr, lsl #1
    33bc:	3077      	adds	r0, #119	; 0x77
    33be:	e5cf      	b.n	2f60 <_malloc_r+0x44>
    33c0:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    33c4:	e6eb      	b.n	319e <_malloc_r+0x282>
    33c6:	2101      	movs	r1, #1
    33c8:	f8d8 3004 	ldr.w	r3, [r8, #4]
    33cc:	1092      	asrs	r2, r2, #2
    33ce:	fa01 f202 	lsl.w	r2, r1, r2
    33d2:	431a      	orrs	r2, r3
    33d4:	f8c8 2004 	str.w	r2, [r8, #4]
    33d8:	4661      	mov	r1, ip
    33da:	e777      	b.n	32cc <_malloc_r+0x3b0>
    33dc:	2301      	movs	r3, #1
    33de:	f8cb 3004 	str.w	r3, [fp, #4]
    33e2:	e725      	b.n	3230 <_malloc_r+0x314>
    33e4:	f240 5254 	movw	r2, #1364	; 0x554
    33e8:	4293      	cmp	r3, r2
    33ea:	d820      	bhi.n	342e <_malloc_r+0x512>
    33ec:	0ca8      	lsrs	r0, r5, #18
    33ee:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    33f2:	ea4f 034e 	mov.w	r3, lr, lsl #1
    33f6:	307c      	adds	r0, #124	; 0x7c
    33f8:	e5b2      	b.n	2f60 <_malloc_r+0x44>
    33fa:	3210      	adds	r2, #16
    33fc:	e6a4      	b.n	3148 <_malloc_r+0x22c>
    33fe:	2a54      	cmp	r2, #84	; 0x54
    3400:	d826      	bhi.n	3450 <_malloc_r+0x534>
    3402:	0b1a      	lsrs	r2, r3, #12
    3404:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    3408:	0049      	lsls	r1, r1, #1
    340a:	326e      	adds	r2, #110	; 0x6e
    340c:	e748      	b.n	32a0 <_malloc_r+0x384>
    340e:	68bc      	ldr	r4, [r7, #8]
    3410:	6862      	ldr	r2, [r4, #4]
    3412:	f022 0203 	bic.w	r2, r2, #3
    3416:	e705      	b.n	3224 <_malloc_r+0x308>
    3418:	f3ca 000b 	ubfx	r0, sl, #0, #12
    341c:	2800      	cmp	r0, #0
    341e:	f47f aea8 	bne.w	3172 <_malloc_r+0x256>
    3422:	4442      	add	r2, r8
    3424:	68bb      	ldr	r3, [r7, #8]
    3426:	f042 0201 	orr.w	r2, r2, #1
    342a:	605a      	str	r2, [r3, #4]
    342c:	e6ec      	b.n	3208 <_malloc_r+0x2ec>
    342e:	23fe      	movs	r3, #254	; 0xfe
    3430:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    3434:	207e      	movs	r0, #126	; 0x7e
    3436:	e593      	b.n	2f60 <_malloc_r+0x44>
    3438:	2201      	movs	r2, #1
    343a:	f04f 0900 	mov.w	r9, #0
    343e:	e6c1      	b.n	31c4 <_malloc_r+0x2a8>
    3440:	f104 0108 	add.w	r1, r4, #8
    3444:	4630      	mov	r0, r6
    3446:	f000 f8fb 	bl	3640 <_free_r>
    344a:	f8d9 1000 	ldr.w	r1, [r9]
    344e:	e6db      	b.n	3208 <_malloc_r+0x2ec>
    3450:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    3454:	d805      	bhi.n	3462 <_malloc_r+0x546>
    3456:	0bda      	lsrs	r2, r3, #15
    3458:	f102 0178 	add.w	r1, r2, #120	; 0x78
    345c:	0049      	lsls	r1, r1, #1
    345e:	3277      	adds	r2, #119	; 0x77
    3460:	e71e      	b.n	32a0 <_malloc_r+0x384>
    3462:	f240 5154 	movw	r1, #1364	; 0x554
    3466:	428a      	cmp	r2, r1
    3468:	d805      	bhi.n	3476 <_malloc_r+0x55a>
    346a:	0c9a      	lsrs	r2, r3, #18
    346c:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    3470:	0049      	lsls	r1, r1, #1
    3472:	327c      	adds	r2, #124	; 0x7c
    3474:	e714      	b.n	32a0 <_malloc_r+0x384>
    3476:	21fe      	movs	r1, #254	; 0xfe
    3478:	227e      	movs	r2, #126	; 0x7e
    347a:	e711      	b.n	32a0 <_malloc_r+0x384>
    347c:	687b      	ldr	r3, [r7, #4]
    347e:	e784      	b.n	338a <_malloc_r+0x46e>
    3480:	08e8      	lsrs	r0, r5, #3
    3482:	1c43      	adds	r3, r0, #1
    3484:	005b      	lsls	r3, r3, #1
    3486:	e5f8      	b.n	307a <_malloc_r+0x15e>
    3488:	1fff8dcc 	.word	0x1fff8dcc

0000348c <__malloc_lock>:
    348c:	4770      	bx	lr
    348e:	bf00      	nop

00003490 <__malloc_unlock>:
    3490:	4770      	bx	lr
    3492:	bf00      	nop

00003494 <_sbrk_r>:
    3494:	b538      	push	{r3, r4, r5, lr}
    3496:	4c07      	ldr	r4, [pc, #28]	; (34b4 <_sbrk_r+0x20>)
    3498:	2300      	movs	r3, #0
    349a:	4605      	mov	r5, r0
    349c:	4608      	mov	r0, r1
    349e:	6023      	str	r3, [r4, #0]
    34a0:	f7fd fb4e 	bl	b40 <_sbrk>
    34a4:	1c43      	adds	r3, r0, #1
    34a6:	d000      	beq.n	34aa <_sbrk_r+0x16>
    34a8:	bd38      	pop	{r3, r4, r5, pc}
    34aa:	6823      	ldr	r3, [r4, #0]
    34ac:	2b00      	cmp	r3, #0
    34ae:	d0fb      	beq.n	34a8 <_sbrk_r+0x14>
    34b0:	602b      	str	r3, [r5, #0]
    34b2:	bd38      	pop	{r3, r4, r5, pc}
    34b4:	1fff980c 	.word	0x1fff980c

000034b8 <__register_exitproc>:
    34b8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    34bc:	4c25      	ldr	r4, [pc, #148]	; (3554 <__register_exitproc+0x9c>)
    34be:	6825      	ldr	r5, [r4, #0]
    34c0:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    34c4:	4606      	mov	r6, r0
    34c6:	4688      	mov	r8, r1
    34c8:	4692      	mov	sl, r2
    34ca:	4699      	mov	r9, r3
    34cc:	b3c4      	cbz	r4, 3540 <__register_exitproc+0x88>
    34ce:	6860      	ldr	r0, [r4, #4]
    34d0:	281f      	cmp	r0, #31
    34d2:	dc17      	bgt.n	3504 <__register_exitproc+0x4c>
    34d4:	1c43      	adds	r3, r0, #1
    34d6:	b176      	cbz	r6, 34f6 <__register_exitproc+0x3e>
    34d8:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    34dc:	2201      	movs	r2, #1
    34de:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    34e2:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    34e6:	4082      	lsls	r2, r0
    34e8:	4311      	orrs	r1, r2
    34ea:	2e02      	cmp	r6, #2
    34ec:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    34f0:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    34f4:	d01e      	beq.n	3534 <__register_exitproc+0x7c>
    34f6:	3002      	adds	r0, #2
    34f8:	6063      	str	r3, [r4, #4]
    34fa:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    34fe:	2000      	movs	r0, #0
    3500:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    3504:	4b14      	ldr	r3, [pc, #80]	; (3558 <__register_exitproc+0xa0>)
    3506:	b303      	cbz	r3, 354a <__register_exitproc+0x92>
    3508:	f44f 70c8 	mov.w	r0, #400	; 0x190
    350c:	f7ff fcfe 	bl	2f0c <malloc>
    3510:	4604      	mov	r4, r0
    3512:	b1d0      	cbz	r0, 354a <__register_exitproc+0x92>
    3514:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    3518:	2700      	movs	r7, #0
    351a:	e880 0088 	stmia.w	r0, {r3, r7}
    351e:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    3522:	4638      	mov	r0, r7
    3524:	2301      	movs	r3, #1
    3526:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    352a:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    352e:	2e00      	cmp	r6, #0
    3530:	d0e1      	beq.n	34f6 <__register_exitproc+0x3e>
    3532:	e7d1      	b.n	34d8 <__register_exitproc+0x20>
    3534:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    3538:	430a      	orrs	r2, r1
    353a:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    353e:	e7da      	b.n	34f6 <__register_exitproc+0x3e>
    3540:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    3544:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    3548:	e7c1      	b.n	34ce <__register_exitproc+0x16>
    354a:	f04f 30ff 	mov.w	r0, #4294967295
    354e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    3552:	bf00      	nop
    3554:	000039e0 	.word	0x000039e0
    3558:	00002f0d 	.word	0x00002f0d

0000355c <register_fini>:
    355c:	4b02      	ldr	r3, [pc, #8]	; (3568 <register_fini+0xc>)
    355e:	b113      	cbz	r3, 3566 <register_fini+0xa>
    3560:	4802      	ldr	r0, [pc, #8]	; (356c <register_fini+0x10>)
    3562:	f000 b805 	b.w	3570 <atexit>
    3566:	4770      	bx	lr
    3568:	00000000 	.word	0x00000000
    356c:	0000357d 	.word	0x0000357d

00003570 <atexit>:
    3570:	2300      	movs	r3, #0
    3572:	4601      	mov	r1, r0
    3574:	461a      	mov	r2, r3
    3576:	4618      	mov	r0, r3
    3578:	f7ff bf9e 	b.w	34b8 <__register_exitproc>

0000357c <__libc_fini_array>:
    357c:	b538      	push	{r3, r4, r5, lr}
    357e:	4d07      	ldr	r5, [pc, #28]	; (359c <__libc_fini_array+0x20>)
    3580:	4c07      	ldr	r4, [pc, #28]	; (35a0 <__libc_fini_array+0x24>)
    3582:	1b2c      	subs	r4, r5, r4
    3584:	10a4      	asrs	r4, r4, #2
    3586:	d005      	beq.n	3594 <__libc_fini_array+0x18>
    3588:	3c01      	subs	r4, #1
    358a:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    358e:	4798      	blx	r3
    3590:	2c00      	cmp	r4, #0
    3592:	d1f9      	bne.n	3588 <__libc_fini_array+0xc>
    3594:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    3598:	f000 ba30 	b.w	39fc <__init_array_end>
	...

000035a4 <_malloc_trim_r>:
    35a4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    35a6:	4f23      	ldr	r7, [pc, #140]	; (3634 <_malloc_trim_r+0x90>)
    35a8:	460c      	mov	r4, r1
    35aa:	4606      	mov	r6, r0
    35ac:	f7ff ff6e 	bl	348c <__malloc_lock>
    35b0:	68bb      	ldr	r3, [r7, #8]
    35b2:	685d      	ldr	r5, [r3, #4]
    35b4:	f025 0503 	bic.w	r5, r5, #3
    35b8:	1b29      	subs	r1, r5, r4
    35ba:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    35be:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    35c2:	f021 010f 	bic.w	r1, r1, #15
    35c6:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    35ca:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    35ce:	db07      	blt.n	35e0 <_malloc_trim_r+0x3c>
    35d0:	2100      	movs	r1, #0
    35d2:	4630      	mov	r0, r6
    35d4:	f7ff ff5e 	bl	3494 <_sbrk_r>
    35d8:	68bb      	ldr	r3, [r7, #8]
    35da:	442b      	add	r3, r5
    35dc:	4298      	cmp	r0, r3
    35de:	d004      	beq.n	35ea <_malloc_trim_r+0x46>
    35e0:	4630      	mov	r0, r6
    35e2:	f7ff ff55 	bl	3490 <__malloc_unlock>
    35e6:	2000      	movs	r0, #0
    35e8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    35ea:	4261      	negs	r1, r4
    35ec:	4630      	mov	r0, r6
    35ee:	f7ff ff51 	bl	3494 <_sbrk_r>
    35f2:	3001      	adds	r0, #1
    35f4:	d00d      	beq.n	3612 <_malloc_trim_r+0x6e>
    35f6:	4b10      	ldr	r3, [pc, #64]	; (3638 <_malloc_trim_r+0x94>)
    35f8:	68ba      	ldr	r2, [r7, #8]
    35fa:	6819      	ldr	r1, [r3, #0]
    35fc:	1b2d      	subs	r5, r5, r4
    35fe:	f045 0501 	orr.w	r5, r5, #1
    3602:	4630      	mov	r0, r6
    3604:	1b09      	subs	r1, r1, r4
    3606:	6055      	str	r5, [r2, #4]
    3608:	6019      	str	r1, [r3, #0]
    360a:	f7ff ff41 	bl	3490 <__malloc_unlock>
    360e:	2001      	movs	r0, #1
    3610:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    3612:	2100      	movs	r1, #0
    3614:	4630      	mov	r0, r6
    3616:	f7ff ff3d 	bl	3494 <_sbrk_r>
    361a:	68ba      	ldr	r2, [r7, #8]
    361c:	1a83      	subs	r3, r0, r2
    361e:	2b0f      	cmp	r3, #15
    3620:	ddde      	ble.n	35e0 <_malloc_trim_r+0x3c>
    3622:	4c06      	ldr	r4, [pc, #24]	; (363c <_malloc_trim_r+0x98>)
    3624:	4904      	ldr	r1, [pc, #16]	; (3638 <_malloc_trim_r+0x94>)
    3626:	6824      	ldr	r4, [r4, #0]
    3628:	f043 0301 	orr.w	r3, r3, #1
    362c:	1b00      	subs	r0, r0, r4
    362e:	6053      	str	r3, [r2, #4]
    3630:	6008      	str	r0, [r1, #0]
    3632:	e7d5      	b.n	35e0 <_malloc_trim_r+0x3c>
    3634:	1fff8dcc 	.word	0x1fff8dcc
    3638:	1fff97d0 	.word	0x1fff97d0
    363c:	1fff91d8 	.word	0x1fff91d8

00003640 <_free_r>:
    3640:	2900      	cmp	r1, #0
    3642:	d045      	beq.n	36d0 <_free_r+0x90>
    3644:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    3648:	460d      	mov	r5, r1
    364a:	4680      	mov	r8, r0
    364c:	f7ff ff1e 	bl	348c <__malloc_lock>
    3650:	f855 7c04 	ldr.w	r7, [r5, #-4]
    3654:	496a      	ldr	r1, [pc, #424]	; (3800 <_free_r+0x1c0>)
    3656:	f027 0301 	bic.w	r3, r7, #1
    365a:	f1a5 0408 	sub.w	r4, r5, #8
    365e:	18e2      	adds	r2, r4, r3
    3660:	688e      	ldr	r6, [r1, #8]
    3662:	6850      	ldr	r0, [r2, #4]
    3664:	42b2      	cmp	r2, r6
    3666:	f020 0003 	bic.w	r0, r0, #3
    366a:	d062      	beq.n	3732 <_free_r+0xf2>
    366c:	07fe      	lsls	r6, r7, #31
    366e:	6050      	str	r0, [r2, #4]
    3670:	d40b      	bmi.n	368a <_free_r+0x4a>
    3672:	f855 7c08 	ldr.w	r7, [r5, #-8]
    3676:	1be4      	subs	r4, r4, r7
    3678:	f101 0e08 	add.w	lr, r1, #8
    367c:	68a5      	ldr	r5, [r4, #8]
    367e:	4575      	cmp	r5, lr
    3680:	443b      	add	r3, r7
    3682:	d06f      	beq.n	3764 <_free_r+0x124>
    3684:	68e7      	ldr	r7, [r4, #12]
    3686:	60ef      	str	r7, [r5, #12]
    3688:	60bd      	str	r5, [r7, #8]
    368a:	1815      	adds	r5, r2, r0
    368c:	686d      	ldr	r5, [r5, #4]
    368e:	07ed      	lsls	r5, r5, #31
    3690:	d542      	bpl.n	3718 <_free_r+0xd8>
    3692:	f043 0201 	orr.w	r2, r3, #1
    3696:	6062      	str	r2, [r4, #4]
    3698:	50e3      	str	r3, [r4, r3]
    369a:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    369e:	d218      	bcs.n	36d2 <_free_r+0x92>
    36a0:	08db      	lsrs	r3, r3, #3
    36a2:	1c5a      	adds	r2, r3, #1
    36a4:	684d      	ldr	r5, [r1, #4]
    36a6:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    36aa:	60a7      	str	r7, [r4, #8]
    36ac:	2001      	movs	r0, #1
    36ae:	109b      	asrs	r3, r3, #2
    36b0:	fa00 f303 	lsl.w	r3, r0, r3
    36b4:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    36b8:	431d      	orrs	r5, r3
    36ba:	3808      	subs	r0, #8
    36bc:	60e0      	str	r0, [r4, #12]
    36be:	604d      	str	r5, [r1, #4]
    36c0:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    36c4:	60fc      	str	r4, [r7, #12]
    36c6:	4640      	mov	r0, r8
    36c8:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    36cc:	f7ff bee0 	b.w	3490 <__malloc_unlock>
    36d0:	4770      	bx	lr
    36d2:	0a5a      	lsrs	r2, r3, #9
    36d4:	2a04      	cmp	r2, #4
    36d6:	d853      	bhi.n	3780 <_free_r+0x140>
    36d8:	099a      	lsrs	r2, r3, #6
    36da:	f102 0739 	add.w	r7, r2, #57	; 0x39
    36de:	007f      	lsls	r7, r7, #1
    36e0:	f102 0538 	add.w	r5, r2, #56	; 0x38
    36e4:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    36e8:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    36ec:	4944      	ldr	r1, [pc, #272]	; (3800 <_free_r+0x1c0>)
    36ee:	3808      	subs	r0, #8
    36f0:	4290      	cmp	r0, r2
    36f2:	d04d      	beq.n	3790 <_free_r+0x150>
    36f4:	6851      	ldr	r1, [r2, #4]
    36f6:	f021 0103 	bic.w	r1, r1, #3
    36fa:	428b      	cmp	r3, r1
    36fc:	d202      	bcs.n	3704 <_free_r+0xc4>
    36fe:	6892      	ldr	r2, [r2, #8]
    3700:	4290      	cmp	r0, r2
    3702:	d1f7      	bne.n	36f4 <_free_r+0xb4>
    3704:	68d0      	ldr	r0, [r2, #12]
    3706:	60e0      	str	r0, [r4, #12]
    3708:	60a2      	str	r2, [r4, #8]
    370a:	6084      	str	r4, [r0, #8]
    370c:	60d4      	str	r4, [r2, #12]
    370e:	4640      	mov	r0, r8
    3710:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3714:	f7ff bebc 	b.w	3490 <__malloc_unlock>
    3718:	6895      	ldr	r5, [r2, #8]
    371a:	4f3a      	ldr	r7, [pc, #232]	; (3804 <_free_r+0x1c4>)
    371c:	42bd      	cmp	r5, r7
    371e:	4403      	add	r3, r0
    3720:	d03f      	beq.n	37a2 <_free_r+0x162>
    3722:	68d0      	ldr	r0, [r2, #12]
    3724:	60e8      	str	r0, [r5, #12]
    3726:	f043 0201 	orr.w	r2, r3, #1
    372a:	6085      	str	r5, [r0, #8]
    372c:	6062      	str	r2, [r4, #4]
    372e:	50e3      	str	r3, [r4, r3]
    3730:	e7b3      	b.n	369a <_free_r+0x5a>
    3732:	07ff      	lsls	r7, r7, #31
    3734:	4403      	add	r3, r0
    3736:	d407      	bmi.n	3748 <_free_r+0x108>
    3738:	f855 2c08 	ldr.w	r2, [r5, #-8]
    373c:	1aa4      	subs	r4, r4, r2
    373e:	4413      	add	r3, r2
    3740:	68a0      	ldr	r0, [r4, #8]
    3742:	68e2      	ldr	r2, [r4, #12]
    3744:	60c2      	str	r2, [r0, #12]
    3746:	6090      	str	r0, [r2, #8]
    3748:	4a2f      	ldr	r2, [pc, #188]	; (3808 <_free_r+0x1c8>)
    374a:	6812      	ldr	r2, [r2, #0]
    374c:	f043 0001 	orr.w	r0, r3, #1
    3750:	4293      	cmp	r3, r2
    3752:	6060      	str	r0, [r4, #4]
    3754:	608c      	str	r4, [r1, #8]
    3756:	d3b6      	bcc.n	36c6 <_free_r+0x86>
    3758:	4b2c      	ldr	r3, [pc, #176]	; (380c <_free_r+0x1cc>)
    375a:	4640      	mov	r0, r8
    375c:	6819      	ldr	r1, [r3, #0]
    375e:	f7ff ff21 	bl	35a4 <_malloc_trim_r>
    3762:	e7b0      	b.n	36c6 <_free_r+0x86>
    3764:	1811      	adds	r1, r2, r0
    3766:	6849      	ldr	r1, [r1, #4]
    3768:	07c9      	lsls	r1, r1, #31
    376a:	d444      	bmi.n	37f6 <_free_r+0x1b6>
    376c:	6891      	ldr	r1, [r2, #8]
    376e:	68d2      	ldr	r2, [r2, #12]
    3770:	60ca      	str	r2, [r1, #12]
    3772:	4403      	add	r3, r0
    3774:	f043 0001 	orr.w	r0, r3, #1
    3778:	6091      	str	r1, [r2, #8]
    377a:	6060      	str	r0, [r4, #4]
    377c:	50e3      	str	r3, [r4, r3]
    377e:	e7a2      	b.n	36c6 <_free_r+0x86>
    3780:	2a14      	cmp	r2, #20
    3782:	d817      	bhi.n	37b4 <_free_r+0x174>
    3784:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    3788:	007f      	lsls	r7, r7, #1
    378a:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    378e:	e7a9      	b.n	36e4 <_free_r+0xa4>
    3790:	10aa      	asrs	r2, r5, #2
    3792:	684b      	ldr	r3, [r1, #4]
    3794:	2501      	movs	r5, #1
    3796:	fa05 f202 	lsl.w	r2, r5, r2
    379a:	4313      	orrs	r3, r2
    379c:	604b      	str	r3, [r1, #4]
    379e:	4602      	mov	r2, r0
    37a0:	e7b1      	b.n	3706 <_free_r+0xc6>
    37a2:	f043 0201 	orr.w	r2, r3, #1
    37a6:	614c      	str	r4, [r1, #20]
    37a8:	610c      	str	r4, [r1, #16]
    37aa:	60e5      	str	r5, [r4, #12]
    37ac:	60a5      	str	r5, [r4, #8]
    37ae:	6062      	str	r2, [r4, #4]
    37b0:	50e3      	str	r3, [r4, r3]
    37b2:	e788      	b.n	36c6 <_free_r+0x86>
    37b4:	2a54      	cmp	r2, #84	; 0x54
    37b6:	d806      	bhi.n	37c6 <_free_r+0x186>
    37b8:	0b1a      	lsrs	r2, r3, #12
    37ba:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    37be:	007f      	lsls	r7, r7, #1
    37c0:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    37c4:	e78e      	b.n	36e4 <_free_r+0xa4>
    37c6:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    37ca:	d806      	bhi.n	37da <_free_r+0x19a>
    37cc:	0bda      	lsrs	r2, r3, #15
    37ce:	f102 0778 	add.w	r7, r2, #120	; 0x78
    37d2:	007f      	lsls	r7, r7, #1
    37d4:	f102 0577 	add.w	r5, r2, #119	; 0x77
    37d8:	e784      	b.n	36e4 <_free_r+0xa4>
    37da:	f240 5054 	movw	r0, #1364	; 0x554
    37de:	4282      	cmp	r2, r0
    37e0:	d806      	bhi.n	37f0 <_free_r+0x1b0>
    37e2:	0c9a      	lsrs	r2, r3, #18
    37e4:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    37e8:	007f      	lsls	r7, r7, #1
    37ea:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    37ee:	e779      	b.n	36e4 <_free_r+0xa4>
    37f0:	27fe      	movs	r7, #254	; 0xfe
    37f2:	257e      	movs	r5, #126	; 0x7e
    37f4:	e776      	b.n	36e4 <_free_r+0xa4>
    37f6:	f043 0201 	orr.w	r2, r3, #1
    37fa:	6062      	str	r2, [r4, #4]
    37fc:	50e3      	str	r3, [r4, r3]
    37fe:	e762      	b.n	36c6 <_free_r+0x86>
    3800:	1fff8dcc 	.word	0x1fff8dcc
    3804:	1fff8dd4 	.word	0x1fff8dd4
    3808:	1fff91d4 	.word	0x1fff91d4
    380c:	1fff97cc 	.word	0x1fff97cc
    3810:	736e6553 	.word	0x736e6553
    3814:	4f20726f 	.word	0x4f20726f
    3818:	6950206e 	.word	0x6950206e
    381c:	0000206e 	.word	0x0000206e
    3820:	6d6f4320 	.word	0x6d6f4320
    3824:	74656c70 	.word	0x74656c70
    3828:	ffff0065 	.word	0xffff0065
    382c:	74696e49 	.word	0x74696e49
    3830:	746e4920 	.word	0x746e4920
    3834:	75727265 	.word	0x75727265
    3838:	20737470 	.word	0x20737470
    383c:	0000202d 	.word	0x0000202d
    3840:	706d6f43 	.word	0x706d6f43
    3844:	6574656c 	.word	0x6574656c
    3848:	00000000 	.word	0x00000000
    384c:	ffff0a0d 	.word	0xffff0a0d

00003850 <digital_pin_to_info_PGM>:
    3850:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    3860:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    3870:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    3880:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    3890:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    38a0:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    38b0:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    38c0:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    38d0:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    38e0:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    38f0:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    3900:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    3910:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    3920:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    3930:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    3940:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    3950:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

00003960 <vtable for usb_serial_class>:
	...
    3968:	00001d3d 00001d35 00001d31 00001d2d     =...5...1...-...
    3978:	00001d29 00001d25 00001d21 00001d1d     )...%...!.......

00003988 <usb_endpoint_config_table>:
    3988:	15191500                                ....

0000398c <usb_descriptor_list>:
    398c:	00000100 1fff88fc 00000012 00000200     ................
    399c:	1fff8928 00000043 00000300 1fff8984     (...C...........
    39ac:	00000000 04090301 1fff8910 00000000     ................
    39bc:	04090302 1fff896c 00000000 04090303     ....l...........
    39cc:	1fff8988 00000000 00000000 00000000     ................
    39dc:	00000000                                ....

000039e0 <_global_impure_ptr>:
    39e0:	1fff89a0                                ....

000039e4 <_init>:
    39e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    39e6:	bf00      	nop
    39e8:	bcf8      	pop	{r3, r4, r5, r6, r7}
    39ea:	bc08      	pop	{r3}
    39ec:	469e      	mov	lr, r3
    39ee:	4770      	bx	lr

000039f0 <__init_array_start>:
    39f0:	0000355d 	.word	0x0000355d

000039f4 <__frame_dummy_init_array_entry>:
    39f4:	00000435 0000093d                       5...=...

Disassembly of section .fini:

000039fc <_fini>:
    39fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    39fe:	bf00      	nop

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
1fff8748:	1fff88dc 	.word	0x1fff88dc

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
1fff8774:	1fff88bc 	.word	0x1fff88bc

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
1fff87a0:	1fff888c 	.word	0x1fff888c

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
1fff87cc:	1fff883c 	.word	0x1fff883c

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
1fff87f8:	1fff8804 	.word	0x1fff8804

1fff87fc <__dso_handle>:
1fff87fc:	00000000                                ....

1fff8800 <__brkval>:
1fff8800:	1fff9810                                ....

1fff8804 <isr_table_portA>:
1fff8804:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff8814:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff8824:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff8834:	00000bb9 00000bb9                       ........

1fff883c <isr_table_portB>:
1fff883c:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff884c:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff885c:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff886c:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff887c:	00000bb9 00000bb9 00000bb9 00000bb9     ................

1fff888c <isr_table_portC>:
1fff888c:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff889c:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff88ac:	00000bb9 00000bb9 00000bb9 00000bb9     ................

1fff88bc <isr_table_portD>:
1fff88bc:	00000bb9 00000bb9 00000bb9 00000bb9     ................
1fff88cc:	00000bb9 00000bb9 00000bb9 00000bb9     ................

1fff88dc <isr_table_portE>:
1fff88dc:	00000bb9 00000bb9                       ........

1fff88e4 <Serial>:
1fff88e4:	00003968 00000000 000003e8 00000000     h9..............

1fff88f4 <usb_buffer_available>:
1fff88f4:	ffffffff                                ....

1fff88f8 <analog_config_bits>:
1fff88f8:	                                         .

1fff88f9 <analog_num_average>:
1fff88f9:	                                         ...

1fff88fc <device_descriptor>:
1fff88fc:	01010112 40000002 048316c0 02010200     .......@........
1fff890c:	00000103                                ....

1fff8910 <usb_string_manufacturer_name_default>:
1fff8910:	00540318 00650065 0073006e 00640079     ..T.e.e.n.s.y.d.
1fff8920:	00690075 006f006e                       u.i.n.o.

1fff8928 <config_descriptor>:
1fff8928:	00430209 c0000102 00040932 02020100     ..C.....2.......
1fff8938:	24050001 05011000 01010124 06022404     ...$....$....$..
1fff8948:	00062405 82050701 40001003 00010409     .$.........@....
1fff8958:	00000a02 03050700 00004002 02840507     .........@......
1fff8968:	00000040                                @...

1fff896c <usb_string_product_name_default>:
1fff896c:	00550316 00420053 00530020 00720065     ..U.S.B. .S.e.r.
1fff897c:	00610069 0000006c                       i.a.l...

1fff8984 <string0>:
1fff8984:	04090304                                ....

1fff8988 <usb_string_serial_number_default>:
1fff8988:	0000030c 00000000 00000000 00000000     ................
	...

1fff89a0 <impure_data>:
1fff89a0:	00000000 1fff8c8c 1fff8cf4 1fff8d5c     ............\...
	...
1fff8a48:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
1fff8a58:	0005deec 0000000b 00000000 00000000     ................
	...

1fff8dc8 <_impure_ptr>:
1fff8dc8:	1fff89a0                                ....

1fff8dcc <__malloc_av_>:
	...
1fff8dd4:	1fff8dcc 1fff8dcc 1fff8dd4 1fff8dd4     ................
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

1fff91d4 <__malloc_trim_threshold>:
1fff91d4:	00020000                                ....

1fff91d8 <__malloc_sbrk_base>:
1fff91d8:	ffffffff                                ....
