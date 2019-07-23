Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0CE72007
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 21:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388843AbfGWTVZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 15:21:25 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:33637 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbfGWTVY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 15:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563909682;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=he5sP/UnYRdg7pQSOIFoDcFhgsFtVLjdk2e1xrBdNME=;
        b=fnMTQpZelq1H1zmti6HY07ShuJOkyQ/Rmf0O1tPTLmVC1BOWLgJxv1ylWb7nshGD3f
        CU+MwM9FTdcvr93evudromyjTX5EjIU0vn3KKXCnjpzppmCMfy5wY/LSnTOdT+JAI6Zn
        1jHzDA09hGAQeEaVvQcjFAOtljc/5vc0uasNKTTUp2JLRx0k4dxldtAV7AQK7NDa/WPJ
        OrqnPk6fk64egZOW3CWwLNfYEbkNQpmlIxYfGaBwqg5OoEmoxMxhJ+vvi6Lgh1dtfhVI
        zpp5ucNBbQg87Thkmaw9A6ena/vYEbtob8YIgJX6hrcgyS+p1/jsKMdSt/dhWc/8mb9m
        6T5Q==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJV8h6liA="
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.200]
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id k05d3bv6NJL6f8n
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 23 Jul 2019 21:21:06 +0200 (CEST)
Subject: Re: TS-219 RTC issue with Debian Buster
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        tbm@cyrius.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
References: <99a8e2cc-61a2-3b43-0d72-6f001cffe572@hartkopp.net>
 <20190723190636.tuzob2w2fznmtsmb@pengutronix.de>
From:   Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <4a5c0768-0383-0a16-8d3f-639dc9530abf@hartkopp.net>
Date:   Tue, 23 Jul 2019 21:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723190636.tuzob2w2fznmtsmb@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Uwe,

nice to read from you again :-)

I think I already solved the problem, see here:
https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2

Will file a Debian bug for it ...

Many thanks,
Oliver

On 23.07.19 21:06, Uwe Kleine-König wrote:
> Hello Oliver,
> 
> I added the RTC maintainers and list to Cc.
> 
> On Tue, Jul 23, 2019 at 05:30:48PM +0200, Oliver Hartkopp wrote:
>> I upgraded my TS-219 to Debian Buster with Kernel 4.19.0-5-marvell.
>>
>> They use dtbs/4.19.0-5-marvell/./kirkwood-ts219-6282.dtb
>>
>> Unfortunately the RTC doesn't seem to work.
>>
>> root@xxxxx:~# hwclock -v --test
>> hwclock from util-linux 2.33.1
>> System Time: 1563296223.425648
>> Trying to open: /dev/rtc0
>> Using the rtc interface to the clock.
>> Last drift adjustment done at 1563291472 seconds after 1969
>> Last calibration done at 1563291472 seconds after 1969
>> Hardware clock is on UTC time
>> Assuming hardware clock is kept in UTC time.
>> Waiting for clock tick...
>> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>> ...synchronization failed
>> Test mode: nothing was changed.
>> With strace the clock tick problem looks like this:
>>
>> write(1, "Waiting for clock tick...\n", 26Waiting for clock tick...
>> ) = 26
>> ioctl(4, RTC_UIE_ON)                    = 0
>> _newselect(5, [4], NULL, NULL, {tv_sec=10, tv_usec=0}) = 0 (Timeout)
>> write(2, "hwclock: ", 9hwclock: )                = 9
>> write(2, "select() to /dev/rtc0 to wait fo"..., 54select() to /dev/rtc0 to
>> wait for clock tick timed out) = 54
>> write(2, "\n", 1)                       = 1
>> ioctl(4, PHN_NOT_OH or RTC_UIE_OFF)     = 0
> 
> Maybe rtc-mv should set uie_unsupported if no irq is aquired?
> 
>> It looks the same with
>>
>> # hwclock --hctosys
>> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> 
> hwclock (from util-linux) is being stupid here. The tradtional RTC on
> the x86 platform has a resolution of 1s only and if you set it the next
> increment is 1 second after the last increment instead of 1 second after
> the new time was set. So hwclock waits for an update event and then sets
> the new time (in some cases to a tad later than requested) to ensure the
> PC clock is off by less than half a second. For most (if not all) other
> RTCs this is wrong and still worse if the RTC in question doesn't
> support UIE.
> 
>> I wonder whether the problem comes from a missing interrupt assignment
>>
>> rtc: rtc@10300 {
>>               compatible = "marvell,kirkwood-rtc", "marvell,orion-rtc";
>>               reg = <0x10300 0x20>;
>>               interrupts = <53>;            <- HERE!?!
>>               clocks = <&gate_clk 7>;
>>                 };
>>
>> ... I found in linux/arch/arm/boot/dts/kirkwood-6282.dtsi ?!?
>>
>> In /proc/interrupts there's no rtc assigned to an interrupt 53.
> 
> What is the output of dmesg | grep 10300 ?
>   
>> Accessing the rtc values (time/date) via /sys/class/rtc/rtc0 entries works
>> well and setting the date/time via "hwclock --systohc" does its job too. So
>> I2C and the rtc_s35390a driver seem to work so far.
> 
> You're not using the s35390a driver, do you?
>   
>> Any ideas why hwclock fails to work properly?
> 
> Try if
> 
> 	busybox hwclock
> 
> works better for you. At least this one doesn't have this strange PC
> quirk.
>   
> Best regards
> Uwe
> 
