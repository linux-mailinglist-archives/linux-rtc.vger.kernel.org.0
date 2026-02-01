Return-Path: <linux-rtc+bounces-5929-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKwBOVL6fmnlhgIAu9opvQ
	(envelope-from <linux-rtc+bounces-5929-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:01:38 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009EC50B2
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87171301484E
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Feb 2026 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402E62DC337;
	Sun,  1 Feb 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn9EfSA6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B251547EE
	for <linux-rtc@vger.kernel.org>; Sun,  1 Feb 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769929293; cv=pass; b=RROKb1SlRai36IR9SyDN4lAaPRZg6bB/+5wl7ieBz7296rtdbckFnOtvEryKtdFmJd3fCu4Lt6nNj5vzSaLN/RKHnEWKCJh+ni5i4+1V8G9F994GgfnjnY5CsfL56+G1Tm2UnBB5Alk2q/SFiftq2Ifj0fmt5gYXNAHLmtR8/+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769929293; c=relaxed/simple;
	bh=4lwxL+MX5lYgnvQjumgh4AurnaGrE32hCgCl0vhDOYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpFp6ZyxzFCCvTdhK0Z87DlkmdBjCwEUMcEa77iKq0BDYXj8+7e7BVEevh4B4d6VRVsNQHqOxSXAIKzyTkoIhbugmRZBk/xnLvO3Ihnhx6DQzTqsSN/0MiqjbK3gV1mlDTQxYcvYWA4MDrdPT/OM8p75a0PT24WfVOkMnQqu+fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn9EfSA6; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305882so2153454f8f.0
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 23:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769929290; cv=none;
        d=google.com; s=arc-20240605;
        b=h21dQ7BoWeLhker3SO2OG4kc65fjmmFNXRVDbZoJgnsOFXNpdDVaazJ4395IHkyhZV
         YRr2MveH+LEN57jw02SGufvU/IfM6vKnNGdJlxjoADnZkHaF8tQR6iMamwQPHwk2qGSq
         8sHje+Piixiew03/0FueBI7JxMOiXwIxRDU0wjXiRURTCVn5Wc+OghsXFVGRDXG+8evp
         NGBmR7c+fZxsil69fQSgq8jsyxkbPQqQw835ad/3Ze5kC1W+jkprd/613/RrIjIaAmmp
         ByvHpX+/CmyTrQtun7MYQS9BVZddIMNElOwwgtOkJkXVVcz0+QDFLo7SLQwQYr9UnkBj
         UYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ru6T+Kx+o+wF1O0sdT4WJIlvaSW/GAs5TSwcPEqdU2s=;
        fh=ttFeehncSYWBe6emLeJhgEcVeOWjUiXq4MuiYdIcoZk=;
        b=blEJIAlVBYhD4Hh5FlxHYm5zy7kuE7z2YjuojZkH07cP/T+hyzhwttaEfmDVBiUBXL
         KDD49LJq63mfoY8zphIOr9+yBD/IFIJj1dkWweXSKigyI0BmCX8ngOQT6vNKBMDZ+ZfB
         Yl/0igYSDWencQUv/yfi9u/yQmkeR9OqvzB3rFXlXuJIFQ+XXi7YA1NlCRFLwnyss3yM
         LRsIsstGIpVyiNvCjtmY99kMfOSjRKfCJ4JvIS4F2dGSK6cGLGtYQKA5Wr4z2IgMnU0J
         9tETrrDdte+BIPKOQzUdbN//V2n5Ovozi0L8GyUzBAZyiBYoS9evOIh6Xvu+1eHH5beg
         HE6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769929290; x=1770534090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru6T+Kx+o+wF1O0sdT4WJIlvaSW/GAs5TSwcPEqdU2s=;
        b=Jn9EfSA6fRuIVKLr4AaDLNSKBNL8pNLIzAn3ZvhMvVaTDKFsq+ipWeCMRNkekMrUgb
         A0Ln5mZ3LggiURzzV2WBXJxP6cuuWXb9TNIlrGVNUxwCIIaEem1gpptyrSPCZ5IlMDzt
         5fUbTS5GA6rBJL/oI1+pxmc1I/uBvhnJp+aO2sGBmNMcyl/Xyo7jAV9n5GbMdfk+o807
         NMKhRMYdWew37MtphMm6TqfcCIju0X+RKLvk8Vsd43Yo681J0zRY+sepZFOjGN7tkDRF
         PWC+YPRkx8zVPqfVGZwbFfwyirHPDJ+z/+3WyyRp0uY1XpuaRpWj7vuJVPrx6xv4dztz
         aa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769929290; x=1770534090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ru6T+Kx+o+wF1O0sdT4WJIlvaSW/GAs5TSwcPEqdU2s=;
        b=qk4uBf+a4wIP9Ul4t65ptgaAldyv8Se7CQ+uJ8I0/trvS3cylFs5PHQpjyLjGCPjKt
         QDmraDCHa4Pl3k//64j7wrPNZMhhPgF+e4vktmea+42fXaNF/XvB/pb3v4vX7aPbDRVq
         4fqNlBrKgL7m4IJQzWa7lsiQASLqfp7E5IP2//Xn6YrZ8o29nELoxwxKdOSRutzWhBrH
         Xu8q5XusYfqdIggs8GXvHNu12KCuWaW7RqOVDP9XSXW5TspBkuG2JyTBj7yAXh8JcK7u
         vYJSu6vfONxDJrOKydipC/Uux0QZAQ2ISfB+3/3tDqxA4P2vo5DZzitnK7j/I5+fRsib
         xXCg==
X-Forwarded-Encrypted: i=1; AJvYcCXTXAKgBxSBc1ox2dqOQk+PPi21/52DN6/n3WxrFPsJWUA5Xvvx3rARy1hKp9C7hCDWLRPlv4V+xk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIYS0OerAbd3/kG/gql1RodnrF1uEwa2SAtjGiV89/EihUiMA
	xVgIsZ3qnn3UppPdAIF+WEnjhIOmZRYdWVhPRgqIn639iAYVIA5hX5Crzvbmh2JNDv20eyYbzYI
	m2iSRVCmyDlJer9BPF+Ng1nyLQAQHqmM=
X-Gm-Gg: AZuq6aJgy0TX9T3U9xS6aGM00mJaTZsGs0mx80NhgufV4vaC37ggNTLqqH9dzn3zUQ1
	gpz94G0z2nMnTcUVM+wFd/yR5zM0EbIiPoF4ajnF17fOAGws02lUndn60raH+/V/US4BnKYn2qb
	8lHgKVSFozfQ+w+TZmwIDo8o2UYbOej/Wk/OoTNy/HL1CFpfhXx2y4nJ0I7sc8eR3W5A0nLu9sZ
	puoKol0FLsA4Xg3VcSzPrxPq1S/SqsdmYbxdm8OKHouR/m5ifNgNcNG0ksFi/Qfj9yXOCeh
X-Received: by 2002:a5d:5f54:0:b0:435:693e:c03e with SMTP id
 ffacd0b85a97d-435f3a7e60emr11130004f8f.19.1769929289499; Sat, 31 Jan 2026
 23:01:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-2-clamor95@gmail.com>
 <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
In-Reply-To: <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Feb 2026 09:01:18 +0200
X-Gm-Features: AZwV_QgtHi-_En-5pR0mvFW293XW7g0IV-2szoIz-T-UyTapQDFggPFL8QY1fqE
Message-ID: <CAPVz0n205rKSAq2Jbtahn6xW2MYgSm61qxjRbsSs_4RBSEs34Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert
 to schema
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5929-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 6009EC50B2
X-Rspamd-Action: no action

=D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 21:46 Davi=
d Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> > Convert devicetree bindings for the Motorola CPCAP MFD regulator subnod=
e
> > from TXT to YAML format. Main functionality preserved and added compati=
ble
> > for CPCAP regulator set found in the Mot board.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
> >  .../regulator/motorola,cpcap-regulator.yaml   | 51 +++++++++++++++++++
> >  2 files changed, 51 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-r=
egulator.txt
> >  create mode 100644 Documentation/devicetree/bindings/regulator/motorol=
a,cpcap-regulator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/cpcap-regulato=
r.txt b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> > deleted file mode 100644
> > index 36f5e2f5cc0f..000000000000
> > --- a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -Motorola CPCAP PMIC voltage regulators
> > -------------------------------------
> > -
> > -Requires node properties:
> > -- "compatible" value one of:
> > -    "motorola,cpcap-regulator"
> > -    "motorola,mapphone-cpcap-regulator"
> > -    "motorola,xoom-cpcap-regulator"
> > -
> > -Required regulator properties:
> > -- "regulator-name"
> > -- "regulator-enable-ramp-delay"
> > -- "regulator-min-microvolt"
> > -- "regulator-max-microvolt"
> > -
> > -Optional regulator properties:
> > -- "regulator-boot-on"
> > -
> > -See Documentation/devicetree/bindings/regulator/regulator.txt
> > -for more details about the regulator properties.
> > -
> > -Example:
> > -
> > -cpcap_regulator: regulator {
> > -     compatible =3D "motorola,cpcap-regulator";
> > -
> > -     cpcap_regulators: regulators {
> > -             sw5: SW5 {
>
> Old example is missing the required regulator-names property.
>
> > -                     regulator-min-microvolt =3D <5050000>;
> > -                     regulator-max-microvolt =3D <5050000>;
> > -                     regulator-enable-ramp-delay =3D <50000>;
> > -                     regulator-boot-on;
> > -             };
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/regulator/motorola,cpcap=
-regulator.yaml b/Documentation/devicetree/bindings/regulator/motorola,cpca=
p-regulator.yaml
> > new file mode 100644
> > index 000000000000..b73d32a86904
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regula=
tor.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola CPCAP PMIC regulators
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  This module is part of the Motorola CPCAP MFD device. For more detai=
ls
> > +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
> > +  regulator controller is represented as a sub-node of the PMIC node
> > +  on the device tree.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - motorola,cpcap-regulator
> > +      - motorola,mapphone-cpcap-regulator
> > +      - motorola,mot-cpcap-regulator
> > +      - motorola,xoom-cpcap-regulator
> > +
> > +  regulators:
> > +    type: object
> > +
> > +    patternProperties:
> > +      "$[A-Z0-9]+^":
>
> Why not put the valid names here? Or does the node name not actually matt=
er?
> (in which case lower case could be allowed too.)
>
>          "^(SW1|SW2|...)$":
>
> And $,^ are swapped.
>

This is an interesting suggestion, maybe schema maintainers can
suggest how to approach this? Node name and case matters, list of
possible names is in the description.

> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        type: object
> > +        description:
> > +          Valid regulator names are SW1, SW2, SW3, SW4, SW5, VCAM, VCS=
I,
> > +          VDAC, VDIG, VFUSE, VHVIO, VSDIO, VPLL, VRF1, VRF2, VRFREF, V=
WLAN1,
> > +          VWLAN2, VSIM, VSIMCARD, VVIB, VUSB, VAUDIO
> > +
>
> If these apply to the regulator-name property, it can be written instead =
as:
>

Regulator name does not matter, any name is acceptible.

>   properties:
>     regulator-name:
>       enum:
>         - SW1
>         - SW2
>         ...
>
>
> Not sure if it is strictly needed, but this would document the optional
> property:
>
>     regulator-boot-on: true
>

this is covered by common regulator schema, along with other possible
regulator properties

> > +        required:
> > +          - regulator-name
> > +          - regulator-enable-ramp-delay
> > +          - regulator-min-microvolt
> > +          - regulator-max-microvolt
> > +
> > +        unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
>
> Example should go here.
>
> > +...
>

