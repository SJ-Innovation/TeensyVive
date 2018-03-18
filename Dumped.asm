
.\.pioenvs\teensy31\firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_VectorsFlash>:
       0:	00 80 00 20 bd 01 00 00 2d 09 00 00 e5 08 00 00     ... ....-.......
      10:	e5 08 00 00 e5 08 00 00 e5 08 00 00 e5 08 00 00     ................
      20:	e5 08 00 00 e5 08 00 00 e5 08 00 00 2d 09 00 00     ............-...
      30:	2d 09 00 00 e5 08 00 00 c1 20 00 00 fd 22 00 00     -........ ..."..
      40:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      50:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      60:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      70:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      80:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      90:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      a0:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      b0:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      c0:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      d0:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      e0:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
      f0:	2d 09 00 00 19 24 00 00 2d 09 00 00 45 25 00 00     -....$..-...E%..
     100:	2d 09 00 00 71 26 00 00 2d 09 00 00 2d 09 00 00     -...q&..-...-...
     110:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     120:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     130:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     140:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     150:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     160:	2d 09 00 00 dd 0f 00 00 2d 09 00 00 2d 09 00 00     -.......-...-...
     170:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     180:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     190:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     1a0:	2d 09 00 00 2d 09 00 00 2d 09 00 00 2d 09 00 00     -...-...-...-...
     1b0:	2d 09 00 00 2d 09 00 00 2d 09 00 00                 -...-...-...

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
     1d0:	f000 fbb0 	bl	934 <startup_early_hook>
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
     2d6:	f000 fc05 	bl	ae4 <_init_Teensyduino_internal_>

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
     2e4:	f000 fbec 	bl	ac0 <rtc_set>
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
     302:	f000 fbdd 	bl	ac0 <rtc_set>
		#else
		rtc_set(TIME_T);
		#endif
		*(uint32_t *)0x4003E01C = 0;
     306:	2300      	movs	r3, #0
     308:	6023      	str	r3, [r4, #0]
	}
#endif

	__libc_init_array();
     30a:	f002 fa9f 	bl	284c <__libc_init_array>

	startup_late_hook();
     30e:	f000 fb17 	bl	940 <startup_late_hook>
	main();
     312:	f000 fa03 	bl	71c <main>
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
     33c:	000033a0 	.word	0x000033a0
     340:	1fff8720 	.word	0x1fff8720
     344:	1fff91ec 	.word	0x1fff91ec
     348:	1fff95d0 	.word	0x1fff95d0
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
     380:	5aae480d 	.word	0x5aae480d
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
     430:	0000339c 	.word	0x0000339c

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
     460:	0000339c 	.word	0x0000339c
     464:	1fff91ec 	.word	0x1fff91ec
     468:	00000000 	.word	0x00000000

0000046c <SensorNode::SetLEDState(int)>:

#include "SensorNode.h"
#include "config.h"


void SensorNode::SetLEDState(int LEDState) {
     46c:	b570      	push	{r4, r5, r6, lr}
    static int CurrentLEDState = LED_OFF;
    if (LEDState != CurrentLEDState) {
     46e:	4e28      	ldr	r6, [pc, #160]	; (510 <SensorNode::SetLEDState(int)+0xa4>)
     470:	6833      	ldr	r3, [r6, #0]
     472:	428b      	cmp	r3, r1
     474:	d024      	beq.n	4c0 <SensorNode::SetLEDState(int)+0x54>
     476:	460c      	mov	r4, r1
     478:	4605      	mov	r5, r0
        virtual int read() { return usb_serial_getchar(); }
        virtual int peek() { return usb_serial_peekchar(); }
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
        virtual void clear(void) { usb_serial_flush_input(); }
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
     47a:	2103      	movs	r1, #3
     47c:	4825      	ldr	r0, [pc, #148]	; (514 <SensorNode::SetLEDState(int)+0xa8>)
     47e:	f001 fc35 	bl	1cec <usb_serial_write>
	size_t print(double n, int digits = 2)		{ return printFloat(n, digits); }
	size_t print(const Printable &obj)		{ return obj.printTo(*this); }
	size_t println(void);
	size_t println(const String &s)			{ return print(s) + println(); }
	size_t println(char c)				{ return print(c) + println(); }
	size_t println(const char s[])			{ return print(s) + println(); }
     482:	4825      	ldr	r0, [pc, #148]	; (518 <SensorNode::SetLEDState(int)+0xac>)
     484:	f000 fa0c 	bl	8a0 <Print::println()>
        Serial.println("Set");
        switch (LEDState) {
     488:	2c04      	cmp	r4, #4
     48a:	d818      	bhi.n	4be <SensorNode::SetLEDState(int)+0x52>
     48c:	e8df f004 	tbb	[pc, r4]
     490:	3d312f03 	.word	0x3d312f03
     494:	19          	.byte	0x19
     495:	00          	.byte	0x00
            case LED_OFF:
                pinMode(_PinData.LED1Pin, INPUT);
     496:	2100      	movs	r1, #0
                pinMode(_PinData.LED2Pin, INPUT);
                digitalWrite(_PinData.LED1Pin, LOW);
                digitalWrite(_PinData.LED2Pin, LOW);
                break;
            case LED_RED:
                pinMode(_PinData.LED1Pin, OUTPUT);
     498:	f895 00c4 	ldrb.w	r0, [r5, #196]	; 0xc4
     49c:	f000 fc3a 	bl	d14 <pinMode>
                pinMode(_PinData.LED2Pin, INPUT);
     4a0:	2100      	movs	r1, #0
     4a2:	f895 00c8 	ldrb.w	r0, [r5, #200]	; 0xc8
     4a6:	f000 fc35 	bl	d14 <pinMode>
                digitalWrite(_PinData.LED1Pin, LOW);
     4aa:	2100      	movs	r1, #0
     4ac:	f895 00c4 	ldrb.w	r0, [r5, #196]	; 0xc4
     4b0:	f000 fc0c 	bl	ccc <digitalWrite>
                digitalWrite(_PinData.LED2Pin, LOW);
     4b4:	f895 00c8 	ldrb.w	r0, [r5, #200]	; 0xc8
     4b8:	2100      	movs	r1, #0
     4ba:	f000 fc07 	bl	ccc <digitalWrite>
                pinMode(_PinData.LED2Pin, OUTPUT);
                digitalWrite(_PinData.LED1Pin, LOW);
                digitalWrite(_PinData.LED2Pin, HIGH);
                break;
        }
        CurrentLEDState = LEDState;
     4be:	6034      	str	r4, [r6, #0]
     4c0:	bd70      	pop	{r4, r5, r6, pc}
                pinMode(_PinData.LED1Pin, OUTPUT);
     4c2:	2101      	movs	r1, #1
     4c4:	f895 00c4 	ldrb.w	r0, [r5, #196]	; 0xc4
     4c8:	f000 fc24 	bl	d14 <pinMode>
                pinMode(_PinData.LED2Pin, OUTPUT);
     4cc:	2101      	movs	r1, #1
     4ce:	f895 00c8 	ldrb.w	r0, [r5, #200]	; 0xc8
     4d2:	f000 fc1f 	bl	d14 <pinMode>
                digitalWrite(_PinData.LED1Pin, LOW);
     4d6:	2100      	movs	r1, #0
     4d8:	f895 00c4 	ldrb.w	r0, [r5, #196]	; 0xc4
     4dc:	f000 fbf6 	bl	ccc <digitalWrite>
                digitalWrite(_PinData.LED2Pin, HIGH);
     4e0:	f895 00c8 	ldrb.w	r0, [r5, #200]	; 0xc8
     4e4:	2101      	movs	r1, #1
     4e6:	f000 fbf1 	bl	ccc <digitalWrite>
        CurrentLEDState = LEDState;
     4ea:	6034      	str	r4, [r6, #0]
     4ec:	e7e8      	b.n	4c0 <SensorNode::SetLEDState(int)+0x54>
                pinMode(_PinData.LED1Pin, OUTPUT);
     4ee:	2101      	movs	r1, #1
     4f0:	e7d2      	b.n	498 <SensorNode::SetLEDState(int)+0x2c>
                pinMode(_PinData.LED1Pin, OUTPUT);
     4f2:	2101      	movs	r1, #1
     4f4:	f895 00c4 	ldrb.w	r0, [r5, #196]	; 0xc4
     4f8:	f000 fc0c 	bl	d14 <pinMode>
                pinMode(_PinData.LED2Pin, OUTPUT);
     4fc:	2101      	movs	r1, #1
     4fe:	f895 00c8 	ldrb.w	r0, [r5, #200]	; 0xc8
     502:	f000 fc07 	bl	d14 <pinMode>
                digitalWrite(_PinData.LED1Pin, HIGH);
     506:	2101      	movs	r1, #1
     508:	e7d0      	b.n	4ac <SensorNode::SetLEDState(int)+0x40>
                pinMode(_PinData.LED1Pin, INPUT);
     50a:	2100      	movs	r1, #0
     50c:	e7da      	b.n	4c4 <SensorNode::SetLEDState(int)+0x58>
     50e:	bf00      	nop
     510:	1fff9208 	.word	0x1fff9208
     514:	000031a0 	.word	0x000031a0
     518:	1fff88f0 	.word	0x1fff88f0

0000051c <SensorNode::SensorNode(SensorPinData_t)>:
    }

}


SensorNode::SensorNode(SensorPinData_t PinData) {
     51c:	b430      	push	{r4, r5}
     51e:	b084      	sub	sp, #16
     520:	ac01      	add	r4, sp, #4
     522:	e884 000e 	stmia.w	r4, {r1, r2, r3}
     526:	4605      	mov	r5, r0
    _PinData = PinData;
     528:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
     52c:	f105 02c0 	add.w	r2, r5, #192	; 0xc0
     530:	e882 000b 	stmia.w	r2, {r0, r1, r3}
}
     534:	4628      	mov	r0, r5
     536:	b004      	add	sp, #16
     538:	bc30      	pop	{r4, r5}
     53a:	4770      	bx	lr

0000053c <SensorNode::Init()>:

int8_t SensorNode::ProcessPointerOffset(int8_t Offset) {
    return (ProcessPointer + Offset) % WAVEFORM_SIZE;
}

void SensorNode::Init() {
     53c:	b538      	push	{r3, r4, r5, lr}
     53e:	4604      	mov	r4, r0
	size_t print(int n)				{ return print((long)n); }
     540:	4d29      	ldr	r5, [pc, #164]	; (5e8 <SensorNode::Init()+0xac>)
     542:	482a      	ldr	r0, [pc, #168]	; (5ec <SensorNode::Init()+0xb0>)
     544:	210e      	movs	r1, #14
     546:	f001 fbd1 	bl	1cec <usb_serial_write>
     54a:	f8d4 10c0 	ldr.w	r1, [r4, #192]	; 0xc0
     54e:	4628      	mov	r0, r5
     550:	f000 f92c 	bl	7ac <Print::print(long)>
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
     554:	f894 00c0 	ldrb.w	r0, [r4, #192]	; 0xc0
     558:	2100      	movs	r1, #0
     55a:	f000 fbdb 	bl	d14 <pinMode>
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
     55e:	f894 00c4 	ldrb.w	r0, [r4, #196]	; 0xc4
     562:	2100      	movs	r1, #0
     564:	f000 fbd6 	bl	d14 <pinMode>
    pinMode(_PinData.LED2Pin, INPUT);
     568:	f894 00c8 	ldrb.w	r0, [r4, #200]	; 0xc8
     56c:	2100      	movs	r1, #0
     56e:	f000 fbd1 	bl	d14 <pinMode>
    WaveformPointer = 1;
    ProcessPointer = 0;
     572:	2300      	movs	r3, #0
    Angles[STATION_A][HORZ] = 0;
     574:	2200      	movs	r2, #0
    WaveformPointer = 1;
     576:	2101      	movs	r1, #1
     578:	7021      	strb	r1, [r4, #0]
    ProcessPointer = 0;
     57a:	7063      	strb	r3, [r4, #1]
    Angles[STATION_A][VERT] = 0;
    Angles[STATION_B][HORZ] = 0;
    Angles[STATION_B][VERT] = 0;
    for (int i = 0; i < WAVEFORM_SIZE; i++) {
        Waveform[i].PulseDurationTicks = 0;
     57c:	60e3      	str	r3, [r4, #12]
        Waveform[i].RisingEdgeTicks = 0;
     57e:	6063      	str	r3, [r4, #4]
        //Waveform[i].LastPulseToThisPulseTicks = 0;
        Waveform[i].FallingEdgeTicks = 0;
     580:	60a3      	str	r3, [r4, #8]
        Waveform[i].PulseDurationTicks = 0;
     582:	61e3      	str	r3, [r4, #28]
        Waveform[i].RisingEdgeTicks = 0;
     584:	6163      	str	r3, [r4, #20]
        Waveform[i].FallingEdgeTicks = 0;
     586:	61a3      	str	r3, [r4, #24]
        Waveform[i].PulseDurationTicks = 0;
     588:	62e3      	str	r3, [r4, #44]	; 0x2c
        Waveform[i].RisingEdgeTicks = 0;
     58a:	6263      	str	r3, [r4, #36]	; 0x24
        Waveform[i].FallingEdgeTicks = 0;
     58c:	62a3      	str	r3, [r4, #40]	; 0x28
        Waveform[i].PulseDurationTicks = 0;
     58e:	63e3      	str	r3, [r4, #60]	; 0x3c
        Waveform[i].RisingEdgeTicks = 0;
     590:	6363      	str	r3, [r4, #52]	; 0x34
        Waveform[i].FallingEdgeTicks = 0;
     592:	63a3      	str	r3, [r4, #56]	; 0x38
        Waveform[i].PulseDurationTicks = 0;
     594:	64e3      	str	r3, [r4, #76]	; 0x4c
        Waveform[i].RisingEdgeTicks = 0;
     596:	6463      	str	r3, [r4, #68]	; 0x44
        Waveform[i].FallingEdgeTicks = 0;
     598:	64a3      	str	r3, [r4, #72]	; 0x48
        Waveform[i].PulseDurationTicks = 0;
     59a:	65e3      	str	r3, [r4, #92]	; 0x5c
        Waveform[i].RisingEdgeTicks = 0;
     59c:	6563      	str	r3, [r4, #84]	; 0x54
        Waveform[i].FallingEdgeTicks = 0;
     59e:	65a3      	str	r3, [r4, #88]	; 0x58
        Waveform[i].PulseDurationTicks = 0;
     5a0:	66e3      	str	r3, [r4, #108]	; 0x6c
        Waveform[i].RisingEdgeTicks = 0;
     5a2:	6663      	str	r3, [r4, #100]	; 0x64
        Waveform[i].FallingEdgeTicks = 0;
     5a4:	66a3      	str	r3, [r4, #104]	; 0x68
        Waveform[i].PulseDurationTicks = 0;
     5a6:	67e3      	str	r3, [r4, #124]	; 0x7c
        Waveform[i].RisingEdgeTicks = 0;
     5a8:	6763      	str	r3, [r4, #116]	; 0x74
        Waveform[i].FallingEdgeTicks = 0;
     5aa:	67a3      	str	r3, [r4, #120]	; 0x78
        Waveform[i].PulseDurationTicks = 0;
     5ac:	f8c4 308c 	str.w	r3, [r4, #140]	; 0x8c
        Waveform[i].RisingEdgeTicks = 0;
     5b0:	f8c4 3084 	str.w	r3, [r4, #132]	; 0x84
    Angles[STATION_A][HORZ] = 0;
     5b4:	f8c4 20a4 	str.w	r2, [r4, #164]	; 0xa4
    Angles[STATION_A][VERT] = 0;
     5b8:	f8c4 20a8 	str.w	r2, [r4, #168]	; 0xa8
    Angles[STATION_B][HORZ] = 0;
     5bc:	f8c4 20ac 	str.w	r2, [r4, #172]	; 0xac
    Angles[STATION_B][VERT] = 0;
     5c0:	f8c4 20b0 	str.w	r2, [r4, #176]	; 0xb0
     5c4:	2109      	movs	r1, #9
        Waveform[i].FallingEdgeTicks = 0;
     5c6:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
     5ca:	4809      	ldr	r0, [pc, #36]	; (5f0 <SensorNode::Init()+0xb4>)
        Waveform[i].PulseDurationTicks = 0;
     5cc:	f8c4 309c 	str.w	r3, [r4, #156]	; 0x9c
        Waveform[i].RisingEdgeTicks = 0;
     5d0:	f8c4 3094 	str.w	r3, [r4, #148]	; 0x94
        Waveform[i].FallingEdgeTicks = 0;
     5d4:	f8c4 3098 	str.w	r3, [r4, #152]	; 0x98
     5d8:	f001 fb88 	bl	1cec <usb_serial_write>
	size_t println(const char s[])			{ return print(s) + println(); }
     5dc:	4628      	mov	r0, r5
    }
    Serial.println(" Complete");
}
     5de:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     5e2:	f000 b95d 	b.w	8a0 <Print::println()>
     5e6:	bf00      	nop
     5e8:	1fff88f0 	.word	0x1fff88f0
     5ec:	000031a4 	.word	0x000031a4
     5f0:	000031b4 	.word	0x000031b4

000005f4 <SensorNode::~SensorNode()>:

SensorNode::~SensorNode() {

}
     5f4:	4770      	bx	lr
     5f6:	bf00      	nop

000005f8 <SensorNode::GetPulsePin()>:

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}
     5f8:	f890 00c0 	ldrb.w	r0, [r0, #192]	; 0xc0
     5fc:	4770      	bx	lr
     5fe:	bf00      	nop

00000600 <SensorNode::RisingEdge(unsigned long)>:
    (++WaveformPointer) %= WAVEFORM_SIZE;
     600:	7803      	ldrb	r3, [r0, #0]
     602:	4a0b      	ldr	r2, [pc, #44]	; (630 <SensorNode::RisingEdge(unsigned long)+0x30>)
     604:	3301      	adds	r3, #1
     606:	b25b      	sxtb	r3, r3

void SensorNode::RisingEdge(u_int32_t TimeTicks) {
     608:	b410      	push	{r4}
    (++WaveformPointer) %= WAVEFORM_SIZE;
     60a:	fb82 2403 	smull	r2, r4, r2, r3
     60e:	17da      	asrs	r2, r3, #31
     610:	ebc2 02a4 	rsb	r2, r2, r4, asr #2
     614:	eb02 0282 	add.w	r2, r2, r2, lsl #2
     618:	eba3 0342 	sub.w	r3, r3, r2, lsl #1
     61c:	b25b      	sxtb	r3, r3
    IncWaveformPointer();
    Waveform[WaveformPointer].Valid = false;
     61e:	eb00 1203 	add.w	r2, r0, r3, lsl #4
     622:	2400      	movs	r4, #0
    (++WaveformPointer) %= WAVEFORM_SIZE;
     624:	7003      	strb	r3, [r0, #0]
    Waveform[WaveformPointer].Valid = false;
     626:	7414      	strb	r4, [r2, #16]
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
     628:	6051      	str	r1, [r2, #4]

}
     62a:	bc10      	pop	{r4}
     62c:	4770      	bx	lr
     62e:	bf00      	nop
     630:	66666667 	.word	0x66666667

00000634 <SensorNode::FallingEdge(unsigned long)>:

void SensorNode::FallingEdge(u_int32_t TimeTicks) {
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     634:	f990 2000 	ldrsb.w	r2, [r0]
     638:	eb00 1002 	add.w	r0, r0, r2, lsl #4
    Waveform[WaveformPointer].Valid = false;
     63c:	2300      	movs	r3, #0
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
     63e:	6081      	str	r1, [r0, #8]
    Waveform[WaveformPointer].Valid = false;
     640:	7403      	strb	r3, [r0, #16]
     642:	4770      	bx	lr

00000644 <InitTimer()>:
#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {
     644:	b4f0      	push	{r4, r5, r6, r7}

    SIM_SCGC6 |= SIM_SCGC6_PIT;
     646:	4a08      	ldr	r2, [pc, #32]	; (668 <InitTimer()+0x24>)
    PIT_LDVAL0 = UINT32_MAX;
     648:	4e08      	ldr	r6, [pc, #32]	; (66c <InitTimer()+0x28>)
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     64a:	6813      	ldr	r3, [r2, #0]
    PIT_MCR = 0;
     64c:	4c08      	ldr	r4, [pc, #32]	; (670 <InitTimer()+0x2c>)
    PIT_TCTRL0 = 1;
     64e:	4909      	ldr	r1, [pc, #36]	; (674 <InitTimer()+0x30>)
    PIT_LDVAL0 = UINT32_MAX;
     650:	f04f 37ff 	mov.w	r7, #4294967295
    PIT_MCR = 0;
     654:	2500      	movs	r5, #0
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     656:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
    PIT_TCTRL0 = 1;
     65a:	2001      	movs	r0, #1
    SIM_SCGC6 |= SIM_SCGC6_PIT;
     65c:	6013      	str	r3, [r2, #0]
    PIT_LDVAL0 = UINT32_MAX;
     65e:	6037      	str	r7, [r6, #0]
    PIT_MCR = 0;
     660:	6025      	str	r5, [r4, #0]
    PIT_TCTRL0 = 1;
     662:	6008      	str	r0, [r1, #0]

}
     664:	bcf0      	pop	{r4, r5, r6, r7}
     666:	4770      	bx	lr
     668:	4004803c 	.word	0x4004803c
     66c:	40037100 	.word	0x40037100
     670:	40037000 	.word	0x40037000
     674:	40037108 	.word	0x40037108

00000678 <Interrupt0Change()>:
}\
}



void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PINS.PulsePin, 0);
     678:	4a07      	ldr	r2, [pc, #28]	; (698 <Interrupt0Change()+0x20>)
		  else {
			return 0;
		}
	} else {
		#if defined(KINETISK)
		return *portInputRegister(pin);
     67a:	4b08      	ldr	r3, [pc, #32]	; (69c <Interrupt0Change()+0x24>)
     67c:	7811      	ldrb	r1, [r2, #0]
     67e:	4a08      	ldr	r2, [pc, #32]	; (6a0 <Interrupt0Change()+0x28>)
     680:	f853 3031 	ldr.w	r3, [r3, r1, lsl #3]
     684:	6811      	ldr	r1, [r2, #0]
     686:	f893 3200 	ldrb.w	r3, [r3, #512]	; 0x200
     68a:	4806      	ldr	r0, [pc, #24]	; (6a4 <Interrupt0Change()+0x2c>)
     68c:	43c9      	mvns	r1, r1
     68e:	b90b      	cbnz	r3, 694 <Interrupt0Change()+0x1c>
     690:	f7ff bfd0 	b.w	634 <SensorNode::FallingEdge(unsigned long)>
     694:	f7ff bfb4 	b.w	600 <SensorNode::RisingEdge(unsigned long)>
     698:	1fff8800 	.word	0x1fff8800
     69c:	000031ec 	.word	0x000031ec
     6a0:	40037104 	.word	0x40037104
     6a4:	1fff920c 	.word	0x1fff920c

000006a8 <__tcf_0>:
SensorNode Nodes[] = {SENSOR_1_PINS};
     6a8:	4801      	ldr	r0, [pc, #4]	; (6b0 <__tcf_0+0x8>)
     6aa:	f7ff bfa3 	b.w	5f4 <SensorNode::~SensorNode()>
     6ae:	bf00      	nop
     6b0:	1fff920c 	.word	0x1fff920c

000006b4 <MainSetup()>:
}

//char (*__kaboom)[sizeof(float16_t)] = 1;


void MainSetup() {
     6b4:	b510      	push	{r4, lr}
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
     6b6:	2101      	movs	r1, #1
     6b8:	200d      	movs	r0, #13
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
     6ba:	4c12      	ldr	r4, [pc, #72]	; (704 <MainSetup()+0x50>)
    pinMode(LED_BUILTIN, OUTPUT);
     6bc:	f000 fb2a 	bl	d14 <pinMode>
    delay(2000);
     6c0:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
     6c4:	f000 fb62 	bl	d8c <delay>
        Nodes[i].Init();
     6c8:	4620      	mov	r0, r4
     6ca:	f7ff ff37 	bl	53c <SensorNode::Init()>
    }
    delay(100);
     6ce:	2064      	movs	r0, #100	; 0x64
     6d0:	f000 fb5c 	bl	d8c <delay>

    InitTimer(); //Start up better timer (If using)
     6d4:	f7ff ffb6 	bl	644 <InitTimer()>
     6d8:	2112      	movs	r1, #18
     6da:	480b      	ldr	r0, [pc, #44]	; (708 <MainSetup()+0x54>)
     6dc:	f001 fb06 	bl	1cec <usb_serial_write>
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
     6e0:	4620      	mov	r0, r4
     6e2:	f7ff ff89 	bl	5f8 <SensorNode::GetPulsePin()>
     6e6:	2204      	movs	r2, #4
     6e8:	4908      	ldr	r1, [pc, #32]	; (70c <MainSetup()+0x58>)
     6ea:	f000 f969 	bl	9c0 <attachInterrupt>
     6ee:	2108      	movs	r1, #8
     6f0:	4807      	ldr	r0, [pc, #28]	; (710 <MainSetup()+0x5c>)
     6f2:	f001 fafb 	bl	1cec <usb_serial_write>
     6f6:	4807      	ldr	r0, [pc, #28]	; (714 <MainSetup()+0x60>)
     6f8:	f000 f8d2 	bl	8a0 <Print::println()>
				CORE_PIN13_PORTSET = CORE_PIN13_BITMASK;
     6fc:	4b06      	ldr	r3, [pc, #24]	; (718 <MainSetup()+0x64>)
     6fe:	2220      	movs	r2, #32
     700:	601a      	str	r2, [r3, #0]
     702:	bd10      	pop	{r4, pc}
     704:	1fff920c 	.word	0x1fff920c
     708:	000031c0 	.word	0x000031c0
     70c:	00000679 	.word	0x00000679
     710:	000031d4 	.word	0x000031d4
     714:	1fff88f0 	.word	0x1fff88f0
     718:	400ff084 	.word	0x400ff084

0000071c <main>:


}


int main() {
     71c:	b510      	push	{r4, lr}
    MainSetup();
     71e:	f7ff ffc9 	bl	6b4 <MainSetup()>
    delay(200);
     722:	20c8      	movs	r0, #200	; 0xc8
     724:	f000 fb32 	bl	d8c <delay>
//    digitalWrite(22,HIGH);
//    digitalWrite(23, LOW);


    while (true) {
        for (int i = 0; i <= LED_RED_GREEN; i++) {
     728:	2400      	movs	r4, #0
            Nodes[0].SetLEDState(i);
     72a:	4621      	mov	r1, r4
     72c:	4808      	ldr	r0, [pc, #32]	; (750 <main+0x34>)
     72e:	f7ff fe9d 	bl	46c <SensorNode::SetLEDState(int)>
	size_t print(int n)				{ return print((long)n); }
     732:	4621      	mov	r1, r4
     734:	4807      	ldr	r0, [pc, #28]	; (754 <main+0x38>)
     736:	f000 f839 	bl	7ac <Print::print(long)>
	size_t println(const __FlashStringHelper *f)	{ return print(f) + println(); }

	size_t println(uint8_t b)			{ return print(b) + println(); }
	size_t println(int n)				{ return print(n) + println(); }
     73a:	4806      	ldr	r0, [pc, #24]	; (754 <main+0x38>)
     73c:	f000 f8b0 	bl	8a0 <Print::println()>
        for (int i = 0; i <= LED_RED_GREEN; i++) {
     740:	3401      	adds	r4, #1
            Serial.println(i);
            delay(250);
     742:	20fa      	movs	r0, #250	; 0xfa
     744:	f000 fb22 	bl	d8c <delay>
        for (int i = 0; i <= LED_RED_GREEN; i++) {
     748:	2c05      	cmp	r4, #5
     74a:	d0ed      	beq.n	728 <main+0xc>
     74c:	e7ed      	b.n	72a <main+0xe>
     74e:	bf00      	nop
     750:	1fff920c 	.word	0x1fff920c
     754:	1fff88f0 	.word	0x1fff88f0

00000758 <_GLOBAL__sub_I_SENSOR_1_PINS>:
    }

  MainLoop();
//    }
    return 0;
     758:	b508      	push	{r3, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     75a:	4b06      	ldr	r3, [pc, #24]	; (774 <_GLOBAL__sub_I_SENSOR_1_PINS+0x1c>)
     75c:	4806      	ldr	r0, [pc, #24]	; (778 <_GLOBAL__sub_I_SENSOR_1_PINS+0x20>)
     75e:	cb0e      	ldmia	r3, {r1, r2, r3}
     760:	f7ff fedc 	bl	51c <SensorNode::SensorNode(SensorPinData_t)>
     764:	4a05      	ldr	r2, [pc, #20]	; (77c <_GLOBAL__sub_I_SENSOR_1_PINS+0x24>)
     766:	4906      	ldr	r1, [pc, #24]	; (780 <_GLOBAL__sub_I_SENSOR_1_PINS+0x28>)
     768:	2000      	movs	r0, #0
     76a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
SensorNode Nodes[] = {SENSOR_1_PINS};
     76e:	f002 b85b 	b.w	2828 <__aeabi_atexit>
     772:	bf00      	nop
     774:	1fff8800 	.word	0x1fff8800
     778:	1fff920c 	.word	0x1fff920c
     77c:	1fff87fc 	.word	0x1fff87fc
     780:	000006a9 	.word	0x000006a9

00000784 <Print::write(unsigned char const*, unsigned int)>:
#include "Print.h"



size_t Print::write(const uint8_t *buffer, size_t size)
{
     784:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	size_t count = 0;
	while (size--) count += write(*buffer++);
     786:	b172      	cbz	r2, 7a6 <Print::write(unsigned char const*, unsigned int)+0x22>
     788:	4606      	mov	r6, r0
     78a:	460f      	mov	r7, r1
     78c:	4614      	mov	r4, r2
     78e:	2500      	movs	r5, #0
     790:	6833      	ldr	r3, [r6, #0]
     792:	f817 1b01 	ldrb.w	r1, [r7], #1
     796:	681b      	ldr	r3, [r3, #0]
     798:	4630      	mov	r0, r6
     79a:	4798      	blx	r3
     79c:	3c01      	subs	r4, #1
     79e:	4405      	add	r5, r0
     7a0:	d1f6      	bne.n	790 <Print::write(unsigned char const*, unsigned int)+0xc>
	return count;
}
     7a2:	4628      	mov	r0, r5
     7a4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	size_t count = 0;
     7a6:	4615      	mov	r5, r2
     7a8:	e7fb      	b.n	7a2 <Print::write(unsigned char const*, unsigned int)+0x1e>
     7aa:	bf00      	nop

000007ac <Print::print(long)>:
	return count;
}


size_t Print::print(long n)
{
     7ac:	b5f0      	push	{r4, r5, r6, r7, lr}
	uint8_t sign=0;

	if (n < 0) {
     7ae:	2900      	cmp	r1, #0
{
     7b0:	b08b      	sub	sp, #44	; 0x2c
     7b2:	4604      	mov	r4, r0
	if (n < 0) {
     7b4:	db1b      	blt.n	7ee <Print::print(long)+0x42>
	} else if (base == 1) {
		base = 10;
	}


	if (n == 0) {
     7b6:	d15a      	bne.n	86e <Print::print(long)+0xc2>
		buf[sizeof(buf) - 1] = '0';
     7b8:	2330      	movs	r3, #48	; 0x30
     7ba:	f88d 3025 	strb.w	r3, [sp, #37]	; 0x25
	}
	if (sign) {
		i--;
		buf[i] = '-';
	}
	return write(buf + i, sizeof(buf) - i);
     7be:	6823      	ldr	r3, [r4, #0]
     7c0:	4a35      	ldr	r2, [pc, #212]	; (898 <Print::print(long)+0xec>)
     7c2:	685f      	ldr	r7, [r3, #4]
     7c4:	4297      	cmp	r7, r2
     7c6:	d14a      	bne.n	85e <Print::print(long)+0xb2>
	while (size--) count += write(*buffer++);
     7c8:	2500      	movs	r5, #0
	return write(buf + i, sizeof(buf) - i);
     7ca:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     7ce:	460e      	mov	r6, r1
     7d0:	440d      	add	r5, r1
     7d2:	2700      	movs	r7, #0
     7d4:	e001      	b.n	7da <Print::print(long)+0x2e>
     7d6:	6823      	ldr	r3, [r4, #0]
     7d8:	3601      	adds	r6, #1
	while (size--) count += write(*buffer++);
     7da:	681b      	ldr	r3, [r3, #0]
     7dc:	7831      	ldrb	r1, [r6, #0]
     7de:	4620      	mov	r0, r4
     7e0:	4798      	blx	r3
     7e2:	42b5      	cmp	r5, r6
     7e4:	4407      	add	r7, r0
     7e6:	d1f6      	bne.n	7d6 <Print::print(long)+0x2a>
     7e8:	4638      	mov	r0, r7
}
     7ea:	b00b      	add	sp, #44	; 0x2c
     7ec:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     7ee:	4b2b      	ldr	r3, [pc, #172]	; (89c <Print::print(long)+0xf0>)
	return printNumber(n, 10, sign);
     7f0:	4249      	negs	r1, r1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     7f2:	fba3 2301 	umull	r2, r3, r3, r1
     7f6:	08db      	lsrs	r3, r3, #3
     7f8:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     7fc:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
     800:	3130      	adds	r1, #48	; 0x30
     802:	f88d 1025 	strb.w	r1, [sp, #37]	; 0x25
			if (n == 0) break;
     806:	2b00      	cmp	r3, #0
     808:	d044      	beq.n	894 <Print::print(long)+0xe8>
		sign = '-';
     80a:	262d      	movs	r6, #45	; 0x2d
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     80c:	4d23      	ldr	r5, [pc, #140]	; (89c <Print::print(long)+0xf0>)
		sign = '-';
     80e:	2221      	movs	r2, #33	; 0x21
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     810:	fba5 0103 	umull	r0, r1, r5, r3
     814:	08c9      	lsrs	r1, r1, #3
     816:	eb01 0081 	add.w	r0, r1, r1, lsl #2
			i--;
     81a:	3a01      	subs	r2, #1
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     81c:	eba3 0340 	sub.w	r3, r3, r0, lsl #1
			i--;
     820:	b2d2      	uxtb	r2, r2
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     822:	a80a      	add	r0, sp, #40	; 0x28
     824:	4410      	add	r0, r2
     826:	3330      	adds	r3, #48	; 0x30
     828:	f800 3c24 	strb.w	r3, [r0, #-36]
			if (n == 0) break;
     82c:	460b      	mov	r3, r1
     82e:	2900      	cmp	r1, #0
     830:	d1ee      	bne.n	810 <Print::print(long)+0x64>
	if (sign) {
     832:	b35e      	cbz	r6, 88c <Print::print(long)+0xe0>
		i--;
     834:	1e55      	subs	r5, r2, #1
     836:	b2ed      	uxtb	r5, r5
		buf[i] = '-';
     838:	ab0a      	add	r3, sp, #40	; 0x28
     83a:	442b      	add	r3, r5
     83c:	222d      	movs	r2, #45	; 0x2d
     83e:	f803 2c24 	strb.w	r2, [r3, #-36]
     842:	f1c5 0022 	rsb	r0, r5, #34	; 0x22
	return write(buf + i, sizeof(buf) - i);
     846:	6823      	ldr	r3, [r4, #0]
     848:	4a13      	ldr	r2, [pc, #76]	; (898 <Print::print(long)+0xec>)
     84a:	685f      	ldr	r7, [r3, #4]
     84c:	a901      	add	r1, sp, #4
     84e:	4297      	cmp	r7, r2
     850:	4429      	add	r1, r5
     852:	d107      	bne.n	864 <Print::print(long)+0xb8>
	while (size--) count += write(*buffer++);
     854:	f1c5 0521 	rsb	r5, r5, #33	; 0x21
     858:	2800      	cmp	r0, #0
     85a:	d1b8      	bne.n	7ce <Print::print(long)+0x22>
     85c:	e7c5      	b.n	7ea <Print::print(long)+0x3e>
	return write(buf + i, sizeof(buf) - i);
     85e:	2001      	movs	r0, #1
     860:	f10d 0125 	add.w	r1, sp, #37	; 0x25
     864:	4602      	mov	r2, r0
     866:	4620      	mov	r0, r4
     868:	47b8      	blx	r7
}
     86a:	b00b      	add	sp, #44	; 0x2c
     86c:	bdf0      	pop	{r4, r5, r6, r7, pc}
			buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     86e:	4b0b      	ldr	r3, [pc, #44]	; (89c <Print::print(long)+0xf0>)
     870:	fba3 2301 	umull	r2, r3, r3, r1
     874:	08db      	lsrs	r3, r3, #3
     876:	eb03 0283 	add.w	r2, r3, r3, lsl #2
     87a:	eba1 0242 	sub.w	r2, r1, r2, lsl #1
     87e:	3230      	adds	r2, #48	; 0x30
     880:	f88d 2025 	strb.w	r2, [sp, #37]	; 0x25
			if (n == 0) break;
     884:	2b00      	cmp	r3, #0
     886:	d09a      	beq.n	7be <Print::print(long)+0x12>
	uint8_t sign=0;
     888:	2600      	movs	r6, #0
     88a:	e7bf      	b.n	80c <Print::print(long)+0x60>
     88c:	4615      	mov	r5, r2
     88e:	f1c2 0022 	rsb	r0, r2, #34	; 0x22
     892:	e7d8      	b.n	846 <Print::print(long)+0x9a>
			if (n == 0) break;
     894:	2221      	movs	r2, #33	; 0x21
     896:	e7cd      	b.n	834 <Print::print(long)+0x88>
     898:	00000785 	.word	0x00000785
     89c:	cccccccd 	.word	0xcccccccd

000008a0 <Print::println()>:
{
     8a0:	b530      	push	{r4, r5, lr}
	return write(buf, 2);
     8a2:	6803      	ldr	r3, [r0, #0]
	uint8_t buf[2]={'\r', '\n'};
     8a4:	490d      	ldr	r1, [pc, #52]	; (8dc <Print::println()+0x3c>)
     8a6:	4a0e      	ldr	r2, [pc, #56]	; (8e0 <Print::println()+0x40>)
	return write(buf, 2);
     8a8:	685c      	ldr	r4, [r3, #4]
	uint8_t buf[2]={'\r', '\n'};
     8aa:	8809      	ldrh	r1, [r1, #0]
{
     8ac:	b083      	sub	sp, #12
     8ae:	4294      	cmp	r4, r2
	uint8_t buf[2]={'\r', '\n'};
     8b0:	f8ad 1004 	strh.w	r1, [sp, #4]
     8b4:	d10d      	bne.n	8d2 <Print::println()+0x32>
     8b6:	4605      	mov	r5, r0
	while (size--) count += write(*buffer++);
     8b8:	681b      	ldr	r3, [r3, #0]
     8ba:	210d      	movs	r1, #13
     8bc:	4798      	blx	r3
     8be:	682b      	ldr	r3, [r5, #0]
     8c0:	f89d 1005 	ldrb.w	r1, [sp, #5]
     8c4:	681b      	ldr	r3, [r3, #0]
     8c6:	4604      	mov	r4, r0
     8c8:	4628      	mov	r0, r5
     8ca:	4798      	blx	r3
     8cc:	4420      	add	r0, r4
}
     8ce:	b003      	add	sp, #12
     8d0:	bd30      	pop	{r4, r5, pc}
	return write(buf, 2);
     8d2:	a901      	add	r1, sp, #4
     8d4:	2202      	movs	r2, #2
     8d6:	47a0      	blx	r4
}
     8d8:	b003      	add	sp, #12
     8da:	bd30      	pop	{r4, r5, pc}
     8dc:	000031e8 	.word	0x000031e8
     8e0:	00000785 	.word	0x00000785

000008e4 <fault_isr>:
{
     8e4:	b508      	push	{r3, lr}
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     8e6:	4c10      	ldr	r4, [pc, #64]	; (928 <fault_isr+0x44>)
     8e8:	e008      	b.n	8fc <fault_isr+0x18>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     8ea:	6823      	ldr	r3, [r4, #0]
     8ec:	0559      	lsls	r1, r3, #21
     8ee:	d40d      	bmi.n	90c <fault_isr+0x28>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     8f0:	6823      	ldr	r3, [r4, #0]
     8f2:	051a      	lsls	r2, r3, #20
     8f4:	d40f      	bmi.n	916 <fault_isr+0x32>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     8f6:	6823      	ldr	r3, [r4, #0]
     8f8:	04db      	lsls	r3, r3, #19
     8fa:	d411      	bmi.n	920 <fault_isr+0x3c>
		if (SIM_SCGC4 & SIM_SCGC4_USBOTG) usb_isr();
     8fc:	6823      	ldr	r3, [r4, #0]
     8fe:	0358      	lsls	r0, r3, #13
     900:	d5f3      	bpl.n	8ea <fault_isr+0x6>
     902:	f000 fb6b 	bl	fdc <usb_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART0) uart0_status_isr();
     906:	6823      	ldr	r3, [r4, #0]
     908:	0559      	lsls	r1, r3, #21
     90a:	d5f1      	bpl.n	8f0 <fault_isr+0xc>
     90c:	f001 fd84 	bl	2418 <uart0_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART1) uart1_status_isr();
     910:	6823      	ldr	r3, [r4, #0]
     912:	051a      	lsls	r2, r3, #20
     914:	d5ef      	bpl.n	8f6 <fault_isr+0x12>
     916:	f001 fe15 	bl	2544 <uart1_status_isr>
		if (SIM_SCGC4 & SIM_SCGC4_UART2) uart2_status_isr();
     91a:	6823      	ldr	r3, [r4, #0]
     91c:	04db      	lsls	r3, r3, #19
     91e:	d5ed      	bpl.n	8fc <fault_isr+0x18>
     920:	f001 fea6 	bl	2670 <uart2_status_isr>
     924:	e7ea      	b.n	8fc <fault_isr+0x18>
     926:	bf00      	nop
     928:	40048034 	.word	0x40048034

0000092c <unused_isr>:
{
     92c:	b508      	push	{r3, lr}
	fault_isr();
     92e:	f7ff ffd9 	bl	8e4 <fault_isr>
     932:	bf00      	nop

00000934 <startup_early_hook>:
	WDOG_STCTRLH = WDOG_STCTRLH_ALLOWUPDATE;
     934:	4b01      	ldr	r3, [pc, #4]	; (93c <startup_early_hook+0x8>)
     936:	2210      	movs	r2, #16
     938:	801a      	strh	r2, [r3, #0]
     93a:	4770      	bx	lr
     93c:	40052000 	.word	0x40052000

00000940 <startup_late_hook>:
static void startup_default_late_hook(void) {}
     940:	4770      	bx	lr
     942:	bf00      	nop

00000944 <_sbrk>:

void * _sbrk(int incr)
{
	char *prev, *stack;

	prev = __brkval;
     944:	4909      	ldr	r1, [pc, #36]	; (96c <_sbrk+0x28>)
{
     946:	b508      	push	{r3, lr}
	prev = __brkval;
     948:	680b      	ldr	r3, [r1, #0]
	if (incr != 0) {
     94a:	b130      	cbz	r0, 95a <_sbrk+0x16>
		__asm__ volatile("mov %0, sp" : "=r" (stack) ::);
     94c:	466a      	mov	r2, sp
		if (prev + incr >= stack - STACK_MARGIN) {
     94e:	4418      	add	r0, r3
     950:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
     954:	4290      	cmp	r0, r2
     956:	d202      	bcs.n	95e <_sbrk+0x1a>
			errno = ENOMEM;
			return (void *)-1;
		}
		__brkval = prev + incr;
     958:	6008      	str	r0, [r1, #0]
	}
	return prev;
     95a:	4618      	mov	r0, r3
}
     95c:	bd08      	pop	{r3, pc}
			errno = ENOMEM;
     95e:	f001 ff6f 	bl	2840 <__errno>
     962:	230c      	movs	r3, #12
     964:	6003      	str	r3, [r0, #0]
			return (void *)-1;
     966:	f04f 30ff 	mov.w	r0, #4294967295
     96a:	bd08      	pop	{r3, pc}
     96c:	1fff880c 	.word	0x1fff880c

00000970 <ultoa>:
#include <stdlib.h>
#include <math.h>


char * ultoa(unsigned long val, char *buf, int radix)
{
     970:	b4f0      	push	{r4, r5, r6, r7}
     972:	1e4d      	subs	r5, r1, #1
     974:	462e      	mov	r6, r5
	unsigned digit;
	int i=0, j;
     976:	2400      	movs	r4, #0
     978:	e000      	b.n	97c <ultoa+0xc>
	while (1) {
		digit = val % radix;
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
		val /= radix;
		if (val == 0) break;
		i++;
     97a:	3401      	adds	r4, #1
		digit = val % radix;
     97c:	fbb0 f3f2 	udiv	r3, r0, r2
     980:	fb02 0013 	mls	r0, r2, r3, r0
		buf[i] = ((digit < 10) ? '0' + digit : 'A' + digit - 10);
     984:	2809      	cmp	r0, #9
     986:	f100 0730 	add.w	r7, r0, #48	; 0x30
     98a:	bf8a      	itet	hi
     98c:	3037      	addhi	r0, #55	; 0x37
     98e:	b2f8      	uxtbls	r0, r7
     990:	b2c0      	uxtbhi	r0, r0
     992:	f806 0f01 	strb.w	r0, [r6, #1]!
		if (val == 0) break;
     996:	4618      	mov	r0, r3
     998:	2b00      	cmp	r3, #0
     99a:	d1ee      	bne.n	97a <ultoa+0xa>
	}
	buf[i + 1] = 0;
     99c:	190a      	adds	r2, r1, r4
     99e:	7053      	strb	r3, [r2, #1]
	for (j=0; j < i; j++, i--) {
     9a0:	b14c      	cbz	r4, 9b6 <ultoa+0x46>
		t = buf[j];
		buf[j] = buf[i];
     9a2:	7810      	ldrb	r0, [r2, #0]
		t = buf[j];
     9a4:	f815 6f01 	ldrb.w	r6, [r5, #1]!
		buf[j] = buf[i];
     9a8:	7028      	strb	r0, [r5, #0]
	for (j=0; j < i; j++, i--) {
     9aa:	3301      	adds	r3, #1
     9ac:	1ae0      	subs	r0, r4, r3
     9ae:	4283      	cmp	r3, r0
		buf[i] = t;
     9b0:	f802 6901 	strb.w	r6, [r2], #-1
	for (j=0; j < i; j++, i--) {
     9b4:	dbf5      	blt.n	9a2 <ultoa+0x32>
	}
	return buf;
}
     9b6:	4608      	mov	r0, r1
     9b8:	bcf0      	pop	{r4, r5, r6, r7}
     9ba:	4770      	bx	lr

000009bc <dummy_isr>:
	{((volatile uint8_t *)&CORE_PIN26_PORTREG + (CORE_PIN26_BIT >> 3)), &CORE_PIN26_CONFIG, (1<<(CORE_PIN26_BIT & 7))}
};

#endif

static void dummy_isr() {};
     9bc:	4770      	bx	lr
     9be:	bf00      	nop

000009c0 <attachInterrupt>:
void attachInterrupt(uint8_t pin, void (*function)(void), int mode)
{
	volatile uint32_t *config;
	uint32_t cfg, mask;

	if (pin >= CORE_NUM_DIGITAL) return;
     9c0:	2821      	cmp	r0, #33	; 0x21
{
     9c2:	b4f0      	push	{r4, r5, r6, r7}
	if (pin >= CORE_NUM_DIGITAL) return;
     9c4:	d815      	bhi.n	9f2 <attachInterrupt+0x32>
	switch (mode) {
     9c6:	2a04      	cmp	r2, #4
     9c8:	d813      	bhi.n	9f2 <attachInterrupt+0x32>
     9ca:	e8df f002 	tbb	[pc, r2]
     9ce:	4c49      	.short	0x4c49
     9d0:	144f      	.short	0x144f
     9d2:	46          	.byte	0x46
     9d3:	00          	.byte	0x00
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     9d4:	4e2e      	ldr	r6, [pc, #184]	; (a90 <attachInterrupt+0xd0>)
	attachInterruptVector(IRQ_PORTD, port_D_isr);
	attachInterruptVector(IRQ_PORTE, port_E_isr);
	voidFuncPtr* isr_table = getIsrTable(config);
	if(!isr_table) return;
	uint32_t pin_index = getPinIndex(config);
	__disable_irq();
     9d6:	b672      	cpsid	i
	cfg = *config;
     9d8:	681a      	ldr	r2, [r3, #0]
	cfg &= ~0x000F0000;		// disable any previous interrupt
     9da:	f422 2270 	bic.w	r2, r2, #983040	; 0xf0000
     9de:	f042 7080 	orr.w	r0, r2, #16777216	; 0x1000000
	*config = cfg;
	isr_table[pin_index] = function;	// set the function pointer
     9e2:	f3c3 0484 	ubfx	r4, r3, #2, #5
	cfg |= mask;
     9e6:	4328      	orrs	r0, r5
	*config = cfg;
     9e8:	601a      	str	r2, [r3, #0]
	isr_table[pin_index] = function;	// set the function pointer
     9ea:	f846 1024 	str.w	r1, [r6, r4, lsl #2]
	*config = cfg;			// enable the new interrupt
     9ee:	6018      	str	r0, [r3, #0]
	__enable_irq();
     9f0:	b662      	cpsie	i
	intFunc[pin] = function;	// set the function pointer
	cfg |= mask;
	*config = cfg;			// enable the new interrupt
	__enable_irq();
#endif
}
     9f2:	bcf0      	pop	{r4, r5, r6, r7}
     9f4:	4770      	bx	lr
	switch (mode) {
     9f6:	f44f 2510 	mov.w	r5, #589824	; 0x90000
	config = portConfigRegister(pin);
     9fa:	4c26      	ldr	r4, [pc, #152]	; (a94 <attachInterrupt+0xd4>)
     9fc:	eb04 03c0 	add.w	r3, r4, r0, lsl #3
     a00:	685b      	ldr	r3, [r3, #4]
	if ((*config & 0x00000700) == 0) {
     a02:	681a      	ldr	r2, [r3, #0]
     a04:	f412 62e0 	ands.w	r2, r2, #1792	; 0x700
     a08:	d035      	beq.n	a76 <attachInterrupt+0xb6>
	_VectorsRam[irq + 16] = function;
     a0a:	4a23      	ldr	r2, [pc, #140]	; (a98 <attachInterrupt+0xd8>)
     a0c:	4c23      	ldr	r4, [pc, #140]	; (a9c <attachInterrupt+0xdc>)
     a0e:	4824      	ldr	r0, [pc, #144]	; (aa0 <attachInterrupt+0xe0>)
     a10:	f8c2 419c 	str.w	r4, [r2, #412]	; 0x19c
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a14:	f103 4440 	add.w	r4, r3, #3221225472	; 0xc0000000
	_VectorsRam[irq + 16] = function;
     a18:	4e22      	ldr	r6, [pc, #136]	; (aa4 <attachInterrupt+0xe4>)
     a1a:	f8c2 01a4 	str.w	r0, [r2, #420]	; 0x1a4
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a1e:	f5a4 2092 	sub.w	r0, r4, #299008	; 0x49000
	_VectorsRam[irq + 16] = function;
     a22:	4f21      	ldr	r7, [pc, #132]	; (aa8 <attachInterrupt+0xe8>)
     a24:	f8c2 61a0 	str.w	r6, [r2, #416]	; 0x1a0
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a28:	287c      	cmp	r0, #124	; 0x7c
	_VectorsRam[irq + 16] = function;
     a2a:	4e20      	ldr	r6, [pc, #128]	; (aac <attachInterrupt+0xec>)
     a2c:	f8c2 71a8 	str.w	r7, [r2, #424]	; 0x1a8
     a30:	f8c2 61ac 	str.w	r6, [r2, #428]	; 0x1ac
	if(&PORTA_PCR0 <= config && config <= &PORTA_PCR31) isr_table = isr_table_portA;
     a34:	d9ce      	bls.n	9d4 <attachInterrupt+0x14>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     a36:	f5a4 2294 	sub.w	r2, r4, #303104	; 0x4a000
     a3a:	2a7c      	cmp	r2, #124	; 0x7c
     a3c:	d919      	bls.n	a72 <attachInterrupt+0xb2>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     a3e:	f5a4 2296 	sub.w	r2, r4, #307200	; 0x4b000
     a42:	2a7c      	cmp	r2, #124	; 0x7c
     a44:	d91f      	bls.n	a86 <attachInterrupt+0xc6>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     a46:	f5a4 2298 	sub.w	r2, r4, #311296	; 0x4c000
     a4a:	2a7c      	cmp	r2, #124	; 0x7c
     a4c:	d91d      	bls.n	a8a <attachInterrupt+0xca>
	else if(&PORTE_PCR0 <= config && config <= &PORTE_PCR31) isr_table = isr_table_portE;
     a4e:	f5a4 249a 	sub.w	r4, r4, #315392	; 0x4d000
     a52:	2c7c      	cmp	r4, #124	; 0x7c
     a54:	d8cd      	bhi.n	9f2 <attachInterrupt+0x32>
     a56:	4e16      	ldr	r6, [pc, #88]	; (ab0 <attachInterrupt+0xf0>)
     a58:	e7bd      	b.n	9d6 <attachInterrupt+0x16>
	switch (mode) {
     a5a:	f44f 2530 	mov.w	r5, #720896	; 0xb0000
     a5e:	e7cc      	b.n	9fa <attachInterrupt+0x3a>
	  case LOW:	mask = 0x08; break;
     a60:	f44f 2500 	mov.w	r5, #524288	; 0x80000
     a64:	e7c9      	b.n	9fa <attachInterrupt+0x3a>
	  case HIGH:	mask = 0x0C; break;
     a66:	f44f 2540 	mov.w	r5, #786432	; 0xc0000
     a6a:	e7c6      	b.n	9fa <attachInterrupt+0x3a>
	switch (mode) {
     a6c:	f44f 2520 	mov.w	r5, #655360	; 0xa0000
     a70:	e7c3      	b.n	9fa <attachInterrupt+0x3a>
	else if(&PORTB_PCR0 <= config && config <= &PORTB_PCR31) isr_table = isr_table_portB;
     a72:	4e10      	ldr	r6, [pc, #64]	; (ab4 <attachInterrupt+0xf4>)
     a74:	e7af      	b.n	9d6 <attachInterrupt+0x16>
		} else {
		    *config &= ~PORT_PCR_ODE;
                }
	} else {
#ifdef KINETISK
		*portModeRegister(pin) = 0;
     a76:	f854 4030 	ldr.w	r4, [r4, r0, lsl #3]
#else
		*portModeRegister(pin) &= ~digitalPinToBitMask(pin);
#endif
		if (mode == INPUT) {
			*config = PORT_PCR_MUX(1);
     a7a:	f44f 7080 	mov.w	r0, #256	; 0x100
		*portModeRegister(pin) = 0;
     a7e:	f884 2280 	strb.w	r2, [r4, #640]	; 0x280
			*config = PORT_PCR_MUX(1);
     a82:	6018      	str	r0, [r3, #0]
     a84:	e7c1      	b.n	a0a <attachInterrupt+0x4a>
	else if(&PORTC_PCR0 <= config && config <= &PORTC_PCR31) isr_table = isr_table_portC;
     a86:	4e0c      	ldr	r6, [pc, #48]	; (ab8 <attachInterrupt+0xf8>)
     a88:	e7a5      	b.n	9d6 <attachInterrupt+0x16>
	else if(&PORTD_PCR0 <= config && config <= &PORTD_PCR31) isr_table = isr_table_portD;
     a8a:	4e0c      	ldr	r6, [pc, #48]	; (abc <attachInterrupt+0xfc>)
     a8c:	e7a3      	b.n	9d6 <attachInterrupt+0x16>
     a8e:	bf00      	nop
     a90:	1fff8810 	.word	0x1fff8810
     a94:	000031ec 	.word	0x000031ec
     a98:	1fff8200 	.word	0x1fff8200
     a9c:	1fff87d1 	.word	0x1fff87d1
     aa0:	1fff8779 	.word	0x1fff8779
     aa4:	1fff87a5 	.word	0x1fff87a5
     aa8:	1fff874d 	.word	0x1fff874d
     aac:	1fff8721 	.word	0x1fff8721
     ab0:	1fff88e8 	.word	0x1fff88e8
     ab4:	1fff8848 	.word	0x1fff8848
     ab8:	1fff8898 	.word	0x1fff8898
     abc:	1fff88c8 	.word	0x1fff88c8

00000ac0 <rtc_set>:
{
     ac0:	b430      	push	{r4, r5}
	RTC_SR = 0;
     ac2:	4b05      	ldr	r3, [pc, #20]	; (ad8 <rtc_set+0x18>)
	RTC_TPR = 0;
     ac4:	4d05      	ldr	r5, [pc, #20]	; (adc <rtc_set+0x1c>)
	RTC_TSR = t;
     ac6:	4c06      	ldr	r4, [pc, #24]	; (ae0 <rtc_set+0x20>)
	RTC_SR = 0;
     ac8:	2200      	movs	r2, #0
	RTC_SR = RTC_SR_TCE;
     aca:	2110      	movs	r1, #16
	RTC_SR = 0;
     acc:	601a      	str	r2, [r3, #0]
	RTC_TPR = 0;
     ace:	602a      	str	r2, [r5, #0]
	RTC_TSR = t;
     ad0:	6020      	str	r0, [r4, #0]
	RTC_SR = RTC_SR_TCE;
     ad2:	6019      	str	r1, [r3, #0]
}
     ad4:	bc30      	pop	{r4, r5}
     ad6:	4770      	bx	lr
     ad8:	4003d014 	.word	0x4003d014
     adc:	4003d004 	.word	0x4003d004
     ae0:	4003d000 	.word	0x4003d000

00000ae4 <_init_Teensyduino_internal_>:
{
     ae4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     ae8:	4b6a      	ldr	r3, [pc, #424]	; (c94 <_init_Teensyduino_internal_+0x1b0>)
	FTM0_CNT = 0;
     aea:	496b      	ldr	r1, [pc, #428]	; (c98 <_init_Teensyduino_internal_+0x1b4>)
	FTM0_C1SC = 0x28;
     aec:	4e6b      	ldr	r6, [pc, #428]	; (c9c <_init_Teensyduino_internal_+0x1b8>)
	FTM0_C3SC = 0x28;
     aee:	4d6c      	ldr	r5, [pc, #432]	; (ca0 <_init_Teensyduino_internal_+0x1bc>)
	FTM0_C4SC = 0x28;
     af0:	4c6c      	ldr	r4, [pc, #432]	; (ca4 <_init_Teensyduino_internal_+0x1c0>)
	FTM0_MOD = DEFAULT_FTM_MOD;
     af2:	f8df c1d0 	ldr.w	ip, [pc, #464]	; cc4 <_init_Teensyduino_internal_+0x1e0>
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     af6:	f8df e1d0 	ldr.w	lr, [pc, #464]	; cc8 <_init_Teensyduino_internal_+0x1e4>
	FTM0_C2SC = 0x28;
     afa:	4a6b      	ldr	r2, [pc, #428]	; (ca8 <_init_Teensyduino_internal_+0x1c4>)
	FTM0_C5SC = 0x28;
     afc:	4f6b      	ldr	r7, [pc, #428]	; (cac <_init_Teensyduino_internal_+0x1c8>)
	NVIC_ENABLE_IRQ(IRQ_PORTA);
     afe:	f44f 0000 	mov.w	r0, #8388608	; 0x800000
     b02:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTB);
     b04:	f04f 7080 	mov.w	r0, #16777216	; 0x1000000
     b08:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTC);
     b0a:	f04f 7000 	mov.w	r0, #33554432	; 0x2000000
     b0e:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTD);
     b10:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
     b14:	6018      	str	r0, [r3, #0]
	NVIC_ENABLE_IRQ(IRQ_PORTE);
     b16:	f04f 6000 	mov.w	r0, #134217728	; 0x8000000
     b1a:	6018      	str	r0, [r3, #0]
	FTM0_CNT = 0;
     b1c:	2000      	movs	r0, #0
     b1e:	6008      	str	r0, [r1, #0]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     b20:	2328      	movs	r3, #40	; 0x28
	FTM0_MOD = DEFAULT_FTM_MOD;
     b22:	f64e 71ff 	movw	r1, #61439	; 0xefff
     b26:	f8cc 1000 	str.w	r1, [ip]
	FTM0_C0SC = 0x28; // MSnB:MSnA = 10, ELSnB:ELSnA = 10
     b2a:	f8ce 3000 	str.w	r3, [lr]
	FTM0_C1SC = 0x28;
     b2e:	6033      	str	r3, [r6, #0]
	FTM0_C2SC = 0x28;
     b30:	6013      	str	r3, [r2, #0]
	FTM0_C3SC = 0x28;
     b32:	602b      	str	r3, [r5, #0]
	FTM0_C4SC = 0x28;
     b34:	6023      	str	r3, [r4, #0]
	FTM0_C5SC = 0x28;
     b36:	603b      	str	r3, [r7, #0]
	FTM0_C6SC = 0x28;
     b38:	62b3      	str	r3, [r6, #40]	; 0x28
	FTM0_C7SC = 0x28;
     b3a:	6293      	str	r3, [r2, #40]	; 0x28
	FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b3c:	2209      	movs	r2, #9
     b3e:	f845 2c24 	str.w	r2, [r5, #-36]
	FTM1_CNT = 0;
     b42:	f8c4 0fd8 	str.w	r0, [r4, #4056]	; 0xfd8
	FTM1_C1SC = 0x28;
     b46:	f505 657f 	add.w	r5, r5, #4080	; 0xff0
	FTM1_MOD = DEFAULT_FTM_MOD;
     b4a:	f8c7 1fd4 	str.w	r1, [r7, #4052]	; 0xfd4
	FTM2_CNT = 0;
     b4e:	f507 27ff 	add.w	r7, r7, #522240	; 0x7f800
     b52:	f507 67fa 	add.w	r7, r7, #2000	; 0x7d0
	FTM1_C0SC = 0x28;
     b56:	f8c6 3ff8 	str.w	r3, [r6, #4088]	; 0xff8
	FTM1_C1SC = 0x28;
     b5a:	602b      	str	r3, [r5, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     b5c:	f506 26ff 	add.w	r6, r6, #522240	; 0x7f800
	FTM1_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b60:	f8c4 2fd4 	str.w	r2, [r4, #4052]	; 0xfd4
	FTM2_C0SC = 0x28;
     b64:	f505 25fd 	add.w	r5, r5, #518144	; 0x7e800
	FTM2_C1SC = 0x28;
     b68:	f504 24ff 	add.w	r4, r4, #522240	; 0x7f800
	FTM2_CNT = 0;
     b6c:	6038      	str	r0, [r7, #0]
	FTM2_MOD = DEFAULT_FTM_MOD;
     b6e:	f206 76f4 	addw	r6, r6, #2036	; 0x7f4
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b72:	484f      	ldr	r0, [pc, #316]	; (cb0 <_init_Teensyduino_internal_+0x1cc>)
	FTM2_MOD = DEFAULT_FTM_MOD;
     b74:	6031      	str	r1, [r6, #0]
	FTM2_C0SC = 0x28;
     b76:	f505 65ff 	add.w	r5, r5, #2040	; 0x7f8
	FTM2_C1SC = 0x28;
     b7a:	f504 64fd 	add.w	r4, r4, #2024	; 0x7e8
	FTM2_C0SC = 0x28;
     b7e:	602b      	str	r3, [r5, #0]
	FTM2_C1SC = 0x28;
     b80:	6023      	str	r3, [r4, #0]
	FTM2_SC = FTM_SC_CLKS(1) | FTM_SC_PS(DEFAULT_FTM_PRESCALE);
     b82:	6002      	str	r2, [r0, #0]
	analog_init();
     b84:	f001 fbc8 	bl	2318 <analog_init>

uint32_t micros(void)
{
	uint32_t count, current, istatus;

	__disable_irq();
     b88:	b672      	cpsid	i
	current = SYST_CVR;
	count = systick_millis_count;
     b8a:	4d4a      	ldr	r5, [pc, #296]	; (cb4 <_init_Teensyduino_internal_+0x1d0>)
	current = SYST_CVR;
     b8c:	4b4a      	ldr	r3, [pc, #296]	; (cb8 <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     b8e:	4a4b      	ldr	r2, [pc, #300]	; (cbc <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     b90:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     b92:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     b94:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     b96:	b662      	cpsie	i
	 //systick_current = current;
	 //systick_count = count;
	 //systick_istatus = istatus & SCB_ICSR_PENDSTSET ? 1 : 0;
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     b98:	0151      	lsls	r1, r2, #5
     b9a:	d502      	bpl.n	ba2 <_init_Teensyduino_internal_+0xbe>
     b9c:	2b32      	cmp	r3, #50	; 0x32
     b9e:	bf88      	it	hi
     ba0:	3401      	addhi	r4, #1
#if defined(KINETISL) && F_CPU == 48000000
	return count * 1000 + ((current * (uint32_t)87381) >> 22);
#elif defined(KINETISL) && F_CPU == 24000000
	return count * 1000 + ((current * (uint32_t)174763) >> 22);
#endif
	return count * 1000 + current / (F_CPU / 1000000);
     ba2:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     ba6:	4f46      	ldr	r7, [pc, #280]	; (cc0 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     ba8:	f8df 910c 	ldr.w	r9, [pc, #268]	; cb8 <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     bac:	f8df 810c 	ldr.w	r8, [pc, #268]	; cbc <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     bb0:	33bf      	adds	r3, #191	; 0xbf
     bb2:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     bb6:	fba7 1303 	umull	r1, r3, r7, r3
     bba:	fb02 f404 	mul.w	r4, r2, r4
     bbe:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     bc2:	2632      	movs	r6, #50	; 0x32
	__disable_irq();
     bc4:	b672      	cpsid	i
	current = SYST_CVR;
     bc6:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     bca:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     bcc:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     bd0:	b662      	cpsie	i
{
	uint32_t start = micros();

	if (ms > 0) {
		while (1) {
			while ((micros() - start) >= 1000) {
     bd2:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     bd6:	33bf      	adds	r3, #191	; 0xbf
     bd8:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     bdc:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     be0:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     be4:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     be8:	d002      	beq.n	bf0 <_init_Teensyduino_internal_+0x10c>
     bea:	2932      	cmp	r1, #50	; 0x32
     bec:	bf88      	it	hi
     bee:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     bf0:	fb00 3302 	mla	r3, r0, r2, r3
     bf4:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     bf8:	d304      	bcc.n	c04 <_init_Teensyduino_internal_+0x120>
				ms--;
				if (ms == 0) return;
     bfa:	3e01      	subs	r6, #1
     bfc:	d005      	beq.n	c0a <_init_Teensyduino_internal_+0x126>
				start += 1000;
     bfe:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     c02:	e7df      	b.n	bc4 <_init_Teensyduino_internal_+0xe0>
			}
			yield();
     c04:	f001 f9c6 	bl	1f94 <yield>
     c08:	e7dc      	b.n	bc4 <_init_Teensyduino_internal_+0xe0>
	usb_init();
     c0a:	f000 ff41 	bl	1a90 <usb_init>
	__disable_irq();
     c0e:	b672      	cpsid	i
	current = SYST_CVR;
     c10:	4b29      	ldr	r3, [pc, #164]	; (cb8 <_init_Teensyduino_internal_+0x1d4>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c12:	4a2a      	ldr	r2, [pc, #168]	; (cbc <_init_Teensyduino_internal_+0x1d8>)
	current = SYST_CVR;
     c14:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     c16:	682c      	ldr	r4, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c18:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     c1a:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c1c:	0152      	lsls	r2, r2, #5
     c1e:	d502      	bpl.n	c26 <_init_Teensyduino_internal_+0x142>
     c20:	2b32      	cmp	r3, #50	; 0x32
     c22:	bf88      	it	hi
     c24:	3401      	addhi	r4, #1
	return count * 1000 + current / (F_CPU / 1000000);
     c26:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     c2a:	4f25      	ldr	r7, [pc, #148]	; (cc0 <_init_Teensyduino_internal_+0x1dc>)
	current = SYST_CVR;
     c2c:	f8df 9088 	ldr.w	r9, [pc, #136]	; cb8 <_init_Teensyduino_internal_+0x1d4>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c30:	f8df 8088 	ldr.w	r8, [pc, #136]	; cbc <_init_Teensyduino_internal_+0x1d8>
	return count * 1000 + current / (F_CPU / 1000000);
     c34:	33bf      	adds	r3, #191	; 0xbf
     c36:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     c3a:	fba7 1303 	umull	r1, r3, r7, r3
     c3e:	fb02 f404 	mul.w	r4, r2, r4
     c42:	eb04 1493 	add.w	r4, r4, r3, lsr #6
     c46:	f44f 76af 	mov.w	r6, #350	; 0x15e
	__disable_irq();
     c4a:	b672      	cpsid	i
	current = SYST_CVR;
     c4c:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     c50:	682a      	ldr	r2, [r5, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     c52:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     c56:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     c58:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     c5c:	33bf      	adds	r3, #191	; 0xbf
     c5e:	fba7 0303 	umull	r0, r3, r7, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c62:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     c66:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     c6a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     c6e:	d002      	beq.n	c76 <_init_Teensyduino_internal_+0x192>
     c70:	2932      	cmp	r1, #50	; 0x32
     c72:	bf88      	it	hi
     c74:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     c76:	fb00 3302 	mla	r3, r0, r2, r3
     c7a:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     c7e:	d304      	bcc.n	c8a <_init_Teensyduino_internal_+0x1a6>
				if (ms == 0) return;
     c80:	3e01      	subs	r6, #1
     c82:	d005      	beq.n	c90 <_init_Teensyduino_internal_+0x1ac>
				start += 1000;
     c84:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     c88:	e7df      	b.n	c4a <_init_Teensyduino_internal_+0x166>
			yield();
     c8a:	f001 f983 	bl	1f94 <yield>
     c8e:	e7dc      	b.n	c4a <_init_Teensyduino_internal_+0x166>
     c90:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     c94:	e000e108 	.word	0xe000e108
     c98:	40038004 	.word	0x40038004
     c9c:	40038014 	.word	0x40038014
     ca0:	40038024 	.word	0x40038024
     ca4:	4003802c 	.word	0x4003802c
     ca8:	4003801c 	.word	0x4003801c
     cac:	40038034 	.word	0x40038034
     cb0:	400b8000 	.word	0x400b8000
     cb4:	1fff92d8 	.word	0x1fff92d8
     cb8:	e000e018 	.word	0xe000e018
     cbc:	e000ed04 	.word	0xe000ed04
     cc0:	88888889 	.word	0x88888889
     cc4:	40038008 	.word	0x40038008
     cc8:	4003800c 	.word	0x4003800c

00000ccc <digitalWrite>:
	if (pin >= CORE_NUM_DIGITAL) return;
     ccc:	2821      	cmp	r0, #33	; 0x21
     cce:	d80b      	bhi.n	ce8 <digitalWrite+0x1c>
{
     cd0:	b410      	push	{r4}
	if (*portModeRegister(pin)) {
     cd2:	4b0f      	ldr	r3, [pc, #60]	; (d10 <digitalWrite+0x44>)
     cd4:	f853 2030 	ldr.w	r2, [r3, r0, lsl #3]
     cd8:	f892 4280 	ldrb.w	r4, [r2, #640]	; 0x280
     cdc:	b12c      	cbz	r4, cea <digitalWrite+0x1e>
			*portSetRegister(pin) = 1;
     cde:	2301      	movs	r3, #1
		if (val) {
     ce0:	b169      	cbz	r1, cfe <digitalWrite+0x32>
			*portSetRegister(pin) = 1;
     ce2:	f882 3080 	strb.w	r3, [r2, #128]	; 0x80
}
     ce6:	bc10      	pop	{r4}
     ce8:	4770      	bx	lr
		volatile uint32_t *config = portConfigRegister(pin);
     cea:	eb03 00c0 	add.w	r0, r3, r0, lsl #3
     cee:	6843      	ldr	r3, [r0, #4]
			*config |= (PORT_PCR_PE | PORT_PCR_PS);
     cf0:	681a      	ldr	r2, [r3, #0]
		if (val) {
     cf2:	b941      	cbnz	r1, d06 <digitalWrite+0x3a>
			*config &= ~(PORT_PCR_PE);
     cf4:	f022 0202 	bic.w	r2, r2, #2
     cf8:	601a      	str	r2, [r3, #0]
}
     cfa:	bc10      	pop	{r4}
     cfc:	e7f4      	b.n	ce8 <digitalWrite+0x1c>
			*portClearRegister(pin) = 1;
     cfe:	f882 3100 	strb.w	r3, [r2, #256]	; 0x100
}
     d02:	bc10      	pop	{r4}
     d04:	e7f0      	b.n	ce8 <digitalWrite+0x1c>
			*config |= (PORT_PCR_PE | PORT_PCR_PS);
     d06:	f042 0203 	orr.w	r2, r2, #3
     d0a:	601a      	str	r2, [r3, #0]
}
     d0c:	bc10      	pop	{r4}
     d0e:	e7eb      	b.n	ce8 <digitalWrite+0x1c>
     d10:	000031ec 	.word	0x000031ec

00000d14 <pinMode>:
	if (pin >= CORE_NUM_DIGITAL) return;
     d14:	2821      	cmp	r0, #33	; 0x21
     d16:	d820      	bhi.n	d5a <pinMode+0x46>
	config = portConfigRegister(pin);
     d18:	4a1b      	ldr	r2, [pc, #108]	; (d88 <pinMode+0x74>)
     d1a:	eb02 03c0 	add.w	r3, r2, r0, lsl #3
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     d1e:	2901      	cmp	r1, #1
	config = portConfigRegister(pin);
     d20:	685b      	ldr	r3, [r3, #4]
	if (mode == OUTPUT || mode == OUTPUT_OPENDRAIN) {
     d22:	d00f      	beq.n	d44 <pinMode+0x30>
     d24:	2904      	cmp	r1, #4
     d26:	d01d      	beq.n	d64 <pinMode+0x50>
		*portModeRegister(pin) = 0;
     d28:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
     d2c:	2200      	movs	r2, #0
     d2e:	f880 2280 	strb.w	r2, [r0, #640]	; 0x280
		if (mode == INPUT) {
     d32:	b199      	cbz	r1, d5c <pinMode+0x48>
		} else if (mode == INPUT_PULLUP) {
     d34:	2902      	cmp	r1, #2
     d36:	d022      	beq.n	d7e <pinMode+0x6a>
		} else if (mode == INPUT_PULLDOWN) {
     d38:	2903      	cmp	r1, #3
     d3a:	d10d      	bne.n	d58 <pinMode+0x44>
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE;
     d3c:	f44f 7281 	mov.w	r2, #258	; 0x102
     d40:	601a      	str	r2, [r3, #0]
     d42:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     d44:	f852 0030 	ldr.w	r0, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d48:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     d4c:	f880 1280 	strb.w	r1, [r0, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d50:	601a      	str	r2, [r3, #0]
		    *config &= ~PORT_PCR_ODE;
     d52:	681a      	ldr	r2, [r3, #0]
     d54:	f022 0220 	bic.w	r2, r2, #32
     d58:	601a      	str	r2, [r3, #0]
     d5a:	4770      	bx	lr
			*config = PORT_PCR_MUX(1);
     d5c:	f44f 7280 	mov.w	r2, #256	; 0x100
     d60:	601a      	str	r2, [r3, #0]
     d62:	4770      	bx	lr
		*portModeRegister(pin) = 1;
     d64:	f852 1030 	ldr.w	r1, [r2, r0, lsl #3]
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d68:	f44f 72a2 	mov.w	r2, #324	; 0x144
		*portModeRegister(pin) = 1;
     d6c:	2001      	movs	r0, #1
     d6e:	f881 0280 	strb.w	r0, [r1, #640]	; 0x280
		*config = PORT_PCR_SRE | PORT_PCR_DSE | PORT_PCR_MUX(1);
     d72:	601a      	str	r2, [r3, #0]
		    *config |= PORT_PCR_ODE;
     d74:	681a      	ldr	r2, [r3, #0]
     d76:	f042 0220 	orr.w	r2, r2, #32
     d7a:	601a      	str	r2, [r3, #0]
     d7c:	4770      	bx	lr
			*config = PORT_PCR_MUX(1) | PORT_PCR_PE | PORT_PCR_PS;
     d7e:	f240 1203 	movw	r2, #259	; 0x103
     d82:	601a      	str	r2, [r3, #0]
     d84:	4770      	bx	lr
     d86:	bf00      	nop
     d88:	000031ec 	.word	0x000031ec

00000d8c <delay>:
{
     d8c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
     d90:	4605      	mov	r5, r0
	__disable_irq();
     d92:	b672      	cpsid	i
	count = systick_millis_count;
     d94:	4f20      	ldr	r7, [pc, #128]	; (e18 <delay+0x8c>)
	current = SYST_CVR;
     d96:	4b21      	ldr	r3, [pc, #132]	; (e1c <delay+0x90>)
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d98:	4a21      	ldr	r2, [pc, #132]	; (e20 <delay+0x94>)
	current = SYST_CVR;
     d9a:	681b      	ldr	r3, [r3, #0]
	count = systick_millis_count;
     d9c:	683c      	ldr	r4, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     d9e:	6812      	ldr	r2, [r2, #0]
	__enable_irq();
     da0:	b662      	cpsie	i
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     da2:	0152      	lsls	r2, r2, #5
     da4:	d502      	bpl.n	dac <delay+0x20>
     da6:	2b32      	cmp	r3, #50	; 0x32
     da8:	bf88      	it	hi
     daa:	3401      	addhi	r4, #1
	if (ms > 0) {
     dac:	b395      	cbz	r5, e14 <delay+0x88>
	return count * 1000 + current / (F_CPU / 1000000);
     dae:	f5c3 33ea 	rsb	r3, r3, #119808	; 0x1d400
     db2:	4e1c      	ldr	r6, [pc, #112]	; (e24 <delay+0x98>)
	current = SYST_CVR;
     db4:	f8df 9064 	ldr.w	r9, [pc, #100]	; e1c <delay+0x90>
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     db8:	f8df 8064 	ldr.w	r8, [pc, #100]	; e20 <delay+0x94>
	return count * 1000 + current / (F_CPU / 1000000);
     dbc:	33bf      	adds	r3, #191	; 0xbf
     dbe:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
     dc2:	fba6 1303 	umull	r1, r3, r6, r3
     dc6:	fb02 f404 	mul.w	r4, r2, r4
     dca:	eb04 1493 	add.w	r4, r4, r3, lsr #6
	__disable_irq();
     dce:	b672      	cpsid	i
	current = SYST_CVR;
     dd0:	f8d9 1000 	ldr.w	r1, [r9]
	count = systick_millis_count;
     dd4:	683a      	ldr	r2, [r7, #0]
	istatus = SCB_ICSR;	// bit 26 indicates if systick exception pending
     dd6:	f8d8 e000 	ldr.w	lr, [r8]
	__enable_irq();
     dda:	b662      	cpsie	i
			while ((micros() - start) >= 1000) {
     ddc:	f5c1 33ea 	rsb	r3, r1, #119808	; 0x1d400
     de0:	33bf      	adds	r3, #191	; 0xbf
     de2:	fba6 0303 	umull	r0, r3, r6, r3
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     de6:	f01e 6f80 	tst.w	lr, #67108864	; 0x4000000
			while ((micros() - start) >= 1000) {
     dea:	ebc4 1393 	rsb	r3, r4, r3, lsr #6
     dee:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
	if ((istatus & SCB_ICSR_PENDSTSET) && current > 50) count++;
     df2:	d002      	beq.n	dfa <delay+0x6e>
     df4:	2932      	cmp	r1, #50	; 0x32
     df6:	bf88      	it	hi
     df8:	3201      	addhi	r2, #1
			while ((micros() - start) >= 1000) {
     dfa:	fb00 3302 	mla	r3, r0, r2, r3
     dfe:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
     e02:	d304      	bcc.n	e0e <delay+0x82>
				if (ms == 0) return;
     e04:	3d01      	subs	r5, #1
     e06:	d005      	beq.n	e14 <delay+0x88>
				start += 1000;
     e08:	f504 747a 	add.w	r4, r4, #1000	; 0x3e8
     e0c:	e7df      	b.n	dce <delay+0x42>
			yield();
     e0e:	f001 f8c1 	bl	1f94 <yield>
		}
     e12:	e7dc      	b.n	dce <delay+0x42>
     e14:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
     e18:	1fff92d8 	.word	0x1fff92d8
     e1c:	e000e018 	.word	0xe000e018
     e20:	e000ed04 	.word	0xe000ed04
     e24:	88888889 	.word	0x88888889

00000e28 <usb_rx>:


usb_packet_t *usb_rx(uint32_t endpoint)
{
	usb_packet_t *ret;
	endpoint--;
     e28:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     e2a:	2b03      	cmp	r3, #3
     e2c:	d814      	bhi.n	e58 <usb_rx+0x30>
	__disable_irq();
     e2e:	b672      	cpsid	i
	ret = rx_first[endpoint];
     e30:	490a      	ldr	r1, [pc, #40]	; (e5c <usb_rx+0x34>)
     e32:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
	if (ret) {
     e36:	b168      	cbz	r0, e54 <usb_rx+0x2c>
{
     e38:	b470      	push	{r4, r5, r6}
		rx_first[endpoint] = ret->next;
		usb_rx_byte_count_data[endpoint] -= ret->len;
     e3a:	4c09      	ldr	r4, [pc, #36]	; (e60 <usb_rx+0x38>)
     e3c:	8805      	ldrh	r5, [r0, #0]
     e3e:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
		rx_first[endpoint] = ret->next;
     e42:	6846      	ldr	r6, [r0, #4]
     e44:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
		usb_rx_byte_count_data[endpoint] -= ret->len;
     e48:	1b52      	subs	r2, r2, r5
     e4a:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
	}
	__enable_irq();
     e4e:	b662      	cpsie	i
	//serial_phex(endpoint);
	//serial_print(", packet=");
	//serial_phex32(ret);
	//serial_print("\n");
	return ret;
}
     e50:	bc70      	pop	{r4, r5, r6}
     e52:	4770      	bx	lr
	__enable_irq();
     e54:	b662      	cpsie	i
}
     e56:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return NULL;
     e58:	2000      	movs	r0, #0
     e5a:	4770      	bx	lr
     e5c:	1fff9334 	.word	0x1fff9334
     e60:	1fff95b8 	.word	0x1fff95b8

00000e64 <usb_tx_packet_count>:
uint32_t usb_tx_packet_count(uint32_t endpoint)
{
	const usb_packet_t *p;
	uint32_t count=0;

	endpoint--;
     e64:	3801      	subs	r0, #1
	if (endpoint >= NUM_ENDPOINTS) return 0;
     e66:	2803      	cmp	r0, #3
     e68:	d80b      	bhi.n	e82 <usb_tx_packet_count+0x1e>
	__disable_irq();
     e6a:	b672      	cpsid	i
	for (p = tx_first[endpoint]; p; p = p->next) count++;
     e6c:	4b07      	ldr	r3, [pc, #28]	; (e8c <usb_tx_packet_count+0x28>)
     e6e:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
     e72:	b143      	cbz	r3, e86 <usb_tx_packet_count+0x22>
     e74:	2000      	movs	r0, #0
     e76:	685b      	ldr	r3, [r3, #4]
     e78:	3001      	adds	r0, #1
     e7a:	2b00      	cmp	r3, #0
     e7c:	d1fb      	bne.n	e76 <usb_tx_packet_count+0x12>
	__enable_irq();
     e7e:	b662      	cpsie	i
	return count;
     e80:	4770      	bx	lr
	if (endpoint >= NUM_ENDPOINTS) return 0;
     e82:	2000      	movs	r0, #0
}
     e84:	4770      	bx	lr
	uint32_t count=0;
     e86:	4618      	mov	r0, r3
     e88:	e7f9      	b.n	e7e <usb_tx_packet_count+0x1a>
     e8a:	bf00      	nop
     e8c:	1fff9388 	.word	0x1fff9388

00000e90 <usb_rx_memory>:
// user is creating data very quickly, their consumption could starve reception
// without this prioritization.  The packet buffer (input) is assigned to the
// first endpoint needing memory.
//
void usb_rx_memory(usb_packet_t *packet)
{
     e90:	b430      	push	{r4, r5}
	unsigned int i;
	const uint8_t *cfg;

	cfg = usb_endpoint_config_table;
	//serial_print("rx_mem:");
	__disable_irq();
     e92:	b672      	cpsid	i
	for (i=1; i <= NUM_ENDPOINTS; i++) {
#ifdef AUDIO_INTERFACE
		if (i == AUDIO_RX_ENDPOINT) continue;
#endif
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     e94:	4a2b      	ldr	r2, [pc, #172]	; (f44 <usb_rx_memory+0xb4>)
     e96:	7813      	ldrb	r3, [r2, #0]
     e98:	071d      	lsls	r5, r3, #28
     e9a:	d506      	bpl.n	eaa <usb_rx_memory+0x1a>
			if (table[index(i, RX, EVEN)].desc == 0) {
     e9c:	4b2a      	ldr	r3, [pc, #168]	; (f48 <usb_rx_memory+0xb8>)
     e9e:	6a19      	ldr	r1, [r3, #32]
     ea0:	2900      	cmp	r1, #0
     ea2:	d036      	beq.n	f12 <usb_rx_memory+0x82>
				__enable_irq();
				//serial_phex(i);
				//serial_print(",even\n");
				return;
			}
			if (table[index(i, RX, ODD)].desc == 0) {
     ea4:	6a99      	ldr	r1, [r3, #40]	; 0x28
     ea6:	2900      	cmp	r1, #0
     ea8:	d041      	beq.n	f2e <usb_rx_memory+0x9e>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     eaa:	7853      	ldrb	r3, [r2, #1]
     eac:	071c      	lsls	r4, r3, #28
     eae:	d506      	bpl.n	ebe <usb_rx_memory+0x2e>
			if (table[index(i, RX, EVEN)].desc == 0) {
     eb0:	4b25      	ldr	r3, [pc, #148]	; (f48 <usb_rx_memory+0xb8>)
     eb2:	6c19      	ldr	r1, [r3, #64]	; 0x40
     eb4:	2900      	cmp	r1, #0
     eb6:	d03e      	beq.n	f36 <usb_rx_memory+0xa6>
			if (table[index(i, RX, ODD)].desc == 0) {
     eb8:	6c99      	ldr	r1, [r3, #72]	; 0x48
     eba:	2900      	cmp	r1, #0
     ebc:	d039      	beq.n	f32 <usb_rx_memory+0xa2>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     ebe:	7893      	ldrb	r3, [r2, #2]
     ec0:	0719      	lsls	r1, r3, #28
     ec2:	d505      	bpl.n	ed0 <usb_rx_memory+0x40>
			if (table[index(i, RX, EVEN)].desc == 0) {
     ec4:	4b20      	ldr	r3, [pc, #128]	; (f48 <usb_rx_memory+0xb8>)
     ec6:	6e19      	ldr	r1, [r3, #96]	; 0x60
     ec8:	2900      	cmp	r1, #0
     eca:	d036      	beq.n	f3a <usb_rx_memory+0xaa>
			if (table[index(i, RX, ODD)].desc == 0) {
     ecc:	6e99      	ldr	r1, [r3, #104]	; 0x68
     ece:	b189      	cbz	r1, ef4 <usb_rx_memory+0x64>
		if (*cfg++ & USB_ENDPT_EPRXEN) {
     ed0:	78d3      	ldrb	r3, [r2, #3]
     ed2:	071b      	lsls	r3, r3, #28
     ed4:	d507      	bpl.n	ee6 <usb_rx_memory+0x56>
			if (table[index(i, RX, EVEN)].desc == 0) {
     ed6:	4b1c      	ldr	r3, [pc, #112]	; (f48 <usb_rx_memory+0xb8>)
     ed8:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
     edc:	b37a      	cbz	r2, f3e <usb_rx_memory+0xae>
			if (table[index(i, RX, ODD)].desc == 0) {
     ede:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
     ee2:	2111      	movs	r1, #17
     ee4:	b13a      	cbz	r2, ef6 <usb_rx_memory+0x66>
				//serial_print(",odd\n");
				return;
			}
		}
	}
	__enable_irq();
     ee6:	b662      	cpsie	i
	// we should never reach this point.  If we get here, it means
	// usb_rx_memory_needed was set greater than zero, but no memory
	// was actually needed.
	usb_rx_memory_needed = 0;
     ee8:	4b18      	ldr	r3, [pc, #96]	; (f4c <usb_rx_memory+0xbc>)
     eea:	2200      	movs	r2, #0
     eec:	701a      	strb	r2, [r3, #0]
	usb_free(packet);
	return;
}
     eee:	bc30      	pop	{r4, r5}
	usb_free(packet);
     ef0:	f000 be70 	b.w	1bd4 <usb_free>
			if (table[index(i, RX, ODD)].desc == 0) {
     ef4:	210d      	movs	r1, #13
				usb_rx_memory_needed--;
     ef6:	4c15      	ldr	r4, [pc, #84]	; (f4c <usb_rx_memory+0xbc>)
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
     ef8:	4d15      	ldr	r5, [pc, #84]	; (f50 <usb_rx_memory+0xc0>)
				usb_rx_memory_needed--;
     efa:	7822      	ldrb	r2, [r4, #0]
				table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
     efc:	f843 5031 	str.w	r5, [r3, r1, lsl #3]
				table[index(i, RX, ODD)].addr = packet->buf;
     f00:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
     f04:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
     f06:	3a01      	subs	r2, #1
				table[index(i, RX, ODD)].addr = packet->buf;
     f08:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
     f0a:	7022      	strb	r2, [r4, #0]
				__enable_irq();
     f0c:	b662      	cpsie	i
}
     f0e:	bc30      	pop	{r4, r5}
     f10:	4770      	bx	lr
			if (table[index(i, RX, EVEN)].desc == 0) {
     f12:	2204      	movs	r2, #4
				usb_rx_memory_needed--;
     f14:	4c0d      	ldr	r4, [pc, #52]	; (f4c <usb_rx_memory+0xbc>)
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
     f16:	4d0f      	ldr	r5, [pc, #60]	; (f54 <usb_rx_memory+0xc4>)
				usb_rx_memory_needed--;
     f18:	7821      	ldrb	r1, [r4, #0]
				table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
     f1a:	f843 5032 	str.w	r5, [r3, r2, lsl #3]
				table[index(i, RX, EVEN)].addr = packet->buf;
     f1e:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
     f22:	3008      	adds	r0, #8
				usb_rx_memory_needed--;
     f24:	1e4a      	subs	r2, r1, #1
				table[index(i, RX, EVEN)].addr = packet->buf;
     f26:	6058      	str	r0, [r3, #4]
				usb_rx_memory_needed--;
     f28:	7022      	strb	r2, [r4, #0]
				__enable_irq();
     f2a:	b662      	cpsie	i
				return;
     f2c:	e7ef      	b.n	f0e <usb_rx_memory+0x7e>
			if (table[index(i, RX, ODD)].desc == 0) {
     f2e:	2105      	movs	r1, #5
     f30:	e7e1      	b.n	ef6 <usb_rx_memory+0x66>
     f32:	2109      	movs	r1, #9
     f34:	e7df      	b.n	ef6 <usb_rx_memory+0x66>
			if (table[index(i, RX, EVEN)].desc == 0) {
     f36:	2208      	movs	r2, #8
     f38:	e7ec      	b.n	f14 <usb_rx_memory+0x84>
     f3a:	220c      	movs	r2, #12
     f3c:	e7ea      	b.n	f14 <usb_rx_memory+0x84>
     f3e:	2210      	movs	r2, #16
     f40:	e7e8      	b.n	f14 <usb_rx_memory+0x84>
     f42:	bf00      	nop
     f44:	00003324 	.word	0x00003324
     f48:	1fff8000 	.word	0x1fff8000
     f4c:	1fff93b1 	.word	0x1fff93b1
     f50:	004000c8 	.word	0x004000c8
     f54:	00400088 	.word	0x00400088

00000f58 <usb_tx>:
void usb_tx(uint32_t endpoint, usb_packet_t *packet)
{
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
	uint8_t next;

	endpoint--;
     f58:	1e43      	subs	r3, r0, #1
	if (endpoint >= NUM_ENDPOINTS) return;
     f5a:	2b03      	cmp	r3, #3
     f5c:	d81d      	bhi.n	f9a <usb_tx+0x42>
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
     f5e:	4a1b      	ldr	r2, [pc, #108]	; (fcc <usb_tx+0x74>)
     f60:	0140      	lsls	r0, r0, #5
     f62:	f040 0010 	orr.w	r0, r0, #16
{
     f66:	b430      	push	{r4, r5}
	bdt_t *b = &table[index(endpoint, TX, EVEN)];
     f68:	4410      	add	r0, r2
	__disable_irq();
     f6a:	b672      	cpsid	i
	//serial_print("txstate=");
	//serial_phex(tx_state[endpoint]);
	//serial_print("\n");
	switch (tx_state[endpoint]) {
     f6c:	4c18      	ldr	r4, [pc, #96]	; (fd0 <usb_tx+0x78>)
     f6e:	5ce2      	ldrb	r2, [r4, r3]
     f70:	2a03      	cmp	r2, #3
     f72:	d81b      	bhi.n	fac <usb_tx+0x54>
     f74:	e8df f002 	tbb	[pc, r2]
     f78:	17151202 	.word	0x17151202
	  case TX_STATE_BOTH_FREE_EVEN_FIRST:
		next = TX_STATE_ODD_FREE;
     f7c:	2203      	movs	r2, #3
		__enable_irq();
		return;
	}
	tx_state[endpoint] = next;
	b->addr = packet->buf;
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
     f7e:	880d      	ldrh	r5, [r1, #0]
	tx_state[endpoint] = next;
     f80:	54e2      	strb	r2, [r4, r3]
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
     f82:	f010 0f08 	tst.w	r0, #8
     f86:	bf14      	ite	ne
     f88:	23c8      	movne	r3, #200	; 0xc8
     f8a:	2388      	moveq	r3, #136	; 0x88
     f8c:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
	b->addr = packet->buf;
     f90:	3108      	adds	r1, #8
	b->desc = BDT_DESC(packet->len, ((uint32_t)b & 8) ? DATA1 : DATA0);
     f92:	6003      	str	r3, [r0, #0]
	b->addr = packet->buf;
     f94:	6041      	str	r1, [r0, #4]
	__enable_irq();
     f96:	b662      	cpsie	i
}
     f98:	bc30      	pop	{r4, r5}
     f9a:	4770      	bx	lr
		b++;
     f9c:	3008      	adds	r0, #8
		next = TX_STATE_EVEN_FREE;
     f9e:	2202      	movs	r2, #2
		break;
     fa0:	e7ed      	b.n	f7e <usb_tx+0x26>
		next = TX_STATE_NONE_FREE_ODD_FIRST;
     fa2:	2205      	movs	r2, #5
     fa4:	e7eb      	b.n	f7e <usb_tx+0x26>
		b++;
     fa6:	3008      	adds	r0, #8
		next = TX_STATE_NONE_FREE_EVEN_FIRST;
     fa8:	2204      	movs	r2, #4
		break;
     faa:	e7e8      	b.n	f7e <usb_tx+0x26>
		if (tx_first[endpoint] == NULL) {
     fac:	4a09      	ldr	r2, [pc, #36]	; (fd4 <usb_tx+0x7c>)
     fae:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
     fb2:	b138      	cbz	r0, fc4 <usb_tx+0x6c>
			tx_last[endpoint]->next = packet;
     fb4:	4a08      	ldr	r2, [pc, #32]	; (fd8 <usb_tx+0x80>)
     fb6:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
     fba:	6041      	str	r1, [r0, #4]
		tx_last[endpoint] = packet;
     fbc:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
		__enable_irq();
     fc0:	b662      	cpsie	i
		return;
     fc2:	e7e9      	b.n	f98 <usb_tx+0x40>
			tx_first[endpoint] = packet;
     fc4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
     fc8:	4a03      	ldr	r2, [pc, #12]	; (fd8 <usb_tx+0x80>)
     fca:	e7f7      	b.n	fbc <usb_tx+0x64>
     fcc:	1fff8000 	.word	0x1fff8000
     fd0:	1fff93c0 	.word	0x1fff93c0
     fd4:	1fff9388 	.word	0x1fff9388
     fd8:	1fff9398 	.word	0x1fff9398

00000fdc <usb_isr>:
}



void usb_isr(void)
{
     fdc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	//serial_print("isr");
	//status = USB0_ISTAT;
	//serial_phex(status);
	//serial_print("\n");
	restart:
	status = USB0_ISTAT;
     fe0:	f8df b30c 	ldr.w	fp, [pc, #780]	; 12f0 <usb_isr+0x314>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
	}

	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
		uint8_t endpoint;
		stat = USB0_STAT;
     fe4:	f8df a30c 	ldr.w	sl, [pc, #780]	; 12f4 <usb_isr+0x318>
{
     fe8:	b087      	sub	sp, #28
     fea:	e044      	b.n	1076 <usb_isr+0x9a>
		//serial_print(stat & 0x04 ? ",odd\n" : ",even\n");
		endpoint = stat >> 4;
		if (endpoint == 0) {
			usb_control(stat);
		} else {
			bdt_t *b = stat2bufferdescriptor(stat);
     fec:	4fab      	ldr	r7, [pc, #684]	; (129c <usb_isr+0x2c0>)
     fee:	ea4f 0893 	mov.w	r8, r3, lsr #2
     ff2:	eb07 09c8 	add.w	r9, r7, r8, lsl #3
			serial_print(((uint32_t)b & 8) ? ", odd" : ", even");
			serial_print(", count:");
			serial_phex(b->desc >> 16);
			serial_print("\n");
#endif
			endpoint--;	// endpoint is index to zero-based arrays
     ff6:	3e01      	subs	r6, #1
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
     ff8:	f8d9 2004 	ldr.w	r2, [r9, #4]
				b->addr = &usb_audio_sync_feedback;
				b->desc = (3 << 16) | BDT_OWN;
				tx_state[endpoint] ^= 1;
			} else
#endif
			if (stat & 0x08) { // transmit
     ffc:	f003 0308 	and.w	r3, r3, #8
			endpoint--;	// endpoint is index to zero-based arrays
    1000:	b2f6      	uxtb	r6, r6
			usb_packet_t *packet = (usb_packet_t *)((uint8_t *)(b->addr) - 8);
    1002:	f1a2 0008 	sub.w	r0, r2, #8
			if (stat & 0x08) { // transmit
    1006:	f003 04ff 	and.w	r4, r3, #255	; 0xff
    100a:	2b00      	cmp	r3, #0
    100c:	f040 8102 	bne.w	1214 <usb_isr+0x238>
						  TX_STATE_ODD_FREE : TX_STATE_EVEN_FREE;
						break;
					}
				}
			} else { // receive
				packet->len = b->desc >> 16;
    1010:	f857 3038 	ldr.w	r3, [r7, r8, lsl #3]
    1014:	0c1b      	lsrs	r3, r3, #16
    1016:	b299      	uxth	r1, r3
    1018:	f822 1c08 	strh.w	r1, [r2, #-8]
				if (packet->len > 0) {
    101c:	2b00      	cmp	r3, #0
    101e:	f000 80f0 	beq.w	1202 <usb_isr+0x226>
					packet->index = 0;
					packet->next = NULL;
					if (rx_first[endpoint] == NULL) {
    1022:	4b9f      	ldr	r3, [pc, #636]	; (12a0 <usb_isr+0x2c4>)
					packet->index = 0;
    1024:	f822 4c06 	strh.w	r4, [r2, #-6]
					packet->next = NULL;
    1028:	f842 4c04 	str.w	r4, [r2, #-4]
					if (rx_first[endpoint] == NULL) {
    102c:	f853 2026 	ldr.w	r2, [r3, r6, lsl #2]
    1030:	2a00      	cmp	r2, #0
    1032:	f000 82c5 	beq.w	15c0 <usb_isr+0x5e4>
						//serial_print("rx Nth, epidx=");
						//serial_phex(endpoint);
						//serial_print(", packet=");
						//serial_phex32((uint32_t)packet);
						//serial_print("\n");
						rx_last[endpoint]->next = packet;
    1036:	4d9b      	ldr	r5, [pc, #620]	; (12a4 <usb_isr+0x2c8>)
    1038:	f855 3026 	ldr.w	r3, [r5, r6, lsl #2]
    103c:	6058      	str	r0, [r3, #4]
					}
					rx_last[endpoint] = packet;
					usb_rx_byte_count_data[endpoint] += packet->len;
    103e:	4c9a      	ldr	r4, [pc, #616]	; (12a8 <usb_isr+0x2cc>)
					rx_last[endpoint] = packet;
    1040:	f845 0026 	str.w	r0, [r5, r6, lsl #2]
					usb_rx_byte_count_data[endpoint] += packet->len;
    1044:	f834 3016 	ldrh.w	r3, [r4, r6, lsl #1]
    1048:	4419      	add	r1, r3
    104a:	f824 1016 	strh.w	r1, [r4, r6, lsl #1]
					// TODO: implement a per-endpoint maximum # of allocated
					// packets, so a flood of incoming data on 1 endpoint
					// doesn't starve the others if the user isn't reading
					// it regularly
					packet = usb_malloc();
    104e:	f000 fda1 	bl	1b94 <usb_malloc>
					if (packet) {
    1052:	2800      	cmp	r0, #0
    1054:	f000 82ad 	beq.w	15b2 <usb_isr+0x5d6>
						b->addr = packet->buf;
						b->desc = BDT_DESC(64,
    1058:	4a94      	ldr	r2, [pc, #592]	; (12ac <usb_isr+0x2d0>)
    105a:	4b95      	ldr	r3, [pc, #596]	; (12b0 <usb_isr+0x2d4>)
    105c:	f019 0f08 	tst.w	r9, #8
						b->addr = packet->buf;
    1060:	f100 0008 	add.w	r0, r0, #8
						b->desc = BDT_DESC(64,
    1064:	bf18      	it	ne
    1066:	4613      	movne	r3, r2
						b->addr = packet->buf;
    1068:	f8c9 0004 	str.w	r0, [r9, #4]
						b->desc = BDT_DESC(64,
    106c:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
				}
			}

		}
		USB0_ISTAT = USB_ISTAT_TOKDNE;
    1070:	2308      	movs	r3, #8
    1072:	f88b 3000 	strb.w	r3, [fp]
	status = USB0_ISTAT;
    1076:	f89b 4000 	ldrb.w	r4, [fp]
    107a:	b2e4      	uxtb	r4, r4
	if ((status & USB_ISTAT_SOFTOK /* 04 */ )) {
    107c:	0761      	lsls	r1, r4, #29
    107e:	d51a      	bpl.n	10b6 <usb_isr+0xda>
		if (usb_configuration) {
    1080:	4b8c      	ldr	r3, [pc, #560]	; (12b4 <usb_isr+0x2d8>)
    1082:	781b      	ldrb	r3, [r3, #0]
    1084:	b1a3      	cbz	r3, 10b0 <usb_isr+0xd4>
			t = usb_reboot_timer;
    1086:	498c      	ldr	r1, [pc, #560]	; (12b8 <usb_isr+0x2dc>)
    1088:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    108a:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    108e:	b122      	cbz	r2, 109a <usb_isr+0xbe>
				usb_reboot_timer = --t;
    1090:	3b01      	subs	r3, #1
    1092:	b2db      	uxtb	r3, r3
    1094:	700b      	strb	r3, [r1, #0]
				if (!t) _reboot_Teensyduino_();
    1096:	b903      	cbnz	r3, 109a <usb_isr+0xbe>
	__asm__ volatile("bkpt");
    1098:	be00      	bkpt	0x0000
			t = usb_cdc_transmit_flush_timer;
    109a:	4988      	ldr	r1, [pc, #544]	; (12bc <usb_isr+0x2e0>)
    109c:	780a      	ldrb	r2, [r1, #0]
			if (t) {
    109e:	f002 03ff 	and.w	r3, r2, #255	; 0xff
    10a2:	b12a      	cbz	r2, 10b0 <usb_isr+0xd4>
				usb_cdc_transmit_flush_timer = --t;
    10a4:	3b01      	subs	r3, #1
    10a6:	b2db      	uxtb	r3, r3
    10a8:	700b      	strb	r3, [r1, #0]
				if (t == 0) usb_serial_flush_callback();
    10aa:	2b00      	cmp	r3, #0
    10ac:	f000 8257 	beq.w	155e <usb_isr+0x582>
		USB0_ISTAT = USB_ISTAT_SOFTOK;
    10b0:	2304      	movs	r3, #4
    10b2:	f88b 3000 	strb.w	r3, [fp]
	if ((status & USB_ISTAT_TOKDNE /* 08 */ )) {
    10b6:	f004 0308 	and.w	r3, r4, #8
    10ba:	f003 02ff 	and.w	r2, r3, #255	; 0xff
    10be:	2b00      	cmp	r3, #0
    10c0:	f000 80cc 	beq.w	125c <usb_isr+0x280>
		stat = USB0_STAT;
    10c4:	f89a 3000 	ldrb.w	r3, [sl]
    10c8:	b2db      	uxtb	r3, r3
		if (endpoint == 0) {
    10ca:	091e      	lsrs	r6, r3, #4
    10cc:	d18e      	bne.n	fec <usb_isr+0x10>
	b = stat2bufferdescriptor(stat);
    10ce:	089c      	lsrs	r4, r3, #2
    10d0:	f8df 91c8 	ldr.w	r9, [pc, #456]	; 129c <usb_isr+0x2c0>
	switch (pid) {
    10d4:	f859 2034 	ldr.w	r2, [r9, r4, lsl #3]
	b = stat2bufferdescriptor(stat);
    10d8:	eb09 01c4 	add.w	r1, r9, r4, lsl #3
	switch (pid) {
    10dc:	f3c2 0283 	ubfx	r2, r2, #2, #4
    10e0:	3a01      	subs	r2, #1
	buf = b->addr;
    10e2:	6849      	ldr	r1, [r1, #4]
	switch (pid) {
    10e4:	2a0c      	cmp	r2, #12
    10e6:	f200 8088 	bhi.w	11fa <usb_isr+0x21e>
    10ea:	e8df f002 	tbb	[pc, r2]
    10ee:	7c7c      	.short	0x7c7c
    10f0:	86868686 	.word	0x86868686
    10f4:	86478686 	.word	0x86478686
    10f8:	8686      	.short	0x8686
    10fa:	07          	.byte	0x07
    10fb:	00          	.byte	0x00
		setup.word1 = *(uint32_t *)(buf);
    10fc:	6808      	ldr	r0, [r1, #0]
    10fe:	4d70      	ldr	r5, [pc, #448]	; (12c0 <usb_isr+0x2e4>)
		setup.word2 = *(uint32_t *)(buf + 4);
    1100:	684a      	ldr	r2, [r1, #4]
		ep0_tx_ptr = NULL;
    1102:	4f70      	ldr	r7, [pc, #448]	; (12c4 <usb_isr+0x2e8>)
		ep0_tx_data_toggle = 1;
    1104:	4e70      	ldr	r6, [pc, #448]	; (12c8 <usb_isr+0x2ec>)
		setup.word1 = *(uint32_t *)(buf);
    1106:	6028      	str	r0, [r5, #0]
	switch (setup.wRequestAndType) {
    1108:	b281      	uxth	r1, r0
    110a:	f240 6081 	movw	r0, #1665	; 0x681
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    110e:	4b67      	ldr	r3, [pc, #412]	; (12ac <usb_isr+0x2d0>)
		setup.word2 = *(uint32_t *)(buf + 4);
    1110:	606a      	str	r2, [r5, #4]
		ep0_tx_data_toggle = 1;
    1112:	f04f 0e01 	mov.w	lr, #1
		ep0_tx_ptr = NULL;
    1116:	2200      	movs	r2, #0
	switch (setup.wRequestAndType) {
    1118:	4281      	cmp	r1, r0
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    111a:	f849 3034 	str.w	r3, [r9, r4, lsl #3]
		ep0_tx_ptr = NULL;
    111e:	603a      	str	r2, [r7, #0]
		table[index(0, TX, EVEN)].desc = 0;
    1120:	f8c9 2010 	str.w	r2, [r9, #16]
		table[index(0, TX, ODD)].desc = 0;
    1124:	f8c9 2018 	str.w	r2, [r9, #24]
		ep0_tx_data_toggle = 1;
    1128:	f886 e000 	strb.w	lr, [r6]
		table[index(0, TX, EVEN)].desc = 0;
    112c:	4c5b      	ldr	r4, [pc, #364]	; (129c <usb_isr+0x2c0>)
	switch (setup.wRequestAndType) {
    112e:	f200 80e3 	bhi.w	12f8 <usb_isr+0x31c>
    1132:	f5b1 6fd0 	cmp.w	r1, #1664	; 0x680
    1136:	f080 8346 	bcs.w	17c6 <usb_isr+0x7ea>
    113a:	f5b1 7f81 	cmp.w	r1, #258	; 0x102
    113e:	f000 82fc 	beq.w	173a <usb_isr+0x75e>
    1142:	f200 828d 	bhi.w	1660 <usb_isr+0x684>
    1146:	2980      	cmp	r1, #128	; 0x80
    1148:	f000 8377 	beq.w	183a <usb_isr+0x85e>
    114c:	2982      	cmp	r1, #130	; 0x82
    114e:	f040 82fa 	bne.w	1746 <usb_isr+0x76a>
    1152:	88a9      	ldrh	r1, [r5, #4]
    1154:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS) {
    1158:	2904      	cmp	r1, #4
    115a:	f200 82f4 	bhi.w	1746 <usb_isr+0x76a>
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    115e:	485b      	ldr	r0, [pc, #364]	; (12cc <usb_isr+0x2f0>)
		reply_buffer[0] = 0;
    1160:	4c5b      	ldr	r4, [pc, #364]	; (12d0 <usb_isr+0x2f4>)
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    1162:	0089      	lsls	r1, r1, #2
    1164:	4408      	add	r0, r1
		reply_buffer[0] = 0;
    1166:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1168:	7062      	strb	r2, [r4, #1]
		if (*(uint8_t *)(&USB0_ENDPT0 + i * 4) & 0x02) reply_buffer[0] = 1;
    116a:	7802      	ldrb	r2, [r0, #0]
    116c:	0793      	lsls	r3, r2, #30
    116e:	f140 8455 	bpl.w	1a1c <usb_isr+0xa40>
    1172:	f884 e000 	strb.w	lr, [r4]
		datalen = 2;
    1176:	f04f 0e02 	mov.w	lr, #2
    117a:	e342      	b.n	1802 <usb_isr+0x826>
		data = ep0_tx_ptr;
    117c:	4f51      	ldr	r7, [pc, #324]	; (12c4 <usb_isr+0x2e8>)
    117e:	683a      	ldr	r2, [r7, #0]
		if (data) {
    1180:	b332      	cbz	r2, 11d0 <usb_isr+0x1f4>
			size = ep0_tx_len;
    1182:	4b54      	ldr	r3, [pc, #336]	; (12d4 <usb_isr+0x2f8>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1184:	4e50      	ldr	r6, [pc, #320]	; (12c8 <usb_isr+0x2ec>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1186:	4954      	ldr	r1, [pc, #336]	; (12d8 <usb_isr+0x2fc>)
			size = ep0_tx_len;
    1188:	8818      	ldrh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    118a:	7834      	ldrb	r4, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    118c:	780d      	ldrb	r5, [r1, #0]
    118e:	2840      	cmp	r0, #64	; 0x40
    1190:	4686      	mov	lr, r0
    1192:	f045 0802 	orr.w	r8, r5, #2
    1196:	bf28      	it	cs
    1198:	f04f 0e40 	movcs.w	lr, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    119c:	2c00      	cmp	r4, #0
	ep0_tx_data_toggle ^= 1;
    119e:	f084 0401 	eor.w	r4, r4, #1
    11a2:	7034      	strb	r4, [r6, #0]
			ep0_tx_len -= size;
    11a4:	ebce 0000 	rsb	r0, lr, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    11a8:	bf0c      	ite	eq
    11aa:	2488      	moveq	r4, #136	; 0x88
    11ac:	24c8      	movne	r4, #200	; 0xc8
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    11ae:	eb09 06c8 	add.w	r6, r9, r8, lsl #3
			ep0_tx_len -= size;
    11b2:	b280      	uxth	r0, r0
	ep0_tx_bdt_bank ^= 1;
    11b4:	f085 0501 	eor.w	r5, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    11b8:	ea44 440e 	orr.w	r4, r4, lr, lsl #16
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    11bc:	6072      	str	r2, [r6, #4]
			ep0_tx_len -= size;
    11be:	8018      	strh	r0, [r3, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    11c0:	f849 4038 	str.w	r4, [r9, r8, lsl #3]
			data += size;
    11c4:	4472      	add	r2, lr
	ep0_tx_bdt_bank ^= 1;
    11c6:	700d      	strb	r5, [r1, #0]
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    11c8:	2800      	cmp	r0, #0
    11ca:	f000 8145 	beq.w	1458 <usb_isr+0x47c>
    11ce:	603a      	str	r2, [r7, #0]
		if (setup.bRequest == 5 && setup.bmRequestType == 0) {
    11d0:	4b3b      	ldr	r3, [pc, #236]	; (12c0 <usb_isr+0x2e4>)
    11d2:	881a      	ldrh	r2, [r3, #0]
    11d4:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
    11d8:	d10f      	bne.n	11fa <usb_isr+0x21e>
			setup.bRequest = 0;
    11da:	2100      	movs	r1, #0
			USB0_ADDR = setup.wValue;
    11dc:	789a      	ldrb	r2, [r3, #2]
			setup.bRequest = 0;
    11de:	7059      	strb	r1, [r3, #1]
			USB0_ADDR = setup.wValue;
    11e0:	4b3e      	ldr	r3, [pc, #248]	; (12dc <usb_isr+0x300>)
    11e2:	701a      	strb	r2, [r3, #0]
    11e4:	e009      	b.n	11fa <usb_isr+0x21e>
		if (setup.wRequestAndType == 0x2021 /*CDC_SET_LINE_CODING*/) {
    11e6:	4a36      	ldr	r2, [pc, #216]	; (12c0 <usb_isr+0x2e4>)
    11e8:	8810      	ldrh	r0, [r2, #0]
    11ea:	f242 0221 	movw	r2, #8225	; 0x2021
    11ee:	4290      	cmp	r0, r2
    11f0:	f000 8137 	beq.w	1462 <usb_isr+0x486>
		b->desc = BDT_DESC(EP0_SIZE, DATA1);
    11f4:	4a2d      	ldr	r2, [pc, #180]	; (12ac <usb_isr+0x2d0>)
    11f6:	f849 2034 	str.w	r2, [r9, r4, lsl #3]
	USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    11fa:	4a39      	ldr	r2, [pc, #228]	; (12e0 <usb_isr+0x304>)
    11fc:	2301      	movs	r3, #1
    11fe:	7013      	strb	r3, [r2, #0]
    1200:	e736      	b.n	1070 <usb_isr+0x94>
					b->desc = BDT_DESC(64, ((uint32_t)b & 8) ? DATA1 : DATA0);
    1202:	4a2a      	ldr	r2, [pc, #168]	; (12ac <usb_isr+0x2d0>)
    1204:	4b2a      	ldr	r3, [pc, #168]	; (12b0 <usb_isr+0x2d4>)
    1206:	f019 0f08 	tst.w	r9, #8
    120a:	bf18      	it	ne
    120c:	4613      	movne	r3, r2
    120e:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    1212:	e72d      	b.n	1070 <usb_isr+0x94>
				usb_free(packet);
    1214:	f000 fcde 	bl	1bd4 <usb_free>
				packet = tx_first[endpoint];
    1218:	4a32      	ldr	r2, [pc, #200]	; (12e4 <usb_isr+0x308>)
					switch (tx_state[endpoint]) {
    121a:	4933      	ldr	r1, [pc, #204]	; (12e8 <usb_isr+0x30c>)
				packet = tx_first[endpoint];
    121c:	f852 3026 	ldr.w	r3, [r2, r6, lsl #2]
				if (packet) {
    1220:	2b00      	cmp	r3, #0
    1222:	f000 81d1 	beq.w	15c8 <usb_isr+0x5ec>
					tx_first[endpoint] = packet->next;
    1226:	6858      	ldr	r0, [r3, #4]
					switch (tx_state[endpoint]) {
    1228:	5d8c      	ldrb	r4, [r1, r6]
					tx_first[endpoint] = packet->next;
    122a:	f842 0026 	str.w	r0, [r2, r6, lsl #2]
					b->addr = packet->buf;
    122e:	f103 0208 	add.w	r2, r3, #8
    1232:	f8c9 2004 	str.w	r2, [r9, #4]
					switch (tx_state[endpoint]) {
    1236:	2c03      	cmp	r4, #3
    1238:	d805      	bhi.n	1246 <usb_isr+0x26a>
    123a:	e8df f004 	tbb	[pc, r4]
    123e:	022c      	.short	0x022c
    1240:	2629      	.short	0x2629
						tx_state[endpoint] = TX_STATE_EVEN_FREE;
    1242:	2202      	movs	r2, #2
    1244:	558a      	strb	r2, [r1, r6]
					b->desc = BDT_DESC(packet->len,
    1246:	881a      	ldrh	r2, [r3, #0]
    1248:	f019 0f08 	tst.w	r9, #8
    124c:	bf0c      	ite	eq
    124e:	2388      	moveq	r3, #136	; 0x88
    1250:	23c8      	movne	r3, #200	; 0xc8
    1252:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
    1256:	f847 3038 	str.w	r3, [r7, r8, lsl #3]
    125a:	e709      	b.n	1070 <usb_isr+0x94>
		goto restart;
	}



	if (status & USB_ISTAT_USBRST /* 01 */ ) {
    125c:	07e0      	lsls	r0, r4, #31
    125e:	f100 8181 	bmi.w	1564 <usb_isr+0x588>
		USB0_CTL = USB_CTL_USBENSOFEN;
		return;
	}


	if ((status & USB_ISTAT_STALL /* 80 */ )) {
    1262:	0621      	lsls	r1, r4, #24
    1264:	f100 81f2 	bmi.w	164c <usb_isr+0x670>
		//serial_print("stall:\n");
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
		USB0_ISTAT = USB_ISTAT_STALL;
	}
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1268:	07a2      	lsls	r2, r4, #30
    126a:	d506      	bpl.n	127a <usb_isr+0x29e>
		uint8_t err = USB0_ERRSTAT;
    126c:	4a1f      	ldr	r2, [pc, #124]	; (12ec <usb_isr+0x310>)
		USB0_ERRSTAT = err;
		//serial_print("err:");
		//serial_phex(err);
		//serial_print("\n");
		USB0_ISTAT = USB_ISTAT_ERROR;
    126e:	4920      	ldr	r1, [pc, #128]	; (12f0 <usb_isr+0x314>)
		uint8_t err = USB0_ERRSTAT;
    1270:	7813      	ldrb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1272:	2002      	movs	r0, #2
		uint8_t err = USB0_ERRSTAT;
    1274:	b2db      	uxtb	r3, r3
		USB0_ERRSTAT = err;
    1276:	7013      	strb	r3, [r2, #0]
		USB0_ISTAT = USB_ISTAT_ERROR;
    1278:	7008      	strb	r0, [r1, #0]
	}

	if ((status & USB_ISTAT_SLEEP /* 10 */ )) {
    127a:	06e3      	lsls	r3, r4, #27
    127c:	d502      	bpl.n	1284 <usb_isr+0x2a8>
		//serial_print("sleep\n");
		USB0_ISTAT = USB_ISTAT_SLEEP;
    127e:	4b1c      	ldr	r3, [pc, #112]	; (12f0 <usb_isr+0x314>)
    1280:	2210      	movs	r2, #16
    1282:	701a      	strb	r2, [r3, #0]
	}

}
    1284:	b007      	add	sp, #28
    1286:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						tx_state[endpoint] = TX_STATE_NONE_FREE_EVEN_FIRST;
    128a:	2204      	movs	r2, #4
    128c:	558a      	strb	r2, [r1, r6]
						break;
    128e:	e7da      	b.n	1246 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_NONE_FREE_ODD_FIRST;
    1290:	2205      	movs	r2, #5
    1292:	558a      	strb	r2, [r1, r6]
						break;
    1294:	e7d7      	b.n	1246 <usb_isr+0x26a>
						tx_state[endpoint] = TX_STATE_ODD_FREE;
    1296:	2203      	movs	r2, #3
    1298:	558a      	strb	r2, [r1, r6]
						break;
    129a:	e7d4      	b.n	1246 <usb_isr+0x26a>
    129c:	1fff8000 	.word	0x1fff8000
    12a0:	1fff9334 	.word	0x1fff9334
    12a4:	1fff92e0 	.word	0x1fff92e0
    12a8:	1fff95b8 	.word	0x1fff95b8
    12ac:	004000c8 	.word	0x004000c8
    12b0:	00400088 	.word	0x00400088
    12b4:	1fff93bc 	.word	0x1fff93bc
    12b8:	1fff9345 	.word	0x1fff9345
    12bc:	1fff93c4 	.word	0x1fff93c4
    12c0:	1fff93a8 	.word	0x1fff93a8
    12c4:	1fff92dc 	.word	0x1fff92dc
    12c8:	1fff9344 	.word	0x1fff9344
    12cc:	400720c0 	.word	0x400720c0
    12d0:	1fff93b4 	.word	0x1fff93b4
    12d4:	1fff92f0 	.word	0x1fff92f0
    12d8:	1fff93b0 	.word	0x1fff93b0
    12dc:	40072098 	.word	0x40072098
    12e0:	40072094 	.word	0x40072094
    12e4:	1fff9388 	.word	0x1fff9388
    12e8:	1fff93c0 	.word	0x1fff93c0
    12ec:	40072088 	.word	0x40072088
    12f0:	40072080 	.word	0x40072080
    12f4:	40072090 	.word	0x40072090
	switch (setup.wRequestAndType) {
    12f8:	f242 0021 	movw	r0, #8225	; 0x2021
    12fc:	4281      	cmp	r1, r0
    12fe:	f000 812a 	beq.w	1556 <usb_isr+0x57a>
    1302:	f200 80d8 	bhi.w	14b6 <usb_isr+0x4da>
    1306:	f5b1 6f08 	cmp.w	r1, #2176	; 0x880
    130a:	f000 8276 	beq.w	17fa <usb_isr+0x81e>
    130e:	f5b1 6f10 	cmp.w	r1, #2304	; 0x900
    1312:	f040 8218 	bne.w	1746 <usb_isr+0x76a>
			if (table[i].desc & BDT_OWN) {
    1316:	6a22      	ldr	r2, [r4, #32]
		usb_configuration = setup.wValue;
    1318:	49b3      	ldr	r1, [pc, #716]	; (15e8 <usb_isr+0x60c>)
    131a:	78a8      	ldrb	r0, [r5, #2]
    131c:	7008      	strb	r0, [r1, #0]
			if (table[i].desc & BDT_OWN) {
    131e:	0612      	lsls	r2, r2, #24
    1320:	f100 8337 	bmi.w	1992 <usb_isr+0x9b6>
    1324:	f8d9 2028 	ldr.w	r2, [r9, #40]	; 0x28
    1328:	49b0      	ldr	r1, [pc, #704]	; (15ec <usb_isr+0x610>)
    132a:	0613      	lsls	r3, r2, #24
    132c:	f100 832c 	bmi.w	1988 <usb_isr+0x9ac>
    1330:	f8d9 2030 	ldr.w	r2, [r9, #48]	; 0x30
    1334:	49ad      	ldr	r1, [pc, #692]	; (15ec <usb_isr+0x610>)
    1336:	0615      	lsls	r5, r2, #24
    1338:	f100 82ff 	bmi.w	193a <usb_isr+0x95e>
    133c:	f8d9 2038 	ldr.w	r2, [r9, #56]	; 0x38
    1340:	49aa      	ldr	r1, [pc, #680]	; (15ec <usb_isr+0x610>)
    1342:	0614      	lsls	r4, r2, #24
    1344:	f100 82f4 	bmi.w	1930 <usb_isr+0x954>
    1348:	f8d9 2040 	ldr.w	r2, [r9, #64]	; 0x40
    134c:	49a7      	ldr	r1, [pc, #668]	; (15ec <usb_isr+0x610>)
    134e:	0610      	lsls	r0, r2, #24
    1350:	f100 8347 	bmi.w	19e2 <usb_isr+0xa06>
    1354:	f8d9 2048 	ldr.w	r2, [r9, #72]	; 0x48
    1358:	49a4      	ldr	r1, [pc, #656]	; (15ec <usb_isr+0x610>)
    135a:	0612      	lsls	r2, r2, #24
    135c:	f100 833c 	bmi.w	19d8 <usb_isr+0x9fc>
    1360:	f8d9 2050 	ldr.w	r2, [r9, #80]	; 0x50
    1364:	49a1      	ldr	r1, [pc, #644]	; (15ec <usb_isr+0x610>)
    1366:	0613      	lsls	r3, r2, #24
    1368:	f100 8331 	bmi.w	19ce <usb_isr+0x9f2>
    136c:	f8d9 2058 	ldr.w	r2, [r9, #88]	; 0x58
    1370:	499e      	ldr	r1, [pc, #632]	; (15ec <usb_isr+0x610>)
    1372:	0615      	lsls	r5, r2, #24
    1374:	f100 8326 	bmi.w	19c4 <usb_isr+0x9e8>
    1378:	f8d9 2060 	ldr.w	r2, [r9, #96]	; 0x60
    137c:	499b      	ldr	r1, [pc, #620]	; (15ec <usb_isr+0x610>)
    137e:	0614      	lsls	r4, r2, #24
    1380:	f100 831b 	bmi.w	19ba <usb_isr+0x9de>
    1384:	f8d9 2068 	ldr.w	r2, [r9, #104]	; 0x68
    1388:	4998      	ldr	r1, [pc, #608]	; (15ec <usb_isr+0x610>)
    138a:	0610      	lsls	r0, r2, #24
    138c:	f100 8310 	bmi.w	19b0 <usb_isr+0x9d4>
    1390:	f8d9 2070 	ldr.w	r2, [r9, #112]	; 0x70
    1394:	4995      	ldr	r1, [pc, #596]	; (15ec <usb_isr+0x610>)
    1396:	0612      	lsls	r2, r2, #24
    1398:	f100 8305 	bmi.w	19a6 <usb_isr+0x9ca>
    139c:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    13a0:	4992      	ldr	r1, [pc, #584]	; (15ec <usb_isr+0x610>)
    13a2:	0613      	lsls	r3, r2, #24
    13a4:	f100 82fa 	bmi.w	199c <usb_isr+0x9c0>
    13a8:	f8d9 2080 	ldr.w	r2, [r9, #128]	; 0x80
    13ac:	498f      	ldr	r1, [pc, #572]	; (15ec <usb_isr+0x610>)
    13ae:	0615      	lsls	r5, r2, #24
    13b0:	f100 832e 	bmi.w	1a10 <usb_isr+0xa34>
    13b4:	f8d9 2088 	ldr.w	r2, [r9, #136]	; 0x88
    13b8:	498c      	ldr	r1, [pc, #560]	; (15ec <usb_isr+0x610>)
    13ba:	0614      	lsls	r4, r2, #24
    13bc:	f100 8322 	bmi.w	1a04 <usb_isr+0xa28>
    13c0:	f8d9 2090 	ldr.w	r2, [r9, #144]	; 0x90
    13c4:	4989      	ldr	r1, [pc, #548]	; (15ec <usb_isr+0x610>)
    13c6:	0610      	lsls	r0, r2, #24
    13c8:	f100 8316 	bmi.w	19f8 <usb_isr+0xa1c>
    13cc:	f8d9 2098 	ldr.w	r2, [r9, #152]	; 0x98
    13d0:	4986      	ldr	r1, [pc, #536]	; (15ec <usb_isr+0x610>)
    13d2:	0612      	lsls	r2, r2, #24
    13d4:	f100 830a 	bmi.w	19ec <usb_isr+0xa10>
    13d8:	4885      	ldr	r0, [pc, #532]	; (15f0 <usb_isr+0x614>)
    13da:	4a86      	ldr	r2, [pc, #536]	; (15f4 <usb_isr+0x618>)
    13dc:	4986      	ldr	r1, [pc, #536]	; (15f8 <usb_isr+0x61c>)
    13de:	9001      	str	r0, [sp, #4]
    13e0:	4886      	ldr	r0, [pc, #536]	; (15fc <usb_isr+0x620>)
    13e2:	4c87      	ldr	r4, [pc, #540]	; (1600 <usb_isr+0x624>)
    13e4:	4d87      	ldr	r5, [pc, #540]	; (1604 <usb_isr+0x628>)
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    13e6:	9402      	str	r4, [sp, #8]
{
    13e8:	2300      	movs	r3, #0
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    13ea:	9704      	str	r7, [sp, #16]
    13ec:	9605      	str	r6, [sp, #20]
    13ee:	4680      	mov	r8, r0
    13f0:	461c      	mov	r4, r3
    13f2:	460f      	mov	r7, r1
    13f4:	4616      	mov	r6, r2
    13f6:	9503      	str	r5, [sp, #12]
			p = rx_first[i];
    13f8:	6830      	ldr	r0, [r6, #0]
			while (p) {
    13fa:	b128      	cbz	r0, 1408 <usb_isr+0x42c>
				n = p->next;
    13fc:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    13fe:	f000 fbe9 	bl	1bd4 <usb_free>
			while (p) {
    1402:	4628      	mov	r0, r5
    1404:	2d00      	cmp	r5, #0
    1406:	d1f9      	bne.n	13fc <usb_isr+0x420>
			rx_first[i] = NULL;
    1408:	2300      	movs	r3, #0
    140a:	6033      	str	r3, [r6, #0]
			rx_last[i] = NULL;
    140c:	9b03      	ldr	r3, [sp, #12]
			p = tx_first[i];
    140e:	6838      	ldr	r0, [r7, #0]
			rx_last[i] = NULL;
    1410:	461a      	mov	r2, r3
    1412:	2300      	movs	r3, #0
    1414:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
			while (p) {
    1418:	b128      	cbz	r0, 1426 <usb_isr+0x44a>
				n = p->next;
    141a:	6845      	ldr	r5, [r0, #4]
				usb_free(p);
    141c:	f000 fbda 	bl	1bd4 <usb_free>
			while (p) {
    1420:	4628      	mov	r0, r5
    1422:	2d00      	cmp	r5, #0
    1424:	d1f9      	bne.n	141a <usb_isr+0x43e>
			tx_first[i] = NULL;
    1426:	2200      	movs	r2, #0
    1428:	603a      	str	r2, [r7, #0]
			tx_last[i] = NULL;
    142a:	9a01      	ldr	r2, [sp, #4]
			switch (tx_state[i]) {
    142c:	f898 3000 	ldrb.w	r3, [r8]
			tx_last[i] = NULL;
    1430:	4611      	mov	r1, r2
    1432:	2200      	movs	r2, #0
    1434:	f841 2b04 	str.w	r2, [r1], #4
			usb_rx_byte_count_data[i] = 0;
    1438:	9a02      	ldr	r2, [sp, #8]
			tx_last[i] = NULL;
    143a:	9101      	str	r1, [sp, #4]
			switch (tx_state[i]) {
    143c:	3b02      	subs	r3, #2
			usb_rx_byte_count_data[i] = 0;
    143e:	f04f 0100 	mov.w	r1, #0
    1442:	f822 1014 	strh.w	r1, [r2, r4, lsl #1]
			switch (tx_state[i]) {
    1446:	2b03      	cmp	r3, #3
    1448:	f200 812b 	bhi.w	16a2 <usb_isr+0x6c6>
    144c:	e8df f013 	tbh	[pc, r3, lsl #1]
    1450:	01250170 	.word	0x01250170
    1454:	01250170 	.word	0x01250170
			ep0_tx_ptr = (ep0_tx_len > 0 || size == EP0_SIZE) ? data : NULL;
    1458:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    145c:	bf18      	it	ne
    145e:	2200      	movne	r2, #0
    1460:	e6b5      	b.n	11ce <usb_isr+0x1f2>
				*dst++ = *buf++;
    1462:	4a69      	ldr	r2, [pc, #420]	; (1608 <usb_isr+0x62c>)
    1464:	780d      	ldrb	r5, [r1, #0]
    1466:	7848      	ldrb	r0, [r1, #1]
    1468:	7015      	strb	r5, [r2, #0]
    146a:	7050      	strb	r0, [r2, #1]
    146c:	788d      	ldrb	r5, [r1, #2]
    146e:	78c8      	ldrb	r0, [r1, #3]
    1470:	7095      	strb	r5, [r2, #2]
    1472:	70d0      	strb	r0, [r2, #3]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1474:	6810      	ldr	r0, [r2, #0]
				*dst++ = *buf++;
    1476:	790d      	ldrb	r5, [r1, #4]
    1478:	7115      	strb	r5, [r2, #4]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    147a:	2886      	cmp	r0, #134	; 0x86
				*dst++ = *buf++;
    147c:	794d      	ldrb	r5, [r1, #5]
    147e:	7989      	ldrb	r1, [r1, #6]
    1480:	7155      	strb	r5, [r2, #5]
    1482:	7191      	strb	r1, [r2, #6]
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    1484:	f000 819b 	beq.w	17be <usb_isr+0x7e2>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1488:	4960      	ldr	r1, [pc, #384]	; (160c <usb_isr+0x630>)
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    148a:	4e61      	ldr	r6, [pc, #388]	; (1610 <usb_isr+0x634>)
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    148c:	780a      	ldrb	r2, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    148e:	7830      	ldrb	r0, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1490:	f082 0501 	eor.w	r5, r2, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1494:	2800      	cmp	r0, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    1496:	f042 0202 	orr.w	r2, r2, #2
	ep0_tx_bdt_bank ^= 1;
    149a:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    149c:	bf0c      	ite	eq
    149e:	2188      	moveq	r1, #136	; 0x88
    14a0:	21c8      	movne	r1, #200	; 0xc8
    14a2:	f849 1032 	str.w	r1, [r9, r2, lsl #3]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14a6:	eb09 02c2 	add.w	r2, r9, r2, lsl #3
	ep0_tx_data_toggle ^= 1;
    14aa:	f080 0001 	eor.w	r0, r0, #1
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14ae:	2100      	movs	r1, #0
	ep0_tx_data_toggle ^= 1;
    14b0:	7030      	strb	r0, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14b2:	6051      	str	r1, [r2, #4]
    14b4:	e69e      	b.n	11f4 <usb_isr+0x218>
	switch (setup.wRequestAndType) {
    14b6:	f242 2021 	movw	r0, #8737	; 0x2221
    14ba:	4281      	cmp	r1, r0
    14bc:	f040 81cb 	bne.w	1856 <usb_isr+0x87a>
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    14c0:	4b54      	ldr	r3, [pc, #336]	; (1614 <usb_isr+0x638>)
    14c2:	4c55      	ldr	r4, [pc, #340]	; (1618 <usb_isr+0x63c>)
		usb_cdc_line_rtsdtr = setup.wValue;
    14c4:	4955      	ldr	r1, [pc, #340]	; (161c <usb_isr+0x640>)
    14c6:	78a8      	ldrb	r0, [r5, #2]
		usb_cdc_line_rtsdtr_millis = systick_millis_count;
    14c8:	681d      	ldr	r5, [r3, #0]
    14ca:	6025      	str	r5, [r4, #0]
		usb_cdc_line_rtsdtr = setup.wValue;
    14cc:	f8cd e004 	str.w	lr, [sp, #4]
    14d0:	7008      	strb	r0, [r1, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    14d2:	2000      	movs	r0, #0
    14d4:	9002      	str	r0, [sp, #8]
    14d6:	4680      	mov	r8, r0
    14d8:	4684      	mov	ip, r0
    14da:	4604      	mov	r4, r0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14dc:	494b      	ldr	r1, [pc, #300]	; (160c <usb_isr+0x630>)
    14de:	780d      	ldrb	r5, [r1, #0]
    14e0:	f045 0e02 	orr.w	lr, r5, #2
    14e4:	eb09 03ce 	add.w	r3, r9, lr, lsl #3
    14e8:	9303      	str	r3, [sp, #12]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    14ea:	9b01      	ldr	r3, [sp, #4]
    14ec:	2b00      	cmp	r3, #0
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    14ee:	9b03      	ldr	r3, [sp, #12]
    14f0:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    14f2:	bf0c      	ite	eq
    14f4:	2488      	moveq	r4, #136	; 0x88
    14f6:	24c8      	movne	r4, #200	; 0xc8
    14f8:	ea44 0308 	orr.w	r3, r4, r8
	ep0_tx_bdt_bank ^= 1;
    14fc:	f085 0401 	eor.w	r4, r5, #1
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1500:	f849 303e 	str.w	r3, [r9, lr, lsl #3]
	ep0_tx_data_toggle ^= 1;
    1504:	7032      	strb	r2, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1506:	700c      	strb	r4, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1508:	f8df e0e0 	ldr.w	lr, [pc, #224]	; 15ec <usb_isr+0x610>
	ep0_tx_data_toggle ^= 1;
    150c:	4b40      	ldr	r3, [pc, #256]	; (1610 <usb_isr+0x634>)
	ep0_tx_bdt_bank ^= 1;
    150e:	f8df 80fc 	ldr.w	r8, [pc, #252]	; 160c <usb_isr+0x630>
	if (datalen == 0 && size < EP0_SIZE) return;
    1512:	2800      	cmp	r0, #0
    1514:	f040 811e 	bne.w	1754 <usb_isr+0x778>
    1518:	f1bc 0f40 	cmp.w	ip, #64	; 0x40
    151c:	d11b      	bne.n	1556 <usb_isr+0x57a>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    151e:	f044 0c02 	orr.w	ip, r4, #2
    1522:	eb09 03cc 	add.w	r3, r9, ip, lsl #3
    1526:	9c02      	ldr	r4, [sp, #8]
    1528:	f8df e0c0 	ldr.w	lr, [pc, #192]	; 15ec <usb_isr+0x610>
    152c:	605c      	str	r4, [r3, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    152e:	2a00      	cmp	r2, #0
    1530:	f040 8126 	bne.w	1780 <usb_isr+0x7a4>
    1534:	0402      	lsls	r2, r0, #16
    1536:	f042 0288 	orr.w	r2, r2, #136	; 0x88
	ep0_tx_data_toggle ^= 1;
    153a:	f89d 3004 	ldrb.w	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    153e:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
	data += size;
    1542:	4404      	add	r4, r0
	ep0_tx_data_toggle ^= 1;
    1544:	7033      	strb	r3, [r6, #0]
	ep0_tx_bdt_bank ^= 1;
    1546:	700d      	strb	r5, [r1, #0]
	data += size;
    1548:	4623      	mov	r3, r4
	if (datalen == 0 && size < EP0_SIZE) return;
    154a:	2840      	cmp	r0, #64	; 0x40
    154c:	d103      	bne.n	1556 <usb_isr+0x57a>
    154e:	2000      	movs	r0, #0
	ep0_tx_len = datalen;
    1550:	4a33      	ldr	r2, [pc, #204]	; (1620 <usb_isr+0x644>)
	ep0_tx_ptr = data;
    1552:	603b      	str	r3, [r7, #0]
	ep0_tx_len = datalen;
    1554:	8010      	strh	r0, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    1556:	4a33      	ldr	r2, [pc, #204]	; (1624 <usb_isr+0x648>)
    1558:	2301      	movs	r3, #1
    155a:	7013      	strb	r3, [r2, #0]
    155c:	e64d      	b.n	11fa <usb_isr+0x21e>
				if (t == 0) usb_serial_flush_callback();
    155e:	f000 fcf5 	bl	1f4c <usb_serial_flush_callback>
    1562:	e5a5      	b.n	10b0 <usb_isr+0xd4>
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1564:	4b21      	ldr	r3, [pc, #132]	; (15ec <usb_isr+0x610>)
		USB0_CTL = USB_CTL_ODDRST;
    1566:	482f      	ldr	r0, [pc, #188]	; (1624 <usb_isr+0x648>)
		ep0_tx_bdt_bank = 0;
    1568:	4928      	ldr	r1, [pc, #160]	; (160c <usb_isr+0x630>)
		table[index(0, TX, EVEN)].desc = 0;
    156a:	611a      	str	r2, [r3, #16]
		USB0_CTL = USB_CTL_ODDRST;
    156c:	f04f 0e02 	mov.w	lr, #2
    1570:	f880 e000 	strb.w	lr, [r0]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1574:	4f2c      	ldr	r7, [pc, #176]	; (1628 <usb_isr+0x64c>)
		ep0_tx_bdt_bank = 0;
    1576:	700a      	strb	r2, [r1, #0]
		table[index(0, RX, EVEN)].desc = BDT_DESC(EP0_SIZE, 0);
    1578:	492c      	ldr	r1, [pc, #176]	; (162c <usb_isr+0x650>)
    157a:	6019      	str	r1, [r3, #0]
		table[index(0, RX, ODD)].desc = BDT_DESC(EP0_SIZE, 0);
    157c:	6099      	str	r1, [r3, #8]
		USB0_ERRSTAT = 0xFF;
    157e:	4e2c      	ldr	r6, [pc, #176]	; (1630 <usb_isr+0x654>)
		USB0_ISTAT = 0xFF;
    1580:	4d2c      	ldr	r5, [pc, #176]	; (1634 <usb_isr+0x658>)
		USB0_ADDR = 0;
    1582:	4c2d      	ldr	r4, [pc, #180]	; (1638 <usb_isr+0x65c>)
		table[index(0, TX, ODD)].desc = 0;
    1584:	619a      	str	r2, [r3, #24]
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1586:	210d      	movs	r1, #13
    1588:	7039      	strb	r1, [r7, #0]
		USB0_ERRSTAT = 0xFF;
    158a:	21ff      	movs	r1, #255	; 0xff
    158c:	7031      	strb	r1, [r6, #0]
		USB0_ERREN = 0xFF;
    158e:	f8df e0b8 	ldr.w	lr, [pc, #184]	; 1648 <usb_isr+0x66c>
		USB0_ISTAT = 0xFF;
    1592:	7029      	strb	r1, [r5, #0]
		USB0_ADDR = 0;
    1594:	7022      	strb	r2, [r4, #0]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    1596:	4d29      	ldr	r5, [pc, #164]	; (163c <usb_isr+0x660>)
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    1598:	4a29      	ldr	r2, [pc, #164]	; (1640 <usb_isr+0x664>)
		USB0_ERREN = 0xFF;
    159a:	f88e 1000 	strb.w	r1, [lr]
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    159e:	279f      	movs	r7, #159	; 0x9f
		USB0_CTL = USB_CTL_USBENSOFEN;
    15a0:	2401      	movs	r4, #1
		USB0_INTEN = USB_INTEN_TOKDNEEN |
    15a2:	f806 7c04 	strb.w	r7, [r6, #-4]
		table[index(0, RX, EVEN)].addr = ep0_rx0_buf;
    15a6:	605d      	str	r5, [r3, #4]
		USB0_CTL = USB_CTL_USBENSOFEN;
    15a8:	7004      	strb	r4, [r0, #0]
		table[index(0, RX, ODD)].addr = ep0_rx1_buf;
    15aa:	60da      	str	r2, [r3, #12]
}
    15ac:	b007      	add	sp, #28
    15ae:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
						usb_rx_memory_needed++;
    15b2:	4a24      	ldr	r2, [pc, #144]	; (1644 <usb_isr+0x668>)
						b->desc = 0;
    15b4:	f847 0038 	str.w	r0, [r7, r8, lsl #3]
						usb_rx_memory_needed++;
    15b8:	7813      	ldrb	r3, [r2, #0]
    15ba:	3301      	adds	r3, #1
    15bc:	7013      	strb	r3, [r2, #0]
    15be:	e557      	b.n	1070 <usb_isr+0x94>
						rx_first[endpoint] = packet;
    15c0:	f843 0026 	str.w	r0, [r3, r6, lsl #2]
    15c4:	4d0f      	ldr	r5, [pc, #60]	; (1604 <usb_isr+0x628>)
    15c6:	e53a      	b.n	103e <usb_isr+0x62>
					switch (tx_state[endpoint]) {
    15c8:	5d8b      	ldrb	r3, [r1, r6]
    15ca:	2b03      	cmp	r3, #3
    15cc:	f200 80f0 	bhi.w	17b0 <usb_isr+0x7d4>
    15d0:	a201      	add	r2, pc, #4	; (adr r2, 15d8 <usb_isr+0x5fc>)
    15d2:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    15d6:	bf00      	nop
    15d8:	00001071 	.word	0x00001071
    15dc:	00001071 	.word	0x00001071
    15e0:	00001695 	.word	0x00001695
    15e4:	0000168f 	.word	0x0000168f
    15e8:	1fff93bc 	.word	0x1fff93bc
    15ec:	1fff8000 	.word	0x1fff8000
    15f0:	1fff9398 	.word	0x1fff9398
    15f4:	1fff9334 	.word	0x1fff9334
    15f8:	1fff9388 	.word	0x1fff9388
    15fc:	1fff93c0 	.word	0x1fff93c0
    1600:	1fff95b8 	.word	0x1fff95b8
    1604:	1fff92e0 	.word	0x1fff92e0
    1608:	1fff95c0 	.word	0x1fff95c0
    160c:	1fff93b0 	.word	0x1fff93b0
    1610:	1fff9344 	.word	0x1fff9344
    1614:	1fff92d8 	.word	0x1fff92d8
    1618:	1fff95c8 	.word	0x1fff95c8
    161c:	1fff93d4 	.word	0x1fff93d4
    1620:	1fff92f0 	.word	0x1fff92f0
    1624:	40072094 	.word	0x40072094
    1628:	400720c0 	.word	0x400720c0
    162c:	00400088 	.word	0x00400088
    1630:	40072088 	.word	0x40072088
    1634:	40072080 	.word	0x40072080
    1638:	40072098 	.word	0x40072098
    163c:	1fff92f4 	.word	0x1fff92f4
    1640:	1fff9348 	.word	0x1fff9348
    1644:	1fff93b1 	.word	0x1fff93b1
    1648:	4007208c 	.word	0x4007208c
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    164c:	49bd      	ldr	r1, [pc, #756]	; (1944 <usb_isr+0x968>)
		USB0_ISTAT = USB_ISTAT_STALL;
    164e:	4bbe      	ldr	r3, [pc, #760]	; (1948 <usb_isr+0x96c>)
    1650:	2280      	movs	r2, #128	; 0x80
		USB0_ENDPT0 = USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1652:	200d      	movs	r0, #13
    1654:	7008      	strb	r0, [r1, #0]
		USB0_ISTAT = USB_ISTAT_STALL;
    1656:	701a      	strb	r2, [r3, #0]
	if ((status & USB_ISTAT_ERROR /* 02 */ )) {
    1658:	07a2      	lsls	r2, r4, #30
    165a:	f57f ae0e 	bpl.w	127a <usb_isr+0x29e>
    165e:	e605      	b.n	126c <usb_isr+0x290>
	switch (setup.wRequestAndType) {
    1660:	f240 3202 	movw	r2, #770	; 0x302
    1664:	4291      	cmp	r1, r2
    1666:	f040 80ee 	bne.w	1846 <usb_isr+0x86a>
    166a:	88a9      	ldrh	r1, [r5, #4]
    166c:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1670:	2904      	cmp	r1, #4
    1672:	d868      	bhi.n	1746 <usb_isr+0x76a>
    1674:	886a      	ldrh	r2, [r5, #2]
    1676:	2a00      	cmp	r2, #0
    1678:	d165      	bne.n	1746 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) |= 0x02;
    167a:	48b2      	ldr	r0, [pc, #712]	; (1944 <usb_isr+0x968>)
    167c:	f8cd e004 	str.w	lr, [sp, #4]
    1680:	0089      	lsls	r1, r1, #2
    1682:	4408      	add	r0, r1
    1684:	7801      	ldrb	r1, [r0, #0]
    1686:	f041 0102 	orr.w	r1, r1, #2
    168a:	7001      	strb	r1, [r0, #0]
    168c:	e721      	b.n	14d2 <usb_isr+0x4f6>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_ODD_FIRST;
    168e:	2301      	movs	r3, #1
    1690:	558b      	strb	r3, [r1, r6]
						break;
    1692:	e4ed      	b.n	1070 <usb_isr+0x94>
						tx_state[endpoint] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1694:	2300      	movs	r3, #0
    1696:	558b      	strb	r3, [r1, r6]
						break;
    1698:	e4ea      	b.n	1070 <usb_isr+0x94>
				tx_state[i] = TX_STATE_BOTH_FREE_ODD_FIRST;
    169a:	f04f 0301 	mov.w	r3, #1
    169e:	f888 3000 	strb.w	r3, [r8]
		for (i=0; i < NUM_ENDPOINTS; i++) {
    16a2:	3401      	adds	r4, #1
    16a4:	2c04      	cmp	r4, #4
    16a6:	f106 0604 	add.w	r6, r6, #4
    16aa:	f107 0704 	add.w	r7, r7, #4
    16ae:	f108 0801 	add.w	r8, r8, #1
    16b2:	f47f aea1 	bne.w	13f8 <usb_isr+0x41c>
			epconf = *cfg++;
    16b6:	4ca5      	ldr	r4, [pc, #660]	; (194c <usb_isr+0x970>)
			*reg = epconf;
    16b8:	4ba5      	ldr	r3, [pc, #660]	; (1950 <usb_isr+0x974>)
			epconf = *cfg++;
    16ba:	7822      	ldrb	r2, [r4, #0]
		usb_rx_memory_needed = 0;
    16bc:	4da5      	ldr	r5, [pc, #660]	; (1954 <usb_isr+0x978>)
    16be:	9f04      	ldr	r7, [sp, #16]
    16c0:	9e05      	ldr	r6, [sp, #20]
    16c2:	2100      	movs	r1, #0
    16c4:	7029      	strb	r1, [r5, #0]
			*reg = epconf;
    16c6:	701a      	strb	r2, [r3, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    16c8:	0713      	lsls	r3, r2, #28
    16ca:	f100 8105 	bmi.w	18d8 <usb_isr+0x8fc>
			epconf = *cfg++;
    16ce:	7862      	ldrb	r2, [r4, #1]
			*reg = epconf;
    16d0:	49a1      	ldr	r1, [pc, #644]	; (1958 <usb_isr+0x97c>)
			table[index(i, TX, EVEN)].desc = 0;
    16d2:	f8df 8290 	ldr.w	r8, [pc, #656]	; 1964 <usb_isr+0x988>
			*reg = epconf;
    16d6:	700a      	strb	r2, [r1, #0]
			if (epconf & USB_ENDPT_EPRXEN) {
    16d8:	0710      	lsls	r0, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    16da:	f04f 0100 	mov.w	r1, #0
    16de:	f8c9 1030 	str.w	r1, [r9, #48]	; 0x30
			table[index(i, TX, ODD)].desc = 0;
    16e2:	f8c9 1038 	str.w	r1, [r9, #56]	; 0x38
			if (epconf & USB_ENDPT_EPRXEN) {
    16e6:	f100 80e1 	bmi.w	18ac <usb_isr+0x8d0>
			*reg = epconf;
    16ea:	499c      	ldr	r1, [pc, #624]	; (195c <usb_isr+0x980>)
			epconf = *cfg++;
    16ec:	78a2      	ldrb	r2, [r4, #2]
			*reg = epconf;
    16ee:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    16f0:	2100      	movs	r1, #0
    16f2:	f8c9 1050 	str.w	r1, [r9, #80]	; 0x50
			table[index(i, TX, ODD)].desc = 0;
    16f6:	f8c9 1058 	str.w	r1, [r9, #88]	; 0x58
			if (epconf & USB_ENDPT_EPRXEN) {
    16fa:	0711      	lsls	r1, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    16fc:	f8df 8264 	ldr.w	r8, [pc, #612]	; 1964 <usb_isr+0x988>
			if (epconf & USB_ENDPT_EPRXEN) {
    1700:	f100 8100 	bmi.w	1904 <usb_isr+0x928>
			epconf = *cfg++;
    1704:	78e2      	ldrb	r2, [r4, #3]
			*reg = epconf;
    1706:	4996      	ldr	r1, [pc, #600]	; (1960 <usb_isr+0x984>)
			table[index(i, TX, EVEN)].desc = 0;
    1708:	4c96      	ldr	r4, [pc, #600]	; (1964 <usb_isr+0x988>)
			*reg = epconf;
    170a:	700a      	strb	r2, [r1, #0]
			table[index(i, TX, EVEN)].desc = 0;
    170c:	2100      	movs	r1, #0
			if (epconf & USB_ENDPT_EPRXEN) {
    170e:	0712      	lsls	r2, r2, #28
			table[index(i, TX, EVEN)].desc = 0;
    1710:	f8c9 1070 	str.w	r1, [r9, #112]	; 0x70
			table[index(i, TX, ODD)].desc = 0;
    1714:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
			if (epconf & USB_ENDPT_EPRXEN) {
    1718:	f100 80b0 	bmi.w	187c <usb_isr+0x8a0>
    171c:	7833      	ldrb	r3, [r6, #0]
    171e:	9301      	str	r3, [sp, #4]
			table[index(i, TX, EVEN)].desc = 0;
    1720:	2100      	movs	r1, #0
    1722:	f083 0201 	eor.w	r2, r3, #1
    1726:	f8c9 1090 	str.w	r1, [r9, #144]	; 0x90
			table[index(i, TX, ODD)].desc = 0;
    172a:	f8c9 1098 	str.w	r1, [r9, #152]	; 0x98
    172e:	e6d0      	b.n	14d2 <usb_isr+0x4f6>
				tx_state[i] = TX_STATE_BOTH_FREE_EVEN_FIRST;
    1730:	f04f 0300 	mov.w	r3, #0
    1734:	f888 3000 	strb.w	r3, [r8]
    1738:	e7b3      	b.n	16a2 <usb_isr+0x6c6>
    173a:	88a9      	ldrh	r1, [r5, #4]
    173c:	f001 017f 	and.w	r1, r1, #127	; 0x7f
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1740:	2904      	cmp	r1, #4
    1742:	f240 808d 	bls.w	1860 <usb_isr+0x884>
	USB0_ENDPT0 = USB_ENDPT_EPSTALL | USB_ENDPT_EPRXEN | USB_ENDPT_EPTXEN | USB_ENDPT_EPHSHK;
    1746:	4a7f      	ldr	r2, [pc, #508]	; (1944 <usb_isr+0x968>)
    1748:	230f      	movs	r3, #15
    174a:	7013      	strb	r3, [r2, #0]
		USB0_CTL = USB_CTL_USBENSOFEN; // clear TXSUSPENDTOKENBUSY bit
    174c:	4a86      	ldr	r2, [pc, #536]	; (1968 <usb_isr+0x98c>)
    174e:	2301      	movs	r3, #1
    1750:	7013      	strb	r3, [r2, #0]
    1752:	e552      	b.n	11fa <usb_isr+0x21e>
	if (size > EP0_SIZE) size = EP0_SIZE;
    1754:	2840      	cmp	r0, #64	; 0x40
    1756:	f67f aee2 	bls.w	151e <usb_isr+0x542>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    175a:	f044 0402 	orr.w	r4, r4, #2
    175e:	eb0e 01c4 	add.w	r1, lr, r4, lsl #3
    1762:	9e02      	ldr	r6, [sp, #8]
    1764:	604e      	str	r6, [r1, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1766:	b1ba      	cbz	r2, 1798 <usb_isr+0x7bc>
	ep0_tx_data_toggle ^= 1;
    1768:	f89d 1004 	ldrb.w	r1, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    176c:	4a7f      	ldr	r2, [pc, #508]	; (196c <usb_isr+0x990>)
	ep0_tx_data_toggle ^= 1;
    176e:	7019      	strb	r1, [r3, #0]
	data += size;
    1770:	4633      	mov	r3, r6
    1772:	3840      	subs	r0, #64	; 0x40
	ep0_tx_bdt_bank ^= 1;
    1774:	f888 5000 	strb.w	r5, [r8]
	data += size;
    1778:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    177a:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    177e:	e6e7      	b.n	1550 <usb_isr+0x574>
	ep0_tx_data_toggle ^= 1;
    1780:	f89d 3004 	ldrb.w	r3, [sp, #4]
    1784:	7033      	strb	r3, [r6, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1786:	0402      	lsls	r2, r0, #16
	data += size;
    1788:	9b02      	ldr	r3, [sp, #8]
	ep0_tx_bdt_bank ^= 1;
    178a:	700d      	strb	r5, [r1, #0]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    178c:	f042 02c8 	orr.w	r2, r2, #200	; 0xc8
	data += size;
    1790:	4403      	add	r3, r0
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1792:	f84e 203c 	str.w	r2, [lr, ip, lsl #3]
    1796:	e6d8      	b.n	154a <usb_isr+0x56e>
	ep0_tx_data_toggle ^= 1;
    1798:	f89d 1004 	ldrb.w	r1, [sp, #4]
    179c:	7019      	strb	r1, [r3, #0]
	data += size;
    179e:	9b02      	ldr	r3, [sp, #8]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    17a0:	4a73      	ldr	r2, [pc, #460]	; (1970 <usb_isr+0x994>)
	ep0_tx_bdt_bank ^= 1;
    17a2:	f888 5000 	strb.w	r5, [r8]
    17a6:	3840      	subs	r0, #64	; 0x40
	data += size;
    17a8:	3340      	adds	r3, #64	; 0x40
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    17aa:	f84e 2034 	str.w	r2, [lr, r4, lsl #3]
    17ae:	e6cf      	b.n	1550 <usb_isr+0x574>
						tx_state[endpoint] = ((uint32_t)b & 8) ?
    17b0:	f019 0f08 	tst.w	r9, #8
    17b4:	bf0c      	ite	eq
    17b6:	2302      	moveq	r3, #2
    17b8:	2303      	movne	r3, #3
    17ba:	558b      	strb	r3, [r1, r6]
						break;
    17bc:	e458      	b.n	1070 <usb_isr+0x94>
			if (usb_cdc_line_coding[0] == 134) usb_reboot_timer = 15;
    17be:	4a6d      	ldr	r2, [pc, #436]	; (1974 <usb_isr+0x998>)
    17c0:	210f      	movs	r1, #15
    17c2:	7011      	strb	r1, [r2, #0]
    17c4:	e660      	b.n	1488 <usb_isr+0x4ac>
			if (list->addr == NULL) break;
    17c6:	4a6c      	ldr	r2, [pc, #432]	; (1978 <usb_isr+0x99c>)
    17c8:	6854      	ldr	r4, [r2, #4]
    17ca:	2c00      	cmp	r4, #0
    17cc:	d0bb      	beq.n	1746 <usb_isr+0x76a>
    17ce:	8868      	ldrh	r0, [r5, #2]
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    17d0:	f8b5 e004 	ldrh.w	lr, [r5, #4]
    17d4:	e003      	b.n	17de <usb_isr+0x802>
		for (list = usb_descriptor_list; 1; list++) {
    17d6:	320c      	adds	r2, #12
			if (list->addr == NULL) break;
    17d8:	6854      	ldr	r4, [r2, #4]
    17da:	2c00      	cmp	r4, #0
    17dc:	d0b3      	beq.n	1746 <usb_isr+0x76a>
			if (setup.wValue == list->wValue && setup.wIndex == list->wIndex) {
    17de:	8813      	ldrh	r3, [r2, #0]
    17e0:	4283      	cmp	r3, r0
    17e2:	d1f8      	bne.n	17d6 <usb_isr+0x7fa>
    17e4:	8853      	ldrh	r3, [r2, #2]
    17e6:	4573      	cmp	r3, lr
    17e8:	d1f5      	bne.n	17d6 <usb_isr+0x7fa>
				if ((setup.wValue >> 8) == 3) {
    17ea:	0a00      	lsrs	r0, r0, #8
    17ec:	2803      	cmp	r0, #3
					datalen = *(list->addr);
    17ee:	bf0c      	ite	eq
    17f0:	f894 e000 	ldrbeq.w	lr, [r4]
					datalen = list->length;
    17f4:	f8b2 e008 	ldrhne.w	lr, [r2, #8]
    17f8:	e003      	b.n	1802 <usb_isr+0x826>
		reply_buffer[0] = usb_configuration;
    17fa:	4a60      	ldr	r2, [pc, #384]	; (197c <usb_isr+0x9a0>)
    17fc:	4c60      	ldr	r4, [pc, #384]	; (1980 <usb_isr+0x9a4>)
    17fe:	7812      	ldrb	r2, [r2, #0]
    1800:	7022      	strb	r2, [r4, #0]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1802:	88e8      	ldrh	r0, [r5, #6]
    1804:	4570      	cmp	r0, lr
    1806:	f080 8131 	bcs.w	1a6c <usb_isr+0xa90>
	table[index(0, TX, ep0_tx_bdt_bank)].addr = (void *)data;
    180a:	495e      	ldr	r1, [pc, #376]	; (1984 <usb_isr+0x9a8>)
    180c:	780d      	ldrb	r5, [r1, #0]
    180e:	2840      	cmp	r0, #64	; 0x40
    1810:	4684      	mov	ip, r0
    1812:	f045 0e02 	orr.w	lr, r5, #2
    1816:	bf28      	it	cs
    1818:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    181c:	eb04 030c 	add.w	r3, r4, ip
    1820:	eb09 02ce 	add.w	r2, r9, lr, lsl #3
    1824:	9302      	str	r3, [sp, #8]
    1826:	2301      	movs	r3, #1
    1828:	6054      	str	r4, [r2, #4]
    182a:	ebcc 0000 	rsb	r0, ip, r0
    182e:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1832:	2200      	movs	r2, #0
    1834:	9301      	str	r3, [sp, #4]
	table[index(0, TX, ep0_tx_bdt_bank)].desc = BDT_DESC(len, ep0_tx_data_toggle);
    1836:	24c8      	movs	r4, #200	; 0xc8
    1838:	e65e      	b.n	14f8 <usb_isr+0x51c>
		reply_buffer[0] = 0;
    183a:	4c51      	ldr	r4, [pc, #324]	; (1980 <usb_isr+0x9a4>)
		datalen = 2;
    183c:	f04f 0e02 	mov.w	lr, #2
		reply_buffer[0] = 0;
    1840:	7022      	strb	r2, [r4, #0]
		reply_buffer[1] = 0;
    1842:	7062      	strb	r2, [r4, #1]
    1844:	e7dd      	b.n	1802 <usb_isr+0x826>
	switch (setup.wRequestAndType) {
    1846:	f5b1 6fa0 	cmp.w	r1, #1280	; 0x500
    184a:	f47f af7c 	bne.w	1746 <usb_isr+0x76a>
    184e:	2301      	movs	r3, #1
    1850:	2200      	movs	r2, #0
    1852:	9301      	str	r3, [sp, #4]
    1854:	e63d      	b.n	14d2 <usb_isr+0x4f6>
    1856:	f242 3221 	movw	r2, #8993	; 0x2321
    185a:	4291      	cmp	r1, r2
    185c:	d0f7      	beq.n	184e <usb_isr+0x872>
    185e:	e772      	b.n	1746 <usb_isr+0x76a>
		if (i > NUM_ENDPOINTS || setup.wValue != 0) {
    1860:	886a      	ldrh	r2, [r5, #2]
    1862:	2a00      	cmp	r2, #0
    1864:	f47f af6f 	bne.w	1746 <usb_isr+0x76a>
		(*(uint8_t *)(&USB0_ENDPT0 + i * 4)) &= ~0x02;
    1868:	4836      	ldr	r0, [pc, #216]	; (1944 <usb_isr+0x968>)
    186a:	f8cd e004 	str.w	lr, [sp, #4]
    186e:	0089      	lsls	r1, r1, #2
    1870:	4408      	add	r0, r1
    1872:	7801      	ldrb	r1, [r0, #0]
    1874:	f021 0102 	bic.w	r1, r1, #2
    1878:	7001      	strb	r1, [r0, #0]
    187a:	e62a      	b.n	14d2 <usb_isr+0x4f6>
				p = usb_malloc();
    187c:	f000 f98a 	bl	1b94 <usb_malloc>
				if (p) {
    1880:	2800      	cmp	r0, #0
    1882:	f000 80e6 	beq.w	1a52 <usb_isr+0xa76>
					table[index(i, RX, EVEN)].addr = p->buf;
    1886:	3008      	adds	r0, #8
    1888:	f8c4 0084 	str.w	r0, [r4, #132]	; 0x84
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    188c:	4838      	ldr	r0, [pc, #224]	; (1970 <usb_isr+0x994>)
    188e:	f8c9 0080 	str.w	r0, [r9, #128]	; 0x80
				p = usb_malloc();
    1892:	f000 f97f 	bl	1b94 <usb_malloc>
    1896:	4a33      	ldr	r2, [pc, #204]	; (1964 <usb_isr+0x988>)
				if (p) {
    1898:	2800      	cmp	r0, #0
    189a:	f000 80d4 	beq.w	1a46 <usb_isr+0xa6a>
					table[index(i, RX, ODD)].addr = p->buf;
    189e:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18a0:	4932      	ldr	r1, [pc, #200]	; (196c <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    18a2:	f8c2 008c 	str.w	r0, [r2, #140]	; 0x8c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18a6:	f8c2 1088 	str.w	r1, [r2, #136]	; 0x88
    18aa:	e737      	b.n	171c <usb_isr+0x740>
				p = usb_malloc();
    18ac:	f000 f972 	bl	1b94 <usb_malloc>
				if (p) {
    18b0:	2800      	cmp	r0, #0
    18b2:	f000 80bb 	beq.w	1a2c <usb_isr+0xa50>
					table[index(i, RX, EVEN)].addr = p->buf;
    18b6:	3008      	adds	r0, #8
    18b8:	f8c8 0044 	str.w	r0, [r8, #68]	; 0x44
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    18bc:	482c      	ldr	r0, [pc, #176]	; (1970 <usb_isr+0x994>)
    18be:	f8c9 0040 	str.w	r0, [r9, #64]	; 0x40
				p = usb_malloc();
    18c2:	f000 f967 	bl	1b94 <usb_malloc>
    18c6:	4a27      	ldr	r2, [pc, #156]	; (1964 <usb_isr+0x988>)
				if (p) {
    18c8:	2800      	cmp	r0, #0
    18ca:	f000 80aa 	beq.w	1a22 <usb_isr+0xa46>
					table[index(i, RX, ODD)].addr = p->buf;
    18ce:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18d0:	4926      	ldr	r1, [pc, #152]	; (196c <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    18d2:	64d0      	str	r0, [r2, #76]	; 0x4c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18d4:	6491      	str	r1, [r2, #72]	; 0x48
    18d6:	e708      	b.n	16ea <usb_isr+0x70e>
				p = usb_malloc();
    18d8:	f000 f95c 	bl	1b94 <usb_malloc>
				if (p) {
    18dc:	2800      	cmp	r0, #0
    18de:	f000 80c1 	beq.w	1a64 <usb_isr+0xa88>
					table[index(i, RX, EVEN)].addr = p->buf;
    18e2:	3008      	adds	r0, #8
    18e4:	f8c9 0024 	str.w	r0, [r9, #36]	; 0x24
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    18e8:	4821      	ldr	r0, [pc, #132]	; (1970 <usb_isr+0x994>)
    18ea:	f8c9 0020 	str.w	r0, [r9, #32]
				p = usb_malloc();
    18ee:	f000 f951 	bl	1b94 <usb_malloc>
    18f2:	4a1c      	ldr	r2, [pc, #112]	; (1964 <usb_isr+0x988>)
				if (p) {
    18f4:	2800      	cmp	r0, #0
    18f6:	f000 80b0 	beq.w	1a5a <usb_isr+0xa7e>
					table[index(i, RX, ODD)].addr = p->buf;
    18fa:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    18fc:	491b      	ldr	r1, [pc, #108]	; (196c <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    18fe:	62d0      	str	r0, [r2, #44]	; 0x2c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1900:	6291      	str	r1, [r2, #40]	; 0x28
    1902:	e6e4      	b.n	16ce <usb_isr+0x6f2>
				p = usb_malloc();
    1904:	f000 f946 	bl	1b94 <usb_malloc>
				if (p) {
    1908:	2800      	cmp	r0, #0
    190a:	f000 8098 	beq.w	1a3e <usb_isr+0xa62>
					table[index(i, RX, EVEN)].addr = p->buf;
    190e:	3008      	adds	r0, #8
    1910:	f8c8 0064 	str.w	r0, [r8, #100]	; 0x64
					table[index(i, RX, EVEN)].desc = BDT_DESC(64, 0);
    1914:	4816      	ldr	r0, [pc, #88]	; (1970 <usb_isr+0x994>)
    1916:	f8c9 0060 	str.w	r0, [r9, #96]	; 0x60
				p = usb_malloc();
    191a:	f000 f93b 	bl	1b94 <usb_malloc>
    191e:	4a11      	ldr	r2, [pc, #68]	; (1964 <usb_isr+0x988>)
				if (p) {
    1920:	2800      	cmp	r0, #0
    1922:	f000 8087 	beq.w	1a34 <usb_isr+0xa58>
					table[index(i, RX, ODD)].addr = p->buf;
    1926:	3008      	adds	r0, #8
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    1928:	4910      	ldr	r1, [pc, #64]	; (196c <usb_isr+0x990>)
					table[index(i, RX, ODD)].addr = p->buf;
    192a:	66d0      	str	r0, [r2, #108]	; 0x6c
					table[index(i, RX, ODD)].desc = BDT_DESC(64, 1);
    192c:	6691      	str	r1, [r2, #104]	; 0x68
    192e:	e6e9      	b.n	1704 <usb_isr+0x728>
				usb_free((usb_packet_t *)((uint8_t *)(table[i].addr) - 8));
    1930:	6bc8      	ldr	r0, [r1, #60]	; 0x3c
    1932:	3808      	subs	r0, #8
    1934:	f000 f94e 	bl	1bd4 <usb_free>
    1938:	e506      	b.n	1348 <usb_isr+0x36c>
    193a:	6b48      	ldr	r0, [r1, #52]	; 0x34
    193c:	3808      	subs	r0, #8
    193e:	f000 f949 	bl	1bd4 <usb_free>
    1942:	e4fb      	b.n	133c <usb_isr+0x360>
    1944:	400720c0 	.word	0x400720c0
    1948:	40072080 	.word	0x40072080
    194c:	00003324 	.word	0x00003324
    1950:	400720c4 	.word	0x400720c4
    1954:	1fff93b1 	.word	0x1fff93b1
    1958:	400720c8 	.word	0x400720c8
    195c:	400720cc 	.word	0x400720cc
    1960:	400720d0 	.word	0x400720d0
    1964:	1fff8000 	.word	0x1fff8000
    1968:	40072094 	.word	0x40072094
    196c:	004000c8 	.word	0x004000c8
    1970:	00400088 	.word	0x00400088
    1974:	1fff9345 	.word	0x1fff9345
    1978:	00003328 	.word	0x00003328
    197c:	1fff93bc 	.word	0x1fff93bc
    1980:	1fff93b4 	.word	0x1fff93b4
    1984:	1fff93b0 	.word	0x1fff93b0
    1988:	6ac8      	ldr	r0, [r1, #44]	; 0x2c
    198a:	3808      	subs	r0, #8
    198c:	f000 f922 	bl	1bd4 <usb_free>
    1990:	e4ce      	b.n	1330 <usb_isr+0x354>
    1992:	6a60      	ldr	r0, [r4, #36]	; 0x24
    1994:	3808      	subs	r0, #8
    1996:	f000 f91d 	bl	1bd4 <usb_free>
    199a:	e4c3      	b.n	1324 <usb_isr+0x348>
    199c:	6fc8      	ldr	r0, [r1, #124]	; 0x7c
    199e:	3808      	subs	r0, #8
    19a0:	f000 f918 	bl	1bd4 <usb_free>
    19a4:	e500      	b.n	13a8 <usb_isr+0x3cc>
    19a6:	6f48      	ldr	r0, [r1, #116]	; 0x74
    19a8:	3808      	subs	r0, #8
    19aa:	f000 f913 	bl	1bd4 <usb_free>
    19ae:	e4f5      	b.n	139c <usb_isr+0x3c0>
    19b0:	6ec8      	ldr	r0, [r1, #108]	; 0x6c
    19b2:	3808      	subs	r0, #8
    19b4:	f000 f90e 	bl	1bd4 <usb_free>
    19b8:	e4ea      	b.n	1390 <usb_isr+0x3b4>
    19ba:	6e48      	ldr	r0, [r1, #100]	; 0x64
    19bc:	3808      	subs	r0, #8
    19be:	f000 f909 	bl	1bd4 <usb_free>
    19c2:	e4df      	b.n	1384 <usb_isr+0x3a8>
    19c4:	6dc8      	ldr	r0, [r1, #92]	; 0x5c
    19c6:	3808      	subs	r0, #8
    19c8:	f000 f904 	bl	1bd4 <usb_free>
    19cc:	e4d4      	b.n	1378 <usb_isr+0x39c>
    19ce:	6d48      	ldr	r0, [r1, #84]	; 0x54
    19d0:	3808      	subs	r0, #8
    19d2:	f000 f8ff 	bl	1bd4 <usb_free>
    19d6:	e4c9      	b.n	136c <usb_isr+0x390>
    19d8:	6cc8      	ldr	r0, [r1, #76]	; 0x4c
    19da:	3808      	subs	r0, #8
    19dc:	f000 f8fa 	bl	1bd4 <usb_free>
    19e0:	e4be      	b.n	1360 <usb_isr+0x384>
    19e2:	6c48      	ldr	r0, [r1, #68]	; 0x44
    19e4:	3808      	subs	r0, #8
    19e6:	f000 f8f5 	bl	1bd4 <usb_free>
    19ea:	e4b3      	b.n	1354 <usb_isr+0x378>
    19ec:	f8d1 009c 	ldr.w	r0, [r1, #156]	; 0x9c
    19f0:	3808      	subs	r0, #8
    19f2:	f000 f8ef 	bl	1bd4 <usb_free>
    19f6:	e4ef      	b.n	13d8 <usb_isr+0x3fc>
    19f8:	f8d1 0094 	ldr.w	r0, [r1, #148]	; 0x94
    19fc:	3808      	subs	r0, #8
    19fe:	f000 f8e9 	bl	1bd4 <usb_free>
    1a02:	e4e3      	b.n	13cc <usb_isr+0x3f0>
    1a04:	f8d1 008c 	ldr.w	r0, [r1, #140]	; 0x8c
    1a08:	3808      	subs	r0, #8
    1a0a:	f000 f8e3 	bl	1bd4 <usb_free>
    1a0e:	e4d7      	b.n	13c0 <usb_isr+0x3e4>
    1a10:	f8d1 0084 	ldr.w	r0, [r1, #132]	; 0x84
    1a14:	3808      	subs	r0, #8
    1a16:	f000 f8dd 	bl	1bd4 <usb_free>
    1a1a:	e4cb      	b.n	13b4 <usb_isr+0x3d8>
		datalen = 2;
    1a1c:	f04f 0e02 	mov.w	lr, #2
    1a20:	e6ef      	b.n	1802 <usb_isr+0x826>
					usb_rx_memory_needed++;
    1a22:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a24:	6490      	str	r0, [r2, #72]	; 0x48
					usb_rx_memory_needed++;
    1a26:	1c4a      	adds	r2, r1, #1
    1a28:	702a      	strb	r2, [r5, #0]
    1a2a:	e65e      	b.n	16ea <usb_isr+0x70e>
					usb_rx_memory_needed++;
    1a2c:	782a      	ldrb	r2, [r5, #0]
    1a2e:	3201      	adds	r2, #1
    1a30:	702a      	strb	r2, [r5, #0]
    1a32:	e744      	b.n	18be <usb_isr+0x8e2>
					usb_rx_memory_needed++;
    1a34:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a36:	6690      	str	r0, [r2, #104]	; 0x68
					usb_rx_memory_needed++;
    1a38:	1c4a      	adds	r2, r1, #1
    1a3a:	702a      	strb	r2, [r5, #0]
    1a3c:	e662      	b.n	1704 <usb_isr+0x728>
					usb_rx_memory_needed++;
    1a3e:	782a      	ldrb	r2, [r5, #0]
    1a40:	3201      	adds	r2, #1
    1a42:	702a      	strb	r2, [r5, #0]
    1a44:	e767      	b.n	1916 <usb_isr+0x93a>
					usb_rx_memory_needed++;
    1a46:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a48:	f8c2 0088 	str.w	r0, [r2, #136]	; 0x88
					usb_rx_memory_needed++;
    1a4c:	1c4a      	adds	r2, r1, #1
    1a4e:	702a      	strb	r2, [r5, #0]
    1a50:	e664      	b.n	171c <usb_isr+0x740>
					usb_rx_memory_needed++;
    1a52:	782a      	ldrb	r2, [r5, #0]
    1a54:	3201      	adds	r2, #1
    1a56:	702a      	strb	r2, [r5, #0]
    1a58:	e719      	b.n	188e <usb_isr+0x8b2>
					usb_rx_memory_needed++;
    1a5a:	7829      	ldrb	r1, [r5, #0]
					table[index(i, RX, ODD)].desc = 0;
    1a5c:	6290      	str	r0, [r2, #40]	; 0x28
					usb_rx_memory_needed++;
    1a5e:	1c4a      	adds	r2, r1, #1
    1a60:	702a      	strb	r2, [r5, #0]
    1a62:	e634      	b.n	16ce <usb_isr+0x6f2>
					usb_rx_memory_needed++;
    1a64:	782a      	ldrb	r2, [r5, #0]
    1a66:	3201      	adds	r2, #1
    1a68:	702a      	strb	r2, [r5, #0]
    1a6a:	e73e      	b.n	18ea <usb_isr+0x90e>
    1a6c:	f1be 0f40 	cmp.w	lr, #64	; 0x40
    1a70:	46f4      	mov	ip, lr
    1a72:	bf28      	it	cs
    1a74:	f04f 0c40 	movcs.w	ip, #64	; 0x40
    1a78:	eb04 030c 	add.w	r3, r4, ip
    1a7c:	9302      	str	r3, [sp, #8]
	if (datalen > setup.wLength) datalen = setup.wLength;
    1a7e:	2301      	movs	r3, #1
    1a80:	ebcc 000e 	rsb	r0, ip, lr
    1a84:	ea4f 480c 	mov.w	r8, ip, lsl #16
    1a88:	2200      	movs	r2, #0
    1a8a:	9301      	str	r3, [sp, #4]
    1a8c:	e526      	b.n	14dc <usb_isr+0x500>
    1a8e:	bf00      	nop

00001a90 <usb_init>:



void usb_init(void)
{
    1a90:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	int i;

	//serial_begin(BAUD2DIV(115200));
	//serial_print("usb_init\n");

	usb_init_serialnumber();
    1a92:	f000 fe59 	bl	2748 <usb_init_serialnumber>

	for (i=0; i <= NUM_ENDPOINTS*4; i++) {
		table[i].desc = 0;
    1a96:	4b29      	ldr	r3, [pc, #164]	; (1b3c <usb_init+0xac>)
	// this basically follows the flowchart in the Kinetis
	// Quick Reference User Guide, Rev. 1, 03/2012, page 141

	// assume 48 MHz clock already running
	// SIM - enable clock
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1a98:	4829      	ldr	r0, [pc, #164]	; (1b40 <usb_init+0xb0>)
	// reset USB module
	//USB0_USBTRC0 = USB_USBTRC_USBRESET;
	//while ((USB0_USBTRC0 & USB_USBTRC_USBRESET) != 0) ; // wait for reset to end

	// set desc table base addr
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1a9a:	4c2a      	ldr	r4, [pc, #168]	; (1b44 <usb_init+0xb4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1a9c:	4f2a      	ldr	r7, [pc, #168]	; (1b48 <usb_init+0xb8>)
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1a9e:	4d2b      	ldr	r5, [pc, #172]	; (1b4c <usb_init+0xbc>)

	// clear all ISR flags
	USB0_ISTAT = 0xFF;
    1aa0:	f8df c0bc 	ldr.w	ip, [pc, #188]	; 1b60 <usb_init+0xd0>
	USB0_ERRSTAT = 0xFF;
    1aa4:	f8df e0bc 	ldr.w	lr, [pc, #188]	; 1b64 <usb_init+0xd4>
	USB0_OTGISTAT = 0xFF;

	//USB0_USBTRC0 |= 0x40; // undocumented bit

	// enable USB
	USB0_CTL = USB_CTL_USBENSOFEN;
    1aa8:	4e29      	ldr	r6, [pc, #164]	; (1b50 <usb_init+0xc0>)
		table[i].desc = 0;
    1aaa:	2200      	movs	r2, #0
    1aac:	601a      	str	r2, [r3, #0]
		table[i].addr = 0;
    1aae:	605a      	str	r2, [r3, #4]
		table[i].desc = 0;
    1ab0:	609a      	str	r2, [r3, #8]
		table[i].addr = 0;
    1ab2:	60da      	str	r2, [r3, #12]
		table[i].desc = 0;
    1ab4:	611a      	str	r2, [r3, #16]
		table[i].addr = 0;
    1ab6:	615a      	str	r2, [r3, #20]
		table[i].desc = 0;
    1ab8:	619a      	str	r2, [r3, #24]
		table[i].addr = 0;
    1aba:	61da      	str	r2, [r3, #28]
		table[i].desc = 0;
    1abc:	621a      	str	r2, [r3, #32]
		table[i].addr = 0;
    1abe:	625a      	str	r2, [r3, #36]	; 0x24
		table[i].desc = 0;
    1ac0:	629a      	str	r2, [r3, #40]	; 0x28
		table[i].addr = 0;
    1ac2:	62da      	str	r2, [r3, #44]	; 0x2c
		table[i].desc = 0;
    1ac4:	631a      	str	r2, [r3, #48]	; 0x30
		table[i].addr = 0;
    1ac6:	635a      	str	r2, [r3, #52]	; 0x34
		table[i].desc = 0;
    1ac8:	639a      	str	r2, [r3, #56]	; 0x38
		table[i].addr = 0;
    1aca:	63da      	str	r2, [r3, #60]	; 0x3c
		table[i].desc = 0;
    1acc:	641a      	str	r2, [r3, #64]	; 0x40
		table[i].addr = 0;
    1ace:	645a      	str	r2, [r3, #68]	; 0x44
		table[i].desc = 0;
    1ad0:	649a      	str	r2, [r3, #72]	; 0x48
		table[i].addr = 0;
    1ad2:	64da      	str	r2, [r3, #76]	; 0x4c
		table[i].desc = 0;
    1ad4:	651a      	str	r2, [r3, #80]	; 0x50
		table[i].addr = 0;
    1ad6:	655a      	str	r2, [r3, #84]	; 0x54
		table[i].desc = 0;
    1ad8:	659a      	str	r2, [r3, #88]	; 0x58
		table[i].addr = 0;
    1ada:	65da      	str	r2, [r3, #92]	; 0x5c
		table[i].desc = 0;
    1adc:	661a      	str	r2, [r3, #96]	; 0x60
		table[i].addr = 0;
    1ade:	665a      	str	r2, [r3, #100]	; 0x64
		table[i].desc = 0;
    1ae0:	669a      	str	r2, [r3, #104]	; 0x68
		table[i].addr = 0;
    1ae2:	66da      	str	r2, [r3, #108]	; 0x6c
		table[i].desc = 0;
    1ae4:	671a      	str	r2, [r3, #112]	; 0x70
		table[i].addr = 0;
    1ae6:	675a      	str	r2, [r3, #116]	; 0x74
		table[i].desc = 0;
    1ae8:	679a      	str	r2, [r3, #120]	; 0x78
		table[i].addr = 0;
    1aea:	67da      	str	r2, [r3, #124]	; 0x7c
		table[i].desc = 0;
    1aec:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1af0:	6801      	ldr	r1, [r0, #0]
		table[i].addr = 0;
    1af2:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
	SIM_SCGC4 |= SIM_SCGC4_USBOTG;
    1af6:	f441 2180 	orr.w	r1, r1, #262144	; 0x40000
    1afa:	6001      	str	r1, [r0, #0]
	USB0_BDTPAGE1 = ((uint32_t)table) >> 8;
    1afc:	f3c3 2107 	ubfx	r1, r3, #8, #8
    1b00:	7021      	strb	r1, [r4, #0]
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1b02:	f3c3 4007 	ubfx	r0, r3, #16, #8
	USB0_OTGISTAT = 0xFF;
    1b06:	4913      	ldr	r1, [pc, #76]	; (1b54 <usb_init+0xc4>)
	USB0_BDTPAGE2 = ((uint32_t)table) >> 16;
    1b08:	7038      	strb	r0, [r7, #0]
	USB0_BDTPAGE3 = ((uint32_t)table) >> 24;
    1b0a:	0e1b      	lsrs	r3, r3, #24
    1b0c:	702b      	strb	r3, [r5, #0]
	USB0_ISTAT = 0xFF;
    1b0e:	23ff      	movs	r3, #255	; 0xff
    1b10:	f88c 3000 	strb.w	r3, [ip]

	// enable reset interrupt
	USB0_INTEN = USB_INTEN_USBRSTEN;

	// enable interrupt in NVIC...
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1b14:	4d10      	ldr	r5, [pc, #64]	; (1b58 <usb_init+0xc8>)
	USB0_ERRSTAT = 0xFF;
    1b16:	f88e 3000 	strb.w	r3, [lr]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1b1a:	4810      	ldr	r0, [pc, #64]	; (1b5c <usb_init+0xcc>)
	USB0_OTGISTAT = 0xFF;
    1b1c:	700b      	strb	r3, [r1, #0]
	USB0_CTL = USB_CTL_USBENSOFEN;
    1b1e:	2301      	movs	r3, #1
    1b20:	7033      	strb	r3, [r6, #0]
	USB0_USBCTRL = 0;
    1b22:	f884 2064 	strb.w	r2, [r4, #100]	; 0x64
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1b26:	2670      	movs	r6, #112	; 0x70
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1b28:	f44f 7400 	mov.w	r4, #512	; 0x200

	// enable d+ pullup
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1b2c:	2210      	movs	r2, #16
	USB0_INTEN = USB_INTEN_USBRSTEN;
    1b2e:	f807 3c2c 	strb.w	r3, [r7, #-44]
	NVIC_SET_PRIORITY(IRQ_USBOTG, 112);
    1b32:	702e      	strb	r6, [r5, #0]
	NVIC_ENABLE_IRQ(IRQ_USBOTG);
    1b34:	6004      	str	r4, [r0, #0]
	USB0_CONTROL = USB_CONTROL_DPPULLUPNONOTG;
    1b36:	f881 20f8 	strb.w	r2, [r1, #248]	; 0xf8
    1b3a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1b3c:	1fff8000 	.word	0x1fff8000
    1b40:	40048034 	.word	0x40048034
    1b44:	4007209c 	.word	0x4007209c
    1b48:	400720b0 	.word	0x400720b0
    1b4c:	400720b4 	.word	0x400720b4
    1b50:	40072094 	.word	0x40072094
    1b54:	40072010 	.word	0x40072010
    1b58:	e000e449 	.word	0xe000e449
    1b5c:	e000e108 	.word	0xe000e108
    1b60:	40072080 	.word	0x40072080
    1b64:	40072088 	.word	0x40072088

00001b68 <usb_serial_class::clear()>:
        virtual void clear(void) { usb_serial_flush_input(); }
    1b68:	f000 b8a4 	b.w	1cb4 <usb_serial_flush_input>

00001b6c <usb_serial_class::peek()>:
        virtual int peek() { return usb_serial_peekchar(); }
    1b6c:	f000 b87c 	b.w	1c68 <usb_serial_peekchar>

00001b70 <usb_serial_class::read()>:
        virtual int read() { return usb_serial_getchar(); }
    1b70:	f000 b856 	b.w	1c20 <usb_serial_getchar>

00001b74 <usb_serial_class::available()>:
        virtual int available() { return usb_serial_available(); }
    1b74:	f000 b890 	b.w	1c98 <usb_serial_available>

00001b78 <usb_serial_class::flush()>:
        virtual void flush() { usb_serial_flush_output(); }  // TODO: actually wait for data to leave USB...
    1b78:	f000 b9bc 	b.w	1ef4 <usb_serial_flush_output>

00001b7c <usb_serial_class::availableForWrite()>:
	size_t write(unsigned long n) { return write((uint8_t)n); }
	size_t write(long n) { return write((uint8_t)n); }
	size_t write(unsigned int n) { return write((uint8_t)n); }
	size_t write(int n) { return write((uint8_t)n); }
	virtual int availableForWrite() { return usb_serial_write_buffer_free(); }
    1b7c:	f000 b996 	b.w	1eac <usb_serial_write_buffer_free>

00001b80 <usb_serial_class::write(unsigned char const*, unsigned int)>:
        virtual size_t write(const uint8_t *buffer, size_t size) { return usb_serial_write(buffer, size); }
    1b80:	4608      	mov	r0, r1
    1b82:	4611      	mov	r1, r2
    1b84:	f000 b8b2 	b.w	1cec <usb_serial_write>

00001b88 <usb_serial_class::write(unsigned char)>:
        virtual size_t write(uint8_t c) { return usb_serial_putchar(c); }
    1b88:	4608      	mov	r0, r1
    1b8a:	f000 b983 	b.w	1e94 <usb_serial_putchar>
    1b8e:	bf00      	nop

00001b90 <serialEvent()>:
#endif

#endif // F_CPU

void serialEvent() __attribute__((weak));
void serialEvent() {}
    1b90:	4770      	bx	lr
    1b92:	bf00      	nop

00001b94 <usb_malloc>:
usb_packet_t * usb_malloc(void)
{
	unsigned int n, avail;
	uint8_t *p;

	__disable_irq();
    1b94:	b672      	cpsid	i
	avail = usb_buffer_available;
    1b96:	480d      	ldr	r0, [pc, #52]	; (1bcc <usb_malloc+0x38>)
    1b98:	6802      	ldr	r2, [r0, #0]
	n = __builtin_clz(avail); // clz = count leading zeros
    1b9a:	fab2 f382 	clz	r3, r2
	if (n >= NUM_USB_BUFFERS) {
    1b9e:	2b0b      	cmp	r3, #11
    1ba0:	dc10      	bgt.n	1bc4 <usb_malloc+0x30>
	}
	//serial_print("malloc:");
	//serial_phex(n);
	//serial_print("\n");

	usb_buffer_available = avail & ~(0x80000000 >> n);
    1ba2:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1ba6:	40d9      	lsrs	r1, r3
    1ba8:	ea22 0201 	bic.w	r2, r2, r1
    1bac:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1bae:	b662      	cpsie	i
	p = usb_buffer_memory + (n * sizeof(usb_packet_t));
    1bb0:	4807      	ldr	r0, [pc, #28]	; (1bd0 <usb_malloc+0x3c>)
    1bb2:	eb03 03c3 	add.w	r3, r3, r3, lsl #3
    1bb6:	00db      	lsls	r3, r3, #3
    1bb8:	18c2      	adds	r2, r0, r3
	//serial_print("malloc:");
	//serial_phex32((int)p);
	//serial_print("\n");
	*(uint32_t *)p = 0;
    1bba:	2100      	movs	r1, #0
    1bbc:	50c1      	str	r1, [r0, r3]
	*(uint32_t *)(p + 4) = 0;
	return (usb_packet_t *)p;
    1bbe:	4610      	mov	r0, r2
	*(uint32_t *)(p + 4) = 0;
    1bc0:	6051      	str	r1, [r2, #4]
}
    1bc2:	4770      	bx	lr
		__enable_irq();
    1bc4:	b662      	cpsie	i
		return NULL;
    1bc6:	2000      	movs	r0, #0
    1bc8:	4770      	bx	lr
    1bca:	bf00      	nop
    1bcc:	1fff8900 	.word	0x1fff8900
    1bd0:	1fff83bc 	.word	0x1fff83bc

00001bd4 <usb_free>:
void usb_free(usb_packet_t *p)
{
	unsigned int n, mask;

	//serial_print("free:");
	n = ((uint8_t *)p - usb_buffer_memory) / sizeof(usb_packet_t);
    1bd4:	4b0d      	ldr	r3, [pc, #52]	; (1c0c <usb_free+0x38>)
    1bd6:	4a0e      	ldr	r2, [pc, #56]	; (1c10 <usb_free+0x3c>)
    1bd8:	1ac3      	subs	r3, r0, r3
    1bda:	fba2 2303 	umull	r2, r3, r2, r3
    1bde:	091b      	lsrs	r3, r3, #4
	if (n >= NUM_USB_BUFFERS) return;
    1be0:	2b0b      	cmp	r3, #11
    1be2:	d80c      	bhi.n	1bfe <usb_free+0x2a>
	//serial_phex(n);
	//serial_print("\n");

	// if any endpoints are starving for memory to receive
	// packets, give this memory to them immediately!
	if (usb_rx_memory_needed && usb_configuration) {
    1be4:	4a0b      	ldr	r2, [pc, #44]	; (1c14 <usb_free+0x40>)
    1be6:	7812      	ldrb	r2, [r2, #0]
    1be8:	b952      	cbnz	r2, 1c00 <usb_free+0x2c>
		usb_rx_memory(p);
		return;
	}

	mask = (0x80000000 >> n);
	__disable_irq();
    1bea:	b672      	cpsid	i
	usb_buffer_available |= mask;
    1bec:	480a      	ldr	r0, [pc, #40]	; (1c18 <usb_free+0x44>)
    1bee:	f04f 4100 	mov.w	r1, #2147483648	; 0x80000000
    1bf2:	6802      	ldr	r2, [r0, #0]
    1bf4:	fa21 f303 	lsr.w	r3, r1, r3
    1bf8:	431a      	orrs	r2, r3
    1bfa:	6002      	str	r2, [r0, #0]
	__enable_irq();
    1bfc:	b662      	cpsie	i
    1bfe:	4770      	bx	lr
	if (usb_rx_memory_needed && usb_configuration) {
    1c00:	4a06      	ldr	r2, [pc, #24]	; (1c1c <usb_free+0x48>)
    1c02:	7812      	ldrb	r2, [r2, #0]
    1c04:	2a00      	cmp	r2, #0
    1c06:	d0f0      	beq.n	1bea <usb_free+0x16>
		usb_rx_memory(p);
    1c08:	f7ff b942 	b.w	e90 <usb_rx_memory>
    1c0c:	1fff83bc 	.word	0x1fff83bc
    1c10:	38e38e39 	.word	0x38e38e39
    1c14:	1fff93b1 	.word	0x1fff93b1
    1c18:	1fff8900 	.word	0x1fff8900
    1c1c:	1fff93bc 	.word	0x1fff93bc

00001c20 <usb_serial_getchar>:

#define TRANSMIT_FLUSH_TIMEOUT	5   /* in milliseconds */

// get the next character, or -1 if nothing received
int usb_serial_getchar(void)
{
    1c20:	b538      	push	{r3, r4, r5, lr}
	unsigned int i;
	int c;

	if (!rx_packet) {
    1c22:	4d0f      	ldr	r5, [pc, #60]	; (1c60 <usb_serial_getchar+0x40>)
    1c24:	6828      	ldr	r0, [r5, #0]
    1c26:	b178      	cbz	r0, 1c48 <usb_serial_getchar+0x28>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	i = rx_packet->index;
    1c28:	8843      	ldrh	r3, [r0, #2]
	c = rx_packet->buf[i++];
	if (i >= rx_packet->len) {
    1c2a:	8802      	ldrh	r2, [r0, #0]
	c = rx_packet->buf[i++];
    1c2c:	18c1      	adds	r1, r0, r3
    1c2e:	3301      	adds	r3, #1
	if (i >= rx_packet->len) {
    1c30:	4293      	cmp	r3, r2
	c = rx_packet->buf[i++];
    1c32:	7a0c      	ldrb	r4, [r1, #8]
	if (i >= rx_packet->len) {
    1c34:	d202      	bcs.n	1c3c <usb_serial_getchar+0x1c>
		usb_free(rx_packet);
		rx_packet = NULL;
	} else {
		rx_packet->index = i;
    1c36:	8043      	strh	r3, [r0, #2]
	}
	return c;
    1c38:	4620      	mov	r0, r4
}
    1c3a:	bd38      	pop	{r3, r4, r5, pc}
		usb_free(rx_packet);
    1c3c:	f7ff ffca 	bl	1bd4 <usb_free>
		rx_packet = NULL;
    1c40:	2300      	movs	r3, #0
	return c;
    1c42:	4620      	mov	r0, r4
		rx_packet = NULL;
    1c44:	602b      	str	r3, [r5, #0]
    1c46:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration) return -1;
    1c48:	4b06      	ldr	r3, [pc, #24]	; (1c64 <usb_serial_getchar+0x44>)
    1c4a:	781b      	ldrb	r3, [r3, #0]
    1c4c:	b12b      	cbz	r3, 1c5a <usb_serial_getchar+0x3a>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1c4e:	2003      	movs	r0, #3
    1c50:	f7ff f8ea 	bl	e28 <usb_rx>
    1c54:	6028      	str	r0, [r5, #0]
		if (!rx_packet) return -1;
    1c56:	2800      	cmp	r0, #0
    1c58:	d1e6      	bne.n	1c28 <usb_serial_getchar+0x8>
		if (!usb_configuration) return -1;
    1c5a:	f04f 30ff 	mov.w	r0, #4294967295
    1c5e:	bd38      	pop	{r3, r4, r5, pc}
    1c60:	1fff93d0 	.word	0x1fff93d0
    1c64:	1fff93bc 	.word	0x1fff93bc

00001c68 <usb_serial_peekchar>:

// peek at the next character, or -1 if nothing received
int usb_serial_peekchar(void)
{
    1c68:	b510      	push	{r4, lr}
	if (!rx_packet) {
    1c6a:	4c09      	ldr	r4, [pc, #36]	; (1c90 <usb_serial_peekchar+0x28>)
    1c6c:	6820      	ldr	r0, [r4, #0]
    1c6e:	b118      	cbz	r0, 1c78 <usb_serial_peekchar+0x10>
		if (!usb_configuration) return -1;
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
		if (!rx_packet) return -1;
	}
	if (!rx_packet) return -1;
	return rx_packet->buf[rx_packet->index];
    1c70:	8843      	ldrh	r3, [r0, #2]
    1c72:	4418      	add	r0, r3
    1c74:	7a00      	ldrb	r0, [r0, #8]
}
    1c76:	bd10      	pop	{r4, pc}
		if (!usb_configuration) return -1;
    1c78:	4b06      	ldr	r3, [pc, #24]	; (1c94 <usb_serial_peekchar+0x2c>)
    1c7a:	781b      	ldrb	r3, [r3, #0]
    1c7c:	b12b      	cbz	r3, 1c8a <usb_serial_peekchar+0x22>
		rx_packet = usb_rx(CDC_RX_ENDPOINT);
    1c7e:	2003      	movs	r0, #3
    1c80:	f7ff f8d2 	bl	e28 <usb_rx>
    1c84:	6020      	str	r0, [r4, #0]
		if (!rx_packet) return -1;
    1c86:	2800      	cmp	r0, #0
    1c88:	d1f2      	bne.n	1c70 <usb_serial_peekchar+0x8>
		if (!usb_configuration) return -1;
    1c8a:	f04f 30ff 	mov.w	r0, #4294967295
    1c8e:	bd10      	pop	{r4, pc}
    1c90:	1fff93d0 	.word	0x1fff93d0
    1c94:	1fff93bc 	.word	0x1fff93bc

00001c98 <usb_serial_available>:
// number of bytes available in the receive buffer
int usb_serial_available(void)
{
	int count;
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1c98:	4b04      	ldr	r3, [pc, #16]	; (1cac <usb_serial_available+0x14>)
static inline uint32_t usb_rx_byte_count(uint32_t endpoint) __attribute__((always_inline));
static inline uint32_t usb_rx_byte_count(uint32_t endpoint)
{
        endpoint--;
        if (endpoint >= NUM_ENDPOINTS) return 0;
        return usb_rx_byte_count_data[endpoint];
    1c9a:	4a05      	ldr	r2, [pc, #20]	; (1cb0 <usb_serial_available+0x18>)
    1c9c:	681b      	ldr	r3, [r3, #0]
	count = usb_rx_byte_count(CDC_RX_ENDPOINT);
    1c9e:	8890      	ldrh	r0, [r2, #4]
	if (rx_packet) count += rx_packet->len - rx_packet->index;
    1ca0:	b11b      	cbz	r3, 1caa <usb_serial_available+0x12>
    1ca2:	881a      	ldrh	r2, [r3, #0]
    1ca4:	885b      	ldrh	r3, [r3, #2]
    1ca6:	1ad3      	subs	r3, r2, r3
    1ca8:	4418      	add	r0, r3
	return count;
}
    1caa:	4770      	bx	lr
    1cac:	1fff93d0 	.word	0x1fff93d0
    1cb0:	1fff95b8 	.word	0x1fff95b8

00001cb4 <usb_serial_flush_input>:
// discard any buffered input
void usb_serial_flush_input(void)
{
	usb_packet_t *rx;

	if (!usb_configuration) return;
    1cb4:	4b0b      	ldr	r3, [pc, #44]	; (1ce4 <usb_serial_flush_input+0x30>)
    1cb6:	781b      	ldrb	r3, [r3, #0]
    1cb8:	b19b      	cbz	r3, 1ce2 <usb_serial_flush_input+0x2e>
{
    1cba:	b510      	push	{r4, lr}
	if (rx_packet) {
    1cbc:	4c0a      	ldr	r4, [pc, #40]	; (1ce8 <usb_serial_flush_input+0x34>)
    1cbe:	6820      	ldr	r0, [r4, #0]
    1cc0:	b148      	cbz	r0, 1cd6 <usb_serial_flush_input+0x22>
		usb_free(rx_packet);
    1cc2:	f7ff ff87 	bl	1bd4 <usb_free>
		rx_packet = NULL;
    1cc6:	2300      	movs	r3, #0
	}
	while (1) {
		rx = usb_rx(CDC_RX_ENDPOINT);
    1cc8:	2003      	movs	r0, #3
		rx_packet = NULL;
    1cca:	6023      	str	r3, [r4, #0]
		rx = usb_rx(CDC_RX_ENDPOINT);
    1ccc:	f7ff f8ac 	bl	e28 <usb_rx>
		if (!rx) break;
    1cd0:	b130      	cbz	r0, 1ce0 <usb_serial_flush_input+0x2c>
		usb_free(rx);
    1cd2:	f7ff ff7f 	bl	1bd4 <usb_free>
		rx = usb_rx(CDC_RX_ENDPOINT);
    1cd6:	2003      	movs	r0, #3
    1cd8:	f7ff f8a6 	bl	e28 <usb_rx>
		if (!rx) break;
    1cdc:	2800      	cmp	r0, #0
    1cde:	d1f8      	bne.n	1cd2 <usb_serial_flush_input+0x1e>
    1ce0:	bd10      	pop	{r4, pc}
    1ce2:	4770      	bx	lr
    1ce4:	1fff93bc 	.word	0x1fff93bc
    1ce8:	1fff93d0 	.word	0x1fff93d0

00001cec <usb_serial_write>:
	return usb_serial_write(&c, 1);
}


int usb_serial_write(const void *buffer, uint32_t size)
{
    1cec:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	uint32_t len;
	uint32_t wait_count;
	const uint8_t *src = (const uint8_t *)buffer;
	uint8_t *dest;

	tx_noautoflush = 1;
    1cf0:	4a63      	ldr	r2, [pc, #396]	; (1e80 <usb_serial_write+0x194>)
{
    1cf2:	b083      	sub	sp, #12
	tx_noautoflush = 1;
    1cf4:	2301      	movs	r3, #1
    1cf6:	7013      	strb	r3, [r2, #0]
	while (size > 0) {
    1cf8:	9101      	str	r1, [sp, #4]
    1cfa:	2900      	cmp	r1, #0
    1cfc:	d06c      	beq.n	1dd8 <usb_serial_write+0xec>
    1cfe:	f8df 8190 	ldr.w	r8, [pc, #400]	; 1e90 <usb_serial_write+0x1a4>
		if (!tx_packet) {
			wait_count = 0;
			while (1) {
				if (!usb_configuration) {
    1d02:	4f60      	ldr	r7, [pc, #384]	; (1e84 <usb_serial_write+0x198>)
    1d04:	4604      	mov	r4, r0
    1d06:	f8d8 0000 	ldr.w	r0, [r8]
    1d0a:	460e      	mov	r6, r1
		if (!tx_packet) {
    1d0c:	2800      	cmp	r0, #0
    1d0e:	f000 8081 	beq.w	1e14 <usb_serial_write+0x128>
    1d12:	4d5d      	ldr	r5, [pc, #372]	; (1e88 <usb_serial_write+0x19c>)
				}
				yield();
			}
		}
		transmit_previous_timeout = 0;
		len = CDC_TX_SIZE - tx_packet->index;
    1d14:	8843      	ldrh	r3, [r0, #2]
    1d16:	f1c3 0140 	rsb	r1, r3, #64	; 0x40
    1d1a:	42b1      	cmp	r1, r6
    1d1c:	bf28      	it	cs
    1d1e:	4631      	movcs	r1, r6
		if (len > size) len = size;
		dest = tx_packet->buf + tx_packet->index;
		tx_packet->index += len;
    1d20:	eb03 0901 	add.w	r9, r3, r1
    1d24:	fa1f f989 	uxth.w	r9, r9
		dest = tx_packet->buf + tx_packet->index;
    1d28:	f100 0208 	add.w	r2, r0, #8
		transmit_previous_timeout = 0;
    1d2c:	f04f 0e00 	mov.w	lr, #0
		size -= len;
    1d30:	1a76      	subs	r6, r6, r1
		tx_packet->index += len;
    1d32:	f8a0 9002 	strh.w	r9, [r0, #2]
		while (len-- > 0) *dest++ = *src++;
    1d36:	f101 3cff 	add.w	ip, r1, #4294967295
		dest = tx_packet->buf + tx_packet->index;
    1d3a:	441a      	add	r2, r3
		transmit_previous_timeout = 0;
    1d3c:	f885 e000 	strb.w	lr, [r5]
		while (len-- > 0) *dest++ = *src++;
    1d40:	2900      	cmp	r1, #0
    1d42:	d041      	beq.n	1dc8 <usb_serial_write+0xdc>
    1d44:	f103 0508 	add.w	r5, r3, #8
    1d48:	330c      	adds	r3, #12
    1d4a:	4403      	add	r3, r0
    1d4c:	4405      	add	r5, r0
    1d4e:	f104 0904 	add.w	r9, r4, #4
    1d52:	454d      	cmp	r5, r9
    1d54:	bf38      	it	cc
    1d56:	429c      	cmpcc	r4, r3
    1d58:	bf2c      	ite	cs
    1d5a:	2301      	movcs	r3, #1
    1d5c:	2300      	movcc	r3, #0
    1d5e:	2909      	cmp	r1, #9
    1d60:	bf94      	ite	ls
    1d62:	2300      	movls	r3, #0
    1d64:	f003 0301 	andhi.w	r3, r3, #1
    1d68:	2b00      	cmp	r3, #0
    1d6a:	d04a      	beq.n	1e02 <usb_serial_write+0x116>
    1d6c:	ea44 0305 	orr.w	r3, r4, r5
    1d70:	079b      	lsls	r3, r3, #30
    1d72:	d146      	bne.n	1e02 <usb_serial_write+0x116>
    1d74:	1f0b      	subs	r3, r1, #4
    1d76:	089b      	lsrs	r3, r3, #2
    1d78:	3301      	adds	r3, #1
    1d7a:	f1bc 0f02 	cmp.w	ip, #2
    1d7e:	ea4f 0983 	mov.w	r9, r3, lsl #2
    1d82:	d93c      	bls.n	1dfe <usb_serial_write+0x112>
    1d84:	f1a4 0a04 	sub.w	sl, r4, #4
    1d88:	469b      	mov	fp, r3
    1d8a:	f10e 0e01 	add.w	lr, lr, #1
    1d8e:	f85a 3f04 	ldr.w	r3, [sl, #4]!
    1d92:	f845 3b04 	str.w	r3, [r5], #4
    1d96:	45f3      	cmp	fp, lr
    1d98:	d8f7      	bhi.n	1d8a <usb_serial_write+0x9e>
    1d9a:	4549      	cmp	r1, r9
    1d9c:	444a      	add	r2, r9
    1d9e:	ebc9 0c0c 	rsb	ip, r9, ip
    1da2:	eb04 0309 	add.w	r3, r4, r9
    1da6:	d061      	beq.n	1e6c <usb_serial_write+0x180>
    1da8:	781d      	ldrb	r5, [r3, #0]
    1daa:	7015      	strb	r5, [r2, #0]
    1dac:	f1bc 0f00 	cmp.w	ip, #0
    1db0:	d023      	beq.n	1dfa <usb_serial_write+0x10e>
    1db2:	785d      	ldrb	r5, [r3, #1]
    1db4:	7055      	strb	r5, [r2, #1]
    1db6:	f1bc 0f01 	cmp.w	ip, #1
    1dba:	d01e      	beq.n	1dfa <usb_serial_write+0x10e>
    1dbc:	789b      	ldrb	r3, [r3, #2]
    1dbe:	7093      	strb	r3, [r2, #2]
    1dc0:	4421      	add	r1, r4
    1dc2:	f8b0 9002 	ldrh.w	r9, [r0, #2]
    1dc6:	460c      	mov	r4, r1
		if (tx_packet->index >= CDC_TX_SIZE) {
    1dc8:	f1b9 0f3f 	cmp.w	r9, #63	; 0x3f
    1dcc:	d80b      	bhi.n	1de6 <usb_serial_write+0xfa>
			tx_packet->len = CDC_TX_SIZE;
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
			tx_packet = NULL;
		}
		usb_cdc_transmit_flush_timer = TRANSMIT_FLUSH_TIMEOUT;
    1dce:	4b2f      	ldr	r3, [pc, #188]	; (1e8c <usb_serial_write+0x1a0>)
    1dd0:	2205      	movs	r2, #5
    1dd2:	701a      	strb	r2, [r3, #0]
	while (size > 0) {
    1dd4:	2e00      	cmp	r6, #0
    1dd6:	d199      	bne.n	1d0c <usb_serial_write+0x20>
	}
	tx_noautoflush = 0;
	return ret;
    1dd8:	9801      	ldr	r0, [sp, #4]
	tx_noautoflush = 0;
    1dda:	4a29      	ldr	r2, [pc, #164]	; (1e80 <usb_serial_write+0x194>)
    1ddc:	2300      	movs	r3, #0
    1dde:	7013      	strb	r3, [r2, #0]
}
    1de0:	b003      	add	sp, #12
    1de2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
			tx_packet->len = CDC_TX_SIZE;
    1de6:	2340      	movs	r3, #64	; 0x40
    1de8:	8003      	strh	r3, [r0, #0]
			usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1dea:	4601      	mov	r1, r0
    1dec:	2004      	movs	r0, #4
    1dee:	f7ff f8b3 	bl	f58 <usb_tx>
			tx_packet = NULL;
    1df2:	2000      	movs	r0, #0
    1df4:	f8c8 0000 	str.w	r0, [r8]
    1df8:	e7e9      	b.n	1dce <usb_serial_write+0xe2>
    1dfa:	4421      	add	r1, r4
    1dfc:	e7e1      	b.n	1dc2 <usb_serial_write+0xd6>
		while (len-- > 0) *dest++ = *src++;
    1dfe:	4623      	mov	r3, r4
    1e00:	e7d2      	b.n	1da8 <usb_serial_write+0xbc>
    1e02:	3a01      	subs	r2, #1
    1e04:	4421      	add	r1, r4
    1e06:	f814 3b01 	ldrb.w	r3, [r4], #1
    1e0a:	f802 3f01 	strb.w	r3, [r2, #1]!
    1e0e:	428c      	cmp	r4, r1
    1e10:	d1f9      	bne.n	1e06 <usb_serial_write+0x11a>
    1e12:	e7d6      	b.n	1dc2 <usb_serial_write+0xd6>
				if (!usb_configuration) {
    1e14:	783b      	ldrb	r3, [r7, #0]
    1e16:	b35b      	cbz	r3, 1e70 <usb_serial_write+0x184>
    1e18:	4d1b      	ldr	r5, [pc, #108]	; (1e88 <usb_serial_write+0x19c>)
    1e1a:	f24d 09e9 	movw	r9, #53481	; 0xd0e9
					tx_noautoflush = 1;
    1e1e:	f04f 0a01 	mov.w	sl, #1
    1e22:	e008      	b.n	1e36 <usb_serial_write+0x14a>
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1e24:	f1b9 0901 	subs.w	r9, r9, #1
    1e28:	d019      	beq.n	1e5e <usb_serial_write+0x172>
    1e2a:	782b      	ldrb	r3, [r5, #0]
    1e2c:	b9bb      	cbnz	r3, 1e5e <usb_serial_write+0x172>
				yield();
    1e2e:	f000 f8b1 	bl	1f94 <yield>
				if (!usb_configuration) {
    1e32:	783b      	ldrb	r3, [r7, #0]
    1e34:	b1e3      	cbz	r3, 1e70 <usb_serial_write+0x184>
				if (usb_tx_packet_count(CDC_TX_ENDPOINT) < TX_PACKET_LIMIT) {
    1e36:	2004      	movs	r0, #4
    1e38:	f7ff f814 	bl	e64 <usb_tx_packet_count>
    1e3c:	2807      	cmp	r0, #7
    1e3e:	d8f1      	bhi.n	1e24 <usb_serial_write+0x138>
					tx_noautoflush = 1;
    1e40:	4b0f      	ldr	r3, [pc, #60]	; (1e80 <usb_serial_write+0x194>)
    1e42:	f883 a000 	strb.w	sl, [r3]
					tx_packet = usb_malloc();
    1e46:	f7ff fea5 	bl	1b94 <usb_malloc>
    1e4a:	f8c8 0000 	str.w	r0, [r8]
					if (tx_packet) break;
    1e4e:	2800      	cmp	r0, #0
    1e50:	f47f af60 	bne.w	1d14 <usb_serial_write+0x28>
					tx_noautoflush = 0;
    1e54:	4b0a      	ldr	r3, [pc, #40]	; (1e80 <usb_serial_write+0x194>)
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1e56:	f1b9 0901 	subs.w	r9, r9, #1
					tx_noautoflush = 0;
    1e5a:	7018      	strb	r0, [r3, #0]
				if (++wait_count > TX_TIMEOUT || transmit_previous_timeout) {
    1e5c:	d1e5      	bne.n	1e2a <usb_serial_write+0x13e>
					transmit_previous_timeout = 1;
    1e5e:	2301      	movs	r3, #1
					return -1;
    1e60:	f04f 30ff 	mov.w	r0, #4294967295
					transmit_previous_timeout = 1;
    1e64:	702b      	strb	r3, [r5, #0]
}
    1e66:	b003      	add	sp, #12
    1e68:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1e6c:	4619      	mov	r1, r3
    1e6e:	e7a8      	b.n	1dc2 <usb_serial_write+0xd6>
					tx_noautoflush = 0;
    1e70:	4a03      	ldr	r2, [pc, #12]	; (1e80 <usb_serial_write+0x194>)
    1e72:	2300      	movs	r3, #0
					return -1;
    1e74:	f04f 30ff 	mov.w	r0, #4294967295
					tx_noautoflush = 0;
    1e78:	7013      	strb	r3, [r2, #0]
}
    1e7a:	b003      	add	sp, #12
    1e7c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1e80:	1fff93c5 	.word	0x1fff93c5
    1e84:	1fff93bc 	.word	0x1fff93bc
    1e88:	1fff93cc 	.word	0x1fff93cc
    1e8c:	1fff93c4 	.word	0x1fff93c4
    1e90:	1fff93c8 	.word	0x1fff93c8

00001e94 <usb_serial_putchar>:
{
    1e94:	b500      	push	{lr}
    1e96:	b083      	sub	sp, #12
    1e98:	ab02      	add	r3, sp, #8
	return usb_serial_write(&c, 1);
    1e9a:	2101      	movs	r1, #1
{
    1e9c:	f803 0d01 	strb.w	r0, [r3, #-1]!
	return usb_serial_write(&c, 1);
    1ea0:	4618      	mov	r0, r3
    1ea2:	f7ff ff23 	bl	1cec <usb_serial_write>
}
    1ea6:	b003      	add	sp, #12
    1ea8:	f85d fb04 	ldr.w	pc, [sp], #4

00001eac <usb_serial_write_buffer_free>:

int usb_serial_write_buffer_free(void)
{
    1eac:	b538      	push	{r3, r4, r5, lr}
	uint32_t len;

	tx_noautoflush = 1;
	if (!tx_packet) {
    1eae:	4d0e      	ldr	r5, [pc, #56]	; (1ee8 <usb_serial_write_buffer_free+0x3c>)
	tx_noautoflush = 1;
    1eb0:	4c0e      	ldr	r4, [pc, #56]	; (1eec <usb_serial_write_buffer_free+0x40>)
	if (!tx_packet) {
    1eb2:	6828      	ldr	r0, [r5, #0]
	tx_noautoflush = 1;
    1eb4:	2301      	movs	r3, #1
    1eb6:	7023      	strb	r3, [r4, #0]
	if (!tx_packet) {
    1eb8:	b128      	cbz	r0, 1ec6 <usb_serial_write_buffer_free+0x1a>
		  (tx_packet = usb_malloc()) == NULL) {
			tx_noautoflush = 0;
			return 0;
		}
	}
	len = CDC_TX_SIZE - tx_packet->index;
    1eba:	8840      	ldrh	r0, [r0, #2]
	// space we just promised the user could write without blocking?
	// But does this come with other performance downsides?  Could it lead to
	// buffer data never actually transmitting in some usage cases?  More
	// investigation is needed.
	// https://github.com/PaulStoffregen/cores/issues/10#issuecomment-61514955
	tx_noautoflush = 0;
    1ebc:	2300      	movs	r3, #0
    1ebe:	7023      	strb	r3, [r4, #0]
	len = CDC_TX_SIZE - tx_packet->index;
    1ec0:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
	return len;
}
    1ec4:	bd38      	pop	{r3, r4, r5, pc}
		if (!usb_configuration ||
    1ec6:	4b0a      	ldr	r3, [pc, #40]	; (1ef0 <usb_serial_write_buffer_free+0x44>)
    1ec8:	781b      	ldrb	r3, [r3, #0]
    1eca:	b913      	cbnz	r3, 1ed2 <usb_serial_write_buffer_free+0x26>
			tx_noautoflush = 0;
    1ecc:	2000      	movs	r0, #0
    1ece:	7020      	strb	r0, [r4, #0]
			return 0;
    1ed0:	bd38      	pop	{r3, r4, r5, pc}
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1ed2:	2004      	movs	r0, #4
    1ed4:	f7fe ffc6 	bl	e64 <usb_tx_packet_count>
		if (!usb_configuration ||
    1ed8:	2807      	cmp	r0, #7
    1eda:	d8f7      	bhi.n	1ecc <usb_serial_write_buffer_free+0x20>
		  (tx_packet = usb_malloc()) == NULL) {
    1edc:	f7ff fe5a 	bl	1b94 <usb_malloc>
    1ee0:	6028      	str	r0, [r5, #0]
		  usb_tx_packet_count(CDC_TX_ENDPOINT) >= TX_PACKET_LIMIT ||
    1ee2:	2800      	cmp	r0, #0
    1ee4:	d1e9      	bne.n	1eba <usb_serial_write_buffer_free+0xe>
    1ee6:	e7f1      	b.n	1ecc <usb_serial_write_buffer_free+0x20>
    1ee8:	1fff93c8 	.word	0x1fff93c8
    1eec:	1fff93c5 	.word	0x1fff93c5
    1ef0:	1fff93bc 	.word	0x1fff93bc

00001ef4 <usb_serial_flush_output>:

void usb_serial_flush_output(void)
{
    1ef4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
	if (!usb_configuration) return;
    1ef6:	4b11      	ldr	r3, [pc, #68]	; (1f3c <usb_serial_flush_output+0x48>)
    1ef8:	781b      	ldrb	r3, [r3, #0]
    1efa:	b18b      	cbz	r3, 1f20 <usb_serial_flush_output+0x2c>
	tx_noautoflush = 1;
	if (tx_packet) {
    1efc:	4e10      	ldr	r6, [pc, #64]	; (1f40 <usb_serial_flush_output+0x4c>)
	tx_noautoflush = 1;
    1efe:	4d11      	ldr	r5, [pc, #68]	; (1f44 <usb_serial_flush_output+0x50>)
	if (tx_packet) {
    1f00:	6834      	ldr	r4, [r6, #0]
	tx_noautoflush = 1;
    1f02:	2701      	movs	r7, #1
    1f04:	702f      	strb	r7, [r5, #0]
	if (tx_packet) {
    1f06:	b164      	cbz	r4, 1f22 <usb_serial_flush_output+0x2e>
		usb_cdc_transmit_flush_timer = 0;
    1f08:	4a0f      	ldr	r2, [pc, #60]	; (1f48 <usb_serial_flush_output+0x54>)
		tx_packet->len = tx_packet->index;
    1f0a:	8863      	ldrh	r3, [r4, #2]
		usb_cdc_transmit_flush_timer = 0;
    1f0c:	2700      	movs	r7, #0
    1f0e:	7017      	strb	r7, [r2, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1f10:	4621      	mov	r1, r4
		tx_packet->len = tx_packet->index;
    1f12:	8023      	strh	r3, [r4, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1f14:	2004      	movs	r0, #4
    1f16:	f7ff f81f 	bl	f58 <usb_tx>
		tx_packet = NULL;
    1f1a:	6037      	str	r7, [r6, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
		}
	}
	tx_noautoflush = 0;
    1f1c:	2300      	movs	r3, #0
    1f1e:	702b      	strb	r3, [r5, #0]
    1f20:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
		usb_packet_t *tx = usb_malloc();
    1f22:	f7ff fe37 	bl	1b94 <usb_malloc>
			usb_cdc_transmit_flush_timer = 0;
    1f26:	4b08      	ldr	r3, [pc, #32]	; (1f48 <usb_serial_flush_output+0x54>)
		if (tx) {
    1f28:	b128      	cbz	r0, 1f36 <usb_serial_flush_output+0x42>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f2a:	4601      	mov	r1, r0
    1f2c:	2004      	movs	r0, #4
			usb_cdc_transmit_flush_timer = 0;
    1f2e:	701c      	strb	r4, [r3, #0]
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f30:	f7ff f812 	bl	f58 <usb_tx>
    1f34:	e7f2      	b.n	1f1c <usb_serial_flush_output+0x28>
			usb_cdc_transmit_flush_timer = 1;
    1f36:	701f      	strb	r7, [r3, #0]
    1f38:	e7f0      	b.n	1f1c <usb_serial_flush_output+0x28>
    1f3a:	bf00      	nop
    1f3c:	1fff93bc 	.word	0x1fff93bc
    1f40:	1fff93c8 	.word	0x1fff93c8
    1f44:	1fff93c5 	.word	0x1fff93c5
    1f48:	1fff93c4 	.word	0x1fff93c4

00001f4c <usb_serial_flush_callback>:
}

void usb_serial_flush_callback(void)
{
    1f4c:	b538      	push	{r3, r4, r5, lr}
	if (tx_noautoflush) return;
    1f4e:	4b0e      	ldr	r3, [pc, #56]	; (1f88 <usb_serial_flush_callback+0x3c>)
    1f50:	781b      	ldrb	r3, [r3, #0]
    1f52:	b973      	cbnz	r3, 1f72 <usb_serial_flush_callback+0x26>
	if (tx_packet) {
    1f54:	4c0d      	ldr	r4, [pc, #52]	; (1f8c <usb_serial_flush_callback+0x40>)
    1f56:	6821      	ldr	r1, [r4, #0]
    1f58:	b161      	cbz	r1, 1f74 <usb_serial_flush_callback+0x28>
    1f5a:	f003 05ff 	and.w	r5, r3, #255	; 0xff
		tx_packet->len = tx_packet->index;
    1f5e:	884b      	ldrh	r3, [r1, #2]
    1f60:	800b      	strh	r3, [r1, #0]
		usb_tx(CDC_TX_ENDPOINT, tx_packet);
    1f62:	2004      	movs	r0, #4
    1f64:	f7fe fff8 	bl	f58 <usb_tx>
		tx_packet = NULL;
    1f68:	6025      	str	r5, [r4, #0]
    1f6a:	bd38      	pop	{r3, r4, r5, pc}
	} else {
		usb_packet_t *tx = usb_malloc();
		if (tx) {
			usb_tx(CDC_TX_ENDPOINT, tx);
		} else {
			usb_cdc_transmit_flush_timer = 1;
    1f6c:	4b08      	ldr	r3, [pc, #32]	; (1f90 <usb_serial_flush_callback+0x44>)
    1f6e:	2201      	movs	r2, #1
    1f70:	701a      	strb	r2, [r3, #0]
    1f72:	bd38      	pop	{r3, r4, r5, pc}
		usb_packet_t *tx = usb_malloc();
    1f74:	f7ff fe0e 	bl	1b94 <usb_malloc>
		if (tx) {
    1f78:	2800      	cmp	r0, #0
    1f7a:	d0f7      	beq.n	1f6c <usb_serial_flush_callback+0x20>
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f7c:	4601      	mov	r1, r0
		}
	}
}
    1f7e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
			usb_tx(CDC_TX_ENDPOINT, tx);
    1f82:	2004      	movs	r0, #4
    1f84:	f7fe bfe8 	b.w	f58 <usb_tx>
    1f88:	1fff93c5 	.word	0x1fff93c5
    1f8c:	1fff93c8 	.word	0x1fff93c8
    1f90:	1fff93c4 	.word	0x1fff93c4

00001f94 <yield>:
#include "usb_seremu.h"
#include "EventResponder.h"

void yield(void) __attribute__ ((weak));
void yield(void)
{
    1f94:	b538      	push	{r3, r4, r5, lr}
	static uint8_t running=0;

	if (running) return; // TODO: does this need to be atomic?
    1f96:	4c22      	ldr	r4, [pc, #136]	; (2020 <yield+0x8c>)
    1f98:	7823      	ldrb	r3, [r4, #0]
    1f9a:	b103      	cbz	r3, 1f9e <yield+0xa>
    1f9c:	bd38      	pop	{r3, r4, r5, pc}
	running = 1;
    1f9e:	2301      	movs	r3, #1
    1fa0:	7023      	strb	r3, [r4, #0]
        virtual int available() { return usb_serial_available(); }
    1fa2:	f7ff fe79 	bl	1c98 <usb_serial_available>
	if (Serial.available()) serialEvent();
    1fa6:	bb70      	cbnz	r0, 2006 <yield+0x72>
	virtual void transmitterEnable(uint8_t pin) { serial_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial_set_cts(pin); }
	virtual int available(void)     { return serial_available(); }
    1fa8:	f000 fa26 	bl	23f8 <serial_available>
	if (Serial1.available()) serialEvent1();
    1fac:	bb40      	cbnz	r0, 2000 <yield+0x6c>
	virtual void transmitterEnable(uint8_t pin) { serial2_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial2_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial2_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial2_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial2_set_cts(pin); }
	virtual int available(void)     { return serial2_available(); }
    1fae:	f000 fab9 	bl	2524 <serial2_available>
	if (Serial2.available()) serialEvent2();
    1fb2:	bb10      	cbnz	r0, 1ffa <yield+0x66>
	virtual void transmitterEnable(uint8_t pin) { serial3_set_transmit_pin(pin); }
	virtual void setRX(uint8_t pin) { serial3_set_rx(pin); }
	virtual void setTX(uint8_t pin, bool opendrain=false) { serial3_set_tx(pin, opendrain); }
	virtual bool attachRts(uint8_t pin) { return serial3_set_rts(pin); }
	virtual bool attachCts(uint8_t pin) { return serial3_set_cts(pin); }
	virtual int available(void)     { return serial3_available(); }
    1fb4:	f000 fb4c 	bl	2650 <serial3_available>
	if (Serial3.available()) serialEvent3();
    1fb8:	b9e0      	cbnz	r0, 1ff4 <yield+0x60>
	if (Serial5.available()) serialEvent5();
#endif
#if defined(HAS_KINETISK_UART5) || defined (HAS_KINETISK_LPUART0)
	if (Serial6.available()) serialEvent6();
#endif
	running = 0;
    1fba:	2300      	movs	r3, #0
    1fbc:	7023      	strb	r3, [r4, #0]

	static void runFromYield() {
		// First, check if yield was called from an interrupt
		// never call normal handler functions from any interrupt context
		uint32_t ipsr;
		__asm__ volatile("mrs %0, ipsr\n" : "=r" (ipsr)::);
    1fbe:	f3ef 8305 	mrs	r3, IPSR
		if (ipsr != 0) return;
    1fc2:	2b00      	cmp	r3, #0
    1fc4:	d1ea      	bne.n	1f9c <yield+0x8>
	static EventResponder *lastInterrupt;
	static bool runningFromYield;
private:
	static bool disableInterrupts() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    1fc6:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    1fca:	b672      	cpsid	i
		EventResponder *first = firstYield;
    1fcc:	4b15      	ldr	r3, [pc, #84]	; (2024 <yield+0x90>)
    1fce:	6818      	ldr	r0, [r3, #0]
		if (first == nullptr) {
    1fd0:	b1e0      	cbz	r0, 200c <yield+0x78>
		if (runningFromYield) {
    1fd2:	4c15      	ldr	r4, [pc, #84]	; (2028 <yield+0x94>)
    1fd4:	7822      	ldrb	r2, [r4, #0]
    1fd6:	b9ca      	cbnz	r2, 200c <yield+0x78>
		firstYield = first->_next;
    1fd8:	6945      	ldr	r5, [r0, #20]
    1fda:	601d      	str	r5, [r3, #0]
		runningFromYield = true;
    1fdc:	2301      	movs	r3, #1
    1fde:	7023      	strb	r3, [r4, #0]
		if (firstYield) {
    1fe0:	b1c5      	cbz	r5, 2014 <yield+0x80>
			firstYield->_prev = nullptr;
    1fe2:	61aa      	str	r2, [r5, #24]
		return (primask == 0) ? true : false;
	}
	static void enableInterrupts(bool doit) {
		if (doit) __enable_irq();
    1fe4:	b901      	cbnz	r1, 1fe8 <yield+0x54>
    1fe6:	b662      	cpsie	i
		first->_triggered = false;
    1fe8:	2500      	movs	r5, #0
    1fea:	7745      	strb	r5, [r0, #29]
		(*(first->_function))(*first);
    1fec:	6883      	ldr	r3, [r0, #8]
    1fee:	4798      	blx	r3
		runningFromYield = false;
    1ff0:	7025      	strb	r5, [r4, #0]
    1ff2:	e7d3      	b.n	1f9c <yield+0x8>
	if (Serial3.available()) serialEvent3();
    1ff4:	f000 f98e 	bl	2314 <serialEvent3()>
    1ff8:	e7df      	b.n	1fba <yield+0x26>
	if (Serial2.available()) serialEvent2();
    1ffa:	f000 f989 	bl	2310 <serialEvent2()>
    1ffe:	e7d9      	b.n	1fb4 <yield+0x20>
	if (Serial1.available()) serialEvent1();
    2000:	f000 f984 	bl	230c <serialEvent1()>
    2004:	e7d3      	b.n	1fae <yield+0x1a>
	if (Serial.available()) serialEvent();
    2006:	f7ff fdc3 	bl	1b90 <serialEvent()>
    200a:	e7cd      	b.n	1fa8 <yield+0x14>
		if (doit) __enable_irq();
    200c:	2900      	cmp	r1, #0
    200e:	d1c5      	bne.n	1f9c <yield+0x8>
    2010:	b662      	cpsie	i
    2012:	bd38      	pop	{r3, r4, r5, pc}
			lastYield = nullptr;
    2014:	4b05      	ldr	r3, [pc, #20]	; (202c <yield+0x98>)
    2016:	601d      	str	r5, [r3, #0]
		if (doit) __enable_irq();
    2018:	2900      	cmp	r1, #0
    201a:	d1e5      	bne.n	1fe8 <yield+0x54>
    201c:	e7e3      	b.n	1fe6 <yield+0x52>
    201e:	bf00      	nop
    2020:	1fff93d5 	.word	0x1fff93d5
    2024:	1fff93e8 	.word	0x1fff93e8
    2028:	1fff93ec 	.word	0x1fff93ec
    202c:	1fff93e4 	.word	0x1fff93e4

00002030 <EventResponder::triggerEvent(int, void*)>:
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    2030:	b410      	push	{r4}
		if (_type == EventTypeImmediate) {
    2032:	7f04      	ldrb	r4, [r0, #28]
		_status = status;
    2034:	6041      	str	r1, [r0, #4]
		if (_type == EventTypeImmediate) {
    2036:	2c02      	cmp	r4, #2
	virtual void triggerEvent(int status=0, void *data=nullptr) {
    2038:	4603      	mov	r3, r0
		_data = data;
    203a:	60c2      	str	r2, [r0, #12]
		if (_type == EventTypeImmediate) {
    203c:	d00f      	beq.n	205e <EventResponder::triggerEvent(int, void*)+0x2e>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    203e:	f3ef 8110 	mrs	r1, PRIMASK
		__disable_irq();
    2042:	b672      	cpsid	i
// TODO: interrupt disable/enable needed in many places!!!

void EventResponder::triggerEventNotImmediate()
{
	bool irq = disableInterrupts();
	if (_triggered == false) {
    2044:	7f42      	ldrb	r2, [r0, #29]
    2046:	b932      	cbnz	r2, 2056 <EventResponder::triggerEvent(int, void*)+0x26>
		// not already triggered
		if (_type == EventTypeYield) {
    2048:	7f00      	ldrb	r0, [r0, #28]
    204a:	2801      	cmp	r0, #1
    204c:	d00a      	beq.n	2064 <EventResponder::triggerEvent(int, void*)+0x34>
				_next = nullptr;
				_prev = lastYield;
				_prev->_next = this;
				lastYield = this;
			}
		} else if (_type == EventTypeInterrupt) {
    204e:	2803      	cmp	r0, #3
    2050:	d012      	beq.n	2078 <EventResponder::triggerEvent(int, void*)+0x48>
			}
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
		} else {
			// detached, easy :-)
		}
		_triggered = true;
    2052:	2201      	movs	r2, #1
    2054:	775a      	strb	r2, [r3, #29]
		if (doit) __enable_irq();
    2056:	b901      	cbnz	r1, 205a <EventResponder::triggerEvent(int, void*)+0x2a>
    2058:	b662      	cpsie	i
	}
    205a:	bc10      	pop	{r4}
    205c:	4770      	bx	lr
			(*_function)(*this);
    205e:	6883      	ldr	r3, [r0, #8]
	}
    2060:	bc10      	pop	{r4}
			(*_function)(*this);
    2062:	4718      	bx	r3
			if (firstYield == nullptr) {
    2064:	4c11      	ldr	r4, [pc, #68]	; (20ac <EventResponder::triggerEvent(int, void*)+0x7c>)
    2066:	6820      	ldr	r0, [r4, #0]
    2068:	b1a0      	cbz	r0, 2094 <EventResponder::triggerEvent(int, void*)+0x64>
				_prev = lastYield;
    206a:	4811      	ldr	r0, [pc, #68]	; (20b0 <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    206c:	615a      	str	r2, [r3, #20]
				_prev = lastYield;
    206e:	6802      	ldr	r2, [r0, #0]
    2070:	619a      	str	r2, [r3, #24]
				lastYield = this;
    2072:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2074:	6153      	str	r3, [r2, #20]
    2076:	e7ec      	b.n	2052 <EventResponder::triggerEvent(int, void*)+0x22>
			if (firstInterrupt == nullptr) {
    2078:	4c0e      	ldr	r4, [pc, #56]	; (20b4 <EventResponder::triggerEvent(int, void*)+0x84>)
    207a:	6820      	ldr	r0, [r4, #0]
    207c:	b180      	cbz	r0, 20a0 <EventResponder::triggerEvent(int, void*)+0x70>
				_prev = lastInterrupt;
    207e:	480e      	ldr	r0, [pc, #56]	; (20b8 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    2080:	615a      	str	r2, [r3, #20]
				_prev = lastInterrupt;
    2082:	6802      	ldr	r2, [r0, #0]
    2084:	619a      	str	r2, [r3, #24]
				lastInterrupt = this;
    2086:	6003      	str	r3, [r0, #0]
				_prev->_next = this;
    2088:	6153      	str	r3, [r2, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    208a:	4a0c      	ldr	r2, [pc, #48]	; (20bc <EventResponder::triggerEvent(int, void*)+0x8c>)
    208c:	f04f 5080 	mov.w	r0, #268435456	; 0x10000000
    2090:	6010      	str	r0, [r2, #0]
    2092:	e7de      	b.n	2052 <EventResponder::triggerEvent(int, void*)+0x22>
				lastYield = this;
    2094:	4a06      	ldr	r2, [pc, #24]	; (20b0 <EventResponder::triggerEvent(int, void*)+0x80>)
				_next = nullptr;
    2096:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    2098:	6198      	str	r0, [r3, #24]
				firstYield = this;
    209a:	6023      	str	r3, [r4, #0]
				lastYield = this;
    209c:	6013      	str	r3, [r2, #0]
    209e:	e7d8      	b.n	2052 <EventResponder::triggerEvent(int, void*)+0x22>
				lastInterrupt = this;
    20a0:	4a05      	ldr	r2, [pc, #20]	; (20b8 <EventResponder::triggerEvent(int, void*)+0x88>)
				_next = nullptr;
    20a2:	6158      	str	r0, [r3, #20]
				_prev = nullptr;
    20a4:	6198      	str	r0, [r3, #24]
				firstInterrupt = this;
    20a6:	6023      	str	r3, [r4, #0]
				lastInterrupt = this;
    20a8:	6013      	str	r3, [r2, #0]
    20aa:	e7ee      	b.n	208a <EventResponder::triggerEvent(int, void*)+0x5a>
    20ac:	1fff93e8 	.word	0x1fff93e8
    20b0:	1fff93e4 	.word	0x1fff93e4
    20b4:	1fff93d8 	.word	0x1fff93d8
    20b8:	1fff93dc 	.word	0x1fff93dc
    20bc:	e000ed04 	.word	0xe000ed04

000020c0 <pendablesrvreq_isr>:
	}
	enableInterrupts(irq);
}

void pendablesrvreq_isr(void)
{
    20c0:	b570      	push	{r4, r5, r6, lr}
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    20c2:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    20c6:	b672      	cpsid	i

void EventResponder::runFromInterrupt()
{
	while (1) {
		bool irq = disableInterrupts();
		EventResponder *first = firstInterrupt;
    20c8:	4c0c      	ldr	r4, [pc, #48]	; (20fc <pendablesrvreq_isr+0x3c>)
    20ca:	6820      	ldr	r0, [r4, #0]
		if (first) {
    20cc:	b180      	cbz	r0, 20f0 <pendablesrvreq_isr+0x30>
			firstInterrupt = first->_next;
			if (firstInterrupt) {
				firstInterrupt->_prev = nullptr;
			} else {
				lastInterrupt = nullptr;
    20ce:	4e0c      	ldr	r6, [pc, #48]	; (2100 <pendablesrvreq_isr+0x40>)
				firstInterrupt->_prev = nullptr;
    20d0:	2500      	movs	r5, #0
			firstInterrupt = first->_next;
    20d2:	6943      	ldr	r3, [r0, #20]
    20d4:	6023      	str	r3, [r4, #0]
			if (firstInterrupt) {
    20d6:	b173      	cbz	r3, 20f6 <pendablesrvreq_isr+0x36>
				firstInterrupt->_prev = nullptr;
    20d8:	619d      	str	r5, [r3, #24]
		if (doit) __enable_irq();
    20da:	b902      	cbnz	r2, 20de <pendablesrvreq_isr+0x1e>
    20dc:	b662      	cpsie	i
			}
			enableInterrupts(irq);
			first->_triggered = false;
    20de:	7745      	strb	r5, [r0, #29]
			(*(first->_function))(*first);
    20e0:	6883      	ldr	r3, [r0, #8]
    20e2:	4798      	blx	r3
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    20e4:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    20e8:	b672      	cpsid	i
		EventResponder *first = firstInterrupt;
    20ea:	6820      	ldr	r0, [r4, #0]
		if (first) {
    20ec:	2800      	cmp	r0, #0
    20ee:	d1f0      	bne.n	20d2 <pendablesrvreq_isr+0x12>
		if (doit) __enable_irq();
    20f0:	b902      	cbnz	r2, 20f4 <pendablesrvreq_isr+0x34>
    20f2:	b662      	cpsie	i
    20f4:	bd70      	pop	{r4, r5, r6, pc}
				lastInterrupt = nullptr;
    20f6:	6033      	str	r3, [r6, #0]
    20f8:	e7ef      	b.n	20da <pendablesrvreq_isr+0x1a>
    20fa:	bf00      	nop
    20fc:	1fff93d8 	.word	0x1fff93d8
    2100:	1fff93dc 	.word	0x1fff93dc

00002104 <MillisTimer::runFromTimer()>:
	}
	enableTimerInterrupt(irq);
}

void MillisTimer::runFromTimer()
{
    2104:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	MillisTimer *timer = listActive;
    2108:	4d74      	ldr	r5, [pc, #464]	; (22dc <MillisTimer::runFromTimer()+0x1d8>)
    210a:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    210c:	2c00      	cmp	r4, #0
    210e:	d031      	beq.n	2174 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    2110:	6823      	ldr	r3, [r4, #0]
    2112:	2b00      	cmp	r3, #0
    2114:	d12c      	bne.n	2170 <MillisTimer::runFromTimer()+0x6c>
    2116:	f8df 91d8 	ldr.w	r9, [pc, #472]	; 22f0 <MillisTimer::runFromTimer()+0x1ec>
			if (firstInterrupt == nullptr) {
    211a:	4f71      	ldr	r7, [pc, #452]	; (22e0 <MillisTimer::runFromTimer()+0x1dc>)
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    211c:	f8df 81d4 	ldr.w	r8, [pc, #468]	; 22f4 <MillisTimer::runFromTimer()+0x1f0>
			timer->_ms--;
			break;
		} else {
			MillisTimer *next = timer->_next;
			if (next) next->_prev = nullptr;
    2120:	461e      	mov	r6, r3
			MillisTimer *next = timer->_next;
    2122:	68a3      	ldr	r3, [r4, #8]
			if (next) next->_prev = nullptr;
    2124:	b103      	cbz	r3, 2128 <MillisTimer::runFromTimer()+0x24>
    2126:	60de      	str	r6, [r3, #12]
			listActive = next;
			timer->_state = TimerOff;
			EventResponderRef event = *(timer->_event);
    2128:	6920      	ldr	r0, [r4, #16]
			listActive = next;
    212a:	602b      	str	r3, [r5, #0]
			event.triggerEvent(0, timer);
    212c:	6803      	ldr	r3, [r0, #0]
			timer->_state = TimerOff;
    212e:	7526      	strb	r6, [r4, #20]
			event.triggerEvent(0, timer);
    2130:	681b      	ldr	r3, [r3, #0]
    2132:	454b      	cmp	r3, r9
    2134:	d157      	bne.n	21e6 <MillisTimer::runFromTimer()+0xe2>
		if (_type == EventTypeImmediate) {
    2136:	7f03      	ldrb	r3, [r0, #28]
		_status = status;
    2138:	6046      	str	r6, [r0, #4]
		if (_type == EventTypeImmediate) {
    213a:	2b02      	cmp	r3, #2
		_data = data;
    213c:	60c4      	str	r4, [r0, #12]
		if (_type == EventTypeImmediate) {
    213e:	d056      	beq.n	21ee <MillisTimer::runFromTimer()+0xea>
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2140:	f3ef 8210 	mrs	r2, PRIMASK
		__disable_irq();
    2144:	b672      	cpsid	i
	if (_triggered == false) {
    2146:	7f43      	ldrb	r3, [r0, #29]
    2148:	b943      	cbnz	r3, 215c <MillisTimer::runFromTimer()+0x58>
		if (_type == EventTypeYield) {
    214a:	7f01      	ldrb	r1, [r0, #28]
    214c:	2901      	cmp	r1, #1
    214e:	f000 8088 	beq.w	2262 <MillisTimer::runFromTimer()+0x15e>
		} else if (_type == EventTypeInterrupt) {
    2152:	2903      	cmp	r1, #3
    2154:	f000 8091 	beq.w	227a <MillisTimer::runFromTimer()+0x176>
		_triggered = true;
    2158:	2301      	movs	r3, #1
    215a:	7743      	strb	r3, [r0, #29]
		if (doit) __enable_irq();
    215c:	b902      	cbnz	r2, 2160 <MillisTimer::runFromTimer()+0x5c>
    215e:	b662      	cpsie	i
			if (timer->_reload) {
    2160:	6863      	ldr	r3, [r4, #4]
    2162:	2b00      	cmp	r3, #0
    2164:	d12c      	bne.n	21c0 <MillisTimer::runFromTimer()+0xbc>
    2166:	682c      	ldr	r4, [r5, #0]
	while (timer) {
    2168:	b124      	cbz	r4, 2174 <MillisTimer::runFromTimer()+0x70>
		if (timer->_ms > 0) {
    216a:	6823      	ldr	r3, [r4, #0]
    216c:	2b00      	cmp	r3, #0
    216e:	d0d8      	beq.n	2122 <MillisTimer::runFromTimer()+0x1e>
			timer->_ms--;
    2170:	3b01      	subs	r3, #1
    2172:	6023      	str	r3, [r4, #0]
	volatile TimerStateType _state = TimerOff;
	static MillisTimer *listWaiting; // single linked list of waiting to start timers
	static MillisTimer *listActive;  // double linked list of running timers
	static bool disableTimerInterrupt() {
		uint32_t primask;
		__asm__ volatile("mrs %0, primask\n" : "=r" (primask)::);
    2174:	f3ef 8310 	mrs	r3, PRIMASK
		__disable_irq();
    2178:	b672      	cpsid	i
			}
			timer = listActive;
		}
	}
	bool irq = disableTimerInterrupt();
	MillisTimer *waiting = listWaiting;
    217a:	4a5a      	ldr	r2, [pc, #360]	; (22e4 <MillisTimer::runFromTimer()+0x1e0>)
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    217c:	2100      	movs	r1, #0
	MillisTimer *waiting = listWaiting;
    217e:	6810      	ldr	r0, [r2, #0]
	listWaiting = nullptr; // TODO: use STREX to avoid interrupt disable
    2180:	6011      	str	r1, [r2, #0]
		return (primask == 0) ? true : false;
	}
	static void enableTimerInterrupt(bool doit) {
		if (doit) __enable_irq();
    2182:	b903      	cbnz	r3, 2186 <MillisTimer::runFromTimer()+0x82>
    2184:	b662      	cpsie	i
	enableTimerInterrupt(irq);
	while (waiting) {
    2186:	2800      	cmp	r0, #0
    2188:	f000 80a5 	beq.w	22d6 <MillisTimer::runFromTimer()+0x1d2>
    218c:	682c      	ldr	r4, [r5, #0]
	_state = TimerActive;
    218e:	2702      	movs	r7, #2
		_prev = nullptr;
    2190:	f04f 0e00 	mov.w	lr, #0
		MillisTimer *next = waiting->_next;
    2194:	6886      	ldr	r6, [r0, #8]
	if (listActive == nullptr) {
    2196:	2c00      	cmp	r4, #0
    2198:	d05f      	beq.n	225a <MillisTimer::runFromTimer()+0x156>
	} else if (_ms < listActive->_ms) {
    219a:	6803      	ldr	r3, [r0, #0]
    219c:	6821      	ldr	r1, [r4, #0]
    219e:	428b      	cmp	r3, r1
    21a0:	d23a      	bcs.n	2218 <MillisTimer::runFromTimer()+0x114>
		listActive->_ms -= _ms;	
    21a2:	1acb      	subs	r3, r1, r3
		_next = listActive;
    21a4:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    21a6:	f8c0 e00c 	str.w	lr, [r0, #12]
		listActive->_ms -= _ms;	
    21aa:	4601      	mov	r1, r0
    21ac:	6023      	str	r3, [r4, #0]
		listActive->_prev = this;
    21ae:	60e0      	str	r0, [r4, #12]
	_state = TimerActive;
    21b0:	7507      	strb	r7, [r0, #20]
    21b2:	4630      	mov	r0, r6
    21b4:	460c      	mov	r4, r1
	while (waiting) {
    21b6:	2e00      	cmp	r6, #0
    21b8:	d1ec      	bne.n	2194 <MillisTimer::runFromTimer()+0x90>
    21ba:	6029      	str	r1, [r5, #0]
    21bc:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	if (listActive == nullptr) {
    21c0:	6828      	ldr	r0, [r5, #0]
    21c2:	4a46      	ldr	r2, [pc, #280]	; (22dc <MillisTimer::runFromTimer()+0x1d8>)
				timer->_ms = timer->_reload;
    21c4:	6023      	str	r3, [r4, #0]
	if (listActive == nullptr) {
    21c6:	2800      	cmp	r0, #0
    21c8:	d073      	beq.n	22b2 <MillisTimer::runFromTimer()+0x1ae>
	} else if (_ms < listActive->_ms) {
    21ca:	6801      	ldr	r1, [r0, #0]
    21cc:	428b      	cmp	r3, r1
    21ce:	d211      	bcs.n	21f4 <MillisTimer::runFromTimer()+0xf0>
		listActive->_ms -= _ms;	
    21d0:	1acb      	subs	r3, r1, r3
		_next = listActive;
    21d2:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    21d4:	60e6      	str	r6, [r4, #12]
		listActive->_ms -= _ms;	
    21d6:	6003      	str	r3, [r0, #0]
		listActive->_prev = this;
    21d8:	60c4      	str	r4, [r0, #12]
		listActive = this;
    21da:	6014      	str	r4, [r2, #0]
    21dc:	4620      	mov	r0, r4
	_state = TimerActive;
    21de:	2302      	movs	r3, #2
    21e0:	7523      	strb	r3, [r4, #20]
    21e2:	4604      	mov	r4, r0
    21e4:	e7c1      	b.n	216a <MillisTimer::runFromTimer()+0x66>
			event.triggerEvent(0, timer);
    21e6:	4622      	mov	r2, r4
    21e8:	2100      	movs	r1, #0
    21ea:	4798      	blx	r3
    21ec:	e7b8      	b.n	2160 <MillisTimer::runFromTimer()+0x5c>
			(*_function)(*this);
    21ee:	6883      	ldr	r3, [r0, #8]
    21f0:	4798      	blx	r3
    21f2:	e7b5      	b.n	2160 <MillisTimer::runFromTimer()+0x5c>
	} else if (_ms < listActive->_ms) {
    21f4:	4686      	mov	lr, r0
    21f6:	e003      	b.n	2200 <MillisTimer::runFromTimer()+0xfc>
			if (_ms < timer->_ms) {
    21f8:	6811      	ldr	r1, [r2, #0]
    21fa:	428b      	cmp	r3, r1
    21fc:	4696      	mov	lr, r2
    21fe:	d349      	bcc.n	2294 <MillisTimer::runFromTimer()+0x190>
		while (timer->_next) {
    2200:	f8de 2008 	ldr.w	r2, [lr, #8]
		_ms -= timer->_ms;
    2204:	1a5b      	subs	r3, r3, r1
    2206:	6023      	str	r3, [r4, #0]
		while (timer->_next) {
    2208:	2a00      	cmp	r2, #0
    220a:	d1f5      	bne.n	21f8 <MillisTimer::runFromTimer()+0xf4>
		_next = nullptr;
    220c:	60a2      	str	r2, [r4, #8]
		_prev = timer;
    220e:	f8c4 e00c 	str.w	lr, [r4, #12]
		timer->_next = this;
    2212:	f8ce 4008 	str.w	r4, [lr, #8]
    2216:	e7e2      	b.n	21de <MillisTimer::runFromTimer()+0xda>
	} else if (_ms < listActive->_ms) {
    2218:	46a4      	mov	ip, r4
    221a:	e003      	b.n	2224 <MillisTimer::runFromTimer()+0x120>
			if (_ms < timer->_ms) {
    221c:	6811      	ldr	r1, [r2, #0]
    221e:	428b      	cmp	r3, r1
    2220:	4694      	mov	ip, r2
    2222:	d30c      	bcc.n	223e <MillisTimer::runFromTimer()+0x13a>
		while (timer->_next) {
    2224:	f8dc 2008 	ldr.w	r2, [ip, #8]
		_ms -= timer->_ms;
    2228:	1a5b      	subs	r3, r3, r1
    222a:	6003      	str	r3, [r0, #0]
		while (timer->_next) {
    222c:	2a00      	cmp	r2, #0
    222e:	d1f5      	bne.n	221c <MillisTimer::runFromTimer()+0x118>
		_next = nullptr;
    2230:	6082      	str	r2, [r0, #8]
		_prev = timer;
    2232:	f8c0 c00c 	str.w	ip, [r0, #12]
		timer->_next = this;
    2236:	4621      	mov	r1, r4
    2238:	f8cc 0008 	str.w	r0, [ip, #8]
    223c:	e7b8      	b.n	21b0 <MillisTimer::runFromTimer()+0xac>
				_prev = timer->_prev;
    223e:	68d2      	ldr	r2, [r2, #12]
    2240:	60c2      	str	r2, [r0, #12]
				_next = timer;
    2242:	f8c0 c008 	str.w	ip, [r0, #8]
				timer->_prev = this;
    2246:	f8cc 000c 	str.w	r0, [ip, #12]
				_prev->_next = this;
    224a:	68c2      	ldr	r2, [r0, #12]
				timer->_ms -= _ms;
    224c:	1acb      	subs	r3, r1, r3
				_prev->_next = this;
    224e:	6090      	str	r0, [r2, #8]
				_state = TimerActive;
    2250:	4621      	mov	r1, r4
				timer->_ms -= _ms;
    2252:	f8cc 3000 	str.w	r3, [ip]
				_state = TimerActive;
    2256:	7507      	strb	r7, [r0, #20]
    2258:	e7ab      	b.n	21b2 <MillisTimer::runFromTimer()+0xae>
		_next = nullptr;
    225a:	6084      	str	r4, [r0, #8]
		_prev = nullptr;
    225c:	60c4      	str	r4, [r0, #12]
    225e:	4601      	mov	r1, r0
    2260:	e7a6      	b.n	21b0 <MillisTimer::runFromTimer()+0xac>
			if (firstYield == nullptr) {
    2262:	f8df e094 	ldr.w	lr, [pc, #148]	; 22f8 <MillisTimer::runFromTimer()+0x1f4>
    2266:	f8de 1000 	ldr.w	r1, [lr]
    226a:	b339      	cbz	r1, 22bc <MillisTimer::runFromTimer()+0x1b8>
				_prev = lastYield;
    226c:	491e      	ldr	r1, [pc, #120]	; (22e8 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    226e:	6143      	str	r3, [r0, #20]
				_prev = lastYield;
    2270:	680b      	ldr	r3, [r1, #0]
    2272:	6183      	str	r3, [r0, #24]
				lastYield = this;
    2274:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2276:	6158      	str	r0, [r3, #20]
    2278:	e76e      	b.n	2158 <MillisTimer::runFromTimer()+0x54>
			if (firstInterrupt == nullptr) {
    227a:	6839      	ldr	r1, [r7, #0]
    227c:	b329      	cbz	r1, 22ca <MillisTimer::runFromTimer()+0x1c6>
				_prev = lastInterrupt;
    227e:	491b      	ldr	r1, [pc, #108]	; (22ec <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    2280:	6143      	str	r3, [r0, #20]
				_prev = lastInterrupt;
    2282:	680b      	ldr	r3, [r1, #0]
    2284:	6183      	str	r3, [r0, #24]
				lastInterrupt = this;
    2286:	6008      	str	r0, [r1, #0]
				_prev->_next = this;
    2288:	6158      	str	r0, [r3, #20]
			SCB_ICSR = SCB_ICSR_PENDSVSET; // set PendSV interrupt
    228a:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    228e:	f8c8 3000 	str.w	r3, [r8]
    2292:	e761      	b.n	2158 <MillisTimer::runFromTimer()+0x54>
				_prev = timer->_prev;
    2294:	68d2      	ldr	r2, [r2, #12]
    2296:	60e2      	str	r2, [r4, #12]
				_next = timer;
    2298:	f8c4 e008 	str.w	lr, [r4, #8]
				timer->_prev = this;
    229c:	f8ce 400c 	str.w	r4, [lr, #12]
				_prev->_next = this;
    22a0:	68e2      	ldr	r2, [r4, #12]
				timer->_ms -= _ms;
    22a2:	1acb      	subs	r3, r1, r3
				_state = TimerActive;
    22a4:	2102      	movs	r1, #2
				_prev->_next = this;
    22a6:	6094      	str	r4, [r2, #8]
				timer->_ms -= _ms;
    22a8:	f8ce 3000 	str.w	r3, [lr]
				_state = TimerActive;
    22ac:	7521      	strb	r1, [r4, #20]
    22ae:	4604      	mov	r4, r0
    22b0:	e75b      	b.n	216a <MillisTimer::runFromTimer()+0x66>
		_next = nullptr;
    22b2:	60a0      	str	r0, [r4, #8]
		_prev = nullptr;
    22b4:	60e0      	str	r0, [r4, #12]
		listActive = this;
    22b6:	6014      	str	r4, [r2, #0]
    22b8:	4620      	mov	r0, r4
    22ba:	e790      	b.n	21de <MillisTimer::runFromTimer()+0xda>
				lastYield = this;
    22bc:	4b0a      	ldr	r3, [pc, #40]	; (22e8 <MillisTimer::runFromTimer()+0x1e4>)
				_next = nullptr;
    22be:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    22c0:	6181      	str	r1, [r0, #24]
				firstYield = this;
    22c2:	f8ce 0000 	str.w	r0, [lr]
				lastYield = this;
    22c6:	6018      	str	r0, [r3, #0]
    22c8:	e746      	b.n	2158 <MillisTimer::runFromTimer()+0x54>
				lastInterrupt = this;
    22ca:	4b08      	ldr	r3, [pc, #32]	; (22ec <MillisTimer::runFromTimer()+0x1e8>)
				_next = nullptr;
    22cc:	6141      	str	r1, [r0, #20]
				_prev = nullptr;
    22ce:	6181      	str	r1, [r0, #24]
				firstInterrupt = this;
    22d0:	6038      	str	r0, [r7, #0]
				lastInterrupt = this;
    22d2:	6018      	str	r0, [r3, #0]
    22d4:	e7d9      	b.n	228a <MillisTimer::runFromTimer()+0x186>
    22d6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    22da:	bf00      	nop
    22dc:	1fff93e0 	.word	0x1fff93e0
    22e0:	1fff93d8 	.word	0x1fff93d8
    22e4:	1fff93f0 	.word	0x1fff93f0
    22e8:	1fff93e4 	.word	0x1fff93e4
    22ec:	1fff93dc 	.word	0x1fff93dc
    22f0:	00002031 	.word	0x00002031
    22f4:	e000ed04 	.word	0xe000ed04
    22f8:	1fff93e8 	.word	0x1fff93e8

000022fc <systick_isr>:
// with libraries using mid-to-high priority interrupts.

extern "C" volatile uint32_t systick_millis_count;
void systick_isr(void)
{
	systick_millis_count++;
    22fc:	4a02      	ldr	r2, [pc, #8]	; (2308 <systick_isr+0xc>)
    22fe:	6813      	ldr	r3, [r2, #0]
    2300:	3301      	adds	r3, #1
    2302:	6013      	str	r3, [r2, #0]
	MillisTimer::runFromTimer();
    2304:	f7ff befe 	b.w	2104 <MillisTimer::runFromTimer()>
    2308:	1fff92d8 	.word	0x1fff92d8

0000230c <serialEvent1()>:
#include "HardwareSerial.h"

HardwareSerial Serial1;

void serialEvent1() __attribute__((weak));
void serialEvent1() {}
    230c:	4770      	bx	lr
    230e:	bf00      	nop

00002310 <serialEvent2()>:
#include "HardwareSerial.h"

HardwareSerial2 Serial2;

void serialEvent2() __attribute__((weak));
void serialEvent2() {}
    2310:	4770      	bx	lr
    2312:	bf00      	nop

00002314 <serialEvent3()>:
#include "HardwareSerial.h"

HardwareSerial3 Serial3;

void serialEvent3() __attribute__((weak));
void serialEvent3() {}
    2314:	4770      	bx	lr
    2316:	bf00      	nop

00002318 <analog_init>:
#else
#error "F_BUS must be 120, 108, 96, 90, 80, 72, 64, 60, 56, 54, 48, 40, 36, 24, 4 or 2 MHz"
#endif

void analog_init(void)
{
    2318:	b430      	push	{r4, r5}
	uint32_t num;

	#if defined(__MK20DX128__) || defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	VREF_TRM = 0x60;
    231a:	4829      	ldr	r0, [pc, #164]	; (23c0 <analog_init+0xa8>)
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    231c:	4a29      	ldr	r2, [pc, #164]	; (23c4 <analog_init+0xac>)
	#endif

	if (analog_config_bits == 8) {
    231e:	4b2a      	ldr	r3, [pc, #168]	; (23c8 <analog_init+0xb0>)
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2320:	4d2a      	ldr	r5, [pc, #168]	; (23cc <analog_init+0xb4>)
	VREF_TRM = 0x60;
    2322:	2460      	movs	r4, #96	; 0x60
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2324:	21e1      	movs	r1, #225	; 0xe1
	VREF_TRM = 0x60;
    2326:	7004      	strb	r4, [r0, #0]
	VREF_SC = 0xE1;		// enable 1.2 volt ref
    2328:	7011      	strb	r1, [r2, #0]
	if (analog_config_bits == 8) {
    232a:	781b      	ldrb	r3, [r3, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    232c:	4c28      	ldr	r4, [pc, #160]	; (23d0 <analog_init+0xb8>)
	if (analog_config_bits == 8) {
    232e:	2b08      	cmp	r3, #8
    2330:	d030      	beq.n	2394 <analog_init+0x7c>
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#endif
	} else if (analog_config_bits == 10) {
    2332:	2b0a      	cmp	r3, #10
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    2334:	4827      	ldr	r0, [pc, #156]	; (23d4 <analog_init+0xbc>)
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2336:	4928      	ldr	r1, [pc, #160]	; (23d8 <analog_init+0xc0>)
	} else if (analog_config_bits == 10) {
    2338:	d037      	beq.n	23aa <analog_init+0x92>
		#endif
	} else if (analog_config_bits == 12) {
    233a:	2b0c      	cmp	r3, #12
		ADC0_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
    233c:	bf0c      	ite	eq
    233e:	2235      	moveq	r2, #53	; 0x35
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_12BIT + ADC_CFG1_MODE(1) + ADC_CFG1_ADLSMP;
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
		#endif
	} else {
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2340:	225d      	movne	r2, #93	; 0x5d
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2342:	2312      	movs	r3, #18
		ADC0_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2344:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    2346:	6023      	str	r3, [r4, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_CFG1 = ADC_CFG1_16BIT + ADC_CFG1_MODE(3) + ADC_CFG1_ADLSMP;
    2348:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(2);
    234a:	600b      	str	r3, [r1, #0]
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
	}
	#elif defined(__MK20DX256__) || defined(__MK64FX512__) || defined(__MK66FX1M0__)
	if (analog_reference_internal) {
    234c:	4b23      	ldr	r3, [pc, #140]	; (23dc <analog_init+0xc4>)
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    234e:	4924      	ldr	r1, [pc, #144]	; (23e0 <analog_init+0xc8>)
	if (analog_reference_internal) {
    2350:	781b      	ldrb	r3, [r3, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2352:	4a24      	ldr	r2, [pc, #144]	; (23e4 <analog_init+0xcc>)
	if (analog_reference_internal) {
    2354:	b1bb      	cbz	r3, 2386 <analog_init+0x6e>
		ADC0_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    2356:	2301      	movs	r3, #1
    2358:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(1); // 1.2V ref
    235a:	6013      	str	r3, [r2, #0]
	} else {
		ADC0_SC2 = ADC_SC2_REFSEL(1); // vcc
	}
	#endif

	num = analog_num_average;
    235c:	4b22      	ldr	r3, [pc, #136]	; (23e8 <analog_init+0xd0>)
	if (num <= 1) {
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    235e:	4923      	ldr	r1, [pc, #140]	; (23ec <analog_init+0xd4>)
	num = analog_num_average;
    2360:	781b      	ldrb	r3, [r3, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    2362:	4a23      	ldr	r2, [pc, #140]	; (23f0 <analog_init+0xd8>)
	if (num <= 1) {
    2364:	2b01      	cmp	r3, #1
    2366:	d926      	bls.n	23b6 <analog_init+0x9e>
		#endif
	} else if (num <= 4) {
    2368:	2b04      	cmp	r3, #4
    236a:	d90f      	bls.n	238c <analog_init+0x74>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
		#endif
	} else if (num <= 8) {
    236c:	2b08      	cmp	r3, #8
    236e:	d91e      	bls.n	23ae <analog_init+0x96>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
		#endif
	} else if (num <= 16) {
    2370:	2b10      	cmp	r3, #16
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
    2372:	bf94      	ite	ls
    2374:	2386      	movls	r3, #134	; 0x86
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(2);
		#endif
	} else {
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    2376:	2387      	movhi	r3, #135	; 0x87
    2378:	600b      	str	r3, [r1, #0]
		#ifdef HAS_KINETIS_ADC1
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(3);
    237a:	6013      	str	r3, [r2, #0]
		#endif
	}
	calibrating = 1;
    237c:	4b1d      	ldr	r3, [pc, #116]	; (23f4 <analog_init+0xdc>)
    237e:	2201      	movs	r2, #1
    2380:	701a      	strb	r2, [r3, #0]
}
    2382:	bc30      	pop	{r4, r5}
    2384:	4770      	bx	lr
		ADC0_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2386:	600b      	str	r3, [r1, #0]
		ADC1_SC2 = ADC_SC2_REFSEL(0); // vcc/ext ref
    2388:	6013      	str	r3, [r2, #0]
    238a:	e7e7      	b.n	235c <analog_init+0x44>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    238c:	2384      	movs	r3, #132	; 0x84
    238e:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(0);
    2390:	6013      	str	r3, [r2, #0]
    2392:	e7f3      	b.n	237c <analog_init+0x64>
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    2394:	f500 208e 	add.w	r0, r0, #290816	; 0x47000
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    2398:	490f      	ldr	r1, [pc, #60]	; (23d8 <analog_init+0xc0>)
		ADC1_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    239a:	3008      	adds	r0, #8
		ADC0_CFG1 = ADC_CFG1_8BIT + ADC_CFG1_MODE(0);
    239c:	2221      	movs	r2, #33	; 0x21
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    239e:	2313      	movs	r3, #19
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    23a0:	602a      	str	r2, [r5, #0]
		ADC0_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    23a2:	6023      	str	r3, [r4, #0]
		ADC1_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    23a4:	6002      	str	r2, [r0, #0]
		ADC1_CFG2 = ADC_CFG2_MUXSEL + ADC_CFG2_ADLSTS(3);
    23a6:	600b      	str	r3, [r1, #0]
    23a8:	e7d0      	b.n	234c <analog_init+0x34>
		ADC0_CFG1 = ADC_CFG1_10BIT + ADC_CFG1_MODE(2) + ADC_CFG1_ADLSMP;
    23aa:	2239      	movs	r2, #57	; 0x39
    23ac:	e7f7      	b.n	239e <analog_init+0x86>
		ADC0_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    23ae:	2385      	movs	r3, #133	; 0x85
    23b0:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL + ADC_SC3_AVGE + ADC_SC3_AVGS(1);
    23b2:	6013      	str	r3, [r2, #0]
    23b4:	e7e2      	b.n	237c <analog_init+0x64>
		ADC0_SC3 = ADC_SC3_CAL;  // begin cal
    23b6:	2380      	movs	r3, #128	; 0x80
    23b8:	600b      	str	r3, [r1, #0]
		ADC1_SC3 = ADC_SC3_CAL;  // begin cal
    23ba:	6013      	str	r3, [r2, #0]
    23bc:	e7de      	b.n	237c <analog_init+0x64>
    23be:	bf00      	nop
    23c0:	40074000 	.word	0x40074000
    23c4:	40074001 	.word	0x40074001
    23c8:	1fff8904 	.word	0x1fff8904
    23cc:	4003b008 	.word	0x4003b008
    23d0:	4003b00c 	.word	0x4003b00c
    23d4:	400bb008 	.word	0x400bb008
    23d8:	400bb00c 	.word	0x400bb00c
    23dc:	1fff93f5 	.word	0x1fff93f5
    23e0:	4003b020 	.word	0x4003b020
    23e4:	400bb020 	.word	0x400bb020
    23e8:	1fff8905 	.word	0x1fff8905
    23ec:	4003b024 	.word	0x4003b024
    23f0:	400bb024 	.word	0x400bb024
    23f4:	1fff93f4 	.word	0x1fff93f4

000023f8 <serial_available>:

int serial_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    23f8:	4a05      	ldr	r2, [pc, #20]	; (2410 <serial_available+0x18>)
	tail = rx_buffer_tail;
    23fa:	4b06      	ldr	r3, [pc, #24]	; (2414 <serial_available+0x1c>)
	head = rx_buffer_head;
    23fc:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    23fe:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2400:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    2402:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2404:	4298      	cmp	r0, r3
	return SERIAL1_RX_BUFFER_SIZE + head - tail;
    2406:	bf38      	it	cc
    2408:	3040      	addcc	r0, #64	; 0x40
    240a:	1ac0      	subs	r0, r0, r3
}
    240c:	4770      	bx	lr
    240e:	bf00      	nop
    2410:	1fff9480 	.word	0x1fff9480
    2414:	1fff93fd 	.word	0x1fff93fd

00002418 <uart0_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart0_status_isr(void)
{
    2418:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART0_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART0_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    241a:	4b38      	ldr	r3, [pc, #224]	; (24fc <uart0_status_isr+0xe4>)
    241c:	791a      	ldrb	r2, [r3, #4]
    241e:	f012 0f30 	tst.w	r2, #48	; 0x30
    2422:	d02c      	beq.n	247e <uart0_status_isr+0x66>
		__disable_irq();
    2424:	b672      	cpsid	i
		avail = UART0_RCFIFO;
    2426:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2428:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    242c:	2900      	cmp	r1, #0
    242e:	d03d      	beq.n	24ac <uart0_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    2430:	b662      	cpsie	i
			head = rx_buffer_head;
    2432:	4f33      	ldr	r7, [pc, #204]	; (2500 <uart0_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2434:	4933      	ldr	r1, [pc, #204]	; (2504 <uart0_status_isr+0xec>)
			head = rx_buffer_head;
    2436:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2438:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    243a:	4e33      	ldr	r6, [pc, #204]	; (2508 <uart0_status_isr+0xf0>)
					n = UART0_D;
    243c:	461c      	mov	r4, r3
			head = rx_buffer_head;
    243e:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    2440:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    2442:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2444:	2b40      	cmp	r3, #64	; 0x40
					n = UART0_D;
    2446:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL1_RX_BUFFER_SIZE) newhead = 0;
    2448:	bf28      	it	cs
    244a:	2300      	movcs	r3, #0
				if (newhead != tail) {
    244c:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    244e:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART0_D;
    2452:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2454:	bf1c      	itt	ne
    2456:	54f1      	strbne	r1, [r6, r3]
    2458:	4618      	movne	r0, r3
			} while (--avail > 0);
    245a:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    245e:	d1f0      	bne.n	2442 <uart0_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    2460:	4b2a      	ldr	r3, [pc, #168]	; (250c <uart0_status_isr+0xf4>)
    2462:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2464:	b2c2      	uxtb	r2, r0
    2466:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2468:	b14b      	cbz	r3, 247e <uart0_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    246a:	42a8      	cmp	r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    246c:	bf36      	itet	cc
    246e:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    2472:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL1_RX_BUFFER_SIZE + head - tail;
    2474:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    2476:	2827      	cmp	r0, #39	; 0x27
    2478:	bfc4      	itt	gt
    247a:	2201      	movgt	r2, #1
    247c:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART0_C2;
    247e:	491f      	ldr	r1, [pc, #124]	; (24fc <uart0_status_isr+0xe4>)
    2480:	78ca      	ldrb	r2, [r1, #3]
    2482:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    2484:	0615      	lsls	r5, r2, #24
    2486:	d416      	bmi.n	24b6 <uart0_status_isr+0x9e>
			UART0_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART0_S1 & UART_S1_TC)) {
    2488:	0652      	lsls	r2, r2, #25
    248a:	d50d      	bpl.n	24a8 <uart0_status_isr+0x90>
    248c:	4b1b      	ldr	r3, [pc, #108]	; (24fc <uart0_status_isr+0xe4>)
    248e:	791b      	ldrb	r3, [r3, #4]
    2490:	065b      	lsls	r3, r3, #25
    2492:	d509      	bpl.n	24a8 <uart0_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    2494:	4b1e      	ldr	r3, [pc, #120]	; (2510 <uart0_status_isr+0xf8>)
		transmitting = 0;
    2496:	491f      	ldr	r1, [pc, #124]	; (2514 <uart0_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    2498:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    249a:	2200      	movs	r2, #0
    249c:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    249e:	b103      	cbz	r3, 24a2 <uart0_status_isr+0x8a>
    24a0:	701a      	strb	r2, [r3, #0]
		UART0_C2 = C2_TX_INACTIVE;
    24a2:	4b16      	ldr	r3, [pc, #88]	; (24fc <uart0_status_isr+0xe4>)
    24a4:	223c      	movs	r2, #60	; 0x3c
    24a6:	70da      	strb	r2, [r3, #3]
	}
}
    24a8:	bcf0      	pop	{r4, r5, r6, r7}
    24aa:	4770      	bx	lr
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    24ac:	2240      	movs	r2, #64	; 0x40
			c = UART0_D;
    24ae:	79d9      	ldrb	r1, [r3, #7]
			UART0_CFIFO = UART_CFIFO_RXFLUSH;
    24b0:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    24b2:	b662      	cpsie	i
    24b4:	e7e3      	b.n	247e <uart0_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART0_S1 & UART_S1_TDRE)) {
    24b6:	790b      	ldrb	r3, [r1, #4]
    24b8:	061c      	lsls	r4, r3, #24
    24ba:	d5e5      	bpl.n	2488 <uart0_status_isr+0x70>
		head = tx_buffer_head;
    24bc:	4b16      	ldr	r3, [pc, #88]	; (2518 <uart0_status_isr+0x100>)
		tail = tx_buffer_tail;
    24be:	4e17      	ldr	r6, [pc, #92]	; (251c <uart0_status_isr+0x104>)
		head = tx_buffer_head;
    24c0:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    24c2:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    24c4:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    24c6:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    24c8:	429c      	cmp	r4, r3
    24ca:	d00e      	beq.n	24ea <uart0_status_isr+0xd2>
    24cc:	4d14      	ldr	r5, [pc, #80]	; (2520 <uart0_status_isr+0x108>)
    24ce:	e001      	b.n	24d4 <uart0_status_isr+0xbc>
    24d0:	42a3      	cmp	r3, r4
    24d2:	d00a      	beq.n	24ea <uart0_status_isr+0xd2>
			if (++tail >= SERIAL1_TX_BUFFER_SIZE) tail = 0;
    24d4:	3301      	adds	r3, #1
    24d6:	2b40      	cmp	r3, #64	; 0x40
    24d8:	bf28      	it	cs
    24da:	2300      	movcs	r3, #0
			avail = UART0_S1;
    24dc:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    24de:	5ce8      	ldrb	r0, [r5, r3]
    24e0:	b2c0      	uxtb	r0, r0
			UART0_D = n;
    24e2:	71c8      	strb	r0, [r1, #7]
		} while (UART0_TCFIFO < 8);
    24e4:	7d08      	ldrb	r0, [r1, #20]
    24e6:	2807      	cmp	r0, #7
    24e8:	d9f2      	bls.n	24d0 <uart0_status_isr+0xb8>
		tx_buffer_tail = tail;
    24ea:	b2db      	uxtb	r3, r3
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    24ec:	4903      	ldr	r1, [pc, #12]	; (24fc <uart0_status_isr+0xe4>)
		tx_buffer_tail = tail;
    24ee:	7033      	strb	r3, [r6, #0]
		if (UART0_S1 & UART_S1_TDRE) UART0_C2 = C2_TX_COMPLETING;
    24f0:	790b      	ldrb	r3, [r1, #4]
    24f2:	0618      	lsls	r0, r3, #24
    24f4:	bf44      	itt	mi
    24f6:	237c      	movmi	r3, #124	; 0x7c
    24f8:	70cb      	strbmi	r3, [r1, #3]
    24fa:	e7c5      	b.n	2488 <uart0_status_isr+0x70>
    24fc:	4006a000 	.word	0x4006a000
    2500:	1fff9480 	.word	0x1fff9480
    2504:	1fff93fd 	.word	0x1fff93fd
    2508:	1fff9440 	.word	0x1fff9440
    250c:	1fff93f8 	.word	0x1fff93f8
    2510:	1fff9484 	.word	0x1fff9484
    2514:	1fff93fc 	.word	0x1fff93fc
    2518:	1fff9488 	.word	0x1fff9488
    251c:	1fff9481 	.word	0x1fff9481
    2520:	1fff9400 	.word	0x1fff9400

00002524 <serial2_available>:

int serial2_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2524:	4a05      	ldr	r2, [pc, #20]	; (253c <serial2_available+0x18>)
	tail = rx_buffer_tail;
    2526:	4b06      	ldr	r3, [pc, #24]	; (2540 <serial2_available+0x1c>)
	head = rx_buffer_head;
    2528:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    252a:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    252c:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    252e:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    2530:	4298      	cmp	r0, r3
	return SERIAL2_RX_BUFFER_SIZE + head - tail;
    2532:	bf38      	it	cc
    2534:	3040      	addcc	r0, #64	; 0x40
    2536:	1ac0      	subs	r0, r0, r3
}
    2538:	4770      	bx	lr
    253a:	bf00      	nop
    253c:	1fff94fc 	.word	0x1fff94fc
    2540:	1fff9491 	.word	0x1fff9491

00002544 <uart1_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart1_status_isr(void)
{
    2544:	b4f0      	push	{r4, r5, r6, r7}
	uint8_t c;
#ifdef HAS_KINETISK_UART1_FIFO
	uint32_t newhead;
	uint8_t avail;

	if (UART1_S1 & (UART_S1_RDRF | UART_S1_IDLE)) {
    2546:	4b38      	ldr	r3, [pc, #224]	; (2628 <uart1_status_isr+0xe4>)
    2548:	791a      	ldrb	r2, [r3, #4]
    254a:	f012 0f30 	tst.w	r2, #48	; 0x30
    254e:	d02c      	beq.n	25aa <uart1_status_isr+0x66>
		__disable_irq();
    2550:	b672      	cpsid	i
		avail = UART1_RCFIFO;
    2552:	7d99      	ldrb	r1, [r3, #22]
		if (avail == 0) {
    2554:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    2558:	2900      	cmp	r1, #0
    255a:	d03d      	beq.n	25d8 <uart1_status_isr+0x94>
			// which won't be simple, since we already manage
			// which transmit interrupts are enabled.
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
			__enable_irq();
		} else {
			__enable_irq();
    255c:	b662      	cpsie	i
			head = rx_buffer_head;
    255e:	4f33      	ldr	r7, [pc, #204]	; (262c <uart1_status_isr+0xe8>)
			tail = rx_buffer_tail;
    2560:	4933      	ldr	r1, [pc, #204]	; (2630 <uart1_status_isr+0xec>)
			head = rx_buffer_head;
    2562:	7838      	ldrb	r0, [r7, #0]
			tail = rx_buffer_tail;
    2564:	780d      	ldrb	r5, [r1, #0]
				}
				newhead = head + 1;
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
				if (newhead != tail) {
					head = newhead;
					rx_buffer[head] = n;
    2566:	4e33      	ldr	r6, [pc, #204]	; (2634 <uart1_status_isr+0xf0>)
					n = UART1_D;
    2568:	461c      	mov	r4, r3
			head = rx_buffer_head;
    256a:	b2c0      	uxtb	r0, r0
			tail = rx_buffer_tail;
    256c:	b2ed      	uxtb	r5, r5
				newhead = head + 1;
    256e:	1c43      	adds	r3, r0, #1
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2570:	2b40      	cmp	r3, #64	; 0x40
					n = UART1_D;
    2572:	79e1      	ldrb	r1, [r4, #7]
				if (newhead >= SERIAL2_RX_BUFFER_SIZE) newhead = 0;
    2574:	bf28      	it	cs
    2576:	2300      	movcs	r3, #0
				if (newhead != tail) {
    2578:	42ab      	cmp	r3, r5
				}
			} while (--avail > 0);
    257a:	f102 32ff 	add.w	r2, r2, #4294967295
					n = UART1_D;
    257e:	b2c9      	uxtb	r1, r1
					rx_buffer[head] = n;
    2580:	bf1c      	itt	ne
    2582:	54f1      	strbne	r1, [r6, r3]
    2584:	4618      	movne	r0, r3
			} while (--avail > 0);
    2586:	f012 02ff 	ands.w	r2, r2, #255	; 0xff
    258a:	d1f0      	bne.n	256e <uart1_status_isr+0x2a>
			rx_buffer_head = head;
			if (rts_pin) {
    258c:	4b2a      	ldr	r3, [pc, #168]	; (2638 <uart1_status_isr+0xf4>)
    258e:	681b      	ldr	r3, [r3, #0]
			rx_buffer_head = head;
    2590:	b2c2      	uxtb	r2, r0
    2592:	703a      	strb	r2, [r7, #0]
			if (rts_pin) {
    2594:	b14b      	cbz	r3, 25aa <uart1_status_isr+0x66>
				int avail;
				if (head >= tail) avail = head - tail;
    2596:	42a8      	cmp	r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    2598:	bf36      	itet	cc
    259a:	f1c5 0540 	rsbcc	r5, r5, #64	; 0x40
				if (head >= tail) avail = head - tail;
    259e:	1b40      	subcs	r0, r0, r5
				else avail = SERIAL2_RX_BUFFER_SIZE + head - tail;
    25a0:	1940      	addcc	r0, r0, r5
				if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    25a2:	2827      	cmp	r0, #39	; 0x27
    25a4:	bfc4      	itt	gt
    25a6:	2201      	movgt	r2, #1
    25a8:	701a      	strbgt	r2, [r3, #0]
			}
		}
	}
	c = UART1_C2;
    25aa:	491f      	ldr	r1, [pc, #124]	; (2628 <uart1_status_isr+0xe4>)
    25ac:	78ca      	ldrb	r2, [r1, #3]
    25ae:	b2d2      	uxtb	r2, r2
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    25b0:	0615      	lsls	r5, r2, #24
    25b2:	d416      	bmi.n	25e2 <uart1_status_isr+0x9e>
			UART1_D = n;
			tx_buffer_tail = tail;
		}
	}
#endif
	if ((c & UART_C2_TCIE) && (UART1_S1 & UART_S1_TC)) {
    25b4:	0652      	lsls	r2, r2, #25
    25b6:	d50d      	bpl.n	25d4 <uart1_status_isr+0x90>
    25b8:	4b1b      	ldr	r3, [pc, #108]	; (2628 <uart1_status_isr+0xe4>)
    25ba:	791b      	ldrb	r3, [r3, #4]
    25bc:	065b      	lsls	r3, r3, #25
    25be:	d509      	bpl.n	25d4 <uart1_status_isr+0x90>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    25c0:	4b1e      	ldr	r3, [pc, #120]	; (263c <uart1_status_isr+0xf8>)
		transmitting = 0;
    25c2:	491f      	ldr	r1, [pc, #124]	; (2640 <uart1_status_isr+0xfc>)
		if (transmit_pin) transmit_deassert();
    25c4:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    25c6:	2200      	movs	r2, #0
    25c8:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    25ca:	b103      	cbz	r3, 25ce <uart1_status_isr+0x8a>
    25cc:	701a      	strb	r2, [r3, #0]
		UART1_C2 = C2_TX_INACTIVE;
    25ce:	4b16      	ldr	r3, [pc, #88]	; (2628 <uart1_status_isr+0xe4>)
    25d0:	223c      	movs	r2, #60	; 0x3c
    25d2:	70da      	strb	r2, [r3, #3]
	}
}
    25d4:	bcf0      	pop	{r4, r5, r6, r7}
    25d6:	4770      	bx	lr
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    25d8:	2240      	movs	r2, #64	; 0x40
			c = UART1_D;
    25da:	79d9      	ldrb	r1, [r3, #7]
			UART1_CFIFO = UART_CFIFO_RXFLUSH;
    25dc:	745a      	strb	r2, [r3, #17]
			__enable_irq();
    25de:	b662      	cpsie	i
    25e0:	e7e3      	b.n	25aa <uart1_status_isr+0x66>
	if ((c & UART_C2_TIE) && (UART1_S1 & UART_S1_TDRE)) {
    25e2:	790b      	ldrb	r3, [r1, #4]
    25e4:	061c      	lsls	r4, r3, #24
    25e6:	d5e5      	bpl.n	25b4 <uart1_status_isr+0x70>
		head = tx_buffer_head;
    25e8:	4b16      	ldr	r3, [pc, #88]	; (2644 <uart1_status_isr+0x100>)
		tail = tx_buffer_tail;
    25ea:	4e17      	ldr	r6, [pc, #92]	; (2648 <uart1_status_isr+0x104>)
		head = tx_buffer_head;
    25ec:	781c      	ldrb	r4, [r3, #0]
		tail = tx_buffer_tail;
    25ee:	7833      	ldrb	r3, [r6, #0]
		head = tx_buffer_head;
    25f0:	b2e4      	uxtb	r4, r4
		tail = tx_buffer_tail;
    25f2:	b2db      	uxtb	r3, r3
			if (tail == head) break;
    25f4:	429c      	cmp	r4, r3
    25f6:	d00e      	beq.n	2616 <uart1_status_isr+0xd2>
    25f8:	4d14      	ldr	r5, [pc, #80]	; (264c <uart1_status_isr+0x108>)
    25fa:	e001      	b.n	2600 <uart1_status_isr+0xbc>
    25fc:	42a3      	cmp	r3, r4
    25fe:	d00a      	beq.n	2616 <uart1_status_isr+0xd2>
			if (++tail >= SERIAL2_TX_BUFFER_SIZE) tail = 0;
    2600:	3301      	adds	r3, #1
    2602:	2b28      	cmp	r3, #40	; 0x28
    2604:	bf28      	it	cs
    2606:	2300      	movcs	r3, #0
			avail = UART1_S1;
    2608:	7908      	ldrb	r0, [r1, #4]
			n = tx_buffer[tail];
    260a:	5ce8      	ldrb	r0, [r5, r3]
    260c:	b2c0      	uxtb	r0, r0
			UART1_D = n;
    260e:	71c8      	strb	r0, [r1, #7]
		} while (UART1_TCFIFO < 8);
    2610:	7d08      	ldrb	r0, [r1, #20]
    2612:	2807      	cmp	r0, #7
    2614:	d9f2      	bls.n	25fc <uart1_status_isr+0xb8>
		tx_buffer_tail = tail;
    2616:	b2db      	uxtb	r3, r3
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    2618:	4903      	ldr	r1, [pc, #12]	; (2628 <uart1_status_isr+0xe4>)
		tx_buffer_tail = tail;
    261a:	7033      	strb	r3, [r6, #0]
		if (UART1_S1 & UART_S1_TDRE) UART1_C2 = C2_TX_COMPLETING;
    261c:	790b      	ldrb	r3, [r1, #4]
    261e:	0618      	lsls	r0, r3, #24
    2620:	bf44      	itt	mi
    2622:	237c      	movmi	r3, #124	; 0x7c
    2624:	70cb      	strbmi	r3, [r1, #3]
    2626:	e7c5      	b.n	25b4 <uart1_status_isr+0x70>
    2628:	4006b000 	.word	0x4006b000
    262c:	1fff94fc 	.word	0x1fff94fc
    2630:	1fff9491 	.word	0x1fff9491
    2634:	1fff94bc 	.word	0x1fff94bc
    2638:	1fff948c 	.word	0x1fff948c
    263c:	1fff9500 	.word	0x1fff9500
    2640:	1fff9490 	.word	0x1fff9490
    2644:	1fff9504 	.word	0x1fff9504
    2648:	1fff94fd 	.word	0x1fff94fd
    264c:	1fff9494 	.word	0x1fff9494

00002650 <serial3_available>:

int serial3_available(void)
{
	uint32_t head, tail;

	head = rx_buffer_head;
    2650:	4a05      	ldr	r2, [pc, #20]	; (2668 <serial3_available+0x18>)
	tail = rx_buffer_tail;
    2652:	4b06      	ldr	r3, [pc, #24]	; (266c <serial3_available+0x1c>)
	head = rx_buffer_head;
    2654:	7810      	ldrb	r0, [r2, #0]
	tail = rx_buffer_tail;
    2656:	781b      	ldrb	r3, [r3, #0]
	head = rx_buffer_head;
    2658:	b2c0      	uxtb	r0, r0
	tail = rx_buffer_tail;
    265a:	b2db      	uxtb	r3, r3
	if (head >= tail) return head - tail;
    265c:	4298      	cmp	r0, r3
	return SERIAL3_RX_BUFFER_SIZE + head - tail;
    265e:	bf38      	it	cc
    2660:	3040      	addcc	r0, #64	; 0x40
    2662:	1ac0      	subs	r0, r0, r3
}
    2664:	4770      	bx	lr
    2666:	bf00      	nop
    2668:	1fff9578 	.word	0x1fff9578
    266c:	1fff950d 	.word	0x1fff950d

00002670 <uart2_status_isr>:
//   Receive data above watermark   UART_S1_RDRF
//   LIN break detect		    UART_S2_LBKDIF
//   RxD pin active edge	    UART_S2_RXEDGIF

void uart2_status_isr(void)
{
    2670:	b430      	push	{r4, r5}
	uint32_t head, tail, n;
	uint8_t c;

	if (UART2_S1 & UART_S1_RDRF) {
    2672:	4b2b      	ldr	r3, [pc, #172]	; (2720 <uart2_status_isr+0xb0>)
    2674:	791a      	ldrb	r2, [r3, #4]
    2676:	0694      	lsls	r4, r2, #26
    2678:	d51f      	bpl.n	26ba <uart2_status_isr+0x4a>
		if (use9Bits && (UART2_C3 & 0x80)) {
			n = UART2_D | 0x100;
		} else {
			n = UART2_D;
		}
		head = rx_buffer_head + 1;
    267a:	482a      	ldr	r0, [pc, #168]	; (2724 <uart2_status_isr+0xb4>)
			n = UART2_D;
    267c:	79da      	ldrb	r2, [r3, #7]
		head = rx_buffer_head + 1;
    267e:	7803      	ldrb	r3, [r0, #0]
		if (head >= SERIAL3_RX_BUFFER_SIZE) head = 0;
		if (head != rx_buffer_tail) {
    2680:	4929      	ldr	r1, [pc, #164]	; (2728 <uart2_status_isr+0xb8>)
		head = rx_buffer_head + 1;
    2682:	3301      	adds	r3, #1
    2684:	2b3f      	cmp	r3, #63	; 0x3f
		if (head != rx_buffer_tail) {
    2686:	7809      	ldrb	r1, [r1, #0]
		head = rx_buffer_head + 1;
    2688:	bfc8      	it	gt
    268a:	2300      	movgt	r3, #0
		if (head != rx_buffer_tail) {
    268c:	428b      	cmp	r3, r1
			n = UART2_D;
    268e:	b2d2      	uxtb	r2, r2
		if (head != rx_buffer_tail) {
    2690:	d003      	beq.n	269a <uart2_status_isr+0x2a>
			rx_buffer[head] = n;
    2692:	4c26      	ldr	r4, [pc, #152]	; (272c <uart2_status_isr+0xbc>)
			rx_buffer_head = head;
    2694:	b2d9      	uxtb	r1, r3
			rx_buffer[head] = n;
    2696:	54e2      	strb	r2, [r4, r3]
			rx_buffer_head = head;
    2698:	7001      	strb	r1, [r0, #0]
		}
		if (rts_pin) {
    269a:	4a25      	ldr	r2, [pc, #148]	; (2730 <uart2_status_isr+0xc0>)
    269c:	6811      	ldr	r1, [r2, #0]
    269e:	b161      	cbz	r1, 26ba <uart2_status_isr+0x4a>
			int avail;
			tail = tx_buffer_tail;
    26a0:	4a24      	ldr	r2, [pc, #144]	; (2734 <uart2_status_isr+0xc4>)
    26a2:	7812      	ldrb	r2, [r2, #0]
    26a4:	b2d2      	uxtb	r2, r2
			if (head >= tail) avail = head - tail;
    26a6:	4293      	cmp	r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    26a8:	bf36      	itet	cc
    26aa:	f1c2 0240 	rsbcc	r2, r2, #64	; 0x40
			if (head >= tail) avail = head - tail;
    26ae:	1a9b      	subcs	r3, r3, r2
			else avail = SERIAL3_RX_BUFFER_SIZE + head - tail;
    26b0:	189b      	addcc	r3, r3, r2
			if (avail >= RTS_HIGH_WATERMARK) rts_deassert();
    26b2:	2b27      	cmp	r3, #39	; 0x27
    26b4:	bfc4      	itt	gt
    26b6:	2301      	movgt	r3, #1
    26b8:	700b      	strbgt	r3, [r1, #0]
		}
	}
	c = UART2_C2;
    26ba:	4a19      	ldr	r2, [pc, #100]	; (2720 <uart2_status_isr+0xb0>)
    26bc:	78d3      	ldrb	r3, [r2, #3]
    26be:	b2db      	uxtb	r3, r3
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    26c0:	0618      	lsls	r0, r3, #24
    26c2:	d411      	bmi.n	26e8 <uart2_status_isr+0x78>
			if (use9Bits) UART2_C3 = (UART2_C3 & ~0x40) | ((n & 0x100) >> 2);
			UART2_D = n;
			tx_buffer_tail = tail;
		}
	}
	if ((c & UART_C2_TCIE) && (UART2_S1 & UART_S1_TC)) {
    26c4:	065a      	lsls	r2, r3, #25
    26c6:	d50d      	bpl.n	26e4 <uart2_status_isr+0x74>
    26c8:	4b15      	ldr	r3, [pc, #84]	; (2720 <uart2_status_isr+0xb0>)
    26ca:	791b      	ldrb	r3, [r3, #4]
    26cc:	065b      	lsls	r3, r3, #25
    26ce:	d509      	bpl.n	26e4 <uart2_status_isr+0x74>
		transmitting = 0;
		if (transmit_pin) transmit_deassert();
    26d0:	4b19      	ldr	r3, [pc, #100]	; (2738 <uart2_status_isr+0xc8>)
		transmitting = 0;
    26d2:	491a      	ldr	r1, [pc, #104]	; (273c <uart2_status_isr+0xcc>)
		if (transmit_pin) transmit_deassert();
    26d4:	681b      	ldr	r3, [r3, #0]
		transmitting = 0;
    26d6:	2200      	movs	r2, #0
    26d8:	700a      	strb	r2, [r1, #0]
		if (transmit_pin) transmit_deassert();
    26da:	b103      	cbz	r3, 26de <uart2_status_isr+0x6e>
    26dc:	701a      	strb	r2, [r3, #0]
		UART2_C2 = C2_TX_INACTIVE;
    26de:	4b10      	ldr	r3, [pc, #64]	; (2720 <uart2_status_isr+0xb0>)
    26e0:	222c      	movs	r2, #44	; 0x2c
    26e2:	70da      	strb	r2, [r3, #3]
	}
}
    26e4:	bc30      	pop	{r4, r5}
    26e6:	4770      	bx	lr
	if ((c & UART_C2_TIE) && (UART2_S1 & UART_S1_TDRE)) {
    26e8:	7911      	ldrb	r1, [r2, #4]
    26ea:	0609      	lsls	r1, r1, #24
    26ec:	d5ea      	bpl.n	26c4 <uart2_status_isr+0x54>
		head = tx_buffer_head;
    26ee:	4914      	ldr	r1, [pc, #80]	; (2740 <uart2_status_isr+0xd0>)
		tail = tx_buffer_tail;
    26f0:	4810      	ldr	r0, [pc, #64]	; (2734 <uart2_status_isr+0xc4>)
		head = tx_buffer_head;
    26f2:	780c      	ldrb	r4, [r1, #0]
		tail = tx_buffer_tail;
    26f4:	7801      	ldrb	r1, [r0, #0]
    26f6:	b2c9      	uxtb	r1, r1
		if (head == tail) {
    26f8:	428c      	cmp	r4, r1
    26fa:	d00d      	beq.n	2718 <uart2_status_isr+0xa8>
			if (++tail >= SERIAL3_TX_BUFFER_SIZE) tail = 0;
    26fc:	1c4a      	adds	r2, r1, #1
    26fe:	2a27      	cmp	r2, #39	; 0x27
    2700:	bf84      	itt	hi
    2702:	2100      	movhi	r1, #0
    2704:	460a      	movhi	r2, r1
			n = tx_buffer[tail];
    2706:	4d0f      	ldr	r5, [pc, #60]	; (2744 <uart2_status_isr+0xd4>)
			UART2_D = n;
    2708:	4c05      	ldr	r4, [pc, #20]	; (2720 <uart2_status_isr+0xb0>)
    270a:	bf98      	it	ls
    270c:	b2d1      	uxtbls	r1, r2
			n = tx_buffer[tail];
    270e:	5caa      	ldrb	r2, [r5, r2]
    2710:	b2d2      	uxtb	r2, r2
			UART2_D = n;
    2712:	71e2      	strb	r2, [r4, #7]
			tx_buffer_tail = tail;
    2714:	7001      	strb	r1, [r0, #0]
    2716:	e7d5      	b.n	26c4 <uart2_status_isr+0x54>
			UART2_C2 = C2_TX_COMPLETING;
    2718:	216c      	movs	r1, #108	; 0x6c
    271a:	70d1      	strb	r1, [r2, #3]
    271c:	e7d2      	b.n	26c4 <uart2_status_isr+0x54>
    271e:	bf00      	nop
    2720:	4006c000 	.word	0x4006c000
    2724:	1fff9578 	.word	0x1fff9578
    2728:	1fff950d 	.word	0x1fff950d
    272c:	1fff9538 	.word	0x1fff9538
    2730:	1fff9508 	.word	0x1fff9508
    2734:	1fff9579 	.word	0x1fff9579
    2738:	1fff957c 	.word	0x1fff957c
    273c:	1fff950c 	.word	0x1fff950c
    2740:	1fff9580 	.word	0x1fff9580
    2744:	1fff9510 	.word	0x1fff9510

00002748 <usb_init_serialnumber>:
	{'M','T','P'}
};
#endif

void usb_init_serialnumber(void)
{
    2748:	b570      	push	{r4, r5, r6, lr}
    274a:	b084      	sub	sp, #16
	char buf[11];
	uint32_t i, num;

	__disable_irq();
    274c:	b672      	cpsid	i
#if defined(HAS_KINETIS_FLASH_FTFA) || defined(HAS_KINETIS_FLASH_FTFL)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    274e:	4b30      	ldr	r3, [pc, #192]	; (2810 <usb_init_serialnumber+0xc8>)
	FTFL_FCCOB0 = 0x41;
    2750:	4d30      	ldr	r5, [pc, #192]	; (2814 <usb_init_serialnumber+0xcc>)
	FTFL_FCCOB1 = 15;
    2752:	4831      	ldr	r0, [pc, #196]	; (2818 <usb_init_serialnumber+0xd0>)
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    2754:	2270      	movs	r2, #112	; 0x70
	FTFL_FCCOB0 = 0x41;
    2756:	2641      	movs	r6, #65	; 0x41
	FTFL_FCCOB1 = 15;
    2758:	240f      	movs	r4, #15
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    275a:	2180      	movs	r1, #128	; 0x80
	FTFL_FSTAT = FTFL_FSTAT_RDCOLERR | FTFL_FSTAT_ACCERR | FTFL_FSTAT_FPVIOL;
    275c:	701a      	strb	r2, [r3, #0]
	FTFL_FCCOB0 = 0x41;
    275e:	702e      	strb	r6, [r5, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2760:	461a      	mov	r2, r3
	FTFL_FCCOB1 = 15;
    2762:	7004      	strb	r4, [r0, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
    2764:	7019      	strb	r1, [r3, #0]
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
    2766:	7813      	ldrb	r3, [r2, #0]
    2768:	061b      	lsls	r3, r3, #24
    276a:	d5fc      	bpl.n	2766 <usb_init_serialnumber+0x1e>
	num = *(uint32_t *)&FTFL_FCCOB7;
    276c:	4b2b      	ldr	r3, [pc, #172]	; (281c <usb_init_serialnumber+0xd4>)
    276e:	6818      	ldr	r0, [r3, #0]
	FTFL_FSTAT = FTFL_FSTAT_CCIF;
	while (!(FTFL_FSTAT & FTFL_FSTAT_CCIF)) ; // wait
	num = *(uint32_t *)&FTFL_FCCOBB;
	kinetis_hsrun_enable();
#endif
	__enable_irq();
    2770:	b662      	cpsie	i
	// add extra zero to work around OS-X CDC-ACM driver bug
	if (num < 10000000) num = num * 10;
    2772:	4b2b      	ldr	r3, [pc, #172]	; (2820 <usb_init_serialnumber+0xd8>)
    2774:	4298      	cmp	r0, r3
    2776:	bf98      	it	ls
    2778:	eb00 0080 	addls.w	r0, r0, r0, lsl #2
	ultoa(num, buf, 10);
    277c:	f04f 020a 	mov.w	r2, #10
	if (num < 10000000) num = num * 10;
    2780:	bf98      	it	ls
    2782:	0040      	lslls	r0, r0, #1
	ultoa(num, buf, 10);
    2784:	a901      	add	r1, sp, #4
    2786:	f7fe f8f3 	bl	970 <ultoa>
	for (i=0; i<10; i++) {
		char c = buf[i];
    278a:	f89d 2004 	ldrb.w	r2, [sp, #4]
    278e:	4b25      	ldr	r3, [pc, #148]	; (2824 <usb_init_serialnumber+0xdc>)
		if (!c) break;
    2790:	b352      	cbz	r2, 27e8 <usb_init_serialnumber+0xa0>
		char c = buf[i];
    2792:	f89d 1005 	ldrb.w	r1, [sp, #5]
		usb_string_serial_number_default.wString[i] = c;
    2796:	805a      	strh	r2, [r3, #2]
		if (!c) break;
    2798:	b361      	cbz	r1, 27f4 <usb_init_serialnumber+0xac>
		char c = buf[i];
    279a:	f89d 2006 	ldrb.w	r2, [sp, #6]
		usb_string_serial_number_default.wString[i] = c;
    279e:	8099      	strh	r1, [r3, #4]
		if (!c) break;
    27a0:	b352      	cbz	r2, 27f8 <usb_init_serialnumber+0xb0>
		char c = buf[i];
    27a2:	f89d 1007 	ldrb.w	r1, [sp, #7]
		usb_string_serial_number_default.wString[i] = c;
    27a6:	80da      	strh	r2, [r3, #6]
		if (!c) break;
    27a8:	b341      	cbz	r1, 27fc <usb_init_serialnumber+0xb4>
		char c = buf[i];
    27aa:	f89d 2008 	ldrb.w	r2, [sp, #8]
		usb_string_serial_number_default.wString[i] = c;
    27ae:	8119      	strh	r1, [r3, #8]
		if (!c) break;
    27b0:	b332      	cbz	r2, 2800 <usb_init_serialnumber+0xb8>
		char c = buf[i];
    27b2:	f89d 1009 	ldrb.w	r1, [sp, #9]
		usb_string_serial_number_default.wString[i] = c;
    27b6:	815a      	strh	r2, [r3, #10]
		if (!c) break;
    27b8:	b321      	cbz	r1, 2804 <usb_init_serialnumber+0xbc>
		char c = buf[i];
    27ba:	f89d 200a 	ldrb.w	r2, [sp, #10]
		usb_string_serial_number_default.wString[i] = c;
    27be:	8199      	strh	r1, [r3, #12]
		if (!c) break;
    27c0:	b312      	cbz	r2, 2808 <usb_init_serialnumber+0xc0>
		char c = buf[i];
    27c2:	f89d 100b 	ldrb.w	r1, [sp, #11]
		usb_string_serial_number_default.wString[i] = c;
    27c6:	81da      	strh	r2, [r3, #14]
		if (!c) break;
    27c8:	b301      	cbz	r1, 280c <usb_init_serialnumber+0xc4>
		char c = buf[i];
    27ca:	f89d 200c 	ldrb.w	r2, [sp, #12]
		usb_string_serial_number_default.wString[i] = c;
    27ce:	8219      	strh	r1, [r3, #16]
		if (!c) break;
    27d0:	b14a      	cbz	r2, 27e6 <usb_init_serialnumber+0x9e>
		char c = buf[i];
    27d2:	f89d 100d 	ldrb.w	r1, [sp, #13]
		usb_string_serial_number_default.wString[i] = c;
    27d6:	825a      	strh	r2, [r3, #18]
	for (i=0; i<10; i++) {
    27d8:	2209      	movs	r2, #9
		if (!c) break;
    27da:	b129      	cbz	r1, 27e8 <usb_init_serialnumber+0xa0>
    27dc:	2216      	movs	r2, #22
		usb_string_serial_number_default.wString[i] = c;
    27de:	8299      	strh	r1, [r3, #20]
	}
	usb_string_serial_number_default.bLength = i * 2 + 2;
    27e0:	701a      	strb	r2, [r3, #0]
}
    27e2:	b004      	add	sp, #16
    27e4:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    27e6:	2208      	movs	r2, #8
    27e8:	3201      	adds	r2, #1
    27ea:	0052      	lsls	r2, r2, #1
    27ec:	b2d2      	uxtb	r2, r2
	usb_string_serial_number_default.bLength = i * 2 + 2;
    27ee:	701a      	strb	r2, [r3, #0]
}
    27f0:	b004      	add	sp, #16
    27f2:	bd70      	pop	{r4, r5, r6, pc}
	for (i=0; i<10; i++) {
    27f4:	2201      	movs	r2, #1
    27f6:	e7f7      	b.n	27e8 <usb_init_serialnumber+0xa0>
    27f8:	2202      	movs	r2, #2
    27fa:	e7f5      	b.n	27e8 <usb_init_serialnumber+0xa0>
    27fc:	2203      	movs	r2, #3
    27fe:	e7f3      	b.n	27e8 <usb_init_serialnumber+0xa0>
    2800:	2204      	movs	r2, #4
    2802:	e7f1      	b.n	27e8 <usb_init_serialnumber+0xa0>
    2804:	2205      	movs	r2, #5
    2806:	e7ef      	b.n	27e8 <usb_init_serialnumber+0xa0>
    2808:	2206      	movs	r2, #6
    280a:	e7ed      	b.n	27e8 <usb_init_serialnumber+0xa0>
    280c:	2207      	movs	r2, #7
    280e:	e7eb      	b.n	27e8 <usb_init_serialnumber+0xa0>
    2810:	40020000 	.word	0x40020000
    2814:	40020007 	.word	0x40020007
    2818:	40020006 	.word	0x40020006
    281c:	40020008 	.word	0x40020008
    2820:	0098967f 	.word	0x0098967f
    2824:	1fff8994 	.word	0x1fff8994

00002828 <__aeabi_atexit>:
    2828:	460b      	mov	r3, r1
    282a:	4601      	mov	r1, r0
    282c:	4618      	mov	r0, r3
    282e:	f000 b801 	b.w	2834 <__cxa_atexit>
    2832:	bf00      	nop

00002834 <__cxa_atexit>:
    2834:	4613      	mov	r3, r2
    2836:	460a      	mov	r2, r1
    2838:	4601      	mov	r1, r0
    283a:	2002      	movs	r0, #2
    283c:	f000 bb04 	b.w	2e48 <__register_exitproc>

00002840 <__errno>:
    2840:	4b01      	ldr	r3, [pc, #4]	; (2848 <__errno+0x8>)
    2842:	6818      	ldr	r0, [r3, #0]
    2844:	4770      	bx	lr
    2846:	bf00      	nop
    2848:	1fff8dd8 	.word	0x1fff8dd8

0000284c <__libc_init_array>:
    284c:	b570      	push	{r4, r5, r6, lr}
    284e:	4e0f      	ldr	r6, [pc, #60]	; (288c <__libc_init_array+0x40>)
    2850:	4d0f      	ldr	r5, [pc, #60]	; (2890 <__libc_init_array+0x44>)
    2852:	1b76      	subs	r6, r6, r5
    2854:	10b6      	asrs	r6, r6, #2
    2856:	bf18      	it	ne
    2858:	2400      	movne	r4, #0
    285a:	d005      	beq.n	2868 <__libc_init_array+0x1c>
    285c:	3401      	adds	r4, #1
    285e:	f855 3b04 	ldr.w	r3, [r5], #4
    2862:	4798      	blx	r3
    2864:	42a6      	cmp	r6, r4
    2866:	d1f9      	bne.n	285c <__libc_init_array+0x10>
    2868:	4e0a      	ldr	r6, [pc, #40]	; (2894 <__libc_init_array+0x48>)
    286a:	4d0b      	ldr	r5, [pc, #44]	; (2898 <__libc_init_array+0x4c>)
    286c:	1b76      	subs	r6, r6, r5
    286e:	f000 fd87 	bl	3380 <_init>
    2872:	10b6      	asrs	r6, r6, #2
    2874:	bf18      	it	ne
    2876:	2400      	movne	r4, #0
    2878:	d006      	beq.n	2888 <__libc_init_array+0x3c>
    287a:	3401      	adds	r4, #1
    287c:	f855 3b04 	ldr.w	r3, [r5], #4
    2880:	4798      	blx	r3
    2882:	42a6      	cmp	r6, r4
    2884:	d1f9      	bne.n	287a <__libc_init_array+0x2e>
    2886:	bd70      	pop	{r4, r5, r6, pc}
    2888:	bd70      	pop	{r4, r5, r6, pc}
    288a:	bf00      	nop
    288c:	0000338c 	.word	0x0000338c
    2890:	0000338c 	.word	0x0000338c
    2894:	00003398 	.word	0x00003398
    2898:	0000338c 	.word	0x0000338c

0000289c <malloc>:
    289c:	4b02      	ldr	r3, [pc, #8]	; (28a8 <malloc+0xc>)
    289e:	4601      	mov	r1, r0
    28a0:	6818      	ldr	r0, [r3, #0]
    28a2:	f000 b803 	b.w	28ac <_malloc_r>
    28a6:	bf00      	nop
    28a8:	1fff8dd8 	.word	0x1fff8dd8

000028ac <_malloc_r>:
    28ac:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    28b0:	f101 050b 	add.w	r5, r1, #11
    28b4:	2d16      	cmp	r5, #22
    28b6:	b083      	sub	sp, #12
    28b8:	4606      	mov	r6, r0
    28ba:	f240 809f 	bls.w	29fc <_malloc_r+0x150>
    28be:	f035 0507 	bics.w	r5, r5, #7
    28c2:	f100 80bf 	bmi.w	2a44 <_malloc_r+0x198>
    28c6:	42a9      	cmp	r1, r5
    28c8:	f200 80bc 	bhi.w	2a44 <_malloc_r+0x198>
    28cc:	f000 faa6 	bl	2e1c <__malloc_lock>
    28d0:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    28d4:	f0c0 829c 	bcc.w	2e10 <_malloc_r+0x564>
    28d8:	0a6b      	lsrs	r3, r5, #9
    28da:	f000 80ba 	beq.w	2a52 <_malloc_r+0x1a6>
    28de:	2b04      	cmp	r3, #4
    28e0:	f200 8183 	bhi.w	2bea <_malloc_r+0x33e>
    28e4:	09a8      	lsrs	r0, r5, #6
    28e6:	f100 0e39 	add.w	lr, r0, #57	; 0x39
    28ea:	ea4f 034e 	mov.w	r3, lr, lsl #1
    28ee:	3038      	adds	r0, #56	; 0x38
    28f0:	4fc4      	ldr	r7, [pc, #784]	; (2c04 <_malloc_r+0x358>)
    28f2:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    28f6:	f1a3 0108 	sub.w	r1, r3, #8
    28fa:	685c      	ldr	r4, [r3, #4]
    28fc:	42a1      	cmp	r1, r4
    28fe:	d107      	bne.n	2910 <_malloc_r+0x64>
    2900:	e0ac      	b.n	2a5c <_malloc_r+0x1b0>
    2902:	2a00      	cmp	r2, #0
    2904:	f280 80ac 	bge.w	2a60 <_malloc_r+0x1b4>
    2908:	68e4      	ldr	r4, [r4, #12]
    290a:	42a1      	cmp	r1, r4
    290c:	f000 80a6 	beq.w	2a5c <_malloc_r+0x1b0>
    2910:	6863      	ldr	r3, [r4, #4]
    2912:	f023 0303 	bic.w	r3, r3, #3
    2916:	1b5a      	subs	r2, r3, r5
    2918:	2a0f      	cmp	r2, #15
    291a:	ddf2      	ble.n	2902 <_malloc_r+0x56>
    291c:	49b9      	ldr	r1, [pc, #740]	; (2c04 <_malloc_r+0x358>)
    291e:	693c      	ldr	r4, [r7, #16]
    2920:	f101 0e08 	add.w	lr, r1, #8
    2924:	4574      	cmp	r4, lr
    2926:	f000 81b3 	beq.w	2c90 <_malloc_r+0x3e4>
    292a:	6863      	ldr	r3, [r4, #4]
    292c:	f023 0303 	bic.w	r3, r3, #3
    2930:	1b5a      	subs	r2, r3, r5
    2932:	2a0f      	cmp	r2, #15
    2934:	f300 8199 	bgt.w	2c6a <_malloc_r+0x3be>
    2938:	2a00      	cmp	r2, #0
    293a:	f8c1 e014 	str.w	lr, [r1, #20]
    293e:	f8c1 e010 	str.w	lr, [r1, #16]
    2942:	f280 809e 	bge.w	2a82 <_malloc_r+0x1d6>
    2946:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    294a:	f080 8167 	bcs.w	2c1c <_malloc_r+0x370>
    294e:	08db      	lsrs	r3, r3, #3
    2950:	f103 0c01 	add.w	ip, r3, #1
    2954:	2201      	movs	r2, #1
    2956:	109b      	asrs	r3, r3, #2
    2958:	fa02 f303 	lsl.w	r3, r2, r3
    295c:	684a      	ldr	r2, [r1, #4]
    295e:	f851 803c 	ldr.w	r8, [r1, ip, lsl #3]
    2962:	f8c4 8008 	str.w	r8, [r4, #8]
    2966:	eb01 09cc 	add.w	r9, r1, ip, lsl #3
    296a:	431a      	orrs	r2, r3
    296c:	f1a9 0308 	sub.w	r3, r9, #8
    2970:	60e3      	str	r3, [r4, #12]
    2972:	604a      	str	r2, [r1, #4]
    2974:	f841 403c 	str.w	r4, [r1, ip, lsl #3]
    2978:	f8c8 400c 	str.w	r4, [r8, #12]
    297c:	1083      	asrs	r3, r0, #2
    297e:	2401      	movs	r4, #1
    2980:	409c      	lsls	r4, r3
    2982:	4294      	cmp	r4, r2
    2984:	f200 808a 	bhi.w	2a9c <_malloc_r+0x1f0>
    2988:	4214      	tst	r4, r2
    298a:	d106      	bne.n	299a <_malloc_r+0xee>
    298c:	f020 0003 	bic.w	r0, r0, #3
    2990:	0064      	lsls	r4, r4, #1
    2992:	4214      	tst	r4, r2
    2994:	f100 0004 	add.w	r0, r0, #4
    2998:	d0fa      	beq.n	2990 <_malloc_r+0xe4>
    299a:	eb07 09c0 	add.w	r9, r7, r0, lsl #3
    299e:	46cc      	mov	ip, r9
    29a0:	4680      	mov	r8, r0
    29a2:	f8dc 100c 	ldr.w	r1, [ip, #12]
    29a6:	458c      	cmp	ip, r1
    29a8:	d107      	bne.n	29ba <_malloc_r+0x10e>
    29aa:	e173      	b.n	2c94 <_malloc_r+0x3e8>
    29ac:	2a00      	cmp	r2, #0
    29ae:	f280 8181 	bge.w	2cb4 <_malloc_r+0x408>
    29b2:	68c9      	ldr	r1, [r1, #12]
    29b4:	458c      	cmp	ip, r1
    29b6:	f000 816d 	beq.w	2c94 <_malloc_r+0x3e8>
    29ba:	684b      	ldr	r3, [r1, #4]
    29bc:	f023 0303 	bic.w	r3, r3, #3
    29c0:	1b5a      	subs	r2, r3, r5
    29c2:	2a0f      	cmp	r2, #15
    29c4:	ddf2      	ble.n	29ac <_malloc_r+0x100>
    29c6:	460c      	mov	r4, r1
    29c8:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    29cc:	f854 8f08 	ldr.w	r8, [r4, #8]!
    29d0:	194b      	adds	r3, r1, r5
    29d2:	f045 0501 	orr.w	r5, r5, #1
    29d6:	604d      	str	r5, [r1, #4]
    29d8:	f042 0101 	orr.w	r1, r2, #1
    29dc:	f8c8 c00c 	str.w	ip, [r8, #12]
    29e0:	4630      	mov	r0, r6
    29e2:	f8cc 8008 	str.w	r8, [ip, #8]
    29e6:	617b      	str	r3, [r7, #20]
    29e8:	613b      	str	r3, [r7, #16]
    29ea:	f8c3 e00c 	str.w	lr, [r3, #12]
    29ee:	f8c3 e008 	str.w	lr, [r3, #8]
    29f2:	6059      	str	r1, [r3, #4]
    29f4:	509a      	str	r2, [r3, r2]
    29f6:	f000 fa13 	bl	2e20 <__malloc_unlock>
    29fa:	e01f      	b.n	2a3c <_malloc_r+0x190>
    29fc:	2910      	cmp	r1, #16
    29fe:	d821      	bhi.n	2a44 <_malloc_r+0x198>
    2a00:	f000 fa0c 	bl	2e1c <__malloc_lock>
    2a04:	2510      	movs	r5, #16
    2a06:	2306      	movs	r3, #6
    2a08:	2002      	movs	r0, #2
    2a0a:	4f7e      	ldr	r7, [pc, #504]	; (2c04 <_malloc_r+0x358>)
    2a0c:	eb07 0383 	add.w	r3, r7, r3, lsl #2
    2a10:	f1a3 0208 	sub.w	r2, r3, #8
    2a14:	685c      	ldr	r4, [r3, #4]
    2a16:	4294      	cmp	r4, r2
    2a18:	f000 8145 	beq.w	2ca6 <_malloc_r+0x3fa>
    2a1c:	6863      	ldr	r3, [r4, #4]
    2a1e:	68e1      	ldr	r1, [r4, #12]
    2a20:	68a5      	ldr	r5, [r4, #8]
    2a22:	f023 0303 	bic.w	r3, r3, #3
    2a26:	4423      	add	r3, r4
    2a28:	4630      	mov	r0, r6
    2a2a:	685a      	ldr	r2, [r3, #4]
    2a2c:	60e9      	str	r1, [r5, #12]
    2a2e:	f042 0201 	orr.w	r2, r2, #1
    2a32:	608d      	str	r5, [r1, #8]
    2a34:	605a      	str	r2, [r3, #4]
    2a36:	f000 f9f3 	bl	2e20 <__malloc_unlock>
    2a3a:	3408      	adds	r4, #8
    2a3c:	4620      	mov	r0, r4
    2a3e:	b003      	add	sp, #12
    2a40:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a44:	2400      	movs	r4, #0
    2a46:	230c      	movs	r3, #12
    2a48:	4620      	mov	r0, r4
    2a4a:	6033      	str	r3, [r6, #0]
    2a4c:	b003      	add	sp, #12
    2a4e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a52:	2380      	movs	r3, #128	; 0x80
    2a54:	f04f 0e40 	mov.w	lr, #64	; 0x40
    2a58:	203f      	movs	r0, #63	; 0x3f
    2a5a:	e749      	b.n	28f0 <_malloc_r+0x44>
    2a5c:	4670      	mov	r0, lr
    2a5e:	e75d      	b.n	291c <_malloc_r+0x70>
    2a60:	4423      	add	r3, r4
    2a62:	68e1      	ldr	r1, [r4, #12]
    2a64:	685a      	ldr	r2, [r3, #4]
    2a66:	68a5      	ldr	r5, [r4, #8]
    2a68:	f042 0201 	orr.w	r2, r2, #1
    2a6c:	60e9      	str	r1, [r5, #12]
    2a6e:	4630      	mov	r0, r6
    2a70:	608d      	str	r5, [r1, #8]
    2a72:	605a      	str	r2, [r3, #4]
    2a74:	f000 f9d4 	bl	2e20 <__malloc_unlock>
    2a78:	3408      	adds	r4, #8
    2a7a:	4620      	mov	r0, r4
    2a7c:	b003      	add	sp, #12
    2a7e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a82:	4423      	add	r3, r4
    2a84:	4630      	mov	r0, r6
    2a86:	685a      	ldr	r2, [r3, #4]
    2a88:	f042 0201 	orr.w	r2, r2, #1
    2a8c:	605a      	str	r2, [r3, #4]
    2a8e:	f000 f9c7 	bl	2e20 <__malloc_unlock>
    2a92:	3408      	adds	r4, #8
    2a94:	4620      	mov	r0, r4
    2a96:	b003      	add	sp, #12
    2a98:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2a9c:	68bc      	ldr	r4, [r7, #8]
    2a9e:	6863      	ldr	r3, [r4, #4]
    2aa0:	f023 0803 	bic.w	r8, r3, #3
    2aa4:	45a8      	cmp	r8, r5
    2aa6:	d304      	bcc.n	2ab2 <_malloc_r+0x206>
    2aa8:	ebc5 0308 	rsb	r3, r5, r8
    2aac:	2b0f      	cmp	r3, #15
    2aae:	f300 808c 	bgt.w	2bca <_malloc_r+0x31e>
    2ab2:	4b55      	ldr	r3, [pc, #340]	; (2c08 <_malloc_r+0x35c>)
    2ab4:	f8df 9160 	ldr.w	r9, [pc, #352]	; 2c18 <_malloc_r+0x36c>
    2ab8:	681a      	ldr	r2, [r3, #0]
    2aba:	f8d9 3000 	ldr.w	r3, [r9]
    2abe:	3301      	adds	r3, #1
    2ac0:	442a      	add	r2, r5
    2ac2:	eb04 0a08 	add.w	sl, r4, r8
    2ac6:	f000 8160 	beq.w	2d8a <_malloc_r+0x4de>
    2aca:	f502 5280 	add.w	r2, r2, #4096	; 0x1000
    2ace:	320f      	adds	r2, #15
    2ad0:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    2ad4:	f022 020f 	bic.w	r2, r2, #15
    2ad8:	4611      	mov	r1, r2
    2ada:	4630      	mov	r0, r6
    2adc:	9201      	str	r2, [sp, #4]
    2ade:	f000 f9a1 	bl	2e24 <_sbrk_r>
    2ae2:	f1b0 3fff 	cmp.w	r0, #4294967295
    2ae6:	4683      	mov	fp, r0
    2ae8:	9a01      	ldr	r2, [sp, #4]
    2aea:	f000 8158 	beq.w	2d9e <_malloc_r+0x4f2>
    2aee:	4582      	cmp	sl, r0
    2af0:	f200 80fc 	bhi.w	2cec <_malloc_r+0x440>
    2af4:	4b45      	ldr	r3, [pc, #276]	; (2c0c <_malloc_r+0x360>)
    2af6:	6819      	ldr	r1, [r3, #0]
    2af8:	45da      	cmp	sl, fp
    2afa:	4411      	add	r1, r2
    2afc:	6019      	str	r1, [r3, #0]
    2afe:	f000 8153 	beq.w	2da8 <_malloc_r+0x4fc>
    2b02:	f8d9 0000 	ldr.w	r0, [r9]
    2b06:	f8df e110 	ldr.w	lr, [pc, #272]	; 2c18 <_malloc_r+0x36c>
    2b0a:	3001      	adds	r0, #1
    2b0c:	bf1b      	ittet	ne
    2b0e:	ebca 0a0b 	rsbne	sl, sl, fp
    2b12:	4451      	addne	r1, sl
    2b14:	f8ce b000 	streq.w	fp, [lr]
    2b18:	6019      	strne	r1, [r3, #0]
    2b1a:	f01b 0107 	ands.w	r1, fp, #7
    2b1e:	f000 8117 	beq.w	2d50 <_malloc_r+0x4a4>
    2b22:	f1c1 0008 	rsb	r0, r1, #8
    2b26:	f5c1 5180 	rsb	r1, r1, #4096	; 0x1000
    2b2a:	4483      	add	fp, r0
    2b2c:	3108      	adds	r1, #8
    2b2e:	445a      	add	r2, fp
    2b30:	f3c2 020b 	ubfx	r2, r2, #0, #12
    2b34:	ebc2 0901 	rsb	r9, r2, r1
    2b38:	4649      	mov	r1, r9
    2b3a:	4630      	mov	r0, r6
    2b3c:	9301      	str	r3, [sp, #4]
    2b3e:	f000 f971 	bl	2e24 <_sbrk_r>
    2b42:	1c43      	adds	r3, r0, #1
    2b44:	9b01      	ldr	r3, [sp, #4]
    2b46:	f000 813f 	beq.w	2dc8 <_malloc_r+0x51c>
    2b4a:	ebcb 0200 	rsb	r2, fp, r0
    2b4e:	444a      	add	r2, r9
    2b50:	f042 0201 	orr.w	r2, r2, #1
    2b54:	6819      	ldr	r1, [r3, #0]
    2b56:	f8c7 b008 	str.w	fp, [r7, #8]
    2b5a:	4449      	add	r1, r9
    2b5c:	42bc      	cmp	r4, r7
    2b5e:	f8cb 2004 	str.w	r2, [fp, #4]
    2b62:	6019      	str	r1, [r3, #0]
    2b64:	f8df 90a4 	ldr.w	r9, [pc, #164]	; 2c0c <_malloc_r+0x360>
    2b68:	d016      	beq.n	2b98 <_malloc_r+0x2ec>
    2b6a:	f1b8 0f0f 	cmp.w	r8, #15
    2b6e:	f240 80fd 	bls.w	2d6c <_malloc_r+0x4c0>
    2b72:	6862      	ldr	r2, [r4, #4]
    2b74:	f1a8 030c 	sub.w	r3, r8, #12
    2b78:	f023 0307 	bic.w	r3, r3, #7
    2b7c:	18e0      	adds	r0, r4, r3
    2b7e:	f002 0201 	and.w	r2, r2, #1
    2b82:	f04f 0e05 	mov.w	lr, #5
    2b86:	431a      	orrs	r2, r3
    2b88:	2b0f      	cmp	r3, #15
    2b8a:	6062      	str	r2, [r4, #4]
    2b8c:	f8c0 e004 	str.w	lr, [r0, #4]
    2b90:	f8c0 e008 	str.w	lr, [r0, #8]
    2b94:	f200 811c 	bhi.w	2dd0 <_malloc_r+0x524>
    2b98:	4b1d      	ldr	r3, [pc, #116]	; (2c10 <_malloc_r+0x364>)
    2b9a:	68bc      	ldr	r4, [r7, #8]
    2b9c:	681a      	ldr	r2, [r3, #0]
    2b9e:	4291      	cmp	r1, r2
    2ba0:	bf88      	it	hi
    2ba2:	6019      	strhi	r1, [r3, #0]
    2ba4:	4b1b      	ldr	r3, [pc, #108]	; (2c14 <_malloc_r+0x368>)
    2ba6:	681a      	ldr	r2, [r3, #0]
    2ba8:	4291      	cmp	r1, r2
    2baa:	6862      	ldr	r2, [r4, #4]
    2bac:	bf88      	it	hi
    2bae:	6019      	strhi	r1, [r3, #0]
    2bb0:	f022 0203 	bic.w	r2, r2, #3
    2bb4:	4295      	cmp	r5, r2
    2bb6:	eba2 0305 	sub.w	r3, r2, r5
    2bba:	d801      	bhi.n	2bc0 <_malloc_r+0x314>
    2bbc:	2b0f      	cmp	r3, #15
    2bbe:	dc04      	bgt.n	2bca <_malloc_r+0x31e>
    2bc0:	4630      	mov	r0, r6
    2bc2:	f000 f92d 	bl	2e20 <__malloc_unlock>
    2bc6:	2400      	movs	r4, #0
    2bc8:	e738      	b.n	2a3c <_malloc_r+0x190>
    2bca:	1962      	adds	r2, r4, r5
    2bcc:	f043 0301 	orr.w	r3, r3, #1
    2bd0:	f045 0501 	orr.w	r5, r5, #1
    2bd4:	6065      	str	r5, [r4, #4]
    2bd6:	4630      	mov	r0, r6
    2bd8:	60ba      	str	r2, [r7, #8]
    2bda:	6053      	str	r3, [r2, #4]
    2bdc:	f000 f920 	bl	2e20 <__malloc_unlock>
    2be0:	3408      	adds	r4, #8
    2be2:	4620      	mov	r0, r4
    2be4:	b003      	add	sp, #12
    2be6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2bea:	2b14      	cmp	r3, #20
    2bec:	d971      	bls.n	2cd2 <_malloc_r+0x426>
    2bee:	2b54      	cmp	r3, #84	; 0x54
    2bf0:	f200 80a4 	bhi.w	2d3c <_malloc_r+0x490>
    2bf4:	0b28      	lsrs	r0, r5, #12
    2bf6:	f100 0e6f 	add.w	lr, r0, #111	; 0x6f
    2bfa:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2bfe:	306e      	adds	r0, #110	; 0x6e
    2c00:	e676      	b.n	28f0 <_malloc_r+0x44>
    2c02:	bf00      	nop
    2c04:	1fff8ddc 	.word	0x1fff8ddc
    2c08:	1fff958c 	.word	0x1fff958c
    2c0c:	1fff9590 	.word	0x1fff9590
    2c10:	1fff9588 	.word	0x1fff9588
    2c14:	1fff9584 	.word	0x1fff9584
    2c18:	1fff91e8 	.word	0x1fff91e8
    2c1c:	0a5a      	lsrs	r2, r3, #9
    2c1e:	2a04      	cmp	r2, #4
    2c20:	d95e      	bls.n	2ce0 <_malloc_r+0x434>
    2c22:	2a14      	cmp	r2, #20
    2c24:	f200 80b3 	bhi.w	2d8e <_malloc_r+0x4e2>
    2c28:	f102 015c 	add.w	r1, r2, #92	; 0x5c
    2c2c:	0049      	lsls	r1, r1, #1
    2c2e:	325b      	adds	r2, #91	; 0x5b
    2c30:	eb07 0c81 	add.w	ip, r7, r1, lsl #2
    2c34:	f857 1021 	ldr.w	r1, [r7, r1, lsl #2]
    2c38:	f8df 81dc 	ldr.w	r8, [pc, #476]	; 2e18 <_malloc_r+0x56c>
    2c3c:	f1ac 0c08 	sub.w	ip, ip, #8
    2c40:	458c      	cmp	ip, r1
    2c42:	f000 8088 	beq.w	2d56 <_malloc_r+0x4aa>
    2c46:	684a      	ldr	r2, [r1, #4]
    2c48:	f022 0203 	bic.w	r2, r2, #3
    2c4c:	4293      	cmp	r3, r2
    2c4e:	d202      	bcs.n	2c56 <_malloc_r+0x3aa>
    2c50:	6889      	ldr	r1, [r1, #8]
    2c52:	458c      	cmp	ip, r1
    2c54:	d1f7      	bne.n	2c46 <_malloc_r+0x39a>
    2c56:	f8d1 c00c 	ldr.w	ip, [r1, #12]
    2c5a:	687a      	ldr	r2, [r7, #4]
    2c5c:	f8c4 c00c 	str.w	ip, [r4, #12]
    2c60:	60a1      	str	r1, [r4, #8]
    2c62:	f8cc 4008 	str.w	r4, [ip, #8]
    2c66:	60cc      	str	r4, [r1, #12]
    2c68:	e688      	b.n	297c <_malloc_r+0xd0>
    2c6a:	1963      	adds	r3, r4, r5
    2c6c:	f042 0701 	orr.w	r7, r2, #1
    2c70:	f045 0501 	orr.w	r5, r5, #1
    2c74:	6065      	str	r5, [r4, #4]
    2c76:	4630      	mov	r0, r6
    2c78:	614b      	str	r3, [r1, #20]
    2c7a:	610b      	str	r3, [r1, #16]
    2c7c:	f8c3 e00c 	str.w	lr, [r3, #12]
    2c80:	f8c3 e008 	str.w	lr, [r3, #8]
    2c84:	605f      	str	r7, [r3, #4]
    2c86:	509a      	str	r2, [r3, r2]
    2c88:	3408      	adds	r4, #8
    2c8a:	f000 f8c9 	bl	2e20 <__malloc_unlock>
    2c8e:	e6d5      	b.n	2a3c <_malloc_r+0x190>
    2c90:	684a      	ldr	r2, [r1, #4]
    2c92:	e673      	b.n	297c <_malloc_r+0xd0>
    2c94:	f108 0801 	add.w	r8, r8, #1
    2c98:	f018 0f03 	tst.w	r8, #3
    2c9c:	f10c 0c08 	add.w	ip, ip, #8
    2ca0:	f47f ae7f 	bne.w	29a2 <_malloc_r+0xf6>
    2ca4:	e030      	b.n	2d08 <_malloc_r+0x45c>
    2ca6:	68dc      	ldr	r4, [r3, #12]
    2ca8:	42a3      	cmp	r3, r4
    2caa:	bf08      	it	eq
    2cac:	3002      	addeq	r0, #2
    2cae:	f43f ae35 	beq.w	291c <_malloc_r+0x70>
    2cb2:	e6b3      	b.n	2a1c <_malloc_r+0x170>
    2cb4:	440b      	add	r3, r1
    2cb6:	460c      	mov	r4, r1
    2cb8:	685a      	ldr	r2, [r3, #4]
    2cba:	68c9      	ldr	r1, [r1, #12]
    2cbc:	f854 5f08 	ldr.w	r5, [r4, #8]!
    2cc0:	f042 0201 	orr.w	r2, r2, #1
    2cc4:	605a      	str	r2, [r3, #4]
    2cc6:	4630      	mov	r0, r6
    2cc8:	60e9      	str	r1, [r5, #12]
    2cca:	608d      	str	r5, [r1, #8]
    2ccc:	f000 f8a8 	bl	2e20 <__malloc_unlock>
    2cd0:	e6b4      	b.n	2a3c <_malloc_r+0x190>
    2cd2:	f103 0e5c 	add.w	lr, r3, #92	; 0x5c
    2cd6:	f103 005b 	add.w	r0, r3, #91	; 0x5b
    2cda:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2cde:	e607      	b.n	28f0 <_malloc_r+0x44>
    2ce0:	099a      	lsrs	r2, r3, #6
    2ce2:	f102 0139 	add.w	r1, r2, #57	; 0x39
    2ce6:	0049      	lsls	r1, r1, #1
    2ce8:	3238      	adds	r2, #56	; 0x38
    2cea:	e7a1      	b.n	2c30 <_malloc_r+0x384>
    2cec:	42bc      	cmp	r4, r7
    2cee:	4b4a      	ldr	r3, [pc, #296]	; (2e18 <_malloc_r+0x56c>)
    2cf0:	f43f af00 	beq.w	2af4 <_malloc_r+0x248>
    2cf4:	689c      	ldr	r4, [r3, #8]
    2cf6:	6862      	ldr	r2, [r4, #4]
    2cf8:	f022 0203 	bic.w	r2, r2, #3
    2cfc:	e75a      	b.n	2bb4 <_malloc_r+0x308>
    2cfe:	f859 3908 	ldr.w	r3, [r9], #-8
    2d02:	4599      	cmp	r9, r3
    2d04:	f040 8082 	bne.w	2e0c <_malloc_r+0x560>
    2d08:	f010 0f03 	tst.w	r0, #3
    2d0c:	f100 30ff 	add.w	r0, r0, #4294967295
    2d10:	d1f5      	bne.n	2cfe <_malloc_r+0x452>
    2d12:	687b      	ldr	r3, [r7, #4]
    2d14:	ea23 0304 	bic.w	r3, r3, r4
    2d18:	607b      	str	r3, [r7, #4]
    2d1a:	0064      	lsls	r4, r4, #1
    2d1c:	429c      	cmp	r4, r3
    2d1e:	f63f aebd 	bhi.w	2a9c <_malloc_r+0x1f0>
    2d22:	2c00      	cmp	r4, #0
    2d24:	f43f aeba 	beq.w	2a9c <_malloc_r+0x1f0>
    2d28:	421c      	tst	r4, r3
    2d2a:	4640      	mov	r0, r8
    2d2c:	f47f ae35 	bne.w	299a <_malloc_r+0xee>
    2d30:	0064      	lsls	r4, r4, #1
    2d32:	421c      	tst	r4, r3
    2d34:	f100 0004 	add.w	r0, r0, #4
    2d38:	d0fa      	beq.n	2d30 <_malloc_r+0x484>
    2d3a:	e62e      	b.n	299a <_malloc_r+0xee>
    2d3c:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    2d40:	d818      	bhi.n	2d74 <_malloc_r+0x4c8>
    2d42:	0be8      	lsrs	r0, r5, #15
    2d44:	f100 0e78 	add.w	lr, r0, #120	; 0x78
    2d48:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2d4c:	3077      	adds	r0, #119	; 0x77
    2d4e:	e5cf      	b.n	28f0 <_malloc_r+0x44>
    2d50:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    2d54:	e6eb      	b.n	2b2e <_malloc_r+0x282>
    2d56:	2101      	movs	r1, #1
    2d58:	f8d8 3004 	ldr.w	r3, [r8, #4]
    2d5c:	1092      	asrs	r2, r2, #2
    2d5e:	fa01 f202 	lsl.w	r2, r1, r2
    2d62:	431a      	orrs	r2, r3
    2d64:	f8c8 2004 	str.w	r2, [r8, #4]
    2d68:	4661      	mov	r1, ip
    2d6a:	e777      	b.n	2c5c <_malloc_r+0x3b0>
    2d6c:	2301      	movs	r3, #1
    2d6e:	f8cb 3004 	str.w	r3, [fp, #4]
    2d72:	e725      	b.n	2bc0 <_malloc_r+0x314>
    2d74:	f240 5254 	movw	r2, #1364	; 0x554
    2d78:	4293      	cmp	r3, r2
    2d7a:	d820      	bhi.n	2dbe <_malloc_r+0x512>
    2d7c:	0ca8      	lsrs	r0, r5, #18
    2d7e:	f100 0e7d 	add.w	lr, r0, #125	; 0x7d
    2d82:	ea4f 034e 	mov.w	r3, lr, lsl #1
    2d86:	307c      	adds	r0, #124	; 0x7c
    2d88:	e5b2      	b.n	28f0 <_malloc_r+0x44>
    2d8a:	3210      	adds	r2, #16
    2d8c:	e6a4      	b.n	2ad8 <_malloc_r+0x22c>
    2d8e:	2a54      	cmp	r2, #84	; 0x54
    2d90:	d826      	bhi.n	2de0 <_malloc_r+0x534>
    2d92:	0b1a      	lsrs	r2, r3, #12
    2d94:	f102 016f 	add.w	r1, r2, #111	; 0x6f
    2d98:	0049      	lsls	r1, r1, #1
    2d9a:	326e      	adds	r2, #110	; 0x6e
    2d9c:	e748      	b.n	2c30 <_malloc_r+0x384>
    2d9e:	68bc      	ldr	r4, [r7, #8]
    2da0:	6862      	ldr	r2, [r4, #4]
    2da2:	f022 0203 	bic.w	r2, r2, #3
    2da6:	e705      	b.n	2bb4 <_malloc_r+0x308>
    2da8:	f3ca 000b 	ubfx	r0, sl, #0, #12
    2dac:	2800      	cmp	r0, #0
    2dae:	f47f aea8 	bne.w	2b02 <_malloc_r+0x256>
    2db2:	4442      	add	r2, r8
    2db4:	68bb      	ldr	r3, [r7, #8]
    2db6:	f042 0201 	orr.w	r2, r2, #1
    2dba:	605a      	str	r2, [r3, #4]
    2dbc:	e6ec      	b.n	2b98 <_malloc_r+0x2ec>
    2dbe:	23fe      	movs	r3, #254	; 0xfe
    2dc0:	f04f 0e7f 	mov.w	lr, #127	; 0x7f
    2dc4:	207e      	movs	r0, #126	; 0x7e
    2dc6:	e593      	b.n	28f0 <_malloc_r+0x44>
    2dc8:	2201      	movs	r2, #1
    2dca:	f04f 0900 	mov.w	r9, #0
    2dce:	e6c1      	b.n	2b54 <_malloc_r+0x2a8>
    2dd0:	f104 0108 	add.w	r1, r4, #8
    2dd4:	4630      	mov	r0, r6
    2dd6:	f000 f8fb 	bl	2fd0 <_free_r>
    2dda:	f8d9 1000 	ldr.w	r1, [r9]
    2dde:	e6db      	b.n	2b98 <_malloc_r+0x2ec>
    2de0:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    2de4:	d805      	bhi.n	2df2 <_malloc_r+0x546>
    2de6:	0bda      	lsrs	r2, r3, #15
    2de8:	f102 0178 	add.w	r1, r2, #120	; 0x78
    2dec:	0049      	lsls	r1, r1, #1
    2dee:	3277      	adds	r2, #119	; 0x77
    2df0:	e71e      	b.n	2c30 <_malloc_r+0x384>
    2df2:	f240 5154 	movw	r1, #1364	; 0x554
    2df6:	428a      	cmp	r2, r1
    2df8:	d805      	bhi.n	2e06 <_malloc_r+0x55a>
    2dfa:	0c9a      	lsrs	r2, r3, #18
    2dfc:	f102 017d 	add.w	r1, r2, #125	; 0x7d
    2e00:	0049      	lsls	r1, r1, #1
    2e02:	327c      	adds	r2, #124	; 0x7c
    2e04:	e714      	b.n	2c30 <_malloc_r+0x384>
    2e06:	21fe      	movs	r1, #254	; 0xfe
    2e08:	227e      	movs	r2, #126	; 0x7e
    2e0a:	e711      	b.n	2c30 <_malloc_r+0x384>
    2e0c:	687b      	ldr	r3, [r7, #4]
    2e0e:	e784      	b.n	2d1a <_malloc_r+0x46e>
    2e10:	08e8      	lsrs	r0, r5, #3
    2e12:	1c43      	adds	r3, r0, #1
    2e14:	005b      	lsls	r3, r3, #1
    2e16:	e5f8      	b.n	2a0a <_malloc_r+0x15e>
    2e18:	1fff8ddc 	.word	0x1fff8ddc

00002e1c <__malloc_lock>:
    2e1c:	4770      	bx	lr
    2e1e:	bf00      	nop

00002e20 <__malloc_unlock>:
    2e20:	4770      	bx	lr
    2e22:	bf00      	nop

00002e24 <_sbrk_r>:
    2e24:	b538      	push	{r3, r4, r5, lr}
    2e26:	4c07      	ldr	r4, [pc, #28]	; (2e44 <_sbrk_r+0x20>)
    2e28:	2300      	movs	r3, #0
    2e2a:	4605      	mov	r5, r0
    2e2c:	4608      	mov	r0, r1
    2e2e:	6023      	str	r3, [r4, #0]
    2e30:	f7fd fd88 	bl	944 <_sbrk>
    2e34:	1c43      	adds	r3, r0, #1
    2e36:	d000      	beq.n	2e3a <_sbrk_r+0x16>
    2e38:	bd38      	pop	{r3, r4, r5, pc}
    2e3a:	6823      	ldr	r3, [r4, #0]
    2e3c:	2b00      	cmp	r3, #0
    2e3e:	d0fb      	beq.n	2e38 <_sbrk_r+0x14>
    2e40:	602b      	str	r3, [r5, #0]
    2e42:	bd38      	pop	{r3, r4, r5, pc}
    2e44:	1fff95cc 	.word	0x1fff95cc

00002e48 <__register_exitproc>:
    2e48:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2e4c:	4c25      	ldr	r4, [pc, #148]	; (2ee4 <__register_exitproc+0x9c>)
    2e4e:	6825      	ldr	r5, [r4, #0]
    2e50:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
    2e54:	4606      	mov	r6, r0
    2e56:	4688      	mov	r8, r1
    2e58:	4692      	mov	sl, r2
    2e5a:	4699      	mov	r9, r3
    2e5c:	b3c4      	cbz	r4, 2ed0 <__register_exitproc+0x88>
    2e5e:	6860      	ldr	r0, [r4, #4]
    2e60:	281f      	cmp	r0, #31
    2e62:	dc17      	bgt.n	2e94 <__register_exitproc+0x4c>
    2e64:	1c43      	adds	r3, r0, #1
    2e66:	b176      	cbz	r6, 2e86 <__register_exitproc+0x3e>
    2e68:	eb04 0580 	add.w	r5, r4, r0, lsl #2
    2e6c:	2201      	movs	r2, #1
    2e6e:	f8c5 a088 	str.w	sl, [r5, #136]	; 0x88
    2e72:	f8d4 1188 	ldr.w	r1, [r4, #392]	; 0x188
    2e76:	4082      	lsls	r2, r0
    2e78:	4311      	orrs	r1, r2
    2e7a:	2e02      	cmp	r6, #2
    2e7c:	f8c4 1188 	str.w	r1, [r4, #392]	; 0x188
    2e80:	f8c5 9108 	str.w	r9, [r5, #264]	; 0x108
    2e84:	d01e      	beq.n	2ec4 <__register_exitproc+0x7c>
    2e86:	3002      	adds	r0, #2
    2e88:	6063      	str	r3, [r4, #4]
    2e8a:	f844 8020 	str.w	r8, [r4, r0, lsl #2]
    2e8e:	2000      	movs	r0, #0
    2e90:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2e94:	4b14      	ldr	r3, [pc, #80]	; (2ee8 <__register_exitproc+0xa0>)
    2e96:	b303      	cbz	r3, 2eda <__register_exitproc+0x92>
    2e98:	f44f 70c8 	mov.w	r0, #400	; 0x190
    2e9c:	f7ff fcfe 	bl	289c <malloc>
    2ea0:	4604      	mov	r4, r0
    2ea2:	b1d0      	cbz	r0, 2eda <__register_exitproc+0x92>
    2ea4:	f8d5 3148 	ldr.w	r3, [r5, #328]	; 0x148
    2ea8:	2700      	movs	r7, #0
    2eaa:	e880 0088 	stmia.w	r0, {r3, r7}
    2eae:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    2eb2:	4638      	mov	r0, r7
    2eb4:	2301      	movs	r3, #1
    2eb6:	f8c4 7188 	str.w	r7, [r4, #392]	; 0x188
    2eba:	f8c4 718c 	str.w	r7, [r4, #396]	; 0x18c
    2ebe:	2e00      	cmp	r6, #0
    2ec0:	d0e1      	beq.n	2e86 <__register_exitproc+0x3e>
    2ec2:	e7d1      	b.n	2e68 <__register_exitproc+0x20>
    2ec4:	f8d4 118c 	ldr.w	r1, [r4, #396]	; 0x18c
    2ec8:	430a      	orrs	r2, r1
    2eca:	f8c4 218c 	str.w	r2, [r4, #396]	; 0x18c
    2ece:	e7da      	b.n	2e86 <__register_exitproc+0x3e>
    2ed0:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
    2ed4:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
    2ed8:	e7c1      	b.n	2e5e <__register_exitproc+0x16>
    2eda:	f04f 30ff 	mov.w	r0, #4294967295
    2ede:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2ee2:	bf00      	nop
    2ee4:	0000337c 	.word	0x0000337c
    2ee8:	0000289d 	.word	0x0000289d

00002eec <register_fini>:
    2eec:	4b02      	ldr	r3, [pc, #8]	; (2ef8 <register_fini+0xc>)
    2eee:	b113      	cbz	r3, 2ef6 <register_fini+0xa>
    2ef0:	4802      	ldr	r0, [pc, #8]	; (2efc <register_fini+0x10>)
    2ef2:	f000 b805 	b.w	2f00 <atexit>
    2ef6:	4770      	bx	lr
    2ef8:	00000000 	.word	0x00000000
    2efc:	00002f0d 	.word	0x00002f0d

00002f00 <atexit>:
    2f00:	2300      	movs	r3, #0
    2f02:	4601      	mov	r1, r0
    2f04:	461a      	mov	r2, r3
    2f06:	4618      	mov	r0, r3
    2f08:	f7ff bf9e 	b.w	2e48 <__register_exitproc>

00002f0c <__libc_fini_array>:
    2f0c:	b538      	push	{r3, r4, r5, lr}
    2f0e:	4d07      	ldr	r5, [pc, #28]	; (2f2c <__libc_fini_array+0x20>)
    2f10:	4c07      	ldr	r4, [pc, #28]	; (2f30 <__libc_fini_array+0x24>)
    2f12:	1b2c      	subs	r4, r5, r4
    2f14:	10a4      	asrs	r4, r4, #2
    2f16:	d005      	beq.n	2f24 <__libc_fini_array+0x18>
    2f18:	3c01      	subs	r4, #1
    2f1a:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    2f1e:	4798      	blx	r3
    2f20:	2c00      	cmp	r4, #0
    2f22:	d1f9      	bne.n	2f18 <__libc_fini_array+0xc>
    2f24:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    2f28:	f000 ba36 	b.w	3398 <__init_array_end>
	...

00002f34 <_malloc_trim_r>:
    2f34:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    2f36:	4f23      	ldr	r7, [pc, #140]	; (2fc4 <_malloc_trim_r+0x90>)
    2f38:	460c      	mov	r4, r1
    2f3a:	4606      	mov	r6, r0
    2f3c:	f7ff ff6e 	bl	2e1c <__malloc_lock>
    2f40:	68bb      	ldr	r3, [r7, #8]
    2f42:	685d      	ldr	r5, [r3, #4]
    2f44:	f025 0503 	bic.w	r5, r5, #3
    2f48:	1b29      	subs	r1, r5, r4
    2f4a:	f601 71ef 	addw	r1, r1, #4079	; 0xfef
    2f4e:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    2f52:	f021 010f 	bic.w	r1, r1, #15
    2f56:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    2f5a:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    2f5e:	db07      	blt.n	2f70 <_malloc_trim_r+0x3c>
    2f60:	2100      	movs	r1, #0
    2f62:	4630      	mov	r0, r6
    2f64:	f7ff ff5e 	bl	2e24 <_sbrk_r>
    2f68:	68bb      	ldr	r3, [r7, #8]
    2f6a:	442b      	add	r3, r5
    2f6c:	4298      	cmp	r0, r3
    2f6e:	d004      	beq.n	2f7a <_malloc_trim_r+0x46>
    2f70:	4630      	mov	r0, r6
    2f72:	f7ff ff55 	bl	2e20 <__malloc_unlock>
    2f76:	2000      	movs	r0, #0
    2f78:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2f7a:	4261      	negs	r1, r4
    2f7c:	4630      	mov	r0, r6
    2f7e:	f7ff ff51 	bl	2e24 <_sbrk_r>
    2f82:	3001      	adds	r0, #1
    2f84:	d00d      	beq.n	2fa2 <_malloc_trim_r+0x6e>
    2f86:	4b10      	ldr	r3, [pc, #64]	; (2fc8 <_malloc_trim_r+0x94>)
    2f88:	68ba      	ldr	r2, [r7, #8]
    2f8a:	6819      	ldr	r1, [r3, #0]
    2f8c:	1b2d      	subs	r5, r5, r4
    2f8e:	f045 0501 	orr.w	r5, r5, #1
    2f92:	4630      	mov	r0, r6
    2f94:	1b09      	subs	r1, r1, r4
    2f96:	6055      	str	r5, [r2, #4]
    2f98:	6019      	str	r1, [r3, #0]
    2f9a:	f7ff ff41 	bl	2e20 <__malloc_unlock>
    2f9e:	2001      	movs	r0, #1
    2fa0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2fa2:	2100      	movs	r1, #0
    2fa4:	4630      	mov	r0, r6
    2fa6:	f7ff ff3d 	bl	2e24 <_sbrk_r>
    2faa:	68ba      	ldr	r2, [r7, #8]
    2fac:	1a83      	subs	r3, r0, r2
    2fae:	2b0f      	cmp	r3, #15
    2fb0:	ddde      	ble.n	2f70 <_malloc_trim_r+0x3c>
    2fb2:	4c06      	ldr	r4, [pc, #24]	; (2fcc <_malloc_trim_r+0x98>)
    2fb4:	4904      	ldr	r1, [pc, #16]	; (2fc8 <_malloc_trim_r+0x94>)
    2fb6:	6824      	ldr	r4, [r4, #0]
    2fb8:	f043 0301 	orr.w	r3, r3, #1
    2fbc:	1b00      	subs	r0, r0, r4
    2fbe:	6053      	str	r3, [r2, #4]
    2fc0:	6008      	str	r0, [r1, #0]
    2fc2:	e7d5      	b.n	2f70 <_malloc_trim_r+0x3c>
    2fc4:	1fff8ddc 	.word	0x1fff8ddc
    2fc8:	1fff9590 	.word	0x1fff9590
    2fcc:	1fff91e8 	.word	0x1fff91e8

00002fd0 <_free_r>:
    2fd0:	2900      	cmp	r1, #0
    2fd2:	d045      	beq.n	3060 <_free_r+0x90>
    2fd4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2fd8:	460d      	mov	r5, r1
    2fda:	4680      	mov	r8, r0
    2fdc:	f7ff ff1e 	bl	2e1c <__malloc_lock>
    2fe0:	f855 7c04 	ldr.w	r7, [r5, #-4]
    2fe4:	496a      	ldr	r1, [pc, #424]	; (3190 <_free_r+0x1c0>)
    2fe6:	f027 0301 	bic.w	r3, r7, #1
    2fea:	f1a5 0408 	sub.w	r4, r5, #8
    2fee:	18e2      	adds	r2, r4, r3
    2ff0:	688e      	ldr	r6, [r1, #8]
    2ff2:	6850      	ldr	r0, [r2, #4]
    2ff4:	42b2      	cmp	r2, r6
    2ff6:	f020 0003 	bic.w	r0, r0, #3
    2ffa:	d062      	beq.n	30c2 <_free_r+0xf2>
    2ffc:	07fe      	lsls	r6, r7, #31
    2ffe:	6050      	str	r0, [r2, #4]
    3000:	d40b      	bmi.n	301a <_free_r+0x4a>
    3002:	f855 7c08 	ldr.w	r7, [r5, #-8]
    3006:	1be4      	subs	r4, r4, r7
    3008:	f101 0e08 	add.w	lr, r1, #8
    300c:	68a5      	ldr	r5, [r4, #8]
    300e:	4575      	cmp	r5, lr
    3010:	443b      	add	r3, r7
    3012:	d06f      	beq.n	30f4 <_free_r+0x124>
    3014:	68e7      	ldr	r7, [r4, #12]
    3016:	60ef      	str	r7, [r5, #12]
    3018:	60bd      	str	r5, [r7, #8]
    301a:	1815      	adds	r5, r2, r0
    301c:	686d      	ldr	r5, [r5, #4]
    301e:	07ed      	lsls	r5, r5, #31
    3020:	d542      	bpl.n	30a8 <_free_r+0xd8>
    3022:	f043 0201 	orr.w	r2, r3, #1
    3026:	6062      	str	r2, [r4, #4]
    3028:	50e3      	str	r3, [r4, r3]
    302a:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    302e:	d218      	bcs.n	3062 <_free_r+0x92>
    3030:	08db      	lsrs	r3, r3, #3
    3032:	1c5a      	adds	r2, r3, #1
    3034:	684d      	ldr	r5, [r1, #4]
    3036:	f851 7032 	ldr.w	r7, [r1, r2, lsl #3]
    303a:	60a7      	str	r7, [r4, #8]
    303c:	2001      	movs	r0, #1
    303e:	109b      	asrs	r3, r3, #2
    3040:	fa00 f303 	lsl.w	r3, r0, r3
    3044:	eb01 00c2 	add.w	r0, r1, r2, lsl #3
    3048:	431d      	orrs	r5, r3
    304a:	3808      	subs	r0, #8
    304c:	60e0      	str	r0, [r4, #12]
    304e:	604d      	str	r5, [r1, #4]
    3050:	f841 4032 	str.w	r4, [r1, r2, lsl #3]
    3054:	60fc      	str	r4, [r7, #12]
    3056:	4640      	mov	r0, r8
    3058:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    305c:	f7ff bee0 	b.w	2e20 <__malloc_unlock>
    3060:	4770      	bx	lr
    3062:	0a5a      	lsrs	r2, r3, #9
    3064:	2a04      	cmp	r2, #4
    3066:	d853      	bhi.n	3110 <_free_r+0x140>
    3068:	099a      	lsrs	r2, r3, #6
    306a:	f102 0739 	add.w	r7, r2, #57	; 0x39
    306e:	007f      	lsls	r7, r7, #1
    3070:	f102 0538 	add.w	r5, r2, #56	; 0x38
    3074:	eb01 0087 	add.w	r0, r1, r7, lsl #2
    3078:	f851 2027 	ldr.w	r2, [r1, r7, lsl #2]
    307c:	4944      	ldr	r1, [pc, #272]	; (3190 <_free_r+0x1c0>)
    307e:	3808      	subs	r0, #8
    3080:	4290      	cmp	r0, r2
    3082:	d04d      	beq.n	3120 <_free_r+0x150>
    3084:	6851      	ldr	r1, [r2, #4]
    3086:	f021 0103 	bic.w	r1, r1, #3
    308a:	428b      	cmp	r3, r1
    308c:	d202      	bcs.n	3094 <_free_r+0xc4>
    308e:	6892      	ldr	r2, [r2, #8]
    3090:	4290      	cmp	r0, r2
    3092:	d1f7      	bne.n	3084 <_free_r+0xb4>
    3094:	68d0      	ldr	r0, [r2, #12]
    3096:	60e0      	str	r0, [r4, #12]
    3098:	60a2      	str	r2, [r4, #8]
    309a:	6084      	str	r4, [r0, #8]
    309c:	60d4      	str	r4, [r2, #12]
    309e:	4640      	mov	r0, r8
    30a0:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    30a4:	f7ff bebc 	b.w	2e20 <__malloc_unlock>
    30a8:	6895      	ldr	r5, [r2, #8]
    30aa:	4f3a      	ldr	r7, [pc, #232]	; (3194 <_free_r+0x1c4>)
    30ac:	42bd      	cmp	r5, r7
    30ae:	4403      	add	r3, r0
    30b0:	d03f      	beq.n	3132 <_free_r+0x162>
    30b2:	68d0      	ldr	r0, [r2, #12]
    30b4:	60e8      	str	r0, [r5, #12]
    30b6:	f043 0201 	orr.w	r2, r3, #1
    30ba:	6085      	str	r5, [r0, #8]
    30bc:	6062      	str	r2, [r4, #4]
    30be:	50e3      	str	r3, [r4, r3]
    30c0:	e7b3      	b.n	302a <_free_r+0x5a>
    30c2:	07ff      	lsls	r7, r7, #31
    30c4:	4403      	add	r3, r0
    30c6:	d407      	bmi.n	30d8 <_free_r+0x108>
    30c8:	f855 2c08 	ldr.w	r2, [r5, #-8]
    30cc:	1aa4      	subs	r4, r4, r2
    30ce:	4413      	add	r3, r2
    30d0:	68a0      	ldr	r0, [r4, #8]
    30d2:	68e2      	ldr	r2, [r4, #12]
    30d4:	60c2      	str	r2, [r0, #12]
    30d6:	6090      	str	r0, [r2, #8]
    30d8:	4a2f      	ldr	r2, [pc, #188]	; (3198 <_free_r+0x1c8>)
    30da:	6812      	ldr	r2, [r2, #0]
    30dc:	f043 0001 	orr.w	r0, r3, #1
    30e0:	4293      	cmp	r3, r2
    30e2:	6060      	str	r0, [r4, #4]
    30e4:	608c      	str	r4, [r1, #8]
    30e6:	d3b6      	bcc.n	3056 <_free_r+0x86>
    30e8:	4b2c      	ldr	r3, [pc, #176]	; (319c <_free_r+0x1cc>)
    30ea:	4640      	mov	r0, r8
    30ec:	6819      	ldr	r1, [r3, #0]
    30ee:	f7ff ff21 	bl	2f34 <_malloc_trim_r>
    30f2:	e7b0      	b.n	3056 <_free_r+0x86>
    30f4:	1811      	adds	r1, r2, r0
    30f6:	6849      	ldr	r1, [r1, #4]
    30f8:	07c9      	lsls	r1, r1, #31
    30fa:	d444      	bmi.n	3186 <_free_r+0x1b6>
    30fc:	6891      	ldr	r1, [r2, #8]
    30fe:	68d2      	ldr	r2, [r2, #12]
    3100:	60ca      	str	r2, [r1, #12]
    3102:	4403      	add	r3, r0
    3104:	f043 0001 	orr.w	r0, r3, #1
    3108:	6091      	str	r1, [r2, #8]
    310a:	6060      	str	r0, [r4, #4]
    310c:	50e3      	str	r3, [r4, r3]
    310e:	e7a2      	b.n	3056 <_free_r+0x86>
    3110:	2a14      	cmp	r2, #20
    3112:	d817      	bhi.n	3144 <_free_r+0x174>
    3114:	f102 075c 	add.w	r7, r2, #92	; 0x5c
    3118:	007f      	lsls	r7, r7, #1
    311a:	f102 055b 	add.w	r5, r2, #91	; 0x5b
    311e:	e7a9      	b.n	3074 <_free_r+0xa4>
    3120:	10aa      	asrs	r2, r5, #2
    3122:	684b      	ldr	r3, [r1, #4]
    3124:	2501      	movs	r5, #1
    3126:	fa05 f202 	lsl.w	r2, r5, r2
    312a:	4313      	orrs	r3, r2
    312c:	604b      	str	r3, [r1, #4]
    312e:	4602      	mov	r2, r0
    3130:	e7b1      	b.n	3096 <_free_r+0xc6>
    3132:	f043 0201 	orr.w	r2, r3, #1
    3136:	614c      	str	r4, [r1, #20]
    3138:	610c      	str	r4, [r1, #16]
    313a:	60e5      	str	r5, [r4, #12]
    313c:	60a5      	str	r5, [r4, #8]
    313e:	6062      	str	r2, [r4, #4]
    3140:	50e3      	str	r3, [r4, r3]
    3142:	e788      	b.n	3056 <_free_r+0x86>
    3144:	2a54      	cmp	r2, #84	; 0x54
    3146:	d806      	bhi.n	3156 <_free_r+0x186>
    3148:	0b1a      	lsrs	r2, r3, #12
    314a:	f102 076f 	add.w	r7, r2, #111	; 0x6f
    314e:	007f      	lsls	r7, r7, #1
    3150:	f102 056e 	add.w	r5, r2, #110	; 0x6e
    3154:	e78e      	b.n	3074 <_free_r+0xa4>
    3156:	f5b2 7faa 	cmp.w	r2, #340	; 0x154
    315a:	d806      	bhi.n	316a <_free_r+0x19a>
    315c:	0bda      	lsrs	r2, r3, #15
    315e:	f102 0778 	add.w	r7, r2, #120	; 0x78
    3162:	007f      	lsls	r7, r7, #1
    3164:	f102 0577 	add.w	r5, r2, #119	; 0x77
    3168:	e784      	b.n	3074 <_free_r+0xa4>
    316a:	f240 5054 	movw	r0, #1364	; 0x554
    316e:	4282      	cmp	r2, r0
    3170:	d806      	bhi.n	3180 <_free_r+0x1b0>
    3172:	0c9a      	lsrs	r2, r3, #18
    3174:	f102 077d 	add.w	r7, r2, #125	; 0x7d
    3178:	007f      	lsls	r7, r7, #1
    317a:	f102 057c 	add.w	r5, r2, #124	; 0x7c
    317e:	e779      	b.n	3074 <_free_r+0xa4>
    3180:	27fe      	movs	r7, #254	; 0xfe
    3182:	257e      	movs	r5, #126	; 0x7e
    3184:	e776      	b.n	3074 <_free_r+0xa4>
    3186:	f043 0201 	orr.w	r2, r3, #1
    318a:	6062      	str	r2, [r4, #4]
    318c:	50e3      	str	r3, [r4, r3]
    318e:	e762      	b.n	3056 <_free_r+0x86>
    3190:	1fff8ddc 	.word	0x1fff8ddc
    3194:	1fff8de4 	.word	0x1fff8de4
    3198:	1fff91e4 	.word	0x1fff91e4
    319c:	1fff958c 	.word	0x1fff958c
    31a0:	00746553 	.word	0x00746553
    31a4:	736e6553 	.word	0x736e6553
    31a8:	4f20726f 	.word	0x4f20726f
    31ac:	6950206e 	.word	0x6950206e
    31b0:	0000206e 	.word	0x0000206e
    31b4:	6d6f4320 	.word	0x6d6f4320
    31b8:	74656c70 	.word	0x74656c70
    31bc:	ffff0065 	.word	0xffff0065
    31c0:	74696e49 	.word	0x74696e49
    31c4:	746e4920 	.word	0x746e4920
    31c8:	75727265 	.word	0x75727265
    31cc:	20737470 	.word	0x20737470
    31d0:	0000202d 	.word	0x0000202d
    31d4:	706d6f43 	.word	0x706d6f43
    31d8:	6574656c 	.word	0x6574656c
    31dc:	00000000 	.word	0x00000000
    31e0:	2d562041 	.word	0x2d562041
    31e4:	00000000 	.word	0x00000000
    31e8:	ffff0a0d 	.word	0xffff0a0d

000031ec <digital_pin_to_info_PGM>:
    31ec:	43fe0840 4004a040 43fe0844 4004a044     @..C@..@D..CD..@
    31fc:	43fe1800 4004c000 43fe0030 40049030     ...C...@0..C0..@
    320c:	43fe0034 40049034 43fe181c 4004c01c     4..C4..@...C...@
    321c:	43fe1810 4004c010 43fe1808 4004c008     ...C...@...C...@
    322c:	43fe180c 4004c00c 43fe100c 4004b00c     ...C...@...C...@
    323c:	43fe1010 4004b010 43fe1018 4004b018     ...C...@...C...@
    324c:	43fe101c 4004b01c 43fe1014 4004b014     ...C...@...C...@
    325c:	43fe1804 4004c004 43fe1000 4004b000     ...C...@...C...@
    326c:	43fe0800 4004a000 43fe0804 4004a004     ...C...@...C...@
    327c:	43fe080c 4004a00c 43fe0808 4004a008     ...C...@...C...@
    328c:	43fe1814 4004c014 43fe1818 4004c018     ...C...@...C...@
    329c:	43fe1004 4004b004 43fe1008 4004b008     ...C...@...C...@
    32ac:	43fe0014 40049014 43fe084c 4004a04c     ...C...@L..CL..@
    32bc:	43fe2004 4004d004 43fe1024 4004b024     . .C...@$..C$..@
    32cc:	43fe1020 4004b020 43fe1028 4004b028      ..C ..@(..C(..@
    32dc:	43fe102c 4004b02c 43fe2000 4004d000     ,..C,..@. .C...@
    32ec:	43fe0848 4004a048 43fe0010 40049010     H..CH..@...C...@

000032fc <vtable for usb_serial_class>:
	...
    3304:	00001b89 00001b81 00001b7d 00001b79     ........}...y...
    3314:	00001b75 00001b71 00001b6d 00001b69     u...q...m...i...

00003324 <usb_endpoint_config_table>:
    3324:	15191500                                ....

00003328 <usb_descriptor_list>:
    3328:	00000100 1fff8908 00000012 00000200     ................
    3338:	1fff8934 00000043 00000300 1fff8990     4...C...........
    3348:	00000000 04090301 1fff891c 00000000     ................
    3358:	04090302 1fff8978 00000000 04090303     ....x...........
    3368:	1fff8994 00000000 00000000 00000000     ................
    3378:	00000000                                ....

0000337c <_global_impure_ptr>:
    337c:	1fff89b0                                ....

00003380 <_init>:
    3380:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    3382:	bf00      	nop
    3384:	bcf8      	pop	{r3, r4, r5, r6, r7}
    3386:	bc08      	pop	{r3}
    3388:	469e      	mov	lr, r3
    338a:	4770      	bx	lr

0000338c <__init_array_start>:
    338c:	00002eed 	.word	0x00002eed

00003390 <__frame_dummy_init_array_entry>:
    3390:	00000435 00000759                       5...Y...

Disassembly of section .fini:

00003398 <_fini>:
    3398:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    339a:	bf00      	nop

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
1fff880c:	1fff95d0                                ....

1fff8810 <isr_table_portA>:
1fff8810:	000009bd 000009bd 000009bd 000009bd     ................
1fff8820:	000009bd 000009bd 000009bd 000009bd     ................
1fff8830:	000009bd 000009bd 000009bd 000009bd     ................
1fff8840:	000009bd 000009bd                       ........

1fff8848 <isr_table_portB>:
1fff8848:	000009bd 000009bd 000009bd 000009bd     ................
1fff8858:	000009bd 000009bd 000009bd 000009bd     ................
1fff8868:	000009bd 000009bd 000009bd 000009bd     ................
1fff8878:	000009bd 000009bd 000009bd 000009bd     ................
1fff8888:	000009bd 000009bd 000009bd 000009bd     ................

1fff8898 <isr_table_portC>:
1fff8898:	000009bd 000009bd 000009bd 000009bd     ................
1fff88a8:	000009bd 000009bd 000009bd 000009bd     ................
1fff88b8:	000009bd 000009bd 000009bd 000009bd     ................

1fff88c8 <isr_table_portD>:
1fff88c8:	000009bd 000009bd 000009bd 000009bd     ................
1fff88d8:	000009bd 000009bd 000009bd 000009bd     ................

1fff88e8 <isr_table_portE>:
1fff88e8:	000009bd 000009bd                       ........

1fff88f0 <Serial>:
1fff88f0:	00003304 00000000 000003e8 00000000     .3..............

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
