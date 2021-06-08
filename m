Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E523A073B
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jun 2021 00:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFHWmn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Jun 2021 18:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFHWmm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Jun 2021 18:42:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D204C061574
        for <linux-rtc@vger.kernel.org>; Tue,  8 Jun 2021 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=kW0FTv1801SG7xm+Htg0WKiHxYgo5CCa3DLHwo8vpJk=; b=YznvZwGj/tQPsraYSqAEUeeaYH
        u7OU+2SQVl7UH71B+1J+rx/uFJLyzG1Fp4HmVVKgKUjLRYwJ+pPhvVfu3jcxW7RI9F/j5+ovTi/l4
        EMWnRHuDpxPUsVpdOpQrGe0VgdsIibI2jt+++sMPt6RyNbLx0n12kPZKDY+AtehrnThY9gfuvqR6D
        zpyG69sFmNL3duhKGTMU8++kf+BSkWOdP5HEo/AIl73FSMFfk4on6CiGdgDwO6KJSFAV3tZ9ATz0a
        fMTI7VcYO0G5ARwjfQNahGGsht6qW8hdLEKA8L7StBu/a+yVas/tPZZxpob5CpRUExGjoKncpOMiq
        dvT3p5qA==;
Received: from [2601:1c0:6280:3f0::bd57]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqkOt-00Ag8g-Nz; Tue, 08 Jun 2021 22:40:47 +0000
Subject: Re: [PATCH] rtc: pcf8523: rename REG_OFFSET register
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
References: <20210606162423.22235-1-rdunlap@infradead.org>
 <YL9hmwsdfX96ZABp@piout.net>
 <e78253f6-88f8-7d9b-416c-c48e70785b41@infradead.org>
 <YL/w2/l7eLj0/S2R@piout.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c80a9ec5-d9c2-9d1a-a564-7273b6fe2f3a@infradead.org>
Date:   Tue, 8 Jun 2021 15:40:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YL/w2/l7eLj0/S2R@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 6/8/21 3:36 PM, Alexandre Belloni wrote:
> On 08/06/2021 10:07:47-0700, Randy Dunlap wrote:
>> On 6/8/21 5:24 AM, Alexandre Belloni wrote:
>>> On 06/06/2021 09:24:23-0700, Randy Dunlap wrote:
>>>> REG_OFFSET is defined both here and in arch/arm/mach-ixp4xx/, which
>>>> causes a build warning, so rename this macro in the RTC driver.
>>>>
>>>> ../drivers/rtc/rtc-pcf8523.c:44: warning: "REG_OFFSET" redefined
>>>>    44 | #define REG_OFFSET   0x0e
>>>>
>>>> ../arch/arm/mach-ixp4xx/include/mach/platform.h:25: note: this is the location of the previous definition
>>>>    25 | #define REG_OFFSET 3
>>>>
>>>> Fixes: bc3bee025272 ("rtc: pcf8523: add support for trimming the RTC oscillator")
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Cc: Russell King <rmk+kernel@armlinux.org.uk>
>>>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>> Cc: linux-rtc@vger.kernel.org
>>>> ---
>>>>  drivers/rtc/rtc-pcf8523.c |    6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> --- linux-next-20210604.orig/drivers/rtc/rtc-pcf8523.c
>>>> +++ linux-next-20210604/drivers/rtc/rtc-pcf8523.c
>>>> @@ -41,7 +41,7 @@
>>>>  #define REG_WEEKDAY_ALARM	0x0d
>>>>  #define ALARM_DIS BIT(7)
>>>>  
>>>> -#define REG_OFFSET   0x0e
>>>> +#define REG_OFFSET_TUNE   0x0e /* offset register is used for tuning */
>>>
>>> All the other defines are using the names from the datasheet, probably
>>> ixp4xx should be fixed instead?
>>
>> That would be something like 25 changes in 14 files instead
>> of 3 changes in one file.
>>
> 
> But REG_OFFSET from mach-ixp4xx/include/mach/platform.h is the one
> leaking out. I think you can agree that rtc-pcf8523.c is self contained.
> 
>> But for both locations, names like REG_OFFSET are just too generic.
>> They should be more specific so that name clashes won't happen.
>>
> 
> This name clash wouldn't happen if ixp4xx was converted to multiplatform
> as this would prevent it from including random headers globally but
> there hasn't been any significant move in that direction since February
> 2019. I know nslu2 is a popular platform but maybe at some point we should
> consider simply dropping ixp4 support if it doesn't improve.
> 
> I remember that at the time I took the patch I though the REG_ prefix
> was a bit generic but again, this is pretty self-contained in the
> driver.

OK, our criteria for what or where to patch differ. That's OK.

pfc8523 is self-contained (so simpler to patch or muck up)
and newer than ixp4xx. Those are my top criteria.

G'day.

-- 
~Randy
