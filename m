Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B971F5828
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 17:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgFJPtJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 11:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgFJPtJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 11:49:09 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B64FC03E96B
        for <linux-rtc@vger.kernel.org>; Wed, 10 Jun 2020 08:49:09 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id cv17so1210606qvb.13
        for <linux-rtc@vger.kernel.org>; Wed, 10 Jun 2020 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:in-reply-to:date:cc:subject:from:to
         :message-id;
        bh=Wc6Tz3t2bpowcHbd4VtZOskYMSPEof/nzDyJE/mVgII=;
        b=Tgj7qBGAd+s/Vdh6b4kXqtDWZfuNyBcHJ15DpS2W4ixKFVNdcr3Kui/V8iRmiLKcwZ
         VLnC/rTgJlMu802HJUCH7Sdot1yT93jQ24vrkEgLlfcp3CkfumQBNi++bhrTrsh84dce
         yKDXVavC8E9Gts2RFXv2nnNw0Gkt7f222Uy3kH7l7us3oKZ0x8GfqjsZaFL3dPcPaXld
         qqcYDnM0rhCOruJP9Dm+wAXfsxoaOzIdAvbJGNkJrfazAIyicfCdG9VNa7SobCxRvkQl
         GdfPetnWB2puZ8WW3y7SF3g732zxp2+bw7pMKwRHtvOt+TcAkKUwTorc9l/lvUh+DeeE
         C3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:cc
         :subject:from:to:message-id;
        bh=Wc6Tz3t2bpowcHbd4VtZOskYMSPEof/nzDyJE/mVgII=;
        b=EryxAduJCwtq0kDh3HPjuwve72m3FfP7ZyCjofjt+X97MkZhpSYOX/RXxxFidx3V76
         5y8plfMhTh1j7rKP9j1micespj1pBaSKl7SsEyADkIvzp27xb1YsbM7iaJ8+7ti4erb6
         nvV3mcEggeZPMG2ymWTx9ZhJeGVBOwbEBefweoRqRS8HPW0Q7ti938qwQ+dWomm1L8cl
         ibNR0leKZ6ERNNwKIcBQbVgkd/9xvVgqT398TOfaJCzJCFCr1vsVeYGgqjNN+1qRATqH
         sxH/ZJeyH9DfCg/QKMVoENTzUwCPXd0pG9RF71vtnMOLwjCD1/+4jIP2LdNNCkUJdokd
         IZWw==
X-Gm-Message-State: AOAM531mrJwO2sI+K/dnRnOsg+hDjKEqdRg1lWySkWGUdC3g2pM0+1hD
        96choBienk4PT3UFSQBt8YBnhr6M
X-Google-Smtp-Source: ABdhPJwtfvIou8bP31VG95c4vSw4ircvvPhMYLHoFZFrmaO0Y5q6fobIbVj3ayuweasR1k8gM6xk/g==
X-Received: by 2002:a05:6214:17cb:: with SMTP id cu11mr3710918qvb.202.1591804148491;
        Wed, 10 Jun 2020 08:49:08 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id m53sm250582qtb.64.2020.06.10.08.49.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 08:49:07 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20200609210549.GU3720@piout.net>
Date:   Wed, 10 Jun 2020 11:49:06 -0400
Cc:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 2/3] rtc: pcf2127: add alarm support
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Message-Id: <C3DJH5QYGX12.2IGEWO7P3BZKU@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue Jun 9, 2020 at 11:05 PM Alexandre Belloni wrote:
> On 07/06/2020 13:06:09-0400, liambeguin@gmail.com wrote:
> >  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> > @@ -434,6 +546,8 @@ static int pcf2127_probe(struct device *dev, struct=
 regmap *regmap,
> > =20
> >  	pcf2127->rtc->ops =3D &pcf2127_rtc_ops;
> > =20
> > +	device_init_wakeup(dev, true);
> > +
>=20
> This can't be done unconditionally, You need to have been able to
> request an interrupt or the wakeup-source property needs to be present.
>=20
> The interrupt handler is also missing from the patch.

Like I tried to explain in the cover letter, the interrupt line isn't
connected to the CPU on the board I'm using.
I'd be glad to add the interrupt handler to this patch. Is there a way I
can make it conditional?
Thanks,

Liam

>=20
>=20
> --=20
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
