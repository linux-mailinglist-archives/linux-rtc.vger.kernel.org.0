Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF16A70CC0B
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 23:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjEVVPM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 17:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjEVVPL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 17:15:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C9F9D
        for <linux-rtc@vger.kernel.org>; Mon, 22 May 2023 14:15:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44077629F0
        for <linux-rtc@vger.kernel.org>; Mon, 22 May 2023 21:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F71C4339B;
        Mon, 22 May 2023 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684790109;
        bh=j7zjKMwfo3vC7VK5BPMzevOgIPBe5wYvHOAVO+k5WvU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rA4PKWJd7AF8O11SJ43IDBuTRSTGmTF6Lb16GeLbDQy3D4dyC5MfhwEG+0mm5NIKh
         8psxLfEfNXPbm/aPlvTEcePvf/M2hbjMsry7509Qh/17WgcnUzgSMwU75sxqvnPtRw
         j2i6RHRKB7p3VeePDyT5cKJh7fPZcZR8qAuhtHWTYoBoWnTQ9C3q1LlZOnT93Oa8dd
         lBYctgPj1wrUatUwSQGR6sgOv9bkBf5pBm7Z4eHd78PxcPdB25tmplo/piPOA+/6fH
         +Eq4h4WOSX1MoxWt9twMNEXXvq55xTYp74qX/9Lu7jj4g52qV40RLXjM4Dk6Q19cyC
         7xANclh8KbTUw==
Date:   Mon, 22 May 2023 23:14:54 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: question about firmware RTC design (for rtcwake)
Message-ID: <20230522231454.30283751@thinkpad>
In-Reply-To: <2023052219400923b59cc0@mail.local>
References: <20230522164638.68fea327@thinkpad>
        <2023052219400923b59cc0@mail.local>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 22 May 2023 21:40:09 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hello,
>=20
> On 22/05/2023 16:46:38+0200, Marek Beh=C3=BAn wrote:
> > Hello RTC guys,
> >=20
> > this is a request for suggestions / question about how to implement a
> > RTC driver so that it will be accepted into upstream Linux.
> >=20
> > Let me start with the description of the problem.
> >=20
> > The MCU on the Turris Omnia router can disable / enable power
> > regulators basically for the whole board, giving capability for
> > platform specific poweroff and for powering the system on at a
> > specified time.
> >=20
> > I want to add support for this to the MCU firmware and write a driver
> > for Linux. Since I know only of one utility by which users can request
> > the system to power on at a specified time - the rtcwake utility - I
> > want to write this as a RTC driver.
> >=20
> > Because the MCU is not a true RTC in the sense that it does not have
> > battery to count time when not under power, I am wondering how exactly
> > to design this. One problem is that the RTC driver must implement the
> > read function, but the MCU does not know the real time unless it is
> > told beforehand.
> >=20
> > Note that the board also has a true RTC with battery, handled by the
> > rtc-armada38x driver. We can make sure that this true RTC is used for
> > hctosys.
> >=20
> > Proposal 1:
> > - the MCU will implement only one command, poweroff, with optional
> >   argument wakeup_timeout, the number of seconds after which to power
> >   the board up again
> > - the corresponding driver will register a system off handler and a RTC
> >   device
> > - the RTC will implement methods as:
> >     .read_time   will use ktime_get(), so it will return monotonic clock
> >     .set_alarm   will store the requested wakeup time in an internal
> >                  structure
> >     .alarm_irq_enable   will just update the internal structure
> >     .read_alarm  will return information from the stored structure
> > - the system off handler will send the poweroff command and it will
> >   take the requested wakeup time from the internal structure and
> >   subtract current time (ktime_get()) to get the wakeup_timeout
> >   argument for the MCU poweroff command
> >=20
> > - advantages:
> >   - MCU needs only to implement one command
> > - disadvantages:
> >   - the new RTC device will not behave at all like a rtc device
> >     regarding timekeeping, since .read_time returns system's monotonic
> >     clock. This may confuse users who do not know about the fact that
> >     this rtc device is only meant for rtcwake. We can print this info
> >     into dmesg, but...
> >   - removing the driver and loading it back loses information about set
> >     wakeup time
> >=20
> > Proposal 2:
> > - the MCU will implement:
> >   - command for getting and setting clock that the MCU will count
> >     The clock will be considered invalid unless it was set at least
> >     once.
> >   - command for getting and setting wakeup alarm
> >   - command for power off
> > - the corresponding driver will again register a system off handler and
> >   a RTC device
> > - the system off handler will just send the poweroff command
> > - the RTC device can now behave like a true RTC device, but without a
> >   battery, the RTC_VL_BACKUP_EMPTY bit will be set.
> >   The userspace can set time from the true RTC, so that rtcwake may be
> >   used
> >=20
> > Overall proposal 1 is easier to implement, but the resulting /dev/rtc
> > device will not be a true RTC, which may confuse users. Proposal 2
> > gives more complexity to MCU firmware.
> >=20
> > Personally I prefer proposal one.
> >=20
> > Do you guys have suggestions? Which kind of driver would you be willing
> > to accept?
> >  =20
>=20
> You probably need to look at rtc-meson-vrtc.c, rtc-fsl-ftm-alarm.c and
> rtc-brcmstb-waketimer.c which implement something similar.
>=20
> Honestly, I would go for an in-between proposal where you would store
> the requested alarm time (or more likely countdown) on
> set_alarm/alarm_irq_enable so you would get .read_alarm working.
>=20
> However, my main concern is that this is yet another custom protocol. We
> can't possibly have a driver for everyone implementing a timer in their
> FPGA/CPLD/cortexM.
>=20
> How will you communicate with the MCU, can't you use an already existing
> driver?

The MCU exposes a command interface over I2C. There already are
existing commands, which needs to stay for backwards compatibility.

It is theoretically possible to simulate an existing RTC device on
another I2C address, but I would need to study them, because the boards
are shipped with three different MCUs (STM32, GD32, NXP's MKL81) and
they sometimes have a little different I2C slave behavior.

But I will need to create a platform/mfd driver anyway for the system
off handler and GPIO controller. If I am going to create a new driver
anyway, why not add the RTC functionality as well?

Marek
