Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB9A9F00B9
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2019 16:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731110AbfKEPFV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Nov 2019 10:05:21 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39915 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731111AbfKEPFV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Nov 2019 10:05:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id y3so22250284ljj.6
        for <linux-rtc@vger.kernel.org>; Tue, 05 Nov 2019 07:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tavTtm1Xo4MtMh/aOcywS9fElRJcgy1KkS7iJZf+I0o=;
        b=Kpd/leYtPpqiEDbCJj18CuAu27YXg/BuaSVf6IXKy+NrpoBVTZePZog5GdYjJO9OIi
         lm4PNz+RaMr2Nrhy8ku0aUXAC05hBbP1JME/FecqDMlBqkYlECiTGsIez1dWe0BBadLu
         LIVKVjgIW0dw84EB2IjEb0twsx3ASPulZkaAWUIj7h8A2FrFsvuaKTSpTx53DmZ3nq1U
         QNl8wl6y+nYyPwwlsv+q+D2D2+kZtdPPBtrFK7uj0fyltIejYU1J9AlQptT6e9xIT+GN
         cLdhsevHXm//qojXfBav6e4dmTJYwtN6Khfo7QLgxUZWvK7zFuFqhWgAr3N+IqYgTJYh
         VR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tavTtm1Xo4MtMh/aOcywS9fElRJcgy1KkS7iJZf+I0o=;
        b=dcju5WtdX3Dj9655qU5SPvg7ofSv+meewJUt2Br8no2427i6p1CXH0WWn3aGD+UF1P
         tDNcaWO6ovV2W6Er7rjepTbbCnTO46bNh7QLBvcNPHNE6aP0nqHavqD5STF7zLWLiVZQ
         Dbv6BjHpRZFDnREah554IYJro3hkrP6V/8wFtd49SmgbzFvD/wuCgblCb8P/qIBiIXbe
         KnrQeMLq0zwSL3StJF78vYE3QPHq5j+6RM0hot85GutvTqDF5QRAbDFuCBjqKetualox
         UE5fYgMpLZzbO7G15STPHCavQmW8Maz7pO0vgs+YQcWNoX53bCPLP1aTIlJIPzyS7nBG
         UTNg==
X-Gm-Message-State: APjAAAUYKk/Uhf43q4bSwYySksDZbEGKGmhyr0KWkxFUr8GLM/jOOBer
        qyrdF7Gdfqe2o+6Xp+WHlHp1/G/vPd/lxF0uSAs+Ow==
X-Google-Smtp-Source: APXvYqzg3Toe5ibsBNy4vSKkIj+jEh4yXX7QFUnejT5ioVLHdggVbJujZP6cuxOj2IbLJbzwc/uzWBBvO38pMmBvRbs=
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr23543161lja.218.1572966318371;
 Tue, 05 Nov 2019 07:05:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <f08d265c12ebf185c0e1dbbfe0a3f86de4907194.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdYhasTEQq2btQ_3GSo=hMJetp128jFo-6hE=JMeX4MJSA@mail.gmail.com> <411ac5e107cd2a6c628d1fb46e7d284c8f594768.camel@fi.rohmeurope.com>
In-Reply-To: <411ac5e107cd2a6c628d1fb46e7d284c8f594768.camel@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 16:05:05 +0100
Message-ID: <CACRpkdaRt3Du4y_Yhv39d7KoQ=hOkPR-RqXYjPukxb7JG_yymQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 14/15] gpio: Add definition for GPIO direction
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Nov 4, 2019 at 4:48 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:

> > Good initiative (and I will see a ton of janitorial patches as a
> > result of this...)
>
> I have somewhere near 62 patches waiting to be sent =) They're pretty
> small but I'd appreciate thorough review as they're mostly untested...
> Do you mind receiving them all in one go? Or do you think I should send
> the series in smaller chuncks?

I would be fine with one patch introducing the defines and then
one big patch switching everybody and their dog over to using
these definitions.

I usually keep to a patch being "one technical step" and it is
clearly (IMO) one step to introduce the defines and one step
to make use of it in all legacy drivers.

It's late in the kernel cycle but this particular part (the defines
and switching over old driver to use it) I'd be happy
to merge for v5.5.

Yours,
Linus Walleij
