Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8BFE70C8AF
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 21:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbjEVTkU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 15:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbjEVTkP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 15:40:15 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39BA102
        for <linux-rtc@vger.kernel.org>; Mon, 22 May 2023 12:40:11 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1435160003;
        Mon, 22 May 2023 19:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1684784410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t+e5CG8fPopxPDViDZKKk8GbK9aIoSlJzjkqOoz019M=;
        b=DxpnISD8pt6Fv5T2l2ERfI94im7gtR03wNPnXPRxBxLJvUhLOnJH16GfMaa1HQAFb1UQod
        lS3vyH/RrBL4rlWWe63R4tTIKnhqx1HXGM4yOLqNnm/DXNjKHcZqA+SumVsln4Qk2+WKi1
        ohp/YIZ5S8b5cTV2Tk7Y9XV49WI/QLZgOEuR3gLAheT/2f4A6cyGl/qKiVkgT9+KXyS+j3
        hebsIa5OBTb9QwSXzTpJvTE899xVeu4q3rNfhE55M4JX4YECwajkWwTpyKL1O2W6v7S8PW
        hxQjMwHC1MB9syI4grI0D23/ATJixWdug0Gkb3ellOvac9b3rlL+zlJDghRRaA==
Date:   Mon, 22 May 2023 21:40:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: question about firmware RTC design (for rtcwake)
Message-ID: <2023052219400923b59cc0@mail.local>
References: <20230522164638.68fea327@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522164638.68fea327@thinkpad>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 22/05/2023 16:46:38+0200, Marek Behún wrote:
> Hello RTC guys,
> 
> this is a request for suggestions / question about how to implement a
> RTC driver so that it will be accepted into upstream Linux.
> 
> Let me start with the description of the problem.
> 
> The MCU on the Turris Omnia router can disable / enable power
> regulators basically for the whole board, giving capability for
> platform specific poweroff and for powering the system on at a
> specified time.
> 
> I want to add support for this to the MCU firmware and write a driver
> for Linux. Since I know only of one utility by which users can request
> the system to power on at a specified time - the rtcwake utility - I
> want to write this as a RTC driver.
> 
> Because the MCU is not a true RTC in the sense that it does not have
> battery to count time when not under power, I am wondering how exactly
> to design this. One problem is that the RTC driver must implement the
> read function, but the MCU does not know the real time unless it is
> told beforehand.
> 
> Note that the board also has a true RTC with battery, handled by the
> rtc-armada38x driver. We can make sure that this true RTC is used for
> hctosys.
> 
> Proposal 1:
> - the MCU will implement only one command, poweroff, with optional
>   argument wakeup_timeout, the number of seconds after which to power
>   the board up again
> - the corresponding driver will register a system off handler and a RTC
>   device
> - the RTC will implement methods as:
>     .read_time   will use ktime_get(), so it will return monotonic clock
>     .set_alarm   will store the requested wakeup time in an internal
>                  structure
>     .alarm_irq_enable   will just update the internal structure
>     .read_alarm  will return information from the stored structure
> - the system off handler will send the poweroff command and it will
>   take the requested wakeup time from the internal structure and
>   subtract current time (ktime_get()) to get the wakeup_timeout
>   argument for the MCU poweroff command
> 
> - advantages:
>   - MCU needs only to implement one command
> - disadvantages:
>   - the new RTC device will not behave at all like a rtc device
>     regarding timekeeping, since .read_time returns system's monotonic
>     clock. This may confuse users who do not know about the fact that
>     this rtc device is only meant for rtcwake. We can print this info
>     into dmesg, but...
>   - removing the driver and loading it back loses information about set
>     wakeup time
> 
> Proposal 2:
> - the MCU will implement:
>   - command for getting and setting clock that the MCU will count
>     The clock will be considered invalid unless it was set at least
>     once.
>   - command for getting and setting wakeup alarm
>   - command for power off
> - the corresponding driver will again register a system off handler and
>   a RTC device
> - the system off handler will just send the poweroff command
> - the RTC device can now behave like a true RTC device, but without a
>   battery, the RTC_VL_BACKUP_EMPTY bit will be set.
>   The userspace can set time from the true RTC, so that rtcwake may be
>   used
> 
> Overall proposal 1 is easier to implement, but the resulting /dev/rtc
> device will not be a true RTC, which may confuse users. Proposal 2
> gives more complexity to MCU firmware.
> 
> Personally I prefer proposal one.
> 
> Do you guys have suggestions? Which kind of driver would you be willing
> to accept?
> 

You probably need to look at rtc-meson-vrtc.c, rtc-fsl-ftm-alarm.c and
rtc-brcmstb-waketimer.c which implement something similar.

Honestly, I would go for an in-between proposal where you would store
the requested alarm time (or more likely countdown) on
set_alarm/alarm_irq_enable so you would get .read_alarm working.

However, my main concern is that this is yet another custom protocol. We
can't possibly have a driver for everyone implementing a timer in their
FPGA/CPLD/cortexM.

How will you communicate with the MCU, can't you use an already existing
driver?

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
