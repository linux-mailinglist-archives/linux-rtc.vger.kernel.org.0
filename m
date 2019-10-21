Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C01DF28C
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 18:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbfJUQLR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 12:11:17 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57309 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfJUQLQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 12:11:16 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EAA22200011;
        Mon, 21 Oct 2019 16:11:13 +0000 (UTC)
Date:   Mon, 21 Oct 2019 18:11:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] rtc: report time-retrieval errors when updating alarm
Message-ID: <20191021161113.GZ3125@piout.net>
References: <20180521164222.149896-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521164222.149896-1-briannorris@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Brian,

On 21/05/2018 09:42:22-0700, Brian Norris wrote:
> __rtc_read_time() can fail (e.g., if the RTC uses an unreliable medium).
> When it does, we don't report the error, but instead calculate a
> 1-second alarm based on the potentially-garbage 'tm' (in practice,
> __rtc_read_time() zeroes out the time first, so it's likely to still be
> all 0).
> 
> Let's propagate the error instead.
> 

I submitted
https://lore.kernel.org/linux-rtc/20191021155631.3342-2-alexandre.belloni@bootlin.com/T/#u
to solve this after looking at all the implication checking the return
value of __rtc_read_time had.

> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/rtc/interface.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 7cbdc9228dd5..a4bdd8b5fe2e 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -555,7 +555,9 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>  		struct rtc_time tm;
>  		ktime_t now, onesec;
>  
> -		__rtc_read_time(rtc, &tm);
> +		err = __rtc_read_time(rtc, &tm);
> +		if (err)
> +			goto out;
>  		onesec = ktime_set(1, 0);
>  		now = rtc_tm_to_ktime(tm);
>  		rtc->uie_rtctimer.node.expires = ktime_add(now, onesec);
> -- 
> 2.17.0.441.gb46fe60e1d-goog
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
