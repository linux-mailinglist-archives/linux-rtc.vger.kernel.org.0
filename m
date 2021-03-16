Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2179633DB8E
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 18:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239339AbhCPRys (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 13:54:48 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:40318 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239355AbhCPRyQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 13:54:16 -0400
Received: by mail-io1-f48.google.com with SMTP id m7so19089735iow.7;
        Tue, 16 Mar 2021 10:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=dLqrm0/ef81kahZ3V++ylIOaNZ5Ioc1N/ut1Pv4L6zY=;
        b=oXZpZxn0wgFAGsArqo1T4A09w/luI2rY9rchZ/UPweUccx+tIbemMMFi3l45E1aTf4
         elD+rq4JhBsMvysbLbU2/JdDTp2GwTm575Qha+lsxvz1UQYMCSxmIg8BtjvFZ0Rdx/Sl
         W1RYBkZwXjQB3tv2cp56QRme6ffTsKew2PBflVNa+t8TvyUxiQVYouOpLsbD78KqYlIM
         oykRO5gNt0D9/dJ76rG3CHaD0dArwvCS1huuWZiwE2GT5BI/D9YAuuwsK5yCKBdZ3Er5
         uNVoHjPIfLI1gm6RbSTiYfGtlr2XdMu8rA0E79BnNaoRXKD8BCJ03S//xfPsXBXbaa9s
         4Ncg==
X-Gm-Message-State: AOAM533KpYzv453hwWHlejRtGBO4OfvX8xGOdULQyCDrZFaRibKMaAjf
        qo44AZJR8njuQ/xlDk4d/Vcl22JgLA==
X-Google-Smtp-Source: ABdhPJz58cXYFwH0LvTilPm7qZ6a5slbFtu1/fj+K0w3XsAGD6iFn2JuuIuNrYcXaGUAcy56rJF8Dg==
X-Received: by 2002:a6b:da0f:: with SMTP id x15mr4245698iob.181.1615917256171;
        Tue, 16 Mar 2021 10:54:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k4sm8804062ion.29.2021.03.16.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:54:15 -0700 (PDT)
Received: (nullmailer pid 3326123 invoked by uid 1000);
        Tue, 16 Mar 2021 17:54:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        Sean Wang <sean.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        srv_heupstream@mediatek.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, Ran Bi <ran.bi@mediatek.com>
In-Reply-To: <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v6 4/8] dt-bindings: regulator: Add document for MT6359 regulator
Date:   Tue, 16 Mar 2021 11:54:09 -0600
Message-Id: <1615917249.235463.3326122.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 16 Mar 2021 01:35:53 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v5:
> - no change.
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

See https://patchwork.ozlabs.org/patch/1453404

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

