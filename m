Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6ECCD340
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2019 17:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfJFP6M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Oct 2019 11:58:12 -0400
Received: from first.geanix.com ([116.203.34.67]:34102 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfJFP6M (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 6 Oct 2019 11:58:12 -0400
Received: from [10.0.0.103] (unknown [85.184.140.241])
        by first.geanix.com (Postfix) with ESMTPSA id 59261507E6;
        Sun,  6 Oct 2019 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1570377411; bh=srnbOMiJRPIUmc/TnC+yROldDgiGCoKAhpWEl5AIZO8=;
        h=Date:In-Reply-To:References:Subject:To:CC:From;
        b=cu1lwDx6NBJy0zyleU/e4PPUX1KIkzcOuDCZAkl6r6+QFkXsoUDGTwkmG3fjCjB6M
         fnJcbGTu/hpAa7QSAe2FdlC5USCTXJ/Lm90rkMO/hYyzK+lDV63Nyei5KtYSduaAJr
         bB7xPDZe1PitqtwudwaY+oMCA0v8D7wPCnTx/lrJK4Qrg76VQnS0oYMSSUqUHFwjW+
         aMkkZHMn2Qr0mE3g3HrJF1PSe5MOOTC+9LN9T5QlrTFss3kZmoKFvdbm/r8x1Ze7cO
         KnDiBgQGjdol7Xm5DEHXIXVjPZ3M5Yw578xGjoC7BTKTirFN9CoYq7b58GkkUr+47H
         lfB2nBvUQ9yPQ==
Date:   Sun, 06 Oct 2019 17:58:01 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <f741d1bd-bcde-d1e1-09b7-98bb6a30db33@roeck-us.net>
References: <20191003124849.117888-1-martin@geanix.com> <20191003133351.118538-1-martin@geanix.com> <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com> <f741d1bd-bcde-d1e1-09b7-98bb6a30db33@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     Guenter Roeck <linux@roeck-us.net>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
From:   =?ISO-8859-1?Q?Martin_Hundeb=F8ll?= <martin@geanix.com>
Message-ID: <CC1D25DB-F95B-4110-809C-E8BE1493CDB7@geanix.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=disabled
        version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b8b5098bc1bc
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 6 October 2019 16=2E29=2E45 CEST, Guenter Roeck <linux@roeck-us=2Enet> =
wrote:
>On 10/6/19 2:07 AM, Bruno Thomsen wrote:
>> Hi Martin,
>>=20
>> Den tor=2E 3=2E okt=2E 2019 kl=2E 15=2E33 skrev Martin Hundeb=C3=B8ll
><martin@geanix=2Ecom>:
>>>
>>> Linux should handle when the pcf2127 watchdog feature is enabled by
>the
>>> bootloader=2E This is done by checking the watchdog timer value during
>>> init, and set the WDOG_HW_RUNNING flag if the value differs from
>zero=2E
>>>
>>> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix=2Ecom>
>>> ---
>>>
>>> Change since v1:
>>>   * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
>>>
>>>   drivers/rtc/rtc-pcf2127=2Ec | 12 +++++++++++-
>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/rtc-pcf2127=2Ec b/drivers/rtc/rtc-pcf2127=2Ec
>>> index cb3472f=2E=2E4229915 100644
>>> --- a/drivers/rtc/rtc-pcf2127=2Ec
>>> +++ b/drivers/rtc/rtc-pcf2127=2Ec
>>> @@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev,
>struct regmap *regmap,
>>>                          const char *name, bool has_nvmem)
>>>   {
>>>          struct pcf2127 *pcf2127;
>>> +       u32 wdd_timeout;
>>>          int ret =3D 0;
>>>
>>>          dev_dbg(dev, "%s\n", __func__);
>>> @@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev,
>struct regmap *regmap,
>>>          /*
>>>           * Watchdog timer enabled and reset pin /RST activated when
>timed out=2E
>>>           * Select 1Hz clock source for watchdog timer=2E
>>> -        * Timer is not started until WD_VAL is loaded with a valid
>value=2E
>>=20
>> Your patch does not change the fact that the watchdog timer is first
>> started after loading a
>> valid value into WD_VAL register=2E This driver can be used perfectly
>> fine without enabling the
>> watchdog feature from userspace=2E If someone chooses to reboot without
>> stopping the watchdog
>> it is of course expected to still run on next boot (e=2Eg=2E device
>probe)=2E
>>=20
>>> +       /* Test if watchdog timer is started by bootloader */
>>> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL,
>&wdd_timeout);
>>> +       if (ret) {
>>> +               dev_err(dev, "%s: watchdog value (wd_wal) failed\n",
>__func__);
>>> +               return ret;
>>> +       }
>>> +
>>> +       if (wdd_timeout)
>>> +               set_bit(WDOG_HW_RUNNING, &pcf2127->wdd=2Estatus);
>>> +
>>=20
>> I do not agree that this should be the default setting as
>> WDOG_HW_RUNNING bit causes
>> watchdog core to kick watchdog until userland takes over, e=2Eg=2E you
>> have just broken the
>> chain-of-monitoring in the embedded Linux device:
>>=20
>> Hardware watchdog -> systemd -> daemon(s) / application(s)
>>=20
>> At this point in time you only know that u-boot / barebox can load
>and
>> start the kernel with
>> a device tree blob=2E
>>=20
>> What if mounting of rootfs fails?
>> What if systemd fails to start?
>>=20
>> When doing a reboot due to ex=2E firmware upgrade, systemd will keep
>> kicking the watchdog
>> until the last sec before restart handler is called and the hardware
>> watchdog should not be
>> touched before systemd is in control of the system again=2E
>>=20
> > Bruno
> >
>
>This should not be decided on driver level=2E The intended means to
>enforce
>an initial timeout would be to set CONFIG_WATCHDOG_OPEN_TIMEOUT, or to
>use
>the open_timeout kernel parameter=2E

That, and WATCHDOG_HANDLE_BOOT_ENABLED

// Martin

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
