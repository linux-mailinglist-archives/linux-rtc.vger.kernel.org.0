Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7618E198385
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 20:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgC3SjV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Mar 2020 14:39:21 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:35533 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgC3SjV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Mar 2020 14:39:21 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 49809200002;
        Mon, 30 Mar 2020 18:39:17 +0000 (UTC)
Date:   Mon, 30 Mar 2020 20:39:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, wim@linux-watchdog.org, linux@roeck-us.net,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rtc: ds1307: add support for watchdog timer on ds1388
Message-ID: <20200330183917.GG846876@piout.net>
References: <20200330025500.6991-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330025500.6991-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/03/2020 15:55:00+1300, Chris Packham wrote:
> The DS1388 variant has watchdog timer capabilities. When using a DS1388
> and having enabled CONFIG_WATCHDOG_CORE register a watchdog device for
> the DS1388.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v3:
> - Address review comments from Guenter. Add select WATCHDOG_CORE, remove
>   unnecessary wdt member, add set_timeout op, use devm_watchdog_register
> Changes in v2:
> - Address review comments from Alexandre, the only functional change is setting
>   the hundredths of seconds to 0 instead of 99.
> 
>  drivers/rtc/Kconfig      |   1 +
>  drivers/rtc/rtc-ds1307.c | 115 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
