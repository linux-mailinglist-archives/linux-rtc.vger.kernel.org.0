Return-Path: <linux-rtc+bounces-6951-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GW0zFmpGTmodKAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6951-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 08 Jul 2026 14:45:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B09E7266C1
	for <lists+linux-rtc@lfdr.de>; Wed, 08 Jul 2026 14:45:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=c69r4ZX6;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6951-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6951-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29837308E611
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jul 2026 12:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C6944D681;
	Wed,  8 Jul 2026 12:38:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53444D021
	for <linux-rtc@vger.kernel.org>; Wed,  8 Jul 2026 12:38:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514294; cv=none; b=VpbVb1z5rtQjurTf5zEnVb1k++nXXSD3Lpvr0heJZe3M3Iyjv2N564zA/mYI56wbdL6ZHkgp1xxmkOqv7HupwOk6V+wxDKrKOSXLvgFHDqvaZ/CF3RjBN0gf90fgByRu3ghP69CtsiQ3kJQapZOLaJ7s1QPbcQHcQKWfboYvooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514294; c=relaxed/simple;
	bh=+JRPwrOZ+ypwkQ7iD5bSYPKHGljtOUaxDrIScQnpVQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RA7Ya/QCiVJ73QfNT5OFZsLaWKiJGPYKbmmzgsrPtYXH3kdBiyD3EjN2MxQu/UlrQ2u0SligmugSIVsBA6yxjWnH3d2vMGXgmiC7BACnn9DmVJ6VJ6a6PMNMDcLSJHUB/igPmWXuBJl7t4rC07sHHVmen/ySdQHnpXvh28Cawfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c69r4ZX6; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so4737165e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 08 Jul 2026 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783514290; x=1784119090; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=;
        b=c69r4ZX6TXcMbont5OsxB9wtWwMzbaxViO8iCNAp+S4ODLF2UIFTtSIZ779mybKXwz
         5HsVBhS0n0jHiEO1cbRBRCnDCQgoTv3ii7AG4zwomYSmZtnIgYo/qTjLk/n+haWReQaC
         o94M91qvvditNZTKKmEAqswp5NDf+VazLqvQio3ee4eMomsq6KxjQrBKX8QfZudREoDc
         783ztMV+4iXy283TGlF1YmjL+gAKgmNzbAX+5F2e/Ooc2aDlyQ45fEhmOLWo4XNy/YXH
         bkpNg7OZj7ui5sEFTBiQq5haoinuYNr9lZEQEEEaYxX7V3er+l/7+PP0FyLkoFndGFg4
         ibGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514290; x=1784119090;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=;
        b=LcBQzJvfDQ3a38gO8hNyJ1FLDhi8nWtGQZ8ZQ6aCneVDkEbvcUQo37ycLKdljqER0t
         O6fwyfKWZL0vnImWD9qSIevK5m1SZApSdT+7KhAjY56HaQN4ik+f8tdNdDJN+abFW6rn
         0ey7fC2IJUWAWNbeKhgyvMOONM5ox1rC3eLeSNUzv26wf+BZ2vLM/GP1jRZo6Y5tIOJO
         w8l+A6krRmzC7e8AWIQmOSkDeoYsvPeAxDxHUMhFT69+N2Y5nJTQdtKOgoXy/laKAzUx
         2GEs3/fox8gwKGlB5YN+w+OPinhc/J6DCYq8bT+aaIu9V8Os6bKb1ffav91DTPv7MiIe
         DLmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3z2X+81aNqPxWrRDeX5P1xvEatnoNA0uIKNk6ju/Lh1pBlad9WzJ1GPdF78kDkkcarvIaWYxYOR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaEfYN866F8Ike51Ypmi4ELcPq6zrQX9I4VGGKd7sQLTpmL3C6
	HJXc6OpXP/I8AwzSMJObLaGv3TQrI/zhjF/ecCxtI4VQIWau9+MN9sjM4kg64LwMrvY=
X-Gm-Gg: AfdE7cnS2uh+b1pLYyPm2LJbkbr7qG6dT0w89CfLDWELAtKv89tm0SoCJGJoO2XRyRQ
	0MBIqNX+/+HpbLO3A/DEzweHi3TnIwKseC0Eq/ZREq5Y+4Ki4RI4TYYokOStay6AUZfgNESrRYk
	Rin3NCFmtBVtw2VkSwzsf5xw7X9KDwdWaLA6SHvx/mJU1ssGtJWlkUJqGxKjoVGpcgHI2KcDoj2
	krQZXgqeFY56wyQgmUymvhp34XN/n0sBsfylRqom1/BOMxNiMZjIoOI77azFw0I2+4IgqOv/CyC
	bM214YJIRF6VGlkVXla/oRsRQc4HndWGBsValzwuFsHA8JrUPTN1xRUmUIAoEHasQlzTkhfwo2n
	xjBw1MvS/sYaXgB8qQgnxagUtJ2h8IvAFXMV5eyOlYSS2QGF4s2+zBysiHtR6x0sbJ+59mLZTtL
	QSGiWnnrEl/Ak=
X-Received: by 2002:a05:600c:a00f:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-493e69e9902mr24247945e9.38.1783514290519;
        Wed, 08 Jul 2026 05:38:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6a8f:4433:b91b:5334])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f4fc0bsm125307795e9.10.2026.07.08.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:38:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 9/9] clk: sunxi-ng: sun6i-rtc: add a733 support
In-Reply-To: <CAGb2v67AXz=TPzNFnRMS9-vweL+6g5T57dwwYCdorwdi8HWcjA@mail.gmail.com>
	(Chen-Yu Tsai's message of "Tue, 7 Jul 2026 00:47:30 +0800")
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
	<20260706-a733-rtc-v4-9-f330728db3d3@baylibre.com>
	<CAGb2v67AXz=TPzNFnRMS9-vweL+6g5T57dwwYCdorwdi8HWcjA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 08 Jul 2026 14:38:08 +0200
Message-ID: <1jpl0xhd1r.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6951-lists,linux-rtc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B09E7266C1

On mar. 07 juil. 2026 at 00:47, Chen-Yu Tsai <wens@kernel.org> wrote:

>> +
>> +static struct ccu_div osc24M_32k_div_a733_clk = {
>> +       .enable = BIT(1),
>> +       .div    = _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table),
>> +       .common = {
>> +               .reg            = DCXO_CTRL_REG,
>> +               .hw.init        = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
>> +                                                          osc24M,
>> +                                                          &ccu_rodiv_ops,
>> +                                                          0),
>> +       },
>> +};
>> +
>> +static SUNXI_CCU_GATE(osc24M_32k_clk, "osc24M-32k", "osc24M-32k-div",
>
> I'm not a big fan of using global clock parent names, especially when we
> can have proper struct clk_hw pointer references. However in this case
> it seems unavoidable without making a huge mess.
>

Indeed there is no way around it to support different SoC path with
static data.

>> +                     LOSC_OUT_GATING_REG, BIT(16), 0);
>>
>>  static const struct clk_hw *rtc_32k_parents[] = {
>>         &osc32k_clk.common.hw,
>> @@ -267,6 +296,15 @@ static struct ccu_mux osc32k_fanout_clk = {
>>         },
>>  };

[...]

>>  };
>>  MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
>> @@ -375,6 +435,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>>         osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
>>         osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
>>
>> +       if (data->have_dcxo_status)
>> +               sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
>> +                       &osc24M_32k_div_a733_clk.common.hw;
>> +
>> +       if (!data->have_phy_ref_gates)
>> +               sun6i_rtc_ccu_hw_clks.num = CLK_OSC24M_32K_DIV + 1;
>
> Maybe keep the old CLK_NUMBER macro and call the new one CLK_NUMBER_A733?
> The point is to not directly use a random macro + 1 here.

Are you sure you about this ? You are going to end up with this
CLK_NUMBER_A733 in the table which is going to be odd (unless I put an
explanation next it) then this CLK_NUMBER without any suffix put next to
clock gate things

The choice I made initially was meant to keep thing as clear as possible
* CLK_NUMBER remains the number of clock in the table
* CLK_OSC24M_32K_DIV + 1 (while not very nice) clearly show which is the
  last clock in that case. It is not random IMO.

If you still prefer the suggestion above, I'll submit v5 with it but it
look odd to me.

>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
>> +
>>         return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
>>  }
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> index ab7b92b47f59..4f4f4cb00f1d 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> @@ -11,6 +11,6 @@
>>  #define CLK_RTC_32K            6
>>  #define CLK_OSC24M_32K_DIV     7
>>
>> -#define CLK_NUMBER             (CLK_OSC24M_32K_DIV + 1)
>> +#define CLK_NUMBER             (CLK_HOSC_SERDES1 + 1)
>>
>>  #endif /* _CCU_SUN6I_RTC_H */
>>
>> --
>> 2.47.3
>>

-- 
Jerome

