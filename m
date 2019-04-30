Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B041F5CA
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 13:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfD3Lg2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 07:36:28 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:58374 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbfD3Lg1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 30 Apr 2019 07:36:27 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 3EEC444028D;
        Tue, 30 Apr 2019 14:36:25 +0300 (IDT)
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com> <20190430093212.28425-2-alexandre.belloni@bootlin.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] rtc: digicolor: set range
In-reply-to: <20190430093212.28425-2-alexandre.belloni@bootlin.com>
Date:   Tue, 30 Apr 2019 14:36:24 +0300
Message-ID: <877ebbu3lz.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue, Apr 30 2019, Alexandre Belloni wrote:

> While the range of REFERENCE + TIME is actually 33 bits, the counter
> itself (TIME) is a 32-bits seconds counter.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-digicolor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> index 5bb14c56bc9a..e6e16aaac254 100644
> --- a/drivers/rtc/rtc-digicolor.c
> +++ b/drivers/rtc/rtc-digicolor.c
> @@ -206,6 +206,7 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, rtc);
>  
>  	rtc->rtc_dev->ops = &dc_rtc_ops;
> +	rtc->rtc_dev->range_max = U32_MAX;

Where can I find documentation on the meaning and usage of the range_max
value? I could not find anything in the kernel source.

baruch

>  
>  	return rtc_register_device(rtc->rtc_dev);
>  }


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
