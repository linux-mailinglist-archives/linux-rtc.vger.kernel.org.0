Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D28519F018
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2019 18:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfH0Q0R (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 27 Aug 2019 12:26:17 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53387 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfH0Q0R (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 27 Aug 2019 12:26:17 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7AE5924000A;
        Tue, 27 Aug 2019 16:26:14 +0000 (UTC)
Date:   Tue, 27 Aug 2019 18:26:11 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux@roeck-us.net, yuehaibing@huawei.com, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] rtc: pcf2127: bugfix: watchdog build dependency
Message-ID: <20190827162611.GB21922@piout.net>
References: <20190827143656.4734-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827143656.4734-1-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/08/2019 16:36:56+0200, Bruno Thomsen wrote:
> Disable watchdog registation when kernel is build without
> watchdog functionality, and enable watchdog core otherwise.
> This removes compile errors like the one below:
> 
> drivers/rtc/rtc-pcf2127.o: in function `pcf2127_probe.constprop.3':
> rtc-pcf2127.c:(.text.unlikely+0x2c8): undefined reference to
> `devm_watchdog_register_device'
> 
> Watchdog feature in chip will always be configured as
> this is safe to do in both cases and minimize code churn.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Reported-by: YueHaibing <yuehaibing@huawei.com>
> Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  drivers/rtc/Kconfig       | 1 +
>  drivers/rtc/rtc-pcf2127.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
