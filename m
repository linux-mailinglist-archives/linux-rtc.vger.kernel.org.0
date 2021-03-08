Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3081B330C8E
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Mar 2021 12:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhCHLjE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Mar 2021 06:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhCHLie (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Mar 2021 06:38:34 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF135C06174A
        for <linux-rtc@vger.kernel.org>; Mon,  8 Mar 2021 03:38:33 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id d9so9837208ybq.1
        for <linux-rtc@vger.kernel.org>; Mon, 08 Mar 2021 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x2KLFCEZSoKgh7SxPZ8izKkuGHzt3rmjVc2tIg8ni5A=;
        b=S29pNbJeTMal1TC0z7pbcqq39rISGtPbmxT7+9M1C8G3d5jcGG1+Ju+Ofnqh1hRRzi
         e1Cs05yvDffe7D4mv06CIMaa2m2UYRITzkFXUc53D2R1VTakfRF58FtW0QFus77Rm6+r
         tfLzz+C3vpTvcFeJNe0ATdQPwo84xdfZ1D4+dMwXJkESHDGcPxh2RpA2RAJZ/iXaNg2a
         NWQprPCmvgC/o84piBoF2SY9vC268IzA/jaNWTh/oMuwEv25LG5saWRmhrMsqXns8+lp
         ZldDryiN7xUaEULcv6ataQWnsXRy8s3nK5xb5RzFwdKxHSElPiU/vHgYlGK2+7B1T1nq
         iZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x2KLFCEZSoKgh7SxPZ8izKkuGHzt3rmjVc2tIg8ni5A=;
        b=rSzmKhFm4O0Ub2anXh3Mv1t3/sen0pfhvXyz1c/QAvM6WSU9T1jD/3oh6SyeqMdkRf
         FE/P/wNahpSBsSrpCqvZKptNLnTGWd+93wgqsCIjiOeeJtPQHKMe2VD1clA+cXIvY2po
         Xdly0XZfXRIuRuZfCoUqF37qYAebJmzuTQldaog/CF4VnHVUTEW71W+FZDaSx3qSwFNB
         0y8BJxZTXWBTeBgnzbk8Zrr6ZUCVcg0UTpusNFK1pFH1f1UxBKvYaao2vIIilIGpWBDn
         M67gHVPbLsevNUkzt7h/6ZbxFxxIDBJFGUfP/tActBTpRWYZo2IDM+qLX/1yfcbWhTXH
         JOFg==
X-Gm-Message-State: AOAM530TGPaJd1vvdD/T9dH9vomlMeeBrdcgVtGSO0yMXsl3WLOR+jvK
        2bmKzfITqTbAtg1gIykb+5CzB/aSm4ahCRasNtw=
X-Google-Smtp-Source: ABdhPJx8hKhUafKBrZ5epWRcrY79QGfTqbYhs0hRs1L55WG7xg8BKssA2PuvQeYkJa1nN6dHRK77I+k/GoiFoQjnk4E=
X-Received: by 2002:a25:c603:: with SMTP id k3mr33592215ybf.196.1615203513111;
 Mon, 08 Mar 2021 03:38:33 -0800 (PST)
MIME-Version: 1.0
References: <2324307.0LpMOBvr9T@tool> <20210112224420.GL3654@piout.net>
In-Reply-To: <20210112224420.GL3654@piout.net>
From:   =?UTF-8?Q?Daniel_Gonz=C3=A1lez_Cabanelas?= <dgcbueu@gmail.com>
Date:   Mon, 8 Mar 2021 12:38:22 +0100
Message-ID: <CABwr4_v6TzHGDimY5NNJo8=_fmgntJwC4yXu4FVr+Big_4QwyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtc: rs5c372: let the alarm to be used as wakeup source
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

El mar, 12 ene 2021 a las 23:44, Alexandre Belloni
(<alexandre.belloni@bootlin.com>) escribi=C3=B3:
>
> On 23/11/2020 11:38:48+0100, Daniel Gonz=C3=A1lez Cabanelas wrote:
> > Currently there is no use for the interrupts on the rs5c372 RTC and the
> > wakealarm isn't enabled. There are some devices like NAS which use this
> > RTC to wake up from the power off state when the INTR pin is activated =
by
> > the alarm clock.
> >
> > Enable the alarm and let to be used as a wakeup source. Tested on a Buf=
falo
> > LS421DE NAS.
> >
> > Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
> > ---
> >  drivers/rtc/rtc-rs5c372.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> > index 94b778c6e..76775d66e 100644
> > --- a/drivers/rtc/rtc-rs5c372.c
> > +++ b/drivers/rtc/rtc-rs5c372.c
> > @@ -654,6 +654,7 @@ static int rs5c372_probe(struct i2c_client *client,
> >       int err =3D 0;
> >       int smbus_mode =3D 0;
> >       struct rs5c372 *rs5c372;
> > +     bool rs5c372_can_wakeup_device =3D false;
> >
> >       dev_dbg(&client->dev, "%s\n", __func__);
> >
> > @@ -689,6 +690,12 @@ static int rs5c372_probe(struct i2c_client *client=
,
> >       else
> >               rs5c372->type =3D id->driver_data;
> >
> > +#ifdef CONFIG_OF
>
> I don't think you need to protect this section
>
> > +     if(of_property_read_bool(client->dev.of_node,
>
> but you'll have to check client->dev.of_node is not null.
>
> > +                                           "wakeup-source"))
> > +             rs5c372_can_wakeup_device =3D true;
> > +#endif
> > +
> >       /* we read registers 0x0f then 0x00-0x0f; skip the first one */
> >       rs5c372->regs =3D &rs5c372->buf[1];
> >       rs5c372->smbus =3D smbus_mode;
> > @@ -722,6 +729,8 @@ static int rs5c372_probe(struct i2c_client *client,
> >               goto exit;
> >       }
> >
> > +     rs5c372->has_irq =3D 1;
> > +
> This is an unrelated change but is this actually useful? I guess you
> should simply remove has_irq.
>
> >       /* if the oscillator lost power and no other software (like
> >        * the bootloader) set it up, do it here.
> >        *
> > @@ -748,6 +757,10 @@ static int rs5c372_probe(struct i2c_client *client=
,
> >                       );
> >
> >       /* REVISIT use client->irq to register alarm irq ... */
> > +     if (rs5c372_can_wakeup_device) {
> > +             device_init_wakeup(&client->dev, true);
> > +     }
> > +
> >       rs5c372->rtc =3D devm_rtc_device_register(&client->dev,
> >                                       rs5c372_driver.driver.name,
> >                                       &rs5c372_rtc_ops, THIS_MODULE);
> > @@ -761,6 +774,9 @@ static int rs5c372_probe(struct i2c_client *client,
> >       if (err)
> >               goto exit;
> >
> > +     /* the rs5c372 alarm only supports a minute accuracy */
> > +     rs5c372->rtc->uie_unsupported =3D 1;
> > +
>
> Honestly, the whole driver would need some modernization so if you have
> time to test, I can propose a set of patches.
>
Of course I can test them. I'll reply with ACK once tested.

Regards
Daniel

>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
