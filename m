Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5839A22F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732791AbfHVV3D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:29:03 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:37161 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730242AbfHVV3C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:29:02 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5DCB3100002;
        Thu, 22 Aug 2019 21:29:00 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:29:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        a.zummo@towertech.it, wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Subject: Re: [PATCH v3 5/5] rtc: pcf2127: add tamper detection support
Message-ID: <20190822212900.GK27031@piout.net>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-5-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822131936.18772-5-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2019 15:19:36+0200, Bruno Thomsen wrote:
> Add support for integrated tamper detection function in both PCF2127 and
> PCF2129 chips. This patch implements the feature by adding an additional
> timestamp0 file to sysfs device path. This file contains seconds since
> epoch, if an event occurred, or is empty, if none occurred.
> Interface should match ISL1208 and RV3028 RTC drivers.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
> v3: no change.
> v2: call pcf2127_wdt_active_ping after CTRL2 register read.
>     add dev_dbg() trace in timestamp0_show().
>     minor regmap dev_err() text update in pcf2127_probe().
> 
>  drivers/rtc/rtc-pcf2127.c | 160 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
