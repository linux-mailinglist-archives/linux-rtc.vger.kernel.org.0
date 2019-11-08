Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 043F8F52FC
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 18:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbfKHRxd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 12:53:33 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59851 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfKHRxd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Nov 2019 12:53:33 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9FDA56000B;
        Fri,  8 Nov 2019 17:53:29 +0000 (UTC)
Date:   Fri, 8 Nov 2019 18:53:29 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
Message-ID: <20191108175329.GH216543@piout.net>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108170135.9053-1-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2019 18:01:35+0100, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock have undefined behaviour (e.g. the hardware watchdog
> run to fast or slow).
> 
> The normal solution would be to properly describe the clock tree
> in DT, but from the kernel's perspective this is a chicken-and-egg
> problem: CKIL is required very early, but the clock is only provided
> after the I2C RTC has been probed.
> 
> Technically everything is fine by not touching anything, so this
> works around the issue by disabling the clock handling from the
> RTC driver. I guess the proper solution would be to simply mark the
> clock as always-enabled, but this does not seem to be supported by
> the clock framework.
> 

You need to have a consumer so this clock is not disabled by the CCF
after seeing nobody uses it. If you need it early, you can have a look
at rtc-sun6i.c but I would like that to not become a recurrent pattern,
especially for discrete RTCs.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
