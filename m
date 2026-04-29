Return-Path: <linux-rtc+bounces-6453-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDCnGCUK8mlXnAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6453-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Apr 2026 15:39:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE398494FAE
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Apr 2026 15:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1CC33006B1E
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Apr 2026 13:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58A33FCB2B;
	Wed, 29 Apr 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Xp3Eqw6D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20223F2101;
	Wed, 29 Apr 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468917; cv=none; b=YoaTuUPAGDbzFsuRGL4jEvQ/rqbEq9QZ9OC8hYFQdZSD46Pq2X3wafNy3Pj+oVJlm4gTCGx3jtzU1/jIs/Tyjy4z1Dr+gnXXCJMaWCqltz75LMVhpNFnvszfAXmxSMwrtlbgSS7oJg98xw+xAkrxhlDDQ8JSE9YxXPgCABU3hcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468917; c=relaxed/simple;
	bh=B+6vl6C/OV8+WpB8aWQtmkHIycQOFdlFNDQexZH3THM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=rAIbZqnXjGPjTZ+Z2qhm/mDQM2yGlS4NuLTKC1G/TDe2mAUAJZHC9l9ePmAjw8dZlDfN48dv6KVrg4c7cd9PuEsZxZzGMdnw6hciKkovlJQjLCvmSnOVwN37Qb6WylzeL6KWIiWUsFEQr6O8H8moDeVpRoY9MqEk3dO+iL4Q3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Xp3Eqw6D; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 570F826949;
	Wed, 29 Apr 2026 15:12:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS3R83mpiQhH; Wed, 29 Apr 2026 15:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1777468354; bh=B+6vl6C/OV8+WpB8aWQtmkHIycQOFdlFNDQexZH3THM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Xp3Eqw6D2wdfqkrqtCXEGKpQarouGLQmdkkzDYQtDCU/Eg/HT8Nj2CKamRCYfW4N9
	 PsmGt3/ne5sI9irdB8JmCGwilYHpUuT1zscLbLG5cq8DEh5BcnprzsHralTLVnJfzv
	 yFigbtB3HB9/C79K8sFT/CsY6VriNOV2z81aoXp8XNy0A0L8FeKQ030/TaLKEhsUfv
	 BQ10L9CBl3tIMVZ4YzSC5B0+S5NHamXeHPl+1TuV4cGAnERslQRq+sEpnG/ktD07/B
	 wcihld4J9ADvSRNyVE0KU3qU//zC69p243KukM5aqOZofDt8MqloZncA5Y5wCQZEzW
	 PXfPHLRbAswyw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 18:42:14 +0530
Message-Id: <DI5NXS3PQ53R.L9JZEBHW5EGI@disroot.org>
Subject: Re: [PATCH v5 03/11] dt-bindings: mfd: add documentation for
 S2MU005 PMIC
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "MyungJoo Ham"
 <myungjoo.ham@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Sebastian Reichel" <sre@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-3-fcbc9da5a004@disroot.org>
 <20260428-fortunate-olive-asp-fe4f53@quoll>
In-Reply-To: <20260428-fortunate-olive-asp-fe4f53@quoll>
X-Rspamd-Queue-Id: EE398494FAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6453-lists,linux-rtc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[disroot.org,reject];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[disroot.org:s=mail];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[disroot.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.996];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]

Hi Krzysztof,

This are no review comments here. Did you happen to miss anything?

On 2026-04-28 08:01 +02:00, Krzysztof Kozlowski wrote:
> On Fri, Apr 24, 2026 at 01:09:02AM +0530, Kaustabh Chakraborty wrote:
>> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
>> USB Interface Controller), and flash and RGB LED controllers.
>>=20
>> Add the compatible and documentation for the S2MU005 PMIC. Also, add an
>> example for nodes for supported sub-devices, i.e. MUIC, flash LEDs, and
>> RGB LEDs. Charger sub-device uses the node of the parent.
>>=20
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 ++++++++++++++=
+++++++
>>  1 file changed, 120 insertions(+)
> \r>=20
>> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.=
yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
>> new file mode 100644
>> index 0000000000000..0e6afb7d2017b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/samsung,s2mu005-pmic.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung S2MU005 Power Management IC
>> +
>> +maintainers:
>> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
>> +
>> +description: |
>> +  The S2MU005 is a companion power management IC which includes subdevi=
ces for
>> +  a charger controller, an MUIC (Micro USB Interface Controller), and f=
lash and
>> +  RGB LED controllers.
>> +
>> +allOf:
>> +  - $ref: /schemas/power/supply/power-supply.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,s2mu005-pmic
>> +
>> +  flash:
>> +    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
>> +    description:
>> +      Child node describing flash LEDs.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  muic:
>> +    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
>> +    description:
>> +      Child node describing MUIC device.
>> +
>> +  multi-led:
>> +    type: object
>> +
>> +    allOf:
>> +      - $ref: /schemas/leds/leds-class-multicolor.yaml#
>> +
>> +    properties:
>> +      compatible:
>> +        const: samsung,s2mu005-rgb
>> +
>> +    required:
>> +      - compatible
>> +
>> +    unevaluatedProperties: false
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/leds/common.h>
>> +
>> +    i2c {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +
>> +        pmic@3d {
>> +            compatible =3D "samsung,s2mu005-pmic";
>> +            reg =3D <0x3d>;
>> +            interrupt-parent =3D <&gpa2>;
>> +            interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +            monitored-battery =3D <&battery>;
>> +
>> +            flash {
>> +                compatible =3D "samsung,s2mu005-flash";
>> +                #address-cells =3D <1>;
>> +                #size-cells =3D <0>;
>> +
>> +                led@0 {
>> +                    reg =3D <0>;
>> +                    color =3D <LED_COLOR_ID_WHITE>;
>> +                    function =3D LED_FUNCTION_FLASH;
>> +                };
>> +
>> +                led@1 {
>> +                    reg =3D <1>;
>> +                    color =3D <LED_COLOR_ID_WHITE>;
>> +                    function =3D LED_FUNCTION_FLASH;
>> +                    function-enumerator =3D <1>;
>> +                };
>> +            };
>> +
>> +            muic {
>> +                compatible =3D "samsung,s2mu005-muic";
>> +
>> +                connector {
>> +                    compatible =3D "usb-b-connector";
>> +                    label =3D "micro-USB";
>> +                    type =3D "micro";
>> +                };
>> +
>> +                port {
>> +                    muic_to_usb: endpoint {
>> +                        remote-endpoint =3D <&usb_to_muic>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            multi-led {
>> +                compatible =3D "samsung,s2mu005-rgb";
>> +                color =3D <LED_COLOR_ID_RGB>;
>> +                function =3D LED_FUNCTION_INDICATOR;
>> +                linux,default-trigger =3D "pattern";
>> +            };
>> +        };
>> +    };
>>=20
>> --=20
>> 2.53.0
>>=20

