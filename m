Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4F9634061
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 16:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbiKVPhn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 10:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbiKVPhd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 10:37:33 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7141DD
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 07:37:28 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id n12so36608119eja.11
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivYiES9sG14knWzvtjTCoJ1RoaioJgEMHFOyqeNjfZM=;
        b=naVdW0+iM/irGeY01Hv1M1HkCwp49rOoym6hI1RT3vHD/OSogrNQi1/s9J6qi6CayR
         zdaYyIAwDxLhtMTL7CefzThSXMbU7784fZ8U9cLxWPegw9Imz3oOogKztkxfqWBt0gHW
         eySOyWfPEBPwUhv2k/Fsgyq/f1jy+52wQWqv/P2z7wWNe/KIR3CfT3Ljk3G52+/lOvNn
         B7AG93ZJxenUgcWkV64Im/MT6EQfzii2fQny1jgDbwVAUFllistigQyM4doz+WOO72Py
         58/3jGOI/oFZR+Nv8POqmgkAFh1gS/2XDDU4bqDK1vEt395Balnuwb0Y7tVQ/Y9ZpSDU
         8LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivYiES9sG14knWzvtjTCoJ1RoaioJgEMHFOyqeNjfZM=;
        b=yjC+WYxKCTa3P3u3jp8OLt0iJlGVKumqv5JDpQcPjRULXCBiwz+ltMGB/TMfu1aduh
         jsOxhqT8eXUNZgUujT6Rzoe5B0H8cUofzjWqCcoLPazoMtdRdk8bU4KF4Fktt0Kd/JJK
         RXED3vaKmc/FXRG4IjVyltuaz0SqVSsd/Ssayk0jSsaj7ttlMZuK81yjQM4qMySVAUpS
         K571NyqNsHvfkCIMPQmN7LbA5new017dlYtFuXAbl33GZnGS1UoC1vhaOIGuKYwlbKiU
         S+fOwRiV9NMaLiQRBbRNU4lLkxvJzQibV9WhfIL8L8/w78wpeZsdhZivR6/w3Yf8KhWV
         PBDQ==
X-Gm-Message-State: ANoB5pkfxaaEYP/ffZZA6EDJ50hyJvAkxhqwPefHJJzZwt8FITn34fwa
        Uqr93bR5R8pEn6M1kC/B1uP3bFk33kltdmrw8FuYnQ==
X-Google-Smtp-Source: AA0mqf5lVD8Rk2AxeSj7tZ0Ls4Vp26eTLbI5+h+t7YH4u9mCkuwwfrmqgRV3Rsv9A3b2Gl79AHZFVdIXaWEGPf/ipBI=
X-Received: by 2002:a17:906:52c8:b0:7ad:ba1e:1bac with SMTP id
 w8-20020a17090652c800b007adba1e1bacmr20202651ejn.528.1669131447035; Tue, 22
 Nov 2022 07:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-6-8210d955dd3d@baylibre.com> <47ae0770-1cd4-cfea-7222-f91d1d85f133@gmail.com>
In-Reply-To: <47ae0770-1cd4-cfea-7222-f91d1d85f133@gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 22 Nov 2022 16:37:15 +0100
Message-ID: <CAFGrd9rhKfMjGMeER4SBsU27qgN8P-axzG=gRtN=szBiV5jhvQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap documentation
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Flora Fu <flora.fu@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le jeu. 17 nov. 2022 =C3=A0 17:06, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
> On 16/11/2022 13:33, Alexandre Mergnat wrote:
> > - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
> > - MT8365 SoC has 2 additional clock items and a yaml schema for its PMI=
C
>
> Should be an extra commit.

It was explained in pwrap.txt. I've done extra work for the previous
version but removed it for the current one. I think I can remove this
line from the commit message.
