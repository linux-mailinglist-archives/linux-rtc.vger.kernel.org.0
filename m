Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3D6E31B1
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2019 14:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409279AbfJXL75 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Oct 2019 07:59:57 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37374 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404892AbfJXL74 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Oct 2019 07:59:56 -0400
Received: by mail-ua1-f66.google.com with SMTP id l38so172192uad.4
        for <linux-rtc@vger.kernel.org>; Thu, 24 Oct 2019 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HQknb1r4LbQcuicy72xSu/tgsIIaO3/jaqndS1RuQsc=;
        b=VFJf8rPVcfBhCVGRiyWkFLZVnbUFpTifhzTj5iKAGigKUYb2mx6ocPrzDzt6IJChrs
         oOOO15Q/mhQIUzQPhtxvo0TNjytFVHYbU7kRUIRJ9vEQB3hX1ULsEXYVSfyrc3EpN7hf
         Cw1B4hyYPGiCX+Bqb+qgxl3inKrOU8PJRNFNQSNXyp/nBjSq0ew9NnWXz5IocrCkXRwB
         hA4KZF1HTMR2ym6jT85fQiHJ5AgYmgXz7ELPcVkznCESu75Xrol0sfEGsse5mdY1+LaR
         MHx7VEOcg9hUEPRqPuC7CXOjt/MOtoiaAjdLsFOHYcr33rEJl1usNxI1z5roeADziwwk
         dH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HQknb1r4LbQcuicy72xSu/tgsIIaO3/jaqndS1RuQsc=;
        b=JM+RpNATFqmLXYnlNfM0pJuCf6jANE0KVJ1Rv3W6OhWMXLFUZmQ02cWkmsAECyezMi
         Jn8WqxluuF9kVsmA55foZfSOy596rIQ2pKKPh7xIeG3ffSFzHoHkc/cJemmhvIKqz71P
         MabckQyuEq9wzQzbYT50JzYp0H5Fz13kACI/baki5AN2YcpqsJ+zzPquDvO6wlAeXITx
         U65xJP0gQCo8oOxAhZF9V8JBm1yZrwaM4X7B/8ZAwj0g8X6OxWLWrXnqGzzWoSrAhrKG
         00gGjuscPKKGMEuIUHkO5WQr8qDR209MBs0v6dnFKvEbZq66aU6Bs5HgUib7WoVZDTvl
         SSuA==
X-Gm-Message-State: APjAAAVC99T9u1qt6BV3a+1MUrnHft0jQaV2BCXRckOxm42/Pin3Z8Oy
        ei9evnuxl7MhitzteXSEdTDTEHZET/Z7QAuaXS6mhA==
X-Google-Smtp-Source: APXvYqx8rjUk6KPqTIkjXHT1x3MUAIDpq7Im00SmJqvx96HxmfrRAzRMzoQEKZ+wnRhBT8VyGXo59Y1YR0OaexZHsWY=
X-Received: by 2002:ab0:7043:: with SMTP id v3mr8397635ual.84.1571918395846;
 Thu, 24 Oct 2019 04:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com> <9b53139b7043572b3846a214694dbf8fe1f56f50.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <9b53139b7043572b3846a214694dbf8fe1f56f50.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Oct 2019 13:59:44 +0200
Message-ID: <CACRpkdZ5CC4mtNYrurx_2M_3BN6Tu7rQ=d4-y-HOsDbRteKjjA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Matti,

Thanks for your patch!

On Thu, Oct 24, 2019 at 1:51 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> to be used for general purposes. First 3 can be used as outputs
> and 4.th pin can be used as input. Allow them to be controlled
> via GPIO framework.
>
> The driver assumes all of the pins are configured as GPIOs and
> trusts that the reserved pins in other OTP configurations are
> excluded from control using "gpio-reserved-ranges" device tree
> property (or left untouched by GPIO users).
>
> Typical use for 4.th pin (input) is to use it as HALL sensor
> input so that this pin state is toggled when HALL sensor detects
> LID position change (from close to open or open to close). PMIC
> HW implements some extra logic which allows PMIC to power-up the
> system when this pin is toggled. Please see the data sheet for
> details of GPIO options which can be selcted by OTP settings.

spelling of selected

> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Overall looks very good.

> +// SPDX-License-Identifier: GPL-2.0

I think they want you to use GPL-2.0-only these days.

> +#define BD71828_OUT 0
> +#define BD71828_IN 1

These have nothing to do with BD71828, just skip these defines
and hardcode 0/1 in the code called from gpiolib. If we want defines
for this they should be generically named and put in
<linux/gpio/driver.h>

Nice use of the config API!

Yours,
Linus Walleij
