Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448D6608D94
	for <lists+linux-rtc@lfdr.de>; Sat, 22 Oct 2022 16:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiJVOCp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 22 Oct 2022 10:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiJVOCm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 22 Oct 2022 10:02:42 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B61C172B77
        for <linux-rtc@vger.kernel.org>; Sat, 22 Oct 2022 07:02:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id l22so15724112edj.5
        for <linux-rtc@vger.kernel.org>; Sat, 22 Oct 2022 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LNVXeM54MuUTzkxW4S+h/avYMDRiH1JNQoeYcnCHBhM=;
        b=GjMO9bieaHDBelf7XPvp7Mm6+ECuPSqx2R6/8PrakF0zbhlcSTaFXUaHjvuZ2PA8oC
         6WcjMZS86zeqIwyvNpGwuo6uT7FBWc0z/XIKRCqsdCIqfvsYU5jrdGwZO3AN/Ut8O2PU
         dVwNs+ZCerEYbOg45w7UYYLixBM2CbHkBDvT80VOQZCglZoEQDqqFHhmGHexg7wLDjKH
         dwidHE+9u/Qqc/ZjBKywjSP+b7eto8KN5KoUI5cL/eSVRiUi9+a4YNFvdbLp0UHLJ6sl
         gO3VAnOCQ8U/s+ZJg38eYK/md92XTywwgTsnnIKU+jdNd8yLoqJqnpyW7AhFA1JN3Ctq
         CMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNVXeM54MuUTzkxW4S+h/avYMDRiH1JNQoeYcnCHBhM=;
        b=Slb1gE55qVlUhXERtU+GRoZbbq7V1a1vDfYSoGCa2ZWPB+biIZtsdVx0iZiT+PVDTm
         m4U6NStvp5fsLmEK82uAbDFzTDoxx3WQf0PxOvxgtVdt6Mgrq3VyCrMzJ9NsqnZCZlXF
         aHViAtEaVwdnHnL/i5aD4nWWdcnF5W0VL37k6IYQeupAHiQ+aiEfb+ehgLckYbqsAaY4
         DT98jzElbDM6k01FOwhhIKVjLE62iJa7UISr2fAIF737NOhCR4uAhc8kuQSIwzaZnFEK
         kKCszB3vxc5TzJPQpoYdaPs+U2YcDSWePrNlvlNbXwsQb5KhKdPTFuUsXLNrgKKN/LNa
         BFqA==
X-Gm-Message-State: ACrzQf2X4S+Mox5T1TVpv4NFTdbtCpFcFspFnZfJPMrr0sI1fkR6AbWo
        grrKUhj/MEjNGmTAL7IhHP7ZzI/ht9bupri4V2UjKA==
X-Google-Smtp-Source: AMsMyM7E0Zchl09puiKKoBotMVhULOKYzE0S/e35EOJ4h3CGvH2Wc0rTF+zAD6m+BsOpLEKYent2ulN8cXV4ms8GFBg=
X-Received: by 2002:a05:6402:1d55:b0:45f:c87f:c753 with SMTP id
 dz21-20020a0564021d5500b0045fc87fc753mr14243568edb.32.1666447356997; Sat, 22
 Oct 2022 07:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221021202254.4142411-1-arnd@kernel.org> <20221021203329.4143397-2-arnd@kernel.org>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 22 Oct 2022 16:02:25 +0200
Message-ID: <CACRpkdacViTuL_gmhWULNm7HCHQeGBXwkonDxQjubSM0=v8vgw@mail.gmail.com>
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
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

On Fri, Oct 21, 2022 at 10:37 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
