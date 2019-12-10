Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3207118E21
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 17:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfLJQtT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 11:49:19 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40977 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfLJQtS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 11:49:18 -0500
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4C0D960004;
        Tue, 10 Dec 2019 16:49:17 +0000 (UTC)
Date:   Tue, 10 Dec 2019 17:49:14 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] rtc: ds1343: Do not hardcode SPI mode flags
Message-ID: <20191210164914.GV1463890@piout.net>
References: <20191204225731.20306-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204225731.20306-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/12/2019 23:57:31+0100, Linus Walleij wrote:
> The current use of mode flags to us SPI_MODE_3 and
> SPI_CS_HIGH is fragile: it overwrites anything already
> assigned by the SPI core. Change it thusly:
> 
> - Just |= the SPI_MODE_3 so we keep other flags
> - Assign ^= SPI_CS_HIGH since we might be active high
>   already, and that is usually the case with GPIOs used
>   for chip select, even if they are in practice active low.
> 
> Add a comment clarifying why ^= SPI_CS_HIGH is the right
> choice here.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/rtc/rtc-ds1343.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
