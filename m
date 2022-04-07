Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9234F7B7B
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Apr 2022 11:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiDGJXn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Apr 2022 05:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243912AbiDGJXc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Apr 2022 05:23:32 -0400
X-Greylist: delayed 138847 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 02:21:29 PDT
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E9B176659;
        Thu,  7 Apr 2022 02:21:28 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9A21DC0005;
        Thu,  7 Apr 2022 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649323286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ovt995Vz+TKYIu2nKkb+/jaggU7Fdt/74L9w/t6FZTQ=;
        b=EZt+u37SQDG+9nMmzmDtiw13PSpBGAclDEGCvXaHchYpOpByVGUl8CKehpHWzkn7DJSd7X
        aObsbLj0jO072kwKE1K7+2MmTeQ3wPkBBKnLL6DhN465yh1CRVKOGm1K29OWABIkXxOdg/
        SbmRkkYjTBb5Gv9MciFpGN6ap89l7fOrv7DfuSODYCn7nagx+2qeK8bM4YwkgbHMAlsUIX
        lZIzDWDYHRaGhNNL7Jkj9JbZU+uVZprD4RK+XgByZtxDH/bZ8RqX91BphqN5mTW43N3x8N
        O6y4KrdAEdZFalz+lT3ATKvCi75/FvxE6MqlG080zgluJZQ7RfNUZC7yOFf6Tg==
Date:   Thu, 7 Apr 2022 11:21:22 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
Message-ID: <20220407112122.11321834@xps13>
In-Reply-To: <bdaad2e0-6662-c6aa-974a-326dd513282f@linaro.org>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
        <20220405184716.1578385-2-miquel.raynal@bootlin.com>
        <bdaad2e0-6662-c6aa-974a-326dd513282f@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Thu, 7 Apr 2022 09:37:39 +0200:

> On 05/04/2022 20:47, Miquel Raynal wrote:
> > Add new binding file for this RTC.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../bindings/rtc/renesas,rzn1-rtc.yaml        | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-=
rtc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yam=
l b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> > new file mode 100644
> > index 000000000000..903f0cd361fa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/renesas,rzn1-rtc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/N1 SoCs Real-Time Clock DT bindings
> > +
> > +maintainers:
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf: =20
>=20
> Why oneOf?

Right, copy-paste leftover.

>=20
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a06g032-rtc
> > +          - const: renesas,rzn1-rtc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: alarm
> > +      - const: timer
> > +      - const: pps
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: hclk
> > +
> > +  start-year: true =20
>=20
> You don't need this, it's coming from rtc.yaml.

Right.

Thanks,
Miqu=C3=A8l
