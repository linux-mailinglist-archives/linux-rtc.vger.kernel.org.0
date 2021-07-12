Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104BB3C403C
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jul 2021 02:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhGLAFx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 11 Jul 2021 20:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhGLAFx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 11 Jul 2021 20:05:53 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20472C0613DD
        for <linux-rtc@vger.kernel.org>; Sun, 11 Jul 2021 17:03:06 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id w13so4395415vsa.3
        for <linux-rtc@vger.kernel.org>; Sun, 11 Jul 2021 17:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k1+A7QcokWdPNl2M1r52ewHwT7LYjcRk65lo+mWhFnY=;
        b=md8aiR8HKvNkFp+5k0RYao/RYfhmbAQooL535E6rA1GS0eCtls+Xl1dmep5lAQosKh
         49XSxAckn4oXHGQEj1Ncer5NYD9BGSh10/KgfIVln+xJHdopb8gJdCWNYdxt8Geryo+x
         4pGOf3tJqpgDWuUG+B74GnPg6wQjt811/FDJ4Nrs5Xiewp5fRVM8mmVGjTqj5A8H5hRq
         oJv8LZcchBU5epKasgyMXODsrK++YWJN675SBhWxZY2hqDIdPvvXNuKvyS7+FLBVRfgD
         Ld6TQ5TzhTblkx5hmk+hcIs+BJCRNT2r3L1keAWLQeIh1rV6F7m5DIuMZnqOAoUBNn0P
         hKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k1+A7QcokWdPNl2M1r52ewHwT7LYjcRk65lo+mWhFnY=;
        b=XGPQarvEoddEcr4NmTcxlDc8G5JzqaHA35b98S695PMGDv91XiCcgj7cdPAKzR4t4N
         ZMCpPXbMEU5ETm/bZQNJA023zCVhxNRiF3oMEnF2Gci+7L2GZzV7kOExwBm3TWRoqOVr
         Zmy+AuAibGPgGFLGi0TiqQH22t3MCOv+AEJKZxWGgDdFZ1/vCXW3WFy5njRadqmRvYa/
         Kx0UGJlydlj2NLmQpBQgu4fUzhskLHhA3yBdH133H/zwBkELTwIPjyM8mefqhyTiM8h9
         on5kjjgq4Sxwy/2UZeWw0y47wu+5o+Wq/Cnv1mcCRqLDi3ZKsCef2FnXbeGEsP5e07up
         Br/w==
X-Gm-Message-State: AOAM532wOKaH0/3bqtHOfsh0p8IqAaTYdciJED/NV39ZAEUYA3cCXvC9
        u0LG8NvGgYu3xVME7L3cNCzCvXIJ08AhhUIOp4T8Kz2yImhw
X-Google-Smtp-Source: ABdhPJxANIsr4SOpdxnprb0mqLLonVDY6CQ0YruScAGFr0HZPF0Vf/yNL8cJmSzWAYg6KwaR4bXie2IvjN+PFCcRB7s=
X-Received: by 2002:a05:6102:3089:: with SMTP id l9mr13148901vsb.2.1626048185107;
 Sun, 11 Jul 2021 17:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210707071616.28976-1-matt@traverse.com.au> <20210707071616.28976-3-matt@traverse.com.au>
 <CABMQnVL379GkR_s5c91a0LAPMemup_Lq8U+qU9M1-kBWfVqmTw@mail.gmail.com>
 <YOYiDlQM/xfgb0CH@piout.net> <CABMQnV+zxURp2K3aXjH3cobndoAXjTdb4xB4w+mMJmjnwyPyLg@mail.gmail.com>
 <YOjsm9wujqczPIKw@piout.net>
In-Reply-To: <YOjsm9wujqczPIKw@piout.net>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Mon, 12 Jul 2021 09:02:38 +0900
Message-ID: <CABMQnVLMeDTNgDmuNKxbBYA4B4n0krzq5WQ8Lh4RKhVN_tPTJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: rtc: add Epson RX-8025 and RX-8035
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Mathew McBride <matt@traverse.com.au>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B47=E6=9C=8810=E6=97=A5(=E5=9C=9F) 9:41 Alexandre Belloni <alexa=
ndre.belloni@bootlin.com>:
>
> Hello,
>
> On 09/07/2021 16:19:49+0900, Nobuhiro Iwamatsu wrote:
> > Hi,
> >
> > 2021=E5=B9=B47=E6=9C=888=E6=97=A5(=E6=9C=A8) 6:52 Alexandre Belloni <al=
exandre.belloni@bootlin.com>:
> > >
> > > On 08/07/2021 06:46:31+0900, Nobuhiro Iwamatsu wrote:
> > > > Hi,
> > > >
> > > > 2021=E5=B9=B47=E6=9C=887=E6=97=A5(=E6=B0=B4) 16:17 Mathew McBride <=
matt@traverse.com.au>:
> > > > >
> > > > > These are supported by the rtc-rx8025 module. RX-8025
> > > > > also has support in ds1307 due to compatible time registers.
> > > > >
> > > > > Signed-off-by: Mathew McBride <matt@traverse.com.au>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > > > index 7548d8714871..13925bb78ec7 100644
> > > > > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > > > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > > > @@ -32,6 +32,9 @@ properties:
> > > > >        - dallas,ds3232
> > > > >        # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> > > > >        - epson,rx8010
> > > > > +      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> > > > > +      - epson,rx8025
> > > > > +      - epson,rx8035
> > > >
> > > > 'epson,rx8035' is unnsecessary.
> > > > This lists compatible string, so we don't list compatible that does=
n't exist.
> > > >
> > >
> > > Well, the previous patch adds it.
> > >
> >
> > I couldn't find anything to add "epson,rx8035" as device tree compatibl=
e in
> > previous patch(rtc: rx8025: implement RX-8035 support)....
> > I think that i2c_device_id was added and it is not device tree compatib=
le.
> > Can you tell me if my understanding is wrong?
>
> Having "rx8035" in the struct i2c_device_id array is enough to have the
> driver probed using DT. IIRC, it is a side effect of
> i2c_of_match_device_sysfs()

I understood. Thanks for the explanation.

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
