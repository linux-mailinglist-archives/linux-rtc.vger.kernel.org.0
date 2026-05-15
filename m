Return-Path: <linux-rtc+bounces-6521-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MPkAxyMB2oI8AIAu9opvQ
	(envelope-from <linux-rtc+bounces-6521-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:11:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 578A4557AA1
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74A76300638E
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165033EC2FF;
	Fri, 15 May 2026 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UqsszUUE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5DB487BE;
	Fri, 15 May 2026 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879513; cv=none; b=YS6sdghOuWbpZdAMcT+99hCzYI7rtjpRvXQTJAw3Y/J5PwNivdNJeCp5A4/uPCMiVKxwjLjfELwr7NggWb/6nvR8SwJZAbrAGM1vkd+NRCnMB30j+4C2/w8gTe4eYu4q/+DDJziIe32eWcwuin11PyzEsHmwLhZI4EJdA/iyEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879513; c=relaxed/simple;
	bh=NW9PHikwJQ3ZtX3oBjSMWYnrqk7Wju8+GpkDo/Fz3u8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FsoZFbTQ2hu5FJ0QCTvagHVVrVfuMhMGb0oCBOnfOI057s/qAk6SRO6+oFpRrRkeuIiEL0c+Fohde1MODWLNaMstsEk+KOR5r04cnXYj7Rf6c4mNoC80zBdGHge/juyhP/3BjgwmHvhyavLyCFx2OoLmarX5nypF/8MVlUtm/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UqsszUUE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C93BB27249;
	Fri, 15 May 2026 23:11:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHfTVjZ0KNoU; Fri, 15 May 2026 23:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778879508; bh=NW9PHikwJQ3ZtX3oBjSMWYnrqk7Wju8+GpkDo/Fz3u8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=UqsszUUEXaXyvllsI8NE9KleLkIwLZwQ6d7IpoMs2tX2Vbf5NfvDiJd2h2d3JwVYl
	 VYWYoXpLXHjQoB9gYu3lv9tlRl/VBD6RtZjpQv2YZN8Au89o4xRt5B/ahf+Nvblh5E
	 rWmPU48hSf49bXn082NXVLrIiK0D/Za+5APDWzh8hEKMTrgYt1rJAyM2HkExBy6zuw
	 Z1HVe/aTfnq57aco1VoGFhVLhEP/egzTu1MyBKVx7qy5e6U3ifOYEKO1hO+BEMb+hg
	 /C3fV9CEoQe5A9n2Ldn1jOQzZCecbB9KQTzujFmQv93fOiMNjMkEoEqHR+UKpvZXgV
	 zRzwErxLj5DPQ==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 02:41:29 +0530
Message-Id: <DIJK5FTQ5KWG.HOKZAOXHTGU7@disroot.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "MyungJoo Ham"
 <myungjoo.ham@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Sebastian Reichel" <sre@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 03/11] dt-bindings: mfd: add documentation for
 S2MU005 PMIC
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Conor Dooley" <conor@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
 <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
 <20260515-justly-recite-6028f4bfb24a@spud>
In-Reply-To: <20260515-justly-recite-6028f4bfb24a@spud>
X-Rspamd-Queue-Id: 578A4557AA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6521-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,disroot.org:email,disroot.org:mid,disroot.org:dkim,devicetree.org:url]
X-Rspamd-Action: no action

On 2026-05-15 18:14 +01:00, Conor Dooley wrote:
> On Fri, May 15, 2026 at 04:08:59PM +0530, Kaustabh Chakraborty wrote:
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
>>=20
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
>
> Does this need to be an allOf when the other refs are not?

It has it's own properties, that's the reason. This used to be it's own
thing in dt-bindings/leds, but I was asked to move it here in prior
reviews.

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
>
> Move this above the child nodes please.

But properties are sorted in lex order?

> Otherwise, I think this looks good.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
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


