Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B900B771E4
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 21:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfGZTKH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 15:10:07 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:22795 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbfGZTKG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 15:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564168204;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=eHoNdw7cVEHC7Q0redQuSHXU7wJTXaSCXJI6l4WlFpw=;
        b=hbXc8mV0FIVolBNm8GjDDepbQ8JSx6zsv30K5cxHtahJ33B/+sTcUGJmY6UDnMu2Am
        ihaGfRvDa2wrNXgTDfuIK49eQMtTZbZ01mcRNqd/Z5d97EuUMTtd2I81xPMA3ncmgf5N
        DticrAhHA4eW6mw2dfrRbF0a7UzAsJtth4TP6r/ZuWMB3GYj8lyxeHakVwak0howJj4T
        C4wrgJsfIt0vXg0398XkkuKcMYo398S/QHpZjF8ttIAzCsc9YEnyqJtuEJPkhi+1zYNs
        5lSYrfFIHR4b5gy30upWAa8wHINBqDTwjyEjsptAhpvt67zL7g6l0fDEb1cH64vQn3n7
        JUDQ==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJU8h5k0VR"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.177]
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id k05d3bv6QJA1oAy
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 26 Jul 2019 21:10:01 +0200 (CEST)
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
To:     Trent Piepho <tpiepho@impinj.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "932845@bugs.debian.org" <932845@bugs.debian.org>
References: <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <20190724070704.GA5983@taurus.defre.kleine-koenig.org>
 <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
 <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
 <ec38f0ea-2113-5054-b98a-a4798eb61c82@hartkopp.net>
 <20190726093949.GA3962@piout.net>
 <c9bf6730-1cbe-96ad-6800-5a91ccd4040d@hartkopp.net>
 <69cfdfbc-c2cf-9b78-bbbc-3dcb33d64316@hartkopp.net>
 <1564164731.2343.130.camel@impinj.com>
From:   Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <1cfeefaf-c55f-abcc-44b5-0645face6f09@hartkopp.net>
Date:   Fri, 26 Jul 2019 21:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564164731.2343.130.camel@impinj.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 26/07/2019 20.12, Trent Piepho wrote:
> On Fri, 2019-07-26 at 12:53 +0200, Oliver Hartkopp wrote:
>> Just a thought:
>>
>> There are some of these rtc drivers that set
>>
>> rtc->rtc->uie_unsupported = 1;
>>
>> in the case that they can't assign an irq line.
>>
>> But others set
>>
>> rtc->rtc->uie_unsupported = 1;
>>
>> when they don't support an (alarm) trigger with 1 sec accuracy.
>>
>> Wouldn't it make sense to put
>>
>> +       select RTC_INTF_DEV
>> +       select RTC_INTF_DEV_UIE_EMUL
>>
>> in the Kconfig entries of the latter devices?
> 
> The hwclock in busybox does not use UIE.  Is it the util-linux version
> that uses it?  Or systemd timedate?

Yes, it is the util-linux version that invokes ioctl(rtc_fd, RTC_UIE_ON, 
0), see:

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys-utils/hwclock-rtc.c#n244

I documented the effect here:
https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2

> I know that chrony's linux RTC support requires UIE, or UIE emulation,
> to work.  chrony does not detect lack of this very well and the RTC
> support just "doesn't happen" with no errors.  I had to strace it to
> figure out it was waiting for UIE interrupts that never came.

"or UIE emulation" - sounds like a plan :-)

> Anyway, you don't really need UIE at all to use an rtc in a number of
> ways.  The kernel "rtc to system clock on boot" feature doesn't need
> it.

Right - for that reason the kernel sets the correct time when the 
rtc-s35390a driver is built-in.

When its loaded later as a module, the tool hwclock is used to retrieve 
the time which fails due to the missing UIE.

> The kernel auto sync the rtc every 11 mins from NTP synced system
> clock feature doesn't need it.  busybox hwclock doesn't need it.
> 
> So I suspect it's optional because it's not always needed.

hwclock works great in 'setting' the rtc (hwclock --systohc) but it 
fails to read it.

Regards,
Oliver
