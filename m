Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86ACA3FCFE1
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Sep 2021 01:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhHaXVx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Aug 2021 19:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbhHaXVw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Aug 2021 19:21:52 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53D8C061760
        for <linux-rtc@vger.kernel.org>; Tue, 31 Aug 2021 16:20:56 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id f6so980463vsr.3
        for <linux-rtc@vger.kernel.org>; Tue, 31 Aug 2021 16:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=56XifCKgxrUxLiJUbCKUiFlHgQ9pDbcBP5TMGk4TDdo=;
        b=X0lAVv2UDDRd8A5r13alihSlMnClBrPx/mUZB3NK7iyxNvWVxKgIhGYprFb6yzFp51
         QTCGrlfNpWTEI/VGH+bFqS5mtipJpYjlmGD5VigaYtveua0ZauKXCa+eD0XCoosKqZVH
         OQ1wfQb5rp3YuyIWdkweTT56Whc+JmZ6haVkzBE0Ix0EklxTE0auhl3ye6KsGbUZ0vUp
         UIst9ltS/v53lUU2Keyo36W/x4mMtUoYHKY0CCbVPQdiH4ktBlU20Zcxf+9Trvzth5br
         BJ+hl+963qpwpVs0ijDO67n5exAvKPXZTyxeyQDL3fSc98wtgdtrj6EfzUxnbE0ZRRb+
         SCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=56XifCKgxrUxLiJUbCKUiFlHgQ9pDbcBP5TMGk4TDdo=;
        b=RV6rEyV+623CSL8KJhCNMsNkhKrbuHx/3llgMKpkbVpBv2zZjZAcNr9lp4E+9cdMk8
         bq3Qnsn/lAEqY1LKpeLvd8aac8eFmsey0JNW325cnP4E2/PBmoBr7iv0vvGWVams+SqK
         p5U5h3VlC5yrFxMDA7XDy3mFighAmtBD0Fluy1e24wzsczjnl4K8dL9F3vgZ1Lm2w5Sd
         /IJkjmkU5YfRbFfzw3K+kDOrcxkE0H10Lz9tBuIV3TiWygABP6ejtnXjxKv4nyj8S1Wx
         2XeJLZ4e0s8jMnGVmYP4gZ5XCvoMbcea1dPIeK1RlzjnUMPSWY/WGm3DkqbtdqT34YON
         m1bg==
X-Gm-Message-State: AOAM530RoV8OrnRU+h20kFpn6M9kbTjKPKyUANTuQK1xOaSeT5R8zsVw
        mJcEHfWE7YZEkvCadDvjMcf9nCtS2+lQIis09EZt
X-Google-Smtp-Source: ABdhPJzllLuwaMhzlP2WwI4uD+G/uG2T2braNDz1vNFcBkzboe08Ao9SEwjjXOnsMXxQah1Fc3ar/sMaiuRaXK/7i3w=
X-Received: by 2002:a05:6102:3f4f:: with SMTP id l15mr20528522vsv.33.1630452055806;
 Tue, 31 Aug 2021 16:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210830172541.62588-1-mat.jonczyk@o2.pl>
In-Reply-To: <20210830172541.62588-1-mat.jonczyk@o2.pl>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Wed, 1 Sep 2021 08:20:28 +0900
Message-ID: <CABMQnV+u5itWWCty8BaD8wxEO9FNnUHiXiJw_CmZPgXgh3Qt_A@mail.gmail.com>
Subject: Re: [PATCH] rtc-cmos: take rtc_lock while accessing CMOS
To:     =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B48=E6=9C=8831=E6=97=A5(=E7=81=AB) 2:26 Mateusz Jo=C5=84czyk <ma=
t.jonczyk@o2.pl>:
>
> Reading from the CMOS involves writing to the index register and then
> reading from the data register. Therefore access to the CMOS has to be
> serialized with a spinlock. An invocation in cmos_set_alarm was not
> serialized with rtc_lock, fix this.
>
> Use spin_lock_irq() like the rest of the function.
>
> Nothing in kernel modifies the RTC_DM_BINARY bit, so use a separate pair
> of spin_lock_irq() / spin_unlock_irq() before doing the math.
>
> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/rtc/rtc-cmos.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro

>
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 0fa66d1039b9..e6ff0fb7591b 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -463,7 +463,10 @@ static int cmos_set_alarm(struct device *dev, struct=
 rtc_wkalrm *t)
>         min =3D t->time.tm_min;
>         sec =3D t->time.tm_sec;
>
> +       spin_lock_irq(&rtc_lock);
>         rtc_control =3D CMOS_READ(RTC_CONTROL);
> +       spin_unlock_irq(&rtc_lock);
> +
>         if (!(rtc_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
>                 /* Writing 0xff means "don't care" or "match all".  */
>                 mon =3D (mon <=3D 12) ? bin2bcd(mon) : 0xff;
> --
> 2.25.1
>


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
