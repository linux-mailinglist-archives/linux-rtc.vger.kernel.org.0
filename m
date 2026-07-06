Return-Path: <linux-rtc+bounces-6899-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oa9mHnN/S2qTSQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6899-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:12:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31770EF38
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:12:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Hbc29WBd;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6899-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6899-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F5A7312B1C9
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96B5395AC0;
	Mon,  6 Jul 2026 09:16:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEBD3BCD3E
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:16:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329411; cv=none; b=opVIE3fy726AQjxxh9VTsJYFeZEmErxug9Mu4fEzy9cVDy9w11zsAwwqU7ncfnNpQrB03pfMSEnYzFwic62vUy5dig2zJGlcomHRAKDjFtSkgglAp/72K99FbgulP5aI8A1u4qy16DsOEOTsZU2/eAOGBiMM6ofiYiR9q3ZpdD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329411; c=relaxed/simple;
	bh=n9nR8Fg+JMZq1BaP4ahqBVtAOKem/sDG6ZYm02uG/jY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f1rJasjEJoZcJyzn+op4AWJ+GChHLtgUDjGhE9hjD7O0/1FT68vvJxRKn3jX0lBFD/oG6uQ+u4LI6ajsT9ZVVsX+g0uRY92/r84TwEctaOL9xBucuJUM0ZX8FHRGQZk6v0XTPRLKqi4fA7Bd/5YmKV+qX1hEGhAOkIWUG2EI+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Hbc29WBd; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10625715e9.2
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783329400; x=1783934200; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=Hbc29WBdvuueQ+jrH04RQCa2vDi/wF8TZUS4dsp0I0yKsiNpHC1CZ8TFop+oQ/QCl1
         gCaVshiQn4VoMRK6Q2OLsy6ZyRD4qZjrQ+m5XmdE7862+88fQW/TfVWZj9hytDXBaJn7
         +hYXXZmrQFuYxmizpRyb7mU3/Hfavqdcsgp5hKHC/sFlXRSrOh7T8IWRs7sItyl6vTyD
         fnZw9VBpFZ3hE4FdOLc+PtxPyueHVLnS6sfztluk2k55ozsoFcEVkqB+gQ5G4Hu5DFlQ
         ukd3As2zfwBZ28XbApl66ZHmviIZGiO2FApESXIK3/a07mvcmnp3UYn8gF6lLmRXQ/CD
         qvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329400; x=1783934200;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=Tpju4QSAeq9SEu4rwJkCAGhYZWCbNBLdh71fcjAP6IP7CTV2CS32vCI+su8XDunrZh
         8DpdsLCoCYYi6MMKbIJ4ldcGd6gara5YjOSkv9+MGj4gfIS2lD1SNqRPbZ3GrfVccXIm
         uHYX9NyT3vZdkZiYB+VNgPIIrQAiYftegJCGzg4WX+hnUeDd87jPYXFcOzoIn29fYH/b
         z+rJ2HdNEdWHoqwIXpb7WrmmNwbpXhqq30lVx+YeLGlz4clda6DlSZciTogUpRawOQcW
         v/TCN9AAZr83eh0BHt+wwYih0TNd2WEzNapd5rjfKx60k2wF4vmPXhnTkMj6/x/7dHIR
         iRVg==
X-Forwarded-Encrypted: i=1; AHgh+RocMK67To53eAIym4HJTlXnVoKB8xJLru2VeKZBKSVtSrqagb6IuSBAtfeeyOitsRUWS+gIqmhFtbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4AkWuyvHIEHawiuEPwbxkftc2yuC6kULeGFIBro1xAwNg0cW
	UL1Y+qF7hl28hR+0uo43zZuPY3UOaIPVDBJEEHg+al9Ive3UacUGPFu3Z2341vav3yQ=
X-Gm-Gg: AfdE7clki7x9A3d5xo6RYA/EI78K4QOaPfAzkNXBfMYkHrZ3FxIJzxNfCuSm/gs6sDG
	s81n94w1rKbcdqdVc1OHnPtDyQAxy8zDuuARQUMd52Zmg8Ugs+ex/7r9Opn95gdvr7nNk/8hm70
	BXcIzOx1CA2qIXgvJkZOHUIuGvqTe2Ua9TiEtJjyAcT/c58vVFXfLoPt9+OgKu6VXD0mNmQ9/B5
	CHaboXG+dNHL1AeU/P4eCnF+jXqiUIDH+E2zxFoLwXGDkSwg0UoE54RiVvWn6Cxs5sYiwUOaBYu
	/qkA49/CIOZRPvfIqKKQLQrelXao6trodLe40bbZd8gCke6qw5GEHA+ATEMWg/PHT9+i+btPpqa
	rV2xIWyhs3NG81XpojHXV7zcBZLL9TneB4hZUHu4FSdUofN8CyccCx1PVwSE5rjFw1EwhX7MmIw
	Xddu0nRqvN9XY=
X-Received: by 2002:a05:600c:3551:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493d11fb8a4mr101976925e9.35.1783329399663;
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6381e4fsm412373525e9.8.2026.07.06.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
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
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 4 Jul 2026 16:25:07 +0800")
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
	<20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
	<CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 11:16:37 +0200
Message-ID: <1j1pdgiikq.fsf@starbuckisacylon.baylibre.com>
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
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6899-lists,linux-rtc=lfdr.de];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B31770EF38

On sam. 04 juil. 2026 at 16:25, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 766f27cff748..e2d6833a6d33 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>>  {
>>         return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
>
> This does not need to be exported since all the base clocks build into
> one module. And maybe it shouldn't as we probably don't want individual
> clock drivers implementing ops.

Indeed, I'll add a patch to remove the export of
ccu_mux_helper_apply_prediv() as well, for consistency. It does not
appear to used out of that module either.

>
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>

-- 
Jerome

