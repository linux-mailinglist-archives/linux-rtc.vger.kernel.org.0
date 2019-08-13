Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2286D8B302
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 10:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbfHMIxf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 04:53:35 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:47713 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbfHMIxe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Aug 2019 04:53:34 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4683E1C000B;
        Tue, 13 Aug 2019 08:53:32 +0000 (UTC)
Date:   Tue, 13 Aug 2019 10:53:31 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 39/57] rtc: Remove dev_err() usage after
 platform_get_irq()
Message-ID: <20190813085331.GX3600@piout.net>
References: <20190730181557.90391-1-swboyd@chromium.org>
 <20190730181557.90391-40-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730181557.90391-40-swboyd@chromium.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/07/2019 11:15:39-0700, Stephen Boyd wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
> 
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
> 
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
> 
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
> 
> While we're here, remove braces on if statements that only have one
> statement (manually).
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Please apply directly to subsystem trees
> 
>  drivers/rtc/rtc-88pm80x.c    | 1 -
>  drivers/rtc/rtc-88pm860x.c   | 4 +---
>  drivers/rtc/rtc-ac100.c      | 4 +---
>  drivers/rtc/rtc-armada38x.c  | 5 +----
>  drivers/rtc/rtc-asm9260.c    | 4 +---
>  drivers/rtc/rtc-at91rm9200.c | 4 +---
>  drivers/rtc/rtc-at91sam9.c   | 4 +---
>  drivers/rtc/rtc-bd70528.c    | 5 +----
>  drivers/rtc/rtc-davinci.c    | 4 +---
>  drivers/rtc/rtc-jz4740.c     | 4 +---
>  drivers/rtc/rtc-max77686.c   | 5 +----
>  drivers/rtc/rtc-mt7622.c     | 1 -
>  drivers/rtc/rtc-pic32.c      | 4 +---
>  drivers/rtc/rtc-pm8xxx.c     | 4 +---
>  drivers/rtc/rtc-puv3.c       | 8 ++------
>  drivers/rtc/rtc-pxa.c        | 8 ++------
>  drivers/rtc/rtc-rk808.c      | 6 +-----
>  drivers/rtc/rtc-s3c.c        | 8 ++------
>  drivers/rtc/rtc-sc27xx.c     | 4 +---
>  drivers/rtc/rtc-spear.c      | 4 +---
>  drivers/rtc/rtc-stm32.c      | 1 -
>  drivers/rtc/rtc-sun6i.c      | 4 +---
>  drivers/rtc/rtc-sunxi.c      | 4 +---
>  drivers/rtc/rtc-tegra.c      | 4 +---
>  drivers/rtc/rtc-vt8500.c     | 4 +---
>  drivers/rtc/rtc-xgene.c      | 4 +---
>  drivers/rtc/rtc-zynqmp.c     | 8 ++------
>  27 files changed, 28 insertions(+), 92 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
