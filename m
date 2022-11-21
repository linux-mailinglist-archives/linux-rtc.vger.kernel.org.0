Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924B463201B
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 12:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbiKULPT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 06:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiKULOs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 06:14:48 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CF4BFF5D;
        Mon, 21 Nov 2022 03:10:19 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4469B24000A;
        Mon, 21 Nov 2022 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669029016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0V3BT3i84GCuHk3TZVqmgN6hIht44N4eJS27s3atJzM=;
        b=YW9n+3hUytDeKEyjSjitDNFS6llqxWN0l9nOBJEl9MEfI2K9D1m2EdPGediKdfoRh0Omim
        IsJnL3CAu6Kf/I0LyyVa6XXwZLQ1in/Gr3lTHY4va1hTSW+Sh8yf/vE1qXO2UHCH1oSQ2y
        o3vfrGXbGUjsaJAHSDV+24KEnJyMd5oMpefXamtqYWt7fXL0LRxVYat5wAFFIQfxepiIKL
        y1qdJBpq5NSBrCsFbrAuBRkh85j5BYVW1HRFXxh8LwXidTO+9SuzeZfAmlHPniz5ACiVbc
        +VUOq9v4UmRn/4+MuC0l9h1H3bvMlBJWp+vrRNgQTscbfjO5d1kKJ84einG9zA==
Date:   Mon, 21 Nov 2022 12:10:03 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Message-ID: <Y3tcix7xpgQ+kt9a@mail.local>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <Y3tEnxqWy6HCkpOd@mail.local>
 <AS8PR04MB8642503BF1172B707CB9F394870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8642503BF1172B707CB9F394870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2022 10:33:15+0000, Jacky Bai wrote:
> > Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
> > bbnsm
> > 
> > On 21/11/2022 10:09:40+0100, Krzysztof Kozlowski wrote:
> > > On 21/11/2022 07:51, Jacky Bai wrote:
> > > > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> > > >
> > > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103
> > ++++++++++++++++++
> > > >  1 file changed, 103 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 
> ...
> 
> > > > +
> > > > +title: NXP Battery-Backed Non-Secure Module bindings
> > > > +
> > > > +maintainers:
> > > > +  - Jacky Bai <ping.bai@nxp.com>
> > > > +
> > > > +description: |
> > > > +  NXP BBNSM serves as non-volatile logic and storage for the system.
> > > > +  it Intergrates RTC & ON/OFF control.
> > > > +  The RTC can retain its state and continues counting even when the
> > > > +  main chip is power down. A time alarm is generated once the most
> > > > +  significant 32 bits of the real-time counter match the value in
> > > > +the
> > > > +  Time Alarm register.
> > > > +  The ON/OFF logic inside the BBNSM allows for connecting directly
> > > > +to
> > > > +  a PMIC or other voltage regulator device. both smart PMIC mode
> > > > +and
> > > > +  Dumb PMIC mode supported.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - nxp,bbnsm
> > > > +      - const: syscon
> > > > +      - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  rtc:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: nxp,bbnsm-rtc
> > >
> > >
> > > Missing ref to rtc.yaml.
> > >
> > 
> > This is also missing start-year
> 
> The RTC counter will be reset to 0 after PoR reset, do we still need to add
> this property?
> 

Is this really an RTC then?

> BR
> > 
> > > > +
> > > > +      regmap:
> > >
> > > Use vendor prefix, descriptive name and description. Where is the type
> > > of 'regmap' defined?
> > >
> > > > +        maxItems: 1
> > >
> > > I don't think this is correct. Rob explained the simple-mfd means
> > > children do not depend on anything from the parent, but taking a
> > > regmap from its parent contradicts it.
> > >
> > > > +
> > > > +      interrupts:
> > > > +        maxItems: 1
> > >
> > > You have same interrupt and same address space used by two devices.
> > >
> > > Both arguments (depending on parent regmap, sharing interrupt)
> > > suggests that this is one device block, so describing it with
> > > simple-mfd is quite unflexible.
> > >
> > > > +
> > > > +    required:
> > > > +      - compatible
> > > > +      - regmap
> > > > +      - interrupts
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > > +  pwrkey:
> > > > +    type: object
> > > > +    $ref: /schemas/input/input.yaml#
> > > > +
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: nxp,bbnsm-pwrkey
> > > > +
> > > > +      regmap:
> > > > +        maxItems: 1
> > > > +
> > > > +      interrupts:
> > > > +        maxItems: 1
> > > > +
> > > > +      linux,code: true
> > > > +
> > > > +    required:
> > > > +      - compatible
> > > > +      - regmap
> > > > +      - interrupts
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - rtc
> > > > +  - pwrkey
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    bbnsm: bbnsm@44440000 {
> > > > +      compatible = "nxp,bbnsm", "syscon", "simple-mfd";
> > > > +      reg = <0x44440000 0x10000>;
> > > > +
> > > > +      bbnsm_rtc: rtc {
> > > > +        compatible = "nxp,bbnsm-rtc";
> > >
> > > Use 4 spaces for example indentation.
> > >
> > > > +        regmap = <&bbnsm>;
> > > > +        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > > +      };
> > > > +
> > > > +      bbnsm_pwrkey: pwrkey {
> > > > +         compatible = "nxp,bbnsm-pwrkey";
> > > > +         regmap = <&bbnsm>;
> > > > +         interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > > +         linux,code = <KEY_POWER>;
> > > > +       };
> > > > +    };
> > >
> > > Best regards,
> > > Krzysztof
> > >
> > 
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> > engineering
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin
> > .com%2F&amp;data=05%7C01%7Cping.bai%40nxp.com%7Cd188bbb7b6ec40
> > 5c481f08dacba2af8b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> > 7C638046196834682924%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> > wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> > C%7C&amp;sdata=L%2FTZNaG01NTrKvbKwz9%2FNFEFQ6JqdnsOIzUydww1D
> > ZU%3D&amp;reserved=0



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
