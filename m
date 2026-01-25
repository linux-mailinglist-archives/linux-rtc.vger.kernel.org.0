Return-Path: <linux-rtc+bounces-5851-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VU5zIGKvdWm2HgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5851-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 06:51:30 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 639217FD59
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 06:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142A03005D33
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 05:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB72E3115B5;
	Sun, 25 Jan 2026 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="rTR69koY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304D31062C;
	Sun, 25 Jan 2026 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769320287; cv=pass; b=szugmd+y6aGnvuC6dQjhh662EZZAug3N12wkpRaSBRLV7TKK4ybN0DhOctOsLujA5g/cLPsfIQ7KNxHo6v1QWmtD4fmVQ+jtI+eP4CLroTtdO1hOJy62Vl5J9qdyC4UjK6yXWOqKF3voeSuU5K6VrgG5Cr/JN/i4FSbxY3LRbhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769320287; c=relaxed/simple;
	bh=vNRFz3rpr1i9Y/8CHvWTW67haKPfB44QKas58pkzPWI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DhDCa+xgDIQ5h4Zb8+E0uj9jSFeWLW1V7LXG4amDJgijUTfI9VT3xcsTTDPWrXifXezbUNqe9r3h8SuoJ38w8DW+p6IMNWdxFMmIPu3iHYt1BTqMyp6YWY+N86KiSppAiA/RBZs2yFiOIe49/VDpdiwfDmMOAi7v8k6htSi10e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=rTR69koY; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1769320254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dSTluIUg1ZvuNQajf3SJQZtFC47qgOiCluuPmretAnaYy3qEXXAfw12l1SuinrIkuTIRZfJR31MmYz5r6spPsJxZMoLbjXd+1xdkmxQeHJWZoCwxSDGaUYuXq3kOF7qo9PWdPFRCQ4/6JBiHaTov22Gkxan2PROLvfDtNTd0P3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769320254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7kmusx+MqkhmDeC3UAb227ZvWFfKqkuZrPt4RmzV95Y=; 
	b=WBLo2GPooj7hxieZJGDM1Qex0g3hZOSEzMm4I2tFp1ukYCmfFnuM3DqSt27sKBwWn2TV32I6s/OLlyXB2DY6U2/hhhUGqi82QbSx6QFm0LctY+SpVlAX5ZxYla4X7m+X1IT29Njx9sdNitezJuoLhqo/4o9PN3DJ7+ZocAo4ctQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769320254;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=7kmusx+MqkhmDeC3UAb227ZvWFfKqkuZrPt4RmzV95Y=;
	b=rTR69koYL0NpAmYBkVdfpkSYUbKGJBrLW085gQX2D96GmcI/dgw7ortSTm9m6V3k
	PT91fEUpMbG+8Dqv0q3hbWPewgHn/Vtexj28VcJV8gL/4bu+ozd4NNXgzLh7FwyAlmd
	sgb05Ra7AgqhnAaPKb8koZaqEd2KKBmDE0tK9YPw=
Received: by mx.zohomail.com with SMTPS id 1769320251684256.61624132047143;
	Sat, 24 Jan 2026 21:50:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 13:50:41 +0800
Message-Id: <DFXFOHVB1GAV.3L3EL4FVWFWDC@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
 <CAGb2v65aMMVu8W1PW+6NZM+YM72YFV9_FWVWtj6QHJ1CgetEsA@mail.gmail.com>
In-Reply-To: <CAGb2v65aMMVu8W1PW+6NZM+YM72YFV9_FWVWtj6QHJ1CgetEsA@mail.gmail.com>
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5851-lists,linux-rtc=lfdr.de];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid]
X-Rspamd-Queue-Id: 639217FD59
X-Rspamd-Action: no action

On Sun Jan 25, 2026 at 12:32 PM CST, Chen-Yu Tsai wrote:
> On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Extract the IOSC and 32k clock logic from ccu-sun6i-rtc into a shared
>> module to simplify adding RTC CCU support for new SoCs. This is needed
>> because newer Allwinner SoCs introduce additional DCXO/HOSC logic that
>> prevents direct reuse of the existing driver.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  drivers/clk/sunxi-ng/Makefile        |   3 +
>>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 152 +---------------------------=
-------
>>  drivers/clk/sunxi-ng/ccu_rtc.c       | 136 ++++++++++++++++++++++++++++=
+++
>>  drivers/clk/sunxi-ng/ccu_rtc.h       |  37 +++++++++
>>  4 files changed, 177 insertions(+), 151 deletions(-)
>>

[...]

>> +
>> +const struct clk_ops ccu_iosc_ops =3D {
>> +       .enable                 =3D ccu_iosc_enable,
>> +       .disable                =3D ccu_iosc_disable,
>> +       .is_enabled             =3D ccu_iosc_is_enabled,
>> +       .recalc_rate            =3D ccu_iosc_recalc_rate,
>> +       .recalc_accuracy        =3D ccu_iosc_recalc_accuracy,
>> +};
>
> You need to export the symbol.

Thanks, I will export them.

[...]

>> diff --git a/drivers/clk/sunxi-ng/ccu_rtc.h b/drivers/clk/sunxi-ng/ccu_r=
tc.h
>> new file mode 100644
>> index 000000000000..1c44c2206a25
>> --- /dev/null
>> +++ b/drivers/clk/sunxi-ng/ccu_rtc.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
>> + */
>> +
>> +#ifndef _CCU_RTC_H_
>> +#define _CCU_RTC_H_
>> +
>> +#define IOSC_ACCURACY                  300000000 /* 30% */
>> +#define IOSC_RATE                      16000000
>> +
>> +#define LOSC_RATE                      32768
>> +#define LOSC_RATE_SHIFT                        15
>> +
>> +#define LOSC_CTRL_REG                  0x0
>> +#define LOSC_CTRL_KEY                  0x16aa0000
>> +
>> +#define IOSC_32K_CLK_DIV_REG           0x8
>> +#define IOSC_32K_CLK_DIV               GENMASK(4, 0)
>> +#define IOSC_32K_PRE_DIV               32
>> +
>> +#define IOSC_CLK_CALI_REG              0xc
>> +#define IOSC_CLK_CALI_DIV_ONES         22
>> +#define IOSC_CLK_CALI_EN               BIT(1)
>> +#define IOSC_CLK_CALI_SRC_SEL          BIT(0)
>> +
>> +#define LOSC_OUT_GATING_REG            0x60
>> +
>> +#define DCXO_CTRL_REG                  0x160
>> +#define DCXO_CTRL_CLK16M_RC_EN         BIT(0)
>
> Please keep all internals in the .c file.

My original thought was to reuse these for the A733. But since doing
so is not appropriate, I will put them in the .c files separately.

>
> ChenYu
>

--=20
Best regards,
Junhui Liu


