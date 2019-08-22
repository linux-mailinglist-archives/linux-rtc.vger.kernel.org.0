Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4417E9A1ED
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391527AbfHVVQF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:16:05 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47011 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390414AbfHVVQF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:16:05 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BC180FF807;
        Thu, 22 Aug 2019 21:16:01 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:16:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     megous@megous.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Message-ID: <20190822211601.GF27031@piout.net>
References: <20190820151934.3860-1-megous@megous.com>
 <20190820151934.3860-3-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820151934.3860-3-megous@megous.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/08/2019 17:19:33+0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> mostly in features that are not yet supported by this driver.
> 
> Some differences are already stated in the comments in existing code.
> One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> 
> It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> external low speed oscillator is working correctly.
> 
> This patch adds support for enabling LOSC when necessary:
> 
> - during reparenting
> - when probing the clock
> 
> H6 also has capacbility to automatically reparent RTC clock from
> external crystal oscillator, to internal RC oscillator, if external
> oscillator fails. This is enabled by default. Disable it during
> probe.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
