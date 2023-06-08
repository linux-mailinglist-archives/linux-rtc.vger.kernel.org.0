Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC75727ACF
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jun 2023 11:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjFHJGG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Jun 2023 05:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbjFHJGD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Jun 2023 05:06:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A9A9E
        for <linux-rtc@vger.kernel.org>; Thu,  8 Jun 2023 02:06:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C75BD64B1C
        for <linux-rtc@vger.kernel.org>; Thu,  8 Jun 2023 09:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBFDC433EF;
        Thu,  8 Jun 2023 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686215161;
        bh=0gLgITJcuBwv/0n+AyMNVvr3gbvY0k1alpa1gC8Jvs4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RsXLs79ScG4uB6PB29acbAEXX7XNDWrrD3cKHXmKh/nXifQBrSkwI8hYkyTkaTY6h
         448ZbkCWkqZpyfIxCYkYdiGYdkBIjKMHP6dgnIjPw2Of++9i5NQYFnmuMnNI3TDa4m
         LXcYKs/peogQeWKfpL1P8elCRvxkLeBGj25HCw/aMXCOEH3r+Tldb4ewVDkgZ0sdkq
         nAAqN2NLXI825ON8SCusgk4qepwtAGC59RsMq0uUQ3alyhlY4VR3k/zw5n3RG7vYcR
         DMy8bN2GDqHpA7b2wc+0tO40Ib59Yo2tgkNCHkGuWkRfpwfJbqyM6Qbpt5XLNOTggf
         kwjU+olvO/Ysg==
Date:   Thu, 8 Jun 2023 11:05:57 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: question about firmware RTC design (for rtcwake)
Message-ID: <20230608110557.16284eb2@thinkpad>
In-Reply-To: <20230607082828fd8d03fc@mail.local>
References: <20230522164638.68fea327@thinkpad>
        <2023052219400923b59cc0@mail.local>
        <20230522231454.30283751@thinkpad>
        <20230607082828fd8d03fc@mail.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
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

On Wed, 7 Jun 2023 10:28:28 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On 22/05/2023 23:14:54+0200, Marek Beh=C3=BAn wrote:
> > > You probably need to look at rtc-meson-vrtc.c, rtc-fsl-ftm-alarm.c and
> > > rtc-brcmstb-waketimer.c which implement something similar.
> > >=20
> > > Honestly, I would go for an in-between proposal where you would store
> > > the requested alarm time (or more likely countdown) on
> > > set_alarm/alarm_irq_enable so you would get .read_alarm working.
> > >=20
> > > However, my main concern is that this is yet another custom protocol.=
 We
> > > can't possibly have a driver for everyone implementing a timer in the=
ir
> > > FPGA/CPLD/cortexM.
> > >=20
> > > How will you communicate with the MCU, can't you use an already exist=
ing
> > > driver? =20
> >=20
> > The MCU exposes a command interface over I2C. There already are
> > existing commands, which needs to stay for backwards compatibility.
> >=20
> > It is theoretically possible to simulate an existing RTC device on
> > another I2C address, but I would need to study them, because the boards
> > are shipped with three different MCUs (STM32, GD32, NXP's MKL81) and
> > they sometimes have a little different I2C slave behavior.
> >=20
> > But I will need to create a platform/mfd driver anyway for the system
> > off handler and GPIO controller. If I am going to create a new driver
> > anyway, why not add the RTC functionality as well? =20
>=20
> No, this is not how MFD is working, you will be writing a separate RTC
> driver or reusing an existing one. Have a look at the recent isl1208

THX for the reply.
I have one I2C client through which I need to implement RTC, GPIO and
system power off. I thought such drivers live in drivers/mfd... Am I
wrong?

Marek


> series:
>=20
> https://lore.kernel.org/linux-rtc/OS0PR01MB5922DAC377266672ADA9FC28864DA@=
OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#mab0a75187abf7d8aada2c3517ebfdf7=
241f4bc7a
>=20
> This patch adds supports for the isl1208 on board of a PMIC, as you can
> see, this is a very small change versus a full blown RTC driver.

