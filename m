Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDF03004C5
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Jan 2021 15:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbhAVOC5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Jan 2021 09:02:57 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:46760 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbhAVOBc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Jan 2021 09:01:32 -0500
Received: by mail-oi1-f176.google.com with SMTP id q205so5991756oig.13;
        Fri, 22 Jan 2021 06:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=dWHYMhsbBCya9Qdx4kuDb6+Q8KDESyIDxpnUb1IE3G8=;
        b=U50r2/Y8XugXcxLDLm7JRtNs8hO+6YKNU7Emc0wbMs40Vv3SSZPhdmr6+5s8QxncEC
         WLbFKLUUDbcznlxrEU5G9AsMhjIXvC88wCFhJUmyvspbgwxMaHw3F2SkLKxYW/UP1V1c
         +ATd76o0iuRa63rbiUOHj9KOBk2ghoCGdCi71aM+c9aiphQKDZJDTJKWuFzDzFNvRpY/
         RpwtxLQ7RuJ7g7q7LQj48OPe+LaG+BH7wL3CePLN3zS7FoLSoNtXAB1ZVpYHDeuvKNnI
         x/Nn4P/ASgwFiNdYlDllnSJmvAoNktSOGVD7lUYlnYHlXz58tKsDYdqs3Us8vWBmuHDQ
         LhFQ==
X-Gm-Message-State: AOAM531T16gZZN2acjnu2QoB8sw73U44jehvfom/1tcW/qBA8aJ3Vp05
        7Syhqrdg+b//rL/wAV1fFB2fqQIqJw==
X-Google-Smtp-Source: ABdhPJzZkdXg2eoWptnZ2Xg5/rC8xOaItyP/a1+YMGrdrb0mEBnvTtXRONbqcY0mh/dFcKmD2ruD+Q==
X-Received: by 2002:a05:6808:25a:: with SMTP id m26mr3339144oie.179.1611324050767;
        Fri, 22 Jan 2021 06:00:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d9sm1670049otb.65.2021.01.22.06.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 06:00:50 -0800 (PST)
Received: (nullmailer pid 674377 invoked by uid 1000);
        Fri, 22 Jan 2021 14:00:45 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Fei Shao <fshao@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-rtc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, Ran Bi <ran.bi@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Mark Brown <broonie@kernel.org>
In-Reply-To: <1611314381-19517-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1611314381-19517-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1611314381-19517-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 4/8] dt-bindings: regulator: Add document for MT6359 regulator
Date:   Fri, 22 Jan 2021 08:00:45 -0600
Message-Id: <1611324045.710845.674376.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 22 Jan 2021 19:19:37 +0800, Hsin-Hsiung Wang wrote:
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

See https://patchwork.ozlabs.org/patch/1430288

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

