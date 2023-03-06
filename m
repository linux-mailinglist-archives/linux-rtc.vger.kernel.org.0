Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372036AC2C7
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Mar 2023 15:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjCFOQF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Mar 2023 09:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjCFOOl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Mar 2023 09:14:41 -0500
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BBC1FCC
        for <linux-rtc@vger.kernel.org>; Mon,  6 Mar 2023 06:12:52 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536c2a1cc07so185860077b3.5
        for <linux-rtc@vger.kernel.org>; Mon, 06 Mar 2023 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678111838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fFPV3S+fNPRg5F4+BxgnVsec4VIMQRpi6fgWcdHiVA=;
        b=FIGf5h3w/Z08HcXuh3X1ZpHZHrFPPW41yGGIFmWyf+Aohi+qnbhHYbiBwbqPGyQBn9
         NXXqtx1HjjBkgxE5rJKm5VPbdFqmjg0Go3gPxH1GrQgcYKwWxmu3ELxR1K1jmkI7hmiM
         qhgnQ32O2QZyqap+kNQg+E3+2PdmASMpKke7V7bFtyJ78t7xmrtHX0+UHJFKNTHk6olf
         sU8hO5smfzr/u+n25yU+8CUEX85DC6SHhqCy2+ijdGO5Gk5f/ksH6Z4g26UrvbSDi38P
         lZ6HGPMchyt1o6b7gijDWXGKu93xj4/hFm65Ta8rLR1ybK3Xu9mlsHMU6V7E3YoDdXV6
         3+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fFPV3S+fNPRg5F4+BxgnVsec4VIMQRpi6fgWcdHiVA=;
        b=arZMvVgI/xRkwFVATj79203UuIklfTJ3AjI69F3OeB/uXRy23ztzMo8dJlKK8pAaKz
         SezkpwkS5Sj5GCk1OebBjGnpbhxOg7gj4sv/vnsjkfwlvmUkrjLc5yRR/88GwO2J7mbN
         BCJI1QvR12Oc21eziJ/LNqJazFOQN5/1fROp1IzmwWNUo1Zg/XBdAKb81MK3bVmfV42e
         5OLQQUoccf4t72uyU7otvo9bLru18O6hCijTlx6vlSfwG61ThFHxbf4VuWDcbh68p/y8
         CVUswPMhj6uj0phaAg1uAsGZ3B7D2p9R3R4qpjcdjZ58gaVOSfbHYH693eMlPjAVg2PA
         1OBw==
X-Gm-Message-State: AO0yUKX1o4CsrTE+hKO7c2tE4SvKqUhSylfiphKTsGWYPQW93Ze3OJ2D
        zLSfyEyvCNQUEpnhht1vk/fWZzogc4ALrArjGa2m2w==
X-Google-Smtp-Source: AK7set+L8XveTCLOf7uzdZIqX6Ru0O9dDIwJQAPpsGqfycSP5D3nLqQMy0RuH1oMg349JgrwV1dtktPyLhpIbNIwnno=
X-Received: by 2002:a81:4317:0:b0:52e:dddf:82b9 with SMTP id
 q23-20020a814317000000b0052edddf82b9mr6925941ywa.10.1678111837757; Mon, 06
 Mar 2023 06:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20230224133129.887203-1-eblanc@baylibre.com> <20230224133129.887203-3-eblanc@baylibre.com>
In-Reply-To: <20230224133129.887203-3-eblanc@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:10:26 +0100
Message-ID: <CACRpkdYck+=3sUKQbg2j=KMfv_FEiofFxHpDsXgFo=p2uMYfEQ@mail.gmail.com>
Subject: Re: [PATCH INTERNAL v1 2/3] pinctrl: tps6594: add for TPS6594 PMIC
To:     Esteban Blanc <eblanc@baylibre.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        jpanis@baylibre.com, jneanne@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Esteban,

thanks for your patch!

On Fri, Feb 24, 2023 at 2:31 PM Esteban Blanc <eblanc@baylibre.com> wrote:

> TI TPS6594 PMIC has 11 GPIOs which can be used for different
> functions
>
> This add a pinctrl and pinmux drivers in order to use those functions
>
> Signed-off-by: Esteban Blanc <eblanc@baylibre.com>

> +config PINCTRL_TPS6594
> +       tristate "Pinctrl and GPIO driver for TI TPS6594 PMIC"
> +       depends on MFD_TPS6594

I would add:

default MFD_TPS6594

so you always get this as module or built in along with the MFD.
Otherwise Kconfig gets complicated and tedious for users.

> +       select PINMUX
> +       select GPIOLIB
> +       help
> +         This driver supports the GPIO for the TPS6594 PMICs.
> +         chip family.

(...)
> +#define DEBUG

Don't put this in production code.

Look in drivers/pinctrl/Kconfig.

config DEBUG_PINCTRL
        bool "Debug PINCTRL calls"
        depends on DEBUG_KERNEL
        help
          Say Y here to add some extra checks and diagnostics to PINCTRL calls.

Look in drivers/pinctrl/Makefile:

subdir-ccflags-$(CONFIG_DEBUG_PINCTRL)  += -DDEBUG

Nifty eh? :D

> +static const struct tps6594_pinctrl_function pinctrl_functions[] = {
(...)
> +       { "scl_i2c2-cs_spi", TPS6594_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION,
> +         (const char *[]){ "GPIO0", "GPIO1" }, 2 },

Ow this is starting to look hairy.

Is there some better way to get here?

Other than this the code looks very nice.

Yours,
Linus Walleij
