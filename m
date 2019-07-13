Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181D567BC4
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2019 21:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbfGMTby (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 Jul 2019 15:31:54 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56793 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfGMTby (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Jul 2019 15:31:54 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C15A460004;
        Sat, 13 Jul 2019 19:31:51 +0000 (UTC)
Date:   Sat, 13 Jul 2019 21:31:51 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     a.zummo@towertech.it, Dylan.Howey@tennantco.com,
        ravi23ganiga@gmail.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2123: Fix build error
Message-ID: <20190713193151.GA4732@piout.net>
References: <20190704085542.48180-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704085542.48180-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/07/2019 16:55:42+0800, YueHaibing wrote:
> If REGMAP_SPI is m and RTC_DRV_PCF2123 is y,
> 
> drivers/rtc/rtc-pcf2123.o: In function `pcf2123_probe':
> rtc-pcf2123.c:(.text+0xb2b): undefined reference to `__devm_regmap_init_spi'
> 
> Select REGMAP_SPI as RTC_DRV_DS1347 driver does.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 790d033933b8 ("rtc: pcf2123: port to regmap")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/rtc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
