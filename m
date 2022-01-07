Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B378F4877A5
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jan 2022 13:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbiAGMoV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Jan 2022 07:44:21 -0500
Received: from mx-out.tlen.pl ([193.222.135.148]:49029 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbiAGMoU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 7 Jan 2022 07:44:20 -0500
Received: (wp-smtpd smtp.tlen.pl 5172 invoked from network); 7 Jan 2022 13:44:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1641559456; bh=xiBX8PyBqNcjtRd1m+zKcPOe6AicNgc/BV0BLx9tlc0=;
          h=Subject:To:Cc:From;
          b=qrzbVMYzkAeGA09qWmpKKYTFoqoEPCy/N2swBaRigqnE1PHltgTg6yhin3YE8q7Xd
           Cu/bIFPJTQ1lEp0KKm2XPH5ZVxVWsiprXSnip+69D1lcH4lUKhj3Eqi/y7S7gr9dtj
           BF4uZYRN9ihOCiWQNoImnFYGypN0dOjwVaViFZFk=
Received: from aafo3.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.144.3])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-rtc@vger.kernel.org>; 7 Jan 2022 13:44:14 +0100
Message-ID: <475fd4ed-246e-c734-d58a-6a470d61be90@o2.pl>
Date:   Fri, 7 Jan 2022 13:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v1] rtc: cmos: Evaluate century appropriate
Content-Language: en-GB
To:     linux-rtc@vger.kernel.org
References: <20220106084609.1223688-1-luriwen () kylinos ! cn>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        luriwen@kylinos.cn
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
In-Reply-To: <20220106084609.1223688-1-luriwen () kylinos ! cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 3bcec8ec7771296774a075fce247aa53
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000B [kWOE]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

W dniu 06.01.2022 o 09:46, Riwen Lu pisze:
> There's limiting the year to 2069. When setting the rtc year to 2070,
> reading it returns 1970. Evaluate century starting from 19 to count the
> correct year.
>
> $ sudo date -s 20700106
> Mon 06 Jan 2070 12:00:00 AM CST
> $ sudo hwclock -w
> $ sudo hwclock -r
> 1970-01-06 12:00:49.604968+08:00
Indeed, my system is also affected.
> Fixes: 2a4daadd4d3e5071 ("rtc: cmos: ignore bogus century byte")
>
> Signed-off-by: Riwen Lu <luriwen@kylinos.cn>

Reviewed-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-mc146818-lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index dcfaf09946ee..2065842f775d 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -104,7 +104,7 @@ unsigned int mc146818_get_time(struct rtc_time *time)
>  	time->tm_year += real_year - 72;
>  #endif
>  
> -	if (century > 20)
> +	if (century > 19)
>  		time->tm_year += (century - 19) * 100;
>  
>  	/*


