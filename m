Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4D435478C
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 22:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240858AbhDEUY2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 16:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240967AbhDEUY0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 16:24:26 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35074C061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 13:24:20 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id c6so9548193qtc.1
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:subject:from
         :to:cc:references:in-reply-to;
        bh=xqGHXIuicdKOHcUhhpDzlmVUBw4IWYOHUd3prmn4/cM=;
        b=tCOzDBMETIOAy2k6zjxG9CzJvoneiU2ZWUcxxwuYte592W0LwjNVXw1Eoe6DilmlyP
         lDaW7IIJPFs5DqeB3QztiEbU1nemd1xP6gmxe4qXK+Dv7oJIkaLbtFeXfr3YNwYxulJZ
         +qMGZjTwNWzPPOc3Ap6FFbn6rjvK2wPcuV+TbLXEI4AVkDkDJjITNmRc7Bv6RSpPAvIy
         d/GoyUp7GzF80rQPl1F6xwe8baDYr51c/CHxem6uL0MbncMScxWB2oJZt8DVehjdZi+5
         DZmC/N+TuNyqbDnxbJ8ZNel4/d/i/g/Bn+f0f+nlVCfvoA2twhHPLNQU7mDICc/NdBZA
         UQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:subject:from:to:cc:references:in-reply-to;
        bh=xqGHXIuicdKOHcUhhpDzlmVUBw4IWYOHUd3prmn4/cM=;
        b=Wu6bx8wvVIxgMX/m+rCnoTLYSmTqPHRUpsKBEKbjY2HaxIyHSxT5RhBp4sskadUFtw
         8QkWm+2pA47lvFbQHmoGmbLyh4SwlEkuiZiGvm6YAJdrhNAbZQRm1ReXNGumdfNPjatg
         u1DZGt6rnHwtqBNeKHo2eonDp3dpkSYE666HKxDCNr2q73vYflzMHevaFFMhvoHnsrDa
         8E8l2bmKWYr6IEhbncFRpyq2zvGqGbbeP2CR5L7rj1uN5B2iNd9hryVRuBXlf4vH3UbB
         3YavNs3P1wUC6jkfSXYmrFOyGWIR8KX9E8eu8MP51Ez3FbDP7KFpMLUSeb7E27Jm/0ne
         SNQA==
X-Gm-Message-State: AOAM532uvwENfvtpbu5UoXM6A/9Pt+ZyTCkpqQsKogxz6Xsd/kZ7o4vo
        xVH44j2DDxZLR/uqworkoMcboI8VTyeTPw==
X-Google-Smtp-Source: ABdhPJzDITJd/ylESCiYDNc52tmeX/rubNtg3Q4PX0/iLMqSqGVfFBIyS/tduyKLbD8YZMPmQRzo3Q==
X-Received: by 2002:a05:622a:493:: with SMTP id p19mr24846980qtx.131.1617654259468;
        Mon, 05 Apr 2021 13:24:19 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id d24sm14457290qkl.49.2021.04.05.13.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:24:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 05 Apr 2021 16:24:18 -0400
Message-Id: <CAG2KR46ADJJ.201VSSDMHDF4N@shaak>
Subject: Re: [PATCH v1 4/4] rtc: ab-eoz9: make use of RTC_FEATURE_ALARM
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc:     <a.zummo@towertech.it>, <panfilov.artyom@gmail.com>,
        <linux-rtc@vger.kernel.org>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
 <20210405141334.3884528-5-liambeguin@gmail.com>
 <YGtMNITMoImJkiuh@piout.net>
In-Reply-To: <YGtMNITMoImJkiuh@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Mon Apr 5, 2021 at 1:43 PM EDT, Alexandre Belloni wrote:
> On 05/04/2021 10:13:34-0400, Liam Beguin wrote:
> > From: Liam Beguin <lvb@xiphos.com>
> >=20
> > Move the alarm callbacks in rtc_ops and use RTC_FEATURE_ALARM to notify
> > the core whether alarm capabilities are available or not.
> >=20
>
> Please squash that one with the previous one.
>

I kept this separate because I'm currently working on v5.4 which doesn't
have RTC_FEATURE_ALARM. If it's okay with you I'd like to keep it like
this to make it easier to backport.

> alse, the series looks good, thanks for working on that!
>

Thanks,
Liam

> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> >  drivers/rtc/rtc-ab-eoz9.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> > index 4c8ba62fb1c6..a8256747d95d 100644
> > --- a/drivers/rtc/rtc-ab-eoz9.c
> > +++ b/drivers/rtc/rtc-ab-eoz9.c
> > @@ -368,11 +368,6 @@ static int abeoz9_rtc_setup(struct device *dev, st=
ruct device_node *node)
> >  }
> > =20
> >  static const struct rtc_class_ops rtc_ops =3D {
> > -	.read_time =3D abeoz9_rtc_get_time,
> > -	.set_time  =3D abeoz9_rtc_set_time,
> > -};
> > -
> > -static const struct rtc_class_ops rtc_alarm_ops =3D {
> >  	.read_time =3D abeoz9_rtc_get_time,
> >  	.set_time =3D abeoz9_rtc_set_time,
> >  	.read_alarm =3D abeoz9_rtc_read_alarm,
> > @@ -540,6 +535,7 @@ static int abeoz9_probe(struct i2c_client *client,
> >  	data->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> >  	data->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> >  	data->rtc->uie_unsupported =3D 1;
> > +	clear_bit(RTC_FEATURE_ALARM, data->rtc->features);
> > =20
> >  	if (client->irq > 0) {
> >  		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > @@ -554,7 +550,7 @@ static int abeoz9_probe(struct i2c_client *client,
> > =20
> >  	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source"=
)) {
> >  		ret =3D device_init_wakeup(dev, true);
> > -		data->rtc->ops =3D &rtc_alarm_ops;
> > +		set_bit(RTC_FEATURE_ALARM, data->rtc->features);
> >  	}
> > =20
> >  	ret =3D devm_rtc_register_device(data->rtc);
> > --=20
> > 2.30.1.489.g328c10930387
> >=20
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

