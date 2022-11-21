Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51000631CD4
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 10:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbiKUJ2H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 04:28:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiKUJ2G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 04:28:06 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFE724976;
        Mon, 21 Nov 2022 01:28:02 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9D9EDE0002;
        Mon, 21 Nov 2022 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669022881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V7viAY5AnyzdDmkRQxymcAJLutcCIIh5S3qm0qHRPSg=;
        b=nbZkOuBTCQqvUfDnkR/u+PfVggCYdve0oxR2Q7yG+P2sKOeKGj9ouz7QEKsxukXZdT8IYa
        SeG8n2ndvewGJbRZ2OlR0x+nBxxNudd+yvb0Pu1EBaBF7F7VvEb2y/AIThfE8zqWzBwYSp
        Se4yom1awPe3Am2AMikNRK+JJCjO5Naiygggj3yx3efiYZAG1EdYC69WqeQAzeRxRtdwyj
        wrr2KZkqNtf5+GUnE8yxHR9b2qeHJ5cuUZijdRmhSrw/gwuO9WPz3XhL4LWrQQ6VC3XacB
        SMoJRT3TB0l36c7Np75b3K8vhDwABtefF4RRfL8cMyEjSXqUNlWdC5TYEyRkwQ==
Date:   Mon, 21 Nov 2022 10:27:59 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jacky Bai <ping.bai@nxp.com>, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Message-ID: <Y3tEnxqWy6HCkpOd@mail.local>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2022 10:09:40+0100, Krzysztof Kozlowski wrote:
> On 21/11/2022 07:51, Jacky Bai wrote:
> > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> > 
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103 ++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> > new file mode 100644
> > index 000000000000..b3f22b0daea6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/nxp,bbnsm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Battery-Backed Non-Secure Module bindings
> > +
> > +maintainers:
> > +  - Jacky Bai <ping.bai@nxp.com>
> > +
> > +description: |
> > +  NXP BBNSM serves as non-volatile logic and storage for the system.
> > +  it Intergrates RTC & ON/OFF control.
> > +  The RTC can retain its state and continues counting even when the
> > +  main chip is power down. A time alarm is generated once the most
> > +  significant 32 bits of the real-time counter match the value in the
> > +  Time Alarm register.
> > +  The ON/OFF logic inside the BBNSM allows for connecting directly to
> > +  a PMIC or other voltage regulator device. both smart PMIC mode and
> > +  Dumb PMIC mode supported.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nxp,bbnsm
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  rtc:
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,bbnsm-rtc
> 
> 
> Missing ref to rtc.yaml.
> 

This is also missing start-year

> > +
> > +      regmap:
> 
> Use vendor prefix, descriptive name and description. Where is the type
> of 'regmap' defined?
> 
> > +        maxItems: 1
> 
> I don't think this is correct. Rob explained the simple-mfd means
> children do not depend on anything from the parent, but taking a regmap
> from its parent contradicts it.
> 
> > +
> > +      interrupts:
> > +        maxItems: 1
> 
> You have same interrupt and same address space used by two devices.
> 
> Both arguments (depending on parent regmap, sharing interrupt) suggests
> that this is one device block, so describing it with simple-mfd is quite
> unflexible.
> 
> > +
> > +    required:
> > +      - compatible
> > +      - regmap
> > +      - interrupts
> > +
> > +    additionalProperties: false
> > +
> > +  pwrkey:
> > +    type: object
> > +    $ref: /schemas/input/input.yaml#
> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,bbnsm-pwrkey
> > +
> > +      regmap:
> > +        maxItems: 1
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      linux,code: true
> > +
> > +    required:
> > +      - compatible
> > +      - regmap
> > +      - interrupts
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - rtc
> > +  - pwrkey
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    bbnsm: bbnsm@44440000 {
> > +      compatible = "nxp,bbnsm", "syscon", "simple-mfd";
> > +      reg = <0x44440000 0x10000>;
> > +
> > +      bbnsm_rtc: rtc {
> > +        compatible = "nxp,bbnsm-rtc";
> 
> Use 4 spaces for example indentation.
> 
> > +        regmap = <&bbnsm>;
> > +        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +      };
> > +
> > +      bbnsm_pwrkey: pwrkey {
> > +         compatible = "nxp,bbnsm-pwrkey";
> > +         regmap = <&bbnsm>;
> > +         interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +         linux,code = <KEY_POWER>;
> > +       };
> > +    };
> 
> Best regards,
> Krzysztof
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
