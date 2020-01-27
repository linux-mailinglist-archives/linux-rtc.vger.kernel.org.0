Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB7714AC3E
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2020 23:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgA0Wpv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Jan 2020 17:45:51 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34871 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgA0Wpv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Jan 2020 17:45:51 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5EC431BF204;
        Mon, 27 Jan 2020 22:45:49 +0000 (UTC)
Date:   Mon, 27 Jan 2020 23:45:49 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Joe Perches <joe@perches.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when not
 needed
Message-ID: <20200127224549.GC3273@piout.net>
References: <20200112171349.22268-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200112171349.22268-1-geert@linux-m68k.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/01/2020 18:13:49+0100, Geert Uytterhoeven wrote:
> Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
> no driver needs it.  While the former can be moduler, the latter cannot,
> and thus becomes built-in.
> 
> Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
> from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
> it.
> 
> Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
> for more information, but the latter does not select REGMAP_{I2C,SPI}
> itself, and defers that to the individual drivers, too.
> 
> Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Joe: When merging addresses, scripts/get_maintainer.pl replaces
>      Alexandre's authoritative email address from MAINTAINERS by the
>      obsolete address in the SoB-line of the commit referred to by the
>      Fixes-line.
> 
>  drivers/rtc/Kconfig | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
