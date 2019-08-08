Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9EE85825
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Aug 2019 04:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfHHC3Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Aug 2019 22:29:16 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35908 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728096AbfHHC3Q (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 7 Aug 2019 22:29:16 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B3AF87CBD58E9B2C1F62;
        Thu,  8 Aug 2019 10:29:14 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 8 Aug 2019
 10:29:13 +0800
Subject: Re: [PATCH] rtc: bd70528: fix link error
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "arnd@arndb.de" <arnd@arndb.de>
References: <20190708124227.3422311-1-arnd@arndb.de>
 <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
 <CAK8P3a1HNnstePcreH-ZLyiJi3tNcCNJ=VozZUMnp-VLvYLSaA@mail.gmail.com>
 <e1687224a155787d9f3c042dca1c03a81b89ed25.camel@fi.rohmeurope.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <81f5978e-f401-0975-6c96-003b6d94e49d@huawei.com>
Date:   Thu, 8 Aug 2019 10:29:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <e1687224a155787d9f3c042dca1c03a81b89ed25.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 2019/7/9 13:25, Vaittinen, Matti wrote:
> Hello Arnd,
> 
> (Added Randy who also sent a patch to fix this)
> 
> On Mon, 2019-07-08 at 18:10 +0200, Arnd Bergmann wrote:
>> On Mon, Jul 8, 2019 at 3:24 PM Vaittinen, Matti
>> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
>>
>>> On Mon, 2019-07-08 at 14:41 +0200, Arnd Bergmann wrote:
>>>> With CONFIG_BD70528_WATCHDOG=m, a built-in rtc driver cannot call
>>>> into the low-level functions that are part of the watchdog
>>>> module:
>>>>
>>>> drivers/rtc/rtc-bd70528.o: In function `bd70528_set_time':
>>>> rtc-bd70528.c:(.text+0x22c): undefined reference to
>>>> `bd70528_wdt_lock'
>>>> rtc-bd70528.c:(.text+0x2a8): undefined reference to
>>>> `bd70528_wdt_unlock'
>>>> drivers/rtc/rtc-bd70528.o: In function
>>>> `bd70528_set_rtc_based_timers':
>>>> rtc-bd70528.c:(.text+0x50c): undefined reference to
>>>> `bd70528_wdt_set'
>>>>
>>>> Add a Kconfig dependency on this driver, but still allow compile-
>>>> testing
>>>> without it.
>>>>
>>>> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM
>>>> bd70528
>>>> RTC")
>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>> ---
>>>>  drivers/rtc/Kconfig | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>> index 3bfc04a86529..7b071cc74422 100644
>>>> --- a/drivers/rtc/Kconfig
>>>> +++ b/drivers/rtc/Kconfig
>>>> @@ -498,8 +498,10 @@ config RTC_DRV_M41T80_WDT
>>>>       help
>>>>         If you say Y here you will get support for the
>>>>         watchdog timer in the ST M41T60 and M41T80 RTC chips
>>>> series.
>>>> +
>>>>  config RTC_DRV_BD70528
>>>>       tristate "ROHM BD70528 PMIC RTC"
>>>> +     depends on BD70528_WATCHDOG || (COMPILE_TEST &&
>>>> !BD70528_WATCHDOG)
>>>
>>> I am not fan of this. There may well be use-cases where it is
>>> desirable
>>> to leave the watchdog out but still compile in the RTC. This is why
>>> we
>>> have static inline stubs in the header for cases where WDG is not
>>> compiled in. (RTC does not need to stop WDG if WDG driver is not
>>> included)
>>>
>>> Adding dependency from RTC to MFD for BD70528 should be done - this
>>> will avoid most of the issues (And there has been few patches sent
>>> for
>>> this already). But that's still not complete solution because
>>> configuring RTC and MFD to be built in-kernel and WDG as a module
>>> will
>>> cause errors again.
>>>
>>> Is there a way to force WDG in-kernel if RTC is in-kernel? (Or
>>> disallow configuring RTC in-kernel if WDG is a module - while still
>>> allow RTC to be built without WDG?
>>
>> We could make this
>>
>>         depends on BD70528_WATCHDOG || !BD70528_WATCHDOG
>>
>> which would allow building with or without watchdog, even when not
>> compile-testing, but still disallow the combination of
>> .
> 
> Thanks for teaching me Arnd! That is clever :) We need something like
> 
> depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> 
> (I'm not sure if parenthesis are Ok and respected in Kconfig). I would
> never have thought of BD70528_WATCHDOG || !BD70528_WATCHDOG - it looks
> awkward at first sight but indeed - depends on BD70528_WATCHDOG
> disallows BD70528_WATCHDOG=m with RTC_DRV_BD70528=y while
> !BD70528_WATCHDOG allows BD70528_WATCHDOG=n. Brilliant and exactly what
> we need :) Thanks a bunch!

Hello Vaittinen,

the issue still exists in linux-next 20190807, any plan?


> 
>>
>>        Arnd

