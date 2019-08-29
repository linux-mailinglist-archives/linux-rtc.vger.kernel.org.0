Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAA20A289B
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 23:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfH2VGE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 17:06:04 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46611 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbfH2VGE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 17:06:04 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 284A84000E;
        Thu, 29 Aug 2019 21:06:00 +0000 (UTC)
Date:   Thu, 29 Aug 2019 23:05:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com, broonie@kernel.org,
        nandor.han@vaisala.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v5] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190829210554.GN21922@piout.net>
References: <20190829021418.4607-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829021418.4607-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/08/2019 10:14:18+0800, Biwen Li wrote:
> Issue:
>     - # hwclock -w
>       hwclock: RTC_SET_TIME: Invalid argument
> 
> Why:
>     - Relative commit: 8b9f9d4dc511309918c4f6793bae7387c0c638af, this patch
>       will always check for unwritable registers, it will compare reg
>       with max_register in regmap_writeable.
> 
>     - The pcf85363/pcf85263 has the capability of address wrapping
>       which means if you access an address outside the allowed range
>       (0x00-0x2f) hardware actually wraps the access to a lower address.
>       The rtc-pcf85363 driver will use this feature to configure the time
>       and execute 2 actions in the same i2c write operation (stopping the
>       clock and configure the time). However the driver has also
>       configured the `regmap maxregister` protection mechanism that will
>       block accessing addresses outside valid range (0x00-0x2f).
> 
> How:
>     - Split of writing regs to two parts, first part writes control
>       registers about stop_enable and resets, second part writes
>       RTC time and date registers.
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- drop robust explanation
> 
> Change in v4:
> 	- use old scheme
> 	- replace link to lkml.org with commit
> 	- add proper explanation
> 
> Change in v3:
> 	- replace old scheme with new scheme:
> 	  increase max_register.
> 
> Change in v2:
> 	- add Why and How into commit message.
> 
>  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
