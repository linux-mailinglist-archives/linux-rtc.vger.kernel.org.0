Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB88DE67E
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 10:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfJUIdE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 04:33:04 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:58473 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfJUIdE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 04:33:04 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CF33760017;
        Mon, 21 Oct 2019 08:33:01 +0000 (UTC)
Date:   Mon, 21 Oct 2019 10:33:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCHv3] rtc: pcf2127: handle boot-enabled watchdog feature
Message-ID: <20191021083301.GS3125@piout.net>
References: <20191003133351.118538-1-martin@geanix.com>
 <20191021080838.2789-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021080838.2789-1-martin@geanix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 21/10/2019 10:08:38+0200, Martin Hundebøll wrote:
> Linux should handle when the pcf2127 watchdog feature is enabled by the
> bootloader. This is done by checking the watchdog timer value during
> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>

You could have kept Guenter's ack.

> ---
> 
> Change since v2:
>  * remove logging in case of error
> 
> Change since v1:
>  * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
> 
>  drivers/rtc/rtc-pcf2127.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
