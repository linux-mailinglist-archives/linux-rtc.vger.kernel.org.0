Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37B6E4D3A3
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2019 18:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbfFTQW0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jun 2019 12:22:26 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39137 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731992AbfFTQW0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jun 2019 12:22:26 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0CE2320013;
        Thu, 20 Jun 2019 16:22:21 +0000 (UTC)
Date:   Thu, 20 Jun 2019 18:22:20 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] rtc: pcf8563: Fix unhandled interrupt storm
Message-ID: <20190620162220.GA23549@piout.net>
References: <20190604042337.26129-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604042337.26129-1-wens@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/06/2019 12:23:34+0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi everyone,
> 
> While bringing up my Pine H64, I encountered an interrupt storm from the
> pcf8563 RTC. The RTC chip's interrupt line is shared with the PMIC, and
> was not properly added to the device tree. Also, the driver was using an
> trigger method incompatible with the PMIC, preventing the interrupt line
> from being shared. Last, the driver only clears and masks the alarm
> interrupt, while leaving the timer interrupt untouched. This is a
> problem if previous systems left the timer interrupt enabled, and there
> was an interrupt pending.
> 
> This patch set fixes all three issues, one per patch.
> 
> Please have a look.
> 

I don't have that particular RTC so I can't test but the interrupt
handling in pcf8563_irq seems problematic too. I guess the RTC will only
trigger once per second because the call to pcf8563_set_alarm_mode will
explicitely leave the alarm enabled. The core doesn't really care but it
doesn't really expect the alarm to stay enabled. i.e. It will ensure the
alarm is enabled again after setting it when necessary. I think it would
be safer to simply clear both AIE and AF here. Could you test?

> Chen-Yu Tsai (3):
>   rtc: pcf8563: Fix interrupt trigger method
>   rtc: pcf8563: Clear event flags and disable interrupts before
>     requesting irq
>   arm64: dts: allwinner: h6: Pine H64: Add interrupt line for RTC
> 
>  .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  2 ++
>  drivers/rtc/rtc-pcf8563.c                           | 13 ++++++-------
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
