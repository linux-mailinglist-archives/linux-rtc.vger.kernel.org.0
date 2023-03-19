Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E7F6C0556
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Mar 2023 22:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjCSVQX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 19 Mar 2023 17:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjCSVQV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 19 Mar 2023 17:16:21 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089BB7284
        for <linux-rtc@vger.kernel.org>; Sun, 19 Mar 2023 14:16:20 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id i6so10883126ybu.8
        for <linux-rtc@vger.kernel.org>; Sun, 19 Mar 2023 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=CPgf7pIk/Lnkd8dmhIq8WFWJ6BLyq6+kGzIfKmtwXfzlt6kxOq+vyAL8X4bCK1iR3Q
         iI3bTgb55U+aMHk1J0DgzxXKaavtjILeOujbhHokL2gZ/DGhvklPkLQorKzCM8cKXNSX
         mH8IdtmZzoE0UjJlfkmvQ5ZzynMQW3xYlqNCjEGJbb5nfq6GYkbuiRcPcc3AutwclR21
         FSxDUsCtHWw9ulreB79I49s9OO/yykd220i5H/7eLfkuJeFqCB78ZslFFxwGWUtQIAMu
         7ttFNZM+NUfJoUwRduR6Iu0sohA7gqSwv+/dkMrlBLqqPMcaBKKmLc3GgvjMI3QRK3fD
         JC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=Rvx/Cwhf6C5m2qApQuBPGh537yeRU8A1OnUTXwTMcwy7OGf4uVr1ZiOvfnFc73Sr8a
         k/x7iRONpAyMZWCcNw47v086cVoKSFNXgz262P4FbMbh+Nimltq3eh0e+ZBEs7fGOUFx
         V0otP5JlBqWFsJuxHZ+eq+jeqi1Wh2NEOjf1MUKuvCyOMvEPKr2VwLuassI/5R5YHjtT
         KykhlW0mYei5jIBunLmwFAZNIvOOpqFxk/fUQZc9/rYR+MmervJrRQprAH+cswHp3NJ/
         yUTDhrYRd2blGGyBvyiFtyy9n4dk5blZK4MbW6aAcOsMxgRBwTT/bnfR2crnQ5YPQbsJ
         f0AQ==
X-Gm-Message-State: AO0yUKUW+gmBwh522X+GQBMQMnFhLZjmSn8HTs5CRmix82YDb9e/u3N5
        j1o3A6ROsO+g2i/W9zy1NJIRrFdkMKS/c5j9H6vkYw==
X-Google-Smtp-Source: AK7set/LQSqDHQohlcpzt0xizcE65fZwUUP3xQclwBlvRoXqfTwlv5UpIYbuGW13MOMcV9w5zxaHwatEJucTRxSnE5c=
X-Received: by 2002:a25:9786:0:b0:b61:14c8:90fd with SMTP id
 i6-20020a259786000000b00b6114c890fdmr4033253ybo.4.1679260579212; Sun, 19 Mar
 2023 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233634.3968656-1-robh@kernel.org>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:16:07 +0100
Message-ID: <CACRpkdbn=B1O2AyOq9DhgQ4Kw-mSytkj0rpJCKVGC51_rTeAHA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
