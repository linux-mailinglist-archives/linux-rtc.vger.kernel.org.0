Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC139A22D
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388515AbfHVV2l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:28:41 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60703 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388346AbfHVV2l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:28:41 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5FFED1C0004;
        Thu, 22 Aug 2019 21:28:39 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:28:39 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        a.zummo@towertech.it, wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Subject: Re: [PATCH v3 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20190822212839.GJ27031@piout.net>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-4-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822131936.18772-4-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2019 15:19:35+0200, Bruno Thomsen wrote:
> Add partial support for the watchdog functionality of
> both PCF2127 and PCF2129 chips.
> 
> The programmable watchdog timer is currently using a fixed
> clock source of 1Hz. This result in a selectable range of
> 1-255 seconds, which covers most embedded Linux use-cases.
> 
> Clock sources of 4096Hz, 64Hz and 1/60Hz is mostly useful
> in MCU use-cases.
> 
> Countdown timer not available when using watchdog feature.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
> v3: removed 2 x dev_info() and 1 x dev_err() traces.
>     lowered dev_info() to dbg_info() in pcf2127_wdt_set_timeout.
>     removed unneeded ret variable in pcf2127_wdt_set_timeout.
> v2: use new watchdog api, e.g. devm_watchdog_register_device.
>     remove watchdog Kconfig option.
>     update existing Kconfig option with additional information.
> 
>  drivers/rtc/Kconfig       |   7 ++-
>  drivers/rtc/rtc-pcf2127.c | 118 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
