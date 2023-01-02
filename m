Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC04065B4DB
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jan 2023 17:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236121AbjABQLc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Jan 2023 11:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbjABQK4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Jan 2023 11:10:56 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DF0B864
        for <linux-rtc@vger.kernel.org>; Mon,  2 Jan 2023 08:10:34 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-43ea87d0797so403957067b3.5
        for <linux-rtc@vger.kernel.org>; Mon, 02 Jan 2023 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvv0wIbNtCiGn+iqYLphgYeyinreINxvRAbN060SZ3Y=;
        b=iP1gzyrVsDS1IKTAeqTr+7uO4W7fU3lQ6MZFdC2vu7/3hHkjMj1To5Wwgrx2qEAHyg
         vzArTd2WrgZIhwJwdIxDO7wJC3eDdD3ncDEGHpAgVQVUa08V/BpMJI4QCEd8M9hwXCIK
         TBqbtpAQaK5wJREcqahn2CvXHUKhJC4MHPOxYBYS5BRL5ytj9NUFD7p2Z09IlIZyMvgM
         8Uct/TNCd8av5MVD+6qNgKTisqIfaidaNPTW0YKt6eQJlV1kPuhqXT7lqh8Q9L7kG1/V
         ITn5u95Jfaoojh+Ydv6+zAXyGEbmkevEAo+18kKqp1OiJWpZ2BsSE1cUbuFSITyYlqOV
         bexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvv0wIbNtCiGn+iqYLphgYeyinreINxvRAbN060SZ3Y=;
        b=lwl/x5UJeuur55U0m15fpNE0c4mxE1wxFzMiFOii90atd0PFri26+t+x2sUCGxTOw8
         gyM2en9V5qaTFBRuHE6wO36qEIdcj/gnUCCrEDK+bBYAjRvD9iJijzh5BcJmUZWI/N64
         Mac+BikC5VS2Dmvo4QfDrRx+5ajFiR6zKEPzc3L5xB6c2wfNMKUntO/2aKKLW5Ekqbwg
         L51MeAwZVP0vaBGqMZeAQFXSHRQbPQfkLePbB7NApf61VEErTAMlyhnUK4Gatrr3X2/i
         aOseExPFj4r3FulPPo8azgkv0un3HylEKZKL8yjH0POUO8RSaepWm7wRubYGZPgDB8iD
         yCAA==
X-Gm-Message-State: AFqh2krEH5BZnvN5VlQMJGTstoLv2s5xkbS4jMsz59u71OhAhZzLG2z1
        yU6bnuYTMg+YC9tmOHEksBc2jnbZ+Zn69RqQT0EeXQ==
X-Google-Smtp-Source: AMrXdXu+OIItaQft1LqXq3zKwzkIEonX8EHxKg9gNj8jqifsZEugW4apEpuFnr7GyLF2aKsieT66zLV86sMbxCHSFSw=
X-Received: by 2002:a0d:d981:0:b0:369:69:e72f with SMTP id b123-20020a0dd981000000b003690069e72fmr5290134ywe.103.1672675833856;
 Mon, 02 Jan 2023 08:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
 <7hr0xe56uf.fsf@baylibre.com> <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
In-Reply-To: <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 2 Jan 2023 17:10:22 +0100
Message-ID: <CAFGrd9qZzpxPWpiEOJacc9m2WDFB8Mgr5U5too89mZmqqFir_Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Kevin Hilman <khilman@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Fabien Parent <fabien.parent@linaro.org>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> >> This patch series adds MFD, PMIC keys, and regulator support for MT6357.
> >> MT6357 is a MediaTek PMIC very similar to MT6358.
> >
> > The regulator driver (and bindings) were merged by Mark.  Could you take
> > the rest of this series via your mediatek tree?  The input driver (and
> > bindings) are ack'd by Dmitry.
> >
>
> Yes I can do that but 3/8 does not apply cleanly. Could you please rebase on top
> of v6.2-tmp/soc?

Hi Matthias,

I've pushed the V8 rebased on top of v6.2-tmp/soc.
https://lore.kernel.org/r/20221005-mt6357-support-v8-0-560caaafee53@baylibre.com

Thanks,
Alex
