
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 4d 09 00 00 05 09 00 00     ... ....M.......
      10:	05 09 00 00 05 09 00 00 05 09 00 00 05 09 00 00     ................
      20:	05 09 00 00 05 09 00 00 05 09 00 00 4d 09 00 00     ............M...
      30:	4d 09 00 00 05 09 00 00 99 20 00 00 d5 22 00 00     M........ ..."..
      40:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      50:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      60:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      70:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      80:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      90:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      a0:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      b0:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      c0:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      d0:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      e0:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
      f0:	4d 09 00 00 f1 23 00 00 4d 09 00 00 1d 25 00 00     M....#..M....%..
     100:	4d 09 00 00 49 26 00 00 4d 09 00 00 4d 09 00 00     M...I&..M...M...
     110:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     120:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     130:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     140:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     150:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     160:	4d 09 00 00 b5 0f 00 00 4d 09 00 00 4d 09 00 00     M.......M...M...
     170:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     180:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     190:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     1a0:	4d 09 00 00 4d 09 00 00 4d 09 00 00 4d 09 00 00     M...M...M...M...
     1b0:	4d 09 00 00 4d 09 00 00 4d 09 00 00                 M...M...M...

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
     1d0:	f000 fbc0 	bl	954 <startup_early_hook>
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
     2d6:	f000 fc15 	bl	b04 <_init_Teensyduino_internal_>

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
     2e4:	f000 fbfc 	bl	ae0 <rtc_set>
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
     302:	f000 fbed 	bl	ae0 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f002 fa8b 	bl	2824 <__libc_init_array>

	startup_late_hook();
     30e:	f000 fb27 	bl	960 <startup_late_hook>
	main();
     312:	f000 f997 	bl	644 <main>
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
     33c:	0000336c 	.word	0x0000336c
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91ec 	.word	0x1fff91ec
     348:	1fff95c4 	.word	0x1fff95c4
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
     380:	5ab29dfe 	.word	0x5ab29dfe
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
     430:	00003368 	.word	0x00003368

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
     460:	00003368 	.word	0x00003368
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
     47c:	f000 fa20 	bl	8c0 <memset>

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
     498:	f105 021c 	add.w	r2, r5, #28
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
     4ac:	4d13      	ldr	r5, [pc, #76]	; (4fc <SensorNode::Init()+0x54>)
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     4ae:	4814      	ldr	r0, [pc, #80]	; (500 <SensorNode::Init()+0x58>)
     4b0:	210e      	movs	r1, #14
     4b2:	f001 fc07 	bl	1cc4 <usb_serial_write>
     4b6:	69e1      	ldr	r1, [r4, #28]
     4b8:	4628      	mov	r0, r5
     4ba:	f000 f909 	bl	6d0 <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
     4be:	7f20      	ldrb	r0, [r4, #28]
     4c0:	2100      	movs	r1, #0
     4c2:	f000 fc13 	bl	cec <pinMode>
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
     4c6:	f894 0020 	ldrb.w	r0, [r4, #32]
     4ca:	2100      	movs	r1, #0
     4cc:	f000 fc0e 	bl	cec <pinMode>
    pinMode(_PinData.LED2Pin, INPUT);
     4d0:	f894 0024 	ldrb.w	r0, [r4, #36]	; 0x24
     4d4:	2100      	movs	r1, #0
     4d6:	f000 fc09 	bl	cec <pinMode>
    Angles[STATION_A][HORZ] = 0;
     4da:	2300      	movs	r3, #0
     4dc:	6023      	str	r3, [r4, #0]
    Angles[STATION_A][VERT] = 0;
     4de:	6063      	str	r3, [r4, #4]
    Angles[STATION_B][HORZ] = 0;
     4e0:	60a3      	str	r3, [r4, #8]
    Angles[STATION_B][VERT] = 0;
     4e2:	60e3      	str	r3, [r4, #12]
    Location[X_AXIS] = 0;
     4e4:	6123      	str	r3, [r4, #16]
    Location[Y_AXIS] = 0;
     4e6:	6163      	str	r3, [r4, #20]
    Location[Z_AXIS] = 0;
     4e8:	61a3      	str	r3, [r4, #24]
     4ea:	2109      	movs	r1, #9
     4ec:	4805      	ldr	r0, [pc, #20]	; (504 <SensorNode::Init()+0x5c>)
     4ee:	f001 fbe9 	bl	1cc4 <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
	size_t print(const Printable &obj)		{ return obj.printTo(*this); }
	size_t println(void);
	size_t println(const String &s)			{ return print(s) + println(); }
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
     4f2:	4628      	mov	r0, r5

    Serial.println(" Complete");
}
     4f4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     4f8:	f000 b964 	b.w	7c4 <Print::println()>
     4fc:	1fff88f0 	.word	0x1fff88f0
     500:	00003178 	.word	0x00003178
     504:	00003188 	.word	0x00003188

00000508 <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     508:	4770      	bx	lr
     50a:	bf00      	nop

0000050c <SensorNode::GetPulsePin()>:

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}
     50c:	7f00      	ldrb	r0, [r0, #28]
     50e:	4770      	bx	lr

00000510 <SensorNode::NewSweep(unsigned long, unsigned long)>:

void SensorNode::NewSweep(u_int32_t PulseLength,u_int32_t PulseStartTime){
     510:	4770      	bx	lr
     512:	bf00      	nop

00000514 <InitTimer()>:
#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {
     514:	b4f0      	push	{r4, r5, r6, r7}

    SIM_SCGC6 |= SIM_SCGC6_PIT;
     516:	4a08      	ldr	r2, [pc, #32]	; (538 <InitTimer()+0x24>)
    PIT_LDVAL0 = UINT32_MAX;
     518:	4e08      	ldr	r6, [pc, #32]	; (53c <InitTimer()+0x28>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     51a:	6813      	ldr	r3, [r2, #0]
    PIT_MCR = 0;
     51c:	4c08      	ldr	r4, [pc, #32]	; (540 <InitTimer()+0x2c>)
    PIT_TCTRL0 = 1;
     51e:	4909      	ldr	r1, [pc, #36]	; (544 <InitTimer()+0x30>)
    PIT_LDVAL0 = UINT32_MAX;
     520:	f04f 37ff 	mov.w	r7, #4294967295
    PIT_MCR = 0;
     524:	2500      	movs	r5, #0
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     526:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
    PIT_TCTRL0 = 1;
     52a:	2001      	movs	r0, #1
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     52c:	6013      	str	r3, [r2, #0]
    PIT_LDVAL0 = UINT32_MAX;
     52e:	6037      	str	r7, [r6, #0]
    PIT_MCR = 0;
     530:	6025      	str	r5, [r4, #0]
    PIT_TCTRL0 = 1;
     532:	6008      	str	r0, [r1, #0]

}
     534:	bcf0      	pop	{r4, r5, r6, r7}
     536:	4770      	bx	lr
     538:	4004803c 	.word	0x4004803c
     53c:	40037100 	.word	0x40037100
     540:	40037000 	.word	0x40037000
     544:	40037108 	.word	0x40037108

00000548 <Interrupt0Change()>:
    else if (IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,LastCallToNow,SWEEP_PULSE_LENGTH_TICKS_MAX)){\
        Nodes[ID].NewSweep(LastCallToNow,Now);\
    }\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);
     548:	4a16      	ldr	r2, [pc, #88]	; (5a4 <Interrupt0Change()+0x5c>)
     54a:	4b17      	ldr	r3, [pc, #92]	; (5a8 <Interrupt0Change()+0x60>)
     54c:	6812      	ldr	r2, [r2, #0]
     54e:	6819      	ldr	r1, [r3, #0]
     550:	43d2      	mvns	r2, r2
     552:	1a51      	subs	r1, r2, r1
     554:	b510      	push	{r4, lr}
     556:	f241 7070 	movw	r0, #6000	; 0x1770
     55a:	f6a1 34b8 	subw	r4, r1, #3000	; 0xbb8
     55e:	4284      	cmp	r4, r0
     560:	601a      	str	r2, [r3, #0]
     562:	d814      	bhi.n	58e <Interrupt0Change()+0x46>
    if (!IN_RANGE(0,PulseStartTime-LatestValidSync.StartTime,PULSETRAIN_SYNC_DISCREPANCY)){ // New Sync Pulse? (multiple nodes feed same function)
     564:	f5b2 7f16 	cmp.w	r2, #600	; 0x258
     568:	d916      	bls.n	598 <Interrupt0Change()+0x50>
	size_t print(uint8_t b)				{ return printNumber(b, 10, 0); }
     56a:	f5a2 41b6 	sub.w	r1, r2, #23296	; 0x5b00
     56e:	3968      	subs	r1, #104	; 0x68
     570:	f5b1 6f96 	cmp.w	r1, #1200	; 0x4b0
     574:	bf8c      	ite	hi
     576:	2100      	movhi	r1, #0
     578:	2101      	movls	r1, #1
     57a:	2300      	movs	r3, #0
     57c:	220a      	movs	r2, #10
     57e:	480b      	ldr	r0, [pc, #44]	; (5ac <Interrupt0Change()+0x64>)
     580:	f000 f942 	bl	808 <Print::printNumber(unsigned long, unsigned char, unsigned char)>
	size_t println(const __FlashStringHelper *f)	{ return print(f) + println(); }

	size_t println(uint8_t b)			{ return print(b) + println(); }
     584:	4809      	ldr	r0, [pc, #36]	; (5ac <Interrupt0Change()+0x64>)
void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);
     586:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     58a:	f000 b91b 	b.w	7c4 <Print::println()>
     58e:	f1a1 033c 	sub.w	r3, r1, #60	; 0x3c
     592:	f5b3 7f52 	cmp.w	r3, #840	; 0x348
     596:	d900      	bls.n	59a <Interrupt0Change()+0x52>
     598:	bd10      	pop	{r4, pc}
     59a:	4805      	ldr	r0, [pc, #20]	; (5b0 <Interrupt0Change()+0x68>)
     59c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     5a0:	f7ff bfb6 	b.w	510 <SensorNode::NewSweep(unsigned long, unsigned long)>
     5a4:	40037104 	.word	0x40037104
     5a8:	1fff92a0 	.word	0x1fff92a0
     5ac:	1fff88f0 	.word	0x1fff88f0
     5b0:	1fff92a4 	.word	0x1fff92a4

000005b4 <__tcf_1>:
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     5b4:	b510      	push	{r4, lr}
     5b6:	4c05      	ldr	r4, [pc, #20]	; (5cc <__tcf_1+0x18>)
     5b8:	f104 004c 	add.w	r0, r4, #76	; 0x4c
     5bc:	f7ff ff62 	bl	484 <BaseOOTX::~BaseOOTX()>
     5c0:	4620      	mov	r0, r4
     5c2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     5c6:	f7ff bf5d 	b.w	484 <BaseOOTX::~BaseOOTX()>
     5ca:	bf00      	nop
     5cc:	1fff9208 	.word	0x1fff9208

000005d0 <__tcf_0>:
SensorNode Nodes[] = {SENSOR_1_PINS};
     5d0:	4801      	ldr	r0, [pc, #4]	; (5d8 <__tcf_0+0x8>)
     5d2:	f7ff bf99 	b.w	508 <SensorNode::~SensorNode()>
     5d6:	bf00      	nop
     5d8:	1fff92a4 	.word	0x1fff92a4

000005dc <MainSetup()>:
}

//char (*__kaboom)[VERT] = 1;


void MainSetup() {
     5dc:	b510      	push	{r4, lr}
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
     5de:	2101      	movs	r1, #1
     5e0:	200d      	movs	r0, #13
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
     5e2:	4c12      	ldr	r4, [pc, #72]	; (62c <MainSetup()+0x50>)
    pinMode(LED_BUILTIN, OUTPUT);
     5e4:	f000 fb82 	bl	cec <pinMode>
    delay(2000);
     5e8:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     5ec:	f000 fbba 	bl	d64 <delay>
        Nodes[i].Init();
     5f0:	4620      	mov	r0, r4
     5f2:	f7ff ff59 	bl	4a8 <SensorNode::Init()>
    }
    delay(100);
     5f6:	2064      	movs	r0, #100	; 0x64
     5f8:	f000 fbb4 	bl	d64 <delay>

    InitTimer(); //Start up better timer (If using)
     5fc:	f7ff ff8a 	bl	514 <InitTimer()>
     600:	2112      	movs	r1, #18
     602:	480b      	ldr	r0, [pc, #44]	; (630 <MainSetup()+0x54>)
     604:	f001 fb5e 	bl	1cc4 <usb_serial_write>
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
     608:	4620      	mov	r0, r4
     60a:	f7ff ff7f 	bl	50c <SensorNode::GetPulsePin()>
     60e:	2204      	movs	r2, #4
     610:	4908      	ldr	r1, [pc, #32]	; (634 <MainSetup()+0x58>)
     612:	f000 f9e5 	bl	9e0 <attachInterrupt>
     616:	2108      	movs	r1, #8
     618:	4807      	ldr	r0, [pc, #28]	; (638 <MainSetup()+0x5c>)
     61a:	f001 fb53 	bl	1cc4 <usb_serial_write>
	size_t println(const char s[])			{ return print(s) + println(); }
     61e:	4807      	ldr	r0, [pc, #28]	; (63c <MainSetup()+0x60>)
     620:	f000 f8d0 	bl	7c4 <Print::println()>
			} else if (pin == 11) {
				CORE_PIN11_PORTSET = CORE_PIN11_BITMASK;
			} else if (pin == 12) {
				CORE_PIN12_PORTSET = CORE_PIN12_BITMASK;
			} else if (pin == 13) {
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     624:	4b06      	ldr	r3, [pc, #24]	; (640 <MainSetup()+0x64>)
     626:	2220      	movs	r2, #32
     628:	601a      	str	r2, [r3, #0]
     62a:	bd10      	pop	{r4, pc}
     62c:	1fff92a4 	.word	0x1fff92a4
     630:	00003194 	.word	0x00003194
     634:	00000549 	.word	0x00000549
     638:	000031a8 	.word	0x000031a8
     63c:	1fff88f0 	.word	0x1fff88f0
     640:	400ff084 	.word	0x400ff084

00000644 <main>:
//
//
//}


int main() {
     644:	b508      	push	{r3, lr}
    MainSetup();
     646:	f7ff ffc9 	bl	5dc <MainSetup()>
    delay(200);
     64a:	20c8      	movs	r0, #200	; 0xc8
     64c:	f000 fb8a 	bl	d64 <delay>
     650:	e7fe      	b.n	650 <main+0xc>
     652:	bf00      	nop

00000654 <_GLOBAL__sub_I_SENSOR_1_PINS>:
    while (true) {
       // MainLoop();
    }
    return 0;
     654:	b538      	push	{r3, r4, r5, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     656:	4b0e      	ldr	r3, [pc, #56]	; (690 <_GLOBAL__sub_I_SENSOR_1_PINS+0x3c>)
     658:	4c0e      	ldr	r4, [pc, #56]	; (694 <_GLOBAL__sub_I_SENSOR_1_PINS+0x40>)
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     65a:	4d0f      	ldr	r5, [pc, #60]	; (698 <_GLOBAL__sub_I_SENSOR_1_PINS+0x44>)
SensorNode Nodes[] = {SENSOR_1_PINS};
     65c:	480f      	ldr	r0, [pc, #60]	; (69c <_GLOBAL__sub_I_SENSOR_1_PINS+0x48>)
     65e:	cb0e      	ldmia	r3, {r1, r2, r3}
     660:	f7ff ff12 	bl	488 <SensorNode::SensorNode(SensorPinData_t)>
     664:	4622      	mov	r2, r4
     666:	490e      	ldr	r1, [pc, #56]	; (6a0 <_GLOBAL__sub_I_SENSOR_1_PINS+0x4c>)
     668:	2000      	movs	r0, #0
     66a:	f002 f8c9 	bl	2800 <__aeabi_atexit>
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     66e:	4628      	mov	r0, r5
     670:	2100      	movs	r1, #0
     672:	f7ff fefb 	bl	46c <BaseOOTX::BaseOOTX(int)>
     676:	f105 004c 	add.w	r0, r5, #76	; 0x4c
     67a:	2101      	movs	r1, #1
     67c:	f7ff fef6 	bl	46c <BaseOOTX::BaseOOTX(int)>
     680:	4622      	mov	r2, r4
     682:	4908      	ldr	r1, [pc, #32]	; (6a4 <_GLOBAL__sub_I_SENSOR_1_PINS+0x50>)
     684:	2000      	movs	r0, #0
     686:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
BaseOOTX OOTX[2] = {STATION_A, STATION_B};
     68a:	f002 b8b9 	b.w	2800 <__aeabi_atexit>
     68e:	bf00      	nop
     690:	1fff8800 	.word	0x1fff8800
     694:	1fff87fc 	.word	0x1fff87fc
     698:	1fff9208 	.word	0x1fff9208
     69c:	1fff92a4 	.word	0x1fff92a4
     6a0:	000005d1 	.word	0x000005d1
     6a4:	000005b5 	.word	0x000005b5

000006a8 <Print::write(unsigned char const*, unsigned int)>:
#include "Print.h"



size_t Print::write(const uint8_t *buffer, size_t size)
{
     6a8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	size_t count = 0;
	while (size--) count += write(*buffer++);
     6aa:	b172      	cbz	r2, 6ca <Print::write(unsigned char const*, unsigned int)+0x22>
     6ac:	4606      	mov	r6, r0
     6ae:	460f      	mov	r7, r1
     6b0:	4614      	mov	r4, r2
     6b2:	2500      	movs	r5, #0
     6b4:	6833      	ldr	r3, [r6, #0]
     6b6:	f817 1b01 	ldrb.w	r1, [r7], #1
     6ba:	681b      	ldr	r3, [r3, #0]
     6bc:	4630      	mov	r0, r6
     6be:	4798      	blx	r3
     6c0:	3c01      	subs	r4, #1
     6c2:	4405      	add	r5, r0
     6c4:	d1f6      	bne.n	6b4 <Print::write(unsigned char const*, unsigned int)+0xc>
	return count;
}
     6c6:	4628      	mov	r0, r5
     6c8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	size_t count = 0;
     6ca:	4615      	mov	r5, r2
     6cc:	e7fb      	b.n	6c6 <Print::write(unsigned char const*, unsigned int)+0x1e>
     6ce:	bf00      	nop

000006d0 <Print::print(long)>:
	return count;
}


size_t Print::print(long n)
{
     6d0:	b5f0      	push	{r4, r5, r6, r7, lr}
	uint8_t sign=0;

	if (n < 0) {
     6d2:	2900      	cmp	r1, #0
{
     6d4:	b08b      	sub	sp, #44	; 0x2c
     6d6:	4604      	mov	r4, r0
	if (n < 0) {
     6d8:	db1b      	blt.n	712 <Print::print(long)+0x42>
	} else if (base == 1) {
		base = 10;
	}


	if (n == 0) {
     6da:	d15a      	bne.n	792 <Print::print(long)+0xc2>
		buf[sizeof(buf) - 1] = '0';
     6dc:	2330      	movs	r3, #48	; 0x30
     6de:	f88d 3025 	strb.w	r3, [sp, #37]	; 0x25
	}
	if (sign) {
		i--;
		buf[i] = '-';
	}
	return write(buf + i, sizeof(buf) - i);
     6e2:	6823      	ldr	r3, [r4, #0]
     6e4:	4a35      	ldr	r2, [pc, #212]	; (7bc <Print::print(long)+0xec>)
     6e6:	685f      	ldr	r7, [r3, #4]
     6e8:	4297      	cmp	r7, r2
     6ea:	d14a      	bne.n	782 <Print::print(long)+0xb2>
	while (size--) count += write(*buffer++);
     6ec:	2500      	movs	r5, #0
	return write(buf + i, sizeof(buf) - i);
     6ee:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     6f2:	460e      	mov	r6, r1
     6f4:	440d      	add	r5, r1
     6f6:	2700      	movs	r7, #0
     6f8:	e001      	b.n	6fe <Print::print(long)+0x2e>
     6fa:	6823      	ldr	r3, [r4, #0]
     6fc:	3601      	adds	r6, #1
	while (size--) count += write(*buffer++);
     6fe:	681b      	ldr	r3, [r3, #0]
     700:	7831      	ldrb	r1, [r6, #0]
     702:	4620      	mov	r0, r4
     704:	4798      	blx	r3
     706:	42b5      	cmp	r5, r6
     708:	4407      	add	r7, r0
     70a:	d1f6      	bne.n	6fa <Print::print(long)+0x2a>
     70c:	4638      	mov	r0, r7
}
     70e:	b00b      	add	sp, #44	; 0x2c
     710:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     712:	4b2b      	ldr	r3, [pc, #172]	; (7c0 <Print::print(long)+0xf0>)
	return printNumber(n, 10, sign);
     714:	4249      	negs	r1, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     716:	fba3 2301 	umull	r2, r3, r3, r1
     71a:	08db      	lsrs	r3, r3, #3
     71c:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     720:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
     724:	3130      	adds	r1, #48	; 0x30
     726:	f88d 1025 	strb.w	r1, [sp, #37]	; 0x25
			if (n == 0) break;
     72a:	2b00      	cmp	r3, #0
     72c:	d044      	beq.n	7b8 <Print::print(long)+0xe8>
		sign = '-';
     72e:	262d      	movs	r6, #45	; 0x2d
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     730:	4d23      	ldr	r5, [pc, #140]	; (7c0 <Print::print(long)+0xf0>)
		sign = '-';
     732:	2221      	movs	r2, #33	; 0x21
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     734:	fba5 0103 	umull	r0, r1, r5, r3
     738:	08c9      	lsrs	r1, r1, #3
     73a:	eb01 0081 	add.w	r0, r1, r1, lsl #2
			i--;
     73e:	3a01      	subs	r2, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     740:	eba3 0340 	sub.w	r3, r3, r0, lsl #1
			i--;
     744:	b2d2      	uxtb	r2, r2
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     746:	a80a      	add	r0, sp, #40	; 0x28
     748:	4410      	add	r0, r2
     74a:	3330      	adds	r3, #48	; 0x30
     74c:	f800 3c24 	strb.w	r3, [r0, #-36]
			if (n == 0) break;
     750:	460b      	mov	r3, r1
     752:	2900      	cmp	r1, #0
     754:	d1ee      	bne.n	734 <Print::print(long)+0x64>
	if (sign) {
     756:	b35e      	cbz	r6, 7b0 <Print::print(long)+0xe0>
		i--;
     758:	1e55      	subs	r5, r2, #1
     75a:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     75c:	ab0a      	add	r3, sp, #40	; 0x28
     75e:	442b      	add	r3, r5
     760:	222d      	movs	r2, #45	; 0x2d
     762:	f803 2c24 	strb.w	r2, [r3, #-36]
     766:	f1c5 0022 	rsb	r0, r5, #34	; 0x22
	return write(buf + i, sizeof(buf) - i);
     76a:	6823      	ldr	r3, [r4, #0]
     76c:	4a13      	ldr	r2, [pc, #76]	; (7bc <Print::print(long)+0xec>)
     76e:	685f      	ldr	r7, [r3, #4]
     770:	a901      	add	r1, sp, #4
     772:	4297      	cmp	r7, r2
     774:	4429      	add	r1, r5
     776:	d107      	bne.n	788 <Print::print(long)+0xb8>
	while (size--) count += write(*buffer++);
     778:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     77c:	2800      	cmp	r0, #0
     77e:	d1b8      	bne.n	6f2 <Print::print(long)+0x22>
     780:	e7c5      	b.n	70e <Print::print(long)+0x3e>
	return write(buf + i, sizeof(buf) - i);
     782:	2001      	movs	r0, #1
     784:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     788:	4602      	mov	r2, r0
     78a:	4620      	mov	r0, r4
     78c:	47b8      	blx	r7
}
     78e:	b00b      	add	sp, #44	; 0x2c
     790:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     792:	4b0b      	ldr	r3, [pc, #44]	; (7c0 <Print::print(long)+0xf0>)
     794:	fba3 2301 	umull	r2, r3, r3, r1
     798:	08db      	lsrs	r3, r3, #3
     79a:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     79e:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
     7a2:	3230      	adds	r2, #48	; 0x30
     7a4:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
			if (n == 0) break;
     7a8:	2b00      	cmp	r3, #0
     7aa:	d09a      	beq.n	6e2 <Print::print(long)+0x12>
	uint8_t sign=0;
     7ac:	2600      	movs	r6, #0
     7ae:	e7bf      	b.n	730 <Print::print(long)+0x60>
     7b0:	4615      	mov	r5, r2
     7b2:	f1c2 0022 	rsb	r0, r2, #34	; 0x22
     7b6:	e7d8      	b.n	76a <Print::print(long)+0x9a>
			if (n == 0) break;
     7b8:	2221      	movs	r2, #33	; 0x21
     7ba:	e7cd      	b.n	758 <Print::print(long)+0x88>
     7bc:	000006a9 	.word	0x000006a9
     7c0:	cccccccd 	.word	0xcccccccd

000007c4 <Print::println()>:
{
     7c4:	b530      	push	{r4, r5, lr}
	return write(buf, 2);
     7c6:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     7c8:	490d      	ldr	r1, [pc, #52]	; (800 <Print::println()+0x3c>)
     7ca:	4a0e      	ldr	r2, [pc, #56]	; (804 <Print::println()+0x40>)
	return write(buf, 2);
     7cc:	685c      	ldr	r4, [r3, #4]
	uint8_t buf[2]={'\r', '\n'};
     7ce:	8809      	ldrh	r1, [r1, #0]
{
     7d0:	b083      	sub	sp, #12
     7d2:	4294      	cmp	r4, r2
	uint8_t buf[2]={'\r', '\n'};
     7d4:	f8ad 1004 	strh.w	r1, [sp, #4]
     7d8:	d10d      	bne.n	7f6 <Print::println()+0x32>
     7da:	4605      	mov	r5, r0
	while (size--) count += write(*buffer++);
     7dc:	681b      	ldr	r3, [r3, #0]
     7de:	210d      	movs	r1, #13
     7e0:	4798      	blx	r3
     7e2:	682b      	ldr	r3, [r5, #0]
     7e4:	f89d 1005 	ldrb.w	r1, [sp, #5]
     7e8:	681b      	ldr	r3, [r3, #0]
     7ea:	4604      	mov	r4, r0
     7ec:	4628      	mov	r0, r5
     7ee:	4798      	blx	r3
     7f0:	4420      	add	r0, r4
}
     7f2:	b003      	add	sp, #12
     7f4:	bd30      	pop	{r4, r5, pc}
	return write(buf, 2);
     7f6:	a901      	add	r1, sp, #4
     7f8:	2202      	movs	r2, #2
     7fa:	47a0      	blx	r4
}
     7fc:	b003      	add	sp, #12
     7fe:	bd30      	pop	{r4, r5, pc}
     800:	000031b4 	.word	0x000031b4
     804:	000006a9 	.word	0x000006a9

00000808 <Print::printNumber(unsigned long, unsigned char, unsigned char)>:
{
     808:	b5f0      	push	{r4, r5, r6, r7, lr}
     80a:	4606      	mov	r6, r0
     80c:	b08b      	sub	sp, #44	; 0x2c
	if (base == 0) {
     80e:	2a00      	cmp	r2, #0
     810:	d046      	beq.n	8a0 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x98>
		base = 10;
     812:	2a01      	cmp	r2, #1
     814:	bf08      	it	eq
     816:	220a      	moveq	r2, #10
	if (n == 0) {
     818:	2900      	cmp	r1, #0
     81a:	d03c      	beq.n	896 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x8e>
     81c:	2521      	movs	r5, #33	; 0x21
     81e:	e000      	b.n	822 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x1a>
			i--;
     820:	b2fd      	uxtb	r5, r7
			digit = n % base;
     822:	fbb1 f4f2 	udiv	r4, r1, r2
     826:	fb02 1114 	mls	r1, r2, r4, r1
     82a:	b2c8      	uxtb	r0, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     82c:	2909      	cmp	r1, #9
     82e:	f100 0130 	add.w	r1, r0, #48	; 0x30
     832:	bf98      	it	ls
     834:	b2c8      	uxtbls	r0, r1
     836:	a90a      	add	r1, sp, #40	; 0x28
     838:	bf88      	it	hi
     83a:	3037      	addhi	r0, #55	; 0x37
     83c:	4429      	add	r1, r5
     83e:	bf88      	it	hi
     840:	b2c0      	uxtbhi	r0, r0
     842:	f801 0c24 	strb.w	r0, [r1, #-36]
			i--;
     846:	1e6f      	subs	r7, r5, #1
			if (n == 0) break;
     848:	4621      	mov	r1, r4
     84a:	2c00      	cmp	r4, #0
     84c:	d1e8      	bne.n	820 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x18>
	if (sign) {
     84e:	b133      	cbz	r3, 85e <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x56>
		i--;
     850:	3d01      	subs	r5, #1
     852:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     854:	ab0a      	add	r3, sp, #40	; 0x28
     856:	442b      	add	r3, r5
     858:	222d      	movs	r2, #45	; 0x2d
     85a:	f803 2c24 	strb.w	r2, [r3, #-36]
	return write(buf + i, sizeof(buf) - i);
     85e:	6833      	ldr	r3, [r6, #0]
     860:	4916      	ldr	r1, [pc, #88]	; (8bc <Print::printNumber(unsigned long, unsigned char, unsigned char)+0xb4>)
     862:	685f      	ldr	r7, [r3, #4]
     864:	aa01      	add	r2, sp, #4
     866:	428f      	cmp	r7, r1
     868:	eb02 0405 	add.w	r4, r2, r5
     86c:	f1c5 0222 	rsb	r2, r5, #34	; 0x22
     870:	d11c      	bne.n	8ac <Print::printNumber(unsigned long, unsigned char, unsigned char)+0xa4>
	while (size--) count += write(*buffer++);
     872:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     876:	b1f2      	cbz	r2, 8b6 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0xae>
     878:	4425      	add	r5, r4
     87a:	2700      	movs	r7, #0
     87c:	e001      	b.n	882 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x7a>
     87e:	6833      	ldr	r3, [r6, #0]
     880:	3401      	adds	r4, #1
     882:	681b      	ldr	r3, [r3, #0]
     884:	7821      	ldrb	r1, [r4, #0]
     886:	4630      	mov	r0, r6
     888:	4798      	blx	r3
     88a:	42a5      	cmp	r5, r4
     88c:	4407      	add	r7, r0
     88e:	d1f6      	bne.n	87e <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x76>
     890:	4638      	mov	r0, r7
}
     892:	b00b      	add	sp, #44	; 0x2c
     894:	bdf0      	pop	{r4, r5, r6, r7, pc}
		buf[sizeof(buf) - 1] = '0';
     896:	2230      	movs	r2, #48	; 0x30
     898:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
		i = sizeof(buf) - 1;
     89c:	2521      	movs	r5, #33	; 0x21
     89e:	e7d6      	b.n	84e <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x46>
		return write((uint8_t)n);
     8a0:	6803      	ldr	r3, [r0, #0]
     8a2:	b2c9      	uxtb	r1, r1
     8a4:	681b      	ldr	r3, [r3, #0]
     8a6:	4798      	blx	r3
}
     8a8:	b00b      	add	sp, #44	; 0x2c
     8aa:	bdf0      	pop	{r4, r5, r6, r7, pc}
	return write(buf + i, sizeof(buf) - i);
     8ac:	4621      	mov	r1, r4
     8ae:	4630      	mov	r0, r6
     8b0:	47b8      	blx	r7
}
     8b2:	b00b      	add	sp, #44	; 0x2c
     8b4:	bdf0      	pop	{r4, r5, r6, r7, pc}
	while (size--) count += write(*buffer++);
     8b6:	4610      	mov	r0, r2
     8b8:	e7eb      	b.n	892 <Print::printNumber(unsigned long, unsigned char, unsigned char)+0x8a>
     8ba:	bf00      	nop
     8bc:	000006a9 	.word	0x000006a9

000008c0 <memset>:
     8c0:	b501      	push	{r0, lr}
     8c2:	b1ea      	cbz	r2, 900 <memset+0x40>
     8c4:	2a10      	cmp	r2, #16
     8c6:	db17      	blt.n	8f8 <memset+0x38>
     8c8:	f000 0307 	and.w	r3, r0, #7
     8cc:	b133      	cbz	r3, 8dc <memset+0x1c>
     8ce:	f1c3 0308 	rsb	r3, r3, #8
     8d2:	1ad2      	subs	r2, r2, r3
     8d4:	3b01      	subs	r3, #1
     8d6:	f800 1b01 	strb.w	r1, [r0], #1
     8da:	dcfb      	bgt.n	8d4 <memset+0x14>
     8dc:	b2c9      	uxtb	r1, r1
     8de:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
     8e2:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
     8e6:	468c      	mov	ip, r1
     8e8:	08d3      	lsrs	r3, r2, #3
     8ea:	3b01      	subs	r3, #1
     8ec:	e8e0 1c02 	strd	r1, ip, [r0], #8
     8f0:	dcfb      	bgt.n	8ea <memset+0x2a>
     8f2:	f012 0207 	ands.w	r2, r2, #7
     8f6:	d003      	beq.n	900 <memset+0x40>
     8f8:	3a01      	subs	r2, #1
     8fa:	f800 1b01 	strb.w	r1, [r0], #1
     8fe:	dcfb      	bgt.n	8f8 <memset+0x38>
     900:	bd01      	pop	{r0, pc}
     902:	bf00      	nop

00000904 <fault_isr>:
{
     904:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     906:	4c10      	ldr	r4, [pc, #64]	; (948 <fault_isr+0x44>)
     908:	e008      	b.n	91c <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     90a:	6823      	ldr	r3, [r4, #0]
     90c:	0559      	lsls	r1, r3, #21
     90e:	d40d      	bmi.n	92c <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     910:	6823      	ldr	r3, [r4, #0]
     912:	051a      	lsls	r2, r3, #20
     914:	d40f      	bmi.n	936 <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     916:	6823      	ldr	r3, [r4, #0]
     918:	04db      	lsls	r3, r3, #19
     91a:	d411      	bmi.n	940 <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     91c:	6823      	ldr	r3, [r4, #0]
     91e:	0358      	lsls	r0, r3, #13
     920:	d5f3      	bpl.n	90a <fault_isr+0x6>
     922:	f000 fb47 	bl	fb4 <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     926:	6823      	ldr	r3, [r4, #0]
     928:	0559      	lsls	r1, r3, #21
     92a:	d5f1      	bpl.n	910 <fault_isr+0xc>
     92c:	f001 fd60 	bl	23f0 <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     930:	6823      	ldr	r3, [r4, #0]
     932:	051a      	lsls	r2, r3, #20
     934:	d5ef      	bpl.n	916 <fault_isr+0x12>
     936:	f001 fdf1 	bl	251c <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     93a:	6823      	ldr	r3, [r4, #0]
     93c:	04db      	lsls	r3, r3, #19
     93e:	d5ed      	bpl.n	91c <fault_isr+0x18>
     940:	f001 fe82 	bl	2648 <uart2_status_isr>
     944:	e7ea      	b.n	91c <fault_isr+0x18>
     946:	bf00      	nop
     948:	40048034 	.word	0x40048034

0000094c <unused_isr>:
{
     94c:	b508      	push	{r3, lr}
	fault_isr();
     94e:	f7ff ffd9 	bl	904 <fault_isr>
     952:	bf00      	nop

00000954 <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
     954:	4b01      	ldr	r3, [pc, #4]	; (95c <startup_early_hook+0x8>)
     956:	2210      	movs	r2, #16
     958:	801a      	strh	r2, [r3, #0]
     95a:	4770      	bx	lr
     95c:	40052000 	.word	0x40052000

00000960 <startup_late_hook>:
static void startup_default_late_hook(void) {}
     960:	4770      	bx	lr
     962:	bf00      	nop

00000964 <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
     964:	4909      	ldr	r1, [pc, #36]	; (98c <_sbrk+0x28>)
{
     966:	b508      	push	{r3, lr}
	prev = __brkval;
     968:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
     96a:	b130      	cbz	r0, 97a <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
     96c:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
     96e:	4418      	add	r0, r3
     970:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
     974:	4290      	cmp	r0, r2
     976:	d202      	bcs.n	97e <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
     978:	6008      	str	r0, [r1, #0]
	}
	return prev;
     97a:	4618      	mov	r0, r3
}
     97c:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
     97e:	f001 ff4b 	bl	2818 <__errno>
     982:	230c      	movs	r3, #12
     984:	6003      	str	r3, [r0, #0]
			return (void *)-1;
     986:	f04f 30ff 	mov.w	r0, #4294967295
     98a:	bd08      	pop	{r3, pc}
     98c:	1fff880c 	.word	0x1fff880c

00000990 <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
     990:	b4f0      	push	{r4, r5, r6, r7}
     992:	1e4d      	subs	r5, r1, #1
     994:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
     996:	2400      	movs	r4, #0
     998:	e000      	b.n	99c <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
     99a:	3401      	adds	r4, #1
		digit = val % radix;
     99c:	fbb0 f3f2 	udiv	r3, r0, r2
     9a0:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     9a4:	2809      	cmp	r0, #9
     9a6:	f100 0730 	add.w	r7, r0, #48	; 0x30
     9aa:	bf8a      	itet	hi
     9ac:	3037      	addhi	r0, #55	; 0x37
     9ae:	b2f8      	uxtbls	r0, r7
     9b0:	b2c0      	uxtbhi	r0, r0
     9b2:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
     9b6:	4618      	mov	r0, r3
     9b8:	2b00      	cmp	r3, #0
     9ba:	d1ee      	bne.n	99a <ultoa+0xa>
	}
	buf[i + 1] = 0;
     9bc:	190a      	adds	r2, r1, r4
     9be:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
     9c0:	b14c      	cbz	r4, 9d6 <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
     9c2:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
     9c4:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
     9c8:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
     9ca:	3301      	adds	r3, #1
     9cc:	1ae0      	subs	r0, r4, r3
     9ce:	4283      	cmp	r3, r0
		buf[i] = t;
     9d0:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
     9d4:	dbf5      	blt.n	9c2 <ultoa+0x32>
	}
	return buf;
}
     9d6:	4608      	mov	r0, r1
     9d8:	bcf0      	pop	{r4, r5, r6, r7}
     9da:	4770      	bx	lr

000009dc <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
     9dc:	4770      	bx	lr
     9de:	bf00      	nop

000009e0 <attachInterrupt>:
void attachInterrupt(uint8_t pin, void (*function)(void), int mode)
{
	volatile uint32_t *config;
	uint32_t cfg, mask;

	if (pin >= CORE_NUM_DIGITAL) return;
     9e0:	2821      	cmp	r0, #33	; 0x21
{
     9e2:	b4f0      	push	{r4, r5, r6, r7}
	if (pin >= CORE_NUM_DIGITAL) return;
     9e4:	d815      	bhi.n	a12 <attachInterrupt+0x32>
	switch (mode) {
     9e6:	2a04      	cmp	r2, #4
     9e8:	d813      	bhi.n	a12 <attachInterrupt+0x32>
     9ea:	e8df f002 	tbb	[pc, r2]
     9ee:	4c49      	.short	0x4c49
     9f0:	144f      	.short	0x144f
     9f2:	46          	.byte	0x46
     9f3:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     9f4:	4e2e      	ldr	r6, [pc, #184]	; (ab0 <attachInterrupt+0xd0>)
	attachInterruptVector(IRQ_PORTD, port_D_isr);
	attachInterruptVector(IRQ_PORTE, port_E_isr);
	voidFuncPtr* isr_table = getIsrTable(config);
	if(!isr_table) return;
	uint32_t pin_index = getPinIndex(config);
	__disable_irq();
     9f6:	b672      	cpsid	i
	cfg = *config;
     9f8:	681a      	ldr	r2, [r3, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
     9fa:	f422 2270 	bic.w	r2, r2, #983040	; 0xf0000
     9fe:	f042 7080 	orr.w	r0, r2, #16777216	; 0x1000000
	*config = cfg;
	isr_table[pin_index] = function;	// set the function pointer
     a02:	f3c3 0484 	ubfx	r4, r3, #2, #5
	cfg |= mask;
     a06:	4328      	orrs	r0, r5
	*config = cfg;
     a08:	601a      	str	r2, [r3, #0]
	isr_table[pin_index] = function;	// set the function pointer
     a0a:	f846 1024 	str.w	r1, [r6, r4, lsl #2]
	*config = cfg;			// enable the new interrupt
     a0e:	6018      	str	r0, [r3, #0]
	__enable_irq();
     a10:	b662      	cpsie	i
	intFunc[pin] = function;	// set the function pointer
	cfg |= mask;
	*config = cfg;			// enable the new interrupt
	__enable_irq();
#endif
}
     a12:	bcf0      	pop	{r4, r5, r6, r7}
     a14:	4770      	bx	lr
	switch (mode) {
     a16:	f44f 2510 	mov.w	r5, #589824	; 0x90000
	config = portConfigRegister(pin);
     a1a:	4c26      	ldr	r4, [pc, #152]	; (ab4 <attachInterrupt+0xd4>)
     a1c:	eb04 03c0 	add.w	r3, r4, r0, lsl #3
     a20:	685b      	ldr	r3, [r3, #4]
	if ((*config & 0x00000700) == 0) {
     a22:	681a      	ldr	r2, [r3, #0]
     a24:	f412 62e0 	ands.w	r2, r2, #1792	; 0x700
     a28:	d035      	beq.n	a96 <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
     a2a:	4a23      	ldr	r2, [pc, #140]	; (ab8 <attachInterrupt+0xd8>)
     a2c:	4c23      	ldr	r4, [pc, #140]	; (abc <attachInterrupt+0xdc>)
     a2e:	4824      	ldr	r0, [pc, #144]	; (ac0 <attachInterrupt+0xe0>)
     a30:	f8c2 419c 	str.w	r4, [r2, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a34:	f103 4440 	add.w	r4, r3, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
     a38:	4e22      	ldr	r6, [pc, #136]	; (ac4 <attachInterrupt+0xe4>)
     a3a:	f8c2 01a4 	str.w	r0, [r2, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a3e:	f5a4 2092 	sub.w	r0, r4, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
     a42:	4f21      	ldr	r7, [pc, #132]	; (ac8 <attachInterrupt+0xe8>)
     a44:	f8c2 61a0 	str.w	r6, [r2, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a48:	287c      	cmp	r0, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
     a4a:	4e20      	ldr	r6, [pc, #128]	; (acc <attachInterrupt+0xec>)
     a4c:	f8c2 71a8 	str.w	r7, [r2, #424]	; 0x1a8
     a50:	f8c2 61ac 	str.w	r6, [r2, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a54:	d9ce      	bls.n	9f4 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     a56:	f5a4 2294 	sub.w	r2, r4, #303104	; 0x4a000
     a5a:	2a7c      	cmp	r2, #124	; 0x7c
     a5c:	d919      	bls.n	a92 <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     a5e:	f5a4 2296 	sub.w	r2, r4, #307200	; 0x4b000
     a62:	2a7c      	cmp	r2, #124	; 0x7c
     a64:	d91f      	bls.n	aa6 <attachInterrupt+0xc6>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     a66:	f5a4 2298 	sub.w	r2, r4, #311296	; 0x4c000
     a6a:	2a7c      	cmp	r2, #124	; 0x7c
     a6c:	d91d      	bls.n	aaa <attachInterrupt+0xca>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     a6e:	f5a4 249a 	sub.w	r4, r4, #315392	; 0x4d000
     a72:	2c7c      	cmp	r4, #124	; 0x7c
     a74:	d8cd      	bhi.n	a12 <attachInterrupt+0x32>
     a76:	4e16      	ldr	r6, [pc, #88]	; (ad0 <attachInterrupt+0xf0>)
     a78:	e7bd      	b.n	9f6 <attachInterrupt+0x16>
	switch (mode) {
     a7a:	f44f 2530 	mov.w	r5, #720896	; 0xb0000
     a7e:	e7cc      	b.n	a1a <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
     a80:	f44f 2500 	mov.w	r5, #524288	; 0x80000
     a84:	e7c9      	b.n	a1a <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
     a86:	f44f 2540 	mov.w	r5, #786432	; 0xc0000
     a8a:	e7c6      	b.n	a1a <attachInterrupt+0x3a>
	switch (mode) {
     a8c:	f44f 2520 	mov.w	r5, #655360	; 0xa0000
     a90:	e7c3      	b.n	a1a <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     a92:	4e10      	ldr	r6, [pc, #64]	; (ad4 <attachInterrupt+0xf4>)
     a94:	e7af      	b.n	9f6 <attachInterrupt+0x16>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
     a96:	f854 4030 	ldr.w	r4, [r4, r0, lsl #3]
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
			*config = PORT_PCR_MUX(1);
     a9a:	f44f 7080 	mov.w	r0, #256	; 0x100
		*portModeRegister(pin) = 0;
     a9e:	f884 2280 	strb.w	r2, [r4, #640]	; 0x280
			*config = PORT_PCR_MUX(1);
     aa2:	6018      	str	r0, [r3, #0]
     aa4:	e7c1      	b.n	a2a <attachInterrupt+0x4a>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     aa6:	4e0c      	ldr	r6, [pc, #48]	; (ad8 <attachInterrupt+0xf8>)
     aa8:	e7a5      	b.n	9f6 <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     aaa:	4e0c      	ldr	r6, [pc, #48]	; (adc <attachInterrupt+0xfc>)
     aac:	e7a3      	b.n	9f6 <attachInterrupt+0x16>
     aae:	bf00      	nop
     ab0:	1fff8810 	.word	0x1fff8810
     ab4:	000031b8 	.word	0x000031b8
     ab8:	1fff8200 	.word	0x1fff8200
     abc:	1fff87d1 	.word	0x1fff87d1
     ac0:	1fff8779 	.word	0x1fff8779
     ac4:	1fff87a5 	.word	0x1fff87a5
     ac8:	1fff874d 	.word	0x1fff874d
     acc:	1fff8721 	.word	0x1fff8721
     ad0:	1fff88e8 	.word	0x1fff88e8
     ad4:	1fff8848 	.word	0x1fff8848
     ad8:	1fff8898 	.word	0x1fff8898
     adc:	1fff88c8 	.word	0x1fff88c8

00000ae0 <rtc_set>:
{
     ae0:	b430      	push	{r4, r5}
	RTC_SR = 0;
     ae2:	4b05      	ldr	r3, [pc, #20]	; (af8 <rtc_set+0x18>)
	RTC_TPR = 0;
     ae4:	4d05      	ldr	r5, [pc, #20]	; (afc <rtc_set+0x1c>)
	RTC_TSR = t;
     ae6:	4c06      	ldr	r4, [pc, #24]	; (b00 <rtc_set+0x20>)
	RTC_SR = 0;
     ae8:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
     aea:	2110      	movs	r1, #16
	RTC_SR = 0;
     aec:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
     aee:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
     af0:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
     af2:	6019      	str	r1, [r3, #0]
}
     af4:	bc30      	pop	{r4, r5}
     af6:	4770      	bx	lr
     af8:	4003d014 	.word	0x4003d014
     afc:	4003d004 	.word	0x4003d004
     b00:	4003d000 	.word	0x4003d000

00000b04 <_init_Teensyduino_internal_>:
{
     b04:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     b08:	4b6a      	ldr	r3, [pc, #424]	; (cb4 <_init_Teensyduino_internal_+0x1b0>)
	FTM0_CNT = 0;
     b0a:	496b      	ldr	r1, [pc, #428]	; (cb8 <_init_Teensyduino_internal_+0x1b4>)
	FTM0_C1SC = 0x28;
     b0c:	4e6b      	ldr	r6, [pc, #428]	; (cbc <_init_Teensyduino_internal_+0x1b8>)
	FTM0_C3SC = 0x28;
     b0e:	4d6c      	ldr	r5, [pc, #432]	; (cc0 <_init_Teensyduino_internal_+0x1bc>)
	FTM0_C4SC = 0x28;
     b10:	4c6c      	ldr	r4, [pc, #432]	; (cc4 <_init_Teensyduino_internal_+0x1c0>)
	FTM0_MOD = DEFAULT_FTM_MOD;
     b12:	f8df c1d0 	ldr.w	ip, [pc, #464]	; ce4 <_init_Teensyduino_internal_+0x1e0>
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     b16:	f8df e1d0 	ldr.w	lr, [pc, #464]	; ce8 <_init_Teensyduino_internal_+0x1e4>
	FTM0_C2SC = 0x28;
     b1a:	4a6b      	ldr	r2, [pc, #428]	; (cc8 <_init_Teensyduino_internal_+0x1c4>)
	FTM0_C5SC = 0x28;
     b1c:	4f6b      	ldr	r7, [pc, #428]	; (ccc <_init_Teensyduino_internal_+0x1c8>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     b1e:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
     b22:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
     b24:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
     b28:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
     b2a:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
     b2e:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
     b30:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
     b34:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
     b36:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
     b3a:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
     b3c:	2000      	movs	r0, #0
     b3e:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     b40:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
     b42:	f64e 71ff 	movw	r1, #61439	; 0xefff
     b46:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     b4a:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
     b4e:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
     b50:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
     b52:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
     b54:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
     b56:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
     b58:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
     b5a:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b5c:	2209      	movs	r2, #9
     b5e:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
     b62:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
     b66:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
     b6a:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
     b6e:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
     b72:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
     b76:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
     b7a:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     b7c:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b80:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
     b84:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
     b88:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
     b8c:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     b8e:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b92:	484f      	ldr	r0, [pc, #316]	; (cd0 <_init_Teensyduino_internal_+0x1cc>)
	FTM2_MOD = DEFAULT_FTM_MOD;
     b94:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
     b96:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
     b9a:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
     b9e:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
     ba0:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     ba2:	6002      	str	r2, [r0, #0]
	analog_init();
     ba4:	f001 fba4 	bl	22f0 <analog_init>

uint32_t micros(void)
{
	uint32_t count, current, istatus;

	__disable_irq();
     ba8:	b672      	cpsid	i
	current = SYST_CVR;
	count = systick_millis_count;
     baa:	4d4a      	ldr	r5, [pc, #296]	; (cd4 <_init_Teensyduino_internal_+0x1d0>)
	current = SYST_CVR;
     bac:	4b4a      	ldr	r3, [pc, #296]	; (cd8 <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     bae:	4a4b      	ldr	r2, [pc, #300]	; (cdc <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     bb0:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     bb2:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     bb4:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     bb6:	b662      	cpsie	i
	 //systick_current = current;
	 //systick_count = count;
	 //systick_istatus = istatus & SCB_ICSR_PENDSTSET ? 1 : 0;
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     bb8:	0151      	lsls	r1, r2, #5
     bba:	d502      	bpl.n	bc2 <_init_Teensyduino_internal_+0xbe>
     bbc:	2b32      	cmp	r3, #50	; 0x32
     bbe:	bf88      	it	hi
     bc0:	3401      	addhi	r4, #1
#if defined(KINETISL) && F_CPU == 48000000
	return count * 1000 + ((current * (uint32_t)87381) >> 22);
#elif defined(KINETISL) && F_CPU == 24000000
	return count * 1000 + ((current * (uint32_t)174763) >> 22);
#endif
	return count * 1000 + current / (F_CPU / 1000000);
     bc2:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     bc6:	4f46      	ldr	r7, [pc, #280]	; (ce0 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     bc8:	f8df 910c 	ldr.w	r9, [pc, #268]	; cd8 <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     bcc:	f8df 810c 	ldr.w	r8, [pc, #268]	; cdc <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     bd0:	33bf      	adds	r3, #191	; 0xbf
     bd2:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     bd6:	fba7 1303 	umull	r1, r3, r7, r3
     bda:	fb02 f404 	mul.w	r4, r2, r4
     bde:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     be2:	2632      	movs	r6, #50	; 0x32
	__disable_irq();
     be4:	b672      	cpsid	i
	current = SYST_CVR;
     be6:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     bea:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     bec:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     bf0:	b662      	cpsie	i
{
	uint32_t start = micros();

	if (ms > 0) {
		while (1) {
			while ((micros() - start) >= 1000) {
     bf2:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     bf6:	33bf      	adds	r3, #191	; 0xbf
     bf8:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     bfc:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     c00:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     c04:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c08:	d002      	beq.n	c10 <_init_Teensyduino_internal_+0x10c>
     c0a:	2932      	cmp	r1, #50	; 0x32
     c0c:	bf88      	it	hi
     c0e:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     c10:	fb00 3302 	mla	r3, r0, r2, r3
     c14:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     c18:	d304      	bcc.n	c24 <_init_Teensyduino_internal_+0x120>
				ms--;
				if (ms == 0) return;
     c1a:	3e01      	subs	r6, #1
     c1c:	d005      	beq.n	c2a <_init_Teensyduino_internal_+0x126>
				start += 1000;
     c1e:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     c22:	e7df      	b.n	be4 <_init_Teensyduino_internal_+0xe0>
			}
			yield();
     c24:	f001 f9a2 	bl	1f6c <yield>
     c28:	e7dc      	b.n	be4 <_init_Teensyduino_internal_+0xe0>
	usb_init();
     c2a:	f000 ff1d 	bl	1a68 <usb_init>
	__disable_irq();
     c2e:	b672      	cpsid	i
	current = SYST_CVR;
     c30:	4b29      	ldr	r3, [pc, #164]	; (cd8 <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c32:	4a2a      	ldr	r2, [pc, #168]	; (cdc <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     c34:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     c36:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c38:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     c3a:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c3c:	0152      	lsls	r2, r2, #5
     c3e:	d502      	bpl.n	c46 <_init_Teensyduino_internal_+0x142>
     c40:	2b32      	cmp	r3, #50	; 0x32
     c42:	bf88      	it	hi
     c44:	3401      	addhi	r4, #1
	return count * 1000 + current / (F_CPU / 1000000);
     c46:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     c4a:	4f25      	ldr	r7, [pc, #148]	; (ce0 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     c4c:	f8df 9088 	ldr.w	r9, [pc, #136]	; cd8 <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c50:	f8df 8088 	ldr.w	r8, [pc, #136]	; cdc <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     c54:	33bf      	adds	r3, #191	; 0xbf
     c56:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     c5a:	fba7 1303 	umull	r1, r3, r7, r3
     c5e:	fb02 f404 	mul.w	r4, r2, r4
     c62:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     c66:	f44f 76af 	mov.w	r6, #350	; 0x15e
	__disable_irq();
     c6a:	b672      	cpsid	i
	current = SYST_CVR;
     c6c:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     c70:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c72:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     c76:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     c78:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     c7c:	33bf      	adds	r3, #191	; 0xbf
     c7e:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c82:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     c86:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     c8a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c8e:	d002      	beq.n	c96 <_init_Teensyduino_internal_+0x192>
     c90:	2932      	cmp	r1, #50	; 0x32
     c92:	bf88      	it	hi
     c94:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     c96:	fb00 3302 	mla	r3, r0, r2, r3
     c9a:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     c9e:	d304      	bcc.n	caa <_init_Teensyduino_internal_+0x1a6>
				if (ms == 0) return;
     ca0:	3e01      	subs	r6, #1
     ca2:	d005      	beq.n	cb0 <_init_Teensyduino_internal_+0x1ac>
				start += 1000;
     ca4:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     ca8:	e7df      	b.n	c6a <_init_Teensyduino_internal_+0x166>
			yield();
     caa:	f001 f95f 	bl	1f6c <yield>
     cae:	e7dc      	b.n	c6a <_init_Teensyduino_internal_+0x166>
     cb0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     cb4:	e000e108 	.word	0xe000e108
     cb8:	40038004 	.word	0x40038004
     cbc:	40038014 	.word	0x40038014
     cc0:	40038024 	.word	0x40038024
     cc4:	4003802c 	.word	0x4003802c
     cc8:	4003801c 	.word	0x4003801c
     ccc:	40038034 	.word	0x40038034
     cd0:	400b8000 	.word	0x400b8000
     cd4:	1fff92cc 	.word	0x1fff92cc
     cd8:	e000e018 	.word	0xe000e018
     cdc:	e000ed04 	.word	0xe000ed04
     ce0:	88888889 	.word	0x88888889
     ce4:	40038008 	.word	0x40038008
     ce8:	4003800c 	.word	0x4003800c

00000cec <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
     cec:	2821      	cmp	r0, #33	; 0x21
     cee:	d820      	bhi.n	d32 <pinMode+0x46>
	config = portConfigRegister(pin);
     cf0:	4a1b      	ldr	r2, [pc, #108]	; (d60 <pinMode+0x74>)
     cf2:	eb02 03c0 	add.w	r3, r2, r0, lsl #3
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     cf6:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
     cf8:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     cfa:	d00f      	beq.n	d1c <pinMode+0x30>
     cfc:	2904      	cmp	r1, #4
     cfe:	d01d      	beq.n	d3c <pinMode+0x50>
		*portModeRegister(pin) = 0;
     d00:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
     d04:	2200      	movs	r2, #0
     d06:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
		if (mode == INPUT) {
     d0a:	b199      	cbz	r1, d34 <pinMode+0x48>
		} else if (mode == INPUT_PULLUP) {
     d0c:	2902      	cmp	r1, #2
     d0e:	d022      	beq.n	d56 <pinMode+0x6a>
		} else if (mode == INPUT_PULLDOWN) {
     d10:	2903      	cmp	r1, #3
     d12:	d10d      	bne.n	d30 <pinMode+0x44>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
     d14:	f44f 7281 	mov.w	r2, #258	; 0x102
     d18:	601a      	str	r2, [r3, #0]
     d1a:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     d1c:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d20:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     d24:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d28:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
     d2a:	681a      	ldr	r2, [r3, #0]
     d2c:	f022 0220 	bic.w	r2, r2, #32
     d30:	601a      	str	r2, [r3, #0]
     d32:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
     d34:	f44f 7280 	mov.w	r2, #256	; 0x100
     d38:	601a      	str	r2, [r3, #0]
     d3a:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     d3c:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d40:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     d44:	2001      	movs	r0, #1
     d46:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d4a:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
     d4c:	681a      	ldr	r2, [r3, #0]
     d4e:	f042 0220 	orr.w	r2, r2, #32
     d52:	601a      	str	r2, [r3, #0]
     d54:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
     d56:	f240 1203 	movw	r2, #259	; 0x103
     d5a:	601a      	str	r2, [r3, #0]
     d5c:	4770      	bx	lr
     d5e:	bf00      	nop
     d60:	000031b8 	.word	0x000031b8

00000d64 <delay>:
{
     d64:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
     d68:	4605      	mov	r5, r0
	__disable_irq();
     d6a:	b672      	cpsid	i
	count = systick_millis_count;
     d6c:	4f20      	ldr	r7, [pc, #128]	; (df0 <delay+0x8c>)
	current = SYST_CVR;
     d6e:	4b21      	ldr	r3, [pc, #132]	; (df4 <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d70:	4a21      	ldr	r2, [pc, #132]	; (df8 <delay+0x94>)
	current = SYST_CVR;
     d72:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     d74:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d76:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     d78:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     d7a:	0152      	lsls	r2, r2, #5
     d7c:	d502      	bpl.n	d84 <delay+0x20>
     d7e:	2b32      	cmp	r3, #50	; 0x32
     d80:	bf88      	it	hi
     d82:	3401      	addhi	r4, #1
	if (ms > 0) {
     d84:	b395      	cbz	r5, dec <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
     d86:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     d8a:	4e1c      	ldr	r6, [pc, #112]	; (dfc <delay+0x98>)
	current = SYST_CVR;
     d8c:	f8df 9064 	ldr.w	r9, [pc, #100]	; df4 <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d90:	f8df 8064 	ldr.w	r8, [pc, #100]	; df8 <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
     d94:	33bf      	adds	r3, #191	; 0xbf
     d96:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     d9a:	fba6 1303 	umull	r1, r3, r6, r3
     d9e:	fb02 f404 	mul.w	r4, r2, r4
     da2:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
     da6:	b672      	cpsid	i
	current = SYST_CVR;
     da8:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     dac:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     dae:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     db2:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     db4:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     db8:	33bf      	adds	r3, #191	; 0xbf
     dba:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     dbe:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     dc2:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     dc6:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     dca:	d002      	beq.n	dd2 <delay+0x6e>
     dcc:	2932      	cmp	r1, #50	; 0x32
     dce:	bf88      	it	hi
     dd0:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     dd2:	fb00 3302 	mla	r3, r0, r2, r3
     dd6:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     dda:	d304      	bcc.n	de6 <delay+0x82>
				if (ms == 0) return;
     ddc:	3d01      	subs	r5, #1
     dde:	d005      	beq.n	dec <delay+0x88>
				start += 1000;
     de0:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     de4:	e7df      	b.n	da6 <delay+0x42>
			yield();
     de6:	f001 f8c1 	bl	1f6c <yield>
		}
     dea:	e7dc      	b.n	da6 <delay+0x42>
     dec:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     df0:	1fff92cc 	.word	0x1fff92cc
     df4:	e000e018 	.word	0xe000e018
     df8:	e000ed04 	.word	0xe000ed04
     dfc:	88888889 	.word	0x88888889

00000e00 <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
     e00:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     e02:	2b03      	cmp	r3, #3
     e04:	d814      	bhi.n	e30 <usb_rx+0x30>
	__disable_irq();
     e06:	b672      	cpsid	i
	ret = rx_first[endpoint];
     e08:	490a      	ldr	r1, [pc, #40]	; (e34 <usb_rx+0x34>)
     e0a:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
     e0e:	b168      	cbz	r0, e2c <usb_rx+0x2c>
{
     e10:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
     e12:	4c09      	ldr	r4, [pc, #36]	; (e38 <usb_rx+0x38>)
     e14:	8805      	ldrh	r5, [r0, #0]
     e16:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
     e1a:	6846      	ldr	r6, [r0, #4]
     e1c:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
     e20:	1b52      	subs	r2, r2, r5
     e22:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
     e26:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
     e28:	bc70      	pop	{r4, r5, r6}
     e2a:	4770      	bx	lr
	__enable_irq();
     e2c:	b662      	cpsie	i
}
     e2e:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     e30:	2000      	movs	r0, #0
     e32:	4770      	bx	lr
     e34:	1fff9328 	.word	0x1fff9328
     e38:	1fff95ac 	.word	0x1fff95ac

00000e3c <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
     e3c:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
     e3e:	2803      	cmp	r0, #3
     e40:	d80b      	bhi.n	e5a <usb_tx_packet_count+0x1e>
	__disable_irq();
     e42:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
     e44:	4b07      	ldr	r3, [pc, #28]	; (e64 <usb_tx_packet_count+0x28>)
     e46:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
     e4a:	b143      	cbz	r3, e5e <usb_tx_packet_count+0x22>
     e4c:	2000      	movs	r0, #0
     e4e:	685b      	ldr	r3, [r3, #4]
     e50:	3001      	adds	r0, #1
     e52:	2b00      	cmp	r3, #0
     e54:	d1fb      	bne.n	e4e <usb_tx_packet_count+0x12>
	__enable_irq();
     e56:	b662      	cpsie	i
	return count;
     e58:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
     e5a:	2000      	movs	r0, #0
}
     e5c:	4770      	bx	lr
	uint32_t count=0;
     e5e:	4618      	mov	r0, r3
     e60:	e7f9      	b.n	e56 <usb_tx_packet_count+0x1a>
     e62:	bf00      	nop
     e64:	1fff937c 	.word	0x1fff937c

00000e68 <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
     e68:	b430      	push	{r4, r5}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
     e6a:	b672      	cpsid	i
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     e6c:	4a2b      	ldr	r2, [pc, #172]	; (f1c <usb_rx_memory+0xb4>)
     e6e:	7813      	ldrb	r3, [r2, #0]
     e70:	071d      	lsls	r5, r3, #28
     e72:	d506      	bpl.n	e82 <usb_rx_memory+0x1a>
			if (table[index(i, RX, EVEN)].desc == 0) {
     e74:	4b2a      	ldr	r3, [pc, #168]	; (f20 <usb_rx_memory+0xb8>)
     e76:	6a19      	ldr	r1, [r3, #32]
     e78:	2900      	cmp	r1, #0
     e7a:	d036      	beq.n	eea <usb_rx_memory+0x82>
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
     e7c:	6a99      	ldr	r1, [r3, #40]	; 0x28
     e7e:	2900      	cmp	r1, #0
     e80:	d041      	beq.n	f06 <usb_rx_memory+0x9e>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     e82:	7853      	ldrb	r3, [r2, #1]
     e84:	071c      	lsls	r4, r3, #28
     e86:	d506      	bpl.n	e96 <usb_rx_memory+0x2e>
			if (table[index(i, RX, EVEN)].desc == 0) {
     e88:	4b25      	ldr	r3, [pc, #148]	; (f20 <usb_rx_memory+0xb8>)
     e8a:	6c19      	ldr	r1, [r3, #64]	; 0x40
     e8c:	2900      	cmp	r1, #0
     e8e:	d03e      	beq.n	f0e <usb_rx_memory+0xa6>
			if (table[index(i, RX, ODD)].desc == 0) {
     e90:	6c99      	ldr	r1, [r3, #72]	; 0x48
     e92:	2900      	cmp	r1, #0
     e94:	d039      	beq.n	f0a <usb_rx_memory+0xa2>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     e96:	7893      	ldrb	r3, [r2, #2]
     e98:	0719      	lsls	r1, r3, #28
     e9a:	d505      	bpl.n	ea8 <usb_rx_memory+0x40>
			if (table[index(i, RX, EVEN)].desc == 0) {
     e9c:	4b20      	ldr	r3, [pc, #128]	; (f20 <usb_rx_memory+0xb8>)
     e9e:	6e19      	ldr	r1, [r3, #96]	; 0x60
     ea0:	2900      	cmp	r1, #0
     ea2:	d036      	beq.n	f12 <usb_rx_memory+0xaa>
			if (table[index(i, RX, ODD)].desc == 0) {
     ea4:	6e99      	ldr	r1, [r3, #104]	; 0x68
     ea6:	b189      	cbz	r1, ecc <usb_rx_memory+0x64>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     ea8:	78d3      	ldrb	r3, [r2, #3]
     eaa:	071b      	lsls	r3, r3, #28
     eac:	d507      	bpl.n	ebe <usb_rx_memory+0x56>
			if (table[index(i, RX, EVEN)].desc == 0) {
     eae:	4b1c      	ldr	r3, [pc, #112]	; (f20 <usb_rx_memory+0xb8>)
     eb0:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
     eb4:	b37a      	cbz	r2, f16 <usb_rx_memory+0xae>
			if (table[index(i, RX, ODD)].desc == 0) {
     eb6:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
     eba:	2111      	movs	r1, #17
     ebc:	b13a      	cbz	r2, ece <usb_rx_memory+0x66>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
     ebe:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
     ec0:	4b18      	ldr	r3, [pc, #96]	; (f24 <usb_rx_memory+0xbc>)
     ec2:	2200      	movs	r2, #0
     ec4:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
     ec6:	bc30      	pop	{r4, r5}
	usb_free(packet);
     ec8:	f000 be70 	b.w	1bac <usb_free>
			if (table[index(i, RX, ODD)].desc == 0) {
     ecc:	210d      	movs	r1, #13
				usb_rx_memory_needed--;
     ece:	4c15      	ldr	r4, [pc, #84]	; (f24 <usb_rx_memory+0xbc>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
     ed0:	4d15      	ldr	r5, [pc, #84]	; (f28 <usb_rx_memory+0xc0>)
				usb_rx_memory_needed--;
     ed2:	7822      	ldrb	r2, [r4, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
     ed4:	f843 5031 	str.w	r5, [r3, r1, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
     ed8:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
     edc:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
     ede:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
     ee0:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
     ee2:	7022      	strb	r2, [r4, #0]
				__enable_irq();
     ee4:	b662      	cpsie	i
}
     ee6:	bc30      	pop	{r4, r5}
     ee8:	4770      	bx	lr
			if (table[index(i, RX, EVEN)].desc == 0) {
     eea:	2204      	movs	r2, #4
				usb_rx_memory_needed--;
     eec:	4c0d      	ldr	r4, [pc, #52]	; (f24 <usb_rx_memory+0xbc>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
     eee:	4d0f      	ldr	r5, [pc, #60]	; (f2c <usb_rx_memory+0xc4>)
				usb_rx_memory_needed--;
     ef0:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
     ef2:	f843 5032 	str.w	r5, [r3, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
     ef6:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
     efa:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
     efc:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
     efe:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
     f00:	7022      	strb	r2, [r4, #0]
				__enable_irq();
     f02:	b662      	cpsie	i
				return;
     f04:	e7ef      	b.n	ee6 <usb_rx_memory+0x7e>
			if (table[index(i, RX, ODD)].desc == 0) {
     f06:	2105      	movs	r1, #5
     f08:	e7e1      	b.n	ece <usb_rx_memory+0x66>
     f0a:	2109      	movs	r1, #9
     f0c:	e7df      	b.n	ece <usb_rx_memory+0x66>
			if (table[index(i, RX, EVEN)].desc == 0) {
     f0e:	2208      	movs	r2, #8
     f10:	e7ec      	b.n	eec <usb_rx_memory+0x84>
     f12:	220c      	movs	r2, #12
     f14:	e7ea      	b.n	eec <usb_rx_memory+0x84>
     f16:	2210      	movs	r2, #16
     f18:	e7e8      	b.n	eec <usb_rx_memory+0x84>
     f1a:	bf00      	nop
     f1c:	000032f0 	.word	0x000032f0
     f20:	1fff8000 	.word	0x1fff8000
     f24:	1fff93a5 	.word	0x1fff93a5
     f28:	004000c8 	.word	0x004000c8
     f2c:	00400088 	.word	0x00400088

00000f30 <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
     f30:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
     f32:	2b03      	cmp	r3, #3
     f34:	d81d      	bhi.n	f72 <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
     f36:	4a1b      	ldr	r2, [pc, #108]	; (fa4 <usb_tx+0x74>)
     f38:	0140      	lsls	r0, r0, #5
     f3a:	f040 0010 	orr.w	r0, r0, #16
{
     f3e:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
     f40:	4410      	add	r0, r2
	__disable_irq();
     f42:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
     f44:	4c18      	ldr	r4, [pc, #96]	; (fa8 <usb_tx+0x78>)
     f46:	5ce2      	ldrb	r2, [r4, r3]
     f48:	2a03      	cmp	r2, #3
     f4a:	d81b      	bhi.n	f84 <usb_tx+0x54>
     f4c:	e8df f002 	tbb	[pc, r2]
     f50:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
     f54:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
     f56:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
     f58:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
     f5a:	f010 0f08 	tst.w	r0, #8
     f5e:	bf14      	ite	ne
     f60:	23c8      	movne	r3, #200	; 0xc8
     f62:	2388      	moveq	r3, #136	; 0x88
     f64:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
     f68:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
     f6a:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
     f6c:	6041      	str	r1, [r0, #4]
	__enable_irq();
     f6e:	b662      	cpsie	i
}
     f70:	bc30      	pop	{r4, r5}
     f72:	4770      	bx	lr
		b++;
     f74:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
     f76:	2202      	movs	r2, #2
		break;
     f78:	e7ed      	b.n	f56 <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
     f7a:	2205      	movs	r2, #5
     f7c:	e7eb      	b.n	f56 <usb_tx+0x26>
		b++;
     f7e:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
     f80:	2204      	movs	r2, #4
		break;
     f82:	e7e8      	b.n	f56 <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
     f84:	4a09      	ldr	r2, [pc, #36]	; (fac <usb_tx+0x7c>)
     f86:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
     f8a:	b138      	cbz	r0, f9c <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
     f8c:	4a08      	ldr	r2, [pc, #32]	; (fb0 <usb_tx+0x80>)
     f8e:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
     f92:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
     f94:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
     f98:	b662      	cpsie	i
		return;
     f9a:	e7e9      	b.n	f70 <usb_tx+0x40>
			tx_first[endpoint] = packet;
     f9c:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
     fa0:	4a03      	ldr	r2, [pc, #12]	; (fb0 <usb_tx+0x80>)
     fa2:	e7f7      	b.n	f94 <usb_tx+0x64>
     fa4:	1fff8000 	.word	0x1fff8000
     fa8:	1fff93b4 	.word	0x1fff93b4
     fac:	1fff937c 	.word	0x1fff937c
     fb0:	1fff938c 	.word	0x1fff938c

00000fb4 <usb_isr>:
}



void usb_isr(void)
{
     fb4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
     fb8:	f8df b30c 	ldr.w	fp, [pc, #780]	; 12c8 <usb_isr+0x314>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
     fbc:	f8df a30c 	ldr.w	sl, [pc, #780]	; 12cc <usb_isr+0x318>
{
     fc0:	b087      	sub	sp, #28
     fc2:	e044      	b.n	104e <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
     fc4:	4fab      	ldr	r7, [pc, #684]	; (1274 <usb_isr+0x2c0>)
     fc6:	ea4f 0893 	mov.w	r8, r3, lsr #2
     fca:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
     fce:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
     fd0:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
     fd4:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
     fd8:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
     fda:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
     fde:	f003 04ff 	and.w	r4, r3, #255	; 0xff
     fe2:	2b00      	cmp	r3, #0
     fe4:	f040 8102 	bne.w	11ec <usb_isr+0x238>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
     fe8:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
     fec:	0c1b      	lsrs	r3, r3, #16
     fee:	b299      	uxth	r1, r3
     ff0:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
     ff4:	2b00      	cmp	r3, #0
     ff6:	f000 80f0 	beq.w	11da <usb_isr+0x226>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
     ffa:	4b9f      	ldr	r3, [pc, #636]	; (1278 <usb_isr+0x2c4>)
					packet->index = 0;
     ffc:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    1000:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    1004:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    1008:	2a00      	cmp	r2, #0
    100a:	f000 82c5 	beq.w	1598 <usb_isr+0x5e4>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    100e:	4d9b      	ldr	r5, [pc, #620]	; (127c <usb_isr+0x2c8>)
    1010:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    1014:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    1016:	4c9a      	ldr	r4, [pc, #616]	; (1280 <usb_isr+0x2cc>)
					rx_last[endpoint] = packet;
    1018:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    101c:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    1020:	4419      	add	r1, r3
    1022:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    1026:	f000 fda1 	bl	1b6c <usb_malloc>
					if (packet) {
    102a:	2800      	cmp	r0, #0
    102c:	f000 82ad 	beq.w	158a <usb_isr+0x5d6>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    1030:	4a94      	ldr	r2, [pc, #592]	; (1284 <usb_isr+0x2d0>)
    1032:	4b95      	ldr	r3, [pc, #596]	; (1288 <usb_isr+0x2d4>)
    1034:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    1038:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    103c:	bf18      	it	ne
    103e:	4613      	movne	r3, r2
						b->addr = packet->buf;
    1040:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    1044:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    1048:	2308      	movs	r3, #8
    104a:	f88b 3000 	strb.w	r3, [fp]
	status = USB0_ISTAT;
    104e:	f89b 4000 	ldrb.w	r4, [fp]
    1052:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    1054:	0761      	lsls	r1, r4, #29
    1056:	d51a      	bpl.n	108e <usb_isr+0xda>
		if (usb_configuration) {
    1058:	4b8c      	ldr	r3, [pc, #560]	; (128c <usb_isr+0x2d8>)
    105a:	781b      	ldrb	r3, [r3, #0]
    105c:	b1a3      	cbz	r3, 1088 <usb_isr+0xd4>
			t = usb_reboot_timer;
    105e:	498c      	ldr	r1, [pc, #560]	; (1290 <usb_isr+0x2dc>)
    1060:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    1062:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    1066:	b122      	cbz	r2, 1072 <usb_isr+0xbe>
				usb_reboot_timer = --t;
    1068:	3b01      	subs	r3, #1
    106a:	b2db      	uxtb	r3, r3
    106c:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    106e:	b903      	cbnz	r3, 1072 <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    1070:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    1072:	4988      	ldr	r1, [pc, #544]	; (1294 <usb_isr+0x2e0>)
    1074:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    1076:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    107a:	b12a      	cbz	r2, 1088 <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    107c:	3b01      	subs	r3, #1
    107e:	b2db      	uxtb	r3, r3
    1080:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    1082:	2b00      	cmp	r3, #0
    1084:	f000 8257 	beq.w	1536 <usb_isr+0x582>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    1088:	2304      	movs	r3, #4
    108a:	f88b 3000 	strb.w	r3, [fp]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    108e:	f004 0308 	and.w	r3, r4, #8
    1092:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    1096:	2b00      	cmp	r3, #0
    1098:	f000 80cc 	beq.w	1234 <usb_isr+0x280>
		stat = USB0_STAT;
    109c:	f89a 3000 	ldrb.w	r3, [sl]
    10a0:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    10a2:	091e      	lsrs	r6, r3, #4
    10a4:	d18e      	bne.n	fc4 <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    10a6:	089c      	lsrs	r4, r3, #2
    10a8:	f8df 91c8 	ldr.w	r9, [pc, #456]	; 1274 <usb_isr+0x2c0>
	switch (pid) {
    10ac:	f859 2034 	ldr.w	r2, [r9, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    10b0:	eb09 01c4 	add.w	r1, r9, r4, lsl #3
	switch (pid) {
    10b4:	f3c2 0283 	ubfx	r2, r2, #2, #4
    10b8:	3a01      	subs	r2, #1
	buf = b->addr;
    10ba:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    10bc:	2a0c      	cmp	r2, #12
    10be:	f200 8088 	bhi.w	11d2 <usb_isr+0x21e>
    10c2:	e8df f002 	tbb	[pc, r2]
    10c6:	7c7c      	.short	0x7c7c
    10c8:	86868686 	.word	0x86868686
    10cc:	86478686 	.word	0x86478686
    10d0:	8686      	.short	0x8686
    10d2:	07          	.byte	0x07
    10d3:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    10d4:	6808      	ldr	r0, [r1, #0]
    10d6:	4d70      	ldr	r5, [pc, #448]	; (1298 <usb_isr+0x2e4>)
		setup.word2 = *(uint32_t *)(buf + 4);
    10d8:	684a      	ldr	r2, [r1, #4]
		ep0_tx_ptr = NULL;
    10da:	4f70      	ldr	r7, [pc, #448]	; (129c <usb_isr+0x2e8>)
		ep0_tx_data_toggle = 1;
    10dc:	4e70      	ldr	r6, [pc, #448]	; (12a0 <usb_isr+0x2ec>)
		setup.word1 = *(uint32_t *)(buf);
    10de:	6028      	str	r0, [r5, #0]
	switch (setup.wRequestAndType) {
    10e0:	b281      	uxth	r1, r0
    10e2:	f240 6081 	movw	r0, #1665	; 0x681
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    10e6:	4b67      	ldr	r3, [pc, #412]	; (1284 <usb_isr+0x2d0>)
		setup.word2 = *(uint32_t *)(buf + 4);
    10e8:	606a      	str	r2, [r5, #4]
		ep0_tx_data_toggle = 1;
    10ea:	f04f 0e01 	mov.w	lr, #1
		ep0_tx_ptr = NULL;
    10ee:	2200      	movs	r2, #0
	switch (setup.wRequestAndType) {
    10f0:	4281      	cmp	r1, r0
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    10f2:	f849 3034 	str.w	r3, [r9, r4, lsl #3]
		ep0_tx_ptr = NULL;
    10f6:	603a      	str	r2, [r7, #0]
		table[index(0, TX, EVEN)].desc = 0;
    10f8:	f8c9 2010 	str.w	r2, [r9, #16]
		table[index(0, TX, ODD)].desc = 0;
    10fc:	f8c9 2018 	str.w	r2, [r9, #24]
		ep0_tx_data_toggle = 1;
    1100:	f886 e000 	strb.w	lr, [r6]
		table[index(0, TX, EVEN)].desc = 0;
    1104:	4c5b      	ldr	r4, [pc, #364]	; (1274 <usb_isr+0x2c0>)
	switch (setup.wRequestAndType) {
    1106:	f200 80e3 	bhi.w	12d0 <usb_isr+0x31c>
    110a:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    110e:	f080 8346 	bcs.w	179e <usb_isr+0x7ea>
    1112:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    1116:	f000 82fc 	beq.w	1712 <usb_isr+0x75e>
    111a:	f200 828d 	bhi.w	1638 <usb_isr+0x684>
    111e:	2980      	cmp	r1, #128	; 0x80
    1120:	f000 8377 	beq.w	1812 <usb_isr+0x85e>
    1124:	2982      	cmp	r1, #130	; 0x82
    1126:	f040 82fa 	bne.w	171e <usb_isr+0x76a>
    112a:	88a9      	ldrh	r1, [r5, #4]
    112c:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    1130:	2904      	cmp	r1, #4
    1132:	f200 82f4 	bhi.w	171e <usb_isr+0x76a>
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1136:	485b      	ldr	r0, [pc, #364]	; (12a4 <usb_isr+0x2f0>)
		reply_buffer[0] = 0;
    1138:	4c5b      	ldr	r4, [pc, #364]	; (12a8 <usb_isr+0x2f4>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    113a:	0089      	lsls	r1, r1, #2
    113c:	4408      	add	r0, r1
		reply_buffer[0] = 0;
    113e:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1140:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1142:	7802      	ldrb	r2, [r0, #0]
    1144:	0793      	lsls	r3, r2, #30
    1146:	f140 8455 	bpl.w	19f4 <usb_isr+0xa40>
    114a:	f884 e000 	strb.w	lr, [r4]
		datalen = 2;
    114e:	f04f 0e02 	mov.w	lr, #2
    1152:	e342      	b.n	17da <usb_isr+0x826>
		data = ep0_tx_ptr;
    1154:	4f51      	ldr	r7, [pc, #324]	; (129c <usb_isr+0x2e8>)
    1156:	683a      	ldr	r2, [r7, #0]
		if (data) {
    1158:	b332      	cbz	r2, 11a8 <usb_isr+0x1f4>
			size = ep0_tx_len;
    115a:	4b54      	ldr	r3, [pc, #336]	; (12ac <usb_isr+0x2f8>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    115c:	4e50      	ldr	r6, [pc, #320]	; (12a0 <usb_isr+0x2ec>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    115e:	4954      	ldr	r1, [pc, #336]	; (12b0 <usb_isr+0x2fc>)
			size = ep0_tx_len;
    1160:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1162:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1164:	780d      	ldrb	r5, [r1, #0]
    1166:	2840      	cmp	r0, #64	; 0x40
    1168:	4686      	mov	lr, r0
    116a:	f045 0802 	orr.w	r8, r5, #2
    116e:	bf28      	it	cs
    1170:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1174:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    1176:	f084 0401 	eor.w	r4, r4, #1
    117a:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    117c:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1180:	bf0c      	ite	eq
    1182:	2488      	moveq	r4, #136	; 0x88
    1184:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1186:	eb09 06c8 	add.w	r6, r9, r8, lsl #3
			ep0_tx_len -= size;
    118a:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    118c:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1190:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1194:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    1196:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1198:	f849 4038 	str.w	r4, [r9, r8, lsl #3]
			data += size;
    119c:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    119e:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    11a0:	2800      	cmp	r0, #0
    11a2:	f000 8145 	beq.w	1430 <usb_isr+0x47c>
    11a6:	603a      	str	r2, [r7, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    11a8:	4b3b      	ldr	r3, [pc, #236]	; (1298 <usb_isr+0x2e4>)
    11aa:	881a      	ldrh	r2, [r3, #0]
    11ac:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    11b0:	d10f      	bne.n	11d2 <usb_isr+0x21e>
			setup.bRequest = 0;
    11b2:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    11b4:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    11b6:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    11b8:	4b3e      	ldr	r3, [pc, #248]	; (12b4 <usb_isr+0x300>)
    11ba:	701a      	strb	r2, [r3, #0]
    11bc:	e009      	b.n	11d2 <usb_isr+0x21e>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    11be:	4a36      	ldr	r2, [pc, #216]	; (1298 <usb_isr+0x2e4>)
    11c0:	8810      	ldrh	r0, [r2, #0]
    11c2:	f242 0221 	movw	r2, #8225	; 0x2021
    11c6:	4290      	cmp	r0, r2
    11c8:	f000 8137 	beq.w	143a <usb_isr+0x486>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    11cc:	4a2d      	ldr	r2, [pc, #180]	; (1284 <usb_isr+0x2d0>)
    11ce:	f849 2034 	str.w	r2, [r9, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    11d2:	4a39      	ldr	r2, [pc, #228]	; (12b8 <usb_isr+0x304>)
    11d4:	2301      	movs	r3, #1
    11d6:	7013      	strb	r3, [r2, #0]
    11d8:	e736      	b.n	1048 <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    11da:	4a2a      	ldr	r2, [pc, #168]	; (1284 <usb_isr+0x2d0>)
    11dc:	4b2a      	ldr	r3, [pc, #168]	; (1288 <usb_isr+0x2d4>)
    11de:	f019 0f08 	tst.w	r9, #8
    11e2:	bf18      	it	ne
    11e4:	4613      	movne	r3, r2
    11e6:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    11ea:	e72d      	b.n	1048 <usb_isr+0x94>
				usb_free(packet);
    11ec:	f000 fcde 	bl	1bac <usb_free>
				packet = tx_first[endpoint];
    11f0:	4a32      	ldr	r2, [pc, #200]	; (12bc <usb_isr+0x308>)
					switch (tx_state[endpoint]) {
    11f2:	4933      	ldr	r1, [pc, #204]	; (12c0 <usb_isr+0x30c>)
				packet = tx_first[endpoint];
    11f4:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    11f8:	2b00      	cmp	r3, #0
    11fa:	f000 81d1 	beq.w	15a0 <usb_isr+0x5ec>
					tx_first[endpoint] = packet->next;
    11fe:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    1200:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    1202:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    1206:	f103 0208 	add.w	r2, r3, #8
    120a:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    120e:	2c03      	cmp	r4, #3
    1210:	d805      	bhi.n	121e <usb_isr+0x26a>
    1212:	e8df f004 	tbb	[pc, r4]
    1216:	022c      	.short	0x022c
    1218:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    121a:	2202      	movs	r2, #2
    121c:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    121e:	881a      	ldrh	r2, [r3, #0]
    1220:	f019 0f08 	tst.w	r9, #8
    1224:	bf0c      	ite	eq
    1226:	2388      	moveq	r3, #136	; 0x88
    1228:	23c8      	movne	r3, #200	; 0xc8
    122a:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    122e:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    1232:	e709      	b.n	1048 <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    1234:	07e0      	lsls	r0, r4, #31
    1236:	f100 8181 	bmi.w	153c <usb_isr+0x588>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    123a:	0621      	lsls	r1, r4, #24
    123c:	f100 81f2 	bmi.w	1624 <usb_isr+0x670>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1240:	07a2      	lsls	r2, r4, #30
    1242:	d506      	bpl.n	1252 <usb_isr+0x29e>
		uint8_t err = USB0_ERRSTAT;
    1244:	4a1f      	ldr	r2, [pc, #124]	; (12c4 <usb_isr+0x310>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    1246:	4920      	ldr	r1, [pc, #128]	; (12c8 <usb_isr+0x314>)
		uint8_t err = USB0_ERRSTAT;
    1248:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    124a:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    124c:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    124e:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1250:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    1252:	06e3      	lsls	r3, r4, #27
    1254:	d502      	bpl.n	125c <usb_isr+0x2a8>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    1256:	4b1c      	ldr	r3, [pc, #112]	; (12c8 <usb_isr+0x314>)
    1258:	2210      	movs	r2, #16
    125a:	701a      	strb	r2, [r3, #0]
	}

}
    125c:	b007      	add	sp, #28
    125e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    1262:	2204      	movs	r2, #4
    1264:	558a      	strb	r2, [r1, r6]
						break;
    1266:	e7da      	b.n	121e <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    1268:	2205      	movs	r2, #5
    126a:	558a      	strb	r2, [r1, r6]
						break;
    126c:	e7d7      	b.n	121e <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    126e:	2203      	movs	r2, #3
    1270:	558a      	strb	r2, [r1, r6]
						break;
    1272:	e7d4      	b.n	121e <usb_isr+0x26a>
    1274:	1fff8000 	.word	0x1fff8000
    1278:	1fff9328 	.word	0x1fff9328
    127c:	1fff92d4 	.word	0x1fff92d4
    1280:	1fff95ac 	.word	0x1fff95ac
    1284:	004000c8 	.word	0x004000c8
    1288:	00400088 	.word	0x00400088
    128c:	1fff93b0 	.word	0x1fff93b0
    1290:	1fff9339 	.word	0x1fff9339
    1294:	1fff93b8 	.word	0x1fff93b8
    1298:	1fff939c 	.word	0x1fff939c
    129c:	1fff92d0 	.word	0x1fff92d0
    12a0:	1fff9338 	.word	0x1fff9338
    12a4:	400720c0 	.word	0x400720c0
    12a8:	1fff93a8 	.word	0x1fff93a8
    12ac:	1fff92e4 	.word	0x1fff92e4
    12b0:	1fff93a4 	.word	0x1fff93a4
    12b4:	40072098 	.word	0x40072098
    12b8:	40072094 	.word	0x40072094
    12bc:	1fff937c 	.word	0x1fff937c
    12c0:	1fff93b4 	.word	0x1fff93b4
    12c4:	40072088 	.word	0x40072088
    12c8:	40072080 	.word	0x40072080
    12cc:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    12d0:	f242 0021 	movw	r0, #8225	; 0x2021
    12d4:	4281      	cmp	r1, r0
    12d6:	f000 812a 	beq.w	152e <usb_isr+0x57a>
    12da:	f200 80d8 	bhi.w	148e <usb_isr+0x4da>
    12de:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    12e2:	f000 8276 	beq.w	17d2 <usb_isr+0x81e>
    12e6:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    12ea:	f040 8218 	bne.w	171e <usb_isr+0x76a>
			if (table[i].desc & BDT_OWN) {
    12ee:	6a22      	ldr	r2, [r4, #32]
		usb_configuration = setup.wValue;
    12f0:	49b3      	ldr	r1, [pc, #716]	; (15c0 <usb_isr+0x60c>)
    12f2:	78a8      	ldrb	r0, [r5, #2]
    12f4:	7008      	strb	r0, [r1, #0]
			if (table[i].desc & BDT_OWN) {
    12f6:	0612      	lsls	r2, r2, #24
    12f8:	f100 8337 	bmi.w	196a <usb_isr+0x9b6>
    12fc:	f8d9 2028 	ldr.w	r2, [r9, #40]	; 0x28
    1300:	49b0      	ldr	r1, [pc, #704]	; (15c4 <usb_isr+0x610>)
    1302:	0613      	lsls	r3, r2, #24
    1304:	f100 832c 	bmi.w	1960 <usb_isr+0x9ac>
    1308:	f8d9 2030 	ldr.w	r2, [r9, #48]	; 0x30
    130c:	49ad      	ldr	r1, [pc, #692]	; (15c4 <usb_isr+0x610>)
    130e:	0615      	lsls	r5, r2, #24
    1310:	f100 82ff 	bmi.w	1912 <usb_isr+0x95e>
    1314:	f8d9 2038 	ldr.w	r2, [r9, #56]	; 0x38
    1318:	49aa      	ldr	r1, [pc, #680]	; (15c4 <usb_isr+0x610>)
    131a:	0614      	lsls	r4, r2, #24
    131c:	f100 82f4 	bmi.w	1908 <usb_isr+0x954>
    1320:	f8d9 2040 	ldr.w	r2, [r9, #64]	; 0x40
    1324:	49a7      	ldr	r1, [pc, #668]	; (15c4 <usb_isr+0x610>)
    1326:	0610      	lsls	r0, r2, #24
    1328:	f100 8347 	bmi.w	19ba <usb_isr+0xa06>
    132c:	f8d9 2048 	ldr.w	r2, [r9, #72]	; 0x48
    1330:	49a4      	ldr	r1, [pc, #656]	; (15c4 <usb_isr+0x610>)
    1332:	0612      	lsls	r2, r2, #24
    1334:	f100 833c 	bmi.w	19b0 <usb_isr+0x9fc>
    1338:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
    133c:	49a1      	ldr	r1, [pc, #644]	; (15c4 <usb_isr+0x610>)
    133e:	0613      	lsls	r3, r2, #24
    1340:	f100 8331 	bmi.w	19a6 <usb_isr+0x9f2>
    1344:	f8d9 2058 	ldr.w	r2, [r9, #88]	; 0x58
    1348:	499e      	ldr	r1, [pc, #632]	; (15c4 <usb_isr+0x610>)
    134a:	0615      	lsls	r5, r2, #24
    134c:	f100 8326 	bmi.w	199c <usb_isr+0x9e8>
    1350:	f8d9 2060 	ldr.w	r2, [r9, #96]	; 0x60
    1354:	499b      	ldr	r1, [pc, #620]	; (15c4 <usb_isr+0x610>)
    1356:	0614      	lsls	r4, r2, #24
    1358:	f100 831b 	bmi.w	1992 <usb_isr+0x9de>
    135c:	f8d9 2068 	ldr.w	r2, [r9, #104]	; 0x68
    1360:	4998      	ldr	r1, [pc, #608]	; (15c4 <usb_isr+0x610>)
    1362:	0610      	lsls	r0, r2, #24
    1364:	f100 8310 	bmi.w	1988 <usb_isr+0x9d4>
    1368:	f8d9 2070 	ldr.w	r2, [r9, #112]	; 0x70
    136c:	4995      	ldr	r1, [pc, #596]	; (15c4 <usb_isr+0x610>)
    136e:	0612      	lsls	r2, r2, #24
    1370:	f100 8305 	bmi.w	197e <usb_isr+0x9ca>
    1374:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    1378:	4992      	ldr	r1, [pc, #584]	; (15c4 <usb_isr+0x610>)
    137a:	0613      	lsls	r3, r2, #24
    137c:	f100 82fa 	bmi.w	1974 <usb_isr+0x9c0>
    1380:	f8d9 2080 	ldr.w	r2, [r9, #128]	; 0x80
    1384:	498f      	ldr	r1, [pc, #572]	; (15c4 <usb_isr+0x610>)
    1386:	0615      	lsls	r5, r2, #24
    1388:	f100 832e 	bmi.w	19e8 <usb_isr+0xa34>
    138c:	f8d9 2088 	ldr.w	r2, [r9, #136]	; 0x88
    1390:	498c      	ldr	r1, [pc, #560]	; (15c4 <usb_isr+0x610>)
    1392:	0614      	lsls	r4, r2, #24
    1394:	f100 8322 	bmi.w	19dc <usb_isr+0xa28>
    1398:	f8d9 2090 	ldr.w	r2, [r9, #144]	; 0x90
    139c:	4989      	ldr	r1, [pc, #548]	; (15c4 <usb_isr+0x610>)
    139e:	0610      	lsls	r0, r2, #24
    13a0:	f100 8316 	bmi.w	19d0 <usb_isr+0xa1c>
    13a4:	f8d9 2098 	ldr.w	r2, [r9, #152]	; 0x98
    13a8:	4986      	ldr	r1, [pc, #536]	; (15c4 <usb_isr+0x610>)
    13aa:	0612      	lsls	r2, r2, #24
    13ac:	f100 830a 	bmi.w	19c4 <usb_isr+0xa10>
    13b0:	4885      	ldr	r0, [pc, #532]	; (15c8 <usb_isr+0x614>)
    13b2:	4a86      	ldr	r2, [pc, #536]	; (15cc <usb_isr+0x618>)
    13b4:	4986      	ldr	r1, [pc, #536]	; (15d0 <usb_isr+0x61c>)
    13b6:	9001      	str	r0, [sp, #4]
    13b8:	4886      	ldr	r0, [pc, #536]	; (15d4 <usb_isr+0x620>)
    13ba:	4c87      	ldr	r4, [pc, #540]	; (15d8 <usb_isr+0x624>)
    13bc:	4d87      	ldr	r5, [pc, #540]	; (15dc <usb_isr+0x628>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    13be:	9402      	str	r4, [sp, #8]
{
    13c0:	2300      	movs	r3, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    13c2:	9704      	str	r7, [sp, #16]
    13c4:	9605      	str	r6, [sp, #20]
    13c6:	4680      	mov	r8, r0
    13c8:	461c      	mov	r4, r3
    13ca:	460f      	mov	r7, r1
    13cc:	4616      	mov	r6, r2
    13ce:	9503      	str	r5, [sp, #12]
			p = rx_first[i];
    13d0:	6830      	ldr	r0, [r6, #0]
			while (p) {
    13d2:	b128      	cbz	r0, 13e0 <usb_isr+0x42c>
				n = p->next;
    13d4:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    13d6:	f000 fbe9 	bl	1bac <usb_free>
			while (p) {
    13da:	4628      	mov	r0, r5
    13dc:	2d00      	cmp	r5, #0
    13de:	d1f9      	bne.n	13d4 <usb_isr+0x420>
			rx_first[i] = NULL;
    13e0:	2300      	movs	r3, #0
    13e2:	6033      	str	r3, [r6, #0]
			rx_last[i] = NULL;
    13e4:	9b03      	ldr	r3, [sp, #12]
			p = tx_first[i];
    13e6:	6838      	ldr	r0, [r7, #0]
			rx_last[i] = NULL;
    13e8:	461a      	mov	r2, r3
    13ea:	2300      	movs	r3, #0
    13ec:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
			while (p) {
    13f0:	b128      	cbz	r0, 13fe <usb_isr+0x44a>
				n = p->next;
    13f2:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    13f4:	f000 fbda 	bl	1bac <usb_free>
			while (p) {
    13f8:	4628      	mov	r0, r5
    13fa:	2d00      	cmp	r5, #0
    13fc:	d1f9      	bne.n	13f2 <usb_isr+0x43e>
			tx_first[i] = NULL;
    13fe:	2200      	movs	r2, #0
    1400:	603a      	str	r2, [r7, #0]
			tx_last[i] = NULL;
    1402:	9a01      	ldr	r2, [sp, #4]
			switch (tx_state[i]) {
    1404:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    1408:	4611      	mov	r1, r2
    140a:	2200      	movs	r2, #0
    140c:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    1410:	9a02      	ldr	r2, [sp, #8]
			tx_last[i] = NULL;
    1412:	9101      	str	r1, [sp, #4]
			switch (tx_state[i]) {
    1414:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    1416:	f04f 0100 	mov.w	r1, #0
    141a:	f822 1014 	strh.w	r1, [r2, r4, lsl #1]
			switch (tx_state[i]) {
    141e:	2b03      	cmp	r3, #3
    1420:	f200 812b 	bhi.w	167a <usb_isr+0x6c6>
    1424:	e8df f013 	tbh	[pc, r3, lsl #1]
    1428:	01250170 	.word	0x01250170
    142c:	01250170 	.word	0x01250170
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    1430:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1434:	bf18      	it	ne
    1436:	2200      	movne	r2, #0
    1438:	e6b5      	b.n	11a6 <usb_isr+0x1f2>
				*dst++ = *buf++;
    143a:	4a69      	ldr	r2, [pc, #420]	; (15e0 <usb_isr+0x62c>)
    143c:	780d      	ldrb	r5, [r1, #0]
    143e:	7848      	ldrb	r0, [r1, #1]
    1440:	7015      	strb	r5, [r2, #0]
    1442:	7050      	strb	r0, [r2, #1]
    1444:	788d      	ldrb	r5, [r1, #2]
    1446:	78c8      	ldrb	r0, [r1, #3]
    1448:	7095      	strb	r5, [r2, #2]
    144a:	70d0      	strb	r0, [r2, #3]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    144c:	6810      	ldr	r0, [r2, #0]
				*dst++ = *buf++;
    144e:	790d      	ldrb	r5, [r1, #4]
    1450:	7115      	strb	r5, [r2, #4]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1452:	2886      	cmp	r0, #134	; 0x86
				*dst++ = *buf++;
    1454:	794d      	ldrb	r5, [r1, #5]
    1456:	7989      	ldrb	r1, [r1, #6]
    1458:	7155      	strb	r5, [r2, #5]
    145a:	7191      	strb	r1, [r2, #6]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    145c:	f000 819b 	beq.w	1796 <usb_isr+0x7e2>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1460:	4960      	ldr	r1, [pc, #384]	; (15e4 <usb_isr+0x630>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1462:	4e61      	ldr	r6, [pc, #388]	; (15e8 <usb_isr+0x634>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1464:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1466:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1468:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    146c:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    146e:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    1472:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1474:	bf0c      	ite	eq
    1476:	2188      	moveq	r1, #136	; 0x88
    1478:	21c8      	movne	r1, #200	; 0xc8
    147a:	f849 1032 	str.w	r1, [r9, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    147e:	eb09 02c2 	add.w	r2, r9, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    1482:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1486:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    1488:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    148a:	6051      	str	r1, [r2, #4]
    148c:	e69e      	b.n	11cc <usb_isr+0x218>
	switch (setup.wRequestAndType) {
    148e:	f242 2021 	movw	r0, #8737	; 0x2221
    1492:	4281      	cmp	r1, r0
    1494:	f040 81cb 	bne.w	182e <usb_isr+0x87a>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    1498:	4b54      	ldr	r3, [pc, #336]	; (15ec <usb_isr+0x638>)
    149a:	4c55      	ldr	r4, [pc, #340]	; (15f0 <usb_isr+0x63c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    149c:	4955      	ldr	r1, [pc, #340]	; (15f4 <usb_isr+0x640>)
    149e:	78a8      	ldrb	r0, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    14a0:	681d      	ldr	r5, [r3, #0]
    14a2:	6025      	str	r5, [r4, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    14a4:	f8cd e004 	str.w	lr, [sp, #4]
    14a8:	7008      	strb	r0, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    14aa:	2000      	movs	r0, #0
    14ac:	9002      	str	r0, [sp, #8]
    14ae:	4680      	mov	r8, r0
    14b0:	4684      	mov	ip, r0
    14b2:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14b4:	494b      	ldr	r1, [pc, #300]	; (15e4 <usb_isr+0x630>)
    14b6:	780d      	ldrb	r5, [r1, #0]
    14b8:	f045 0e02 	orr.w	lr, r5, #2
    14bc:	eb09 03ce 	add.w	r3, r9, lr, lsl #3
    14c0:	9303      	str	r3, [sp, #12]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    14c2:	9b01      	ldr	r3, [sp, #4]
    14c4:	2b00      	cmp	r3, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14c6:	9b03      	ldr	r3, [sp, #12]
    14c8:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    14ca:	bf0c      	ite	eq
    14cc:	2488      	moveq	r4, #136	; 0x88
    14ce:	24c8      	movne	r4, #200	; 0xc8
    14d0:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    14d4:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    14d8:	f849 303e 	str.w	r3, [r9, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    14dc:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    14de:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    14e0:	f8df e0e0 	ldr.w	lr, [pc, #224]	; 15c4 <usb_isr+0x610>
	ep0_tx_data_toggle ^= 1;
    14e4:	4b40      	ldr	r3, [pc, #256]	; (15e8 <usb_isr+0x634>)
	ep0_tx_bdt_bank ^= 1;
    14e6:	f8df 80fc 	ldr.w	r8, [pc, #252]	; 15e4 <usb_isr+0x630>
	if (datalen == 0 && size < EP0_SIZE) return;
    14ea:	2800      	cmp	r0, #0
    14ec:	f040 811e 	bne.w	172c <usb_isr+0x778>
    14f0:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    14f4:	d11b      	bne.n	152e <usb_isr+0x57a>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14f6:	f044 0c02 	orr.w	ip, r4, #2
    14fa:	eb09 03cc 	add.w	r3, r9, ip, lsl #3
    14fe:	9c02      	ldr	r4, [sp, #8]
    1500:	f8df e0c0 	ldr.w	lr, [pc, #192]	; 15c4 <usb_isr+0x610>
    1504:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1506:	2a00      	cmp	r2, #0
    1508:	f040 8126 	bne.w	1758 <usb_isr+0x7a4>
    150c:	0402      	lsls	r2, r0, #16
    150e:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	ep0_tx_data_toggle ^= 1;
    1512:	f89d 3004 	ldrb.w	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1516:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
	data += size;
    151a:	4404      	add	r4, r0
	ep0_tx_data_toggle ^= 1;
    151c:	7033      	strb	r3, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    151e:	700d      	strb	r5, [r1, #0]
	data += size;
    1520:	4623      	mov	r3, r4
	if (datalen == 0 && size < EP0_SIZE) return;
    1522:	2840      	cmp	r0, #64	; 0x40
    1524:	d103      	bne.n	152e <usb_isr+0x57a>
    1526:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    1528:	4a33      	ldr	r2, [pc, #204]	; (15f8 <usb_isr+0x644>)
	ep0_tx_ptr = data;
    152a:	603b      	str	r3, [r7, #0]
	ep0_tx_len = datalen;
    152c:	8010      	strh	r0, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    152e:	4a33      	ldr	r2, [pc, #204]	; (15fc <usb_isr+0x648>)
    1530:	2301      	movs	r3, #1
    1532:	7013      	strb	r3, [r2, #0]
    1534:	e64d      	b.n	11d2 <usb_isr+0x21e>
				if (t == 0) usb_serial_flush_callback();
    1536:	f000 fcf5 	bl	1f24 <usb_serial_flush_callback>
    153a:	e5a5      	b.n	1088 <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    153c:	4b21      	ldr	r3, [pc, #132]	; (15c4 <usb_isr+0x610>)
		USB0_CTL = USB_CTL_ODDRST;
    153e:	482f      	ldr	r0, [pc, #188]	; (15fc <usb_isr+0x648>)
		ep0_tx_bdt_bank = 0;
    1540:	4928      	ldr	r1, [pc, #160]	; (15e4 <usb_isr+0x630>)
		table[index(0, TX, EVEN)].desc = 0;
    1542:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    1544:	f04f 0e02 	mov.w	lr, #2
    1548:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    154c:	4f2c      	ldr	r7, [pc, #176]	; (1600 <usb_isr+0x64c>)
		ep0_tx_bdt_bank = 0;
    154e:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1550:	492c      	ldr	r1, [pc, #176]	; (1604 <usb_isr+0x650>)
    1552:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    1554:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    1556:	4e2c      	ldr	r6, [pc, #176]	; (1608 <usb_isr+0x654>)
		USB0_ISTAT = 0xFF;
    1558:	4d2c      	ldr	r5, [pc, #176]	; (160c <usb_isr+0x658>)
		USB0_ADDR = 0;
    155a:	4c2d      	ldr	r4, [pc, #180]	; (1610 <usb_isr+0x65c>)
		table[index(0, TX, ODD)].desc = 0;
    155c:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    155e:	210d      	movs	r1, #13
    1560:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    1562:	21ff      	movs	r1, #255	; 0xff
    1564:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    1566:	f8df e0b8 	ldr.w	lr, [pc, #184]	; 1620 <usb_isr+0x66c>
		USB0_ISTAT = 0xFF;
    156a:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    156c:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    156e:	4d29      	ldr	r5, [pc, #164]	; (1614 <usb_isr+0x660>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1570:	4a29      	ldr	r2, [pc, #164]	; (1618 <usb_isr+0x664>)
		USB0_ERREN = 0xFF;
    1572:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    1576:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    1578:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    157a:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    157e:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    1580:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1582:	60da      	str	r2, [r3, #12]
}
    1584:	b007      	add	sp, #28
    1586:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    158a:	4a24      	ldr	r2, [pc, #144]	; (161c <usb_isr+0x668>)
						b->desc = 0;
    158c:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    1590:	7813      	ldrb	r3, [r2, #0]
    1592:	3301      	adds	r3, #1
    1594:	7013      	strb	r3, [r2, #0]
    1596:	e557      	b.n	1048 <usb_isr+0x94>
						rx_first[endpoint] = packet;
    1598:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    159c:	4d0f      	ldr	r5, [pc, #60]	; (15dc <usb_isr+0x628>)
    159e:	e53a      	b.n	1016 <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    15a0:	5d8b      	ldrb	r3, [r1, r6]
    15a2:	2b03      	cmp	r3, #3
    15a4:	f200 80f0 	bhi.w	1788 <usb_isr+0x7d4>
    15a8:	a201      	add	r2, pc, #4	; (adr r2, 15b0 <usb_isr+0x5fc>)
    15aa:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    15ae:	bf00      	nop
    15b0:	00001049 	.word	0x00001049
    15b4:	00001049 	.word	0x00001049
    15b8:	0000166d 	.word	0x0000166d
    15bc:	00001667 	.word	0x00001667
    15c0:	1fff93b0 	.word	0x1fff93b0
    15c4:	1fff8000 	.word	0x1fff8000
    15c8:	1fff938c 	.word	0x1fff938c
    15cc:	1fff9328 	.word	0x1fff9328
    15d0:	1fff937c 	.word	0x1fff937c
    15d4:	1fff93b4 	.word	0x1fff93b4
    15d8:	1fff95ac 	.word	0x1fff95ac
    15dc:	1fff92d4 	.word	0x1fff92d4
    15e0:	1fff95b4 	.word	0x1fff95b4
    15e4:	1fff93a4 	.word	0x1fff93a4
    15e8:	1fff9338 	.word	0x1fff9338
    15ec:	1fff92cc 	.word	0x1fff92cc
    15f0:	1fff95bc 	.word	0x1fff95bc
    15f4:	1fff93c8 	.word	0x1fff93c8
    15f8:	1fff92e4 	.word	0x1fff92e4
    15fc:	40072094 	.word	0x40072094
    1600:	400720c0 	.word	0x400720c0
    1604:	00400088 	.word	0x00400088
    1608:	40072088 	.word	0x40072088
    160c:	40072080 	.word	0x40072080
    1610:	40072098 	.word	0x40072098
    1614:	1fff92e8 	.word	0x1fff92e8
    1618:	1fff933c 	.word	0x1fff933c
    161c:	1fff93a5 	.word	0x1fff93a5
    1620:	4007208c 	.word	0x4007208c
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1624:	49bd      	ldr	r1, [pc, #756]	; (191c <usb_isr+0x968>)
		USB0_ISTAT = USB_ISTAT_STALL;
    1626:	4bbe      	ldr	r3, [pc, #760]	; (1920 <usb_isr+0x96c>)
    1628:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    162a:	200d      	movs	r0, #13
    162c:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    162e:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1630:	07a2      	lsls	r2, r4, #30
    1632:	f57f ae0e 	bpl.w	1252 <usb_isr+0x29e>
    1636:	e605      	b.n	1244 <usb_isr+0x290>
	switch (setup.wRequestAndType) {
    1638:	f240 3202 	movw	r2, #770	; 0x302
    163c:	4291      	cmp	r1, r2
    163e:	f040 80ee 	bne.w	181e <usb_isr+0x86a>
    1642:	88a9      	ldrh	r1, [r5, #4]
    1644:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1648:	2904      	cmp	r1, #4
    164a:	d868      	bhi.n	171e <usb_isr+0x76a>
    164c:	886a      	ldrh	r2, [r5, #2]
    164e:	2a00      	cmp	r2, #0
    1650:	d165      	bne.n	171e <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    1652:	48b2      	ldr	r0, [pc, #712]	; (191c <usb_isr+0x968>)
    1654:	f8cd e004 	str.w	lr, [sp, #4]
    1658:	0089      	lsls	r1, r1, #2
    165a:	4408      	add	r0, r1
    165c:	7801      	ldrb	r1, [r0, #0]
    165e:	f041 0102 	orr.w	r1, r1, #2
    1662:	7001      	strb	r1, [r0, #0]
    1664:	e721      	b.n	14aa <usb_isr+0x4f6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1666:	2301      	movs	r3, #1
    1668:	558b      	strb	r3, [r1, r6]
						break;
    166a:	e4ed      	b.n	1048 <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    166c:	2300      	movs	r3, #0
    166e:	558b      	strb	r3, [r1, r6]
						break;
    1670:	e4ea      	b.n	1048 <usb_isr+0x94>
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    1672:	f04f 0301 	mov.w	r3, #1
    1676:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    167a:	3401      	adds	r4, #1
    167c:	2c04      	cmp	r4, #4
    167e:	f106 0604 	add.w	r6, r6, #4
    1682:	f107 0704 	add.w	r7, r7, #4
    1686:	f108 0801 	add.w	r8, r8, #1
    168a:	f47f aea1 	bne.w	13d0 <usb_isr+0x41c>
			epconf = *cfg++;
    168e:	4ca5      	ldr	r4, [pc, #660]	; (1924 <usb_isr+0x970>)
			*reg = epconf;
    1690:	4ba5      	ldr	r3, [pc, #660]	; (1928 <usb_isr+0x974>)
			epconf = *cfg++;
    1692:	7822      	ldrb	r2, [r4, #0]
		usb_rx_memory_needed = 0;
    1694:	4da5      	ldr	r5, [pc, #660]	; (192c <usb_isr+0x978>)
    1696:	9f04      	ldr	r7, [sp, #16]
    1698:	9e05      	ldr	r6, [sp, #20]
    169a:	2100      	movs	r1, #0
    169c:	7029      	strb	r1, [r5, #0]
			*reg = epconf;
    169e:	701a      	strb	r2, [r3, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    16a0:	0713      	lsls	r3, r2, #28
    16a2:	f100 8105 	bmi.w	18b0 <usb_isr+0x8fc>
			epconf = *cfg++;
    16a6:	7862      	ldrb	r2, [r4, #1]
			*reg = epconf;
    16a8:	49a1      	ldr	r1, [pc, #644]	; (1930 <usb_isr+0x97c>)
			table[index(i, TX, EVEN)].desc = 0;
    16aa:	f8df 8290 	ldr.w	r8, [pc, #656]	; 193c <usb_isr+0x988>
			*reg = epconf;
    16ae:	700a      	strb	r2, [r1, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    16b0:	0710      	lsls	r0, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    16b2:	f04f 0100 	mov.w	r1, #0
    16b6:	f8c9 1030 	str.w	r1, [r9, #48]	; 0x30
			table[index(i, TX, ODD)].desc = 0;
    16ba:	f8c9 1038 	str.w	r1, [r9, #56]	; 0x38
			if (epconf & USB_ENDPT_EPRXEN) {
    16be:	f100 80e1 	bmi.w	1884 <usb_isr+0x8d0>
			*reg = epconf;
    16c2:	499c      	ldr	r1, [pc, #624]	; (1934 <usb_isr+0x980>)
			epconf = *cfg++;
    16c4:	78a2      	ldrb	r2, [r4, #2]
			*reg = epconf;
    16c6:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    16c8:	2100      	movs	r1, #0
    16ca:	f8c9 1050 	str.w	r1, [r9, #80]	; 0x50
			table[index(i, TX, ODD)].desc = 0;
    16ce:	f8c9 1058 	str.w	r1, [r9, #88]	; 0x58
			if (epconf & USB_ENDPT_EPRXEN) {
    16d2:	0711      	lsls	r1, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    16d4:	f8df 8264 	ldr.w	r8, [pc, #612]	; 193c <usb_isr+0x988>
			if (epconf & USB_ENDPT_EPRXEN) {
    16d8:	f100 8100 	bmi.w	18dc <usb_isr+0x928>
			epconf = *cfg++;
    16dc:	78e2      	ldrb	r2, [r4, #3]
			*reg = epconf;
    16de:	4996      	ldr	r1, [pc, #600]	; (1938 <usb_isr+0x984>)
			table[index(i, TX, EVEN)].desc = 0;
    16e0:	4c96      	ldr	r4, [pc, #600]	; (193c <usb_isr+0x988>)
			*reg = epconf;
    16e2:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    16e4:	2100      	movs	r1, #0
			if (epconf & USB_ENDPT_EPRXEN) {
    16e6:	0712      	lsls	r2, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    16e8:	f8c9 1070 	str.w	r1, [r9, #112]	; 0x70
			table[index(i, TX, ODD)].desc = 0;
    16ec:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
			if (epconf & USB_ENDPT_EPRXEN) {
    16f0:	f100 80b0 	bmi.w	1854 <usb_isr+0x8a0>
    16f4:	7833      	ldrb	r3, [r6, #0]
    16f6:	9301      	str	r3, [sp, #4]
			table[index(i, TX, EVEN)].desc = 0;
    16f8:	2100      	movs	r1, #0
    16fa:	f083 0201 	eor.w	r2, r3, #1
    16fe:	f8c9 1090 	str.w	r1, [r9, #144]	; 0x90
			table[index(i, TX, ODD)].desc = 0;
    1702:	f8c9 1098 	str.w	r1, [r9, #152]	; 0x98
    1706:	e6d0      	b.n	14aa <usb_isr+0x4f6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1708:	f04f 0300 	mov.w	r3, #0
    170c:	f888 3000 	strb.w	r3, [r8]
    1710:	e7b3      	b.n	167a <usb_isr+0x6c6>
    1712:	88a9      	ldrh	r1, [r5, #4]
    1714:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1718:	2904      	cmp	r1, #4
    171a:	f240 808d 	bls.w	1838 <usb_isr+0x884>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    171e:	4a7f      	ldr	r2, [pc, #508]	; (191c <usb_isr+0x968>)
    1720:	230f      	movs	r3, #15
    1722:	7013      	strb	r3, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1724:	4a86      	ldr	r2, [pc, #536]	; (1940 <usb_isr+0x98c>)
    1726:	2301      	movs	r3, #1
    1728:	7013      	strb	r3, [r2, #0]
    172a:	e552      	b.n	11d2 <usb_isr+0x21e>
	if (size > EP0_SIZE) size = EP0_SIZE;
    172c:	2840      	cmp	r0, #64	; 0x40
    172e:	f67f aee2 	bls.w	14f6 <usb_isr+0x542>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1732:	f044 0402 	orr.w	r4, r4, #2
    1736:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    173a:	9e02      	ldr	r6, [sp, #8]
    173c:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    173e:	b1ba      	cbz	r2, 1770 <usb_isr+0x7bc>
	ep0_tx_data_toggle ^= 1;
    1740:	f89d 1004 	ldrb.w	r1, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1744:	4a7f      	ldr	r2, [pc, #508]	; (1944 <usb_isr+0x990>)
	ep0_tx_data_toggle ^= 1;
    1746:	7019      	strb	r1, [r3, #0]
	data += size;
    1748:	4633      	mov	r3, r6
    174a:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    174c:	f888 5000 	strb.w	r5, [r8]
	data += size;
    1750:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1752:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1756:	e6e7      	b.n	1528 <usb_isr+0x574>
	ep0_tx_data_toggle ^= 1;
    1758:	f89d 3004 	ldrb.w	r3, [sp, #4]
    175c:	7033      	strb	r3, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    175e:	0402      	lsls	r2, r0, #16
	data += size;
    1760:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_bdt_bank ^= 1;
    1762:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1764:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	data += size;
    1768:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    176a:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
    176e:	e6d8      	b.n	1522 <usb_isr+0x56e>
	ep0_tx_data_toggle ^= 1;
    1770:	f89d 1004 	ldrb.w	r1, [sp, #4]
    1774:	7019      	strb	r1, [r3, #0]
	data += size;
    1776:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1778:	4a73      	ldr	r2, [pc, #460]	; (1948 <usb_isr+0x994>)
	ep0_tx_bdt_bank ^= 1;
    177a:	f888 5000 	strb.w	r5, [r8]
    177e:	3840      	subs	r0, #64	; 0x40
	data += size;
    1780:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1782:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    1786:	e6cf      	b.n	1528 <usb_isr+0x574>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    1788:	f019 0f08 	tst.w	r9, #8
    178c:	bf0c      	ite	eq
    178e:	2302      	moveq	r3, #2
    1790:	2303      	movne	r3, #3
    1792:	558b      	strb	r3, [r1, r6]
						break;
    1794:	e458      	b.n	1048 <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1796:	4a6d      	ldr	r2, [pc, #436]	; (194c <usb_isr+0x998>)
    1798:	210f      	movs	r1, #15
    179a:	7011      	strb	r1, [r2, #0]
    179c:	e660      	b.n	1460 <usb_isr+0x4ac>
			if (list->addr == NULL) break;
    179e:	4a6c      	ldr	r2, [pc, #432]	; (1950 <usb_isr+0x99c>)
    17a0:	6854      	ldr	r4, [r2, #4]
    17a2:	2c00      	cmp	r4, #0
    17a4:	d0bb      	beq.n	171e <usb_isr+0x76a>
    17a6:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    17a8:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    17ac:	e003      	b.n	17b6 <usb_isr+0x802>
		for (list = usb_descriptor_list; 1; list++) {
    17ae:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    17b0:	6854      	ldr	r4, [r2, #4]
    17b2:	2c00      	cmp	r4, #0
    17b4:	d0b3      	beq.n	171e <usb_isr+0x76a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    17b6:	8813      	ldrh	r3, [r2, #0]
    17b8:	4283      	cmp	r3, r0
    17ba:	d1f8      	bne.n	17ae <usb_isr+0x7fa>
    17bc:	8853      	ldrh	r3, [r2, #2]
    17be:	4573      	cmp	r3, lr
    17c0:	d1f5      	bne.n	17ae <usb_isr+0x7fa>
				if ((setup.wValue >> 8) == 3) {
    17c2:	0a00      	lsrs	r0, r0, #8
    17c4:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    17c6:	bf0c      	ite	eq
    17c8:	f894 e000 	ldrbeq.w	lr, [r4]
					datalen = list->length;
    17cc:	f8b2 e008 	ldrhne.w	lr, [r2, #8]
    17d0:	e003      	b.n	17da <usb_isr+0x826>
		reply_buffer[0] = usb_configuration;
    17d2:	4a60      	ldr	r2, [pc, #384]	; (1954 <usb_isr+0x9a0>)
    17d4:	4c60      	ldr	r4, [pc, #384]	; (1958 <usb_isr+0x9a4>)
    17d6:	7812      	ldrb	r2, [r2, #0]
    17d8:	7022      	strb	r2, [r4, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    17da:	88e8      	ldrh	r0, [r5, #6]
    17dc:	4570      	cmp	r0, lr
    17de:	f080 8131 	bcs.w	1a44 <usb_isr+0xa90>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    17e2:	495e      	ldr	r1, [pc, #376]	; (195c <usb_isr+0x9a8>)
    17e4:	780d      	ldrb	r5, [r1, #0]
    17e6:	2840      	cmp	r0, #64	; 0x40
    17e8:	4684      	mov	ip, r0
    17ea:	f045 0e02 	orr.w	lr, r5, #2
    17ee:	bf28      	it	cs
    17f0:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    17f4:	eb04 030c 	add.w	r3, r4, ip
    17f8:	eb09 02ce 	add.w	r2, r9, lr, lsl #3
    17fc:	9302      	str	r3, [sp, #8]
    17fe:	2301      	movs	r3, #1
    1800:	6054      	str	r4, [r2, #4]
    1802:	ebcc 0000 	rsb	r0, ip, r0
    1806:	ea4f 480c 	mov.w	r8, ip, lsl #16
    180a:	2200      	movs	r2, #0
    180c:	9301      	str	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    180e:	24c8      	movs	r4, #200	; 0xc8
    1810:	e65e      	b.n	14d0 <usb_isr+0x51c>
		reply_buffer[0] = 0;
    1812:	4c51      	ldr	r4, [pc, #324]	; (1958 <usb_isr+0x9a4>)
		datalen = 2;
    1814:	f04f 0e02 	mov.w	lr, #2
		reply_buffer[0] = 0;
    1818:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    181a:	7062      	strb	r2, [r4, #1]
    181c:	e7dd      	b.n	17da <usb_isr+0x826>
	switch (setup.wRequestAndType) {
    181e:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    1822:	f47f af7c 	bne.w	171e <usb_isr+0x76a>
    1826:	2301      	movs	r3, #1
    1828:	2200      	movs	r2, #0
    182a:	9301      	str	r3, [sp, #4]
    182c:	e63d      	b.n	14aa <usb_isr+0x4f6>
    182e:	f242 3221 	movw	r2, #8993	; 0x2321
    1832:	4291      	cmp	r1, r2
    1834:	d0f7      	beq.n	1826 <usb_isr+0x872>
    1836:	e772      	b.n	171e <usb_isr+0x76a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1838:	886a      	ldrh	r2, [r5, #2]
    183a:	2a00      	cmp	r2, #0
    183c:	f47f af6f 	bne.w	171e <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    1840:	4836      	ldr	r0, [pc, #216]	; (191c <usb_isr+0x968>)
    1842:	f8cd e004 	str.w	lr, [sp, #4]
    1846:	0089      	lsls	r1, r1, #2
    1848:	4408      	add	r0, r1
    184a:	7801      	ldrb	r1, [r0, #0]
    184c:	f021 0102 	bic.w	r1, r1, #2
    1850:	7001      	strb	r1, [r0, #0]
    1852:	e62a      	b.n	14aa <usb_isr+0x4f6>
				p = usb_malloc();
    1854:	f000 f98a 	bl	1b6c <usb_malloc>
				if (p) {
    1858:	2800      	cmp	r0, #0
    185a:	f000 80e6 	beq.w	1a2a <usb_isr+0xa76>
					table[index(i, RX, EVEN)].addr = p->buf;
    185e:	3008      	adds	r0, #8
    1860:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1864:	4838      	ldr	r0, [pc, #224]	; (1948 <usb_isr+0x994>)
    1866:	f8c9 0080 	str.w	r0, [r9, #128]	; 0x80
				p = usb_malloc();
    186a:	f000 f97f 	bl	1b6c <usb_malloc>
    186e:	4a33      	ldr	r2, [pc, #204]	; (193c <usb_isr+0x988>)
				if (p) {
    1870:	2800      	cmp	r0, #0
    1872:	f000 80d4 	beq.w	1a1e <usb_isr+0xa6a>
					table[index(i, RX, ODD)].addr = p->buf;
    1876:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1878:	4932      	ldr	r1, [pc, #200]	; (1944 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    187a:	f8c2 008c 	str.w	r0, [r2, #140]	; 0x8c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    187e:	f8c2 1088 	str.w	r1, [r2, #136]	; 0x88
    1882:	e737      	b.n	16f4 <usb_isr+0x740>
				p = usb_malloc();
    1884:	f000 f972 	bl	1b6c <usb_malloc>
				if (p) {
    1888:	2800      	cmp	r0, #0
    188a:	f000 80bb 	beq.w	1a04 <usb_isr+0xa50>
					table[index(i, RX, EVEN)].addr = p->buf;
    188e:	3008      	adds	r0, #8
    1890:	f8c8 0044 	str.w	r0, [r8, #68]	; 0x44
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1894:	482c      	ldr	r0, [pc, #176]	; (1948 <usb_isr+0x994>)
    1896:	f8c9 0040 	str.w	r0, [r9, #64]	; 0x40
				p = usb_malloc();
    189a:	f000 f967 	bl	1b6c <usb_malloc>
    189e:	4a27      	ldr	r2, [pc, #156]	; (193c <usb_isr+0x988>)
				if (p) {
    18a0:	2800      	cmp	r0, #0
    18a2:	f000 80aa 	beq.w	19fa <usb_isr+0xa46>
					table[index(i, RX, ODD)].addr = p->buf;
    18a6:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18a8:	4926      	ldr	r1, [pc, #152]	; (1944 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    18aa:	64d0      	str	r0, [r2, #76]	; 0x4c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18ac:	6491      	str	r1, [r2, #72]	; 0x48
    18ae:	e708      	b.n	16c2 <usb_isr+0x70e>
				p = usb_malloc();
    18b0:	f000 f95c 	bl	1b6c <usb_malloc>
				if (p) {
    18b4:	2800      	cmp	r0, #0
    18b6:	f000 80c1 	beq.w	1a3c <usb_isr+0xa88>
					table[index(i, RX, EVEN)].addr = p->buf;
    18ba:	3008      	adds	r0, #8
    18bc:	f8c9 0024 	str.w	r0, [r9, #36]	; 0x24
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    18c0:	4821      	ldr	r0, [pc, #132]	; (1948 <usb_isr+0x994>)
    18c2:	f8c9 0020 	str.w	r0, [r9, #32]
				p = usb_malloc();
    18c6:	f000 f951 	bl	1b6c <usb_malloc>
    18ca:	4a1c      	ldr	r2, [pc, #112]	; (193c <usb_isr+0x988>)
				if (p) {
    18cc:	2800      	cmp	r0, #0
    18ce:	f000 80b0 	beq.w	1a32 <usb_isr+0xa7e>
					table[index(i, RX, ODD)].addr = p->buf;
    18d2:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18d4:	491b      	ldr	r1, [pc, #108]	; (1944 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    18d6:	62d0      	str	r0, [r2, #44]	; 0x2c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18d8:	6291      	str	r1, [r2, #40]	; 0x28
    18da:	e6e4      	b.n	16a6 <usb_isr+0x6f2>
				p = usb_malloc();
    18dc:	f000 f946 	bl	1b6c <usb_malloc>
				if (p) {
    18e0:	2800      	cmp	r0, #0
    18e2:	f000 8098 	beq.w	1a16 <usb_isr+0xa62>
					table[index(i, RX, EVEN)].addr = p->buf;
    18e6:	3008      	adds	r0, #8
    18e8:	f8c8 0064 	str.w	r0, [r8, #100]	; 0x64
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    18ec:	4816      	ldr	r0, [pc, #88]	; (1948 <usb_isr+0x994>)
    18ee:	f8c9 0060 	str.w	r0, [r9, #96]	; 0x60
				p = usb_malloc();
    18f2:	f000 f93b 	bl	1b6c <usb_malloc>
    18f6:	4a11      	ldr	r2, [pc, #68]	; (193c <usb_isr+0x988>)
				if (p) {
    18f8:	2800      	cmp	r0, #0
    18fa:	f000 8087 	beq.w	1a0c <usb_isr+0xa58>
					table[index(i, RX, ODD)].addr = p->buf;
    18fe:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1900:	4910      	ldr	r1, [pc, #64]	; (1944 <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    1902:	66d0      	str	r0, [r2, #108]	; 0x6c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1904:	6691      	str	r1, [r2, #104]	; 0x68
    1906:	e6e9      	b.n	16dc <usb_isr+0x728>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    1908:	6bc8      	ldr	r0, [r1, #60]	; 0x3c
    190a:	3808      	subs	r0, #8
    190c:	f000 f94e 	bl	1bac <usb_free>
    1910:	e506      	b.n	1320 <usb_isr+0x36c>
    1912:	6b48      	ldr	r0, [r1, #52]	; 0x34
    1914:	3808      	subs	r0, #8
    1916:	f000 f949 	bl	1bac <usb_free>
    191a:	e4fb      	b.n	1314 <usb_isr+0x360>
    191c:	400720c0 	.word	0x400720c0
    1920:	40072080 	.word	0x40072080
    1924:	000032f0 	.word	0x000032f0
    1928:	400720c4 	.word	0x400720c4
    192c:	1fff93a5 	.word	0x1fff93a5
    1930:	400720c8 	.word	0x400720c8
    1934:	400720cc 	.word	0x400720cc
    1938:	400720d0 	.word	0x400720d0
    193c:	1fff8000 	.word	0x1fff8000
    1940:	40072094 	.word	0x40072094
    1944:	004000c8 	.word	0x004000c8
    1948:	00400088 	.word	0x00400088
    194c:	1fff9339 	.word	0x1fff9339
    1950:	000032f4 	.word	0x000032f4
    1954:	1fff93b0 	.word	0x1fff93b0
    1958:	1fff93a8 	.word	0x1fff93a8
    195c:	1fff93a4 	.word	0x1fff93a4
    1960:	6ac8      	ldr	r0, [r1, #44]	; 0x2c
    1962:	3808      	subs	r0, #8
    1964:	f000 f922 	bl	1bac <usb_free>
    1968:	e4ce      	b.n	1308 <usb_isr+0x354>
    196a:	6a60      	ldr	r0, [r4, #36]	; 0x24
    196c:	3808      	subs	r0, #8
    196e:	f000 f91d 	bl	1bac <usb_free>
    1972:	e4c3      	b.n	12fc <usb_isr+0x348>
    1974:	6fc8      	ldr	r0, [r1, #124]	; 0x7c
    1976:	3808      	subs	r0, #8
    1978:	f000 f918 	bl	1bac <usb_free>
    197c:	e500      	b.n	1380 <usb_isr+0x3cc>
    197e:	6f48      	ldr	r0, [r1, #116]	; 0x74
    1980:	3808      	subs	r0, #8
    1982:	f000 f913 	bl	1bac <usb_free>
    1986:	e4f5      	b.n	1374 <usb_isr+0x3c0>
    1988:	6ec8      	ldr	r0, [r1, #108]	; 0x6c
    198a:	3808      	subs	r0, #8
    198c:	f000 f90e 	bl	1bac <usb_free>
    1990:	e4ea      	b.n	1368 <usb_isr+0x3b4>
    1992:	6e48      	ldr	r0, [r1, #100]	; 0x64
    1994:	3808      	subs	r0, #8
    1996:	f000 f909 	bl	1bac <usb_free>
    199a:	e4df      	b.n	135c <usb_isr+0x3a8>
    199c:	6dc8      	ldr	r0, [r1, #92]	; 0x5c
    199e:	3808      	subs	r0, #8
    19a0:	f000 f904 	bl	1bac <usb_free>
    19a4:	e4d4      	b.n	1350 <usb_isr+0x39c>
    19a6:	6d48      	ldr	r0, [r1, #84]	; 0x54
    19a8:	3808      	subs	r0, #8
    19aa:	f000 f8ff 	bl	1bac <usb_free>
    19ae:	e4c9      	b.n	1344 <usb_isr+0x390>
    19b0:	6cc8      	ldr	r0, [r1, #76]	; 0x4c
    19b2:	3808      	subs	r0, #8
    19b4:	f000 f8fa 	bl	1bac <usb_free>
    19b8:	e4be      	b.n	1338 <usb_isr+0x384>
    19ba:	6c48      	ldr	r0, [r1, #68]	; 0x44
    19bc:	3808      	subs	r0, #8
    19be:	f000 f8f5 	bl	1bac <usb_free>
    19c2:	e4b3      	b.n	132c <usb_isr+0x378>
    19c4:	f8d1 009c 	ldr.w	r0, [r1, #156]	; 0x9c
    19c8:	3808      	subs	r0, #8
    19ca:	f000 f8ef 	bl	1bac <usb_free>
    19ce:	e4ef      	b.n	13b0 <usb_isr+0x3fc>
    19d0:	f8d1 0094 	ldr.w	r0, [r1, #148]	; 0x94
    19d4:	3808      	subs	r0, #8
    19d6:	f000 f8e9 	bl	1bac <usb_free>
    19da:	e4e3      	b.n	13a4 <usb_isr+0x3f0>
    19dc:	f8d1 008c 	ldr.w	r0, [r1, #140]	; 0x8c
    19e0:	3808      	subs	r0, #8
    19e2:	f000 f8e3 	bl	1bac <usb_free>
    19e6:	e4d7      	b.n	1398 <usb_isr+0x3e4>
    19e8:	f8d1 0084 	ldr.w	r0, [r1, #132]	; 0x84
    19ec:	3808      	subs	r0, #8
    19ee:	f000 f8dd 	bl	1bac <usb_free>
    19f2:	e4cb      	b.n	138c <usb_isr+0x3d8>
		datalen = 2;
    19f4:	f04f 0e02 	mov.w	lr, #2
    19f8:	e6ef      	b.n	17da <usb_isr+0x826>
					usb_rx_memory_needed++;
    19fa:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    19fc:	6490      	str	r0, [r2, #72]	; 0x48
					usb_rx_memory_needed++;
    19fe:	1c4a      	adds	r2, r1, #1
    1a00:	702a      	strb	r2, [r5, #0]
    1a02:	e65e      	b.n	16c2 <usb_isr+0x70e>
					usb_rx_memory_needed++;
    1a04:	782a      	ldrb	r2, [r5, #0]
    1a06:	3201      	adds	r2, #1
    1a08:	702a      	strb	r2, [r5, #0]
    1a0a:	e744      	b.n	1896 <usb_isr+0x8e2>
					usb_rx_memory_needed++;
    1a0c:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a0e:	6690      	str	r0, [r2, #104]	; 0x68
					usb_rx_memory_needed++;
    1a10:	1c4a      	adds	r2, r1, #1
    1a12:	702a      	strb	r2, [r5, #0]
    1a14:	e662      	b.n	16dc <usb_isr+0x728>
					usb_rx_memory_needed++;
    1a16:	782a      	ldrb	r2, [r5, #0]
    1a18:	3201      	adds	r2, #1
    1a1a:	702a      	strb	r2, [r5, #0]
    1a1c:	e767      	b.n	18ee <usb_isr+0x93a>
					usb_rx_memory_needed++;
    1a1e:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a20:	f8c2 0088 	str.w	r0, [r2, #136]	; 0x88
					usb_rx_memory_needed++;
    1a24:	1c4a      	adds	r2, r1, #1
    1a26:	702a      	strb	r2, [r5, #0]
    1a28:	e664      	b.n	16f4 <usb_isr+0x740>
					usb_rx_memory_needed++;
    1a2a:	782a      	ldrb	r2, [r5, #0]
    1a2c:	3201      	adds	r2, #1
    1a2e:	702a      	strb	r2, [r5, #0]
    1a30:	e719      	b.n	1866 <usb_isr+0x8b2>
					usb_rx_memory_needed++;
    1a32:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a34:	6290      	str	r0, [r2, #40]	; 0x28
					usb_rx_memory_needed++;
    1a36:	1c4a      	adds	r2, r1, #1
    1a38:	702a      	strb	r2, [r5, #0]
    1a3a:	e634      	b.n	16a6 <usb_isr+0x6f2>
					usb_rx_memory_needed++;
    1a3c:	782a      	ldrb	r2, [r5, #0]
    1a3e:	3201      	adds	r2, #1
    1a40:	702a      	strb	r2, [r5, #0]
    1a42:	e73e      	b.n	18c2 <usb_isr+0x90e>
    1a44:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1a48:	46f4      	mov	ip, lr
    1a4a:	bf28      	it	cs
    1a4c:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    1a50:	eb04 030c 	add.w	r3, r4, ip
    1a54:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1a56:	2301      	movs	r3, #1
    1a58:	ebcc 000e 	rsb	r0, ip, lr
    1a5c:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1a60:	2200      	movs	r2, #0
    1a62:	9301      	str	r3, [sp, #4]
    1a64:	e526      	b.n	14b4 <usb_isr+0x500>
    1a66:	bf00      	nop

00001a68 <usb_init>:



void usb_init(void)
{
    1a68:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    1a6a:	f000 fe59 	bl	2720 <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    1a6e:	4b29      	ldr	r3, [pc, #164]	; (1b14 <usb_init+0xac>)
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1a70:	4829      	ldr	r0, [pc, #164]	; (1b18 <usb_init+0xb0>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1a72:	4c2a      	ldr	r4, [pc, #168]	; (1b1c <usb_init+0xb4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1a74:	4f2a      	ldr	r7, [pc, #168]	; (1b20 <usb_init+0xb8>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1a76:	4d2b      	ldr	r5, [pc, #172]	; (1b24 <usb_init+0xbc>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
    1a78:	f8df c0bc 	ldr.w	ip, [pc, #188]	; 1b38 <usb_init+0xd0>
	USB0_ERRSTAT = 0xFF;
    1a7c:	f8df e0bc 	ldr.w	lr, [pc, #188]	; 1b3c <usb_init+0xd4>
	USB0_OTGISTAT = 0xFF;

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    1a80:	4e29      	ldr	r6, [pc, #164]	; (1b28 <usb_init+0xc0>)
		table[i].desc = 0;
    1a82:	2200      	movs	r2, #0
    1a84:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    1a86:	605a      	str	r2, [r3, #4]
		table[i].desc = 0;
    1a88:	609a      	str	r2, [r3, #8]
		table[i].addr = 0;
    1a8a:	60da      	str	r2, [r3, #12]
		table[i].desc = 0;
    1a8c:	611a      	str	r2, [r3, #16]
		table[i].addr = 0;
    1a8e:	615a      	str	r2, [r3, #20]
		table[i].desc = 0;
    1a90:	619a      	str	r2, [r3, #24]
		table[i].addr = 0;
    1a92:	61da      	str	r2, [r3, #28]
		table[i].desc = 0;
    1a94:	621a      	str	r2, [r3, #32]
		table[i].addr = 0;
    1a96:	625a      	str	r2, [r3, #36]	; 0x24
		table[i].desc = 0;
    1a98:	629a      	str	r2, [r3, #40]	; 0x28
		table[i].addr = 0;
    1a9a:	62da      	str	r2, [r3, #44]	; 0x2c
		table[i].desc = 0;
    1a9c:	631a      	str	r2, [r3, #48]	; 0x30
		table[i].addr = 0;
    1a9e:	635a      	str	r2, [r3, #52]	; 0x34
		table[i].desc = 0;
    1aa0:	639a      	str	r2, [r3, #56]	; 0x38
		table[i].addr = 0;
    1aa2:	63da      	str	r2, [r3, #60]	; 0x3c
		table[i].desc = 0;
    1aa4:	641a      	str	r2, [r3, #64]	; 0x40
		table[i].addr = 0;
    1aa6:	645a      	str	r2, [r3, #68]	; 0x44
		table[i].desc = 0;
    1aa8:	649a      	str	r2, [r3, #72]	; 0x48
		table[i].addr = 0;
    1aaa:	64da      	str	r2, [r3, #76]	; 0x4c
		table[i].desc = 0;
    1aac:	651a      	str	r2, [r3, #80]	; 0x50
		table[i].addr = 0;
    1aae:	655a      	str	r2, [r3, #84]	; 0x54
		table[i].desc = 0;
    1ab0:	659a      	str	r2, [r3, #88]	; 0x58
		table[i].addr = 0;
    1ab2:	65da      	str	r2, [r3, #92]	; 0x5c
		table[i].desc = 0;
    1ab4:	661a      	str	r2, [r3, #96]	; 0x60
		table[i].addr = 0;
    1ab6:	665a      	str	r2, [r3, #100]	; 0x64
		table[i].desc = 0;
    1ab8:	669a      	str	r2, [r3, #104]	; 0x68
		table[i].addr = 0;
    1aba:	66da      	str	r2, [r3, #108]	; 0x6c
		table[i].desc = 0;
    1abc:	671a      	str	r2, [r3, #112]	; 0x70
		table[i].addr = 0;
    1abe:	675a      	str	r2, [r3, #116]	; 0x74
		table[i].desc = 0;
    1ac0:	679a      	str	r2, [r3, #120]	; 0x78
		table[i].addr = 0;
    1ac2:	67da      	str	r2, [r3, #124]	; 0x7c
		table[i].desc = 0;
    1ac4:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1ac8:	6801      	ldr	r1, [r0, #0]
		table[i].addr = 0;
    1aca:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1ace:	f441 2180 	orr.w	r1, r1, #262144	; 0x40000
    1ad2:	6001      	str	r1, [r0, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1ad4:	f3c3 2107 	ubfx	r1, r3, #8, #8
    1ad8:	7021      	strb	r1, [r4, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1ada:	f3c3 4007 	ubfx	r0, r3, #16, #8
	USB0_OTGISTAT = 0xFF;
    1ade:	4913      	ldr	r1, [pc, #76]	; (1b2c <usb_init+0xc4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1ae0:	7038      	strb	r0, [r7, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1ae2:	0e1b      	lsrs	r3, r3, #24
    1ae4:	702b      	strb	r3, [r5, #0]
	USB0_ISTAT = 0xFF;
    1ae6:	23ff      	movs	r3, #255	; 0xff
    1ae8:	f88c 3000 	strb.w	r3, [ip]

	// enable reset interrupt
	USB0_INTEN = USB_INTEN_USBRSTEN;

	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1aec:	4d10      	ldr	r5, [pc, #64]	; (1b30 <usb_init+0xc8>)
	USB0_ERRSTAT = 0xFF;
    1aee:	f88e 3000 	strb.w	r3, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1af2:	4810      	ldr	r0, [pc, #64]	; (1b34 <usb_init+0xcc>)
	USB0_OTGISTAT = 0xFF;
    1af4:	700b      	strb	r3, [r1, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    1af6:	2301      	movs	r3, #1
    1af8:	7033      	strb	r3, [r6, #0]
	USB0_USBCTRL = 0;
    1afa:	f884 2064 	strb.w	r2, [r4, #100]	; 0x64
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1afe:	2670      	movs	r6, #112	; 0x70
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1b00:	f44f 7400 	mov.w	r4, #512	; 0x200

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1b04:	2210      	movs	r2, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    1b06:	f807 3c2c 	strb.w	r3, [r7, #-44]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1b0a:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1b0c:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1b0e:	f881 20f8 	strb.w	r2, [r1, #248]	; 0xf8
    1b12:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1b14:	1fff8000 	.word	0x1fff8000
    1b18:	40048034 	.word	0x40048034
    1b1c:	4007209c 	.word	0x4007209c
    1b20:	400720b0 	.word	0x400720b0
    1b24:	400720b4 	.word	0x400720b4
    1b28:	40072094 	.word	0x40072094
    1b2c:	40072010 	.word	0x40072010
    1b30:	e000e449 	.word	0xe000e449
    1b34:	e000e108 	.word	0xe000e108
    1b38:	40072080 	.word	0x40072080
    1b3c:	40072088 	.word	0x40072088

00001b40 <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    1b40:	f000 b8a4 	b.w	1c8c <usb_serial_flush_input>

00001b44 <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    1b44:	f000 b87c 	b.w	1c40 <usb_serial_peekchar>

00001b48 <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    1b48:	f000 b856 	b.w	1bf8 <usb_serial_getchar>

00001b4c <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    1b4c:	f000 b890 	b.w	1c70 <usb_serial_available>

00001b50 <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    1b50:	f000 b9bc 	b.w	1ecc <usb_serial_flush_output>

00001b54 <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    1b54:	f000 b996 	b.w	1e84 <usb_serial_write_buffer_free>

00001b58 <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    1b58:	4608      	mov	r0, r1
    1b5a:	4611      	mov	r1, r2
    1b5c:	f000 b8b2 	b.w	1cc4 <usb_serial_write>

00001b60 <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    1b60:	4608      	mov	r0, r1
    1b62:	f000 b983 	b.w	1e6c <usb_serial_putchar>
    1b66:	bf00      	nop

00001b68 <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    1b68:	4770      	bx	lr
    1b6a:	bf00      	nop

00001b6c <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    1b6c:	b672      	cpsid	i
	avail = usb_buffer_available;
    1b6e:	480d      	ldr	r0, [pc, #52]	; (1ba4 <usb_malloc+0x38>)
    1b70:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    1b72:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    1b76:	2b0b      	cmp	r3, #11
    1b78:	dc10      	bgt.n	1b9c <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    1b7a:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1b7e:	40d9      	lsrs	r1, r3
    1b80:	ea22 0201 	bic.w	r2, r2, r1
    1b84:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1b86:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    1b88:	4807      	ldr	r0, [pc, #28]	; (1ba8 <usb_malloc+0x3c>)
    1b8a:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    1b8e:	00db      	lsls	r3, r3, #3
    1b90:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    1b92:	2100      	movs	r1, #0
    1b94:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    1b96:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    1b98:	6051      	str	r1, [r2, #4]
}
    1b9a:	4770      	bx	lr
		__enable_irq();
    1b9c:	b662      	cpsie	i
		return NULL;
    1b9e:	2000      	movs	r0, #0
    1ba0:	4770      	bx	lr
    1ba2:	bf00      	nop
    1ba4:	1fff8900 	.word	0x1fff8900
    1ba8:	1fff83bc 	.word	0x1fff83bc

00001bac <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    1bac:	4b0d      	ldr	r3, [pc, #52]	; (1be4 <usb_free+0x38>)
    1bae:	4a0e      	ldr	r2, [pc, #56]	; (1be8 <usb_free+0x3c>)
    1bb0:	1ac3      	subs	r3, r0, r3
    1bb2:	fba2 2303 	umull	r2, r3, r2, r3
    1bb6:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    1bb8:	2b0b      	cmp	r3, #11
    1bba:	d80c      	bhi.n	1bd6 <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    1bbc:	4a0b      	ldr	r2, [pc, #44]	; (1bec <usb_free+0x40>)
    1bbe:	7812      	ldrb	r2, [r2, #0]
    1bc0:	b952      	cbnz	r2, 1bd8 <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    1bc2:	b672      	cpsid	i
	usb_buffer_available |= mask;
    1bc4:	480a      	ldr	r0, [pc, #40]	; (1bf0 <usb_free+0x44>)
    1bc6:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1bca:	6802      	ldr	r2, [r0, #0]
    1bcc:	fa21 f303 	lsr.w	r3, r1, r3
    1bd0:	431a      	orrs	r2, r3
    1bd2:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1bd4:	b662      	cpsie	i
    1bd6:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    1bd8:	4a06      	ldr	r2, [pc, #24]	; (1bf4 <usb_free+0x48>)
    1bda:	7812      	ldrb	r2, [r2, #0]
    1bdc:	2a00      	cmp	r2, #0
    1bde:	d0f0      	beq.n	1bc2 <usb_free+0x16>
		usb_rx_memory(p);
    1be0:	f7ff b942 	b.w	e68 <usb_rx_memory>
    1be4:	1fff83bc 	.word	0x1fff83bc
    1be8:	38e38e39 	.word	0x38e38e39
    1bec:	1fff93a5 	.word	0x1fff93a5
    1bf0:	1fff8900 	.word	0x1fff8900
    1bf4:	1fff93b0 	.word	0x1fff93b0

00001bf8 <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    1bf8:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    1bfa:	4d0f      	ldr	r5, [pc, #60]	; (1c38 <usb_serial_getchar+0x40>)
    1bfc:	6828      	ldr	r0, [r5, #0]
    1bfe:	b178      	cbz	r0, 1c20 <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    1c00:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    1c02:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    1c04:	18c1      	adds	r1, r0, r3
    1c06:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    1c08:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    1c0a:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    1c0c:	d202      	bcs.n	1c14 <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    1c0e:	8043      	strh	r3, [r0, #2]
	}
	return c;
    1c10:	4620      	mov	r0, r4
}
    1c12:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    1c14:	f7ff ffca 	bl	1bac <usb_free>
		rx_packet = NULL;
    1c18:	2300      	movs	r3, #0
	return c;
    1c1a:	4620      	mov	r0, r4
		rx_packet = NULL;
    1c1c:	602b      	str	r3, [r5, #0]
    1c1e:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    1c20:	4b06      	ldr	r3, [pc, #24]	; (1c3c <usb_serial_getchar+0x44>)
    1c22:	781b      	ldrb	r3, [r3, #0]
    1c24:	b12b      	cbz	r3, 1c32 <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1c26:	2003      	movs	r0, #3
    1c28:	f7ff f8ea 	bl	e00 <usb_rx>
    1c2c:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    1c2e:	2800      	cmp	r0, #0
    1c30:	d1e6      	bne.n	1c00 <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    1c32:	f04f 30ff 	mov.w	r0, #4294967295
    1c36:	bd38      	pop	{r3, r4, r5, pc}
    1c38:	1fff93c4 	.word	0x1fff93c4
    1c3c:	1fff93b0 	.word	0x1fff93b0

00001c40 <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    1c40:	b510      	push	{r4, lr}
	if (!rx_packet) {
    1c42:	4c09      	ldr	r4, [pc, #36]	; (1c68 <usb_serial_peekchar+0x28>)
    1c44:	6820      	ldr	r0, [r4, #0]
    1c46:	b118      	cbz	r0, 1c50 <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    1c48:	8843      	ldrh	r3, [r0, #2]
    1c4a:	4418      	add	r0, r3
    1c4c:	7a00      	ldrb	r0, [r0, #8]
}
    1c4e:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    1c50:	4b06      	ldr	r3, [pc, #24]	; (1c6c <usb_serial_peekchar+0x2c>)
    1c52:	781b      	ldrb	r3, [r3, #0]
    1c54:	b12b      	cbz	r3, 1c62 <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1c56:	2003      	movs	r0, #3
    1c58:	f7ff f8d2 	bl	e00 <usb_rx>
    1c5c:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    1c5e:	2800      	cmp	r0, #0
    1c60:	d1f2      	bne.n	1c48 <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    1c62:	f04f 30ff 	mov.w	r0, #4294967295
    1c66:	bd10      	pop	{r4, pc}
    1c68:	1fff93c4 	.word	0x1fff93c4
    1c6c:	1fff93b0 	.word	0x1fff93b0

00001c70 <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1c70:	4b04      	ldr	r3, [pc, #16]	; (1c84 <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    1c72:	4a05      	ldr	r2, [pc, #20]	; (1c88 <usb_serial_available+0x18>)
    1c74:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    1c76:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1c78:	b11b      	cbz	r3, 1c82 <usb_serial_available+0x12>
    1c7a:	881a      	ldrh	r2, [r3, #0]
    1c7c:	885b      	ldrh	r3, [r3, #2]
    1c7e:	1ad3      	subs	r3, r2, r3
    1c80:	4418      	add	r0, r3
	return count;
}
    1c82:	4770      	bx	lr
    1c84:	1fff93c4 	.word	0x1fff93c4
    1c88:	1fff95ac 	.word	0x1fff95ac

00001c8c <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    1c8c:	4b0b      	ldr	r3, [pc, #44]	; (1cbc <usb_serial_flush_input+0x30>)
    1c8e:	781b      	ldrb	r3, [r3, #0]
    1c90:	b19b      	cbz	r3, 1cba <usb_serial_flush_input+0x2e>
{
    1c92:	b510      	push	{r4, lr}
	if (rx_packet) {
    1c94:	4c0a      	ldr	r4, [pc, #40]	; (1cc0 <usb_serial_flush_input+0x34>)
    1c96:	6820      	ldr	r0, [r4, #0]
    1c98:	b148      	cbz	r0, 1cae <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    1c9a:	f7ff ff87 	bl	1bac <usb_free>
		rx_packet = NULL;
    1c9e:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    1ca0:	2003      	movs	r0, #3
		rx_packet = NULL;
    1ca2:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    1ca4:	f7ff f8ac 	bl	e00 <usb_rx>
		if (!rx) break;
    1ca8:	b130      	cbz	r0, 1cb8 <usb_serial_flush_input+0x2c>
		usb_free(rx);
    1caa:	f7ff ff7f 	bl	1bac <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    1cae:	2003      	movs	r0, #3
    1cb0:	f7ff f8a6 	bl	e00 <usb_rx>
		if (!rx) break;
    1cb4:	2800      	cmp	r0, #0
    1cb6:	d1f8      	bne.n	1caa <usb_serial_flush_input+0x1e>
    1cb8:	bd10      	pop	{r4, pc}
    1cba:	4770      	bx	lr
    1cbc:	1fff93b0 	.word	0x1fff93b0
    1cc0:	1fff93c4 	.word	0x1fff93c4

00001cc4 <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    1cc4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    1cc8:	4a63      	ldr	r2, [pc, #396]	; (1e58 <usb_serial_write+0x194>)
{
    1cca:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    1ccc:	2301      	movs	r3, #1
    1cce:	7013      	strb	r3, [r2, #0]
	while (size > 0) {
    1cd0:	9101      	str	r1, [sp, #4]
    1cd2:	2900      	cmp	r1, #0
    1cd4:	d06c      	beq.n	1db0 <usb_serial_write+0xec>
    1cd6:	f8df 8190 	ldr.w	r8, [pc, #400]	; 1e68 <usb_serial_write+0x1a4>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    1cda:	4f60      	ldr	r7, [pc, #384]	; (1e5c <usb_serial_write+0x198>)
    1cdc:	4604      	mov	r4, r0
    1cde:	f8d8 0000 	ldr.w	r0, [r8]
    1ce2:	460e      	mov	r6, r1
		if (!tx_packet) {
    1ce4:	2800      	cmp	r0, #0
    1ce6:	f000 8081 	beq.w	1dec <usb_serial_write+0x128>
    1cea:	4d5d      	ldr	r5, [pc, #372]	; (1e60 <usb_serial_write+0x19c>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    1cec:	8843      	ldrh	r3, [r0, #2]
    1cee:	f1c3 0140 	rsb	r1, r3, #64	; 0x40
    1cf2:	42b1      	cmp	r1, r6
    1cf4:	bf28      	it	cs
    1cf6:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    1cf8:	eb03 0901 	add.w	r9, r3, r1
    1cfc:	fa1f f989 	uxth.w	r9, r9
		dest = tx_packet->buf + tx_packet->index;
    1d00:	f100 0208 	add.w	r2, r0, #8
		transmit_previous_timeout = 0;
    1d04:	f04f 0e00 	mov.w	lr, #0
		size -= len;
    1d08:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    1d0a:	f8a0 9002 	strh.w	r9, [r0, #2]
		while (len-- > 0) *dest++ = *src++;
    1d0e:	f101 3cff 	add.w	ip, r1, #4294967295
		dest = tx_packet->buf + tx_packet->index;
    1d12:	441a      	add	r2, r3
		transmit_previous_timeout = 0;
    1d14:	f885 e000 	strb.w	lr, [r5]
		while (len-- > 0) *dest++ = *src++;
    1d18:	2900      	cmp	r1, #0
    1d1a:	d041      	beq.n	1da0 <usb_serial_write+0xdc>
    1d1c:	f103 0508 	add.w	r5, r3, #8
    1d20:	330c      	adds	r3, #12
    1d22:	4403      	add	r3, r0
    1d24:	4405      	add	r5, r0
    1d26:	f104 0904 	add.w	r9, r4, #4
    1d2a:	454d      	cmp	r5, r9
    1d2c:	bf38      	it	cc
    1d2e:	429c      	cmpcc	r4, r3
    1d30:	bf2c      	ite	cs
    1d32:	2301      	movcs	r3, #1
    1d34:	2300      	movcc	r3, #0
    1d36:	2909      	cmp	r1, #9
    1d38:	bf94      	ite	ls
    1d3a:	2300      	movls	r3, #0
    1d3c:	f003 0301 	andhi.w	r3, r3, #1
    1d40:	2b00      	cmp	r3, #0
    1d42:	d04a      	beq.n	1dda <usb_serial_write+0x116>
    1d44:	ea44 0305 	orr.w	r3, r4, r5
    1d48:	079b      	lsls	r3, r3, #30
    1d4a:	d146      	bne.n	1dda <usb_serial_write+0x116>
    1d4c:	1f0b      	subs	r3, r1, #4
    1d4e:	089b      	lsrs	r3, r3, #2
    1d50:	3301      	adds	r3, #1
    1d52:	f1bc 0f02 	cmp.w	ip, #2
    1d56:	ea4f 0983 	mov.w	r9, r3, lsl #2
    1d5a:	d93c      	bls.n	1dd6 <usb_serial_write+0x112>
    1d5c:	f1a4 0a04 	sub.w	sl, r4, #4
    1d60:	469b      	mov	fp, r3
    1d62:	f10e 0e01 	add.w	lr, lr, #1
    1d66:	f85a 3f04 	ldr.w	r3, [sl, #4]!
    1d6a:	f845 3b04 	str.w	r3, [r5], #4
    1d6e:	45f3      	cmp	fp, lr
    1d70:	d8f7      	bhi.n	1d62 <usb_serial_write+0x9e>
    1d72:	4549      	cmp	r1, r9
    1d74:	444a      	add	r2, r9
    1d76:	ebc9 0c0c 	rsb	ip, r9, ip
    1d7a:	eb04 0309 	add.w	r3, r4, r9
    1d7e:	d061      	beq.n	1e44 <usb_serial_write+0x180>
    1d80:	781d      	ldrb	r5, [r3, #0]
    1d82:	7015      	strb	r5, [r2, #0]
    1d84:	f1bc 0f00 	cmp.w	ip, #0
    1d88:	d023      	beq.n	1dd2 <usb_serial_write+0x10e>
    1d8a:	785d      	ldrb	r5, [r3, #1]
    1d8c:	7055      	strb	r5, [r2, #1]
    1d8e:	f1bc 0f01 	cmp.w	ip, #1
    1d92:	d01e      	beq.n	1dd2 <usb_serial_write+0x10e>
    1d94:	789b      	ldrb	r3, [r3, #2]
    1d96:	7093      	strb	r3, [r2, #2]
    1d98:	4421      	add	r1, r4
    1d9a:	f8b0 9002 	ldrh.w	r9, [r0, #2]
    1d9e:	460c      	mov	r4, r1
		if (tx_packet->index >= CDC_TX_SIZE) {
    1da0:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
    1da4:	d80b      	bhi.n	1dbe <usb_serial_write+0xfa>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    1da6:	4b2f      	ldr	r3, [pc, #188]	; (1e64 <usb_serial_write+0x1a0>)
    1da8:	2205      	movs	r2, #5
    1daa:	701a      	strb	r2, [r3, #0]
	while (size > 0) {
    1dac:	2e00      	cmp	r6, #0
    1dae:	d199      	bne.n	1ce4 <usb_serial_write+0x20>
	}
	tx_noautoflush = 0;
	return ret;
    1db0:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    1db2:	4a29      	ldr	r2, [pc, #164]	; (1e58 <usb_serial_write+0x194>)
    1db4:	2300      	movs	r3, #0
    1db6:	7013      	strb	r3, [r2, #0]
}
    1db8:	b003      	add	sp, #12
    1dba:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    1dbe:	2340      	movs	r3, #64	; 0x40
    1dc0:	8003      	strh	r3, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1dc2:	4601      	mov	r1, r0
    1dc4:	2004      	movs	r0, #4
    1dc6:	f7ff f8b3 	bl	f30 <usb_tx>
			tx_packet = NULL;
    1dca:	2000      	movs	r0, #0
    1dcc:	f8c8 0000 	str.w	r0, [r8]
    1dd0:	e7e9      	b.n	1da6 <usb_serial_write+0xe2>
    1dd2:	4421      	add	r1, r4
    1dd4:	e7e1      	b.n	1d9a <usb_serial_write+0xd6>
		while (len-- > 0) *dest++ = *src++;
    1dd6:	4623      	mov	r3, r4
    1dd8:	e7d2      	b.n	1d80 <usb_serial_write+0xbc>
    1dda:	3a01      	subs	r2, #1
    1ddc:	4421      	add	r1, r4
    1dde:	f814 3b01 	ldrb.w	r3, [r4], #1
    1de2:	f802 3f01 	strb.w	r3, [r2, #1]!
    1de6:	428c      	cmp	r4, r1
    1de8:	d1f9      	bne.n	1dde <usb_serial_write+0x11a>
    1dea:	e7d6      	b.n	1d9a <usb_serial_write+0xd6>
				if (!usb_configuration) {
    1dec:	783b      	ldrb	r3, [r7, #0]
    1dee:	b35b      	cbz	r3, 1e48 <usb_serial_write+0x184>
    1df0:	4d1b      	ldr	r5, [pc, #108]	; (1e60 <usb_serial_write+0x19c>)
    1df2:	f24d 09e9 	movw	r9, #53481	; 0xd0e9
					tx_noautoflush = 1;
    1df6:	f04f 0a01 	mov.w	sl, #1
    1dfa:	e008      	b.n	1e0e <usb_serial_write+0x14a>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1dfc:	f1b9 0901 	subs.w	r9, r9, #1
    1e00:	d019      	beq.n	1e36 <usb_serial_write+0x172>
    1e02:	782b      	ldrb	r3, [r5, #0]
    1e04:	b9bb      	cbnz	r3, 1e36 <usb_serial_write+0x172>
				yield();
    1e06:	f000 f8b1 	bl	1f6c <yield>
				if (!usb_configuration) {
    1e0a:	783b      	ldrb	r3, [r7, #0]
    1e0c:	b1e3      	cbz	r3, 1e48 <usb_serial_write+0x184>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    1e0e:	2004      	movs	r0, #4
    1e10:	f7ff f814 	bl	e3c <usb_tx_packet_count>
    1e14:	2807      	cmp	r0, #7
    1e16:	d8f1      	bhi.n	1dfc <usb_serial_write+0x138>
					tx_noautoflush = 1;
    1e18:	4b0f      	ldr	r3, [pc, #60]	; (1e58 <usb_serial_write+0x194>)
    1e1a:	f883 a000 	strb.w	sl, [r3]
					tx_packet = usb_malloc();
    1e1e:	f7ff fea5 	bl	1b6c <usb_malloc>
    1e22:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    1e26:	2800      	cmp	r0, #0
    1e28:	f47f af60 	bne.w	1cec <usb_serial_write+0x28>
					tx_noautoflush = 0;
    1e2c:	4b0a      	ldr	r3, [pc, #40]	; (1e58 <usb_serial_write+0x194>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1e2e:	f1b9 0901 	subs.w	r9, r9, #1
					tx_noautoflush = 0;
    1e32:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1e34:	d1e5      	bne.n	1e02 <usb_serial_write+0x13e>
					transmit_previous_timeout = 1;
    1e36:	2301      	movs	r3, #1
					return -1;
    1e38:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    1e3c:	702b      	strb	r3, [r5, #0]
}
    1e3e:	b003      	add	sp, #12
    1e40:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1e44:	4619      	mov	r1, r3
    1e46:	e7a8      	b.n	1d9a <usb_serial_write+0xd6>
					tx_noautoflush = 0;
    1e48:	4a03      	ldr	r2, [pc, #12]	; (1e58 <usb_serial_write+0x194>)
    1e4a:	2300      	movs	r3, #0
					return -1;
    1e4c:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    1e50:	7013      	strb	r3, [r2, #0]
}
    1e52:	b003      	add	sp, #12
    1e54:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1e58:	1fff93b9 	.word	0x1fff93b9
    1e5c:	1fff93b0 	.word	0x1fff93b0
    1e60:	1fff93c0 	.word	0x1fff93c0
    1e64:	1fff93b8 	.word	0x1fff93b8
    1e68:	1fff93bc 	.word	0x1fff93bc

00001e6c <usb_serial_putchar>:
{
    1e6c:	b500      	push	{lr}
    1e6e:	b083      	sub	sp, #12
    1e70:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    1e72:	2101      	movs	r1, #1
{
    1e74:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    1e78:	4618      	mov	r0, r3
    1e7a:	f7ff ff23 	bl	1cc4 <usb_serial_write>
}
    1e7e:	b003      	add	sp, #12
    1e80:	f85d fb04 	ldr.w	pc, [sp], #4

00001e84 <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    1e84:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    1e86:	4d0e      	ldr	r5, [pc, #56]	; (1ec0 <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    1e88:	4c0e      	ldr	r4, [pc, #56]	; (1ec4 <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    1e8a:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    1e8c:	2301      	movs	r3, #1
    1e8e:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    1e90:	b128      	cbz	r0, 1e9e <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    1e92:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    1e94:	2300      	movs	r3, #0
    1e96:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    1e98:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    1e9c:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    1e9e:	4b0a      	ldr	r3, [pc, #40]	; (1ec8 <usb_serial_write_buffer_free+0x44>)
    1ea0:	781b      	ldrb	r3, [r3, #0]
    1ea2:	b913      	cbnz	r3, 1eaa <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    1ea4:	2000      	movs	r0, #0
    1ea6:	7020      	strb	r0, [r4, #0]
			return 0;
    1ea8:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1eaa:	2004      	movs	r0, #4
    1eac:	f7fe ffc6 	bl	e3c <usb_tx_packet_count>
		if (!usb_configuration ||
    1eb0:	2807      	cmp	r0, #7
    1eb2:	d8f7      	bhi.n	1ea4 <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    1eb4:	f7ff fe5a 	bl	1b6c <usb_malloc>
    1eb8:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1eba:	2800      	cmp	r0, #0
    1ebc:	d1e9      	bne.n	1e92 <usb_serial_write_buffer_free+0xe>
    1ebe:	e7f1      	b.n	1ea4 <usb_serial_write_buffer_free+0x20>
    1ec0:	1fff93bc 	.word	0x1fff93bc
    1ec4:	1fff93b9 	.word	0x1fff93b9
    1ec8:	1fff93b0 	.word	0x1fff93b0

00001ecc <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    1ecc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    1ece:	4b11      	ldr	r3, [pc, #68]	; (1f14 <usb_serial_flush_output+0x48>)
    1ed0:	781b      	ldrb	r3, [r3, #0]
    1ed2:	b18b      	cbz	r3, 1ef8 <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    1ed4:	4e10      	ldr	r6, [pc, #64]	; (1f18 <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    1ed6:	4d11      	ldr	r5, [pc, #68]	; (1f1c <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    1ed8:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    1eda:	2701      	movs	r7, #1
    1edc:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    1ede:	b164      	cbz	r4, 1efa <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    1ee0:	4a0f      	ldr	r2, [pc, #60]	; (1f20 <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    1ee2:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    1ee4:	2700      	movs	r7, #0
    1ee6:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1ee8:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    1eea:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1eec:	2004      	movs	r0, #4
    1eee:	f7ff f81f 	bl	f30 <usb_tx>
		tx_packet = NULL;
    1ef2:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    1ef4:	2300      	movs	r3, #0
    1ef6:	702b      	strb	r3, [r5, #0]
    1ef8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    1efa:	f7ff fe37 	bl	1b6c <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    1efe:	4b08      	ldr	r3, [pc, #32]	; (1f20 <usb_serial_flush_output+0x54>)
		if (tx) {
    1f00:	b128      	cbz	r0, 1f0e <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f02:	4601      	mov	r1, r0
    1f04:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    1f06:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f08:	f7ff f812 	bl	f30 <usb_tx>
    1f0c:	e7f2      	b.n	1ef4 <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    1f0e:	701f      	strb	r7, [r3, #0]
    1f10:	e7f0      	b.n	1ef4 <usb_serial_flush_output+0x28>
    1f12:	bf00      	nop
    1f14:	1fff93b0 	.word	0x1fff93b0
    1f18:	1fff93bc 	.word	0x1fff93bc
    1f1c:	1fff93b9 	.word	0x1fff93b9
    1f20:	1fff93b8 	.word	0x1fff93b8

00001f24 <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    1f24:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    1f26:	4b0e      	ldr	r3, [pc, #56]	; (1f60 <usb_serial_flush_callback+0x3c>)
    1f28:	781b      	ldrb	r3, [r3, #0]
    1f2a:	b973      	cbnz	r3, 1f4a <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    1f2c:	4c0d      	ldr	r4, [pc, #52]	; (1f64 <usb_serial_flush_callback+0x40>)
    1f2e:	6821      	ldr	r1, [r4, #0]
    1f30:	b161      	cbz	r1, 1f4c <usb_serial_flush_callback+0x28>
    1f32:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    1f36:	884b      	ldrh	r3, [r1, #2]
    1f38:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1f3a:	2004      	movs	r0, #4
    1f3c:	f7fe fff8 	bl	f30 <usb_tx>
		tx_packet = NULL;
    1f40:	6025      	str	r5, [r4, #0]
    1f42:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    1f44:	4b08      	ldr	r3, [pc, #32]	; (1f68 <usb_serial_flush_callback+0x44>)
    1f46:	2201      	movs	r2, #1
    1f48:	701a      	strb	r2, [r3, #0]
    1f4a:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    1f4c:	f7ff fe0e 	bl	1b6c <usb_malloc>
		if (tx) {
    1f50:	2800      	cmp	r0, #0
    1f52:	d0f7      	beq.n	1f44 <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f54:	4601      	mov	r1, r0
		}
	}
}
    1f56:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f5a:	2004      	movs	r0, #4
    1f5c:	f7fe bfe8 	b.w	f30 <usb_tx>
    1f60:	1fff93b9 	.word	0x1fff93b9
    1f64:	1fff93bc 	.word	0x1fff93bc
    1f68:	1fff93b8 	.word	0x1fff93b8

00001f6c <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    1f6c:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    1f6e:	4c22      	ldr	r4, [pc, #136]	; (1ff8 <yield+0x8c>)
    1f70:	7823      	ldrb	r3, [r4, #0]
    1f72:	b103      	cbz	r3, 1f76 <yield+0xa>
    1f74:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    1f76:	2301      	movs	r3, #1
    1f78:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    1f7a:	f7ff fe79 	bl	1c70 <usb_serial_available>
	if (Serial.available()) serialEvent();
    1f7e:	bb70      	cbnz	r0, 1fde <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    1f80:	f000 fa26 	bl	23d0 <serial_available>
	if (Serial1.available()) serialEvent1();
    1f84:	bb40      	cbnz	r0, 1fd8 <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    1f86:	f000 fab9 	bl	24fc <serial2_available>
	if (Serial2.available()) serialEvent2();
    1f8a:	bb10      	cbnz	r0, 1fd2 <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    1f8c:	f000 fb4c 	bl	2628 <serial3_available>
	if (Serial3.available()) serialEvent3();
    1f90:	b9e0      	cbnz	r0, 1fcc <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    1f92:	2300      	movs	r3, #0
    1f94:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    1f96:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    1f9a:	2b00      	cmp	r3, #0
    1f9c:	d1ea      	bne.n	1f74 <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    1f9e:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    1fa2:	b672      	cpsid	i
		EventResponder *first = firstYield;
    1fa4:	4b15      	ldr	r3, [pc, #84]	; (1ffc <yield+0x90>)
    1fa6:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    1fa8:	b1e0      	cbz	r0, 1fe4 <yield+0x78>
		if (runningFromYield) {
    1faa:	4c15      	ldr	r4, [pc, #84]	; (2000 <yield+0x94>)
    1fac:	7822      	ldrb	r2, [r4, #0]
    1fae:	b9ca      	cbnz	r2, 1fe4 <yield+0x78>
		firstYield = first->_next;
    1fb0:	6945      	ldr	r5, [r0, #20]
    1fb2:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    1fb4:	2301      	movs	r3, #1
    1fb6:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    1fb8:	b1c5      	cbz	r5, 1fec <yield+0x80>
			firstYield->_prev = nullptr;
    1fba:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    1fbc:	b901      	cbnz	r1, 1fc0 <yield+0x54>
    1fbe:	b662      	cpsie	i
		first->_triggered = false;
    1fc0:	2500      	movs	r5, #0
    1fc2:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    1fc4:	6883      	ldr	r3, [r0, #8]
    1fc6:	4798      	blx	r3
		runningFromYield = false;
    1fc8:	7025      	strb	r5, [r4, #0]
    1fca:	e7d3      	b.n	1f74 <yield+0x8>
	if (Serial3.available()) serialEvent3();
    1fcc:	f000 f98e 	bl	22ec <serialEvent3()>
    1fd0:	e7df      	b.n	1f92 <yield+0x26>
	if (Serial2.available()) serialEvent2();
    1fd2:	f000 f989 	bl	22e8 <serialEvent2()>
    1fd6:	e7d9      	b.n	1f8c <yield+0x20>
	if (Serial1.available()) serialEvent1();
    1fd8:	f000 f984 	bl	22e4 <serialEvent1()>
    1fdc:	e7d3      	b.n	1f86 <yield+0x1a>
	if (Serial.available()) serialEvent();
    1fde:	f7ff fdc3 	bl	1b68 <serialEvent()>
    1fe2:	e7cd      	b.n	1f80 <yield+0x14>
		if (doit) __enable_irq();
    1fe4:	2900      	cmp	r1, #0
    1fe6:	d1c5      	bne.n	1f74 <yield+0x8>
    1fe8:	b662      	cpsie	i
    1fea:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    1fec:	4b05      	ldr	r3, [pc, #20]	; (2004 <yield+0x98>)
    1fee:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    1ff0:	2900      	cmp	r1, #0
    1ff2:	d1e5      	bne.n	1fc0 <yield+0x54>
    1ff4:	e7e3      	b.n	1fbe <yield+0x52>
    1ff6:	bf00      	nop
    1ff8:	1fff93c9 	.word	0x1fff93c9
    1ffc:	1fff93dc 	.word	0x1fff93dc
    2000:	1fff93e0 	.word	0x1fff93e0
    2004:	1fff93d8 	.word	0x1fff93d8

00002008 <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    2008:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    200a:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    200c:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    200e:	2c02      	cmp	r4, #2
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    2010:	4603      	mov	r3, r0
		_data = data;
    2012:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    2014:	d00f      	beq.n	2036 <EventResponder::triggerEvent(int, void*)+0x2e>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2016:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    201a:	b672      	cpsid	i
// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
	bool irq = disableInterrupts();
	if (_triggered == false) {
    201c:	7f42      	ldrb	r2, [r0, #29]
    201e:	b932      	cbnz	r2, 202e <EventResponder::triggerEvent(int, void*)+0x26>
		// not already triggered
		if (_type == EventTypeYield) {
    2020:	7f00      	ldrb	r0, [r0, #28]
    2022:	2801      	cmp	r0, #1
    2024:	d00a      	beq.n	203c <EventResponder::triggerEvent(int, void*)+0x34>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    2026:	2803      	cmp	r0, #3
    2028:	d012      	beq.n	2050 <EventResponder::triggerEvent(int, void*)+0x48>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    202a:	2201      	movs	r2, #1
    202c:	775a      	strb	r2, [r3, #29]
		if (doit) __enable_irq();
    202e:	b901      	cbnz	r1, 2032 <EventResponder::triggerEvent(int, void*)+0x2a>
    2030:	b662      	cpsie	i
	}
    2032:	bc10      	pop	{r4}
    2034:	4770      	bx	lr
			(*_function)(*this);
    2036:	6883      	ldr	r3, [r0, #8]
	}
    2038:	bc10      	pop	{r4}
			(*_function)(*this);
    203a:	4718      	bx	r3
			if (firstYield == nullptr) {
    203c:	4c11      	ldr	r4, [pc, #68]	; (2084 <EventResponder::triggerEvent(int, void*)+0x7c>)
    203e:	6820      	ldr	r0, [r4, #0]
    2040:	b1a0      	cbz	r0, 206c <EventResponder::triggerEvent(int, void*)+0x64>
				_prev = lastYield;
    2042:	4811      	ldr	r0, [pc, #68]	; (2088 <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2044:	615a      	str	r2, [r3, #20]
				_prev = lastYield;
    2046:	6802      	ldr	r2, [r0, #0]
    2048:	619a      	str	r2, [r3, #24]
				lastYield = this;
    204a:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    204c:	6153      	str	r3, [r2, #20]
    204e:	e7ec      	b.n	202a <EventResponder::triggerEvent(int, void*)+0x22>
			if (firstInterrupt == nullptr) {
    2050:	4c0e      	ldr	r4, [pc, #56]	; (208c <EventResponder::triggerEvent(int, void*)+0x84>)
    2052:	6820      	ldr	r0, [r4, #0]
    2054:	b180      	cbz	r0, 2078 <EventResponder::triggerEvent(int, void*)+0x70>
				_prev = lastInterrupt;
    2056:	480e      	ldr	r0, [pc, #56]	; (2090 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    2058:	615a      	str	r2, [r3, #20]
				_prev = lastInterrupt;
    205a:	6802      	ldr	r2, [r0, #0]
    205c:	619a      	str	r2, [r3, #24]
				lastInterrupt = this;
    205e:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2060:	6153      	str	r3, [r2, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2062:	4a0c      	ldr	r2, [pc, #48]	; (2094 <EventResponder::triggerEvent(int, void*)+0x8c>)
    2064:	f04f 5080 	mov.w	r0, #268435456	; 0x10000000
    2068:	6010      	str	r0, [r2, #0]
    206a:	e7de      	b.n	202a <EventResponder::triggerEvent(int, void*)+0x22>
				lastYield = this;
    206c:	4a06      	ldr	r2, [pc, #24]	; (2088 <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    206e:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2070:	6198      	str	r0, [r3, #24]
				firstYield = this;
    2072:	6023      	str	r3, [r4, #0]
				lastYield = this;
    2074:	6013      	str	r3, [r2, #0]
    2076:	e7d8      	b.n	202a <EventResponder::triggerEvent(int, void*)+0x22>
				lastInterrupt = this;
    2078:	4a05      	ldr	r2, [pc, #20]	; (2090 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    207a:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    207c:	6198      	str	r0, [r3, #24]
				firstInterrupt = this;
    207e:	6023      	str	r3, [r4, #0]
				lastInterrupt = this;
    2080:	6013      	str	r3, [r2, #0]
    2082:	e7ee      	b.n	2062 <EventResponder::triggerEvent(int, void*)+0x5a>
    2084:	1fff93dc 	.word	0x1fff93dc
    2088:	1fff93d8 	.word	0x1fff93d8
    208c:	1fff93cc 	.word	0x1fff93cc
    2090:	1fff93d0 	.word	0x1fff93d0
    2094:	e000ed04 	.word	0xe000ed04

00002098 <pendablesrvreq_isr>:
	}
	enableInterrupts(irq);
}

void pendablesrvreq_isr(void)
{
    2098:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    209a:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    209e:	b672      	cpsid	i

void EventResponder::runFromInterrupt()
{
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    20a0:	4c0c      	ldr	r4, [pc, #48]	; (20d4 <pendablesrvreq_isr+0x3c>)
    20a2:	6820      	ldr	r0, [r4, #0]
		if (first) {
    20a4:	b180      	cbz	r0, 20c8 <pendablesrvreq_isr+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    20a6:	4e0c      	ldr	r6, [pc, #48]	; (20d8 <pendablesrvreq_isr+0x40>)
				firstInterrupt->_prev = nullptr;
    20a8:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    20aa:	6943      	ldr	r3, [r0, #20]
    20ac:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    20ae:	b173      	cbz	r3, 20ce <pendablesrvreq_isr+0x36>
				firstInterrupt->_prev = nullptr;
    20b0:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    20b2:	b902      	cbnz	r2, 20b6 <pendablesrvreq_isr+0x1e>
    20b4:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    20b6:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    20b8:	6883      	ldr	r3, [r0, #8]
    20ba:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    20bc:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    20c0:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    20c2:	6820      	ldr	r0, [r4, #0]
		if (first) {
    20c4:	2800      	cmp	r0, #0
    20c6:	d1f0      	bne.n	20aa <pendablesrvreq_isr+0x12>
		if (doit) __enable_irq();
    20c8:	b902      	cbnz	r2, 20cc <pendablesrvreq_isr+0x34>
    20ca:	b662      	cpsie	i
    20cc:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    20ce:	6033      	str	r3, [r6, #0]
    20d0:	e7ef      	b.n	20b2 <pendablesrvreq_isr+0x1a>
    20d2:	bf00      	nop
    20d4:	1fff93cc 	.word	0x1fff93cc
    20d8:	1fff93d0 	.word	0x1fff93d0

000020dc <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    20dc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	MillisTimer *timer = listActive;
    20e0:	4d74      	ldr	r5, [pc, #464]	; (22b4 <MillisTimer::runFromTimer()+0x1d8>)
    20e2:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    20e4:	2c00      	cmp	r4, #0
    20e6:	d031      	beq.n	214c <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    20e8:	6823      	ldr	r3, [r4, #0]
    20ea:	2b00      	cmp	r3, #0
    20ec:	d12c      	bne.n	2148 <MillisTimer::runFromTimer()+0x6c>
    20ee:	f8df 91d8 	ldr.w	r9, [pc, #472]	; 22c8 <MillisTimer::runFromTimer()+0x1ec>
			if (firstInterrupt == nullptr) {
    20f2:	4f71      	ldr	r7, [pc, #452]	; (22b8 <MillisTimer::runFromTimer()+0x1dc>)
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    20f4:	f8df 81d4 	ldr.w	r8, [pc, #468]	; 22cc <MillisTimer::runFromTimer()+0x1f0>
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    20f8:	461e      	mov	r6, r3
			MillisTimer *next = timer->_next;
    20fa:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    20fc:	b103      	cbz	r3, 2100 <MillisTimer::runFromTimer()+0x24>
    20fe:	60de      	str	r6, [r3, #12]
			listActive = next;
			timer->_state = TimerOff;
			EventResponderRef event = *(timer->_event);
    2100:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    2102:	602b      	str	r3, [r5, #0]
			event.triggerEvent(0, timer);
    2104:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    2106:	7526      	strb	r6, [r4, #20]
			event.triggerEvent(0, timer);
    2108:	681b      	ldr	r3, [r3, #0]
    210a:	454b      	cmp	r3, r9
    210c:	d157      	bne.n	21be <MillisTimer::runFromTimer()+0xe2>
		if (_type == EventTypeImmediate) {
    210e:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    2110:	6046      	str	r6, [r0, #4]
		if (_type == EventTypeImmediate) {
    2112:	2b02      	cmp	r3, #2
		_data = data;
    2114:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    2116:	d056      	beq.n	21c6 <MillisTimer::runFromTimer()+0xea>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2118:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    211c:	b672      	cpsid	i
	if (_triggered == false) {
    211e:	7f43      	ldrb	r3, [r0, #29]
    2120:	b943      	cbnz	r3, 2134 <MillisTimer::runFromTimer()+0x58>
		if (_type == EventTypeYield) {
    2122:	7f01      	ldrb	r1, [r0, #28]
    2124:	2901      	cmp	r1, #1
    2126:	f000 8088 	beq.w	223a <MillisTimer::runFromTimer()+0x15e>
		} else if (_type == EventTypeInterrupt) {
    212a:	2903      	cmp	r1, #3
    212c:	f000 8091 	beq.w	2252 <MillisTimer::runFromTimer()+0x176>
		_triggered = true;
    2130:	2301      	movs	r3, #1
    2132:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    2134:	b902      	cbnz	r2, 2138 <MillisTimer::runFromTimer()+0x5c>
    2136:	b662      	cpsie	i
			if (timer->_reload) {
    2138:	6863      	ldr	r3, [r4, #4]
    213a:	2b00      	cmp	r3, #0
    213c:	d12c      	bne.n	2198 <MillisTimer::runFromTimer()+0xbc>
    213e:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    2140:	b124      	cbz	r4, 214c <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    2142:	6823      	ldr	r3, [r4, #0]
    2144:	2b00      	cmp	r3, #0
    2146:	d0d8      	beq.n	20fa <MillisTimer::runFromTimer()+0x1e>
			timer->_ms--;
    2148:	3b01      	subs	r3, #1
    214a:	6023      	str	r3, [r4, #0]
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    214c:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    2150:	b672      	cpsid	i
			}
			timer = listActive;
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    2152:	4a5a      	ldr	r2, [pc, #360]	; (22bc <MillisTimer::runFromTimer()+0x1e0>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2154:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    2156:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2158:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    215a:	b903      	cbnz	r3, 215e <MillisTimer::runFromTimer()+0x82>
    215c:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    215e:	2800      	cmp	r0, #0
    2160:	f000 80a5 	beq.w	22ae <MillisTimer::runFromTimer()+0x1d2>
    2164:	682c      	ldr	r4, [r5, #0]
	_state = TimerActive;
    2166:	2702      	movs	r7, #2
		_prev = nullptr;
    2168:	f04f 0e00 	mov.w	lr, #0
		MillisTimer *next = waiting->_next;
    216c:	6886      	ldr	r6, [r0, #8]
	if (listActive == nullptr) {
    216e:	2c00      	cmp	r4, #0
    2170:	d05f      	beq.n	2232 <MillisTimer::runFromTimer()+0x156>
	} else if (_ms < listActive->_ms) {
    2172:	6803      	ldr	r3, [r0, #0]
    2174:	6821      	ldr	r1, [r4, #0]
    2176:	428b      	cmp	r3, r1
    2178:	d23a      	bcs.n	21f0 <MillisTimer::runFromTimer()+0x114>
		listActive->_ms -= _ms;	
    217a:	1acb      	subs	r3, r1, r3
		_next = listActive;
    217c:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    217e:	f8c0 e00c 	str.w	lr, [r0, #12]
		listActive->_ms -= _ms;	
    2182:	4601      	mov	r1, r0
    2184:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    2186:	60e0      	str	r0, [r4, #12]
	_state = TimerActive;
    2188:	7507      	strb	r7, [r0, #20]
    218a:	4630      	mov	r0, r6
    218c:	460c      	mov	r4, r1
	while (waiting) {
    218e:	2e00      	cmp	r6, #0
    2190:	d1ec      	bne.n	216c <MillisTimer::runFromTimer()+0x90>
    2192:	6029      	str	r1, [r5, #0]
    2194:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	if (listActive == nullptr) {
    2198:	6828      	ldr	r0, [r5, #0]
    219a:	4a46      	ldr	r2, [pc, #280]	; (22b4 <MillisTimer::runFromTimer()+0x1d8>)
				timer->_ms = timer->_reload;
    219c:	6023      	str	r3, [r4, #0]
	if (listActive == nullptr) {
    219e:	2800      	cmp	r0, #0
    21a0:	d073      	beq.n	228a <MillisTimer::runFromTimer()+0x1ae>
	} else if (_ms < listActive->_ms) {
    21a2:	6801      	ldr	r1, [r0, #0]
    21a4:	428b      	cmp	r3, r1
    21a6:	d211      	bcs.n	21cc <MillisTimer::runFromTimer()+0xf0>
		listActive->_ms -= _ms;	
    21a8:	1acb      	subs	r3, r1, r3
		_next = listActive;
    21aa:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    21ac:	60e6      	str	r6, [r4, #12]
		listActive->_ms -= _ms;	
    21ae:	6003      	str	r3, [r0, #0]
		listActive->_prev = this;
    21b0:	60c4      	str	r4, [r0, #12]
		listActive = this;
    21b2:	6014      	str	r4, [r2, #0]
    21b4:	4620      	mov	r0, r4
	_state = TimerActive;
    21b6:	2302      	movs	r3, #2
    21b8:	7523      	strb	r3, [r4, #20]
    21ba:	4604      	mov	r4, r0
    21bc:	e7c1      	b.n	2142 <MillisTimer::runFromTimer()+0x66>
			event.triggerEvent(0, timer);
    21be:	4622      	mov	r2, r4
    21c0:	2100      	movs	r1, #0
    21c2:	4798      	blx	r3
    21c4:	e7b8      	b.n	2138 <MillisTimer::runFromTimer()+0x5c>
			(*_function)(*this);
    21c6:	6883      	ldr	r3, [r0, #8]
    21c8:	4798      	blx	r3
    21ca:	e7b5      	b.n	2138 <MillisTimer::runFromTimer()+0x5c>
	} else if (_ms < listActive->_ms) {
    21cc:	4686      	mov	lr, r0
    21ce:	e003      	b.n	21d8 <MillisTimer::runFromTimer()+0xfc>
			if (_ms < timer->_ms) {
    21d0:	6811      	ldr	r1, [r2, #0]
    21d2:	428b      	cmp	r3, r1
    21d4:	4696      	mov	lr, r2
    21d6:	d349      	bcc.n	226c <MillisTimer::runFromTimer()+0x190>
		while (timer->_next) {
    21d8:	f8de 2008 	ldr.w	r2, [lr, #8]
		_ms -= timer->_ms;
    21dc:	1a5b      	subs	r3, r3, r1
    21de:	6023      	str	r3, [r4, #0]
		while (timer->_next) {
    21e0:	2a00      	cmp	r2, #0
    21e2:	d1f5      	bne.n	21d0 <MillisTimer::runFromTimer()+0xf4>
		_next = nullptr;
    21e4:	60a2      	str	r2, [r4, #8]
		_prev = timer;
    21e6:	f8c4 e00c 	str.w	lr, [r4, #12]
		timer->_next = this;
    21ea:	f8ce 4008 	str.w	r4, [lr, #8]
    21ee:	e7e2      	b.n	21b6 <MillisTimer::runFromTimer()+0xda>
	} else if (_ms < listActive->_ms) {
    21f0:	46a4      	mov	ip, r4
    21f2:	e003      	b.n	21fc <MillisTimer::runFromTimer()+0x120>
			if (_ms < timer->_ms) {
    21f4:	6811      	ldr	r1, [r2, #0]
    21f6:	428b      	cmp	r3, r1
    21f8:	4694      	mov	ip, r2
    21fa:	d30c      	bcc.n	2216 <MillisTimer::runFromTimer()+0x13a>
		while (timer->_next) {
    21fc:	f8dc 2008 	ldr.w	r2, [ip, #8]
		_ms -= timer->_ms;
    2200:	1a5b      	subs	r3, r3, r1
    2202:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    2204:	2a00      	cmp	r2, #0
    2206:	d1f5      	bne.n	21f4 <MillisTimer::runFromTimer()+0x118>
		_next = nullptr;
    2208:	6082      	str	r2, [r0, #8]
		_prev = timer;
    220a:	f8c0 c00c 	str.w	ip, [r0, #12]
		timer->_next = this;
    220e:	4621      	mov	r1, r4
    2210:	f8cc 0008 	str.w	r0, [ip, #8]
    2214:	e7b8      	b.n	2188 <MillisTimer::runFromTimer()+0xac>
				_prev = timer->_prev;
    2216:	68d2      	ldr	r2, [r2, #12]
    2218:	60c2      	str	r2, [r0, #12]
				_next = timer;
    221a:	f8c0 c008 	str.w	ip, [r0, #8]
				timer->_prev = this;
    221e:	f8cc 000c 	str.w	r0, [ip, #12]
				_prev->_next = this;
    2222:	68c2      	ldr	r2, [r0, #12]
				timer->_ms -= _ms;
    2224:	1acb      	subs	r3, r1, r3
				_prev->_next = this;
    2226:	6090      	str	r0, [r2, #8]
				_state = TimerActive;
    2228:	4621      	mov	r1, r4
				timer->_ms -= _ms;
    222a:	f8cc 3000 	str.w	r3, [ip]
				_state = TimerActive;
    222e:	7507      	strb	r7, [r0, #20]
    2230:	e7ab      	b.n	218a <MillisTimer::runFromTimer()+0xae>
		_next = nullptr;
    2232:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    2234:	60c4      	str	r4, [r0, #12]
    2236:	4601      	mov	r1, r0
    2238:	e7a6      	b.n	2188 <MillisTimer::runFromTimer()+0xac>
			if (firstYield == nullptr) {
    223a:	f8df e094 	ldr.w	lr, [pc, #148]	; 22d0 <MillisTimer::runFromTimer()+0x1f4>
    223e:	f8de 1000 	ldr.w	r1, [lr]
    2242:	b339      	cbz	r1, 2294 <MillisTimer::runFromTimer()+0x1b8>
				_prev = lastYield;
    2244:	491e      	ldr	r1, [pc, #120]	; (22c0 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    2246:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    2248:	680b      	ldr	r3, [r1, #0]
    224a:	6183      	str	r3, [r0, #24]
				lastYield = this;
    224c:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    224e:	6158      	str	r0, [r3, #20]
    2250:	e76e      	b.n	2130 <MillisTimer::runFromTimer()+0x54>
			if (firstInterrupt == nullptr) {
    2252:	6839      	ldr	r1, [r7, #0]
    2254:	b329      	cbz	r1, 22a2 <MillisTimer::runFromTimer()+0x1c6>
				_prev = lastInterrupt;
    2256:	491b      	ldr	r1, [pc, #108]	; (22c4 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2258:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    225a:	680b      	ldr	r3, [r1, #0]
    225c:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    225e:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2260:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    2262:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    2266:	f8c8 3000 	str.w	r3, [r8]
    226a:	e761      	b.n	2130 <MillisTimer::runFromTimer()+0x54>
				_prev = timer->_prev;
    226c:	68d2      	ldr	r2, [r2, #12]
    226e:	60e2      	str	r2, [r4, #12]
				_next = timer;
    2270:	f8c4 e008 	str.w	lr, [r4, #8]
				timer->_prev = this;
    2274:	f8ce 400c 	str.w	r4, [lr, #12]
				_prev->_next = this;
    2278:	68e2      	ldr	r2, [r4, #12]
				timer->_ms -= _ms;
    227a:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    227c:	2102      	movs	r1, #2
				_prev->_next = this;
    227e:	6094      	str	r4, [r2, #8]
				timer->_ms -= _ms;
    2280:	f8ce 3000 	str.w	r3, [lr]
				_state = TimerActive;
    2284:	7521      	strb	r1, [r4, #20]
    2286:	4604      	mov	r4, r0
    2288:	e75b      	b.n	2142 <MillisTimer::runFromTimer()+0x66>
		_next = nullptr;
    228a:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    228c:	60e0      	str	r0, [r4, #12]
		listActive = this;
    228e:	6014      	str	r4, [r2, #0]
    2290:	4620      	mov	r0, r4
    2292:	e790      	b.n	21b6 <MillisTimer::runFromTimer()+0xda>
				lastYield = this;
    2294:	4b0a      	ldr	r3, [pc, #40]	; (22c0 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    2296:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    2298:	6181      	str	r1, [r0, #24]
				firstYield = this;
    229a:	f8ce 0000 	str.w	r0, [lr]
				lastYield = this;
    229e:	6018      	str	r0, [r3, #0]
    22a0:	e746      	b.n	2130 <MillisTimer::runFromTimer()+0x54>
				lastInterrupt = this;
    22a2:	4b08      	ldr	r3, [pc, #32]	; (22c4 <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    22a4:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    22a6:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    22a8:	6038      	str	r0, [r7, #0]
				lastInterrupt = this;
    22aa:	6018      	str	r0, [r3, #0]
    22ac:	e7d9      	b.n	2262 <MillisTimer::runFromTimer()+0x186>
    22ae:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    22b2:	bf00      	nop
    22b4:	1fff93d4 	.word	0x1fff93d4
    22b8:	1fff93cc 	.word	0x1fff93cc
    22bc:	1fff93e4 	.word	0x1fff93e4
    22c0:	1fff93d8 	.word	0x1fff93d8
    22c4:	1fff93d0 	.word	0x1fff93d0
    22c8:	00002009 	.word	0x00002009
    22cc:	e000ed04 	.word	0xe000ed04
    22d0:	1fff93dc 	.word	0x1fff93dc

000022d4 <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    22d4:	4a02      	ldr	r2, [pc, #8]	; (22e0 <systick_isr+0xc>)
    22d6:	6813      	ldr	r3, [r2, #0]
    22d8:	3301      	adds	r3, #1
    22da:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    22dc:	f7ff befe 	b.w	20dc <MillisTimer::runFromTimer()>
    22e0:	1fff92cc 	.word	0x1fff92cc

000022e4 <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    22e4:	4770      	bx	lr
    22e6:	bf00      	nop

000022e8 <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    22e8:	4770      	bx	lr
    22ea:	bf00      	nop

000022ec <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    22ec:	4770      	bx	lr
    22ee:	bf00      	nop

000022f0 <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    22f0:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    22f2:	4829      	ldr	r0, [pc, #164]	; (2398 <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    22f4:	4a29      	ldr	r2, [pc, #164]	; (239c <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    22f6:	4b2a      	ldr	r3, [pc, #168]	; (23a0 <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    22f8:	4d2a      	ldr	r5, [pc, #168]	; (23a4 <analog_init+0xb4>)
	VREF_TRM = 0x60;
    22fa:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    22fc:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    22fe:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2300:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    2302:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2304:	4c28      	ldr	r4, [pc, #160]	; (23a8 <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    2306:	2b08      	cmp	r3, #8
    2308:	d030      	beq.n	236c <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    230a:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    230c:	4827      	ldr	r0, [pc, #156]	; (23ac <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    230e:	4928      	ldr	r1, [pc, #160]	; (23b0 <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    2310:	d037      	beq.n	2382 <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    2312:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    2314:	bf0c      	ite	eq
    2316:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2318:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    231a:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    231c:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    231e:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2320:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2322:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    2324:	4b23      	ldr	r3, [pc, #140]	; (23b4 <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2326:	4924      	ldr	r1, [pc, #144]	; (23b8 <analog_init+0xc8>)
	if (analog_reference_internal) {
    2328:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    232a:	4a24      	ldr	r2, [pc, #144]	; (23bc <analog_init+0xcc>)
	if (analog_reference_internal) {
    232c:	b1bb      	cbz	r3, 235e <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    232e:	2301      	movs	r3, #1
    2330:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2332:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    2334:	4b22      	ldr	r3, [pc, #136]	; (23c0 <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    2336:	4923      	ldr	r1, [pc, #140]	; (23c4 <analog_init+0xd4>)
	num = analog_num_average;
    2338:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    233a:	4a23      	ldr	r2, [pc, #140]	; (23c8 <analog_init+0xd8>)
	if (num <= 1) {
    233c:	2b01      	cmp	r3, #1
    233e:	d926      	bls.n	238e <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    2340:	2b04      	cmp	r3, #4
    2342:	d90f      	bls.n	2364 <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    2344:	2b08      	cmp	r3, #8
    2346:	d91e      	bls.n	2386 <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    2348:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    234a:	bf94      	ite	ls
    234c:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    234e:	2387      	movhi	r3, #135	; 0x87
    2350:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2352:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    2354:	4b1d      	ldr	r3, [pc, #116]	; (23cc <analog_init+0xdc>)
    2356:	2201      	movs	r2, #1
    2358:	701a      	strb	r2, [r3, #0]
}
    235a:	bc30      	pop	{r4, r5}
    235c:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    235e:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2360:	6013      	str	r3, [r2, #0]
    2362:	e7e7      	b.n	2334 <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2364:	2384      	movs	r3, #132	; 0x84
    2366:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2368:	6013      	str	r3, [r2, #0]
    236a:	e7f3      	b.n	2354 <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    236c:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2370:	490f      	ldr	r1, [pc, #60]	; (23b0 <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2372:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2374:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2376:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2378:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    237a:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    237c:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    237e:	600b      	str	r3, [r1, #0]
    2380:	e7d0      	b.n	2324 <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2382:	2239      	movs	r2, #57	; 0x39
    2384:	e7f7      	b.n	2376 <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    2386:	2385      	movs	r3, #133	; 0x85
    2388:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    238a:	6013      	str	r3, [r2, #0]
    238c:	e7e2      	b.n	2354 <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    238e:	2380      	movs	r3, #128	; 0x80
    2390:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2392:	6013      	str	r3, [r2, #0]
    2394:	e7de      	b.n	2354 <analog_init+0x64>
    2396:	bf00      	nop
    2398:	40074000 	.word	0x40074000
    239c:	40074001 	.word	0x40074001
    23a0:	1fff8904 	.word	0x1fff8904
    23a4:	4003b008 	.word	0x4003b008
    23a8:	4003b00c 	.word	0x4003b00c
    23ac:	400bb008 	.word	0x400bb008
    23b0:	400bb00c 	.word	0x400bb00c
    23b4:	1fff93e9 	.word	0x1fff93e9
    23b8:	4003b020 	.word	0x4003b020
    23bc:	400bb020 	.word	0x400bb020
    23c0:	1fff8905 	.word	0x1fff8905
    23c4:	4003b024 	.word	0x4003b024
    23c8:	400bb024 	.word	0x400bb024
    23cc:	1fff93e8 	.word	0x1fff93e8

000023d0 <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    23d0:	4a05      	ldr	r2, [pc, #20]	; (23e8 <serial_available+0x18>)
	tail = rx_buffer_tail;
    23d2:	4b06      	ldr	r3, [pc, #24]	; (23ec <serial_available+0x1c>)
	head = rx_buffer_head;
    23d4:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    23d6:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    23d8:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    23da:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    23dc:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    23de:	bf38      	it	cc
    23e0:	3040      	addcc	r0, #64	; 0x40
    23e2:	1ac0      	subs	r0, r0, r3
}
    23e4:	4770      	bx	lr
    23e6:	bf00      	nop
    23e8:	1fff9474 	.word	0x1fff9474
    23ec:	1fff93f1 	.word	0x1fff93f1

000023f0 <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    23f0:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    23f2:	4b38      	ldr	r3, [pc, #224]	; (24d4 <uart0_status_isr+0xe4>)
    23f4:	791a      	ldrb	r2, [r3, #4]
    23f6:	f012 0f30 	tst.w	r2, #48	; 0x30
    23fa:	d02c      	beq.n	2456 <uart0_status_isr+0x66>
		__disable_irq();
    23fc:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    23fe:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2400:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2404:	2900      	cmp	r1, #0
    2406:	d03d      	beq.n	2484 <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2408:	b662      	cpsie	i
			head = rx_buffer_head;
    240a:	4f33      	ldr	r7, [pc, #204]	; (24d8 <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    240c:	4933      	ldr	r1, [pc, #204]	; (24dc <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    240e:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2410:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2412:	4e33      	ldr	r6, [pc, #204]	; (24e0 <uart0_status_isr+0xf0>)
					n = UART0_D;
    2414:	461c      	mov	r4, r3
			head = rx_buffer_head;
    2416:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2418:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    241a:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    241c:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    241e:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2420:	bf28      	it	cs
    2422:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2424:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2426:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    242a:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    242c:	bf1c      	itt	ne
    242e:	54f1      	strbne	r1, [r6, r3]
    2430:	4618      	movne	r0, r3
			} while (--avail > 0);
    2432:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2436:	d1f0      	bne.n	241a <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2438:	4b2a      	ldr	r3, [pc, #168]	; (24e4 <uart0_status_isr+0xf4>)
    243a:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    243c:	b2c2      	uxtb	r2, r0
    243e:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2440:	b14b      	cbz	r3, 2456 <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2442:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2444:	bf36      	itet	cc
    2446:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    244a:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    244c:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    244e:	2827      	cmp	r0, #39	; 0x27
    2450:	bfc4      	itt	gt
    2452:	2201      	movgt	r2, #1
    2454:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    2456:	491f      	ldr	r1, [pc, #124]	; (24d4 <uart0_status_isr+0xe4>)
    2458:	78ca      	ldrb	r2, [r1, #3]
    245a:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    245c:	0615      	lsls	r5, r2, #24
    245e:	d416      	bmi.n	248e <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    2460:	0652      	lsls	r2, r2, #25
    2462:	d50d      	bpl.n	2480 <uart0_status_isr+0x90>
    2464:	4b1b      	ldr	r3, [pc, #108]	; (24d4 <uart0_status_isr+0xe4>)
    2466:	791b      	ldrb	r3, [r3, #4]
    2468:	065b      	lsls	r3, r3, #25
    246a:	d509      	bpl.n	2480 <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    246c:	4b1e      	ldr	r3, [pc, #120]	; (24e8 <uart0_status_isr+0xf8>)
		transmitting = 0;
    246e:	491f      	ldr	r1, [pc, #124]	; (24ec <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2470:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    2472:	2200      	movs	r2, #0
    2474:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    2476:	b103      	cbz	r3, 247a <uart0_status_isr+0x8a>
    2478:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    247a:	4b16      	ldr	r3, [pc, #88]	; (24d4 <uart0_status_isr+0xe4>)
    247c:	223c      	movs	r2, #60	; 0x3c
    247e:	70da      	strb	r2, [r3, #3]
	}
}
    2480:	bcf0      	pop	{r4, r5, r6, r7}
    2482:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2484:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    2486:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    2488:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    248a:	b662      	cpsie	i
    248c:	e7e3      	b.n	2456 <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    248e:	790b      	ldrb	r3, [r1, #4]
    2490:	061c      	lsls	r4, r3, #24
    2492:	d5e5      	bpl.n	2460 <uart0_status_isr+0x70>
		head = tx_buffer_head;
    2494:	4b16      	ldr	r3, [pc, #88]	; (24f0 <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    2496:	4e17      	ldr	r6, [pc, #92]	; (24f4 <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    2498:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    249a:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    249c:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    249e:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    24a0:	429c      	cmp	r4, r3
    24a2:	d00e      	beq.n	24c2 <uart0_status_isr+0xd2>
    24a4:	4d14      	ldr	r5, [pc, #80]	; (24f8 <uart0_status_isr+0x108>)
    24a6:	e001      	b.n	24ac <uart0_status_isr+0xbc>
    24a8:	42a3      	cmp	r3, r4
    24aa:	d00a      	beq.n	24c2 <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    24ac:	3301      	adds	r3, #1
    24ae:	2b40      	cmp	r3, #64	; 0x40
    24b0:	bf28      	it	cs
    24b2:	2300      	movcs	r3, #0
			avail = UART0_S1;
    24b4:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    24b6:	5ce8      	ldrb	r0, [r5, r3]
    24b8:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    24ba:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    24bc:	7d08      	ldrb	r0, [r1, #20]
    24be:	2807      	cmp	r0, #7
    24c0:	d9f2      	bls.n	24a8 <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    24c2:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    24c4:	4903      	ldr	r1, [pc, #12]	; (24d4 <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    24c6:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    24c8:	790b      	ldrb	r3, [r1, #4]
    24ca:	0618      	lsls	r0, r3, #24
    24cc:	bf44      	itt	mi
    24ce:	237c      	movmi	r3, #124	; 0x7c
    24d0:	70cb      	strbmi	r3, [r1, #3]
    24d2:	e7c5      	b.n	2460 <uart0_status_isr+0x70>
    24d4:	4006a000 	.word	0x4006a000
    24d8:	1fff9474 	.word	0x1fff9474
    24dc:	1fff93f1 	.word	0x1fff93f1
    24e0:	1fff9434 	.word	0x1fff9434
    24e4:	1fff93ec 	.word	0x1fff93ec
    24e8:	1fff9478 	.word	0x1fff9478
    24ec:	1fff93f0 	.word	0x1fff93f0
    24f0:	1fff947c 	.word	0x1fff947c
    24f4:	1fff9475 	.word	0x1fff9475
    24f8:	1fff93f4 	.word	0x1fff93f4

000024fc <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    24fc:	4a05      	ldr	r2, [pc, #20]	; (2514 <serial2_available+0x18>)
	tail = rx_buffer_tail;
    24fe:	4b06      	ldr	r3, [pc, #24]	; (2518 <serial2_available+0x1c>)
	head = rx_buffer_head;
    2500:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2502:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2504:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2506:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2508:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    250a:	bf38      	it	cc
    250c:	3040      	addcc	r0, #64	; 0x40
    250e:	1ac0      	subs	r0, r0, r3
}
    2510:	4770      	bx	lr
    2512:	bf00      	nop
    2514:	1fff94f0 	.word	0x1fff94f0
    2518:	1fff9485 	.word	0x1fff9485

0000251c <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    251c:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    251e:	4b38      	ldr	r3, [pc, #224]	; (2600 <uart1_status_isr+0xe4>)
    2520:	791a      	ldrb	r2, [r3, #4]
    2522:	f012 0f30 	tst.w	r2, #48	; 0x30
    2526:	d02c      	beq.n	2582 <uart1_status_isr+0x66>
		__disable_irq();
    2528:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    252a:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    252c:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2530:	2900      	cmp	r1, #0
    2532:	d03d      	beq.n	25b0 <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2534:	b662      	cpsie	i
			head = rx_buffer_head;
    2536:	4f33      	ldr	r7, [pc, #204]	; (2604 <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2538:	4933      	ldr	r1, [pc, #204]	; (2608 <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    253a:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    253c:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    253e:	4e33      	ldr	r6, [pc, #204]	; (260c <uart1_status_isr+0xf0>)
					n = UART1_D;
    2540:	461c      	mov	r4, r3
			head = rx_buffer_head;
    2542:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2544:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2546:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2548:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    254a:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    254c:	bf28      	it	cs
    254e:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2550:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    2552:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    2556:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2558:	bf1c      	itt	ne
    255a:	54f1      	strbne	r1, [r6, r3]
    255c:	4618      	movne	r0, r3
			} while (--avail > 0);
    255e:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    2562:	d1f0      	bne.n	2546 <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2564:	4b2a      	ldr	r3, [pc, #168]	; (2610 <uart1_status_isr+0xf4>)
    2566:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2568:	b2c2      	uxtb	r2, r0
    256a:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    256c:	b14b      	cbz	r3, 2582 <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    256e:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2570:	bf36      	itet	cc
    2572:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2576:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2578:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    257a:	2827      	cmp	r0, #39	; 0x27
    257c:	bfc4      	itt	gt
    257e:	2201      	movgt	r2, #1
    2580:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    2582:	491f      	ldr	r1, [pc, #124]	; (2600 <uart1_status_isr+0xe4>)
    2584:	78ca      	ldrb	r2, [r1, #3]
    2586:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    2588:	0615      	lsls	r5, r2, #24
    258a:	d416      	bmi.n	25ba <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    258c:	0652      	lsls	r2, r2, #25
    258e:	d50d      	bpl.n	25ac <uart1_status_isr+0x90>
    2590:	4b1b      	ldr	r3, [pc, #108]	; (2600 <uart1_status_isr+0xe4>)
    2592:	791b      	ldrb	r3, [r3, #4]
    2594:	065b      	lsls	r3, r3, #25
    2596:	d509      	bpl.n	25ac <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2598:	4b1e      	ldr	r3, [pc, #120]	; (2614 <uart1_status_isr+0xf8>)
		transmitting = 0;
    259a:	491f      	ldr	r1, [pc, #124]	; (2618 <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    259c:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    259e:	2200      	movs	r2, #0
    25a0:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    25a2:	b103      	cbz	r3, 25a6 <uart1_status_isr+0x8a>
    25a4:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    25a6:	4b16      	ldr	r3, [pc, #88]	; (2600 <uart1_status_isr+0xe4>)
    25a8:	223c      	movs	r2, #60	; 0x3c
    25aa:	70da      	strb	r2, [r3, #3]
	}
}
    25ac:	bcf0      	pop	{r4, r5, r6, r7}
    25ae:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    25b0:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    25b2:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    25b4:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    25b6:	b662      	cpsie	i
    25b8:	e7e3      	b.n	2582 <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    25ba:	790b      	ldrb	r3, [r1, #4]
    25bc:	061c      	lsls	r4, r3, #24
    25be:	d5e5      	bpl.n	258c <uart1_status_isr+0x70>
		head = tx_buffer_head;
    25c0:	4b16      	ldr	r3, [pc, #88]	; (261c <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    25c2:	4e17      	ldr	r6, [pc, #92]	; (2620 <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    25c4:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    25c6:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    25c8:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    25ca:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    25cc:	429c      	cmp	r4, r3
    25ce:	d00e      	beq.n	25ee <uart1_status_isr+0xd2>
    25d0:	4d14      	ldr	r5, [pc, #80]	; (2624 <uart1_status_isr+0x108>)
    25d2:	e001      	b.n	25d8 <uart1_status_isr+0xbc>
    25d4:	42a3      	cmp	r3, r4
    25d6:	d00a      	beq.n	25ee <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    25d8:	3301      	adds	r3, #1
    25da:	2b28      	cmp	r3, #40	; 0x28
    25dc:	bf28      	it	cs
    25de:	2300      	movcs	r3, #0
			avail = UART1_S1;
    25e0:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    25e2:	5ce8      	ldrb	r0, [r5, r3]
    25e4:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    25e6:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    25e8:	7d08      	ldrb	r0, [r1, #20]
    25ea:	2807      	cmp	r0, #7
    25ec:	d9f2      	bls.n	25d4 <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    25ee:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    25f0:	4903      	ldr	r1, [pc, #12]	; (2600 <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    25f2:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    25f4:	790b      	ldrb	r3, [r1, #4]
    25f6:	0618      	lsls	r0, r3, #24
    25f8:	bf44      	itt	mi
    25fa:	237c      	movmi	r3, #124	; 0x7c
    25fc:	70cb      	strbmi	r3, [r1, #3]
    25fe:	e7c5      	b.n	258c <uart1_status_isr+0x70>
    2600:	4006b000 	.word	0x4006b000
    2604:	1fff94f0 	.word	0x1fff94f0
    2608:	1fff9485 	.word	0x1fff9485
    260c:	1fff94b0 	.word	0x1fff94b0
    2610:	1fff9480 	.word	0x1fff9480
    2614:	1fff94f4 	.word	0x1fff94f4
    2618:	1fff9484 	.word	0x1fff9484
    261c:	1fff94f8 	.word	0x1fff94f8
    2620:	1fff94f1 	.word	0x1fff94f1
    2624:	1fff9488 	.word	0x1fff9488

00002628 <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2628:	4a05      	ldr	r2, [pc, #20]	; (2640 <serial3_available+0x18>)
	tail = rx_buffer_tail;
    262a:	4b06      	ldr	r3, [pc, #24]	; (2644 <serial3_available+0x1c>)
	head = rx_buffer_head;
    262c:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    262e:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2630:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2632:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2634:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    2636:	bf38      	it	cc
    2638:	3040      	addcc	r0, #64	; 0x40
    263a:	1ac0      	subs	r0, r0, r3
}
    263c:	4770      	bx	lr
    263e:	bf00      	nop
    2640:	1fff956c 	.word	0x1fff956c
    2644:	1fff9501 	.word	0x1fff9501

00002648 <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    2648:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    264a:	4b2b      	ldr	r3, [pc, #172]	; (26f8 <uart2_status_isr+0xb0>)
    264c:	791a      	ldrb	r2, [r3, #4]
    264e:	0694      	lsls	r4, r2, #26
    2650:	d51f      	bpl.n	2692 <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    2652:	482a      	ldr	r0, [pc, #168]	; (26fc <uart2_status_isr+0xb4>)
			n = UART2_D;
    2654:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    2656:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    2658:	4929      	ldr	r1, [pc, #164]	; (2700 <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    265a:	3301      	adds	r3, #1
    265c:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    265e:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    2660:	bfc8      	it	gt
    2662:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    2664:	428b      	cmp	r3, r1
			n = UART2_D;
    2666:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    2668:	d003      	beq.n	2672 <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    266a:	4c26      	ldr	r4, [pc, #152]	; (2704 <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    266c:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    266e:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    2670:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    2672:	4a25      	ldr	r2, [pc, #148]	; (2708 <uart2_status_isr+0xc0>)
    2674:	6811      	ldr	r1, [r2, #0]
    2676:	b161      	cbz	r1, 2692 <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    2678:	4a24      	ldr	r2, [pc, #144]	; (270c <uart2_status_isr+0xc4>)
    267a:	7812      	ldrb	r2, [r2, #0]
    267c:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    267e:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2680:	bf36      	itet	cc
    2682:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    2686:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    2688:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    268a:	2b27      	cmp	r3, #39	; 0x27
    268c:	bfc4      	itt	gt
    268e:	2301      	movgt	r3, #1
    2690:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    2692:	4a19      	ldr	r2, [pc, #100]	; (26f8 <uart2_status_isr+0xb0>)
    2694:	78d3      	ldrb	r3, [r2, #3]
    2696:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    2698:	0618      	lsls	r0, r3, #24
    269a:	d411      	bmi.n	26c0 <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    269c:	065a      	lsls	r2, r3, #25
    269e:	d50d      	bpl.n	26bc <uart2_status_isr+0x74>
    26a0:	4b15      	ldr	r3, [pc, #84]	; (26f8 <uart2_status_isr+0xb0>)
    26a2:	791b      	ldrb	r3, [r3, #4]
    26a4:	065b      	lsls	r3, r3, #25
    26a6:	d509      	bpl.n	26bc <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    26a8:	4b19      	ldr	r3, [pc, #100]	; (2710 <uart2_status_isr+0xc8>)
		transmitting = 0;
    26aa:	491a      	ldr	r1, [pc, #104]	; (2714 <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    26ac:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    26ae:	2200      	movs	r2, #0
    26b0:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    26b2:	b103      	cbz	r3, 26b6 <uart2_status_isr+0x6e>
    26b4:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    26b6:	4b10      	ldr	r3, [pc, #64]	; (26f8 <uart2_status_isr+0xb0>)
    26b8:	222c      	movs	r2, #44	; 0x2c
    26ba:	70da      	strb	r2, [r3, #3]
	}
}
    26bc:	bc30      	pop	{r4, r5}
    26be:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    26c0:	7911      	ldrb	r1, [r2, #4]
    26c2:	0609      	lsls	r1, r1, #24
    26c4:	d5ea      	bpl.n	269c <uart2_status_isr+0x54>
		head = tx_buffer_head;
    26c6:	4914      	ldr	r1, [pc, #80]	; (2718 <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    26c8:	4810      	ldr	r0, [pc, #64]	; (270c <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    26ca:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    26cc:	7801      	ldrb	r1, [r0, #0]
    26ce:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    26d0:	428c      	cmp	r4, r1
    26d2:	d00d      	beq.n	26f0 <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    26d4:	1c4a      	adds	r2, r1, #1
    26d6:	2a27      	cmp	r2, #39	; 0x27
    26d8:	bf84      	itt	hi
    26da:	2100      	movhi	r1, #0
    26dc:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    26de:	4d0f      	ldr	r5, [pc, #60]	; (271c <uart2_status_isr+0xd4>)
			UART2_D = n;
    26e0:	4c05      	ldr	r4, [pc, #20]	; (26f8 <uart2_status_isr+0xb0>)
    26e2:	bf98      	it	ls
    26e4:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    26e6:	5caa      	ldrb	r2, [r5, r2]
    26e8:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    26ea:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    26ec:	7001      	strb	r1, [r0, #0]
    26ee:	e7d5      	b.n	269c <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    26f0:	216c      	movs	r1, #108	; 0x6c
    26f2:	70d1      	strb	r1, [r2, #3]
    26f4:	e7d2      	b.n	269c <uart2_status_isr+0x54>
    26f6:	bf00      	nop
    26f8:	4006c000 	.word	0x4006c000
    26fc:	1fff956c 	.word	0x1fff956c
    2700:	1fff9501 	.word	0x1fff9501
    2704:	1fff952c 	.word	0x1fff952c
    2708:	1fff94fc 	.word	0x1fff94fc
    270c:	1fff956d 	.word	0x1fff956d
    2710:	1fff9570 	.word	0x1fff9570
    2714:	1fff9500 	.word	0x1fff9500
    2718:	1fff9574 	.word	0x1fff9574
    271c:	1fff9504 	.word	0x1fff9504

00002720 <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    2720:	b570      	push	{r4, r5, r6, lr}
    2722:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    2724:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2726:	4b30      	ldr	r3, [pc, #192]	; (27e8 <usb_init_serialnumber+0xc8>)
	FTFL_FCCOB0 = 0x41;
    2728:	4d30      	ldr	r5, [pc, #192]	; (27ec <usb_init_serialnumber+0xcc>)
	FTFL_FCCOB1 = 15;
    272a:	4831      	ldr	r0, [pc, #196]	; (27f0 <usb_init_serialnumber+0xd0>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    272c:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    272e:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    2730:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2732:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2734:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    2736:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2738:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    273a:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    273c:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    273e:	7813      	ldrb	r3, [r2, #0]
    2740:	061b      	lsls	r3, r3, #24
    2742:	d5fc      	bpl.n	273e <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    2744:	4b2b      	ldr	r3, [pc, #172]	; (27f4 <usb_init_serialnumber+0xd4>)
    2746:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    2748:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    274a:	4b2b      	ldr	r3, [pc, #172]	; (27f8 <usb_init_serialnumber+0xd8>)
    274c:	4298      	cmp	r0, r3
    274e:	bf98      	it	ls
    2750:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    2754:	f04f 020a 	mov.w	r2, #10
	if (num < 10000000) num = num * 10;
    2758:	bf98      	it	ls
    275a:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    275c:	a901      	add	r1, sp, #4
    275e:	f7fe f917 	bl	990 <ultoa>
	for (i=0; i<10; i++) {
		char c = buf[i];
    2762:	f89d 2004 	ldrb.w	r2, [sp, #4]
    2766:	4b25      	ldr	r3, [pc, #148]	; (27fc <usb_init_serialnumber+0xdc>)
		if (!c) break;
    2768:	b352      	cbz	r2, 27c0 <usb_init_serialnumber+0xa0>
		char c = buf[i];
    276a:	f89d 1005 	ldrb.w	r1, [sp, #5]
		usb_string_serial_number_default.wString[i] = c;
    276e:	805a      	strh	r2, [r3, #2]
		if (!c) break;
    2770:	b361      	cbz	r1, 27cc <usb_init_serialnumber+0xac>
		char c = buf[i];
    2772:	f89d 2006 	ldrb.w	r2, [sp, #6]
		usb_string_serial_number_default.wString[i] = c;
    2776:	8099      	strh	r1, [r3, #4]
		if (!c) break;
    2778:	b352      	cbz	r2, 27d0 <usb_init_serialnumber+0xb0>
		char c = buf[i];
    277a:	f89d 1007 	ldrb.w	r1, [sp, #7]
		usb_string_serial_number_default.wString[i] = c;
    277e:	80da      	strh	r2, [r3, #6]
		if (!c) break;
    2780:	b341      	cbz	r1, 27d4 <usb_init_serialnumber+0xb4>
		char c = buf[i];
    2782:	f89d 2008 	ldrb.w	r2, [sp, #8]
		usb_string_serial_number_default.wString[i] = c;
    2786:	8119      	strh	r1, [r3, #8]
		if (!c) break;
    2788:	b332      	cbz	r2, 27d8 <usb_init_serialnumber+0xb8>
		char c = buf[i];
    278a:	f89d 1009 	ldrb.w	r1, [sp, #9]
		usb_string_serial_number_default.wString[i] = c;
    278e:	815a      	strh	r2, [r3, #10]
		if (!c) break;
    2790:	b321      	cbz	r1, 27dc <usb_init_serialnumber+0xbc>
		char c = buf[i];
    2792:	f89d 200a 	ldrb.w	r2, [sp, #10]
		usb_string_serial_number_default.wString[i] = c;
    2796:	8199      	strh	r1, [r3, #12]
		if (!c) break;
    2798:	b312      	cbz	r2, 27e0 <usb_init_serialnumber+0xc0>
		char c = buf[i];
    279a:	f89d 100b 	ldrb.w	r1, [sp, #11]
		usb_string_serial_number_default.wString[i] = c;
    279e:	81da      	strh	r2, [r3, #14]
		if (!c) break;
    27a0:	b301      	cbz	r1, 27e4 <usb_init_serialnumber+0xc4>
		char c = buf[i];
    27a2:	f89d 200c 	ldrb.w	r2, [sp, #12]
		usb_string_serial_number_default.wString[i] = c;
    27a6:	8219      	strh	r1, [r3, #16]
		if (!c) break;
    27a8:	b14a      	cbz	r2, 27be <usb_init_serialnumber+0x9e>
		char c = buf[i];
    27aa:	f89d 100d 	ldrb.w	r1, [sp, #13]
		usb_string_serial_number_default.wString[i] = c;
    27ae:	825a      	strh	r2, [r3, #18]
	for (i=0; i<10; i++) {
    27b0:	2209      	movs	r2, #9
		if (!c) break;
    27b2:	b129      	cbz	r1, 27c0 <usb_init_serialnumber+0xa0>
    27b4:	2216      	movs	r2, #22
		usb_string_serial_number_default.wString[i] = c;
    27b6:	8299      	strh	r1, [r3, #20]
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    27b8:	701a      	strb	r2, [r3, #0]
}
    27ba:	b004      	add	sp, #16
    27bc:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    27be:	2208      	movs	r2, #8
    27c0:	3201      	adds	r2, #1
    27c2:	0052      	lsls	r2, r2, #1
    27c4:	b2d2      	uxtb	r2, r2
	usb_string_serial_number_default.bLength = i * 2 + 2;
    27c6:	701a      	strb	r2, [r3, #0]
}
    27c8:	b004      	add	sp, #16
    27ca:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    27cc:	2201      	movs	r2, #1
    27ce:	e7f7      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27d0:	2202      	movs	r2, #2
    27d2:	e7f5      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27d4:	2203      	movs	r2, #3
    27d6:	e7f3      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27d8:	2204      	movs	r2, #4
    27da:	e7f1      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27dc:	2205      	movs	r2, #5
    27de:	e7ef      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27e0:	2206      	movs	r2, #6
    27e2:	e7ed      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27e4:	2207      	movs	r2, #7
    27e6:	e7eb      	b.n	27c0 <usb_init_serialnumber+0xa0>
    27e8:	40020000 	.word	0x40020000
    27ec:	40020007 	.word	0x40020007
    27f0:	40020006 	.word	0x40020006
    27f4:	40020008 	.word	0x40020008
    27f8:	0098967f 	.word	0x0098967f
    27fc:	1fff8994 	.word	0x1fff8994

00002800 <__aeabi_atexit>:
    2800:	460b      	mov	r3, r1
    2802:	4601      	mov	r1, r0
    2804:	4618      	mov	r0, r3
    2806:	f000 b801 	b.w	280c <__cxa_atexit>
    280a:	bf00      	nop

0000280c <__cxa_atexit>:
    280c:	4613      	mov	r3, r2
    280e:	460a      	mov	r2, r1
    2810:	4601      	mov	r1, r0
    2812:	2002      	movs	r0, #2
    2814:	f000 bb04 	b.w	2e20 <__register_exitproc>

00002818 <__errno>:
    2818:	4b01      	ldr	r3, [pc, #4]	; (2820 <__errno+0x8>)
    281a:	6818      	ldr	r0, [r3, #0]
    281c:	4770      	bx	lr
    281e:	bf00      	nop
    2820:	1fff8dd8 	.word	0x1fff8dd8

00002824 <__libc_init_array>:
    2824:	b570      	push	{r4, r5, r6, lr}
    2826:	4e0f      	ldr	r6, [pc, #60]	; (2864 <__libc_init_array+0x40>)
    2828:	4d0f      	ldr	r5, [pc, #60]	; (2868 <__libc_init_array+0x44>)
    282a:	1b76      	subs	r6, r6, r5
    282c:	10b6      	asrs	r6, r6, #2
    282e:	bf18      	it	ne
    2830:	2400      	movne	r4, #0
    2832:	d005      	beq.n	2840 <__libc_init_array+0x1c>
    2834:	3401      	adds	r4, #1
    2836:	f855 3b04 	ldr.w	r3, [r5], #4
    283a:	4798      	blx	r3
    283c:	42a6      	cmp	r6, r4
    283e:	d1f9      	bne.n	2834 <__libc_init_array+0x10>
    2840:	4e0a      	ldr	r6, [pc, #40]	; (286c <__libc_init_array+0x48>)
    2842:	4d0b      	ldr	r5, [pc, #44]	; (2870 <__libc_init_array+0x4c>)
    2844:	1b76      	subs	r6, r6, r5
    2846:	f000 fd81 	bl	334c <_init>
    284a:	10b6      	asrs	r6, r6, #2
    284c:	bf18      	it	ne
    284e:	2400      	movne	r4, #0
    2850:	d006      	beq.n	2860 <__libc_init_array+0x3c>
    2852:	3401      	adds	r4, #1
    2854:	f855 3b04 	ldr.w	r3, [r5], #4
    2858:	4798      	blx	r3
    285a:	42a6      	cmp	r6, r4
    285c:	d1f9      	bne.n	2852 <__libc_init_array+0x2e>
    285e:	bd70      	pop	{r4, r5, r6, pc}
    2860:	bd70      	pop	{r4, r5, r6, pc}
    2862:	bf00      	nop
    2864:	00003358 	.word	0x00003358
    2868:	00003358 	.word	0x00003358
    286c:	00003364 	.word	0x00003364
    2870:	00003358 	.word	0x00003358

00002874 <malloc>:
    2874:	4b02      	ldr	r3, [pc, #8]	; (2880 <malloc+0xc>)
    2876:	4601      	mov	r1, r0
    2878:	6818      	ldr	r0, [r3, #0]
    287a:	f000 b803 	b.w	2884 <_malloc_r>
    287e:	bf00      	nop
    2880:	1fff8dd8 	.word	0x1fff8dd8

00002884 <_malloc_r>:
    2884:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2888:	f101 050b 	add.w	r5, r1, #11
    288c:	2d16      	cmp	r5, #22
    288e:	b083      	sub	sp, #12
    2890:	4606      	mov	r6, r0
    2892:	f240 809f 	bls.w	29d4 <_malloc_r+0x150>
    2896:	f035 0507 	bics.w	r5, r5, #7
    289a:	f100 80bf 	bmi.w	2a1c <_malloc_r+0x198>
    289e:	42a9      	cmp	r1, r5
    28a0:	f200 80bc 	bhi.w	2a1c <_malloc_r+0x198>
    28a4:	f000 faa6 	bl	2df4 <__malloc_lock>
    28a8:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    28ac:	f0c0 829c 	bcc.w	2de8 <_malloc_r+0x564>
    28b0:	0a6b      	lsrs	r3, r5, #9
    28b2:	f000 80ba 	beq.w	2a2a <_malloc_r+0x1a6>
    28b6:	2b04      	cmp	r3, #4
    28b8:	f200 8183 	bhi.w	2bc2 <_malloc_r+0x33e>
    28bc:	09a8      	lsrs	r0, r5, #6
    28be:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    28c2:	ea4f 034e 	mov.w	r3, lr, lsl #1
    28c6:	3038      	adds	r0, #56	; 0x38
    28c8:	4fc4      	ldr	r7, [pc, #784]	; (2bdc <_malloc_r+0x358>)
    28ca:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    28ce:	f1a3 0108 	sub.w	r1, r3, #8
    28d2:	685c      	ldr	r4, [r3, #4]
    28d4:	42a1      	cmp	r1, r4
    28d6:	d107      	bne.n	28e8 <_malloc_r+0x64>
    28d8:	e0ac      	b.n	2a34 <_malloc_r+0x1b0>
    28da:	2a00      	cmp	r2, #0
    28dc:	f280 80ac 	bge.w	2a38 <_malloc_r+0x1b4>
    28e0:	68e4      	ldr	r4, [r4, #12]
    28e2:	42a1      	cmp	r1, r4
    28e4:	f000 80a6 	beq.w	2a34 <_malloc_r+0x1b0>
    28e8:	6863      	ldr	r3, [r4, #4]
    28ea:	f023 0303 	bic.w	r3, r3, #3
    28ee:	1b5a      	subs	r2, r3, r5
    28f0:	2a0f      	cmp	r2, #15
    28f2:	ddf2      	ble.n	28da <_malloc_r+0x56>
    28f4:	49b9      	ldr	r1, [pc, #740]	; (2bdc <_malloc_r+0x358>)
    28f6:	693c      	ldr	r4, [r7, #16]
    28f8:	f101 0e08 	add.w	lr, r1, #8
    28fc:	4574      	cmp	r4, lr
    28fe:	f000 81b3 	beq.w	2c68 <_malloc_r+0x3e4>
    2902:	6863      	ldr	r3, [r4, #4]
    2904:	f023 0303 	bic.w	r3, r3, #3
    2908:	1b5a      	subs	r2, r3, r5
    290a:	2a0f      	cmp	r2, #15
    290c:	f300 8199 	bgt.w	2c42 <_malloc_r+0x3be>
    2910:	2a00      	cmp	r2, #0
    2912:	f8c1 e014 	str.w	lr, [r1, #20]
    2916:	f8c1 e010 	str.w	lr, [r1, #16]
    291a:	f280 809e 	bge.w	2a5a <_malloc_r+0x1d6>
    291e:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    2922:	f080 8167 	bcs.w	2bf4 <_malloc_r+0x370>
    2926:	08db      	lsrs	r3, r3, #3
    2928:	f103 0c01 	add.w	ip, r3, #1
    292c:	2201      	movs	r2, #1
    292e:	109b      	asrs	r3, r3, #2
    2930:	fa02 f303 	lsl.w	r3, r2, r3
    2934:	684a      	ldr	r2, [r1, #4]
    2936:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    293a:	f8c4 8008 	str.w	r8, [r4, #8]
    293e:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    2942:	431a      	orrs	r2, r3
    2944:	f1a9 0308 	sub.w	r3, r9, #8
    2948:	60e3      	str	r3, [r4, #12]
    294a:	604a      	str	r2, [r1, #4]
    294c:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    2950:	f8c8 400c 	str.w	r4, [r8, #12]
    2954:	1083      	asrs	r3, r0, #2
    2956:	2401      	movs	r4, #1
    2958:	409c      	lsls	r4, r3
    295a:	4294      	cmp	r4, r2
    295c:	f200 808a 	bhi.w	2a74 <_malloc_r+0x1f0>
    2960:	4214      	tst	r4, r2
    2962:	d106      	bne.n	2972 <_malloc_r+0xee>
    2964:	f020 0003 	bic.w	r0, r0, #3
    2968:	0064      	lsls	r4, r4, #1
    296a:	4214      	tst	r4, r2
    296c:	f100 0004 	add.w	r0, r0, #4
    2970:	d0fa      	beq.n	2968 <_malloc_r+0xe4>
    2972:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    2976:	46cc      	mov	ip, r9
    2978:	4680      	mov	r8, r0
    297a:	f8dc 100c 	ldr.w	r1, [ip, #12]
    297e:	458c      	cmp	ip, r1
    2980:	d107      	bne.n	2992 <_malloc_r+0x10e>
    2982:	e173      	b.n	2c6c <_malloc_r+0x3e8>
    2984:	2a00      	cmp	r2, #0
    2986:	f280 8181 	bge.w	2c8c <_malloc_r+0x408>
    298a:	68c9      	ldr	r1, [r1, #12]
    298c:	458c      	cmp	ip, r1
    298e:	f000 816d 	beq.w	2c6c <_malloc_r+0x3e8>
    2992:	684b      	ldr	r3, [r1, #4]
    2994:	f023 0303 	bic.w	r3, r3, #3
    2998:	1b5a      	subs	r2, r3, r5
    299a:	2a0f      	cmp	r2, #15
    299c:	ddf2      	ble.n	2984 <_malloc_r+0x100>
    299e:	460c      	mov	r4, r1
    29a0:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    29a4:	f854 8f08 	ldr.w	r8, [r4, #8]!
    29a8:	194b      	adds	r3, r1, r5
    29aa:	f045 0501 	orr.w	r5, r5, #1
    29ae:	604d      	str	r5, [r1, #4]
    29b0:	f042 0101 	orr.w	r1, r2, #1
    29b4:	f8c8 c00c 	str.w	ip, [r8, #12]
    29b8:	4630      	mov	r0, r6
    29ba:	f8cc 8008 	str.w	r8, [ip, #8]
    29be:	617b      	str	r3, [r7, #20]
    29c0:	613b      	str	r3, [r7, #16]
    29c2:	f8c3 e00c 	str.w	lr, [r3, #12]
    29c6:	f8c3 e008 	str.w	lr, [r3, #8]
    29ca:	6059      	str	r1, [r3, #4]
    29cc:	509a      	str	r2, [r3, r2]
    29ce:	f000 fa13 	bl	2df8 <__malloc_unlock>
    29d2:	e01f      	b.n	2a14 <_malloc_r+0x190>
    29d4:	2910      	cmp	r1, #16
    29d6:	d821      	bhi.n	2a1c <_malloc_r+0x198>
    29d8:	f000 fa0c 	bl	2df4 <__malloc_lock>
    29dc:	2510      	movs	r5, #16
    29de:	2306      	movs	r3, #6
    29e0:	2002      	movs	r0, #2
    29e2:	4f7e      	ldr	r7, [pc, #504]	; (2bdc <_malloc_r+0x358>)
    29e4:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    29e8:	f1a3 0208 	sub.w	r2, r3, #8
    29ec:	685c      	ldr	r4, [r3, #4]
    29ee:	4294      	cmp	r4, r2
    29f0:	f000 8145 	beq.w	2c7e <_malloc_r+0x3fa>
    29f4:	6863      	ldr	r3, [r4, #4]
    29f6:	68e1      	ldr	r1, [r4, #12]
    29f8:	68a5      	ldr	r5, [r4, #8]
    29fa:	f023 0303 	bic.w	r3, r3, #3
    29fe:	4423      	add	r3, r4
    2a00:	4630      	mov	r0, r6
    2a02:	685a      	ldr	r2, [r3, #4]
    2a04:	60e9      	str	r1, [r5, #12]
    2a06:	f042 0201 	orr.w	r2, r2, #1
    2a0a:	608d      	str	r5, [r1, #8]
    2a0c:	605a      	str	r2, [r3, #4]
    2a0e:	f000 f9f3 	bl	2df8 <__malloc_unlock>
    2a12:	3408      	adds	r4, #8
    2a14:	4620      	mov	r0, r4
    2a16:	b003      	add	sp, #12
    2a18:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a1c:	2400      	movs	r4, #0
    2a1e:	230c      	movs	r3, #12
    2a20:	4620      	mov	r0, r4
    2a22:	6033      	str	r3, [r6, #0]
    2a24:	b003      	add	sp, #12
    2a26:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a2a:	2380      	movs	r3, #128	; 0x80
    2a2c:	f04f 0e40 	mov.w	lr, #64	; 0x40
    2a30:	203f      	movs	r0, #63	; 0x3f
    2a32:	e749      	b.n	28c8 <_malloc_r+0x44>
    2a34:	4670      	mov	r0, lr
    2a36:	e75d      	b.n	28f4 <_malloc_r+0x70>
    2a38:	4423      	add	r3, r4
    2a3a:	68e1      	ldr	r1, [r4, #12]
    2a3c:	685a      	ldr	r2, [r3, #4]
    2a3e:	68a5      	ldr	r5, [r4, #8]
    2a40:	f042 0201 	orr.w	r2, r2, #1
    2a44:	60e9      	str	r1, [r5, #12]
    2a46:	4630      	mov	r0, r6
    2a48:	608d      	str	r5, [r1, #8]
    2a4a:	605a      	str	r2, [r3, #4]
    2a4c:	f000 f9d4 	bl	2df8 <__malloc_unlock>
    2a50:	3408      	adds	r4, #8
    2a52:	4620      	mov	r0, r4
    2a54:	b003      	add	sp, #12
    2a56:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a5a:	4423      	add	r3, r4
    2a5c:	4630      	mov	r0, r6
    2a5e:	685a      	ldr	r2, [r3, #4]
    2a60:	f042 0201 	orr.w	r2, r2, #1
    2a64:	605a      	str	r2, [r3, #4]
    2a66:	f000 f9c7 	bl	2df8 <__malloc_unlock>
    2a6a:	3408      	adds	r4, #8
    2a6c:	4620      	mov	r0, r4
    2a6e:	b003      	add	sp, #12
    2a70:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a74:	68bc      	ldr	r4, [r7, #8]
    2a76:	6863      	ldr	r3, [r4, #4]
    2a78:	f023 0803 	bic.w	r8, r3, #3
    2a7c:	45a8      	cmp	r8, r5
    2a7e:	d304      	bcc.n	2a8a <_malloc_r+0x206>
    2a80:	ebc5 0308 	rsb	r3, r5, r8
    2a84:	2b0f      	cmp	r3, #15
    2a86:	f300 808c 	bgt.w	2ba2 <_malloc_r+0x31e>
    2a8a:	4b55      	ldr	r3, [pc, #340]	; (2be0 <_malloc_r+0x35c>)
    2a8c:	f8df 9160 	ldr.w	r9, [pc, #352]	; 2bf0 <_malloc_r+0x36c>
    2a90:	681a      	ldr	r2, [r3, #0]
    2a92:	f8d9 3000 	ldr.w	r3, [r9]
    2a96:	3301      	adds	r3, #1
    2a98:	442a      	add	r2, r5
    2a9a:	eb04 0a08 	add.w	sl, r4, r8
    2a9e:	f000 8160 	beq.w	2d62 <_malloc_r+0x4de>
    2aa2:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    2aa6:	320f      	adds	r2, #15
    2aa8:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    2aac:	f022 020f 	bic.w	r2, r2, #15
    2ab0:	4611      	mov	r1, r2
    2ab2:	4630      	mov	r0, r6
    2ab4:	9201      	str	r2, [sp, #4]
    2ab6:	f000 f9a1 	bl	2dfc <_sbrk_r>
    2aba:	f1b0 3fff 	cmp.w	r0, #4294967295
    2abe:	4683      	mov	fp, r0
    2ac0:	9a01      	ldr	r2, [sp, #4]
    2ac2:	f000 8158 	beq.w	2d76 <_malloc_r+0x4f2>
    2ac6:	4582      	cmp	sl, r0
    2ac8:	f200 80fc 	bhi.w	2cc4 <_malloc_r+0x440>
    2acc:	4b45      	ldr	r3, [pc, #276]	; (2be4 <_malloc_r+0x360>)
    2ace:	6819      	ldr	r1, [r3, #0]
    2ad0:	45da      	cmp	sl, fp
    2ad2:	4411      	add	r1, r2
    2ad4:	6019      	str	r1, [r3, #0]
    2ad6:	f000 8153 	beq.w	2d80 <_malloc_r+0x4fc>
    2ada:	f8d9 0000 	ldr.w	r0, [r9]
    2ade:	f8df e110 	ldr.w	lr, [pc, #272]	; 2bf0 <_malloc_r+0x36c>
    2ae2:	3001      	adds	r0, #1
    2ae4:	bf1b      	ittet	ne
    2ae6:	ebca 0a0b 	rsbne	sl, sl, fp
    2aea:	4451      	addne	r1, sl
    2aec:	f8ce b000 	streq.w	fp, [lr]
    2af0:	6019      	strne	r1, [r3, #0]
    2af2:	f01b 0107 	ands.w	r1, fp, #7
    2af6:	f000 8117 	beq.w	2d28 <_malloc_r+0x4a4>
    2afa:	f1c1 0008 	rsb	r0, r1, #8
    2afe:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    2b02:	4483      	add	fp, r0
    2b04:	3108      	adds	r1, #8
    2b06:	445a      	add	r2, fp
    2b08:	f3c2 020b 	ubfx	r2, r2, #0, #12
    2b0c:	ebc2 0901 	rsb	r9, r2, r1
    2b10:	4649      	mov	r1, r9
    2b12:	4630      	mov	r0, r6
    2b14:	9301      	str	r3, [sp, #4]
    2b16:	f000 f971 	bl	2dfc <_sbrk_r>
    2b1a:	1c43      	adds	r3, r0, #1
    2b1c:	9b01      	ldr	r3, [sp, #4]
    2b1e:	f000 813f 	beq.w	2da0 <_malloc_r+0x51c>
    2b22:	ebcb 0200 	rsb	r2, fp, r0
    2b26:	444a      	add	r2, r9
    2b28:	f042 0201 	orr.w	r2, r2, #1
    2b2c:	6819      	ldr	r1, [r3, #0]
    2b2e:	f8c7 b008 	str.w	fp, [r7, #8]
    2b32:	4449      	add	r1, r9
    2b34:	42bc      	cmp	r4, r7
    2b36:	f8cb 2004 	str.w	r2, [fp, #4]
    2b3a:	6019      	str	r1, [r3, #0]
    2b3c:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 2be4 <_malloc_r+0x360>
    2b40:	d016      	beq.n	2b70 <_malloc_r+0x2ec>
    2b42:	f1b8 0f0f 	cmp.w	r8, #15
    2b46:	f240 80fd 	bls.w	2d44 <_malloc_r+0x4c0>
    2b4a:	6862      	ldr	r2, [r4, #4]
    2b4c:	f1a8 030c 	sub.w	r3, r8, #12
    2b50:	f023 0307 	bic.w	r3, r3, #7
    2b54:	18e0      	adds	r0, r4, r3
    2b56:	f002 0201 	and.w	r2, r2, #1
    2b5a:	f04f 0e05 	mov.w	lr, #5
    2b5e:	431a      	orrs	r2, r3
    2b60:	2b0f      	cmp	r3, #15
    2b62:	6062      	str	r2, [r4, #4]
    2b64:	f8c0 e004 	str.w	lr, [r0, #4]
    2b68:	f8c0 e008 	str.w	lr, [r0, #8]
    2b6c:	f200 811c 	bhi.w	2da8 <_malloc_r+0x524>
    2b70:	4b1d      	ldr	r3, [pc, #116]	; (2be8 <_malloc_r+0x364>)
    2b72:	68bc      	ldr	r4, [r7, #8]
    2b74:	681a      	ldr	r2, [r3, #0]
    2b76:	4291      	cmp	r1, r2
    2b78:	bf88      	it	hi
    2b7a:	6019      	strhi	r1, [r3, #0]
    2b7c:	4b1b      	ldr	r3, [pc, #108]	; (2bec <_malloc_r+0x368>)
    2b7e:	681a      	ldr	r2, [r3, #0]
    2b80:	4291      	cmp	r1, r2
    2b82:	6862      	ldr	r2, [r4, #4]
    2b84:	bf88      	it	hi
    2b86:	6019      	strhi	r1, [r3, #0]
    2b88:	f022 0203 	bic.w	r2, r2, #3
    2b8c:	4295      	cmp	r5, r2
    2b8e:	eba2 0305 	sub.w	r3, r2, r5
    2b92:	d801      	bhi.n	2b98 <_malloc_r+0x314>
    2b94:	2b0f      	cmp	r3, #15
    2b96:	dc04      	bgt.n	2ba2 <_malloc_r+0x31e>
    2b98:	4630      	mov	r0, r6
    2b9a:	f000 f92d 	bl	2df8 <__malloc_unlock>
    2b9e:	2400      	movs	r4, #0
    2ba0:	e738      	b.n	2a14 <_malloc_r+0x190>
    2ba2:	1962      	adds	r2, r4, r5
    2ba4:	f043 0301 	orr.w	r3, r3, #1
    2ba8:	f045 0501 	orr.w	r5, r5, #1
    2bac:	6065      	str	r5, [r4, #4]
    2bae:	4630      	mov	r0, r6
    2bb0:	60ba      	str	r2, [r7, #8]
    2bb2:	6053      	str	r3, [r2, #4]
    2bb4:	f000 f920 	bl	2df8 <__malloc_unlock>
    2bb8:	3408      	adds	r4, #8
    2bba:	4620      	mov	r0, r4
    2bbc:	b003      	add	sp, #12
    2bbe:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2bc2:	2b14      	cmp	r3, #20
    2bc4:	d971      	bls.n	2caa <_malloc_r+0x426>
    2bc6:	2b54      	cmp	r3, #84	; 0x54
    2bc8:	f200 80a4 	bhi.w	2d14 <_malloc_r+0x490>
    2bcc:	0b28      	lsrs	r0, r5, #12
    2bce:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    2bd2:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2bd6:	306e      	adds	r0, #110	; 0x6e
    2bd8:	e676      	b.n	28c8 <_malloc_r+0x44>
    2bda:	bf00      	nop
    2bdc:	1fff8ddc 	.word	0x1fff8ddc
    2be0:	1fff9580 	.word	0x1fff9580
    2be4:	1fff9584 	.word	0x1fff9584
    2be8:	1fff957c 	.word	0x1fff957c
    2bec:	1fff9578 	.word	0x1fff9578
    2bf0:	1fff91e8 	.word	0x1fff91e8
    2bf4:	0a5a      	lsrs	r2, r3, #9
    2bf6:	2a04      	cmp	r2, #4
    2bf8:	d95e      	bls.n	2cb8 <_malloc_r+0x434>
    2bfa:	2a14      	cmp	r2, #20
    2bfc:	f200 80b3 	bhi.w	2d66 <_malloc_r+0x4e2>
    2c00:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    2c04:	0049      	lsls	r1, r1, #1
    2c06:	325b      	adds	r2, #91	; 0x5b
    2c08:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    2c0c:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    2c10:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 2df0 <_malloc_r+0x56c>
    2c14:	f1ac 0c08 	sub.w	ip, ip, #8
    2c18:	458c      	cmp	ip, r1
    2c1a:	f000 8088 	beq.w	2d2e <_malloc_r+0x4aa>
    2c1e:	684a      	ldr	r2, [r1, #4]
    2c20:	f022 0203 	bic.w	r2, r2, #3
    2c24:	4293      	cmp	r3, r2
    2c26:	d202      	bcs.n	2c2e <_malloc_r+0x3aa>
    2c28:	6889      	ldr	r1, [r1, #8]
    2c2a:	458c      	cmp	ip, r1
    2c2c:	d1f7      	bne.n	2c1e <_malloc_r+0x39a>
    2c2e:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    2c32:	687a      	ldr	r2, [r7, #4]
    2c34:	f8c4 c00c 	str.w	ip, [r4, #12]
    2c38:	60a1      	str	r1, [r4, #8]
    2c3a:	f8cc 4008 	str.w	r4, [ip, #8]
    2c3e:	60cc      	str	r4, [r1, #12]
    2c40:	e688      	b.n	2954 <_malloc_r+0xd0>
    2c42:	1963      	adds	r3, r4, r5
    2c44:	f042 0701 	orr.w	r7, r2, #1
    2c48:	f045 0501 	orr.w	r5, r5, #1
    2c4c:	6065      	str	r5, [r4, #4]
    2c4e:	4630      	mov	r0, r6
    2c50:	614b      	str	r3, [r1, #20]
    2c52:	610b      	str	r3, [r1, #16]
    2c54:	f8c3 e00c 	str.w	lr, [r3, #12]
    2c58:	f8c3 e008 	str.w	lr, [r3, #8]
    2c5c:	605f      	str	r7, [r3, #4]
    2c5e:	509a      	str	r2, [r3, r2]
    2c60:	3408      	adds	r4, #8
    2c62:	f000 f8c9 	bl	2df8 <__malloc_unlock>
    2c66:	e6d5      	b.n	2a14 <_malloc_r+0x190>
    2c68:	684a      	ldr	r2, [r1, #4]
    2c6a:	e673      	b.n	2954 <_malloc_r+0xd0>
    2c6c:	f108 0801 	add.w	r8, r8, #1
    2c70:	f018 0f03 	tst.w	r8, #3
    2c74:	f10c 0c08 	add.w	ip, ip, #8
    2c78:	f47f ae7f 	bne.w	297a <_malloc_r+0xf6>
    2c7c:	e030      	b.n	2ce0 <_malloc_r+0x45c>
    2c7e:	68dc      	ldr	r4, [r3, #12]
    2c80:	42a3      	cmp	r3, r4
    2c82:	bf08      	it	eq
    2c84:	3002      	addeq	r0, #2
    2c86:	f43f ae35 	beq.w	28f4 <_malloc_r+0x70>
    2c8a:	e6b3      	b.n	29f4 <_malloc_r+0x170>
    2c8c:	440b      	add	r3, r1
    2c8e:	460c      	mov	r4, r1
    2c90:	685a      	ldr	r2, [r3, #4]
    2c92:	68c9      	ldr	r1, [r1, #12]
    2c94:	f854 5f08 	ldr.w	r5, [r4, #8]!
    2c98:	f042 0201 	orr.w	r2, r2, #1
    2c9c:	605a      	str	r2, [r3, #4]
    2c9e:	4630      	mov	r0, r6
    2ca0:	60e9      	str	r1, [r5, #12]
    2ca2:	608d      	str	r5, [r1, #8]
    2ca4:	f000 f8a8 	bl	2df8 <__malloc_unlock>
    2ca8:	e6b4      	b.n	2a14 <_malloc_r+0x190>
    2caa:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    2cae:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    2cb2:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2cb6:	e607      	b.n	28c8 <_malloc_r+0x44>
    2cb8:	099a      	lsrs	r2, r3, #6
    2cba:	f102 0139 	add.w	r1, r2, #57	; 0x39
    2cbe:	0049      	lsls	r1, r1, #1
    2cc0:	3238      	adds	r2, #56	; 0x38
    2cc2:	e7a1      	b.n	2c08 <_malloc_r+0x384>
    2cc4:	42bc      	cmp	r4, r7
    2cc6:	4b4a      	ldr	r3, [pc, #296]	; (2df0 <_malloc_r+0x56c>)
    2cc8:	f43f af00 	beq.w	2acc <_malloc_r+0x248>
    2ccc:	689c      	ldr	r4, [r3, #8]
    2cce:	6862      	ldr	r2, [r4, #4]
    2cd0:	f022 0203 	bic.w	r2, r2, #3
    2cd4:	e75a      	b.n	2b8c <_malloc_r+0x308>
    2cd6:	f859 3908 	ldr.w	r3, [r9], #-8
    2cda:	4599      	cmp	r9, r3
    2cdc:	f040 8082 	bne.w	2de4 <_malloc_r+0x560>
    2ce0:	f010 0f03 	tst.w	r0, #3
    2ce4:	f100 30ff 	add.w	r0, r0, #4294967295
    2ce8:	d1f5      	bne.n	2cd6 <_malloc_r+0x452>
    2cea:	687b      	ldr	r3, [r7, #4]
    2cec:	ea23 0304 	bic.w	r3, r3, r4
    2cf0:	607b      	str	r3, [r7, #4]
    2cf2:	0064      	lsls	r4, r4, #1
    2cf4:	429c      	cmp	r4, r3
    2cf6:	f63f aebd 	bhi.w	2a74 <_malloc_r+0x1f0>
    2cfa:	2c00      	cmp	r4, #0
    2cfc:	f43f aeba 	beq.w	2a74 <_malloc_r+0x1f0>
    2d00:	421c      	tst	r4, r3
    2d02:	4640      	mov	r0, r8
    2d04:	f47f ae35 	bne.w	2972 <_malloc_r+0xee>
    2d08:	0064      	lsls	r4, r4, #1
    2d0a:	421c      	tst	r4, r3
    2d0c:	f100 0004 	add.w	r0, r0, #4
    2d10:	d0fa      	beq.n	2d08 <_malloc_r+0x484>
    2d12:	e62e      	b.n	2972 <_malloc_r+0xee>
    2d14:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    2d18:	d818      	bhi.n	2d4c <_malloc_r+0x4c8>
    2d1a:	0be8      	lsrs	r0, r5, #15
    2d1c:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    2d20:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2d24:	3077      	adds	r0, #119	; 0x77
    2d26:	e5cf      	b.n	28c8 <_malloc_r+0x44>
    2d28:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    2d2c:	e6eb      	b.n	2b06 <_malloc_r+0x282>
    2d2e:	2101      	movs	r1, #1
    2d30:	f8d8 3004 	ldr.w	r3, [r8, #4]
    2d34:	1092      	asrs	r2, r2, #2
    2d36:	fa01 f202 	lsl.w	r2, r1, r2
    2d3a:	431a      	orrs	r2, r3
    2d3c:	f8c8 2004 	str.w	r2, [r8, #4]
    2d40:	4661      	mov	r1, ip
    2d42:	e777      	b.n	2c34 <_malloc_r+0x3b0>
    2d44:	2301      	movs	r3, #1
    2d46:	f8cb 3004 	str.w	r3, [fp, #4]
    2d4a:	e725      	b.n	2b98 <_malloc_r+0x314>
    2d4c:	f240 5254 	movw	r2, #1364	; 0x554
    2d50:	4293      	cmp	r3, r2
    2d52:	d820      	bhi.n	2d96 <_malloc_r+0x512>
    2d54:	0ca8      	lsrs	r0, r5, #18
    2d56:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    2d5a:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2d5e:	307c      	adds	r0, #124	; 0x7c
    2d60:	e5b2      	b.n	28c8 <_malloc_r+0x44>
    2d62:	3210      	adds	r2, #16
    2d64:	e6a4      	b.n	2ab0 <_malloc_r+0x22c>
    2d66:	2a54      	cmp	r2, #84	; 0x54
    2d68:	d826      	bhi.n	2db8 <_malloc_r+0x534>
    2d6a:	0b1a      	lsrs	r2, r3, #12
    2d6c:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    2d70:	0049      	lsls	r1, r1, #1
    2d72:	326e      	adds	r2, #110	; 0x6e
    2d74:	e748      	b.n	2c08 <_malloc_r+0x384>
    2d76:	68bc      	ldr	r4, [r7, #8]
    2d78:	6862      	ldr	r2, [r4, #4]
    2d7a:	f022 0203 	bic.w	r2, r2, #3
    2d7e:	e705      	b.n	2b8c <_malloc_r+0x308>
    2d80:	f3ca 000b 	ubfx	r0, sl, #0, #12
    2d84:	2800      	cmp	r0, #0
    2d86:	f47f aea8 	bne.w	2ada <_malloc_r+0x256>
    2d8a:	4442      	add	r2, r8
    2d8c:	68bb      	ldr	r3, [r7, #8]
    2d8e:	f042 0201 	orr.w	r2, r2, #1
    2d92:	605a      	str	r2, [r3, #4]
    2d94:	e6ec      	b.n	2b70 <_malloc_r+0x2ec>
    2d96:	23fe      	movs	r3, #254	; 0xfe
    2d98:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    2d9c:	207e      	movs	r0, #126	; 0x7e
    2d9e:	e593      	b.n	28c8 <_malloc_r+0x44>
    2da0:	2201      	movs	r2, #1
    2da2:	f04f 0900 	mov.w	r9, #0
    2da6:	e6c1      	b.n	2b2c <_malloc_r+0x2a8>
    2da8:	f104 0108 	add.w	r1, r4, #8
    2dac:	4630      	mov	r0, r6
    2dae:	f000 f8fb 	bl	2fa8 <_free_r>
    2db2:	f8d9 1000 	ldr.w	r1, [r9]
    2db6:	e6db      	b.n	2b70 <_malloc_r+0x2ec>
    2db8:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    2dbc:	d805      	bhi.n	2dca <_malloc_r+0x546>
    2dbe:	0bda      	lsrs	r2, r3, #15
    2dc0:	f102 0178 	add.w	r1, r2, #120	; 0x78
    2dc4:	0049      	lsls	r1, r1, #1
    2dc6:	3277      	adds	r2, #119	; 0x77
    2dc8:	e71e      	b.n	2c08 <_malloc_r+0x384>
    2dca:	f240 5154 	movw	r1, #1364	; 0x554
    2dce:	428a      	cmp	r2, r1
    2dd0:	d805      	bhi.n	2dde <_malloc_r+0x55a>
    2dd2:	0c9a      	lsrs	r2, r3, #18
    2dd4:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    2dd8:	0049      	lsls	r1, r1, #1
    2dda:	327c      	adds	r2, #124	; 0x7c
    2ddc:	e714      	b.n	2c08 <_malloc_r+0x384>
    2dde:	21fe      	movs	r1, #254	; 0xfe
    2de0:	227e      	movs	r2, #126	; 0x7e
    2de2:	e711      	b.n	2c08 <_malloc_r+0x384>
    2de4:	687b      	ldr	r3, [r7, #4]
    2de6:	e784      	b.n	2cf2 <_malloc_r+0x46e>
    2de8:	08e8      	lsrs	r0, r5, #3
    2dea:	1c43      	adds	r3, r0, #1
    2dec:	005b      	lsls	r3, r3, #1
    2dee:	e5f8      	b.n	29e2 <_malloc_r+0x15e>
    2df0:	1fff8ddc 	.word	0x1fff8ddc

00002df4 <__malloc_lock>:
    2df4:	4770      	bx	lr
    2df6:	bf00      	nop

00002df8 <__malloc_unlock>:
    2df8:	4770      	bx	lr
    2dfa:	bf00      	nop

00002dfc <_sbrk_r>:
    2dfc:	b538      	push	{r3, r4, r5, lr}
    2dfe:	4c07      	ldr	r4, [pc, #28]	; (2e1c <_sbrk_r+0x20>)
    2e00:	2300      	movs	r3, #0
    2e02:	4605      	mov	r5, r0
    2e04:	4608      	mov	r0, r1
    2e06:	6023      	str	r3, [r4, #0]
    2e08:	f7fd fdac 	bl	964 <_sbrk>
    2e0c:	1c43      	adds	r3, r0, #1
    2e0e:	d000      	beq.n	2e12 <_sbrk_r+0x16>
    2e10:	bd38      	pop	{r3, r4, r5, pc}
    2e12:	6823      	ldr	r3, [r4, #0]
    2e14:	2b00      	cmp	r3, #0
    2e16:	d0fb      	beq.n	2e10 <_sbrk_r+0x14>
    2e18:	602b      	str	r3, [r5, #0]
    2e1a:	bd38      	pop	{r3, r4, r5, pc}
    2e1c:	1fff95c0 	.word	0x1fff95c0

00002e20 <__register_exitproc>:
    2e20:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2e24:	4c25      	ldr	r4, [pc, #148]	; (2ebc <__register_exitproc+0x9c>)
    2e26:	6825      	ldr	r5, [r4, #0]
    2e28:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    2e2c:	4606      	mov	r6, r0
    2e2e:	4688      	mov	r8, r1
    2e30:	4692      	mov	sl, r2
    2e32:	4699      	mov	r9, r3
    2e34:	b3c4      	cbz	r4, 2ea8 <__register_exitproc+0x88>
    2e36:	6860      	ldr	r0, [r4, #4]
    2e38:	281f      	cmp	r0, #31
    2e3a:	dc17      	bgt.n	2e6c <__register_exitproc+0x4c>
    2e3c:	1c43      	adds	r3, r0, #1
    2e3e:	b176      	cbz	r6, 2e5e <__register_exitproc+0x3e>
    2e40:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    2e44:	2201      	movs	r2, #1
    2e46:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    2e4a:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    2e4e:	4082      	lsls	r2, r0
    2e50:	4311      	orrs	r1, r2
    2e52:	2e02      	cmp	r6, #2
    2e54:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    2e58:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    2e5c:	d01e      	beq.n	2e9c <__register_exitproc+0x7c>
    2e5e:	3002      	adds	r0, #2
    2e60:	6063      	str	r3, [r4, #4]
    2e62:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    2e66:	2000      	movs	r0, #0
    2e68:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2e6c:	4b14      	ldr	r3, [pc, #80]	; (2ec0 <__register_exitproc+0xa0>)
    2e6e:	b303      	cbz	r3, 2eb2 <__register_exitproc+0x92>
    2e70:	f44f 70c8 	mov.w	r0, #400	; 0x190
    2e74:	f7ff fcfe 	bl	2874 <malloc>
    2e78:	4604      	mov	r4, r0
    2e7a:	b1d0      	cbz	r0, 2eb2 <__register_exitproc+0x92>
    2e7c:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    2e80:	2700      	movs	r7, #0
    2e82:	e880 0088 	stmia.w	r0, {r3, r7}
    2e86:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    2e8a:	4638      	mov	r0, r7
    2e8c:	2301      	movs	r3, #1
    2e8e:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    2e92:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    2e96:	2e00      	cmp	r6, #0
    2e98:	d0e1      	beq.n	2e5e <__register_exitproc+0x3e>
    2e9a:	e7d1      	b.n	2e40 <__register_exitproc+0x20>
    2e9c:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    2ea0:	430a      	orrs	r2, r1
    2ea2:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    2ea6:	e7da      	b.n	2e5e <__register_exitproc+0x3e>
    2ea8:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    2eac:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    2eb0:	e7c1      	b.n	2e36 <__register_exitproc+0x16>
    2eb2:	f04f 30ff 	mov.w	r0, #4294967295
    2eb6:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2eba:	bf00      	nop
    2ebc:	00003348 	.word	0x00003348
    2ec0:	00002875 	.word	0x00002875

00002ec4 <register_fini>:
    2ec4:	4b02      	ldr	r3, [pc, #8]	; (2ed0 <register_fini+0xc>)
    2ec6:	b113      	cbz	r3, 2ece <register_fini+0xa>
    2ec8:	4802      	ldr	r0, [pc, #8]	; (2ed4 <register_fini+0x10>)
    2eca:	f000 b805 	b.w	2ed8 <atexit>
    2ece:	4770      	bx	lr
    2ed0:	00000000 	.word	0x00000000
    2ed4:	00002ee5 	.word	0x00002ee5

00002ed8 <atexit>:
    2ed8:	2300      	movs	r3, #0
    2eda:	4601      	mov	r1, r0
    2edc:	461a      	mov	r2, r3
    2ede:	4618      	mov	r0, r3
    2ee0:	f7ff bf9e 	b.w	2e20 <__register_exitproc>

00002ee4 <__libc_fini_array>:
    2ee4:	b538      	push	{r3, r4, r5, lr}
    2ee6:	4d07      	ldr	r5, [pc, #28]	; (2f04 <__libc_fini_array+0x20>)
    2ee8:	4c07      	ldr	r4, [pc, #28]	; (2f08 <__libc_fini_array+0x24>)
    2eea:	1b2c      	subs	r4, r5, r4
    2eec:	10a4      	asrs	r4, r4, #2
    2eee:	d005      	beq.n	2efc <__libc_fini_array+0x18>
    2ef0:	3c01      	subs	r4, #1
    2ef2:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    2ef6:	4798      	blx	r3
    2ef8:	2c00      	cmp	r4, #0
    2efa:	d1f9      	bne.n	2ef0 <__libc_fini_array+0xc>
    2efc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    2f00:	f000 ba30 	b.w	3364 <__init_array_end>
	...

00002f0c <_malloc_trim_r>:
    2f0c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    2f0e:	4f23      	ldr	r7, [pc, #140]	; (2f9c <_malloc_trim_r+0x90>)
    2f10:	460c      	mov	r4, r1
    2f12:	4606      	mov	r6, r0
    2f14:	f7ff ff6e 	bl	2df4 <__malloc_lock>
    2f18:	68bb      	ldr	r3, [r7, #8]
    2f1a:	685d      	ldr	r5, [r3, #4]
    2f1c:	f025 0503 	bic.w	r5, r5, #3
    2f20:	1b29      	subs	r1, r5, r4
    2f22:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    2f26:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    2f2a:	f021 010f 	bic.w	r1, r1, #15
    2f2e:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    2f32:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    2f36:	db07      	blt.n	2f48 <_malloc_trim_r+0x3c>
    2f38:	2100      	movs	r1, #0
    2f3a:	4630      	mov	r0, r6
    2f3c:	f7ff ff5e 	bl	2dfc <_sbrk_r>
    2f40:	68bb      	ldr	r3, [r7, #8]
    2f42:	442b      	add	r3, r5
    2f44:	4298      	cmp	r0, r3
    2f46:	d004      	beq.n	2f52 <_malloc_trim_r+0x46>
    2f48:	4630      	mov	r0, r6
    2f4a:	f7ff ff55 	bl	2df8 <__malloc_unlock>
    2f4e:	2000      	movs	r0, #0
    2f50:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2f52:	4261      	negs	r1, r4
    2f54:	4630      	mov	r0, r6
    2f56:	f7ff ff51 	bl	2dfc <_sbrk_r>
    2f5a:	3001      	adds	r0, #1
    2f5c:	d00d      	beq.n	2f7a <_malloc_trim_r+0x6e>
    2f5e:	4b10      	ldr	r3, [pc, #64]	; (2fa0 <_malloc_trim_r+0x94>)
    2f60:	68ba      	ldr	r2, [r7, #8]
    2f62:	6819      	ldr	r1, [r3, #0]
    2f64:	1b2d      	subs	r5, r5, r4
    2f66:	f045 0501 	orr.w	r5, r5, #1
    2f6a:	4630      	mov	r0, r6
    2f6c:	1b09      	subs	r1, r1, r4
    2f6e:	6055      	str	r5, [r2, #4]
    2f70:	6019      	str	r1, [r3, #0]
    2f72:	f7ff ff41 	bl	2df8 <__malloc_unlock>
    2f76:	2001      	movs	r0, #1
    2f78:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2f7a:	2100      	movs	r1, #0
    2f7c:	4630      	mov	r0, r6
    2f7e:	f7ff ff3d 	bl	2dfc <_sbrk_r>
    2f82:	68ba      	ldr	r2, [r7, #8]
    2f84:	1a83      	subs	r3, r0, r2
    2f86:	2b0f      	cmp	r3, #15
    2f88:	ddde      	ble.n	2f48 <_malloc_trim_r+0x3c>
    2f8a:	4c06      	ldr	r4, [pc, #24]	; (2fa4 <_malloc_trim_r+0x98>)
    2f8c:	4904      	ldr	r1, [pc, #16]	; (2fa0 <_malloc_trim_r+0x94>)
    2f8e:	6824      	ldr	r4, [r4, #0]
    2f90:	f043 0301 	orr.w	r3, r3, #1
    2f94:	1b00      	subs	r0, r0, r4
    2f96:	6053      	str	r3, [r2, #4]
    2f98:	6008      	str	r0, [r1, #0]
    2f9a:	e7d5      	b.n	2f48 <_malloc_trim_r+0x3c>
    2f9c:	1fff8ddc 	.word	0x1fff8ddc
    2fa0:	1fff9584 	.word	0x1fff9584
    2fa4:	1fff91e8 	.word	0x1fff91e8

00002fa8 <_free_r>:
    2fa8:	2900      	cmp	r1, #0
    2faa:	d045      	beq.n	3038 <_free_r+0x90>
    2fac:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2fb0:	460d      	mov	r5, r1
    2fb2:	4680      	mov	r8, r0
    2fb4:	f7ff ff1e 	bl	2df4 <__malloc_lock>
    2fb8:	f855 7c04 	ldr.w	r7, [r5, #-4]
    2fbc:	496a      	ldr	r1, [pc, #424]	; (3168 <_free_r+0x1c0>)
    2fbe:	f027 0301 	bic.w	r3, r7, #1
    2fc2:	f1a5 0408 	sub.w	r4, r5, #8
    2fc6:	18e2      	adds	r2, r4, r3
    2fc8:	688e      	ldr	r6, [r1, #8]
    2fca:	6850      	ldr	r0, [r2, #4]
    2fcc:	42b2      	cmp	r2, r6
    2fce:	f020 0003 	bic.w	r0, r0, #3
    2fd2:	d062      	beq.n	309a <_free_r+0xf2>
    2fd4:	07fe      	lsls	r6, r7, #31
    2fd6:	6050      	str	r0, [r2, #4]
    2fd8:	d40b      	bmi.n	2ff2 <_free_r+0x4a>
    2fda:	f855 7c08 	ldr.w	r7, [r5, #-8]
    2fde:	1be4      	subs	r4, r4, r7
    2fe0:	f101 0e08 	add.w	lr, r1, #8
    2fe4:	68a5      	ldr	r5, [r4, #8]
    2fe6:	4575      	cmp	r5, lr
    2fe8:	443b      	add	r3, r7
    2fea:	d06f      	beq.n	30cc <_free_r+0x124>
    2fec:	68e7      	ldr	r7, [r4, #12]
    2fee:	60ef      	str	r7, [r5, #12]
    2ff0:	60bd      	str	r5, [r7, #8]
    2ff2:	1815      	adds	r5, r2, r0
    2ff4:	686d      	ldr	r5, [r5, #4]
    2ff6:	07ed      	lsls	r5, r5, #31
    2ff8:	d542      	bpl.n	3080 <_free_r+0xd8>
    2ffa:	f043 0201 	orr.w	r2, r3, #1
    2ffe:	6062      	str	r2, [r4, #4]
    3000:	50e3      	str	r3, [r4, r3]
    3002:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    3006:	d218      	bcs.n	303a <_free_r+0x92>
    3008:	08db      	lsrs	r3, r3, #3
    300a:	1c5a      	adds	r2, r3, #1
    300c:	684d      	ldr	r5, [r1, #4]
    300e:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    3012:	60a7      	str	r7, [r4, #8]
    3014:	2001      	movs	r0, #1
    3016:	109b      	asrs	r3, r3, #2
    3018:	fa00 f303 	lsl.w	r3, r0, r3
    301c:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    3020:	431d      	orrs	r5, r3
    3022:	3808      	subs	r0, #8
    3024:	60e0      	str	r0, [r4, #12]
    3026:	604d      	str	r5, [r1, #4]
    3028:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    302c:	60fc      	str	r4, [r7, #12]
    302e:	4640      	mov	r0, r8
    3030:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    3034:	f7ff bee0 	b.w	2df8 <__malloc_unlock>
    3038:	4770      	bx	lr
    303a:	0a5a      	lsrs	r2, r3, #9
    303c:	2a04      	cmp	r2, #4
    303e:	d853      	bhi.n	30e8 <_free_r+0x140>
    3040:	099a      	lsrs	r2, r3, #6
    3042:	f102 0739 	add.w	r7, r2, #57	; 0x39
    3046:	007f      	lsls	r7, r7, #1
    3048:	f102 0538 	add.w	r5, r2, #56	; 0x38
    304c:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    3050:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    3054:	4944      	ldr	r1, [pc, #272]	; (3168 <_free_r+0x1c0>)
    3056:	3808      	subs	r0, #8
    3058:	4290      	cmp	r0, r2
    305a:	d04d      	beq.n	30f8 <_free_r+0x150>
    305c:	6851      	ldr	r1, [r2, #4]
    305e:	f021 0103 	bic.w	r1, r1, #3
    3062:	428b      	cmp	r3, r1
    3064:	d202      	bcs.n	306c <_free_r+0xc4>
    3066:	6892      	ldr	r2, [r2, #8]
    3068:	4290      	cmp	r0, r2
    306a:	d1f7      	bne.n	305c <_free_r+0xb4>
    306c:	68d0      	ldr	r0, [r2, #12]
    306e:	60e0      	str	r0, [r4, #12]
    3070:	60a2      	str	r2, [r4, #8]
    3072:	6084      	str	r4, [r0, #8]
    3074:	60d4      	str	r4, [r2, #12]
    3076:	4640      	mov	r0, r8
    3078:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    307c:	f7ff bebc 	b.w	2df8 <__malloc_unlock>
    3080:	6895      	ldr	r5, [r2, #8]
    3082:	4f3a      	ldr	r7, [pc, #232]	; (316c <_free_r+0x1c4>)
    3084:	42bd      	cmp	r5, r7
    3086:	4403      	add	r3, r0
    3088:	d03f      	beq.n	310a <_free_r+0x162>
    308a:	68d0      	ldr	r0, [r2, #12]
    308c:	60e8      	str	r0, [r5, #12]
    308e:	f043 0201 	orr.w	r2, r3, #1
    3092:	6085      	str	r5, [r0, #8]
    3094:	6062      	str	r2, [r4, #4]
    3096:	50e3      	str	r3, [r4, r3]
    3098:	e7b3      	b.n	3002 <_free_r+0x5a>
    309a:	07ff      	lsls	r7, r7, #31
    309c:	4403      	add	r3, r0
    309e:	d407      	bmi.n	30b0 <_free_r+0x108>
    30a0:	f855 2c08 	ldr.w	r2, [r5, #-8]
    30a4:	1aa4      	subs	r4, r4, r2
    30a6:	4413      	add	r3, r2
    30a8:	68a0      	ldr	r0, [r4, #8]
    30aa:	68e2      	ldr	r2, [r4, #12]
    30ac:	60c2      	str	r2, [r0, #12]
    30ae:	6090      	str	r0, [r2, #8]
    30b0:	4a2f      	ldr	r2, [pc, #188]	; (3170 <_free_r+0x1c8>)
    30b2:	6812      	ldr	r2, [r2, #0]
    30b4:	f043 0001 	orr.w	r0, r3, #1
    30b8:	4293      	cmp	r3, r2
    30ba:	6060      	str	r0, [r4, #4]
    30bc:	608c      	str	r4, [r1, #8]
    30be:	d3b6      	bcc.n	302e <_free_r+0x86>
    30c0:	4b2c      	ldr	r3, [pc, #176]	; (3174 <_free_r+0x1cc>)
    30c2:	4640      	mov	r0, r8
    30c4:	6819      	ldr	r1, [r3, #0]
    30c6:	f7ff ff21 	bl	2f0c <_malloc_trim_r>
    30ca:	e7b0      	b.n	302e <_free_r+0x86>
    30cc:	1811      	adds	r1, r2, r0
    30ce:	6849      	ldr	r1, [r1, #4]
    30d0:	07c9      	lsls	r1, r1, #31
    30d2:	d444      	bmi.n	315e <_free_r+0x1b6>
    30d4:	6891      	ldr	r1, [r2, #8]
    30d6:	68d2      	ldr	r2, [r2, #12]
    30d8:	60ca      	str	r2, [r1, #12]
    30da:	4403      	add	r3, r0
    30dc:	f043 0001 	orr.w	r0, r3, #1
    30e0:	6091      	str	r1, [r2, #8]
    30e2:	6060      	str	r0, [r4, #4]
    30e4:	50e3      	str	r3, [r4, r3]
    30e6:	e7a2      	b.n	302e <_free_r+0x86>
    30e8:	2a14      	cmp	r2, #20
    30ea:	d817      	bhi.n	311c <_free_r+0x174>
    30ec:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    30f0:	007f      	lsls	r7, r7, #1
    30f2:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    30f6:	e7a9      	b.n	304c <_free_r+0xa4>
    30f8:	10aa      	asrs	r2, r5, #2
    30fa:	684b      	ldr	r3, [r1, #4]
    30fc:	2501      	movs	r5, #1
    30fe:	fa05 f202 	lsl.w	r2, r5, r2
    3102:	4313      	orrs	r3, r2
    3104:	604b      	str	r3, [r1, #4]
    3106:	4602      	mov	r2, r0
    3108:	e7b1      	b.n	306e <_free_r+0xc6>
    310a:	f043 0201 	orr.w	r2, r3, #1
    310e:	614c      	str	r4, [r1, #20]
    3110:	610c      	str	r4, [r1, #16]
    3112:	60e5      	str	r5, [r4, #12]
    3114:	60a5      	str	r5, [r4, #8]
    3116:	6062      	str	r2, [r4, #4]
    3118:	50e3      	str	r3, [r4, r3]
    311a:	e788      	b.n	302e <_free_r+0x86>
    311c:	2a54      	cmp	r2, #84	; 0x54
    311e:	d806      	bhi.n	312e <_free_r+0x186>
    3120:	0b1a      	lsrs	r2, r3, #12
    3122:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    3126:	007f      	lsls	r7, r7, #1
    3128:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    312c:	e78e      	b.n	304c <_free_r+0xa4>
    312e:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    3132:	d806      	bhi.n	3142 <_free_r+0x19a>
    3134:	0bda      	lsrs	r2, r3, #15
    3136:	f102 0778 	add.w	r7, r2, #120	; 0x78
    313a:	007f      	lsls	r7, r7, #1
    313c:	f102 0577 	add.w	r5, r2, #119	; 0x77
    3140:	e784      	b.n	304c <_free_r+0xa4>
    3142:	f240 5054 	movw	r0, #1364	; 0x554
    3146:	4282      	cmp	r2, r0
    3148:	d806      	bhi.n	3158 <_free_r+0x1b0>
    314a:	0c9a      	lsrs	r2, r3, #18
    314c:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    3150:	007f      	lsls	r7, r7, #1
    3152:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    3156:	e779      	b.n	304c <_free_r+0xa4>
    3158:	27fe      	movs	r7, #254	; 0xfe
    315a:	257e      	movs	r5, #126	; 0x7e
    315c:	e776      	b.n	304c <_free_r+0xa4>
    315e:	f043 0201 	orr.w	r2, r3, #1
    3162:	6062      	str	r2, [r4, #4]
    3164:	50e3      	str	r3, [r4, r3]
    3166:	e762      	b.n	302e <_free_r+0x86>
    3168:	1fff8ddc 	.word	0x1fff8ddc
    316c:	1fff8de4 	.word	0x1fff8de4
    3170:	1fff91e4 	.word	0x1fff91e4
    3174:	1fff9580 	.word	0x1fff9580
    3178:	736e6553 	.word	0x736e6553
    317c:	4f20726f 	.word	0x4f20726f
    3180:	6950206e 	.word	0x6950206e
    3184:	0000206e 	.word	0x0000206e
    3188:	6d6f4320 	.word	0x6d6f4320
    318c:	74656c70 	.word	0x74656c70
    3190:	ffff0065 	.word	0xffff0065
    3194:	74696e49 	.word	0x74696e49
    3198:	746e4920 	.word	0x746e4920
    319c:	75727265 	.word	0x75727265
    31a0:	20737470 	.word	0x20737470
    31a4:	0000202d 	.word	0x0000202d
    31a8:	706d6f43 	.word	0x706d6f43
    31ac:	6574656c 	.word	0x6574656c
    31b0:	00000000 	.word	0x00000000
    31b4:	ffff0a0d 	.word	0xffff0a0d

000031b8 <digital_pin_to_info_PGM>:
    31b8:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    31c8:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    31d8:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    31e8:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    31f8:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    3208:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    3218:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    3228:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    3238:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    3248:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    3258:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    3268:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    3278:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    3288:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    3298:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    32a8:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    32b8:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

000032c8 <vtable for usb_serial_class>:
	...
    32d0:	00001b61 00001b59 00001b55 00001b51     a...Y...U...Q...
    32e0:	00001b4d 00001b49 00001b45 00001b41     M...I...E...A...

000032f0 <usb_endpoint_config_table>:
    32f0:	15191500                                ....

000032f4 <usb_descriptor_list>:
    32f4:	00000100 1fff8908 00000012 00000200     ................
    3304:	1fff8934 00000043 00000300 1fff8990     4...C...........
    3314:	00000000 04090301 1fff891c 00000000     ................
    3324:	04090302 1fff8978 00000000 04090303     ....x...........
    3334:	1fff8994 00000000 00000000 00000000     ................
    3344:	00000000                                ....

00003348 <_global_impure_ptr>:
    3348:	1fff89b0                                ....

0000334c <_init>:
    334c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    334e:	bf00      	nop
    3350:	bcf8      	pop	{r3, r4, r5, r6, r7}
    3352:	bc08      	pop	{r3}
    3354:	469e      	mov	lr, r3
    3356:	4770      	bx	lr

00003358 <__init_array_start>:
    3358:	00002ec5 	.word	0x00002ec5

0000335c <__frame_dummy_init_array_entry>:
    335c:	00000435 00000655                       5...U...

Disassembly of section .fini:

00003364 <_fini>:
    3364:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3366:	bf00      	nop

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
1fff880c:	1fff95c4                                ....

1fff8810 <isr_table_portA>:
1fff8810:	000009dd 000009dd 000009dd 000009dd     ................
1fff8820:	000009dd 000009dd 000009dd 000009dd     ................
1fff8830:	000009dd 000009dd 000009dd 000009dd     ................
1fff8840:	000009dd 000009dd                       ........

1fff8848 <isr_table_portB>:
1fff8848:	000009dd 000009dd 000009dd 000009dd     ................
1fff8858:	000009dd 000009dd 000009dd 000009dd     ................
1fff8868:	000009dd 000009dd 000009dd 000009dd     ................
1fff8878:	000009dd 000009dd 000009dd 000009dd     ................
1fff8888:	000009dd 000009dd 000009dd 000009dd     ................

1fff8898 <isr_table_portC>:
1fff8898:	000009dd 000009dd 000009dd 000009dd     ................
1fff88a8:	000009dd 000009dd 000009dd 000009dd     ................
1fff88b8:	000009dd 000009dd 000009dd 000009dd     ................

1fff88c8 <isr_table_portD>:
1fff88c8:	000009dd 000009dd 000009dd 000009dd     ................
1fff88d8:	000009dd 000009dd 000009dd 000009dd     ................

1fff88e8 <isr_table_portE>:
1fff88e8:	000009dd 000009dd                       ........

1fff88f0 <Serial>:
1fff88f0:	000032d0 00000000 000003e8 00000000     .2..............

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
