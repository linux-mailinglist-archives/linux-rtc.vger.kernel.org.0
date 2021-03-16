Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62E433E07C
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 22:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhCPV2e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 17:28:34 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:32797 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhCPV2F (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 17:28:05 -0400
Received: by mail-il1-f181.google.com with SMTP id r7so14126821ilb.0;
        Tue, 16 Mar 2021 14:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tzti3nZ5OVXP9WgoynfjNjMUKwMHz9t/vD1IxL1SSSc=;
        b=gyXb+zvN1v9W6iCTzLkVRl+9JCZ0o4h+fni0vyGBn+Uo8TzSZDiFMJJkiKGw0ykO8o
         t2hSdu0HFaBP2V36sfA9GE7Fqrf3YklNt/NeM9+oIJg6X9JFFVZlMotyHIJscAhiku13
         3TkJNADG06KLSheyM4dk8GreIUVcNC7vZl7w9YjR2KdH+epslxw4uaYCEVfbmQbEFN+i
         sBLS30JcAauUbdXqWe5eMdP9+nBK/5Jky2RReT0jqBf1AjsmzDJeh1tYvqOKqTOuNZDx
         1dZCVdey5YKT9jXNwYF2Dsmi6vUcSelR0eTLmw84CQJAXN4m2PfAJQ498NH1YysIKE20
         XkHw==
X-Gm-Message-State: AOAM532FZdl4rU4u3ODKSR7PbJAzBwHzUQRugoBoCxwl0P6hvnD+o9Ij
        iDI8f95hRja4ElW5zQMF+TgpU+C9SQ==
X-Google-Smtp-Source: ABdhPJxY8+fVLTfIGuoc9fCv1z8mKXCoP5VTFpupsMgdcpP5gtmUCJnseEQrTQKyhfFn/+d1wMBEgQ==
X-Received: by 2002:a92:d80f:: with SMTP id y15mr5057931ilm.96.1615930084738;
        Tue, 16 Mar 2021 14:28:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y6sm10031777ily.50.2021.03.16.14.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 14:28:04 -0700 (PDT)
Received: (nullmailer pid 3697863 invoked by uid 1000);
        Tue, 16 Mar 2021 21:28:02 -0000
Date:   Tue, 16 Mar 2021 15:28:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20210316212802.GA3670080@robh.at.kernel.org>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 16, 2021 at 01:35:53AM +0800, Hsin-Hsiung Wang wrote:
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
> diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> new file mode 100644
> index 000000000000..62ff93eefd39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mt6359-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6359 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |
> +  List of regulators provided by this controller. It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6359 regulators node should be sub node of the MT6397 MFD node.
> +
> +properties:
> +  $nodename:
> +    pattern: "^pmic$"

The errors are because this schema will be applied to every 'pmic' node.

> +
> +  mt6359regulator:

The node name here should be just 'regulators', but that should be in 
the MFD schema and you should remove this level here. So the MFD would 
have:

properties:
  regulators:
    type: object
    $ref: schemas/regulator/mt6359-regulator.yaml#

> +    type: object
> +    description:
> +      list of regulators provided by this controller.
> +
> +    patternProperties:

And this should be at the top level of this doc.

> +      "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(fe|bif|io)28$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(fe|bif|io)28$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(aud|io|aux|rf|m)18$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(aud|io|aux|rf|m)18$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_vsim[12]$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsim[12]$"
> +
> +        required:
> +          - regulator-name
> +
> +        unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      mt6359regulator {

I prefer to see a single complete example in the MFD schema rather than 
piecemeal schemas in each sub schema.

> +        mt6359_vgpu11_buck_reg: buck_vgpu11 {
> +          regulator-name = "vgpu11";
> +          regulator-min-microvolt = <400000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <200>;
> +          regulator-always-on;
> +          regulator-allowed-modes = <0 1 2>;
> +        };
> +
> +        mt6359_vcamio_ldo_reg: ldo_vcamio {
> +          regulator-name = "vcamio";
> +          regulator-min-microvolt = <1700000>;
> +          regulator-max-microvolt = <1900000>;
> +        };
> +
> +        mt6359_vcn18_ldo_reg: ldo_vcn18 {
> +          regulator-name = "vcn18";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <1800000>;
> +          regulator-enable-ramp-delay = <240>;
> +        };
> +
> +        mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
> +          regulator-name = "vsram_proc2";
> +          regulator-min-microvolt = <500000>;
> +          regulator-max-microvolt = <1293750>;
> +          regulator-ramp-delay = <7500>;
> +          regulator-enable-ramp-delay = <240>;
> +          regulator-always-on;
> +        };
> +
> +        mt6359_vfe28_ldo_reg: ldo_vfe28 {
> +          regulator-name = "vfe28";
> +          regulator-min-microvolt = <2800000>;
> +          regulator-max-microvolt = <2800000>;
> +          regulator-enable-ramp-delay = <120>;
> +        };
> +
> +        mt6359_vaud18_ldo_reg: ldo_vaud18 {
> +          regulator-name = "vaud18";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <1800000>;
> +          regulator-enable-ramp-delay = <240>;
> +        };
> +
> +        mt6359_vsim1_ldo_reg: ldo_vsim1 {
> +          regulator-name = "vsim1";
> +          regulator-min-microvolt = <1700000>;
> +          regulator-max-microvolt = <3100000>;
> +          regulator-enable-ramp-delay = <480>;
> +        };
> +      };
> +    };
> +...
> -- 
> 2.18.0
> 
