Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01880623F98
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Nov 2022 11:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiKJKPj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Nov 2022 05:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiKJKPi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Nov 2022 05:15:38 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F7D65E74
        for <linux-rtc@vger.kernel.org>; Thu, 10 Nov 2022 02:15:36 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so3758065ejc.4
        for <linux-rtc@vger.kernel.org>; Thu, 10 Nov 2022 02:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8Cf67Csj4VD7OjeDad04YWXxh2H8/Tism91fe0AaI4=;
        b=fOBQm/pV8/DGgVvHGlPfc1mJ29brRXVHnGHjUjMWlUg2UzidttxHcpiMJ2HE6NjkzA
         Jrdfoie3b2P8WvxJdwOaXX9+SSbmrVjx9KbOBBHrgtmsO4Xxy4oV7yfgzpF4+H9ez4Ch
         /ZxTqmghUoeMwGNdNuCkRgQ8sY7o8FiURl635xYRjy7NSY1d94FTxU5+67rlS7KvRcr6
         Khy8R35UWeqn3W+rJOvfmIsRxnj5UO9YF+NpibEaOukUgfG51JSphray/tPYJBpZ61G9
         T6E2IXXuYZS3BfL7Gtu3xh5kCxrdojb+VHgj9Xej52p4dpEyadkIvlcmKl0PxjU+UPMD
         56rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8Cf67Csj4VD7OjeDad04YWXxh2H8/Tism91fe0AaI4=;
        b=n7ojcUVnnPaARrC322vP2KuQYmZPyKxcQRzfhd2QFpSjj5D0nIyAkKX/MW474gNzAK
         5jeP3YQe1FclE2b5oaaHJ+odRyreM3D/T3TP2agGC4Eq2KfjTsAQuay7EZdXpngs+bT9
         ydVsIanIamsb6/limoh3TCNnjnDZJrz3NGPLYcdLis98xO1VJe0MZe1Kn/jws2t6iLCI
         JUcBBruBnyI7ojjF6TNQn1Q5wQVUXUh786FJe1IUGS9MrVIGnlwFUDSjW7iL5S5Z9h1P
         lxqyQamc2JP1Bf4H1S8UK1OnnP8TiOSq3EuL3KN6dkIZXrU7H5hIuUuM4wDReLOmhH59
         giSg==
X-Gm-Message-State: ACrzQf1/7i5EgW0Q2oUPtVASHrAoLGy7cN3Dz/tfhACsNt2AgS97ZfRO
        rtU9a4HrkGDyCDPY7Jp3ef97CIS2USfESCKLmywi+g==
X-Google-Smtp-Source: AMsMyM4D0d+Hokf7UrAn5sIPHLSXdHQLYX9QQgnGs4iKs4ZA+COquSO+v27PLn+KIJj7g+TgvuEl9Xa1sTphUe/n8Q8=
X-Received: by 2002:a17:906:3394:b0:78e:11ea:8528 with SMTP id
 v20-20020a170906339400b0078e11ea8528mr2559173eja.190.1668075334783; Thu, 10
 Nov 2022 02:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20221109065546.24912-1-mranostay@ti.com> <20221109065546.24912-5-mranostay@ti.com>
 <CACRpkdaTV6unVsfNj+M39jLn5FLTnhryjuzF4EB6Ytds9R1nEQ@mail.gmail.com> <Y2zOhf8lqVLyLn+A@ubuntu>
In-Reply-To: <Y2zOhf8lqVLyLn+A@ubuntu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 11:15:22 +0100
Message-ID: <CACRpkdZOR4Hcyv=bO7=rJERJK7JbCoS0_dvWj0K=YZC6Nsozdw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
To:     Matt Ranostay <mranostay@ti.com>, Michael Walle <michael@walle.cc>
Cc:     brgl@bgdev.pl, lee@kernel.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        vigneshr@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Keerthy <j-keerthy@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 10, 2022 at 11:12 AM Matt Ranostay <mranostay@ti.com> wrote:
> On Wed, Nov 09, 2022 at 10:59:08AM +0100, Linus Walleij wrote:
> > On Wed, Nov 9, 2022 at 7:56 AM Matt Ranostay <mranostay@ti.com> wrote:
> >
> > > Add support for TPS6594X PMICs GPIO interface that has 11 that can be
> > > configured as input or outputs.
> > >
> > > Tested-by: Keerthy <j-keerthy@ti.com>
> > > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> >
> > (...)
> > > +config GPIO_TPS6594X
> > > +       tristate "TI TPS6594X GPIO driver"
> > > +       depends on MFD_TPS6594X
> > > +       help
> > > +         Select this option to enable GPIO driver for the TPS6954X
> > > +         PMIC chip family. There are 11 GPIOs that can be configured.
> >
> > select GPIO_REGMAP
> >
> > This driver is an archetypical example of a driver that can make great
> > use of GPIO_REGMAP helpers, so rewrite it to use them.
> > Look in drivers/gpio/gpio-sl28cpld.c for an example.
>
> Linus,
>
> Those helpers look great for this usecase on the surface but however I think there could be some issues.
> For GPIO direction it isn't configured by a bitmap on a register(s) but by a bit on a range of
> registers (with a register for each GPIOx).
>
> For set/get values the gpio helper would work though.

Isn't is possible to just use parts of the GPIO_REGMAP
helpers? I thought it's designed like such.

Michael Walle will know what to do with your usecase, and
whether to use it or not, let's page him!

Yours,
Linus Walleij
