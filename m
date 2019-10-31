Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EAEEACE5
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 10:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfJaJx1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 05:53:27 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38107 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbfJaJx1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 31 Oct 2019 05:53:27 -0400
Received: by mail-ot1-f65.google.com with SMTP id r14so4816144otn.5
        for <linux-rtc@vger.kernel.org>; Thu, 31 Oct 2019 02:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TMOcPgGNJCb9nGcr/aTcq6pCALpA7JCBqBtbSdHTUHs=;
        b=Zqeg5VdqFtufRNhP50eWinyi+HE9lR21e5/F+QxRSlv5UzOyfh8OPsaBshnP7RPovS
         XBYxdu1LAotawrAykogi3KOXh+HfovnV+Pk9r4wkGUulB5ivZYMtbRyTOQC95B87ph+H
         USpEbKUcIYiaTxPTvSeWV6/KbzlXNQuVWqx6LWlfExPdP/DjHY6g6nL/4Wz+vAxw8bHS
         +IgFr6JijaXT+scwNRKEqBPwRQjpotvbfEwhrZQQge55YRszx84wagMDyWkM2iy95ouN
         sTZW876dwRVR4qGlCAwar7InQNg+k11V0xUE5el4zfP3u0J5GTM0sTgt/251/wrmhDOO
         O6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TMOcPgGNJCb9nGcr/aTcq6pCALpA7JCBqBtbSdHTUHs=;
        b=Nc00t33EgxGWJ0IFVilabv+NrhCKaLbw/Uyawntlw+kubeY9HUzCF3daW3Z2kCj6UX
         1Vek/CFOneHefvDCFBGNcoG+O2x7GbMU2W5wGcbEgh1BEMvPVT4AIfdwrLJjt74Rd8UY
         NRPB/S6FxJuRIDVrYtBlMd0WSxYrnsrM0AoV0iueRiwsikaPKqMJoWiY/SWkYVnVttiG
         9C86v7ZzFPa18O4EI/xMjtND6+wmRNHFxPsqPJCY2ucSfH9o3iSmWIlZb5Hoi5fTK8Wa
         +H8dzJ3jt0/ThYS/EVjScPDbR5b+2/YXxCEzW8vjKFIU67nw6YwB7TJwuhcfDJFXVqsm
         OM1g==
X-Gm-Message-State: APjAAAWO6cUVqJUnLaROgNzdjynKK+bOC+zM6LRpAi7NXUo3tBw5DdF8
        uWZ/Y41SpB2UnHp5g2+SYLKIT6SGYIyuHrVugCEE2J7dTA==
X-Google-Smtp-Source: APXvYqyN03xXrOOhYkhliXKau/Wc84WN82HSinNHXSM9d70a3WfQSonFUl+hohMH+RPkDFlF1WwYnxKwlECRjc7RTME=
X-Received: by 2002:a9d:628c:: with SMTP id x12mr3749961otk.181.1572515606078;
 Thu, 31 Oct 2019 02:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191031073643.19410-1-ilya@compulab.co.il>
In-Reply-To: <20191031073643.19410-1-ilya@compulab.co.il>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Thu, 31 Oct 2019 18:53:00 +0900
Message-ID: <CABMQnVJ-Y4fiE3LnS=JpGHyGdf11KTf0xnmnd-5h5=zpQAx0TQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: em3027: correct month value
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

2019=E5=B9=B410=E6=9C=8831=E6=97=A5(=E6=9C=A8) 16:57 Ilya Ledvich <ilya@com=
pulab.co.il>:
>
> The RTC month value is 1-indexed, but the kernel assumes it is 0-indexed.
> This may result in the RTC not rolling over correctly.
>
> Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
> ---
>  drivers/rtc/rtc-em3027.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
> index 77cca1392253..ef3792543f93 100644
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
> +       buf[6] =3D bin2bcd(tm->tm_mon) + 1;

I think '+'1 should be set in bin2bcd().

>         buf[7] =3D bin2bcd(tm->tm_year % 100);
>
>         /* write time/date registers */
> --
> 2.20.1
>

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
