Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB3F354782
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 22:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbhDEUTf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 16:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235001AbhDEUTf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 16:19:35 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349E9C061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 13:19:28 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id c4so12775502qkg.3
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 13:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=fyLpem9APtVt//udJonhog3Br+TkqqdDVmDZqGQcwn4=;
        b=H+j+gEfnv+ZvoReIttB8y1gawODm8dofSTjvmnkB5eyu8cVWGAUiH0Cs2+71WTnSWP
         APLlk5KRy2+WRQZLLUE5UpYJLBZSzJc8pTBC48fyyS7P8vvi3pd975IbLTr9GnO3K1iy
         knEoYWQrjDsbOm//q3WpiIFegm7MsvqoQO1tj8t+FQ42RjgIFz1gCKr59Nm6j99sbgE4
         VON6luPF3ZOhCojMeC4YpppjLeMQPWHbe+UCYCfzIWR/OcPtuuWrXNelnLYuxuckbCwD
         Kkz99qWJIAs+pEBF+G2onMpkasR82zsdPyu89Sfg+2XtfwKUyR+ifTUtQD9PVWcRfEO2
         0zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=fyLpem9APtVt//udJonhog3Br+TkqqdDVmDZqGQcwn4=;
        b=I1GFrGugLUOvkP8yPWVpM34vx9zW4hpuuOsDL62PEv9d2tAXsi+Fwj8xpm4z2eWDXR
         zFeq80v7mwX8UyAoMnXJtOUXa1lE4qANM2y8eKfZ4TjCMTFERqeDktGSaXc+p6Xk5vCr
         TyiSu4+C8DCfaQm5cu7HycXFFEVv0IYwfjPZAPUy4G7FydXbarKx/bJKDRbk1mzw+Ifo
         bFsGL6e6+rtXWvkrOEJsgOgNj0cvB8t+dNuKJjKmRfFNyFjYGxSgwUSnxVlhaJkz7919
         w0csxdUMoBjEfiKC8t32RHUMq2+yRQW8ljcpuNzfb3rvJbx17bOrmghu+0foyb+vOjHV
         xffw==
X-Gm-Message-State: AOAM531XEQfwCA8aHNqu5CmmDzsT7IG1BpRh52Sh537ngJutCMO02yxY
        upECzWdLhA4SvpO4yuFX0pM=
X-Google-Smtp-Source: ABdhPJxvti+yJyyTgKR8K+ENmwhH9m2giLESKncVdh5OzC2Eggz98lnBvIVSsc5T5J1sQzsy2CcF2A==
X-Received: by 2002:a05:620a:108f:: with SMTP id g15mr26328628qkk.298.1617653967465;
        Mon, 05 Apr 2021 13:19:27 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id a19sm14355499qkl.126.2021.04.05.13.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:19:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 05 Apr 2021 16:19:25 -0400
Message-Id: <CAG2H0S68JN1.TLSX9OL8DG2R@shaak>
Cc:     <a.zummo@towertech.it>, <panfilov.artyom@gmail.com>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] rtc: ab-eoz9: make use of regmap local variable
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
 <20210405141334.3884528-2-liambeguin@gmail.com>
 <YGtKuSbNVKm9aYau@piout.net>
In-Reply-To: <YGtKuSbNVKm9aYau@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Mon Apr 5, 2021 at 1:36 PM EDT, Alexandre Belloni wrote:
> Hello,
>
> On 05/04/2021 10:13:31-0400, Liam Beguin wrote:
> > From: Liam Beguin <lvb@xiphos.com>
> >=20
> > Make use of the regmap local variable to shorten long lines.
> >=20
>
> As you are still using data->regmap in the subsequent patches, I don't
> see the point of this one. Moreover, you could have everything on one
> line without the intermediate variable.
>

I'm not particularly attached to this change. It only started because
regmap wasn't used in abeoz9_rtc_set_time. I'll drop it.

Liam

> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> >  drivers/rtc/rtc-ab-eoz9.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> > index b20d8f26dcdb..2568984fb8d3 100644
> > --- a/drivers/rtc/rtc-ab-eoz9.c
> > +++ b/drivers/rtc/rtc-ab-eoz9.c
> > @@ -124,6 +124,7 @@ static int abeoz9_reset_validity(struct regmap *reg=
map)
> >  static int abeoz9_rtc_get_time(struct device *dev, struct rtc_time *tm=
)
> >  {
> >  	struct abeoz9_rtc_data *data =3D dev_get_drvdata(dev);
> > +	struct regmap *regmap =3D data->regmap;
> >  	u8 regs[ABEOZ9_SEC_LEN];
> >  	int ret;
> > =20
> > @@ -131,9 +132,7 @@ static int abeoz9_rtc_get_time(struct device *dev, =
struct rtc_time *tm)
> >  	if (ret)
> >  		return ret;
> > =20
> > -	ret =3D regmap_bulk_read(data->regmap, ABEOZ9_REG_SEC,
> > -			       regs,
> > -			       sizeof(regs));
> > +	ret =3D regmap_bulk_read(regmap, ABEOZ9_REG_SEC, regs, sizeof(regs));
> >  	if (ret) {
> >  		dev_err(dev, "reading RTC time failed (%d)\n", ret);
> >  		return ret;
> > @@ -174,10 +173,7 @@ static int abeoz9_rtc_set_time(struct device *dev,=
 struct rtc_time *tm)
> >  	regs[ABEOZ9_REG_MONTHS - ABEOZ9_REG_SEC] =3D bin2bcd(tm->tm_mon + 1);
> >  	regs[ABEOZ9_REG_YEARS - ABEOZ9_REG_SEC] =3D bin2bcd(tm->tm_year - 100=
);
> > =20
> > -	ret =3D regmap_bulk_write(data->regmap, ABEOZ9_REG_SEC,
> > -				regs,
> > -				sizeof(regs));
> > -
> > +	ret =3D regmap_bulk_write(regmap, ABEOZ9_REG_SEC, regs, sizeof(regs))=
;
> >  	if (ret) {
> >  		dev_err(dev, "set RTC time failed (%d)\n", ret);
> >  		return ret;
> > --=20
> > 2.30.1.489.g328c10930387
> >=20
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

