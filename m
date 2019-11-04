Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A1BED6CB
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2019 02:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfKDBLC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 3 Nov 2019 20:11:02 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33011 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfKDBLC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 3 Nov 2019 20:11:02 -0500
Received: by mail-oi1-f194.google.com with SMTP id m193so12740247oig.0
        for <linux-rtc@vger.kernel.org>; Sun, 03 Nov 2019 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kLMY0Cvy7Nvru6al3kC6jjBTn7dSEqHG10ktUahz3Gg=;
        b=K9OuwQi1n+XhMJRpOBfh7sbOOHK9iJPkq72YbhVfVlGGZjjVmnU1RExUzm1pt8HD3y
         +eKIEwb9s9qxHjkEOFoZVvxeqM/EZ6bQoXFXilPKd6T0DlD/dhZnqVEPLzC2nO1Zd6iY
         tGGmBG3JiH7999AbHJeoAVd/TL73Dtiz054jAMIEJqA/USucGpTQsfqvmv6IfJeZcZD1
         NY2vIC50sT/wHMiT8A6qrQIbEvzjBjtebTOMMint2QKMSdLCbJ4C/jfE/GrzxN5m4tkD
         uOZpsTgKhppbIFSDZ6nBjc5ltY7Qwsx5L640W+N9H+YWjbiz+4nDJ4r2T93FBypzt5uT
         AQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kLMY0Cvy7Nvru6al3kC6jjBTn7dSEqHG10ktUahz3Gg=;
        b=i02Sv7fu6gOh2dnvwDorwR2cbGypS+MZWffLChe82oRoJ1T7NeAz8LHvCKmEeNiiFn
         LdXWN6CNg+QehREmMUtoLJyoJ8BDnyUzXJ06LC6alWpoaRIdWvNUzi5+M3BFDxBsEDP+
         8Yi8l4Mg17rZzqkDOLAoB9OL1PaAakn5wHUFBJfXRtZEf6rp487MXyRb9ErWki7JuJg3
         x3U8F4TODih1QoR/zKH4QfvUy6kWgSyDBT1SPvSHQq48unTiMRz3nBZMUyGVLbRuRnQ/
         rCzZCQxp2jFZKTQijNwGGq0gjwqpJYUcsa4GbUrcNXO+HKDUkgg/PeVi01WNPbNRm/5R
         lM1w==
X-Gm-Message-State: APjAAAVLpWR1pJqTZWCaARp4xS9lEvWcpok/UsiCkn7lQqXzIlmUcsl7
        cwFyTLV+HCieQ1oMTvJ3mfiuq33QJQxdsm93f+fva4s=
X-Google-Smtp-Source: APXvYqxaWxdOkDLs+3cAmfwSScsBClFP7go6NMCUytzv2x20XqsY3jxzwRMFo1MDDvmdKTzlortCCg8ZRInGBwwRlO4=
X-Received: by 2002:aca:3386:: with SMTP id z128mr907901oiz.122.1572829859931;
 Sun, 03 Nov 2019 17:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20191031102717.GB2967@piout.net> <20191101095422.14787-1-ilya@compulab.co.il>
In-Reply-To: <20191101095422.14787-1-ilya@compulab.co.il>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Mon, 4 Nov 2019 10:10:34 +0900
Message-ID: <CABMQnVJxYS=_fHa4LShWy9Xy7RzJjeMZPxsqYyRSAPhfbL1-RQ@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: em3027: correct month value
To:     Ilya Ledvich <ilya@compulab.co.il>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2019=E5=B9=B411=E6=9C=881=E6=97=A5(=E9=87=91) 18:54 Ilya Ledvich <ilya@comp=
ulab.co.il>:
>
> The RTC month value is 1-indexed, but the kernel assumes it is 0-indexed.
> This may result in the RTC not rolling over correctly.
>
> Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro

> ---
>  drivers/rtc/rtc-em3027.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
> index 77cca1392253..9f176bce48ba 100644
> --- a/drivers/rtc/rtc-em3027.c
> +++ b/drivers/rtc/rtc-em3027.c
> @@ -71,7 +71,7 @@ static int em3027_get_time(struct device *dev, struct r=
tc_time *tm)
>         tm->tm_hour     =3D bcd2bin(buf[2]);
>         tm->tm_mday     =3D bcd2bin(buf[3]);
>         tm->tm_wday     =3D bcd2bin(buf[4]);
> -       tm->tm_mon      =3D bcd2bin(buf[5]);
> +       tm->tm_mon      =3D bcd2bin(buf[5]) - 1;
>         tm->tm_year     =3D bcd2bin(buf[6]) + 100;
>
>         return 0;
> @@ -94,7 +94,7 @@ static int em3027_set_time(struct device *dev, struct r=
tc_time *tm)
>         buf[3] =3D bin2bcd(tm->tm_hour);
>         buf[4] =3D bin2bcd(tm->tm_mday);
>         buf[5] =3D bin2bcd(tm->tm_wday);
> -       buf[6] =3D bin2bcd(tm->tm_mon);
> +       buf[6] =3D bin2bcd(tm->tm_mon + 1);
>         buf[7] =3D bin2bcd(tm->tm_year % 100);
>
>         /* write time/date registers */
> --
> 2.20.1
>


--
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
