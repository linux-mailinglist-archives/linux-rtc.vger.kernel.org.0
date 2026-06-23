Return-Path: <linux-rtc+bounces-6728-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1ThGG+pOmoRDAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6728-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 17:42:39 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7136B864F
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 17:42:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="PLU/Xe7/";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6728-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6728-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4DC1304725F
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 15:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046222EBB8C;
	Tue, 23 Jun 2026 15:42:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66302DF3D1
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 15:42:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229352; cv=none; b=f/RVv53tozElVf561dwHIZa44L2sCauWxsvULD0jZgoox0Go+4apPsTFFhmF0ikzbhySpcXv0iph/PMJo9lXZL7M/EOJRJQEYHYEAsGEx88H6dpEG8RqyCl7hYefEwVC6qcdl0j6wCu1t1suOuWLs6MHQ2h7OJzYqM70HpUyqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229352; c=relaxed/simple;
	bh=z6MKKtlC7LSYB5Sy3KeJxvJLPKB1dSyb1BRmdkMlOX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wm/t+oWdiD1rnUWejInd+N+ft3JSt/WpgHrm5R+isabkMqrneqUqF2ZNTXBfahilU/LdFsacAiUzZtD9Ho4hVYOVrsyRdtl+J1cSG9f+3dNuqXG9x7tYn6cjc7j5ZvCuqZBVOY0+zpF/0QUXOwaLYhz3a7PBkjugZIqPmuoytAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLU/Xe7/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862341F00ADF
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782229351;
	bh=BSL3Ji4GUrL1JE/4JUwmqRt8VhO/nTrzRQrvkStmD+k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=PLU/Xe7/8I4p6kQw9d+XwsJJIyv8ger5txXEWfC385pIIaf5tiX0F2wRW4uPOHh09
	 Doh7GOS3oSSHklFWi0LWiWPRmm/Mpi2QPnvez/wBzDonyqGD5lns28H14WJe6Hb/om
	 +6H+5S6d019xHkOLUewLOKj4v7uBXxcwuwt+PVNe8sgF4QDlGqBZXfONZjAblucZOP
	 DFJuxPTEaxDypwhYZjhhqSPoYwstBVtrA+8K3jqEZtKpIb3/TlPvyh0M81I4G0amhs
	 LNPCfm8UhYg1xQBiNwWcyLzDai9Ym8d05n3fGMYl4AJEwxnhpMAXNbiVkysPcaWrmT
	 49OODXw+LAFgA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3996f80800bso12296071fa.1
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 08:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yjHgMcN9o+jU76iP/8sNwsx4uV6O3aPp2GQMG/7/FDrQgWOv3/0k4jCnTyiDb4S/VAvc7JPl568U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzF2ihTns2voLZZ5a1ywbMPoBkCFrK8qO3tGJUU7q+Mjdqby5d
	txNt1LQT4tJij4Xuakeme68iVN2hvzHhscO7qe86qO/Cj6ShSmE5zI32laKBHk0XTEJuJlbniXc
	5IaRSvPMh+RaBT6hJUO2pZFHYQvJ/D+E=
X-Received: by 2002:a2e:ad12:0:b0:38a:5bf2:80d6 with SMTP id
 38308e7fff4ca-399c537553emr12162361fa.5.1782229349894; Tue, 23 Jun 2026
 08:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech> <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
 <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Jun 2026 23:42:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dTvBmmtJs_9nScpmudpcnSeUvmUmMSkmBw9MoDc_N0w@mail.gmail.com>
X-Gm-Features: AVVi8CcgLOtVmxPkjYo8ol2JpJAsomRkV2c2-YmPvchv8vYkQh8VbR5Oaj0YqvI
Message-ID: <CAGb2v66dTvBmmtJs_9nScpmudpcnSeUvmUmMSkmBw9MoDc_N0w@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
To: Jerome Brunet <jbrunet@baylibre.com>, Junhui Liu <junhui.liu@pigmoral.tech>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6728-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pigmoral.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC7136B864F

On Tue, Jun 16, 2026 at 1:46=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 28 mars 2026 at 20:37, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral=
.tech> wrote:
> >>
> >> The RTC module in the Allwinner A733 SoC is functionally compatible wi=
th
> >> the sun6i RTC, but its internal Clock Control Unit (CCU) has significa=
nt
> >> changes.
> >>
> >> The A733 supports selecting the oscillator between three frequencies:
> >> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> >> which frequency is actually used on the board. By defining all three
> >> frequencies as fixed-clocks in the device tree, the driver can identif=
y
> >> the hardware-detected frequency and expose it to the rest of the syste=
m.
> >
> > No. The board device tree shall have the exact and correct frequency
> > defined in the external crystal device node. The operating system can
> > use the hardware-detected frequency to "fix" the in-system representati=
on
> > if it is off.
> >
> >> Additionally, the A733 RTC CCU provides several new DCXO gate clocks f=
or
> >> specific modules, including SerDes, HDMI, and UFS.
> >>
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 +++++++++++++=
+++++++--
> >>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
> >>  2 files changed, 52 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31=
-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.y=
aml
> >> index 9df5cdb6f63f..b18431955783 100644
> >> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.ya=
ml
> >> @@ -26,6 +26,7 @@ properties:
> >>            - allwinner,sun50i-h6-rtc
> >>            - allwinner,sun50i-h616-rtc
> >>            - allwinner,sun50i-r329-rtc
> >> +          - allwinner,sun60i-a733-rtc
> >>        - items:
> >>            - const: allwinner,sun50i-a64-rtc
> >>            - const: allwinner,sun8i-h3-rtc
> >> @@ -46,11 +47,11 @@ properties:
> >>
> >>    clocks:
> >>      minItems: 1
> >> -    maxItems: 4
> >> +    maxItems: 6
> >>
> >>    clock-names:
> >>      minItems: 1
> >> -    maxItems: 4
> >> +    maxItems: 6
> >>
> >>    clock-output-names:
> >>      minItems: 1
> >> @@ -156,6 +157,38 @@ allOf:
> >>          - clocks
> >>          - clock-names
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: allwinner,sun60i-a733-rtc
> >> +
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 5
> >> +          items:
> >> +            - description: Bus clock for register access
> >
> >> +            - description: 19.2 MHz oscillator
> >> +            - description: 24 MHz oscillator
> >> +            - description: 26 MHz oscillator
> >
> > No. There is only one input. As in there is only one set of pins for th=
e
> > DCXO. The inputs are the same as on R329 / A523. Just use that list.
> >
> >> +            - description: AHB parent for internal SPI clock
> >> +            - description: External 32768 Hz oscillator
> >> +
> >> +        clock-names:
> >> +          minItems: 5
> >> +          items:
> >> +            - const: bus
> >> +            - const: osc19M
> >> +            - const: osc24M
> >> +            - const: osc26M
> >> +            - const: ahb
> >> +            - const: ext-osc32k
> >> +
> >> +      required:
> >> +        - clocks
> >> +        - clock-names
> >> +
> >>    - if:
> >>        properties:
> >>          compatible:
> >> @@ -164,6 +197,7 @@ allOf:
> >>                - allwinner,sun8i-r40-rtc
> >>                - allwinner,sun50i-h616-rtc
> >>                - allwinner,sun50i-r329-rtc
> >> +              - allwinner,sun60i-a733-rtc
> >>
> >>      then:
> >>        properties:
> >> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-=
bindings/clock/sun60i-a733-rtc.h
> >> new file mode 100644
> >> index 000000000000..8a2b5facad73
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
> >> @@ -0,0 +1,16 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> >> +
> >> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> >> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> >> +
> >> +#define CLK_IOSC               0
> >> +#define CLK_OSC32K             1
> >> +#define CLK_HOSC               2
> >
> > The DCXO enable control has been present since at least the H6. We just
> > never added it, as we would never disable it anyway.
> >
> > If you compare the RTC clock trees of the A733 and A523, the only addit=
ion
> > besides the new gates seems to be the LOSC auto selection. But even tha=
t
> > is just an illusion, as the A523 has the same registers for that.
> >
> > One could say the A733 RTC is almost backward compatible to the A523, i=
f
> > not for the two fastboot registers the A523 has at 0x120 and 0x124.
> >
> > So I ask that you try to integrate the differences into the existing
> > driver and bindings. You can tweak and export internal clks if you
> > need.
>
> I'd like to help with that. I think it is doable but I have a question
> regarding the binding of the existing driver, more precisely their usage
> here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/clk/sunxi-ng/ccu-sun6i-rtc.c?h=3Dv7.1#n370
>
> Clock indexes are supposed to be stable in DT (AFAIK) but with the code
> linked the external 32k is at:
>
> * "ext-32k" - so index 3 - if "clock-names" is present
> * index 0 if clock names is not present
>
> ... but index 0 is supposed to be the bus clock according the binding
> doc, whether "clock-names" is there or not :/
>
> So what are those old r329 bindings ? is there a documentation defining
> them somewhere ?

You can look at

    8487614a8a8a dt-bindings: rtc: sun6i: Add H616, R329, and D1 support

In hindsight maybe the two bindings should be separate. The old SoCs
did not have all these clock inputs from the main clock controller.
The only input it could possibly take was the external 32k crystal.

> Cleaning that part would help with A733 addition in the existing driver
> I think

Yeah. Also, we can treat the bindings and drivers separately. We could
have two bindings but one common driver, or vice versa. As you pointed
out, the bindings are a bit messed up, so we could consider separating
them.

If we end up with separate binding header files, maybe we could use
a different prefix for the new ones so they don't collide? That way
the driver could maybe still be shared?

As for whether to share the headers, I think they should be treated
as part of the binding, so if the bindings are shared, then they can
be shared as well; if the bindings are separate, then they should be
completely separate files as well.


And sorry for the late reply.


Thanks
ChenYu

> >
> >> +#define CLK_RTC_32K            3
> >
> > AFAICT besides being an internal clock, this is also fed to GPIO for
> > debounce? We probably need to expose this on the A523 as well.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> >> +#define CLK_OSC32K_FANOUT      4
> >> +#define CLK_HOSC_SERDES1       5
> >> +#define CLK_HOSC_SERDES0       6
> >> +#define CLK_HOSC_HDMI          7
> >> +#define CLK_HOSC_UFS           8
> >> +
> >> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
> >>
> >> --
> >> 2.52.0
> >>
> >>
>
> --
> Jerome
>

