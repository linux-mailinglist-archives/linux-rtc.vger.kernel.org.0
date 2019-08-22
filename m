Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD939A22B
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732398AbfHVV21 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:28:27 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43053 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730897AbfHVV21 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:28:27 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3F3241C0003;
        Thu, 22 Aug 2019 21:28:25 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:28:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        a.zummo@towertech.it, wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Subject: Re: [PATCH v3 3/5] rtc: pcf2127: bugfix: read rtc disables watchdog
Message-ID: <20190822212825.GI27031@piout.net>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-3-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822131936.18772-3-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2019 15:19:34+0200, Bruno Thomsen wrote:
> The previous fix listed bulk read of registers as root cause of
> accendential disabling of watchdog, since the watchdog counter
> register (WD_VAL) was zeroed.
> 
> Fixes: 3769a375ab83 rtc: pcf2127: bulk read only date and time registers.
> 
> Tested with the same PCF2127 chip as Sean reveled root cause
> of WD_VAL register value zeroing was caused by reading CTRL2
> register which is one of the watchdog feature control registers.
> 
> So the solution is to not read the first two control registers
> (CTRL1 and CTRL2) in pcf2127_rtc_read_time as they are not
> needed anyway. Size of local buf variable is kept to allow
> easy usage of register defines to improve readability of code.
> 
> Debug trace line was updated after CTRL1 and CTRL2 are no longer
> read from the chip. Also replaced magic numbers in buf access
> with register defines.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
> v3: no change.
> v2: new bugfix, not in v1.
> 
>  drivers/rtc/rtc-pcf2127.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
