Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1238438E071
	for <lists+linux-rtc@lfdr.de>; Mon, 24 May 2021 06:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhEXEoN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 May 2021 00:44:13 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:39715 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhEXEoL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 May 2021 00:44:11 -0400
Received: by mail-vk1-f173.google.com with SMTP id k22so3649052vko.6
        for <linux-rtc@vger.kernel.org>; Sun, 23 May 2021 21:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oo5s8uwjF8OUbBmkEbKQsEf78QSRRFiHDe/U/edTUi8=;
        b=B/+f7/rg2nxf8jbn87Ja7wWnko3ugfw5by9xEcHYm1zc9+DLasjWeUz56wkphR6I0m
         Ry0tNpRtLlzMm9EbYoOCxKX52Im0K6/0NDmarXkUz2VQVnWFl9F8UCff1Z7Ea7SCIun0
         zT39J5JHNF/3BrlCbleNJEM/5V544sJbd2yLoeaL0PaGs7jJK41jiyxoibFnACMQpYss
         sdsakwwp7XERCEnUQesMNY1rMeE1AE8VFkzsWziGPXQBome0dIqzrDfofYT+JQZam5QD
         /w6SN+QlJyp+Lc2lna/MnajFRq6aQzgtwCJC0tkZ0Y/c2OYe+3VX4Uxx6WeUU46iqcTC
         Ulsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oo5s8uwjF8OUbBmkEbKQsEf78QSRRFiHDe/U/edTUi8=;
        b=kpzgkU3PDEag9eQXKkhuCy2vuuGUHuUQh7NqaWrjMb4NA589SstND7YHaEFsMNeeZ+
         RAIpznxozC+/2PisNI4GtUX5cvX8W6D8eRp0fBoxy3QgW2lUlEJJL3xxJMaA9Cw8Rh1f
         ayKmp+ZNO0TXFJkNH3RrGPnBgQgKZuAFZJbHAG0R3zDU9QZ8yRtGI8QuYIc9MRlgouhA
         j6j13ddq+MBMjju7/AVHrGrbxtOY39BK+BGA15M65FBI66I15AX7gj92LUMQnGDDFE/C
         ZwnaUsEu6vG9E4ejm7b2XQK4rUIq/oVhWdSLG9nJsCvkCEa+DTSCnGJDC7W5twByVtNk
         6DBg==
X-Gm-Message-State: AOAM5339I+IKF5Ne696CYP5xNiXeIEV6hphJA66/XzFZ/v5ydDtLU/+P
        oNRQ6h+x2vuCMyvTpgi8UdWHwU3cH6scd7iXYaal
X-Google-Smtp-Source: ABdhPJwubfN66hEaBX7DuVUrkG2WV39k605CpKZQiPKpwbDi4Z0To1yEhCmQ7/3IuCuh4Tj059RyLW3QjmJK6NVy1Xo=
X-Received: by 2002:a05:6122:a23:: with SMTP id 35mr19257058vkn.20.1621831274980;
 Sun, 23 May 2021 21:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210520033156.23209-1-qxj511mail@gmail.com>
In-Reply-To: <20210520033156.23209-1-qxj511mail@gmail.com>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Mon, 24 May 2021 13:40:48 +0900
Message-ID: <CABMQnV+5gN_6BA4tYS+GugrA0HrQD9+_EkQk_emqsUy1YzFCOA@mail.gmail.com>
Subject: Re: [PATCH] rtc: rs5c372: Fix read the time from RTC is illegal When
 reading time from an uninitialized RTC chip, The value may be illegal
To:     qxj511mail@gmail.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        qiuxiaojin@cvte.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B45=E6=9C=8820=E6=97=A5(=E6=9C=A8) 12:32 <qxj511mail@gmail.com>:
>
> From: qiuxiaojin <qiuxiaojin@cvte.com>

Please briefly describe the patch contained in the email to the subject.
And, please write a description of the patch in the text

>
> Signed-off-by: qiuxiaojin <qiuxiaojin@cvte.com>
> ---
>  drivers/rtc/rtc-rs5c372.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 3bd6eaa0dcf6..ce61e15d5f3a 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -212,6 +212,7 @@ static int rs5c372_rtc_read_time(struct device *dev, =
struct rtc_time *tm)
>         struct rs5c372  *rs5c =3D i2c_get_clientdata(client);
>         int             status =3D rs5c_get_regs(rs5c);
>         unsigned char ctrl2 =3D rs5c->regs[RS5C_REG_CTRL2];
> +       int flags_utime =3D 0;
>
>         if (status < 0)
>                 return status;
> @@ -239,12 +240,27 @@ static int rs5c372_rtc_read_time(struct device *dev=
, struct rtc_time *tm)
>         tm->tm_wday =3D bcd2bin(rs5c->regs[RS5C372_REG_WDAY] & 0x07);
>         tm->tm_mday =3D bcd2bin(rs5c->regs[RS5C372_REG_DAY] & 0x3f);
>
> +       if (tm->tm_mday < 1) {
> +               // The value read from the register may be zero, which is=
 an illegal value

Please use C89 style commet (/* */).

> +               flags_utime =3D flags_utime + 1;

I like using ++ (flags_utime++).

> +               tm->tm_mday =3D 1;
> +       }
> +
>         /* tm->tm_mon is zero-based */
>         tm->tm_mon =3D bcd2bin(rs5c->regs[RS5C372_REG_MONTH] & 0x1f) - 1;
>
> +       if (tm->tm_mon < 0) {
> +               flags_utime =3D flags_utime + 1;
> +               tm->tm_mday =3D 0;
> +       }
> +
>         /* year is 1900 + tm->tm_year */
>         tm->tm_year =3D bcd2bin(rs5c->regs[RS5C372_REG_YEAR]) + 100;
>
> +       if (flags_utime > 0) {

{} is unnecessary.

> +               rs5c372_rtc_set_time(dev, tm);

A build error will occur because there is no declaration of
rs5c372_rtc_set_time.
Please make sure this can be compiled.

> +       }
> +
>         dev_dbg(&client->dev, "%s: tm is secs=3D%d, mins=3D%d, hours=3D%d=
, "
>                 "mday=3D%d, mon=3D%d, year=3D%d, wday=3D%d\n",
>                 __func__,
> --
> 2.29.0
>


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
