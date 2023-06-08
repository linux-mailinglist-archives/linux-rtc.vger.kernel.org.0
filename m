Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDA1727B2B
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jun 2023 11:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbjFHJ0C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Jun 2023 05:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjFHJ0B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Jun 2023 05:26:01 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC8A2136
        for <linux-rtc@vger.kernel.org>; Thu,  8 Jun 2023 02:25:57 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686216356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GaPfaXEV+r1xZhMKct1Rt4pLK+HLxUYYc67W3wQGU6k=;
        b=OOUbQHCxZleyzdRmI655BWsBQL9aqi576qRmNPgpO6UQIXaCgE1lZ8qc/qC9iNApJTXFap
        c6vIEfq2sfEQ6wKbL5hbgvIgpopFUBFmGnXEt7yAftfzrFCCFXp7oIhFvK/eB58CK8rr+O
        i3d+jQ9WKTYvSeRBHNQHFypgSC59RQRD+XZbb1jZr1CDeyaCPWF4Ocdqsh8jQveAeCuHX/
        eDBVn7tB4vjlNYZQKh2F0fWsfpjXjZ4oao9eBmkxykS2fz6Rm+IwX8tmuCjgsVt02YGM48
        4fmMIZVJ/xP9Zhfbu11sEziLU83Out1KP2zqDiymA2G2oAd48P7rpcAmpHoWCA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9FF61BF203;
        Thu,  8 Jun 2023 09:25:55 +0000 (UTC)
Date:   Thu, 8 Jun 2023 11:25:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: question about firmware RTC design (for rtcwake)
Message-ID: <20230608092555ac19684c@mail.local>
References: <20230522164638.68fea327@thinkpad>
 <2023052219400923b59cc0@mail.local>
 <20230522231454.30283751@thinkpad>
 <20230607082828fd8d03fc@mail.local>
 <20230608110557.16284eb2@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230608110557.16284eb2@thinkpad>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/06/2023 11:05:57+0200, Marek Behún wrote:
> On Wed, 7 Jun 2023 10:28:28 +0200
> Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > On 22/05/2023 23:14:54+0200, Marek Behún wrote:
> > > > You probably need to look at rtc-meson-vrtc.c, rtc-fsl-ftm-alarm.c and
> > > > rtc-brcmstb-waketimer.c which implement something similar.
> > > > 
> > > > Honestly, I would go for an in-between proposal where you would store
> > > > the requested alarm time (or more likely countdown) on
> > > > set_alarm/alarm_irq_enable so you would get .read_alarm working.
> > > > 
> > > > However, my main concern is that this is yet another custom protocol. We
> > > > can't possibly have a driver for everyone implementing a timer in their
> > > > FPGA/CPLD/cortexM.
> > > > 
> > > > How will you communicate with the MCU, can't you use an already existing
> > > > driver?  
> > > 
> > > The MCU exposes a command interface over I2C. There already are
> > > existing commands, which needs to stay for backwards compatibility.
> > > 
> > > It is theoretically possible to simulate an existing RTC device on
> > > another I2C address, but I would need to study them, because the boards
> > > are shipped with three different MCUs (STM32, GD32, NXP's MKL81) and
> > > they sometimes have a little different I2C slave behavior.
> > > 
> > > But I will need to create a platform/mfd driver anyway for the system
> > > off handler and GPIO controller. If I am going to create a new driver
> > > anyway, why not add the RTC functionality as well?  
> > 
> > No, this is not how MFD is working, you will be writing a separate RTC
> > driver or reusing an existing one. Have a look at the recent isl1208
> 
> THX for the reply.
> I have one I2C client through which I need to implement RTC, GPIO and
> system power off. I thought such drivers live in drivers/mfd... Am I
> wrong?

You are not wrong but the code doesn't necessarily live in drivers/mfd
but is in the subsystems instead.

> 
> Marek
> 
> 
> > series:
> > 
> > https://lore.kernel.org/linux-rtc/OS0PR01MB5922DAC377266672ADA9FC28864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#mab0a75187abf7d8aada2c3517ebfdf7241f4bc7a
> > 
> > This patch adds supports for the isl1208 on board of a PMIC, as you can
> > see, this is a very small change versus a full blown RTC driver.
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
