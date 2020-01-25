Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F731497DD
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Jan 2020 21:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgAYU5J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Jan 2020 15:57:09 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:57843 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAYU5J (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Jan 2020 15:57:09 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5AF03FF802;
        Sat, 25 Jan 2020 20:57:07 +0000 (UTC)
Date:   Sat, 25 Jan 2020 21:57:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>
Subject: Re: [PATCH v2 3/3] rtc: cmos: Refactor code by using the new
 dmi_get_bios_year() helper
Message-ID: <20200125205706.GD2952@piout.net>
References: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
 <20200123131437.28157-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123131437.28157-3-andriy.shevchenko@linux.intel.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/01/2020 15:14:37+0200, Andy Shevchenko wrote:
> Refactor code by using the new dmi_get_bios_year() helper instead of
> open coding its functionality. This also makes logic slightly clearer.
> 
> No changes intended.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2: Added tags
>  drivers/rtc/rtc-cmos.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
