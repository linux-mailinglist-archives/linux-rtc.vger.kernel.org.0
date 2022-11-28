Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE95163AB7E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Nov 2022 15:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiK1OpJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 28 Nov 2022 09:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbiK1OoI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Nov 2022 09:44:08 -0500
X-Greylist: delayed 95 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Nov 2022 06:44:01 PST
Received: from de-smtp-delivery-105.mimecast.com (de-smtp-delivery-105.mimecast.com [194.104.109.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF5219C23
        for <linux-rtc@vger.kernel.org>; Mon, 28 Nov 2022 06:44:01 -0800 (PST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-jcBRwvZMMlaO0NFSas8mbQ-1; Mon, 28 Nov 2022 15:42:23 +0100
X-MC-Unique: jcBRwvZMMlaO0NFSas8mbQ-1
Received: from GV1PR02MB8564.eurprd02.prod.outlook.com (2603:10a6:150:94::8)
 by GV1PR02MB8305.eurprd02.prod.outlook.com (2603:10a6:150:50::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 14:42:21 +0000
Received: from GV1PR02MB8564.eurprd02.prod.outlook.com
 ([fe80::7d08:580a:b72d:66b2]) by GV1PR02MB8564.eurprd02.prod.outlook.com
 ([fe80::7d08:580a:b72d:66b2%5]) with mapi id 15.20.5857.021; Mon, 28 Nov 2022
 14:42:20 +0000
From:   Robert Varga <robert.varga@getinge.com>
To:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RTC PCF85063A issue after suspend/resume
Thread-Topic: RTC PCF85063A issue after suspend/resume
Thread-Index: AdkDN54FaL2YThzsRnq32bH055OUvw==
Date:   Mon, 28 Nov 2022 14:42:20 +0000
Message-ID: <GV1PR02MB85640F0A9C07F8D01373054B97139@GV1PR02MB8564.eurprd02.prod.outlook.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR02MB8564:EE_|GV1PR02MB8305:EE_
x-ms-office365-filtering-correlation-id: 1da6009f-c770-481c-0469-08dad14ec149
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: iNo3NOVtjuLZHZv2QeQVPJdATlA0jgdS7tUbLUUoA8BSR171ABgAzT4qvabJdwBWEBBI4S3bgm+pUStSDuipL+0sp2oK/fqMujescLGVVTvqrNvWdr4nBaq3iUWsvqcmAVCJgMqdH74BRylW1KY9qp3sw0qECBQZ6BH0e/ImJLASaxwmm6ODGSYp4zw3H9JC4kio9JY/TINsPE82z5F5Y0b1jx19UCKmN0uBw+YjPoz1V64ZlDYjKvsO7ISSijccj41i735Fz9BKGCILqMAV0l9WS4h23iTczyecR+6BYnqkYXADKKs5FgoIozJVxXHuOYJ+B3lU4ikrK0CZuH3h+vtJOPijTertmbP9cS3G5CN6l2f291QezlS3FplIzCBzZRURdrNWwNgBRQ3B5xTpwFj4hbX5nPCNiGgJioNZlLSPCPoINGHhwitnczjHw2X499+6D2kThcGlp2CQjAa4JaokWQMqFg97BuaQzzJbNlnqd5KBY1rHEIZ6pYyQrLp+/SQ1xns1NEfuO+KvFW/auV821IVMsXymXH3V6MoQRON5jOicHX00ITaSveLr31Qm/Ya4ZSAvUz3kyRQ5AU+s/wNVpjEIzPpkbX8Yu6H2sDIYmV90RNvE2BB0Cvn0eeWH10kEe0s34WDKYjLUam5/qmR+rlDZ2ubs6Jp1FmSjDncWGhgFVD/hj6aCErizqfCPa5tuYgPra9EEChxXkVXaGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR02MB8564.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199015)(9686003)(6506007)(7696005)(2906002)(15650500001)(55016003)(186003)(38070700005)(66476007)(66946007)(76116006)(66556008)(44832011)(8936002)(122000001)(5660300002)(66446008)(83380400001)(8676002)(86362001)(45080400002)(64756008)(71200400001)(41300700001)(478600001)(33656002)(52536014)(38100700002)(6916009)(316002);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gfhWOW6ncnJvm26D1Bj3bjSZvIXs6jQLUD7BFRcc6rGMIDDXNgb0c7cQ4Y?=
 =?iso-8859-1?Q?r3iurUHdDt85DyBCxwgvZGlA+E/+4STQSV3U2dKYbCTNJJ4ae+r+sx+lNN?=
 =?iso-8859-1?Q?blgwZgVLXSZkZBasC4OQplrgUQsIxAxedvq4kmqCCk52JtiLXXSMkdNIp4?=
 =?iso-8859-1?Q?g4jKPNdJ4/vB2X8FdxoyTYswIy1h2X1rcj0+dEarL7QzSMlBOVs30xkFpI?=
 =?iso-8859-1?Q?QDgor/52WmOgXw41cKcWRWsFeJpgefo1NhO7YK2M50DXPca1QS7T2SwSMq?=
 =?iso-8859-1?Q?vbZHCgr74Y31A/LDUT3n43fjQ7kByXGfZYIdE8Ams9Ym+vwY6iP6DUGps+?=
 =?iso-8859-1?Q?s/u3mt/tlHNRGCSNaaeINuQIN8XKIw1qmjMv9mFWcLpd6qKxTC5RvVWO3D?=
 =?iso-8859-1?Q?fHQZJl6HKkqXWQpEJZIzaYZ5fknFHDmlw8YoHxu9mshRyyrDpeZvqKoczS?=
 =?iso-8859-1?Q?s0yrZbcm7kgENYpScKBrqEXPQdEcRBslqPPZtcF6Znyt8+HVm8qh732dKC?=
 =?iso-8859-1?Q?q67KRwh1m2novKh5UoePuhRhoW/5Ll/t06xtMb1m7F2s2IuldrP+Vvs27f?=
 =?iso-8859-1?Q?4AhEA/NmTgO0okWoJ7t1jA8VaAh+sMjkwycqu7XvSQX36O1QsdnaqcYHfk?=
 =?iso-8859-1?Q?rocC6bTbcYViLkol1nmnUkYOSLvl4eeMovRrgb4DQ9XpIxPP7WyXBs992W?=
 =?iso-8859-1?Q?CkVtcxRCtrEEv+6XR55W+MajX466OJK8QRWrSDIuCZJkJBSmA4j5aidfh6?=
 =?iso-8859-1?Q?J0LGKhmeYUfTU5s3i8C2jWN+1rXCqlkKd3QSVNwDjzi2/vbCO4iGiYePYu?=
 =?iso-8859-1?Q?9r6D5Zfv9G0KGknP6zr5i31dQPoLgbSQx4SrDER8B4dYZ58ZC28LQ9n7ba?=
 =?iso-8859-1?Q?9Wqo1B8TacgnwDReZSfZe45R1GOGnK19zs/MbDRiXafKMYJj+hAZi0w9GB?=
 =?iso-8859-1?Q?7KMSDs1tHKVEtGkccpcvMiOUcAln35TqfsC3I1LKBErL62czctwhE7PsaT?=
 =?iso-8859-1?Q?2wFz5zW9I76WPaPjqFWiWET1EtcZrrTKBsE6wpb/Q5N6md2uzTeJW6OcJ7?=
 =?iso-8859-1?Q?4YuaHb7T/7stIleAhVWmQfa5438KTsRXKilB3KcO66dOOAubXydki+z4Mh?=
 =?iso-8859-1?Q?032dl9XmbPmIZIdHgYyt0jRHRlVu1tk/D9Vpj7Is6c2LrB3knh7MP3V7s0?=
 =?iso-8859-1?Q?8j07jL0F0FaCEiNdOhl4B45zaHnvpN57pVzLv8Pe1vd0R/vmANh3e4XG+Y?=
 =?iso-8859-1?Q?dHnmCp+8dGL1LmQBdornXv5EdI92yt8CLtg+MHvKj4ijfyF7be2ub5QqvM?=
 =?iso-8859-1?Q?SYY0NlHRMqllAnpvNPVVj3MRdOBr2OqpYDxkRiLcmFDYCBGD4G5AdshiQj?=
 =?iso-8859-1?Q?OcZCkvgIzU6Vsr6QDM8mjCg/J9nq+dO2by/5IRJh3z2KCp+ATPuDWMCOLe?=
 =?iso-8859-1?Q?+nTvEcaJ8EvEVXLYYE9NOtO9lP0x82RJh9h78fZqNcbZuk0CRqMEQRTX35?=
 =?iso-8859-1?Q?viP/qgeV335++JNOcagy3Js+tOh/Jhl1vxW7H8IokfbFXGcpZIL9mgYkE0?=
 =?iso-8859-1?Q?C+CRxQHTHOF16OxhC8X0Dpaca+I7CsrZS6gA3BTXASiZSoAK2Yqu9rKgRh?=
 =?iso-8859-1?Q?cq+fdq7FrdBBrrfRg35HuUEunxkYdM9MB0kOwMzY3R4HTDTSWljpdJQeMs?=
 =?iso-8859-1?Q?mq5qA+WISw5WEfiaIPk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: getinge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR02MB8564.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da6009f-c770-481c-0469-08dad14ec149
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 14:42:20.6476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d5faa72a-2614-4d56-abd8-865197339e56
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqVUaFbFT9Zr+ALTr8phJevmOT5ZNrL23F/U1UeAS1pAuqy3vMx+BsO4ZVjvwUHEok6fTFc6hBw7CPIFkz308FpfrBTeBij3pBkFC9fiPdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8305
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: getinge.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

I am trying to use the PCF85063A RTC device on a Toradex Colibry imx7d processor.

Used Setup:
- Colibri iMX7D 1 GB V1.1A
- Kernel 5.4.161-5.6.0-devel+git.0f0011824921

For this, I created an own DTS file. Here's the relevant DTS change:

&i2c4 {
  status = "okay";
  /* PCF85063A real time clock on carrier board */
  rtc0: pcf85063a@51 {
    compatible = "nxp,pcf85063a";
    reg = <0x51>;
    interrupt-parent = <&gpio1>;
    interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
    wakeup-source;
  };
};
I enabled the driver in the kernel configuration, recompiled the kernel and modules and deployed them.

CONFIG_RTC_DRV_PCF85063=y

The output of dmesg is as follows, which looks good to me:
~$ dmesg | grep rtc
[    1.071396] rtc-pcf85063 3-0051: wake irq already initialized
[    1.293186] rtc rtc0: failed to enable irq wake
[    1.303787] rtc-pcf85063 3-0051: registered as rtc0
[    1.309405] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc1
[    1.757462] rtc-pcf85063 3-0051: setting system clock to 2022-11-28T15:33:09 UTC (1669649589)

But one block within dmesg makes me think that something is wrong initialized:
[    1.056406] ------------[ cut here ]------------
[    1.061047] WARNING: CPU: 0 PID: 1 at drivers/base/power/wakeirq.c:30 dev_pm_attach_wake_irq.constprop.0+0xd0/0xd4
[    1.071396] rtc-pcf85063 3-0051: wake irq already initialized
[    1.077140] Modules linked in:
[    1.080203] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.161-5.6.0-devel+git.0f0011824921 #1
[    1.088726] Hardware name: Freescale i.MX7 Dual (Device Tree)
[    1.094495] [<8010eaf8>] (unwind_backtrace) from [<8010bb1c>] (show_stack+0x10/0x14)
[    1.102248] [<8010bb1c>] (show_stack) from [<80914d84>] (dump_stack+0x90/0xa4)
[    1.109480] [<80914d84>] (dump_stack) from [<8090c38c>] (__warn+0xbc/0xd8)
[    1.116363] [<8090c38c>] (__warn) from [<8090c42c>] (warn_slowpath_fmt+0x84/0x98)
[    1.123856] [<8090c42c>] (warn_slowpath_fmt) from [<8058b538>] (dev_pm_attach_wake_irq.constprop.0+0xd0/0xd4)
[    1.133780] [<8058b538>] (dev_pm_attach_wake_irq.constprop.0) from [<8058b688>] (dev_pm_set_wake_irq+0x40/0x70)
[    1.143879] [<8058b688>] (dev_pm_set_wake_irq) from [<8065d670>] (pcf85063_probe+0x204/0x2f4)
[    1.152414] [<8065d670>] (pcf85063_probe) from [<8065ed90>] (i2c_device_probe+0xac/0x2c4)
[    1.160601] [<8065ed90>] (i2c_device_probe) from [<8057e950>] (really_probe+0x24c/0x488)
[    1.168701] [<8057e950>] (really_probe) from [<8057ed54>] (driver_probe_device+0x78/0x1c4)
[    1.176974] [<8057ed54>] (driver_probe_device) from [<8057f100>] (device_driver_attach+0x58/0x60)
[    1.185854] [<8057f100>] (device_driver_attach) from [<8057f1bc>] (__driver_attach+0xb4/0x154)
[    1.194473] [<8057f1bc>] (__driver_attach) from [<8057cad8>] (bus_for_each_dev+0x64/0x90)
[    1.202659] [<8057cad8>] (bus_for_each_dev) from [<8057db18>] (bus_add_driver+0x16c/0x208)
[    1.210931] [<8057db18>] (bus_add_driver) from [<8057fa34>] (driver_register+0x74/0x108)
[    1.219029] [<8057fa34>] (driver_register) from [<8065f68c>] (i2c_register_driver+0x3c/0xac)
[    1.227474] [<8065f68c>] (i2c_register_driver) from [<80102670>] (do_one_initcall+0x44/0x194)
[    1.236009] [<80102670>] (do_one_initcall) from [<80e00e64>] (kernel_init_freeable+0x148/0x1e4)
[    1.244716] [<80e00e64>] (kernel_init_freeable) from [<80914f2c>] (kernel_init+0x8/0x110)
[    1.252900] [<80914f2c>] (kernel_init) from [<801010e8>] (ret_from_fork+0x14/0x2c)
[    1.260469] Exception stack(0xb0093fb0 to 0xb0093ff8)
[    1.265525] 3fa0:                                     00000000 00000000 00000000 00000000
[    1.273707] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.281888] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    1.288511] ---[ end trace 2ff9b5ad99dcb9b6 ]---
[    1.293186] rtc rtc0: failed to enable irq wake
[    1.303787] rtc-pcf85063 3-0051: registered as rtc0
[    1.309405] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc1
[    1.315738] i2c /dev entries driver


Then, when using the RTC device several times, everything looks good.

~$ echo +10 > /sys/class/rtc/rtc0/wakealarm

I can see, that changes to the alarm are reflected in the corresponding registers (it works as expected).

~$ i2cdump -f -y -r 0x0-0xf 3 0x51 b
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 00 00 00 00 40 36 15 28 01 11 22 40 36 15 28 80    ....@6?(??"@6?(?

I can repeat this commands as much as I like...
...but when I enter the suspend mode, the behavior changes!

~$ echo +10 > /sys/class/rtc/rtc0/wakealarm
~$ systemctl suspend

After the 10s, the system resumes. But now, I am no more able to activate a new alarm:

~$ echo +10 > /sys/class/rtc/rtc0/wakealarm
-sh: echo: write error: Permission denied

And dumping i2c device looks very strange...

~$ i2cdump -f -y -r 0x0-0xf 3 0x51 b
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX

...and the output of dmesg is as follows (there seems to be an exception with the RTC driver):

--- snip ---
[  287.991068] OOM killer enabled.
[  287.994212] Restarting tasks ...
[  288.018896] usbmisc_imx 30b10200.usbmisc: vbus is error
[  288.027546] usbmisc_imx 30b10200.usbmisc: Error occurs during detection: -22
[  288.040850] done.
[  288.045136] PM: suspend exit
[  288.188113] irq 66: nobody cared (try booting with the "irqpoll" option)
[  288.194832] CPU: 0 PID: 1 Comm: systemd Tainted: G        W  O      5.4.161-5.6.0-devel+git.0f0011824921 #1
[  288.204571] Hardware name: Freescale i.MX7 Dual (Device Tree)
[  288.210341] [<8010eaf8>] (unwind_backtrace) from [<8010bb1c>] (show_stack+0x10/0x14)
[  288.218092] [<8010bb1c>] (show_stack) from [<80914d84>] (dump_stack+0x90/0xa4)
[  288.225320] [<80914d84>] (dump_stack) from [<8090ca54>] (__report_bad_irq+0x3c/0xc0)
[  288.233071] [<8090ca54>] (__report_bad_irq) from [<8016ea20>] (note_interrupt+0x264/0x2b0)
[  288.241341] [<8016ea20>] (note_interrupt) from [<8016b728>] (handle_irq_event_percpu+0x58/0x64)
[  288.250045] [<8016b728>] (handle_irq_event_percpu) from [<8016b778>] (handle_irq_event+0x44/0x68)
[  288.258921] [<8016b778>] (handle_irq_event) from [<8016f468>] (handle_level_irq+0xb4/0x140)
[  288.267278] [<8016f468>] (handle_level_irq) from [<8016a868>] (generic_handle_irq+0x24/0x34)
[  288.275723] [<8016a868>] (generic_handle_irq) from [<80518614>] (mxc_gpio_irq_handler+0x48/0x164)
[  288.284603] [<80518614>] (mxc_gpio_irq_handler) from [<80519214>] (mx3_gpio_irq_handler+0x60/0xac)
[  288.293567] [<80519214>] (mx3_gpio_irq_handler) from [<8016a868>] (generic_handle_irq+0x24/0x34)
[  288.302355] [<8016a868>] (generic_handle_irq) from [<8016ae6c>] (__handle_domain_irq+0x5c/0xb0)
[  288.311058] [<8016ae6c>] (__handle_domain_irq) from [<80506fbc>] (gic_handle_irq+0x4c/0x90)
[  288.319413] [<80506fbc>] (gic_handle_irq) from [<80101e10>] (__irq_usr+0x50/0x80)
[  288.326895] Exception stack(0xb0093fb0 to 0xb0093ff8)
[  288.331950] 3fa0:                                     00832870 76f699cc 0000006f 0000006f
[  288.340131] 3fc0: 00832848 008191c8 80000000 fffffffa 007ff6d8 007ff6d8 7ed5aa4c 76f699cc
[  288.348310] 3fe0: 76fb6d6c 7ed5a9f0 76f1b4ad 76ce70a0 600f0030 ffffffff
[  288.354922] handlers:
[  288.357200] [<e0ffacc5>] irq_default_primary_handler threaded [<c40163d5>] pcf85063_rtc_handle_irq
[  288.366168] Disabling IRQ #66
[  288.434623] systemd-journald[171]: Successfully sent stream file descriptor to service manager.
--- snip ---

Can anyone help me to get the external RTC running also after a suspend/resume change? Any help would be greatly appreciated.

Cheers,

Robert Varga

This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to which they are addressed. If you have received this email in error please notify the system manager. This message contains confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately by e-mail if you have received this e-mail by mistake and delete this e-mail from your system. If you are not the intended recipient you are notified that disclosing, copying, distributing or taking any action in reliance on the contents of this information is strictly prohibited.

