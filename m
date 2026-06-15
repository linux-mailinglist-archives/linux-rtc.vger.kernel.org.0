Return-Path: <linux-rtc+bounces-6674-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IxN6Jpg9MGpEQQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6674-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 19:59:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F0C689046
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 19:59:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=BJ0ygtbY;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6674-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6674-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4897300A135
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796B03093B5;
	Mon, 15 Jun 2026 17:56:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EFE30C167
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 17:56:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546195; cv=none; b=B6gB5yySeF7wl/Ndi9hwtrv7xfoDiuWFPhuKym1F2Q2z9djAO200Yi98ZsHPE2p+XIJTNI90wVKvW4x/4mlqTJ28GYynFCcZj+eqNhYbSJn1LxuqH8OBfRKotaGJvpgcAvGv0Er/+s4ANkj8Cw9dwn2BrE+Lg7TS7HTAUMev+Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546195; c=relaxed/simple;
	bh=Oj4RKJnXYk35hVFXcx5pzzIrZMT/oGdZI6oDIaOmPDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JyP7g0ERT6KxIrmTv0Y0CojBe1uKrGR9ELeYt0+uCW8tbeC76IvqsA7HcvEJImL73Vda2+U6hOYHejEu2a8HbmtgZz3mtM1X36IF4oonIdkmXKCS2J9pqW5QMLXq2DktPoO1T2KAStcfHWAOA/ScSr1G6JyHY0WJa1saESPKTRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BJ0ygtbY; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so3110390f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781546192; x=1782150992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=;
        b=BJ0ygtbYSD9luAiXbLuXcyp7YnuWVVfcEtIu4oKhRzbx5TqJauKI3MhsS/CL2ywxSI
         IZvlWcL12t3P57X3yK8xFj3+6BYNDjhs7p039hU2kZ11zM6exBAfwTguHyn3iBCFOhuR
         NalOqPQND0J1ALUvPMIAf0foMEM/V3RqPhR5vQwCpgRbeOnjxil0dxTlFewDhv1QAz5E
         35hUfmTLfSaPvBUH9//rK9xnOJ1uOBISZuNUkC7JVt3TVo1Q74Jtgb0+LYxo9sv+LLM/
         QjM7eGesV+oP7ewvaYx12AZruU8eRvf9s9zZh8OOqwJCOTVIm+qW+E8Uyd3cvmsBR/QX
         JdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546192; x=1782150992;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=;
        b=knKwh1KZ5EsH+HdrR7hjyXbFEdINV6Y4Y+QftgX8HNWD8neDNN02Oe2zBq++UNP0Ql
         6s/OhxAmKaX1eT+D8iV1xcymRJ4UImQWZVXzdOSFCnnBiFS6R80uhsacqWOXVYU8IjUY
         G8pGrjfV+cdJuVBxAA/IplYK7BAKOsPPuhembq12V5CH9NMxxopeCwhzgRmCF9LTlKQe
         SybE5dwj5wsryG84GpSL5EcZj1l2QVRad+nVK2PMAXZrfaxpsc0A22bIpEi5Meoo5xwK
         Gdgr/MCZ5G3spzx7P/6fCd6jRfgzgDhWGkQeREaQGXgvEPaDmaEP5iExfnYBJLTMIwcW
         epug==
X-Forwarded-Encrypted: i=1; AFNElJ+f4dUjebW7hLZf94iiVpFEbILjtLxISD0pHES27w+FpPwZ8Qrnq3T6I1DLrWRjGfp78IUh7bnf8yU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6ev0bZF2eHlqDxrgzeFcoiwMYZGB0RpfmAK9tXr9TynZ5l89
	xI5GvbUia/BRMZQVzmHXnGjzvXQNUcIE86FC6TXxnyGKee6+sM8fubhKeCVO8wu1YLEqlU7k62Y
	fP4K4
X-Gm-Gg: Acq92OFRf8l9kdtxESSDfvwJDUGgzD136NuuSC12z0JRMFKA6J05+TgE2WLWjn7X0yw
	wP3lsEdgXWMN/vZZn6TzSRxiA7sUPVuZyMKqFYX95le1L+cTQULWklk/HN3m5+bZHSwBMZ0f5xx
	A5nypnuLuLP2jwvJFvcHkxZHRvJB60bABI787HePU+uEn22XoWPXEdcwHYGSJaYX4kDrIiWKCgU
	3+RTVPrTuwR7Z/1L8UuzFNO4QJLNvfrQAchuVkihuETYSJ7wnOdszYz6umjkATGNRc06TBNFXcn
	1oN/CfENjwdplsV735BHwQ1jramH0c4b94ghv9VrMlv10Tm2H6uPipt1bODuLhNmcGnjhYRsVN9
	RAgC3oclFONnK2ahOSo+pFi4xxH0WwwCr8gJaXt26X0M5+tNN5O0UBJfzs4nD2VIDve5B/mgdF0
	yvgdCeaaY+JtqFq+Wx30q+eA==
X-Received: by 2002:a05:6000:288f:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-46077f2a62dmr16205392f8f.26.1781546192039;
        Mon, 15 Jun 2026 10:56:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5176:ebe3:853b:8fb0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f2e6a8fsm36837329f8f.37.2026.06.15.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:56:31 -0700 (PDT)
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
  linux-rtc@vger.kernel.org,  devicetree@vger.kernel.org,  =?utf-8?Q?Andr?=
 =?utf-8?Q?=C3=A9?= Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
In-Reply-To: <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 28 Mar 2026 22:41:20 +0800")
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
	<20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
	<CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 19:56:29 +0200
Message-ID: <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:junhui.liu@pigmoral.tech,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:andre.przywara@arm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6674-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pigmoral.tech,baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:from_mime,starbuckisacylon.baylibre.com:mid,pigmoral.tech:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0F0C689046

On sam. 28 mars 2026 at 22:41, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Add support for the internal CCU found in the RTC module of the Allwinner
>> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compatible
>> with older SoCs like the sun6i, the A733 introduces several new features.
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
>
>> This path reuses the same hardware mux registers as the HOSC clock.
>>
>> Additionally, this CCU provides several gate clocks for specific
>> peripherals, including SerDes, HDMI, and UFS. The driver is implemented
>> as an auxiliary driver to be bound to the sun6i-rtc driver.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---

[...]

>> +};
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
>
> If you want to do the latter, you could add a new fixed rate gated
> clock type to our library. You would fill in the rate before the
> clocks get registered. I probably wouldn't go that far. We want people
> to have correct hardware descriptions.
>
> Funnily enough Allwinner's BSP actually implements a fixed rate gate
> for the next 24M-to-32k divider clock.

What about implementing the register bellow as a read-only (and
non-cached) divider using the factors provided by Junhui ? That would be
an accurate description of the HW I think.

The oscillator gets set in DT and if the output reported past the
divider is not 32728Hz, you know you've got a problem (bad DT or HW gone
bad)

With a fixed-rate gate, you may actually end up lying about what
actually happen, if the HW does not behave as expected.

Do you prefer a fixed-rate gate still or should I try the RO divider
approach ?

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
>
>> +       { .index =3D 1, .div =3D 586 },
>> +       { .index =3D 2, .div =3D 793 },
>> +       { .index =3D 3, .div =3D 732 },
>> +};
>> +
>> +static struct ccu_mux hosc_32k_mux_clk =3D {
>> +       .enable         =3D DCXO_CTRL_DCXO_EN,
>

