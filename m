Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C9470DB81
	for <lists+linux-rtc@lfdr.de>; Tue, 23 May 2023 13:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbjEWLdL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 May 2023 07:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbjEWLdK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 May 2023 07:33:10 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCBA120
        for <linux-rtc@vger.kernel.org>; Tue, 23 May 2023 04:33:03 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96f6e83e12fso689008866b.1
        for <linux-rtc@vger.kernel.org>; Tue, 23 May 2023 04:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684841580; x=1687433580;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YClmjJRn0Gknkx4/41Zk8mWnA/6JxfHSw1B2SHo36gQ=;
        b=H9en1s01qV88TYN40D8bv/EI5Rlu5X10LvG0tYeE8+p60kwYTCgbxUFA9L25CvUabs
         IjKGuLTo7TjhmnTqlgAha1ako1fxMQxSQfUWXP+yWHlj/NRKd0VvrCHGyU6QF+RpfkTn
         NepUBUUaCc817xCgcQYaQbQ2Qrf9ZY2oMw3ZHwupHr3vvot2A4bYZMcHYBNrUFgdvAR2
         /ZyWIG/G+sm1C1EdSQHrv+qsPdXoic8QOHdYxEMWIWomF4vHqd23T+PTsUfdr8Ikkm8m
         OeFbxyIHTHn09z1RjTQ+SZjewSodpu+K+LbqyAQ5tiiBMLZwKvuCj+lbXmjWJZ+ZORxC
         gJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841580; x=1687433580;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YClmjJRn0Gknkx4/41Zk8mWnA/6JxfHSw1B2SHo36gQ=;
        b=U/1HkquWL08m3338BwT4XQNSmPFYwP4S5LXf0KMEuSnUkWihoYV+G1Jgayp4ne+FjW
         87otecSYeM9mnsYSuRugZoJqbEVeTg06RiTYHNcrEImfwZHSYohQu3n4n80Bs97CKc8t
         ryppHjDlw4PHMxEj7Al8qbP2ZWwHNcLffkgrHQGBbDJay8zPh6/IZXrCq5WtyXbi57qa
         FEpKh0njhFIIWSacwk12bMf7h/pamACtYVx9YrYy8W5OGUYWzAF9TP5u/jM/C1nL5WRX
         LGdCBrJXzOLBybgAhF/NXmE4iFo6Ldj+ubrv2YxfuVSoiL1zI7rqs6409qgo5vC4DKiN
         NUJg==
X-Gm-Message-State: AC+VfDx+skYKKn/jPKOxEZstpglLBZOjT6nnbH0n+lOQ5iJEZolm3B29
        duETAmx8HlH7cdlqXYTRpJjdng==
X-Google-Smtp-Source: ACHHUZ5XKzvEpRfOQrISQnpERtmMR3k5PjPTu1OR3NUNRg6n+kCsQI5pmKtx0oFz6sv3MiXxOPIumw==
X-Received: by 2002:a17:907:7e9c:b0:96f:7483:529c with SMTP id qb28-20020a1709077e9c00b0096f7483529cmr13616218ejc.30.1684841579957;
        Tue, 23 May 2023 04:32:59 -0700 (PDT)
Received: from localhost (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id v3-20020a170906858300b0096a68648329sm4324635ejx.214.2023.05.23.04.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 04:32:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 23 May 2023 13:32:58 +0200
Message-Id: <CSTMHRRDTCXQ.15F813VOYL54S@burritosblues>
Subject: Re: [PATCH v4 2/3] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <jpanis@baylibre.com>, <jneanne@baylibre.com>,
        <aseketeli@baylibre.com>, <sterzik@ti.com>, <u-kumar1@ti.com>
X-Mailer: aerc 0.14.0
References: <20230512141755.1712358-1-eblanc@baylibre.com>
 <20230512141755.1712358-3-eblanc@baylibre.com>
 <ZF5yb4DbVDbfxVU4@surfacebook> <CSNQ2RRG7XDC.164H6P357UHSR@burritosblues>
 <CAHp75VdNgBv5yVTXzDpY3rrF31p=p99cfXdEs0q7m8VmLLJwbg@mail.gmail.com>
 <CSOGQIRNP61G.1Q2A4ZXB43YYQ@burritosblues>
 <CAHp75Vc-c=VU5Bfy5097z4wm43=bZ4LG83QBYV19YOrC7zSGag@mail.gmail.com>
 <CSOMS0W9MIUG.2MN43QZO9EX7Q@burritosblues>
 <CAHp75VeNvfDqkQZq_ghiv8vb2NaogKqkiFi9i0N3yLgA=ZTDbA@mail.gmail.com>
 <CSTJSWD0ZQGE.2XVJAULQKQTRM@burritosblues>
 <CAHp75Vch5h8SRdLvFc=T_1C0ncj6Ti2KtN76RfZQSL0v22GXLA@mail.gmail.com>
In-Reply-To: <CAHp75Vch5h8SRdLvFc=T_1C0ncj6Ti2KtN76RfZQSL0v22GXLA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue May 23, 2023 at 1:03 PM CEST, Andy Shevchenko wrote:
> On Tue, May 23, 2023 at 12:26=E2=80=AFPM Esteban Blanc <eblanc@baylibre.c=
om> wrote:
> > On Wed May 17, 2023 at 5:04 PM CEST, Andy Shevchenko wrote:
> > > On Wed, May 17, 2023 at 5:43=E2=80=AFPM Esteban Blanc <eblanc@baylibr=
e.com> wrote:

...

> > I need to send a v6 now anyway. Should I convert all
> > TPS6594_REG_GPIO1_CONF to TPS6594_REG_GPIOX_CONF(0)?
>
> Again, if you want to leave that definition you need to well justify
> why it's so special that code needs it. Easiest way is to use the
> macro with 0 as an argument.

Ok. Thanks for your input and your patience :)

Best regards,

--=20
Esteban Blanc
BayLibre

