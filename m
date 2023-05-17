Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418067064C6
	for <lists+linux-rtc@lfdr.de>; Wed, 17 May 2023 11:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjEQJ7L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 May 2023 05:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjEQJ7K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 May 2023 05:59:10 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09CE5B9A
        for <linux-rtc@vger.kernel.org>; Wed, 17 May 2023 02:59:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f415a90215so5651165e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 May 2023 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684317539; x=1686909539;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ai+XJcD6q02E74/RveX4hPtq3MlwXKz1QHBcBUcFNo=;
        b=NYPWtNMpM/bWn2LM8NEIe3TP3xMkwDSnDKxRs2mcUsAWBI5r8202lrNKrOzFsUDasn
         9qiOQRjjWpzU0A5euUFl5+yUgZ/Hed1+v/UwQ//qMwAb1jsJrLmQOJZLUNJUnI9sGwJA
         LSUbHAtu37E7Im/L4tRgnb9Gnq6UtI9e2Y+cbV6EHrwmxQ0tqMkqyecNaq1RC6wdGV9O
         hYabnvN5IBi27WEdrUVSk5FAF9RIEAiLSul39oFq5TTo2ndOEq6SxYk9B3GssMwTPhae
         XiCB3XSCcAJBaBWgtsd2MI8m2jpzyANAAmbezvyI5GbRDhgNoe5POlyUH/9pR2287gd8
         44MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684317539; x=1686909539;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ai+XJcD6q02E74/RveX4hPtq3MlwXKz1QHBcBUcFNo=;
        b=Sxz5U1df1yDuYUAIcsIi3GUsn8gr0TOUbfvB+XnqKj5zuhbV9spB4Ri1gF62fB6pmo
         72ZUapeB6ItlTdWDKIdpd3gP0MyPLZ2gufte7FS7s3dXC01CRXRubiAABeGVy8Acscib
         LwSomrGy577BRXmzneF2ilFo9lze3aG6h8edSt6Z7rue6i0iiSMdWw/UaUkBAIxobHAG
         GvxF5+jfS80le4BTwe2cXvVzsfaRONKrAlpMsva/KaaG7D4TDF9npwvKCQSY48gTb21N
         yYCzn5v2ihCfq7arAdgGbeXi79VaT07eXPNQonjkiShGqWXa5OfQfmn0SuAWFXatSfHR
         K70A==
X-Gm-Message-State: AC+VfDyaUfT0hEJxlPbGEpfALhYvdW6KeIm5I6k8GwXlgKH7uAm/Y+s7
        YVmbpWD+R4f7vFPw1vlXMHj81A==
X-Google-Smtp-Source: ACHHUZ7ICZHWcsgX6bdkWaWTOXtSGTkJT7t+F6SP7Yq+8hpaG9+L8EAdtndZiwXg4Vpj2czekB/cPw==
X-Received: by 2002:a1c:4c08:0:b0:3f4:2737:a016 with SMTP id z8-20020a1c4c08000000b003f42737a016mr20100741wmf.29.1684317538966;
        Wed, 17 May 2023 02:58:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:5b2e:1428:59f1:44a4])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d6543000000b002fda1b12a0bsm2237051wrv.2.2023.05.17.02.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 02:58:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 17 May 2023 11:58:57 +0200
Message-Id: <CSOGQIRNP61G.1Q2A4ZXB43YYQ@burritosblues>
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <jpanis@baylibre.com>, <jneanne@baylibre.com>,
        <aseketeli@baylibre.com>, <sterzik@ti.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v4 2/3] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
X-Mailer: aerc 0.14.0
References: <20230512141755.1712358-1-eblanc@baylibre.com>
 <20230512141755.1712358-3-eblanc@baylibre.com>
 <ZF5yb4DbVDbfxVU4@surfacebook> <CSNQ2RRG7XDC.164H6P357UHSR@burritosblues>
 <CAHp75VdNgBv5yVTXzDpY3rrF31p=p99cfXdEs0q7m8VmLLJwbg@mail.gmail.com>
In-Reply-To: <CAHp75VdNgBv5yVTXzDpY3rrF31p=p99cfXdEs0q7m8VmLLJwbg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue May 16, 2023 at 6:48 PM CEST, Andy Shevchenko wrote:
> On Tue, May 16, 2023 at 4:05=E2=80=AFPM Esteban Blanc <eblanc@baylibre.co=
m> wrote:
> > On Fri May 12, 2023 at 7:07 PM CEST,  wrote:
> > > Fri, May 12, 2023 at 04:17:54PM +0200, Esteban Blanc kirjoitti:

...

> > > > -#define TPS6594_REG_GPIOX_CONF(gpio_inst)          (0x31 + (gpio_i=
nst))
> > > > +#define TPS6594_REG_GPIO1_CONF                             0x31
> > > > +#define TPS6594_REG_GPIOX_CONF(gpio_inst)  (TPS6594_REG_GPIO1_CONF=
 + (gpio_inst))
> > >
> > > Why? The original code with parameter 0 will issue the same.
> >
> > I felt that replacing 0x31 with a constant would make the computation
> > in TPS6594_REG_GPIOX_CONFIG more understandable. What do you think?
>
> The question is why that register is so special that you need to have
> it as a constant explicitly?

It is not special, it's just the first one of the serie of config
registers. I felt like just having 0x31 without context was a bit weird

Best regards,

--=20
Esteban Blanc
BayLibre
