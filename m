Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7AF7628B
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 11:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfGZJ1a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 05:27:30 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216]:14681 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGZJ13 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 05:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564133244;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=OBJHW19TnvFFPZzDa118zliirhBL64mYyCNxlHcdoWE=;
        b=BoKFJJUHf72/dhSD3Qta+ewuiNvyLV7EcoIy7cAYW+Y7At501SZVUFFD5dm3TDM9J+
        diw5u6jDjIRN6p0QqeHJ1ccpYzhkGJJe63MxGxmL0ZhA/13B1msDIUdYOz8Q2O6GwnhM
        Ettq1xMEod8IyB/eyW43BX9YXoXqKb/vIgPPvnYsHXV0PhbWrUn9nTpk/R0ggZkdUmA5
        d3/KOf40tmfDuqHLfQ7PJNvF21+8VtX/48tTI8zPgZ4lm0vjX1ZBO40ZteUf+0Xdc9mw
        AHU883pFw159e+g/a43h9wKLJkk+MAiDeQs56gMIupqD9n1bdVXYaIiFTQ6F33Vif+bN
        mWIA==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJU8h5k0VR"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.200]
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id k05d3bv6Q9RGmnI
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 26 Jul 2019 11:27:16 +0200 (CEST)
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     932845@bugs.debian.org, linux-rtc@vger.kernel.org
References: <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <20190724070704.GA5983@taurus.defre.kleine-koenig.org>
 <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
 <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
From:   Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <ec38f0ea-2113-5054-b98a-a4798eb61c82@hartkopp.net>
Date:   Fri, 26 Jul 2019 11:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Uwe,

On 26.07.19 09:27, Uwe Kleine-König wrote:
> Hello Alexandre,
> 
> On Thu, Jul 25, 2019 at 04:31:49PM +0200, Oliver Hartkopp wrote:
>> On 24.07.19 09:07, Uwe Kleine-König wrote:
>>> On Tue, Jul 23, 2019 at 10:28:18PM +0200, Oliver Hartkopp wrote:
>>>> I'm running a TS-119P+ and a TS-219P II Qnap NAS with Debian Buster.
>>>> Both are now running a linux-image-4.19.0-5-marvell kernel.
>>>>
>>>> But since my update from Linux 4.9 (Stretch) to Linux 4.19 (Buster) the
>>>> hardware clock of both boxes refuse to work.
>>>>
>>>> After some digging in kernel sources and re-installing Linux 4.9 on my
>>>> Buster setup it turns out, that a change in the kernel config causes the
>>>> problem:
>>>>
>>>> 4.19.0-5-marvell -> CONFIG_RTC_DRV_S35390A=m   (fails)
>>>>
>>>> 4.9.0-4-marvell -> CONFIG_RTC_DRV_S35390A=y    (works)
>>>>
>>>> See details and solving process at:
>>>>
>>>> https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2
>>>>
>>>> Can you please revert the Kernel config parts for the RTC in a way that the
>>>> RTC drivers are built into the marvell-arch kernel again instead of building
>>>> them as modules?
>>>
>>> They were switched to modules because the kernel image got too big to
>>> fit into the flash storage of some machines. I assume when we switch to
>>> built-in again the resulting problem is the bigger one.
>>
>> I don't know which is the bigger problem here.
>>
>> When the rtc driver is built as module it can not be operated with the
>> hwclock tool from the util-linux package due to the missing rtc UIE support.
>>
>> You finally have no hardware clock on these machines and must wait for ntp
>> to shift time and date (my system always starts in February until ntp fixes
>> the time).
> 
> For me it's obvious what is the bigger problem. Either you don't have
> the correct time until ntp fixes it up for you, or others cannot install
> a kernel update and so run a vulnerable OS.

That what I've written, NTP fixes the time for me. I have no problem 
with updating my kernels - in fact I was even able to flash an older 
kernel to figure out this rtc issue :-)

>> Maybe this problem is only relevant for the S35390A and PCF8563 chip which
>> both lack the UIE support needed by hwclock. Both have only alarm triggers
>> in a minute accuracy according to the driver source code.
> 
> AFAIK the rtc framework should then emulate this event somehow.

I don't think so. When the rtc chip is not able to trigger an event with 
a one second resolution - how can you emulate that?

>> So CONFIG_RTC_DRV_S35390A=y and CONFIG_RTC_DRV_PCF8563=y should bring back
>> the hw clocks on these machines.
>>
>> I assume using hwclock without UIE trigger code will impact the accuracy.
>>
>>>> As described in the referenced description the hwclock tool does not work on
>>>> the machines.
>>>
>>> I'm not sure yet if this is a problem in hwclock() or the s35390a
>>> driver.
>>
>> In detail it is hwclock together with rtc drivers not supporting UIE trigger
>> with a 1 second resolution.
> 
> @abelloni: Do you can shed some light here, how it is supposed to work?
> Is hwclock just doing it wrong with non-PC clocks, or is there a kernel
> bug to fix?
> 
> Best regards
> Uwe
> 

Best regards,
Oliver
