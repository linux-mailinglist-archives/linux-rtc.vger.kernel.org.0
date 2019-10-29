Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5DEE87BF
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Oct 2019 13:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbfJ2MIa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Oct 2019 08:08:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43359 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731291AbfJ2MI1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Oct 2019 08:08:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id n1so5901609wra.10
        for <linux-rtc@vger.kernel.org>; Tue, 29 Oct 2019 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AThmdWLvoHXRd+gCJ7Rc/MdmxHKDL94oX7/2fySCtI4=;
        b=P5lX77UJ1HJtxK6+w+SrHuDYaDtyieTnHZhqXpqYQooiSH5Kll8AXspDAhkEL4wIlw
         hBQYFRsjp/fhhGLvnGTbxW6Cyas8J5lT2DcgCgvszMF1npFF0o8wt1J4os797vV6KthD
         nch41e/zHWkALfLf1XQs2qEjEnQM6Z9jR0kMq9jvNfBVQj50Ghnb0ZLGlD58WAS85xzH
         TTGyIn5cfIa7QmPPxEX7tFIwsMjItnnJ5oIxUu8Tvlmktoq1n6/IUWv/sEjQKzxXF3B1
         rsdKdUZQNLGLRGmFYe1SoMSneOkEPEKsXkC4N3S2QAEX/dSXn/h+46Mutakba5iRRMUf
         9RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AThmdWLvoHXRd+gCJ7Rc/MdmxHKDL94oX7/2fySCtI4=;
        b=S11H9jMKOgbpMiWIf2zKdUqcQzdZr/WicwLoMC9jQFx7mZT/LqKiV9RgZDVXqDnsTw
         RQi09zEVa46/WpU/URE+ROk3Yo7qwtLviDPwPMyl3QomatU4Xp9hv1sgUhuy5Xeb9Hnm
         cUfBjbZBTUWfIQmXIVbpXSEBXViqY1mnwo0mQMYHAl+JRu+52IZDQArSavSUsB9VrhGk
         xy2rG6RiOnsMo9klhgLagizRwnUikmU15dz59deLgy2QvDU4AzHhvUhLr9Y8lvqYd5C0
         MzsOvu1rq8lnJr+msW7MjmOcO87XvvNZGIRKJS6uPYS9C2R26PK54+cOZbtEkXggU3Bj
         Gy4Q==
X-Gm-Message-State: APjAAAVVPvrh1jIb7aPSjeSXhYpNL0ZiIJ37ChPGwm1xo9MxVj7HSGxM
        gMBgaasDzpqR1pDBjWUQfaDDWg==
X-Google-Smtp-Source: APXvYqzgTN+N15xxbnf2G3a5OZaR/6UqN35YmkJy8Yi15GIpGWNYrXR0LpTtgteSgBb/D3JIn1j0jQ==
X-Received: by 2002:adf:e488:: with SMTP id i8mr19406966wrm.302.1572350903096;
        Tue, 29 Oct 2019 05:08:23 -0700 (PDT)
Received: from dell ([2.31.163.64])
        by smtp.gmail.com with ESMTPSA id g5sm2893643wmg.12.2019.10.29.05.08.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 05:08:22 -0700 (PDT)
Date:   Tue, 29 Oct 2019 12:08:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Message-ID: <20191029120820.GA4484@dell>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
 <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 25 Oct 2019, Vaittinen, Matti wrote:

> Hello Dan,
> 
> Thanks again for checking this :)
> 
> On Thu, 2019-10-24 at 14:35 -0500, Dan Murphy wrote:
> > Matti
> > 
> > On 10/24/19 6:41 AM, Matti Vaittinen wrote:
> > > ROHM BD71828 Power management IC integrates 7 buck converters, 7
> > > LDOs,
> > > a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> > > and a 32.768 kHz clock gate.
> > > 
> > > Document the dt bindings drivers are using.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > > 
> > > No changes since v1
> > > 
> > >   .../bindings/mfd/rohm,bd71828-pmic.txt        | 180
> > > ++++++++++++++++++
> > >   1 file changed, 180 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> > 
> > I will let maintainers weigh in here but if this is new this should 
> > probably be in the yaml format to avoid conversion in the future

Yes please.

> Oh... This is new to me. I guess there are reasons for this - but I
> must say I am not excited as I have never used yaml for anything. I'll
> do as you suggest and wait for what others have to say :) Thanks for
> pointing this out though.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
