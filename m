Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D290448AAC3
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jan 2022 10:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236741AbiAKJqY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jan 2022 04:46:24 -0500
Received: from mx-out.tlen.pl ([193.222.135.140]:33465 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbiAKJqY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jan 2022 04:46:24 -0500
Received: (wp-smtpd smtp.tlen.pl 28822 invoked from network); 11 Jan 2022 10:46:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1641894381; bh=5RuVDG4AcbB9esWeXvS3dywPZZKlW2PyCauHa1sMOVM=;
          h=Subject:To:Cc:From;
          b=ibOSzZsa1uhuwOueHVqTqsPcWr3gPHDx9JYiZKKn0+E1qLL8yhklF0sQHnWA/rXbf
           5X6goUpFwio0XyJ3Fd8Hg9RCFX1M5qGB2J/xnHZmCXfw69vvsUzhlre6GzaVAWygxl
           pKE8+vs1iZ2nZw/1f2oBKLnMsA5uuoQ/0OvH0r+g=
Received: from aaen213.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.117.213])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <dan.carpenter@oracle.com>; 11 Jan 2022 10:46:21 +0100
Message-ID: <95c58e38-1a04-9bb2-a196-b76948ccf1e3@o2.pl>
Date:   Tue, 11 Jan 2022 10:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] rtc: mc146818-lib: fix signedness bug in
 mc146818_get_time()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Marco Chiappero <marco.chiappero@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        Tomasz Kowalik <tomaszx.kowalik@intel.com>,
        qat-linux@intel.com, linux-crypto@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220111071922.GE11243@kili>
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
In-Reply-To: <20220111071922.GE11243@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 7674f249d9188a7ba009e014e442405a
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000B [8ZPk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

W dniu 11.01.2022 o 08:19, Dan Carpenter pisze:
> The mc146818_get_time() function returns zero on success or negative
> a error code on failure.  It needs to be type int.
>
> Fixes: d35786b3a28d ("rtc: mc146818-lib: change return values of mc146818_get_time()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed, thanks for spotting this.

Reviewed-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

> ---
>  include/linux/mc146818rtc.h                    | 2 +-
>  drivers/rtc/rtc-mc146818-lib.c                 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> index 67fb0a12becc..808bb4cee230 100644
> --- a/include/linux/mc146818rtc.h
> +++ b/include/linux/mc146818rtc.h
> @@ -124,7 +124,7 @@ struct cmos_rtc_board_info {
>  #endif /* ARCH_RTC_LOCATION */
>  
>  bool mc146818_does_rtc_work(void);
> -unsigned int mc146818_get_time(struct rtc_time *time);
> +int mc146818_get_time(struct rtc_time *time);
>  int mc146818_set_time(struct rtc_time *time);
>  
>  bool mc146818_avoid_UIP(void (*callback)(unsigned char seconds, void *param),
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index f62e658cbe23..7f689f1bafc5 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -130,7 +130,7 @@ static void mc146818_get_time_callback(unsigned char seconds, void *param_in)
>  	p->ctrl = CMOS_READ(RTC_CONTROL);
>  }
>  
> -unsigned int mc146818_get_time(struct rtc_time *time)
> +int mc146818_get_time(struct rtc_time *time)
>  {
>  	struct mc146818_get_time_callback_param p = {
>  		.time = time


