Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BB8706B70
	for <lists+linux-rtc@lfdr.de>; Wed, 17 May 2023 16:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjEQOnV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 May 2023 10:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbjEQOnU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 May 2023 10:43:20 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA48C2D76
        for <linux-rtc@vger.kernel.org>; Wed, 17 May 2023 07:43:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30781184e78so71142f8f.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 May 2023 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684334583; x=1686926583;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4SNOGQNiXUm9Rm9DfrimxqrzH0Clgmb4qexx/tZZaE=;
        b=MzulslZ5umnE2BE9tC3QxO+hO8k2i4NUqTMTr9GSakhsiJ2Z5Z+RQJENFLTSRzIs3w
         0VmAwtKZz3gNf2RVLYLK6MOaBfD3Yvd0lbCw0oPhSMN8HA4SprmF+Wrh13UjGxHaF4g+
         XCKfYITyAWa/6E6yI38uDLr5Kx8N9Wt2BfXgvFjInxfXwidQeTH7JGtQ2+RT7CrEjIu5
         KzsHOhO9kwBVmzn73JIE2/X8Gq9za6YiexjrS+R8OGSwDCIERq0kCZafqqeg4eC7E0Lm
         qyHQkj8fBou1ESemvE4deq5NVH1+eW7UttUaDEQAznQHo853ETWM9eQWYNuQrTyUNWW9
         qMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684334583; x=1686926583;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4SNOGQNiXUm9Rm9DfrimxqrzH0Clgmb4qexx/tZZaE=;
        b=MhYkUGGBt+nZ4buXMIWatQNLQ3ag5ldIy6ISbm/DmWhyD8RKuOeObzEj7vf9GWYPJP
         xSfKVLOOkxYbiWwmIp9d4pQYoaKCsbImzAKZFPlyHRY3sXpN4EA3G7M8vRH9L4uHWR4W
         m+SMqrjLSUYJSN7tFmRIXVCJ+1Lcbx/vTM5U6VTRquCakEjKN6cicSuklrvLQNJXKrCv
         0Zi8ZT0w9W/imvGcZ4tGr+R+55gxPGbBtqAyO7K9Cx4teRk0IViZ2ftk7jAiiJMTqC/w
         K1sl5VAXHpmLQUAhySual96yjl3WE/eIcpzJr4U80Kg1D+DvDhcap/7sjIra2t6A/CKg
         Yp/A==
X-Gm-Message-State: AC+VfDyNcEC1lNSJYqc6GX0hy7dKR6t8GUqVeOV/4qF2FKBNDqqkzlsP
        pvY6Lti+lH8HsAeWKs+dCPcwnw==
X-Google-Smtp-Source: ACHHUZ42OQJxELGRspU3oO9Qc9cnP92grnvk4j1tgMqg9+ovQpWz4bYEat0/wlCEUV7IkWUkpY0sUg==
X-Received: by 2002:adf:ea8d:0:b0:2f0:583:44be with SMTP id s13-20020adfea8d000000b002f0058344bemr829973wrm.0.1684334583431;
        Wed, 17 May 2023 07:43:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:5b2e:1428:59f1:44a4])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b003078354f774sm3375200wrv.36.2023.05.17.07.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:43:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 17 May 2023 16:43:01 +0200
Message-Id: <CSOMS0W9MIUG.2MN43QZO9EX7Q@burritosblues>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <jpanis@baylibre.com>, <jneanne@baylibre.com>,
        <aseketeli@baylibre.com>, <sterzik@ti.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v4 2/3] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
From:   "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.14.0
References: <20230512141755.1712358-1-eblanc@baylibre.com>
 <20230512141755.1712358-3-eblanc@baylibre.com>
 <ZF5yb4DbVDbfxVU4@surfacebook> <CSNQ2RRG7XDC.164H6P357UHSR@burritosblues>
 <CAHp75VdNgBv5yVTXzDpY3rrF31p=p99cfXdEs0q7m8VmLLJwbg@mail.gmail.com>
 <CSOGQIRNP61G.1Q2A4ZXB43YYQ@burritosblues>
 <CAHp75Vc-c=VU5Bfy5097z4wm43=bZ4LG83QBYV19YOrC7zSGag@mail.gmail.com>
In-Reply-To: <CAHp75Vc-c=VU5Bfy5097z4wm43=bZ4LG83QBYV19YOrC7zSGag@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed May 17, 2023 at 3:51 PM CEST, Andy Shevchenko wrote:
> On Wed, May 17, 2023 at 12:58=E2=80=AFPM Esteban Blanc <eblanc@baylibre.c=
om> wrote:
> > On Tue May 16, 2023 at 6:48 PM CEST, Andy Shevchenko wrote:
> > > On Tue, May 16, 2023 at 4:05=E2=80=AFPM Esteban Blanc <eblanc@baylibr=
e.com> wrote:
> > > > On Fri May 12, 2023 at 7:07 PM CEST,  wrote:
> > > > > Fri, May 12, 2023 at 04:17:54PM +0200, Esteban Blanc kirjoitti:
>
> ...
>
> > > > > > -#define TPS6594_REG_GPIOX_CONF(gpio_inst)          (0x31 + (gp=
io_inst))
> > > > > > +#define TPS6594_REG_GPIO1_CONF                             0x3=
1
> > > > > > +#define TPS6594_REG_GPIOX_CONF(gpio_inst)  (TPS6594_REG_GPIO1_=
CONF + (gpio_inst))
> > > > >
> > > > > Why? The original code with parameter 0 will issue the same.
> > > >
> > > > I felt that replacing 0x31 with a constant would make the computati=
on
> > > > in TPS6594_REG_GPIOX_CONFIG more understandable. What do you think?
> > >
> > > The question is why that register is so special that you need to have
> > > it as a constant explicitly?
> >
> > It is not special, it's just the first one of the serie of config
> > registers. I felt like just having 0x31 without context was a bit weird
>
> I'm not sure I understand what 'context' you are talking about.
I was trying to convey the fact that 0x31 was representing
TPS6594_REG_GPIO1_CONF address. This way when looking at
TPS6594_REG_GPIOX_CONF(...), one will better understand that this macro
is just about offsetting from the first GPIO_CONF register.

> This is pretty normal to have two kind of definitions (depending on the c=
ase):
> 1/
>
>   #define FOO_1 ...
>   #define FOO_2 ...
>
> and so on
>
> 2/
>
>   #define FOO(x)  (... (x) ...)
>
>
> Having a mix of them seems quite unusual.
I did not know that. I will revert this change for next version then.

Thanks again for your time. Best regards,

--=20
Esteban Blanc
BayLibre
