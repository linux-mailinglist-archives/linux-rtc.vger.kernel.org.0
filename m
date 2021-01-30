Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE8A309732
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Jan 2021 18:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhA3RYj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Jan 2021 12:24:39 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:34218 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhA3RYa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 Jan 2021 12:24:30 -0500
Received: by mail-ot1-f44.google.com with SMTP id a109so11968043otc.1;
        Sat, 30 Jan 2021 09:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=9UU0fPRjeLPZnus41uS3atTuyIZgZVJ3nKD7dA4ziy8=;
        b=OastlA+1DEOnePnRuPZb14q19Ym+QMqcLlv7hBPBSeb0+K4zGIQyrf0cH6XRZtw7hv
         V3nnL8+q28+dga+UqDa42adRxJkhVvdz28ZovM4wce01jpuHsy5+ga7RIzPy901qZfVV
         84f6/+5wweQ0HPT2odTTBKmM0k7v0V8nDOhQJpef4/yADH0WXnIUoKZWXiIvF+gmD78F
         Nfg+Rw3ENXEoRCWpSKyumo13bTGR0d/9cmCSdjAqk9rDyE1alMy0pycVYBZseKj11nIj
         AqW63jgHHZ07P5pckI+Ky3xqp4Ri7zm3KwMl23Aphnj2Cd7csqfd21rg5MbpUpVmZt1V
         rNHQ==
X-Gm-Message-State: AOAM530mzneI0D3HC81WokjqKCtadoUgOiTN0djZw2p+XY5YPMiKFRNa
        ypQGpAAbgeoe7sWa6/S8gA==
X-Google-Smtp-Source: ABdhPJz9x2jS85HnLhL4DpdmLb2GJWo4CXvMaGkSiz0AtOqPIs9vaKayPjx3qX3R0yiVO24Y+b/j9w==
X-Received: by 2002:a9d:5909:: with SMTP id t9mr6041294oth.263.1612027429775;
        Sat, 30 Jan 2021 09:23:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j1sm3167340oiw.50.2021.01.30.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 09:23:48 -0800 (PST)
Received: (nullmailer pid 1419428 invoked by uid 1000);
        Sat, 30 Jan 2021 17:23:40 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        srv_heupstream@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
        linux-rtc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Fei Shao <fshao@chromium.org>,
        linux-mediatek@lists.infradead.org, Ran Bi <ran.bi@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1611913781-23460-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1611913781-23460-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH RESEND v5 4/8] dt-bindings: regulator: Add document for MT6359 regulator
Date:   Sat, 30 Jan 2021 11:23:40 -0600
Message-Id: <1612027420.840636.1419427.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 29 Jan 2021 17:49:37 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v4: fix yamllint errors in dt-binding document.
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dt.yaml: pmic: 'adc', 'compatible' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.example.dt.yaml: pmic: '#address-cells', '#size-cells', 'adc' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/sprd,sc2720-adc.example.dt.yaml: pmic: '#address-cells', '#size-cells', 'adc@480' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.example.dt.yaml: pmic: '#address-cells', '#size-cells', 'adc@197' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml

See https://patchwork.ozlabs.org/patch/1433233

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

