Return-Path: <linux-rtc+bounces-6673-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X+meHD07MGrRQAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6673-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 19:49:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6099688F5F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 19:49:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=V9e5csqu;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6673-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6673-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8686310424C
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9977321D596;
	Mon, 15 Jun 2026 17:46:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DCE2EA171
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 17:46:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545596; cv=none; b=EYQJ0oJ/fzNs5wSSNlPWG+AxEwN5dDqSoq1F634CUHXWXUrIg1enNXM4eBU83iTEZ05rNJ0KqUMqdDYRG+D6VT0B4S/HlnXfkWF1qwm+6pCclel4RBYmS+5PD8uhSv388sS7ZN2REkC0xFWqRPXwKL5Z2d8i5eT0z8OkO8NX5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545596; c=relaxed/simple;
	bh=6Kch48sojf7uiTigvd+1WdQSRnstLfhc2vvsNDPRh8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jUPAIjw699uRGrF/INW6PDQEbOaauCu6hUBMMPG26S9gjYrwu9zqSeJWf7HWLojbpH+k0yYcg7FmIoxc6pNFEy2Y4lbuoSJhmyNXligfqU6i1SNzQCUpMfR34qUBvR3Iu/In4gersM5mwWRXC3cEx5p6JdZ14CIe6VAVsesfJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=V9e5csqu; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ac357c55so35238745e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781545591; x=1782150391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=;
        b=V9e5csquuf1zX//IXNFGDd3OvoWedqTPYctKiCAPTb7LpF/5XmOhmFDS3t/DbyCrfU
         hrhnGMswTcFYbLE+od7qf+vngsGd4exUurM5PVtPjVKZvM7UbbBMD3NpW3czbfhIUZsP
         A0y7sCiW9kBx5+v8/N16LlqQNCZP/jva6tbRmaTVuBtm7MpZDHO0ByuO0RVCEGRaS3Eh
         mvwBKCCeXLTKWk2i6m4eTX1sBydoYunfAeLapjRGCanPHuS1hvVnRjSZOnbpX9N7xJwx
         /z3Sq3dfL+k78AtMAloDj7/sqAgEluCL/nFMYhBn4GUMRm8X+nj6qzv5EtYz8F1BUBLb
         05Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545591; x=1782150391;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=;
        b=JPow7yyJWp5lH17dHSiQ1IyugFoNazO6B6zuljBIwQOVuk/YJURJZG1n8TpflUcs4S
         76cBCjhO6Nxmlo0wiY8PRpeUbFfJq+8fBUDt8cIRUKBt2PEsNyoeNeuQBpYt3BnCMRAR
         MerDeAyhBuALnMPZI8c3GQEjECh5K0hBl9JI0Z1OTyW+E7ewAU9Q3YuepIZjEv6fG0xL
         872qgwytueUdwOOvvuARIDmos66dUH+LRcc87qwhboU5N9f93wvlOfsaKnyVh4n9Kly7
         Y0yO5+uXKO1a8tHueqxoRKbLOBO5KAvG3A1obb9o2PstWAUGTDp8okJI3nfiilVFupj3
         HWRw==
X-Forwarded-Encrypted: i=1; AFNElJ/GdIgM7NWK9R6r2puEbtkkJ14rUVShoLbQU46/aOhnEb+SjV+L84DmKVvAdKnbCyKysKl0vQI/v4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSp9lDwpaWgCgNAZ8qjIWwxGZ1R11jM9levbkGOSWmwchfSwzi
	nxYwl1RfuwsHqoynCPGhZuE7aJQGdf7GBFiIgnQMi54M2KfILYDXv06mkOWK+6Q638uwqc6PJBP
	a1I8G
X-Gm-Gg: Acq92OFQWOCoPu1KK2ResDoSAZfG/2DFZtKyPltaQdsYPoD8ytOF9DIjhvmR+lSYNid
	Ynm8hxrzIJxe3WM/EQ1n6WjOek8DzwM1Akerxxa8zlcyKlRkz+6tGnM5zyqLy0KQNXcN2m3nXwv
	D/hTAjZgkZzLRYZwPNAm6+nUOYXN2ZIDAobeN4AuFWu+nc8YysXo6tOdgygJ1UH3PDNYuU8bhAV
	woyDxH/F7K8MYBKvJd9hvQRYrod5qP3LwNy3xqW4/b42eHtU48yR8hOeI88M+JrxFbJeEAmuv86
	F05jFpxUE4j71ox1r6dHD5NYvsnjJgbYY1mVqefEi5ZkSG5GsnNaITYO6SPesxSe5AVrEb2xjpZ
	8UJc8EitjFFcxKbOJL75/RtZy2GqJ77lnwt8VqzZS+p9jLm1XK2jNQ7KEMd2F1avLM4cvk9A2wf
	cF10lh4YtzEXiFsfGvCSB7zw==
X-Received: by 2002:a05:600c:638f:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-4922ff8eeaemr3741655e9.2.1781545591514;
        Mon, 15 Jun 2026 10:46:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5176:ebe3:853b:8fb0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4922fa3a8e4sm12251795e9.3.2026.06.15.10.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:46:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rtc@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
In-Reply-To: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 28 Mar 2026 20:37:26 +0800")
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
	<20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
	<CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 19:46:29 +0200
Message-ID: <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:junhui.liu@pigmoral.tech,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6673-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pigmoral.tech,baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:from_mime,starbuckisacylon.baylibre.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,pigmoral.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6099688F5F

On sam. 28 mars 2026 at 20:37, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> The RTC module in the Allwinner A733 SoC is functionally compatible with
>> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
>> changes.
>>
>> The A733 supports selecting the oscillator between three frequencies:
>> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
>> which frequency is actually used on the board. By defining all three
>> frequencies as fixed-clocks in the device tree, the driver can identify
>> the hardware-detected frequency and expose it to the rest of the system.
>
> No. The board device tree shall have the exact and correct frequency
> defined in the external crystal device node. The operating system can
> use the hardware-detected frequency to "fix" the in-system representation
> if it is off.
>
>> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
>> specific modules, including SerDes, HDMI, and UFS.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 +++++++++++++++=
+++++--
>>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>>  2 files changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> index 9df5cdb6f63f..b18431955783 100644
>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> @@ -26,6 +26,7 @@ properties:
>>            - allwinner,sun50i-h6-rtc
>>            - allwinner,sun50i-h616-rtc
>>            - allwinner,sun50i-r329-rtc
>> +          - allwinner,sun60i-a733-rtc
>>        - items:
>>            - const: allwinner,sun50i-a64-rtc
>>            - const: allwinner,sun8i-h3-rtc
>> @@ -46,11 +47,11 @@ properties:
>>
>>    clocks:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>
>>    clock-names:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>
>>    clock-output-names:
>>      minItems: 1
>> @@ -156,6 +157,38 @@ allOf:
>>          - clocks
>>          - clock-names
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: allwinner,sun60i-a733-rtc
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          items:
>> +            - description: Bus clock for register access
>
>> +            - description: 19.2 MHz oscillator
>> +            - description: 24 MHz oscillator
>> +            - description: 26 MHz oscillator
>
> No. There is only one input. As in there is only one set of pins for the
> DCXO. The inputs are the same as on R329 / A523. Just use that list.
>
>> +            - description: AHB parent for internal SPI clock
>> +            - description: External 32768 Hz oscillator
>> +
>> +        clock-names:
>> +          minItems: 5
>> +          items:
>> +            - const: bus
>> +            - const: osc19M
>> +            - const: osc24M
>> +            - const: osc26M
>> +            - const: ahb
>> +            - const: ext-osc32k
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -164,6 +197,7 @@ allOf:
>>                - allwinner,sun8i-r40-rtc
>>                - allwinner,sun50i-h616-rtc
>>                - allwinner,sun50i-r329-rtc
>> +              - allwinner,sun60i-a733-rtc
>>
>>      then:
>>        properties:
>> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bi=
ndings/clock/sun60i-a733-rtc.h
>> new file mode 100644
>> index 000000000000..8a2b5facad73
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
>> +
>> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
>> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
>> +
>> +#define CLK_IOSC               0
>> +#define CLK_OSC32K             1
>> +#define CLK_HOSC               2
>
> The DCXO enable control has been present since at least the H6. We just
> never added it, as we would never disable it anyway.
>
> If you compare the RTC clock trees of the A733 and A523, the only addition
> besides the new gates seems to be the LOSC auto selection. But even that
> is just an illusion, as the A523 has the same registers for that.
>
> One could say the A733 RTC is almost backward compatible to the A523, if
> not for the two fastboot registers the A523 has at 0x120 and 0x124.
>
> So I ask that you try to integrate the differences into the existing
> driver and bindings. You can tweak and export internal clks if you
> need.

I'd like to help with that. I think it is doable but I have a question
regarding the binding of the existing driver, more precisely their usage
here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/sunxi-ng/ccu-sun6i-rtc.c?h=3Dv7.1#n370

Clock indexes are supposed to be stable in DT (AFAIK) but with the code
linked the external 32k is at:

* "ext-32k" - so index 3 - if "clock-names" is present
* index 0 if clock names is not present

... but index 0 is supposed to be the bus clock according the binding
doc, whether "clock-names" is there or not :/

So what are those old r329 bindings ? is there a documentation defining
them somewhere ?

Cleaning that part would help with A733 addition in the existing driver
I think

>
>> +#define CLK_RTC_32K            3
>
> AFAICT besides being an internal clock, this is also fed to GPIO for
> debounce? We probably need to expose this on the A523 as well.
>
>
> Thanks
> ChenYu
>
>
>> +#define CLK_OSC32K_FANOUT      4
>> +#define CLK_HOSC_SERDES1       5
>> +#define CLK_HOSC_SERDES0       6
>> +#define CLK_HOSC_HDMI          7
>> +#define CLK_HOSC_UFS           8
>> +
>> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
>>
>> --
>> 2.52.0
>>
>>

--=20
Jerome

