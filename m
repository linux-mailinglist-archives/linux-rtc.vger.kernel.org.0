Return-Path: <linux-rtc+bounces-6309-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHerBJXA2GlVhggAu9opvQ
	(envelope-from <linux-rtc+bounces-6309-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 11:19:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2013D4A2E
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 11:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C51A43011A79
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D601F342509;
	Fri, 10 Apr 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="i+jDGeGg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28733689A;
	Fri, 10 Apr 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812751; cv=pass; b=Xa9ydkVpQtObELnlJSmpO2UFgLd2IoGPYI+7Ujle9I1uuGy4E2l8CgxVPchZPhTnZyaFuOq8FV1RNfGqDlsckKVV4bticHtChQPhnFoj7JsD7iXcIm7sJruNq2UCw7CZph3jFMMsoOaUg0QTXDk3u0EjgxP1iQSN8Y8SCuHSQNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812751; c=relaxed/simple;
	bh=YzqYoTegGmVvbZ0PJr8sikOwbxAvloSf+9ezaClId2o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VdgEfzVOF88E7mMMWbseu45UUE/C9dJYnjnrojYe9G7R1QJz+FEqtRmFR4uoqnmY80jCZtLEgnkIcJQWjwfraBa43LH3J71/H10OECMC5YPOI0h/+MiHplmCeBp1D7PFEg4+xww55n37ymjRtNsWufklildJ0y+Ql+s/x32/3WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=i+jDGeGg; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1775812716; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bvjtxWIGOwhhI07XetIdFYhUqGJcYhs1zYmkXxPR+bt1MMUfp+UTmkokPpSVD8koVW9oH7b4KCkzSjskeCO3JLfO8KIbFAXY7WFBPX59CCcBps+t2qMHeKgNL31T1i3BVDDEqDw6rkQWYDv874oVInplMPYPVsEl8eWNoA+UPx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775812716; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=biSMIjMoqI6BSBHbISsyBv693FJEoQDokGFZnddUKkM=; 
	b=ltX0DBnvVCzideQg/qFRRhLxSZSjYBNSPbh7gM5WtTLsNf/Y2HpNC8D4PZEusaB8yggQtqb8UDuo0j5bpHhV8dz3CaZgFASdyltwVo/tibN3BrFr/eR7DTGvyavl4XHUJoq1nazHACboDTRM50Qa9rSirivlazUpI8hOEZHbyQI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775812716;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=biSMIjMoqI6BSBHbISsyBv693FJEoQDokGFZnddUKkM=;
	b=i+jDGeGgXIRG64OfX53pe45O/Du/c+8L4IPKelfAnF1mBKufshKaE5+OFLuByLT2
	P+tmRSdtqgA4a0J+qXYu5tvRNMVjIBexFpWxqmUYH+dsWeqr65e5rflBFGSktSqN9B0
	c3YP7u98dFywWacjkOYYaUTdZnHeL3uipmEcIgqU=
Received: by mx.zohomail.com with SMTPS id 1775812713638605.1620198428519;
	Fri, 10 Apr 2026 02:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 17:18:22 +0800
Message-Id: <DHPD2DBIJNKO.11THXNWNUEEG9@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
 <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
In-Reply-To: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6309-lists,linux-rtc=lfdr.de];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB2013D4A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi ChenYu,
Thanks for your patient review.

On Sat Mar 28, 2026 at 8:37 PM CST, Chen-Yu Tsai wrote:
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

Okay, I will keep only one main external crystal in the device tree.

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

[...]

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

I will remove it.

>
> If you compare the RTC clock trees of the A733 and A523, the only additio=
n
> besides the new gates seems to be the LOSC auto selection. But even that
> is just an illusion, as the A523 has the same registers for that.
>
> One could say the A733 RTC is almost backward compatible to the A523, if
> not for the two fastboot registers the A523 has at 0x120 and 0x124.
>
> So I ask that you try to integrate the differences into the existing
> driver and bindings. You can tweak and export internal clks if you
> need.

Okay, I will try to integrate the A733 RTC support into the existing
driver and bindings.

But first I would like to ask for your advice on how to correctly
organize the device tree binding header for the clocks? I have two ideas
in mind:

1. Add the common internal clocks (e.g., CLK_RTC_32K) to the existing
sun6i-rtc.h. Then, create a new sun60i-a733-rtc.h which includes
the old sun6i-rtc.h and appends the A733-specific clock gates.

2. Simply append all the new A733-specific clock IDs directly to the
bottom of the existing sun6i-rtc.h, sharing the same header file for all
SoCs utilizing this driver.

>
>> +#define CLK_RTC_32K            3
>
> AFAICT besides being an internal clock, this is also fed to GPIO for
> debounce? We probably need to expose this on the A523 as well.
>

I will do it.

>
> Thanks
> ChenYu
>

--=20
Best regards,
Junhui Liu


