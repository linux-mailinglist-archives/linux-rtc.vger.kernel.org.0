Return-Path: <linux-rtc+bounces-6310-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sANLKRHI2GmkiAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6310-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 11:51:13 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 882983D53AD
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 11:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 316FB3006837
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 09:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C144036E495;
	Fri, 10 Apr 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="AC0lYtKu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE7B377EC1;
	Fri, 10 Apr 2026 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814628; cv=pass; b=ppmfayvbJ5W16QCGBt28tBd+iQP/Ld8GTHk7F6rHrTUYyz2a0JO4ml4mSvvL6Fah5XICPjvXmOj142NSw/J/9ePZDQBJv2rk6Qzq99aHvhvyDUzb7+MU12HCo4tPY3SOkYl54PeSZeZk7QVcZQwRMjerzAJGObhtrnhxOW1kKe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814628; c=relaxed/simple;
	bh=ryWgDWizi4eqObnZFpa8OiBFomGSkJVOTCG/4bae7Kw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Dq9pfw6Ei2b6ojAffvjUan0tJwO80RDT/m0hhxDb+gkEItoRzQYH4hvupxkT5s5oiNMBKGCNb3TgN+nXcYawQsT98JC+qJRwmRtSM3QjAPY7gCGrMITsJtOBb7uizqVGr3gQC2uTqOGkfl6r/T/bZoWRpzp134IDCvseZvSNIxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=AC0lYtKu; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1775814601; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ajm8KCOZ3HTSDSoPDZoE9w9U5kzebIqYrtN6aM24IPDwBP+TYeGwp0aaBR/8epFs2/NTYEhCHH6CG2HdePepR0/51RRwdJJLLoI5fYYwVEyXQdZxVQxLnoJ+x3ZBwhhcQAh7LtHQYx0tFdVlapJi3GvNBjDJyCgL6XbP2079oHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775814601; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4UotVkU/wCIPZVHZquY/z63H5AYQdFj3m1KFqxdTFcU=; 
	b=IYAN6kqC9G0aFn3AfYs3yQN8xhF9F6n4oVvHq8uQtDLcgyuqPV/CP+PBAGoXVyWm1bkSwZ5kOi4KRqbd5DMeMdkZsrOdRfFpGzW5ZE+ACZbui78IoKj1aQowRFnKcHCoF33FCWKSuI+j35weNE3IM5e3IUU2qhmN5Lm0MDb3azM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775814601;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:References:In-Reply-To:Reply-To;
	bh=4UotVkU/wCIPZVHZquY/z63H5AYQdFj3m1KFqxdTFcU=;
	b=AC0lYtKuynwcFp+hCP1+ChfvSQzvoDauSKvDDBVq8N6ciLoj7X4J22S1lLYGpInz
	NhTXFOg9erWKcx8Msb/+lNLn60PANj2OYboXlrDFu2Kv18aIDl1HREDceAtFV3FACNa
	OK/X9IZk2rSw6+W7BRHMdJFwXWocQRagvFnv4ACk=
Received: by mx.zohomail.com with SMTPS id 1775814599395110.49786561844996;
	Fri, 10 Apr 2026 02:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 17:49:49 +0800
Message-Id: <DHPDQG786QZJ.BPIOZITGMHKR@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 =?utf-8?q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
 <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
In-Reply-To: <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6310-lists,linux-rtc=lfdr.de];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pigmoral.tech:dkim,pigmoral.tech:email,pigmoral.tech:mid]
X-Rspamd-Queue-Id: 882983D53AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat Mar 28, 2026 at 10:41 PM CST, Chen-Yu Tsai wrote:
> On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Add support for the internal CCU found in the RTC module of the Allwinne=
r
>> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compatibl=
e
>> with older SoCs like the sun6i, the A733 introduces several new features=
.
>>
>> The A733 RTC CCU supports choosing one of three external crystal
>> frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
>> logic to automatically identify the frequency used on the board and
>> exports this DCXO signal as the "hosc" clock.
>>
>> Furthermore, the driver implements logic to derive a 32kHz reference
>> from the HOSC. This is achieved through a muxed clock path using fixed
>> pre-dividers to normalize the different crystal frequencies to ~32kHz.
>
> Have you tested whether the actually normalizes the frequency, i.e.
> selects a different divider based on the DCXO frequency? Otherwise
> we're just lying about the frequency.

I only have A733 boards with 26MHz crystals, so I couldn't test all
crystal configurations. However, I exported the "hosc_32k" clock
(referred to as dcxo24M_div32k_clk in the vendor driver) to a physical
pin via the fanout path and measured it with the oscilloscope.

Observations:

- Normal conditions: The frequency remains stable within the 32.744 kHz
  to 32.791 kHz range.
- Forced condition: I grounded the R24 resistor on radxa A7A board to
  trick the SoC into detecting a 24MHz crystal while the actual input
  remained 26MHz. In this case, the frequency became unstable but still
  stayed around the 32.2 kHz to 33.3 kHz range.

Based on these results, it appears the hardware does attempt to
normalize the frequency towards 32.768 kHz via some internal logic.

>
>> This path reuses the same hardware mux registers as the HOSC clock.
>>
>> Additionally, this CCU provides several gate clocks for specific
>> peripherals, including SerDes, HDMI, and UFS. The driver is implemented
>> as an auxiliary driver to be bound to the sun6i-rtc driver.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  drivers/clk/sunxi-ng/Kconfig               |   5 +
>>  drivers/clk/sunxi-ng/Makefile              |   2 +
>>  drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c | 204 ++++++++++++++++++++++=
+++++++
>>  drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h |  18 +++
>>  drivers/clk/sunxi-ng/ccu_rtc.h             |   7 +
>>  5 files changed, 236 insertions(+)
>>

[...]

>> +
>> +static const struct clk_parent_data hosc_parents[] =3D {
>> +       { .fw_name =3D "osc24M" },
>> +       { .fw_name =3D "osc19M" },
>> +       { .fw_name =3D "osc26M" },
>> +       { .fw_name =3D "osc24M" },
>> +};
>
> As mentioned in my reply to the binding, this is wrong. There is only
> one input.
>
> The most you can do is check the rate of the parent clock against the
> detected one, and _scream_ that the DT is wrong. And maybe override
> the reported frequency.

I will add a warning message if the frequency detected by the driver
does not match the one in the DT.

>
> If you want to do the latter, you could add a new fixed rate gated
> clock type to our library. You would fill in the rate before the
> clocks get registered. I probably wouldn't go that far. We want people
> to have correct hardware descriptions.
>
> Funnily enough Allwinner's BSP actually implements a fixed rate gate
> for the next 24M-to-32k divider clock.

Yes, I noticed that as well. I agree, and I will model this path as a
simple fixed-rate clock (32768Hz) in v2.

>
>> +
>> +struct ccu_mux hosc_clk =3D {
>> +       .enable =3D DCXO_CTRL_DCXO_EN,
>> +       .mux    =3D _SUNXI_CCU_MUX(14, 2),
>> +       .common =3D {
>> +               .reg            =3D DCXO_CTRL_REG,
>> +               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("hosc",
>> +                                                          hosc_parents,
>> +                                                          &ccu_mux_ro_o=
ps,
>> +                                                          0),
>> +       },
>> +};
>
> So this is wrong.
>
>> +
>> +static const struct ccu_mux_fixed_prediv hosc_32k_predivs[] =3D {
>> +       { .index =3D 0, .div =3D 732 },
>
> Why is it 732 instead of 750?

As mentioned above, the target frequency is 32.768kHz rather than
32.0kHz. However, since I will drop this prediv array and use a
fixed-rate clock instead, I think this will no longer be an issue.

--=20
Best regards,
Junhui Liu


