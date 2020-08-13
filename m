Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8E7243502
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Aug 2020 09:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgHMHd2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Aug 2020 03:33:28 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49787 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMHd2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Aug 2020 03:33:28 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 62C16C0005;
        Thu, 13 Aug 2020 07:33:25 +0000 (UTC)
Date:   Thu, 13 Aug 2020 09:33:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Victor Ding <victording@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: initialize rtc time when reading alarm
Message-ID: <20200813073325.GK3480@piout.net>
References: <20200813154020.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813154020.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 13/08/2020 15:41:34+1000, Victor Ding wrote:
> cmos_read_alarm() may leave certain fields of a struct rtc_time
> untouched; therefore, these fields contain garbage if not properly
> initialized, leading to inconsistent values when converting into
> time64_t.
> This patch to set all fields of a struct rtc_time to -1 before calling
> cmos_read_alarm().
> 

I don't think this actually helps with the conversion as mktime64
is taking unsigned int so I would think you need the whole logic that is
in __rtc_read_alarm

> Signed-off-by: Victor Ding <victording@google.com>
> ---
> 
>  drivers/rtc/rtc-cmos.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index bcc96ab7793f..c99af567780d 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -1006,6 +1006,7 @@ static int cmos_suspend(struct device *dev)
>  			enable_irq_wake(cmos->irq);
>  	}
>  
> +	memset(&cmos->saved_wkalrm.time, -1, sizeof(struct rtc_time));
>  	cmos_read_alarm(dev, &cmos->saved_wkalrm);
>  
>  	dev_dbg(dev, "suspend%s, ctrl %02x\n",
> @@ -1054,6 +1055,7 @@ static void cmos_check_wkalrm(struct device *dev)
>  		return;
>  	}
>  
> +	memset(&current_alarm.time, -1, sizeof(struct rtc_time));
>  	cmos_read_alarm(dev, &current_alarm);
>  	t_current_expires = rtc_tm_to_time64(&current_alarm.time);
>  	t_saved_expires = rtc_tm_to_time64(&cmos->saved_wkalrm.time);
> -- 
> 2.28.0.236.gb10cc79966-goog
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
