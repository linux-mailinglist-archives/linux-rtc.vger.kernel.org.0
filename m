Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1830CF8AD
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 14:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfD3MVV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 08:21:21 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:58381 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfD3MVU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 30 Apr 2019 08:21:20 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 0616244028D;
        Tue, 30 Apr 2019 15:21:18 +0300 (IDT)
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com> <20190430093212.28425-3-alexandre.belloni@bootlin.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] rtc: digicolor: use .set_time
In-reply-to: <20190430093212.28425-3-alexandre.belloni@bootlin.com>
Date:   Tue, 30 Apr 2019 15:21:18 +0300
Message-ID: <874l6fu1j5.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue, Apr 30 2019, Alexandre Belloni wrote:
> Use .set_time instead of the deprecated .set_mmss.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  drivers/rtc/rtc-digicolor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> index e6e16aaac254..ed2fc1adafd5 100644
> --- a/drivers/rtc/rtc-digicolor.c
> +++ b/drivers/rtc/rtc-digicolor.c
> @@ -106,11 +106,11 @@ static int dc_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	return 0;
>  }
>  
> -static int dc_rtc_set_mmss(struct device *dev, unsigned long secs)
> +static int dc_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct dc_rtc *rtc = dev_get_drvdata(dev);
>  
> -	return dc_rtc_write(rtc, secs);
> +	return dc_rtc_write(rtc, rtc_tm_to_time64(tm));
>  }
>  
>  static int dc_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> @@ -161,7 +161,7 @@ static int dc_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>  
>  static const struct rtc_class_ops dc_rtc_ops = {
>  	.read_time		= dc_rtc_read_time,
> -	.set_mmss		= dc_rtc_set_mmss,
> +	.set_time		= dc_rtc_set_time,
>  	.read_alarm		= dc_rtc_read_alarm,
>  	.set_alarm		= dc_rtc_set_alarm,
>  	.alarm_irq_enable	= dc_rtc_alarm_irq_enable,


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
