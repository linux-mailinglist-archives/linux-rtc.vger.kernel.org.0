Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B34729BEA
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 15:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbjFINsi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 09:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjFINsi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 09:48:38 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC09618D;
        Fri,  9 Jun 2023 06:48:34 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686318513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=npC0QwBl+sGQILNrK9Ub6UUGbnJ8Kwbu7xqAfblYooA=;
        b=RJGJHFIjnpN4vyibrYqh8k7eu1k1u8Mf2czV3iA+HRsakBmdqlRSTFbHtUTPxuya0+V6DS
        lXU63u+WQkxy2l2jtQkGl1YL4eYGKbL/QnNTnrBFZa/zbo1RnvCO5aAk13UIfOjkhAs2De
        RpB2aObHUL2PrZeGIToMK8XvTVbwWaRTSrJ5SigXUlrNVbFHSoZ2J6yUHW9b7wxKCWCDj5
        9YLy+jGj/lSIL88KP3JvvFMxt2iDy+qSHCp2Y1hS1oaTj6R+HhOSLUo/cia/L/UpoLP0PH
        MIMK6tnp02X78DuhDwgPzc3U6FOd9kfHlPJjxrnCP2ekW8TaoGcN26Vpt1emNQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E8DE4000F;
        Fri,  9 Jun 2023 13:48:31 +0000 (UTC)
Date:   Fri, 9 Jun 2023 15:48:31 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to
 json-schema
Message-ID: <202306091348319ef75d62@mail.local>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592217A7291027A7C27C17268651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592217A7291027A7C27C17268651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 09/06/2023 06:42:59+0000, Biju Das wrote:
> Hi Alexandre Belloni,
> 
> Is it ok, if I send isl1208 driver enhancement patches patch#5 to patch#10,
> as it has no dependencies?
> 

I was still waiting on a review from the DT maintainers on 6/11 to apply
the series.

> Patch#11 will send later based on the discussion [1]
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230602142426.438375-2-biju.das.jz@bp.renesas.com/
> 
> Cheers,
> Biju
> 
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Friday, June 2, 2023 3:24 PM
> > To: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Rob Herring <robh+dt@kernel.org>;
> > Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> > <conor+dt@kernel.org>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>; Trent Piepho
> > <tpiepho@gmail.com>; linux-rtc@vger.kernel.org;
> > devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> > Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> > soc@vger.kernel.org; Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Subject: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to json-
> > schema
> > 
> > Convert the isl1208 RTC device tree binding documentation to json-schema.
> > 
> > Update the example to match reality.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > v5->v6:
> >  * No change
> > v4_new->v5:
> >  * No change.
> > v4->v4_new:
> >  * Moved this patch to PMIC series
> >  * Added minItems to interrupt-names.
> >  * Added interrupt-names in conditional schema check.
> > v3->v4:
> >  * Added Rb tag from Krzysztof Kozlowski.
> >  * Dropped | from description
> >  * Replaced the pin name #EVDET->EVDET in description.
> >  * Dropped oneOf from compatible.
> > v2->v3:
> >  * Updated interrupt-names property by keeping the list of names.
> >  * Removed Interrupts from required property as it may not be wired.
> >  * Removed isil,ev-evienb from required property.
> > RFC->v2:
> >  * Updated maintainers list
> >  * Updated description from original bindings
> >  * removed default from isil,ev-evienb properties to match with the
> > original
> >    bindings.
> >  * Added conditional check for interrupts.
> > ---
> >  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 --------
> > .../devicetree/bindings/rtc/isil,isl1208.yaml | 89 +++++++++++++++++++
> >  2 files changed, 89 insertions(+), 38 deletions(-)  delete mode 100644
> > Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > deleted file mode 100644
> > index 51f003006f04..000000000000
> > --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > -
> > -ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while
> > the
> > -ISL1208 and ISL1218 do not.  They are all use the same driver with the
> > bindings -described here, with chip specific properties as noted.
> > -
> > -Required properties supported by the device:
> > - - "compatible": Should be one of the following:
> > -		- "isil,isl1208"
> > -		- "isil,isl1209"
> > -		- "isil,isl1218"
> > -		- "isil,isl1219"
> > - - "reg": I2C bus address of the device
> > -
> > -Optional properties:
> > - - "interrupt-names": list which may contains "irq" and "evdet"
> > -	evdet applies to isl1209 and isl1219 only
> > - - "interrupts": list of interrupts for "irq" and "evdet"
> > -	evdet applies to isl1209 and isl1219 only
> > - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> > -	Applies to isl1209 and isl1219 only
> > -	Possible values are 0 and 1
> > -	Value 0 enables internal pull-up on evin pin, 1 disables it.
> > -	Default will leave the non-volatile configuration of the pullup
> > -	as is.
> > -
> > -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and
> > #EVDET pin -connected to SoC gpio2 pin 24 and internal pull-up enabled in
> > EVIN pin.
> > -
> > -	isl1219: rtc@68 {
> > -		compatible = "isil,isl1219";
> > -		reg = <0x68>;
> > -		interrupt-names = "irq", "evdet";
> > -		interrupts-extended = <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> > -			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> > -		isil,ev-evienb = <1>;
> > -	};
> > -
> > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > new file mode 100644
> > index 000000000000..565965147ce6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevice
> > +tree.org%2Fschemas%2Frtc%2Fisil%2Cisl1208.yaml%23&data=05%7C01%7Cbiju.d
> > +as.jz%40bp.renesas.com%7C6425b765422a4c478a9b08db63752444%7C53d82571da1
> > +947e49cb4625a166a4a2a%7C0%7C0%7C638213126986073790%7CUnknown%7CTWFpbGZs
> > +b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > +7C3000%7C%7C%7C&sdata=MWVlU9PbKqZwsoKfLM595a%2BM8kNNScTer6VApvxwlPY%3D&
> > +reserved=0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevice
> > +tree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C01%7Cbiju.das.jz%40bp.
> > +renesas.com%7C6425b765422a4c478a9b08db63752444%7C53d82571da1947e49cb462
> > +5a166a4a2a%7C0%7C0%7C638213126986073790%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> > +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> > +C%7C&sdata=xq1qpnrXLjjAr06kMBWUSRqJcY5leluI3JR%2BPZ%2FoU%2F8%3D&reserve
> > +d=0
> > +
> > +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +  - Trent Piepho <tpiepho@gmail.com>
> > +
> > +description:
> > +  ISL12X9 have additional pins EVIN and EVDET for tamper detection,
> > +while the
> > +  ISL1208 and ISL1218 do not.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - isil,isl1208
> > +      - isil,isl1209
> > +      - isil,isl1218
> > +      - isil,isl1219
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - const: irq
> > +      - const: evdet
> > +
> > +  isil,ev-evienb:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description: |
> > +      Enable or disable internal pull on EVIN pin
> > +      Default will leave the non-volatile configuration of the pullup
> > +      as is.
> > +        <0> : Enables internal pull-up on evin pin
> > +        <1> : Disables internal pull-up on evin pin
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - isil,isl1209
> > +              - isil,isl1219
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 2
> > +        interrupt-names:
> > +          items:
> > +            - const: irq
> > +            - const: evdet
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 1
> > +        interrupt-names:
> > +          items:
> > +            - const: irq
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        rtc_twi: rtc@6f {
> > +            compatible = "isil,isl1208";
> > +            reg = <0x6f>;
> > +        };
> > +    };
> > --
> > 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
