Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA5C1497DC
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Jan 2020 21:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgAYU4v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Jan 2020 15:56:51 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36395 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAYU4v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Jan 2020 15:56:51 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5F8ED40004;
        Sat, 25 Jan 2020 20:56:49 +0000 (UTC)
Date:   Sat, 25 Jan 2020 21:56:49 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>
Subject: Re: [PATCH v2 2/3] rtc: cmos: Use predefined value for RTC IRQ on
 legacy x86
Message-ID: <20200125205649.GC2952@piout.net>
References: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
 <20200123131437.28157-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123131437.28157-2-andriy.shevchenko@linux.intel.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/01/2020 15:14:36+0200, Andy Shevchenko wrote:
> When legacy devices are present on x86 machine, the RTC IRQ has
> a dedicated pre-defined value. Use it instead of hard coded number.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2: Added tags
>  drivers/rtc/rtc-cmos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
