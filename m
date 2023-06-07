Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B617257A2
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jun 2023 10:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239492AbjFGI2h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jun 2023 04:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239491AbjFGI2c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jun 2023 04:28:32 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB405E60
        for <linux-rtc@vger.kernel.org>; Wed,  7 Jun 2023 01:28:30 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686126509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kyUWQ0jaKAo5DxVruAqqY0uxC0YwQguhI23bJqwwpsU=;
        b=IzwF+oITjWbudJ0isLi3GjxvAxSqMiMBW08bhXeGtwaSEJDKJATut6/G/h9IOB0sIZgGFU
        Nixa4l+a9H+dyHbl40g1RvCuLJVBcLeuXYQPE5gm+5CMTHjfYIvY+ztGD2NB0tlIzrm5BK
        UM/Vna/Oa89y4CAVjD90vbR/hmge6bCqB8KSkdwFKintvtDktmi97Dz4l85/kkMojb0XSC
        7Zn4BxHhLbyY0eZN/xzFU86QIInVjdz2ByfGbRaxGEnwhFxhG1gSDooFrn5n3L7OTXOQ0W
        lbUrAozzpUe9+F0THCdHSxq6G0dVaiZRyfBsQyl8ojHQ/ebsX+uxASmqceE1cQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05F7B20004;
        Wed,  7 Jun 2023 08:28:28 +0000 (UTC)
Date:   Wed, 7 Jun 2023 10:28:28 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: question about firmware RTC design (for rtcwake)
Message-ID: <20230607082828fd8d03fc@mail.local>
References: <20230522164638.68fea327@thinkpad>
 <2023052219400923b59cc0@mail.local>
 <20230522231454.30283751@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522231454.30283751@thinkpad>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/05/2023 23:14:54+0200, Marek Behún wrote:
> > You probably need to look at rtc-meson-vrtc.c, rtc-fsl-ftm-alarm.c and
> > rtc-brcmstb-waketimer.c which implement something similar.
> > 
> > Honestly, I would go for an in-between proposal where you would store
> > the requested alarm time (or more likely countdown) on
> > set_alarm/alarm_irq_enable so you would get .read_alarm working.
> > 
> > However, my main concern is that this is yet another custom protocol. We
> > can't possibly have a driver for everyone implementing a timer in their
> > FPGA/CPLD/cortexM.
> > 
> > How will you communicate with the MCU, can't you use an already existing
> > driver?
> 
> The MCU exposes a command interface over I2C. There already are
> existing commands, which needs to stay for backwards compatibility.
> 
> It is theoretically possible to simulate an existing RTC device on
> another I2C address, but I would need to study them, because the boards
> are shipped with three different MCUs (STM32, GD32, NXP's MKL81) and
> they sometimes have a little different I2C slave behavior.
> 
> But I will need to create a platform/mfd driver anyway for the system
> off handler and GPIO controller. If I am going to create a new driver
> anyway, why not add the RTC functionality as well?

No, this is not how MFD is working, you will be writing a separate RTC
driver or reusing an existing one. Have a look at the recent isl1208
series:

https://lore.kernel.org/linux-rtc/OS0PR01MB5922DAC377266672ADA9FC28864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#mab0a75187abf7d8aada2c3517ebfdf7241f4bc7a

This patch adds supports for the isl1208 on board of a PMIC, as you can
see, this is a very small change versus a full blown RTC driver.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
