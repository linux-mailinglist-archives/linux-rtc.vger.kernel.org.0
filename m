Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741416F82A8
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 14:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjEEMKd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 08:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjEEMKb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 08:10:31 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D5C19427
        for <linux-rtc@vger.kernel.org>; Fri,  5 May 2023 05:10:29 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-2f95231618aso1135762f8f.1
        for <linux-rtc@vger.kernel.org>; Fri, 05 May 2023 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683288628; x=1685880628;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPnKb9KWzALqu/WWNw1D6IVXkmVLTPGE1Uz4GFYu0vk=;
        b=wsqrFGE0RtUtNs7tXBbPIpWpwsY6Rt+jiaQE7nrQ2Yesz5WlndN5Xg6+AMD++z8EWO
         MR4JyBJJWkKCIqz5eofnR5ACJ38KT//aQ9Zq+W10CdKVDo0Hyu8Yx9Z2XKhJQtCHQ+XS
         yxz6wQRFIN0fHtRRqBGwfGRL5YxHkIl0xn9FtiLnmLWtHJ0IFSscsV/+q8y5FFXR3Ki4
         AjXjFClcQ5KaNURf02iOcnzbequ9xVvkMCcBicWU8Hu2WE7yMvFbnb/bl+GUC3Mwkw2d
         DGCpy19/xmbXyAlF/v0ZM5Zq+MkEAp9HIE9tMkovymJ/tGty7AG1hzPDjDgOqD9MGSd6
         enow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683288628; x=1685880628;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPnKb9KWzALqu/WWNw1D6IVXkmVLTPGE1Uz4GFYu0vk=;
        b=IKoCBV/pysjxItO51qUlctlQPPJkUIn2pCKapwWWTHtZaJqXRHiA853rUXzpvpbcSa
         74ZLHMBXs1KrqwMukKJ2EzXXGnkZeV/Zy7G/lgLmxEMFPQOVChpPpPE1GEz5rsqLBfqg
         R3U2UTXxLPv8nj9L8BZHejtDAp6TTiuX/X6ZbrnNOt0Mq9kYFJYxeggr5O4nVg0vN4ZY
         A2aea57klAS8VyCCdXUFUQ+AxrU/hi3xujGURf9MHBykdax6eFYH+zjy0+0gBso8j42L
         lD/Bbl8Yz2N75ToyVPi9Fj0JwyEt9rl3vU38cFDF6e9bDcVsLI1EDJ7szYoLm6RP2J3X
         1JPg==
X-Gm-Message-State: AC+VfDzlWDa1juAoP/sfh4bmcR7IiLwmHikHDMrfD3rqSez0+715iwjA
        YUHgXFxCijK+O+Fr1wlK6y929Q==
X-Google-Smtp-Source: ACHHUZ7+K9dNbH0gbTnbD9zP2evu00avY5UafhN7s4v6r1i8ijbRkp1VpCAWPfHX5zncWmirkie0Qg==
X-Received: by 2002:adf:e48b:0:b0:2f5:9800:8d3e with SMTP id i11-20020adfe48b000000b002f598008d3emr1345356wrm.47.1683288628181;
        Fri, 05 May 2023 05:10:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:1f67:8e16:3c9:ad6f])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d5481000000b0030647d1f34bsm2291131wrv.1.2023.05.05.05.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:10:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 05 May 2023 14:10:26 +0200
Message-Id: <CSEC0NQ6VDJM.1FKTTAX0SPFPQ@burritosblues>
To:     "Michael Walle" <michael@walle.cc>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <jpanis@baylibre.com>,
        <jneanne@baylibre.com>, <aseketeli@baylibre.com>, <sterzik@ti.com>,
        <u-kumar1@ti.com>
Subject: Re: [PATCH v3 2/3] pinctrl: tps6594: add for TPS6594 PMIC
From:   "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.14.0
References: <20230414101217.1342891-1-eblanc@baylibre.com>
 <20230414101217.1342891-3-eblanc@baylibre.com>
 <CACRpkdab_26D9BMGeSygy_oa6SFa62ytXcy+Ydi3yPzQO3tU4A@mail.gmail.com>
 <CSCM20VPW7QB.RQD36XO6634I@burritosblues>
 <CACRpkdZ8oudy3XfKggZm5srJfOxmRXoFUoiuA3P4i0RTCdc5fQ@mail.gmail.com>
 <66a8224ffbeede1e8296a2aef60fc73d@walle.cc>
In-Reply-To: <66a8224ffbeede1e8296a2aef60fc73d@walle.cc>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri May 5, 2023 at 1:31 PM CEST, Michael Walle wrote:
> Hi,
>
> >> I noticed that I could override reg_mask_xlate, so I should be able to
> >> "just" match on the base address given as argument to perform a
> >> different computation depending on whether we are using reg_mask_xlate=
=20
> >> in
> >> a "direction change" or not, but somehow this feels a bit wrong.
> >>=20
> >> Is this the correct solution?
> >> Am I missing something?
>
> No you don't miss anything. This is the actual use case for the base
> parameter. If you need your own .xlate you can match on the base address
> to do the translation based on wether it is used for .direction, .set
> or .get.
>
> I.e.
>
> switch (base) {
> case REG_IO_CTRL:
>     do_something_with_reg_and_mask;
> case REG_DAT:
>     do_something_different_with_reg_and_mask;
> default:
>     error;
> }

Ok perfect I will do that then!

Best regards,

--=20
Esteban Blanc
BayLibre

