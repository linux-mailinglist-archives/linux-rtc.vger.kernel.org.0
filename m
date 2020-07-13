Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063D321E2D2
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2020 00:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgGMWFs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jul 2020 18:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgGMWFs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jul 2020 18:05:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED36C061755
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jul 2020 15:05:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s9so19946197ljm.11
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jul 2020 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MrfB/pA/Fr6Xo5LXYVH5LAjhEbtvsj6IDDuB28ZiKvw=;
        b=Q6jm1Eqnds68xEvFex8jExGynudXIanqrGMXzUrm52hsyVCE27b65dgV5ABqG9Ev8V
         khXsrMN+dKGer+R1ZQcwf+Tv7wfNbkl+cnJ6M8uBG+rlzaeMjetqvu4O3Sgu94paGqpD
         f6bkwE6e6bDYGdYfZyh3OiO7Z2LskfdgMvQrMBGBaCY6JHNT35wzbpUZdgolAVSD0jWA
         pdVACE0zL+3HxgGb/g+w8uiJM1N7WpjN7uqLDhk6yFAxLnqtGkkzW4UTxqbd2+BV7V6s
         vTClrW3osPTRMKUcli7ZLDy0/518en6Ds8ZbYYI1q4DEJ0D8WvVRzXNjNkP7f8bPS3+0
         m+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MrfB/pA/Fr6Xo5LXYVH5LAjhEbtvsj6IDDuB28ZiKvw=;
        b=Y3FpT6T4oNb2UDIZ+BhKTDS04Z+lxQSWJAu4gV9tbVnqy/e6WAiJk5lP4BK3YZpJz/
         UNhc+Chpz5u6ht1yuUSTu+xTg51A73GLweWxWfZEsht1ZJgDORgSq3HNoAxBQWtJ+yfk
         uw2gia9BGG+SgfzuNz6XDyjPjuCPy+CVVygs+Hb87KycrlRr9q6akK5Cf8CjxYgjIknA
         PKEA4dtP91fyXJDYiOyT2gZmwRYAf59jiRXnGAkZ5KxAasgkoIZp1J/ksV/HZ+SgYWZ/
         wOGR104naPIK1TGSIIkq9Fz76JZtQpjR7FOXAI3g9iwuA3SuCYqpfc6brbn7aZqQwfyj
         FJvQ==
X-Gm-Message-State: AOAM530ePFETTiQsaxcvj/s23GHLWzo5TH06PWOaGjHwqX1doMz6lI05
        zbJGKgaSL/OxOlFUCcVOjr/lFu+/AbPQHhmyfinwXiJW
X-Google-Smtp-Source: ABdhPJxncUkI0jhKFHmH324O5+b5tL6H39vtRTsw3hLk37cgRNP5BL+z1JdJSm5SnoA3riPw3p60nobrH6cw8kRbV4I=
X-Received: by 2002:a2e:b175:: with SMTP id a21mr817840ljm.10.1594677946151;
 Mon, 13 Jul 2020 15:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200615105113.57770-1-kevin+linux@km6g.us> <20200713183906.GA510880@bogus>
In-Reply-To: <20200713183906.GA510880@bogus>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Mon, 13 Jul 2020 18:05:34 -0400
Message-ID: <CAE+UdorYGJrxjcBY8KtoUtpsEmWFkv4DsWtcdhCt9dcfDyCVHg@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] dt-bindings: abx80x: Add autocal-filter property
To:     Rob Herring <robh@kernel.org>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jul 13, 2020 at 2:39 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jun 15, 2020 at 06:51:11AM -0400, Kevin P. Fleming wrote:
> > Add a property to allow control of the autocalibration filter
> > capacitor.
> >
> > Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > To: linux-rtc@vger.kernel.org
> > To: devicetree@vger.kernel.org
> > ---
> > v3: corrected whitespace
> >  Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > index 2405e35a1bc0f..1b606e33d1a83 100644
> > --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > @@ -29,3 +29,11 @@ and valid to enable charging:
> >   - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
> >   - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
> >                            resistor, the other values are in kOhm.
> > +
> > +All of the devices can have a 47pf capacitor attached to increase the
> > +autocalibration accuracy of their RC oscillators. To enable or disable usage
> > +of the capacitor the following property can be defined:
> > +
> > + - "abracon,autocal-filter": should be <0> or <1>. 0 indicates that there
> > +                             is no capacitor attached, 1 indicates that there
> > +                             is a capacitor attached.
>
> What does not present mean? If you don't have a defined meaning (such
> as maintain the default/bootloader initialized setting), then make this
> boolean.

That is the intended meaning (leave the current setting unmodified). I
can add that to the documentation so it is clear.
