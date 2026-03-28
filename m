Return-Path: <linux-rtc+bounces-6259-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPa5MmH4x2lMfQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6259-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 16:48:49 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A8834EFCE
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 16:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08D78300EC82
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 15:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E831E85D;
	Sat, 28 Mar 2026 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xqfzu90H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773C2DECC6
	for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712927; cv=none; b=NdieSzBH6IGVNHoPq3kq7IV3JZtdffnYFIw3b2zcuAiS8ubErOpai8zIAcJEeclhRAvBjgDQpxxn1l082KrYmWsaX3vMcpD8fwGsNq584PssfKB9maptX5a2vbrODsTBmBG+2+y5CsVXwOTT2zqCb08NL0mCv9+tIimsRxaw9fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712927; c=relaxed/simple;
	bh=J97nhqd19Owfth49YYD2VgMcKu6wbx/SAYjRjMlEcXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EO1El6JgWoJ6u971DU+IUsxPnyoS4Sbd/za0nmH6iC0QTOB/6Q/8rGfEvs4Gz2rWNGl65Aid334PwgJFBf1Oz2XYe4XnUZ07M97al/pb9+cQXUcuTNSPCwVSvlsYdePt41cRiaepbRR+to5W5uPc1KEdlAGQdMZ28fPsU0Sax2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xqfzu90H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AF8C4CEF7
	for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774712926;
	bh=J97nhqd19Owfth49YYD2VgMcKu6wbx/SAYjRjMlEcXA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Xqfzu90HNRsDNu77XSTNabpVyEWWAccCxz9VxsdiPMR5m3YsXMiz/bcBpOU+N+ead
	 7UwZqdhYRbjetasu/27+KwQNzmjpWQ6exDWbwYMCA7jpho5G2YMHwlp5jk5w3abBrW
	 AFPLfwuPmifO6t5hO02DUiK6xfl4K0r1EQvvzyD6tOoDtwKuNBsBLJAkaCMZoQ5XOs
	 SQ0G4Io9/I2xBw4apIUfG+5qkGt1/HfWdOxf5RVRNDMQztr7jTMjDqYs8oJymsXzRL
	 IrXHTCeIWZALPZ2xTQg9MWhT8vyoJDukXJHVYM8XxJOanqcUGEBzBS+sqUI2mh7TBF
	 YMiTeJYuiLV0g==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-386b553c70eso24712701fa.0
        for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 08:48:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVhevRBKLNvn2q2B/FgSCMZ+khQYRPOh/KcgQc7ws2R0bDUFtuZPYLmHv4g5sW9cwFiKYltCUAGnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVYSp1C3Rdm0RUd96Yf9bXhAx8ZaguVtkAvaD4a8qR99NCce3
	VNcgE3az3PqB1Lg437xbeUjegkO/kwgftRTyW8aPE+mMMVq7+2shQAdBijXIMdYX013GBx1Q/Rw
	skNGz2EdlzMNc2Rw9HmXG8DiPLye8j2o=
X-Received: by 2002:ac2:482b:0:b0:5a2:a1aa:2b8a with SMTP id
 2adb3069b0e04-5a2ab92b48dmr1928277e87.31.1774701460967; Sat, 28 Mar 2026
 05:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:37:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
X-Gm-Features: AQROBzAjNUlKB5AcxIrVhPiEv-8viiXBsmIlq5_4UPHivayPQSg3rbcnxOKBQII
Message-ID: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6259-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pigmoral.tech:email]
X-Rspamd-Queue-Id: 33A8834EFCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC module in the Allwinner A733 SoC is functionally compatible with
> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
> changes.
>
> The A733 supports selecting the oscillator between three frequencies:
> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> which frequency is actually used on the board. By defining all three
> frequencies as fixed-clocks in the device tree, the driver can identify
> the hardware-detected frequency and expose it to the rest of the system.

No. The board device tree shall have the exact and correct frequency
defined in the external crystal device node. The operating system can
use the hardware-detected frequency to "fix" the in-system representation
if it is off.

> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
> specific modules, including SerDes, HDMI, and UFS.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 ++++++++++++++++=
++++--
>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>  2 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 9df5cdb6f63f..b18431955783 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - allwinner,sun50i-h6-rtc
>            - allwinner,sun50i-h616-rtc
>            - allwinner,sun50i-r329-rtc
> +          - allwinner,sun60i-a733-rtc
>        - items:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
> @@ -46,11 +47,11 @@ properties:
>
>    clocks:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>
>    clock-names:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>
>    clock-output-names:
>      minItems: 1
> @@ -156,6 +157,38 @@ allOf:
>          - clocks
>          - clock-names
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun60i-a733-rtc
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          items:
> +            - description: Bus clock for register access

> +            - description: 19.2 MHz oscillator
> +            - description: 24 MHz oscillator
> +            - description: 26 MHz oscillator

No. There is only one input. As in there is only one set of pins for the
DCXO. The inputs are the same as on R329 / A523. Just use that list.

> +            - description: AHB parent for internal SPI clock
> +            - description: External 32768 Hz oscillator
> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: bus
> +            - const: osc19M
> +            - const: osc24M
> +            - const: osc26M
> +            - const: ahb
> +            - const: ext-osc32k
> +
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> @@ -164,6 +197,7 @@ allOf:
>                - allwinner,sun8i-r40-rtc
>                - allwinner,sun50i-h616-rtc
>                - allwinner,sun50i-r329-rtc
> +              - allwinner,sun60i-a733-rtc
>
>      then:
>        properties:
> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bin=
dings/clock/sun60i-a733-rtc.h
> new file mode 100644
> index 000000000000..8a2b5facad73
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +
> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> +
> +#define CLK_IOSC               0
> +#define CLK_OSC32K             1
> +#define CLK_HOSC               2

The DCXO enable control has been present since at least the H6. We just
never added it, as we would never disable it anyway.

If you compare the RTC clock trees of the A733 and A523, the only addition
besides the new gates seems to be the LOSC auto selection. But even that
is just an illusion, as the A523 has the same registers for that.

One could say the A733 RTC is almost backward compatible to the A523, if
not for the two fastboot registers the A523 has at 0x120 and 0x124.

So I ask that you try to integrate the differences into the existing
driver and bindings. You can tweak and export internal clks if you
need.

> +#define CLK_RTC_32K            3

AFAICT besides being an internal clock, this is also fed to GPIO for
debounce? We probably need to expose this on the A523 as well.


Thanks
ChenYu


> +#define CLK_OSC32K_FANOUT      4
> +#define CLK_HOSC_SERDES1       5
> +#define CLK_HOSC_SERDES0       6
> +#define CLK_HOSC_HDMI          7
> +#define CLK_HOSC_UFS           8
> +
> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
>
> --
> 2.52.0
>
>

