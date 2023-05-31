Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBCA717950
	for <lists+linux-rtc@lfdr.de>; Wed, 31 May 2023 09:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbjEaH73 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 May 2023 03:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235061AbjEaH6x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 May 2023 03:58:53 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB68136
        for <linux-rtc@vger.kernel.org>; Wed, 31 May 2023 00:58:35 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f5021faa16so3645517e87.2
        for <linux-rtc@vger.kernel.org>; Wed, 31 May 2023 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685519914; x=1688111914;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk+81ZXQRVKIVnL3Dx1sO4lzEgof7lw/v2BMgCYOmWM=;
        b=bOr8Fp2dFZurkI/5395Fr9A4FzFobM3CAAB8Yep+0/xVZ+fxfeze96CKzQ6emmQwjS
         xMpVKQ8ij0ej7N+d3kN7jl6tZmMdzhysVG4YctDZqwjimaORs+3l0xMD6vuG4xgR74++
         Z8BF8LVEYPISAaUMs27RFaN6tAZR4zz+FjngyqsohNpIe/+n5L7jBP5QKCuqdclywSXn
         SDUTZWzIvofbaWuunhdLSKlnPc5DCifUYwUKCtLFOTMgXgTBJ3eYGKkTcDmc4JEllzr4
         X3ccPRmMyd0hru+lrlcHNWljEkjAIul4efx4wGbctKIyBAsGxzJ+VF1hRTuAtVQ2LAPt
         LeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519914; x=1688111914;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tk+81ZXQRVKIVnL3Dx1sO4lzEgof7lw/v2BMgCYOmWM=;
        b=CkUJ415xngz3815AX0/OfWedp42HMnNnNxIyP9MA6uLWYJUmH7F3EYZ94igBNOrdMS
         ZX/+zbmi3whpvn66mp2wgSzrPd/dgJQWq2OrMNXizJIrFgn1kfQbbQdc8rGtuDdoheaX
         w/3O4bws1NgYEzkQwAD9gpYA4M6+gFtmZqTBsW8KhsNa9j0Mb+MKFO4YjTLaUgQOC8b2
         103vBs+I+/9Nq6rBz2vwKa+QQNTUWOXYqZPvXmHp3nhABM4UzuPmYnua6HSX+8NQSI1B
         Ok6DtQnmNdSOnUrMC6cgjrj6M0OrkIvNSONUR0TKfiNRHfSS2HtT6nofmGY3FYycSz4q
         PSIg==
X-Gm-Message-State: AC+VfDwuXrSc5U9FgVE4LXHz74WFkiTNRVcccI7QtFU8ixyg8Hv0CVxm
        d+obCN3H4Pjsv8oJ9VcSIY5iyw==
X-Google-Smtp-Source: ACHHUZ6zMVr3+z7bUbOrkL8Kg0K8opWfYNkWLJgaVTR13nUS37NfKhRFO8bBUDjp0qvLhP/3Rp2gOQ==
X-Received: by 2002:ac2:511c:0:b0:4f3:9868:bee4 with SMTP id q28-20020ac2511c000000b004f39868bee4mr2006029lfb.32.1685519914087;
        Wed, 31 May 2023 00:58:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:512f:eb5f:2a12:360b])
        by smtp.gmail.com with ESMTPSA id n14-20020a1c720e000000b003f4b6bcbd8bsm19893663wmc.31.2023.05.31.00.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:58:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 31 May 2023 09:58:32 +0200
Message-Id: <CT0AXYC8EEP6.2PVKT3BWND8AN@burritosblues>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <jpanis@baylibre.com>, <jneanne@baylibre.com>,
        <aseketeli@baylibre.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v5 2/3] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
From:   "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.14.0
References: <20230522163115.2592883-1-eblanc@baylibre.com>
 <20230522163115.2592883-3-eblanc@baylibre.com>
 <ZG0QmjZwvzWbNwA4@surfacebook> <CSVF1AQBGQU0.1V5KJP08TCKLT@burritosblues>
 <CAHp75VcF65xZUVYB1mjK4HV86=m+ayESeDD2Nwas7UDoJjeLSA@mail.gmail.com>
In-Reply-To: <CAHp75VcF65xZUVYB1mjK4HV86=m+ayESeDD2Nwas7UDoJjeLSA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri May 26, 2023 at 8:43 PM CEST, Andy Shevchenko wrote:
> On Thu, May 25, 2023 at 5:07=E2=80=AFPM Esteban Blanc <eblanc@baylibre.co=
m> wrote:
> > On Tue May 23, 2023 at 9:14 PM CEST,  wrote:
> > > Mon, May 22, 2023 at 06:31:14PM +0200, Esteban Blanc kirjoitti:
>
> ...
>
> > > > +// Used to compute register address of GPIO1_CONF to GPIO11_CONF
> > >
> > > This is good.
>
> Btw
>
>   the register

Ah yes, thanks.

> and shouldn't it start from GPIO0_CONF (please, double check, my
> memory can do tricks on me)?

On Linux side it is GPIO0 but on datasheet side it is GPIO1_CONF to
GPIO11_CONF. I was referring to the "real" register names (datasheet
ones)

>
> --=20
> With Best Regards,
> Andy Shevchenko

