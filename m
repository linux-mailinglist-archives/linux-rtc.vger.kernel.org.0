Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9352556CBF0
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Jul 2022 01:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiGIXPz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Jul 2022 19:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiGIXPz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 9 Jul 2022 19:15:55 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC981FCCA
        for <linux-rtc@vger.kernel.org>; Sat,  9 Jul 2022 16:15:53 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 6so3285689ybc.8
        for <linux-rtc@vger.kernel.org>; Sat, 09 Jul 2022 16:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mP2wLhwavewGA8FVEJebKzO+AyUl27McMXohUrjH32M=;
        b=lofU9L5Tz9Yj7xkCPTUYbQb7wUBPYtbVCeSlBrpxJ5w75Xs9r8Vn/0QY2Xx3K6HcNx
         rM5CSUUaLZEQnVc9zTjuDhaqd4yPqihiguwlOaDvsgGkB5gHgemi0DSm92+LyPUN2yWS
         U570rUJJr5rrCQ6JtpQA5qRpYDR9WlorM1dCYCDGugTUdgfE4B+G2sNtDVEFkyNOh/B9
         mmx+1Xbs3pPQzd4XzurQKQ0Jy0l6icPmWeFOC4Z9c98obW1c+PlLUNasrOFsjv4CSTPz
         s321Z29KouSaMVEAwnq66OqpgMwk97Bb31ALluDtP2v9Q383Frxq+DTCYhDF+4h26hDA
         9eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mP2wLhwavewGA8FVEJebKzO+AyUl27McMXohUrjH32M=;
        b=RlcrB4t5tMPZJCU8r9G9C4nNV7/O56/pYCaZu9GmQsFlGscLKKXsLRtfoADlSJUNIU
         DEDT2bvn8oLs02hLMhCRexlxNcepusF7H9kwdvphxp7UEoFv8eOlFyzPvhbkY2X2Xx9L
         wgQc7NTxyDe4aidEl57Dz0fMJFMX6u4wa0VqPjGmGJwiX0ystrpHfB/wZh1gqXGzVFIn
         +e+L5l/V7uDdYX4O3NEe+KxXpEyIgz/jdxyWNdGEO+zRI6m5Z5Jb682AnhImmh/Mh+Ak
         ElO+Q+bkFbd6Z+25lxx23Gu8PxaQ7y0GDb0V39eJVqegSLh3B4C5EJmDjZWYZKkP61ej
         ilvQ==
X-Gm-Message-State: AJIora/VK26pGifx4aEZMEtrb2Wa6M7bxOazx6cIabIVPzkuJbdiR0Db
        H0OfQUXPhyde4HhM8OUAquyMc98eoUM60mT+cmZqpQ==
X-Google-Smtp-Source: AGRyM1snPIFzzPQrblAAlshjOA0mEK4qfSBKO2mQPb+MmznS2glNgzneCmOnOy4qyulsIyO5WJaID6sPej9uHMFeaSs=
X-Received: by 2002:a25:4046:0:b0:66e:ddca:2ff5 with SMTP id
 n67-20020a254046000000b0066eddca2ff5mr8784868yba.492.1657408552750; Sat, 09
 Jul 2022 16:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220707125022.1156498-1-viorel.suman@oss.nxp.com> <20220707125022.1156498-3-viorel.suman@oss.nxp.com>
In-Reply-To: <20220707125022.1156498-3-viorel.suman@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:15:41 +0200
Message-ID: <CACRpkdaBXqgxv_2-=Z6Lst7g6kGGL=eti_YaBSqvSQ7LeDgLaA@mail.gmail.com>
Subject: Re: [PATCH v8 02/15] dt-bindings: pinctrl: imx: Add fsl,scu-iomux
 yaml file
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
        Shijie Qin <shijie.qin@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jul 7, 2022 at 2:51 PM Viorel Suman (OSS)
<viorel.suman@oss.nxp.com> wrote:

> From: Abel Vesa <abel.vesa@nxp.com>
>
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'iomux/pinctrl' child node of the SCU main node.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if you want me to apply this to the pinctrl tree.
(I guess Shawn is handling it?)

Yours,
Linus Walleij
