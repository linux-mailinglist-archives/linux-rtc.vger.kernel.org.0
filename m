Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE87C629B3C
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 14:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiKONyS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 08:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiKONyR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 08:54:17 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45126E9F
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 05:54:16 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id f18so3170796ejz.5
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 05:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0sFkX+nbXodQt671NtDLbwnj/LAv7WU9JCGBKOzfpo=;
        b=LCXNFQyj9iyDqZ0IoY/l3bCF9KVFvTQK/X31I9OveRprtKEzUCRvM8avrTYoCf6xR0
         sZibGh7vNgog7H0X2Q+Fv0xpGCCnpZfbJTF/Q8J3MXrB6etR+Bv2rs256mCMkEjswuF/
         epkHDYiuiyNEZmIHKIecEgnX8vGdb5rnfrm0irBH9Nl86aof8dyN6s4vYaOi8dGcu8k7
         DNPJLlHBY+WHAqBxboGWbN49MfKxdl9C4hGyDmPP2hVLyhOm2ndxhvRJRb2yv6naEz9x
         15+E27B/yeP0tR3/Jk36kZS2TR20ue0APo+lEHUq0fvCFQr9UKSjEJyvJ1Ob0szqjRpT
         IrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0sFkX+nbXodQt671NtDLbwnj/LAv7WU9JCGBKOzfpo=;
        b=qn6izQG/ySgw36B/aClgTmP6z2V03ZIclKRiaPfGrmMqBn/V8MR0e29nlCZAPKT4jM
         9fykCBVwFqmpvY+788pnBhEO+GGTyvBEJfBdaT3JWvy46hlHYWrUYRT+CVHUwan3NbNm
         rmJLEDc0F59jyNCETFiC4PqDGs1dHMhSw/Axo28Sf4+uSzH7DksysXWb5UyO7oaepHck
         +S6jYXXLSz3NJHDPtY6lr37o/LrGIPTyaAwjX5KtHTlic04wFTKYsxtsronNqOHuo0i6
         KuKiAejYP07tT5xymTt6BBcfr6PCx2QaKlAbA612l4MMEu86JtcQj8o74YPYFf7Mi+Le
         HRIw==
X-Gm-Message-State: ANoB5pkQcKCXFk4uwcGAqFML3za0ZPP8Pvg6GK4muD0oGjLzKy4WfH+n
        l+eTn5GrxmeV9jK63SASEGcNR2gl6ePZwAu19Mp6zg==
X-Google-Smtp-Source: AA0mqf4WMyt4uB3gxvki+JAXsKJPJAU1cd1VDx3nBWsvAl7puGi2zyYQVi+2VHiXzUHT9ITHHgAIIdG2a5wj+RmSmso=
X-Received: by 2002:a17:906:a1d9:b0:78d:b371:16e5 with SMTP id
 bx25-20020a170906a1d900b0078db37116e5mr13497638ejb.456.1668520454765; Tue, 15
 Nov 2022 05:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com> <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
In-Reply-To: <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 15 Nov 2022 14:54:03 +0100
Message-ID: <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap documentation
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Fabien Parent <fabien.parent@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Angelo,

Le mer. 9 nov. 2022 =C3=A0 10:55, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 08/11/22 19:43, Alexandre Mergnat ha scritto:
> > +maintainers:
> > +  - Alexandre Mergnat <amergnat@baylibre.com>
>
> I say that the maintainer for pwrap is Flora Fu <flora.fu@mediatek.com>..=
..

Flora Fu is the driver maintainer. As described in
Documentation/devicetree/bindings/writing-schema.rst:
maintainers
  A DT specific property. Contains a list of email address(es)
  for maintainers of this binding.

My  understanding is this field is only for binding maintainers, but
not related driver maintainers. Are we aligned ?

Regards,
Alex
